Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C76C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577C2610CE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 577C2610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pF4O9LRDx2rWRMZ97TDWaNbPp085RzBbizcV+hMQbME=; b=gi9aOE/ZEJ0EksuIrg+mgiNExy
	ER+X2VbdzkSGOS7Q5VXmPWk2gJOgBHCkkwIyZEvxfHBznkpYcm1lecvhYbktpfwceQE9yQStCRNN7
	N+2Ncqv0fghLdnw/6vddnpN/ZNnqxOA9vCw5ZwJEsQUJfbD3puvy1/oFEvdaj445ZQ5Enu4QWZWqX
	tvAYXNyAw4e7SEm3BN7rJCoz0m06WvomQa2Wtb+1MjNlFEgzLOX3EhWHNGXmFU9SqQ1kSL5fJPC4J
	iTdB1MuBtJtsq2+nbR3kwzb/kihhk+Di90WSBGtuQoRNl8rn8TE/MKLUW0vvoHsVcCnsNCZW5HhC2
	KYmWO6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOwye-00EPbf-EE; Sat, 11 Sep 2021 06:59:04 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOwyc-00EPaz-33
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 06:59:03 +0000
Received: by mail-pg1-x530.google.com with SMTP id w8so3982257pgf.5
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DUBJU7imupbVf409oJ+vjv9zLbluzIoKndW7p7g+EnU=;
 b=MbK84QsJwW//DlP3+v3lRq0qG4g0GE1ZnU9HNVD7uNBzLvDZ/JZ3Jf4cfpw7sfvM0c
 gJPRBHldojjHF6we5SEvlwPVkwgjhIaD4VsHi0Ykz6vQv61ZIAL6EagWAN6F3x3Gq9vl
 tRn5392NySWjypP0WtmVzdY3QApDfymZp0+5cC3WB422QN5OxVWJvbhIg5hiQ0ClFKw4
 by0r7iCaibKLqWpakny1FubsFicb/u4foXtEitU7J51KlRj0D+fDZaQdqfUjF3ZEBzmi
 pkjVFRAH+bluenKLbafEkDdxawLfUAZDlvYShJ1rSoOKATYKQT1StsRJ4oHDrQfeqpHo
 rcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DUBJU7imupbVf409oJ+vjv9zLbluzIoKndW7p7g+EnU=;
 b=0IuGTs+qw0XkA6frjd8tk93sN/Hlat2SYpHhna98XvNWFU7Fwy0Qp0VLZstR1KJPr3
 lw5eMRQ3g1qHmKvjh+yqBn1sfEkfChNQiVm2K2qGdSptxvsxlHmj6YI18fFgcHw7HtB8
 5rVyLp5Wz7iDgXzEuIXVap+9U3CGIY8dbyI9WiD8v6/5oWjIT+AofVwbN+LWE9lrMejY
 9vI/wEkrXKQj3cPJ29MDnFoHpD4QTGzwNdCfjMW3PF/diHfTDdqDUMV6DQVWYuaaiat9
 m5sR3XP/dqiKKwWQaH3sGeIeYg6nGVN6XwXkh3zf0JKn/wamMX1TF4IT5GGxCo8a10rI
 VciQ==
X-Gm-Message-State: AOAM531TXJ5YVgWXForvo0AQFz3iEI3sG/fvrP8C9oiEUowkT2grZmYP
 1ihyjGmCZLO/IIaB/AImnbfUHQ==
X-Google-Smtp-Source: ABdhPJxDzR74LXT6W1FUf1DQWX4/HmJi4yZuHAQtz6Joa2Qqpkd3SW5/ySOVrU/7dVZXOeiXpUaVQg==
X-Received: by 2002:a63:215c:: with SMTP id s28mr1353795pgm.99.1631343538528; 
 Fri, 10 Sep 2021 23:58:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n14sm942402pjm.5.2021.09.10.23.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 23:58:57 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:58:57 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Sep 2021 23:58:55 PDT (-0700)
Subject: Re: [PATCH v2] riscv: dts: microchip: mpfs-icicle: Fix serial console
In-Reply-To: <01b0aaeb50a960e36077669449a854e5d4c18a83.1629983839.git.geert@linux-m68k.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, bin.meng@windriver.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, geert@linux-m68k.org, bmeng.cn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-66e34f73-6c8f-47fd-9839-8672fc1df75d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_235902_182506_0DBA8374 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 26 Aug 2021 06:19:39 PDT (-0700), geert@linux-m68k.org wrote:
> Currently, nothing is output on the serial console, unless
> "console=ttyS0,115200n8" or "earlycon" are appended to the kernel
> command line.  Enable automatic console selection using
> chosen/stdout-path by adding a proper alias, and configure the expected
> serial rate.
>
> While at it, add aliases for the other three serial ports, which are
> provided on the same micro-USB connector as the first one.
>
> Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Rebase on top of 417166ddec020c4e ("riscv: dts: microchip: Add
>     ethernet0 to the aliases node"), as requested by Bin.
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index baea7d204639a185..b254c60589a1cc8b 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -16,10 +16,14 @@ / {
>
>  	aliases {
>  		ethernet0 = &emac1;
> +		serial0 = &serial0;
> +		serial1 = &serial1;
> +		serial2 = &serial2;
> +		serial3 = &serial3;
>  	};
>
>  	chosen {
> -		stdout-path = &serial0;
> +		stdout-path = "serial0:115200n8";
>  	};
>
>  	cpus {

Thanks, this is on for-next (there's no fixes right now, it's still 5.15 
for me).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
