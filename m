Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0A7C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:04:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB8322473
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB8322473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2uMDUULljZmwf2PiBYRQ1pLY8W/8byDagFUj/PiYqc0=; b=PJX5/ZTEFJn8m4gii5tKuv0ZC
	jN4QYhN232Kc2K3UxcKktrCkHrEFFO8sr/sCcrte17Pg1/Z73pOIV768fbvJ3icAxfFE6xP8xXKO7
	OwcRE5Ao5i17kM/zkmJXuJi5GOnvi5Hy10TSCfs1uQCP1gDU/DKOUTaN1i0rqmMfYFCRDqXg/1cDj
	nzD0D1ReNkrBumvcRYL2E66z3IBVU7cQehQQM3SjN32Ql6/AUwTnd41lr/39N2r7GQEOwZj1m95PK
	UJue3maiO++wzwx0GoEVNWxUvVvWZPa8lC+2rlS35Vw5gHFzruNT5ZXjcdHAU/B34J37tshPsTkNI
	44y/wDIEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyoRK-0003XA-JJ; Mon, 11 Jan 2021 04:04:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyoRI-0003W7-72
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 04:04:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id o17so35871624lfg.4
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 20:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6q6bK74e1uGqFWykBzn1UfhFP5mb0Otk6HA48F1HwJ0=;
 b=C4nnRQ5QCFjqgRoNNA42Lz3EEKsOU+VJ6t9NqBzyosLVIRvjbrNmE4YBob6IONSS1P
 nVuss5Nr2dsMA/DsEcvIR6UdEjSW+YQe+x28wgEB3GAA+yLPLKVWGWS4CHu+h57Jnnul
 MD6MJp7vwMjnVmxSV2ZZ1ZvtETLEtzonJoVatVOfzR57Qzfvs23kG2nFwbhe304/0klQ
 GunA6HWLx8Nu+0vIpvKolH+ffK8D3p+1SrEYTqS0XQ0aSI/iyy/unSGAEHMhNKoiuzdD
 x+ZhvBSWXJ/J5FTrn0fCabxKEeL+BtgyIX9/ofmEBXDB4RjpSGMI0jC+UBJtnX0jyowk
 sPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6q6bK74e1uGqFWykBzn1UfhFP5mb0Otk6HA48F1HwJ0=;
 b=SQVL7S4XoEnZybjo9EiFeYPTJDjtAO9Zhg0pBjKAkB7jhlG3/eb0KkJ/+PocSaiLH1
 MrOoKcCR0V4umzttCqy/R49qrK4IB8P4leTPExeWqFgbFgJDcCbCYSNz28LtphkfaBFL
 n1ny0lWR681CoHjOKPEKi4gD60tkK+hN5FsOgIfBgaaoNaXzLRi5fdy31A3Shtak5q/g
 GKjOZ74/vN01SVoaY8XqcqvqXSiqJu6hOxUhdzJmLWD2onLXO0R1gpsRghwExw4pceTH
 a1NCwH/80zMkFMdnbWZxxZ1gxnqratH/p12KUs/UBryerkh5fWpDESCO2d2QuGJtCD0Y
 g7yw==
X-Gm-Message-State: AOAM533VCX2Z+OdDRiQJuFCj0ISrS3wPRaBcdz6IxbCQVueyqZJyGkrQ
 TwCdpme/KKYUPS/kqc1MlffANWINR4+3Uc7lYPpPCA==
X-Google-Smtp-Source: ABdhPJxEWJWq6kAkGml3Vbi80k+g5JFrJYBEIDCSWA5K143y9EPCKxl2jzrEW+w0uxSJMhOjZ8BnB9QsuXQMPQYKusc=
X-Received: by 2002:a05:6512:22ca:: with SMTP id
 g10mr3298651lfu.87.1610337858451; 
 Sun, 10 Jan 2021 20:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-5-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-5-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Jan 2021 09:34:07 +0530
Message-ID: <CAAhSdy3Z1zxFdPr+dSvP6GH+1NtRw7o=JS7OnOmZnqb8LPbnRQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] RISC-V: Fix maximum allowed phsyical memory for RV32
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_230420_480077_01D113C8 
X-CRM114-Status: GOOD (  18.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 2:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Linux kernel can only map 1GB of address space for RV32 as the page offset
> is set to 0xC0000000. The current description in the Kconfig is confusing
> as it indicates that RV32 can support 2GB of physical memory. That is
> simply not true for current kernel. In future, a 2GB split support can be
> added to allow 2GB physical address space.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Just for information, Alex's also has a patch to simplify this. Refer,
"[RFC PATCH 05/12] riscv: Simplify MAXPHYSMEM config"

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

> ---
>  arch/riscv/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81b76d44725d..e9e2c1f0a690 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -137,7 +137,7 @@ config PA_BITS
>
>  config PAGE_OFFSET
>         hex
> -       default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
> +       default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>         default 0x80000000 if 64BIT && !MMU
>         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> @@ -247,10 +247,12 @@ config MODULE_SECTIONS
>
>  choice
>         prompt "Maximum Physical Memory"
> -       default MAXPHYSMEM_2GB if 32BIT
> +       default MAXPHYSMEM_1GB if 32BIT
>         default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
>         default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
>
> +       config MAXPHYSMEM_1GB
> +               bool "1GiB"
>         config MAXPHYSMEM_2GB
>                 bool "2GiB"
>         config MAXPHYSMEM_128GB
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
