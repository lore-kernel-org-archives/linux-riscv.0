Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF6DC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0766A611C8
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0766A611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdyX2e1w37kUdEtdbwjYClKeyJchesV+nQw+XON7AYw=; b=saibNK6FgA+hNB
	6OslabGu7M/lRNK2rYx3wmVNKbUnZVQxQfjwtNQzAriKHoxpNi+dhO8T7yYgQ0v5QT8rjDXvMTo0L
	TojfIqtX9YJ0ynK+bp8ZBAz6/wFfCACtROzE0XfXl+KjzQOdFc6oEMN+qNCOJaOsrpPjzEZNY4JPk
	XjTw6yT/IBUwEKPq2Z8mCurEzEzradKDxTm0ogkX/VtzYywmezAtBywRRC49UjFW0HuJr/aa0TYOU
	KsGpUeq9qXuDtt3DIljLxzfQKLwh9z5uATRLoTG1I86uZV/sgVkHyrIecBfgJGBGErbzXDfXJSoPD
	l1ccK5D9EpUUHiYpUwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYYI-003m6a-1z; Tue, 24 Aug 2021 15:41:26 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYYF-003m5h-ST
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 15:41:25 +0000
Received: by mail-ua1-f53.google.com with SMTP id g2so5563431uad.4
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 08:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpalmFczsKrzSZmLbopzpftY8pBp3iweKYlzoS1maaY=;
 b=JycIXiSJJffAgoT9lQppUQZi4q1k7jBuiHElgUpNoPNkCEeQklzfKnqm7wUb837fsJ
 x7M5QYY3fAmbJksDpHrypHgabgsl3YDoxw4CUZpoXyIVt5Y7V3ZyLw4Jl4QSCif4kIPG
 PI4RggqF1/be1eEHm9uJSRxTeAjteV5D1vbseiA9Ljz+0JG2Q1BfHuOk+iNwFchrrLXi
 iYGUPOKzxga2WZW8+998kWw3/mkCOSBjE5DUrQ1AQwjyCf9mQgL3B4UK8BMw5jU523e9
 8D6BxDX/WRIm2Wq71yMD7T0ckaCffeiCYzrpAxKEFZfOGcpExTqtqQS0d5qRFAGM7cYY
 288Q==
X-Gm-Message-State: AOAM532RjlhUDg6MgBnYkslEhJYrAtGmIldN21X/gTRNi3zSZwIfARRq
 PhQmConZLL5Zv9PoxHeos24GmPlooCHXAUMuo4s=
X-Google-Smtp-Source: ABdhPJw1io8JEw5E317P/UDRY+Xnlg5WgVCTEbkuiJg8bWOm2OF8M2PQDBox+yiYfddi4T96nWlJDH8h/bkB+7j4L5U=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr28549281vsl.9.1629819683118; 
 Tue, 24 Aug 2021 08:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210804123015.807929-1-bmeng.cn@gmail.com>
In-Reply-To: <20210804123015.807929-1-bmeng.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 17:41:11 +0200
Message-ID: <CAMuHMdV3DJTii41Q4dy9XSL2zD2rd2ND6rrMwBLNiFsJz+jP3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: microchip: Use 'local-mac-address' for
 emac1
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_084123_943718_633A6C7A 
X-CRM114-Status: GOOD (  27.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bin,

On Wed, Aug 4, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the DT spec, 'local-mac-address' is used to specify MAC address
> that was assigned to the network device, while 'mac-address' is used
> to specify the MAC address that was last used by the boot program,
> and shall be used only if the value differs from 'local-mac-address'
> property value.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: conor dooley <conor.dooley@microchip.com>

Thanks for your patch!

> ---
>
> (no changes since v1)
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 0659068b62f7..a9c558366d61 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -317,7 +317,7 @@ emac1: ethernet@20112000 {
>                         reg = <0x0 0x20112000 0x0 0x2000>;
>                         interrupt-parent = <&plic>;
>                         interrupts = <70 71 72 73>;
> -                       mac-address = [00 00 00 00 00 00];
> +                       local-mac-address = [00 00 00 00 00 00];

Is there any point in providing an all-zeros MAC address at all?
Can't it just be removed?

>                         clocks = <&clkcfg 5>, <&clkcfg 2>;
>                         status = "disabled";
>                         clock-names = "pclk", "hclk";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
