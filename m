Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E35C636C9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61601613E3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61601613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhPnebTv5Zixg6i+lXD4iCMqZzNC8oHwmYCnbrGTero=; b=sSXZvbzMi0Ltak
	FmaBkSMKHmI7CtvNrM219zeY762m/CEQuDyjEyO8EWXwrduOAGn1D+hMoBjgxezihsNsn+2uGp0CI
	crIQ7lD46LrHF8uSgQIyDitmcExfIDI9Z0ctqZztuell9e0AeEyC/VVHWplDDUMxJyFobtpwHu7fU
	jOuQT9zEfbOWytbWwyUmrzkZIGiOaQNKHbg3z+Ume5S0GfqslQ8zI/FKdY7JPYlM7vzm2PZ3s5cM7
	Dbxk4OnNKRxcfz/ogN4UvRQRua1p9rNGnEcURroy2jRsXhPxJaYYscGCv8H2DgtA1Fs14oVLiUES6
	bXHWIM3RmzZbDwIbls4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4DOn-002t85-3E; Fri, 16 Jul 2021 02:16:21 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4DOk-002t7K-5S
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 02:16:19 +0000
Received: by mail-yb1-xb35.google.com with SMTP id v189so12382555ybg.3
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 19:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PF9YaE/2qCJ+GM4+6SKwaKx8jb/P3WMvBPxycoSWXcg=;
 b=Mi2vjKgn0+Po8CnOEJQyWtQeZu/L4mrbeqomoHO2JkbgPtkTUtR2CDkpHsmihUZHYL
 NT1AtWZLKLTxO5+3dH6W74j9vue1CTcIXX9FtLTKMrI0TRz7DHHbI0H7M/WbACkusi3d
 Y5vUT881oPxD0/hM8wBIuLHHf7kBILSka5bpQxkYpS4aIDOvziz+4e0B3NtZEeFxQWGL
 rHb9lTueCHMwWTHzaMQuqP7xDCz4GrYpk00yCBk6kgxZ/4xB86D5n2Qa3AOWJwb2jHYN
 XSVcERs33oUetVR08PsgMIbcrVIU5OFbGTNXUOTHaaJDX8gOiigyD1SO3AOasA5SpV7d
 qqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PF9YaE/2qCJ+GM4+6SKwaKx8jb/P3WMvBPxycoSWXcg=;
 b=MnxY9cAGu+t/buXfO6oLc0QCcaaGdm3+do4nXq8w5Wpg6Q2G5AOK/F3iP4Mrh+UsKQ
 L5p6LrgrSTplHIw96KbM7T7ng1LEw3LlozraMT5UO4wz2tmq0HhCPx8fdVXRPtsCbPHB
 lghscYI+4LnUiNcvVUo5aFAu94oabLYdepUg9LvWxPS0TpZk61yUz9TPSrVdzUD8kbzc
 6+/1TSpEv+gB3/PWHS/FGNw9Uk8StGQLJK6YZFMe2Bnf1vMJWpnwoxgyS/5WiXWY5O0n
 VKoa7cZTKAzoZl4/MITUT39ZBA5TQv7j7nR1qgc16GryasFKAgyx9eh/Ljqsi1DsvaNw
 GfGw==
X-Gm-Message-State: AOAM531iBJ7tFP7ql4TI3URv5D/ckVQYfmiZDV2I6vzR86sPW2YRyTcP
 cyYXMtoieeER16ZsSBjefpnlpVpDbcR9014e7qg=
X-Google-Smtp-Source: ABdhPJzGpShEkG/ccS0iMJqqo0irm9p/R1hvaEoSq6NZ7Fhk14nrvxZzb+//1fGhSI4peg9Nzz79uJ/61uDNj9bnzWE=
X-Received: by 2002:a25:ac04:: with SMTP id w4mr9727770ybi.431.1626401775249; 
 Thu, 15 Jul 2021 19:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <98082e819007a0f22d7f0f82914b4d84aabdca6d.1626368678.git.geert@linux-m68k.org>
In-Reply-To: <98082e819007a0f22d7f0f82914b4d84aabdca6d.1626368678.git.geert@linux-m68k.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 10:16:03 +0800
Message-ID: <CAEUhbmVh41mD-2N19T9CxAOZquepmXybgPPi_8ApSjT3M6PG4w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: microchip: mpfs-icicle: Fix serial console
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_191618_250729_4A07959B 
X-CRM114-Status: GOOD (  18.66  )
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

On Fri, Jul 16, 2021 at 1:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
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
> ---
>  .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts     | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index ec79944065c98ef2..d75ea11ed043c1f0 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -14,8 +14,15 @@ / {
>         model = "Microchip PolarFire-SoC Icicle Kit";
>         compatible = "microchip,mpfs-icicle-kit";
>
> +       aliases {
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
> +       };
> +
>         chosen {
> -               stdout-path = &serial0;
> +               stdout-path = "serial0:115200n8";
>         };
>
>         cpus {
> --

If possible, please rebase this patch on top of
https://patchwork.kernel.org/project/linux-riscv/patch/20210702014319.1265766-2-bmeng.cn@gmail.com/

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
