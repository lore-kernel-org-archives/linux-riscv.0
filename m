Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FBEC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PxB/w33BNfBobpHcas0s/EdaWx7TjSgsPdBgdxiDsKY=; b=iOH2qos6aYZLzyN+zYqi1yZ9wJ
	v9bD1x2MeKl1bF48u6PScJKS6b7SguLNgwCq1PV1TPCVUHEcafRXPBl/Sv0K6dOP7jkuNZUP0sWkv
	LErLxBBBIPKGCGm+xuN5P4whIIFDY8qhohx+OzAbRETkI1ZIE4umWqX/NtCK2vTq75jNJEpVJ1e/c
	/5mnUFE7a4ptN2TZU634WmTv5eT5YCRCGmX+kYAVrcblyQvllYJSETnPAA/mICw9mbJ9Qz6yw3YhC
	W3NENHTUZ9sAgfkzB/lw0whLlL8hNFiEKgGuqo05EWtjAnnuNsTXL6h99rI3p0rHHoeeqqHlnU4MM
	U3FcP55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAFe-004mAv-RY; Wed, 15 Feb 2023 05:22:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAFT-004m6e-W6
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 05:22:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id g9so11831328pfo.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 21:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=fhWxOvSg47bnqh1vlUb0tg8U7zRfENd11uhGOf5Jsz/ZocWHFEI68pLXo5d9vBVXvT
         wSDFNO3/CV6QVriW/uJf7uSjBsTIo2nfhwr90ljf0Mtrv3l+ZNz03APZ/NoeYJxIi8AS
         eT1BnG6scYkTL0mRsKAhicVLLfSox5xFSJlK+m4CcZ2f/19AZeBmn0TeLDNpHHUJ+j//
         pNGe52xRL7NHFqYuRqi8NBAMhHiUAqm3krXcV9gB6lQ+ZUL8htkaq+hcUOto2vJWmQ/P
         1t61ly6hek8z31+cUX+0shb1PAvYlU/KvbO9KdB05jwbmNe1/Zq0XZpFJiImeu8sqMJC
         uFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=NmBGK+YIes8CSrmfpaMIKSHRhaNIO4yd4myOibXPyJWrqyBazfa5Cu6a+UIIBhTb9l
         BrCrzPk9RpP4O2+jP3H+V0c2mgAJI2vnGD0Xd5lYf8/A8ok3qAkpk1djgzkqhLNpokSv
         OuJp+awTSQtC29DUSpjHK3brtbtFRHkVyYy7dvsOdhNYSiZ7rsnsYB9kFctROxFZd+vl
         1L0BIU9DW5yjsH05Zld9hNLxFJG4A7BMPu/py3RuA0Gxv04vgbpxmstSOK8dJlpHkC12
         huddTlMIBJkBqueyc7IIJwZfrRDdke+TW7TFqL/Vc27423Ocx1hpnlQv04oz+JNynSoY
         6Jbw==
X-Gm-Message-State: AO0yUKUSe5BGhfK9zKyL6kPkr7FXMbeU7361gdkVZCOtA7mHIrTWWEte
	5a7OIb/jjZXRa3pLPPlxciXliQ==
X-Google-Smtp-Source: AK7set/rdrNLm8tItidqjsvagDbtl5rYMULe1MueAmQXNPzlIf4+Jxy35EVuWqAlcqe6sRrK/ndqkQ==
X-Received: by 2002:aa7:9f85:0:b0:577:272f:fdb with SMTP id z5-20020aa79f85000000b00577272f0fdbmr600755pfr.29.1676438545117;
        Tue, 14 Feb 2023 21:22:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id n14-20020aa78a4e000000b005a8d396ae27sm2788868pfa.8.2023.02.14.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 21:22:24 -0800 (PST)
Date: Tue, 14 Feb 2023 21:22:24 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 21:22:11 PST (-0800)
Subject: Re: [PATCH 13/19] arch/riscv: rename internal name __xchg to __arch_xchg
In-Reply-To: <20221222114635.1251934-14-andrzej.hajda@intel.com>
CC: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
  linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
  intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
  Arnd Bergmann <arnd@arndb.de>, rodrigo.vivi@intel.com, akpm@linux-foundation.org,
  andriy.shevchenko@linux.intel.com, peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andrzej.hajda@intel.com
Message-ID: <mhng-e75808d7-21de-4ef8-a606-b7c652a1f38e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_212232_042046_8D5A4198 
X-CRM114-Status: GOOD (  15.52  )
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

On Thu, 22 Dec 2022 03:46:29 PST (-0800), andrzej.hajda@intel.com wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  arch/riscv/include/asm/atomic.h  | 2 +-
>  arch/riscv/include/asm/cmpxchg.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 0dfe9d857a762b..bba472928b5393 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -261,7 +261,7 @@ c_t arch_atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)	\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)		\
>  {									\
> -	return __xchg(&(v->counter), n, size);				\
> +	return __arch_xchg(&(v->counter), n, size);			\
>  }									\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,	\
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 12debce235e52d..2f4726d3cfcc25 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -114,7 +114,7 @@
>  					    _x_, sizeof(*(ptr)));	\
>  })
>
> -#define __xchg(ptr, new, size)						\
> +#define __arch_xchg(ptr, new, size)					\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(new) __new = (new);					\
> @@ -143,7 +143,7 @@
>  #define arch_xchg(ptr, x)						\
>  ({									\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
> +	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
>  })
>
>  #define xchg32(ptr, x)							\

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
