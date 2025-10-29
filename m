Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D74CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAsPFVsPYBdrFP832dJbdfRHiTuUf2P2ywJvLa0qMn8=; b=ok2WLU/cSBPvK0
	NZjKu9Y4kMOU0h6GKv7scG1Dex+NHghqC9G/yIoJb8ySQz9RFmr8cjKCrwAN0/sz8PdMcE7CT0dvD
	/OkNByb1RB8Jrgeb3bZgxPrRnoq9Qidp5Ab7KH9SCXZHvqlbjX/GHO4j1uDYfivBrWv9FHWmYoeBp
	iSamRcv0o8/YnD8RdzaOdU5QrzMvww3T8tL5J3WhF4TfWuimU3e+rq0HEGypCZ2IrPJ2UBxhWq+9E
	1viaTalUTiZoyh+9B9Qz++5SirICCRafVxmF1DIzQ90h7zYaOt2AnP9Ctao3WZz3tGoLqtvVMGtkf
	4+VOXyLvfZSwDGCCtp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3fP-00000000pRz-2D62;
	Wed, 29 Oct 2025 10:44:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3fM-00000000pQI-1PGg
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:44:34 +0000
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8B2323F752
	for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761734668;
	bh=V0fXLNytZLyk2YPIXYe5tFjfSCJQtOqgtquMldsZjLo=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KUgcSda7v8ckgKnlwX9382aM/M4AwCpZkYN7AlgOc5zO6rVlN/29GlcpsFDoikQEq
	 KSWHEprUvHcXOCA0iGafq35f6WwmK6I5lvDQIKBOK2p/+EmyWJq3ZU0qBQls7diJgo
	 4W11pM88PXX82NoVAGdVBN4QfmAfg2V3BLFtAUG4u7pi4F+h20RlynB8QXWpzuIFFX
	 Ex+6w1eOmL+POsGJBUwyhJ/yotZLAoTdDLZ9pbTB7IbeF4ULL/njQTD/2DWNQ0Jodk
	 s2ehjJ/Q+74xg6CysG3rHSlC+Zvtl3VoyV2WV+5tp/5vJ1yicfq4R83Pn7+G/YZvDJ
	 4iSjCmNKqebQg1GjW//rFJktyCWG09kWXL1aote32Tegh88iKvHEGr9ZcG7eDRaH13
	 WoaOUIRjeYx/wit51zLcUcxiFZz3WgCOXiJswTux5zDyGKBkgM/6bW6tfmMXPhtX55
	 WUIaw5+tvHRrrJZFBOIZR/kmiVQzTEIK0UvUz33z6oRt+dye+KiY+5aWzRHfXDxSW9
	 jIg19AWcckUZo6r1Ev4YEydCMuKQ0wvIC6exOcXrro9TwGX+nogeFqgJ/6UO3gdg9f
	 ycwOcwoTsuXXtVgJyVIOqZQs5bJfc9HaJ3nZ/dR2u90FrpWlh9qEWKfkpGmTjKSjuO
	 9snxsj0fa9zIVC3LEAgWG4nw=
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-932e3a8a836so3830598241.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 03:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734667; x=1762339467;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0fXLNytZLyk2YPIXYe5tFjfSCJQtOqgtquMldsZjLo=;
        b=QlJAClzoaKyH5pww85S0UtAYs0OnM0b/LiIwQEnz2QrMDTjGwDHPwsmm8gMWGjlSTp
         t+ZX5WFd4iweFKykrx5gU9XT4dz5+nwbfumv/12CGYk3zPmYnV/E2wnC2TBFX39Lf8vy
         iWnlxo34LN//NNP6a/vXx6APuWbLLl2nevw5cubXB38Y6Ubnysr/OkkfwRzBzXyfdpjy
         E+n87K+4pVPUHx1c0hYgyeKB731GwCm1eCAWH/VuA31rWvBNI1v56q+lGtyINd7TB5Sx
         fy7P4t6v8kpTG46O7Bd5H+ripaklKEhFmC7T/Wv9RiwtPnESV2P3h8RitmvuOzCp3PuX
         9Vzw==
X-Gm-Message-State: AOJu0YyB6bWg3wp84M3TTO1py3SeG68gd1m3Lu/tA3nsT4qGHu/nycCl
	IVsbBdkKTi9g19ZwkCpVLsD2JNccFE/vKdvC+mZslISaIiSUVZ0AaiF9EKznqo960L+FEsIaSvy
	W49ynCI+wcyt6SdvsSZaq1OkbbfLFdX8ki3PNDIe8PcLX7BSPTcFp+8AsNzc1h/Pak3fpb3Fohe
	jr0DgEivebdt/CkvDtzW1QVzpqiXBvYfLGktOVT8VDJxbqXVj4OtEdM2SRc5Yz
X-Gm-Gg: ASbGnctHVWylLrMdW7JsAMSA3s2TUKiA+gmkSeuwWecuqnHPkX7kfMZVKkazJOl9gAb
	LBGX5kGyzptqAUmfaEok3L+Zkq3xGzzrfOFtq2ldSc6wvLwqv8TcV0QJduWnmFNqoio5kCeghMg
	+y0ih4LVgrg4VJyd7dXTorSUi02w5JvrNYDFup9d92QpQLO9FYGNFgJyx2fQDQvRxuFzuJp/GrG
	YXt/o5Qv6W1
X-Received: by 2002:a05:6102:dca:b0:520:a44f:3dd6 with SMTP id ada2fe7eead31-5db905b1c78mr499492137.8.1761734667212;
        Wed, 29 Oct 2025 03:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrvsaT17GcF11Y07yPaEH3PHInbBmPpeRxqjkwSa39c9aiOCgJ/LnnUPj2EbAtqZSoycaQDJmuoIVdQyPt07Q=
X-Received: by 2002:a05:6102:dca:b0:520:a44f:3dd6 with SMTP id
 ada2fe7eead31-5db905b1c78mr499483137.8.1761734666843; Wed, 29 Oct 2025
 03:44:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Oct 2025 03:44:26 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Oct 2025 03:44:26 -0700
MIME-Version: 1.0
In-Reply-To: <20251029094429.553842-2-jiangfeng@kylinos.cn>
References: <20251029094429.553842-1-jiangfeng@kylinos.cn> <20251029094429.553842-2-jiangfeng@kylinos.cn>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 29 Oct 2025 03:44:26 -0700
X-Gm-Features: AWmQ_bl7oCY_kQJcWc7-dqRtKvoOuAPTtTsC7TvWy7sH2sDNjauX7GaF92P7jqM
Message-ID: <CAJM55Z8c5fy4Gy+6JRy_p4=4sbMuGbKyNMQB4cwUdNLcFjgLEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Remove redundant judgment for the default
 build target
To: Feng Jiang <jiangfeng@kylinos.cn>, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	masahiroy@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com, 
	pjw@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_034432_779265_FF446BFC 
X-CRM114-Status: GOOD (  12.99  )
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

Quoting Feng Jiang (2025-10-29 10:44:29)
> The value of KBUILD_IMAGE is derived from $(boot-image-y),
> so there's no need for redundant checks before this.
>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  arch/riscv/Makefile | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3998d4036f15..4c6de57f65ef 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -134,21 +134,6 @@ endif
>  CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
>
>  # Default target when executing plain make
> -boot           := arch/riscv/boot
> -ifeq ($(CONFIG_XIP_KERNEL),y)
> -KBUILD_IMAGE := $(boot)/xipImage
> -else
> -ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
> -KBUILD_IMAGE := $(boot)/loader.bin
> -else
> -ifeq ($(CONFIG_EFI_ZBOOT),)
> -KBUILD_IMAGE   := $(boot)/Image.gz
> -else
> -KBUILD_IMAGE := $(boot)/vmlinuz.efi
> -endif
> -endif
> -endif
> -

I think this might be a leftover from a faulty merge. The original patchset
removed this part, so

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>  boot                                   := arch/riscv/boot
>  boot-image-y                           := Image
>  boot-image-$(CONFIG_KERNEL_BZIP2)      := Image.bz2
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
