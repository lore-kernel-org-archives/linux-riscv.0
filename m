Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85AC3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEuZvTspcCcoBe9r6vEG3lLY5VM5LCEMH8OcXjdG66A=; b=vMuTe81se+wgdq
	knYbyUr+tAXZkU5a+9Dx3XmGHggdjz1ctKJi5KO+QyJfOA861p3l72t8YBz+CiwuXkfm4Vz7/waxe
	832Fzqho/EH1/r8M6OZFMvAXnklIjmnFv9WDxvIGjXbfNf83F56jvEeOtC00Ng3soRSOhIgzCoAor
	39xfmFdUi2KVTA13b79nsBj9h4jGoutKb1UUoagoLdxFZ8MbUr5S8N+Uz6+Ue5lEjD0Eu2QcMGB1Y
	REnALDidx3WAuWqe4dtLKqknj34DhKPo2CHtP+J4aOgLp65Uavw0IKYQ613J3YV7iSYqrbbG+Eg6j
	EBm2KcJQStmEtsS47LaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25G4-00000003RUo-0k59;
	Tue, 08 Apr 2025 09:28:40 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u259N-00000003QCm-3NKq
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 09:21:47 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3fa58dc37c5so3198649b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104104; x=1744708904; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzntjn/7W/TUVu1yIL6azEufCUdgmp744dp2mHH9/5A=;
        b=greOBhaChzg0NVS6Nny2oE/kqbb/MsVyXPhfJj6sdzzXPZrQnZfIFfpAGni0CEdAjJ
         U9ogAUVYKDUgzVJ+U1r3iLAsVTV2HvuR5WPWsOYQMEiAntwS25MoeEFXYTJstnMKSfMJ
         D+3pif2bVY0tQDAdlpKXOdt8O0vWKHTVTWGxYYY5twxOKLCfsx7K3ewrhC7HZfPlmP3E
         pdZZPHDRL2CYLWRj9yFoMbFDTcIJ/b1xf0h3smwfhpjRhRj3xtHMt5pA6x3GVCN9/hUF
         T+0yRbch3PATEB1FYljofQS4AFtci07iccAvghBVX7YUmbeO6KROEMYII3kJBVydjhXQ
         xFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104104; x=1744708904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wzntjn/7W/TUVu1yIL6azEufCUdgmp744dp2mHH9/5A=;
        b=tL0Sv87MZAZJBjpajbkLo4ugOjGJ+DGi1U3cyXPECc25gr2YXdjYZN0u2cbaJlvfhN
         6HDNkjACjGB+bmqPjQ09IQux4+pPgXceN4Hs1lv0YiOy0rK0k351wue53qxEwcidSCnR
         nft6aC2v43vQ2x1/vux9d5aGtcHsp58r+LazwEgBtOPLUb6PdN7dHSd5mJ4tPMAgUy8P
         R8mMZjsdmbEJY9BZ+o+aZXWCDwD7YonjuHfNucMgEIt2r742NJBOsnP92ftt8YvHYm0G
         dRxvVjWs9cJ4jlqmGVgIVPH7IaJ7XPC9MxR31vdYqIMMYm0IinDJUk05TruP8SBBdANG
         440g==
X-Forwarded-Encrypted: i=1; AJvYcCVvWhzfm4880xvJKiNnYz7QoDRdTRDoVHJl6KPXkND7E0KngiTAeMtZOt0H/KeXZpaDxdYXwDUSVPVU7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3f50zWIpyolnavc53LRgoervsuRCE30YV21WHbp+20NItdf83
	+9KU3Dcc36lnwcodqYHdG3sekYD99AFXeLJ9p160ASOYm+2cHIPevtBGuYE9ah65RkxR28izLU5
	YSg1Ru8SNmv7dXq+LOSznm3B/Tn0=
X-Gm-Gg: ASbGnctZFeWQT8hXckAoPGwbJebZzduKGokhYttrMj8ZyJuyX7qtTkHLB0x00nQyTQw
	SzoUd9/Q87jv08bs/+YHNg2hlPVfFuEEb7x9A+oaHqajbsu7pLGZgHritxKcy9WIgHRpVOi8UX/
	JtQ0O2I6PKL8RlN1/9K8gH+mhsK5O7wodL5KjmSHsU37irz2o4PESySFHVFg==
X-Google-Smtp-Source: AGHT+IH97Pkwh1nG4fNaueAH8o5pGsvE76ZIPhgAetjxFJ5CX2nbrQLJns4NEAaTWmlQ6qIe+Pw+8Bxj2G0HpWk9KX8=
X-Received: by 2002:a05:6808:1185:b0:3f7:d442:1986 with SMTP id
 5614622812f47-40067d11723mr1748319b6e.1.1744104104404; Tue, 08 Apr 2025
 02:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250408084301.68186-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250408084301.68186-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 8 Apr 2025 17:21:08 +0800
X-Gm-Features: ATxdqUF5IRWgtHm9hj-QRVwRgetDyXHPLdYh4eqoUgr4I6hFN9twbtwwm3-H1a0
Message-ID: <CAAfSe-vx-fvqk1pxp0rCU70Wq6HHH52k9OZaCO8O+-Sw7-yGCg@mail.gmail.com>
Subject: Re: [PATCH V6 0/2] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_022145_854237_56A52461 
X-CRM114-Status: GOOD (  18.87  )
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

On Tue, 8 Apr 2025 at 16:43, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds soft dirty and userfaultfd write protect tracking
> support for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>
> This patchset applies on top of v6.15-rc1.
>
> V6:
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b [1]
>   for soft dirty and userfaultfd write protect tracking.

This should be an RFC patchset, we should be able to enable these two
features only when the extension Svrsw60t59b is valid, I will add that
check in the next version of patchset.

Thanks,
Chunyan

>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://github.com/riscv/Svrsw60t59b.git
>
> Chunyan Zhang (2):
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |   2 +
>  arch/riscv/include/asm/pgtable-bits.h |  29 ++++++
>  arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
>  3 files changed, 165 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
