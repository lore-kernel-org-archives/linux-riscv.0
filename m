Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D13AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:17:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E1B61106
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E1B61106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OXkwy6Q2gpnEjYwt8ZPHr9z7nOZ5HKlueTWLg9CI1T0=; b=bfS87s4dbI0SEMWTRMtMXUAyB
	2VDD4dMx8SX6ee9U1lraFkMKSUvZJEBgrx39nDm8cjZjiTlNUUNBNNpEQZ5uvk60r+5IclIdZ5CYa
	VxCq+S4PwCDyW3Cz7Zo1qiW/yLbUzCUOQmDeUcpUcRPwFnvKSKAqcJiryGa4G8nbEPVhwtGWqRUP6
	VRNR/d7qr/oUa1QH8wfMyP+1dVIg9pirjRAQ9dGWrkSIie+cyZXXYiix3q1LRij73tK6dyAURX5rd
	76CFsrXGVHt9VE+lcobpPAoJTcAbAoQOwmqxKadMzMN+fLH7a96LpZJ0ZrKsvzNIBytCWkB2n3+Oy
	cQBDe6T9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYFZ-003SUA-Ae; Thu, 06 May 2021 07:16:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYFM-003SRf-DX
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=Dp5soMSHrCjUpZswZvxQlzWraT5prbwHNht9WSOKHdU=; b=JEzGnKRZaGKVS86N442QYpG3aa
 bNCpSXerlzQ6JyIM7U7kTB7a1RzQdj81UfVQfLj1xX3IQ/vUB+eJnprDKUIaNOwyj9ZWWUVDJz5Ou
 Hcx8yhEBEOGu14lQkOeEPEvhdM+Vs5wcC1KegZE4nAtthYOO2tCT0MpeDRqrfIawncN5DeGQTh9d2
 PQlvP7GzpTevCDVHu71TG/o01wdlX/eP6NH+c3+XYFj8FMEefi2cp8koYfTxuKTpQKqdjLu42vMFp
 wXKEB0x0CNDPa0FkokaQeN8/dAQMq/BVSJM8UMsTd4GlvL6jFhyYuSRErU+pz87LpcWsd9di5Bf4M
 Tfqu4esA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYFD-005evO-Vr
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:16:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so2963374pju.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Dp5soMSHrCjUpZswZvxQlzWraT5prbwHNht9WSOKHdU=;
 b=UFK3IbmDg+TWOLSAgVrbm5DhgEgM4inla9cyzlq/T/wP5lRwdv+191Zfud9XfYFQra
 BXDcGXz9eX82HAu0kaQPDs4vnpXGu9B8uxEKgHFdS12DjnOPG++NF3Q1ycGRSlJVM5Pd
 Mfl3X1JjT9ftj7ARx2JqSvmGY1KJ6HbqIW4O0MQuCmeNmgIPUd7ALViS9lBsgHWwnmoK
 S579n0j5Z2pdbnnQ9zkjOc/8YhsvZNrUUrUa+n9JfU5OGo4gkciL1jQoN9PNHXy1hP7T
 foV5ljgVfDOgoFf9FlFvsioGoM4YHMBy69r3JcyQNEMLe6acZpgJ0BSWs28QLp36rWrp
 FWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Dp5soMSHrCjUpZswZvxQlzWraT5prbwHNht9WSOKHdU=;
 b=eIlwZTSuHUbpy/PnqW6kg5JT7Kl1Pz0jrly0aZVZ2SHeyTXTSKtBSr7N7ui5oIDEha
 j46tiiTRbNDK5/Q3w22HJ4hc/s3I0Q6eA19rNLgeERGtg64q9VLyECAAE8pZixJlIxDO
 zm47pfew8nYK3Sk6pQhgRh2Ds9RVBkTERH4ETGMEhuqBM4OWehUa38T5grKW0ARL/g/P
 f1ff8TJfRmU8TDE9m2rJ4wdFQQCz488gqfXJdvUpB3dBF4jOd/5ApeFgTwg4Qg+2VzEz
 mDIVx7eTKKY+eBiasuiBSTwdr5Rns7ym0p09c3eGoAEq96xrOJbK3hG5ELDDcv4lJAwv
 iumg==
X-Gm-Message-State: AOAM530r0hkUOy+W1Je/UaQ/P++Kpns6jM6b4x9tu+97+EuNaGOZZ7Ta
 y883o/EGIDQouH6JandmUeenskYaifeRmg==
X-Google-Smtp-Source: ABdhPJzXZ2rLHed9dHeg++2oXfMdblWD/tNtJgseyi7VT0TiwoVdMN6raG3OS1rGa7EyWVGVdoT5Eg==
X-Received: by 2002:a17:90a:7bc1:: with SMTP id
 d1mr3050762pjl.183.1620285383384; 
 Thu, 06 May 2021 00:16:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a7sm9807684pjm.0.2021.05.06.00.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:16:22 -0700 (PDT)
Date: Thu, 06 May 2021 00:16:22 -0700 (PDT)
X-Google-Original-Date: Thu, 06 May 2021 00:16:21 PDT (-0700)
Subject: Re: [PATCH] riscv: Consistify
 protect_kernel_linear_mapping_text_rodata() use
In-Reply-To: <b89a090317cf26bbe1caaa3cfa513a789ece1b19.1619708711.git.geert+renesas@glider.be>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 vitaly.wool@konsulko.com, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert+renesas@glider.be
Message-ID: <mhng-b16d1d5a-0ddf-4717-bde7-114e49d508e1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_001624_047390_0E2DC207 
X-CRM114-Status: GOOD (  20.66  )
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

On Thu, 29 Apr 2021 08:10:04 PDT (-0700), geert+renesas@glider.be wrote:
> The various uses of protect_kernel_linear_mapping_text_rodata() are
> not consistent:
>   - Its definition depends on "64BIT && !XIP_KERNEL",
>   - Its forward declaration depends on MMU,
>   - Its single caller depends on "STRICT_KERNEL_RWX && 64BIT && MMU &&
>     !XIP_KERNEL".
>
> Fix this by settling on the dependencies of the caller, which can be
> simplified as STRICT_KERNEL_RWX depends on "MMU && !XIP_KERNEL".
> Provide a dummy definition, as the caller is protected by
> "IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)" instead of "#ifdef
> CONFIG_STRICT_KERNEL_RWX".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Only tested on K210 (SiPeed MAIX BiT).
> ---
>  arch/riscv/include/asm/set_memory.h | 7 ++++++-
>  arch/riscv/kernel/setup.c           | 2 --
>  arch/riscv/mm/init.c                | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index a9c56776fa0e74d6..086f757e8ba3cc69 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -17,7 +17,6 @@ int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
>  void protect_kernel_text_data(void);
> -void protect_kernel_linear_mapping_text_rodata(void);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> @@ -27,6 +26,12 @@ static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>  #endif
>
> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +void protect_kernel_linear_mapping_text_rodata(void);
> +#else
> +static inline void protect_kernel_linear_mapping_text_rodata(void) {}
> +#endif
> +
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>  bool kernel_page_present(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 7b31779101f662e4..03901d3a8b027343 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -293,9 +293,7 @@ void __init setup_arch(char **cmdline_p)
>
>  	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>  		protect_kernel_text_data();
> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
>  		protect_kernel_linear_mapping_text_rodata();
> -#endif
>  	}
>
>  #ifdef CONFIG_SWIOTLB
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 3ebc0f5d2b73b42b..6cc0421a5d0ef4a3 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -646,7 +646,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  #endif
>  }
>
> -#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
>  void protect_kernel_linear_mapping_text_rodata(void)
>  {
>  	unsigned long text_start = (unsigned long)lm_alias(_start);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
