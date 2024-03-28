Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FC2C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vix0O6GAjcYwrWEYrKX35xxWfga+YsG7kcM9lRKv8aA=; b=KYFTfesEp0ED2pEpOLvjA7YzGM
	3+CI/n+xbInzaVVy3tMHjnN83V3DR1qE3XsItrx2lc11nWONM5UWcISj5ZX8kSRgZLIjtTAKdDE5i
	49qo/tS2MWozmVEy1Fm87hQS0rgsA2KqYSd96Yg5WBzK4fqEbe33Sd6bgumubOCfAnqrhyGX0ye5z
	SCSOkQsI19MlXpR+XojmqE4Q/e4vjXIOezxG5BCWUljCnYVbmURigQlOoGONuxO6anzyV4Nf9N0TX
	Hr4ToZNrGFlxT2tZnY8izfvolzPwO0Cy8CWyAqOO2zbW2DRN2effrgwMJyY+2xEUAU1NUK4YObj4Y
	h5/GqIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfp8-0000000C9os-3LoA;
	Thu, 28 Mar 2024 02:49:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfol-0000000C9fv-1191
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Mar 2024 02:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9X/k4Ur7ktRAsFVEZTgADbEiXncvofPy+APEnCk0Uuc=; b=a441wffpjO9Pj1ZeV0etBZcEAD
	R8bmQLKzKlLImo0gsp+pzsDVdNpJ+Et2lDSUe5IbO5ah0RYgn1WiZ1r60y6IvgXhV9hMLA7fjzZHS
	ZabGjVrQt7t7Ng3t5LoO0OQRJetf9VpfBWxWFdasJLlkLiON17092GfNEDfSptYoKCOhiu1dCLCYE
	Pa1zaTk0+8iE8mvMCDbgXu+D/nuq6tmSEw065oDagRH9LSb3SV+EUMuMwblgoqwFr+aUW87Xn8h45
	P+/dKBfWvnDTfkNd5hGHVbbo6YC0F/xShftnb5mntHWr2jAkBYIEk1pGWf1zxRkbY5EuEtWZS7MVX
	/hQ4ZJoQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfog-00000000j5I-06fc
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:48:36 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-609fe93b5cfso8834867b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594111; x=1712198911; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9X/k4Ur7ktRAsFVEZTgADbEiXncvofPy+APEnCk0Uuc=;
        b=YsyTNoR1SbvRwaE/whv2oB0Nr8U0/62qkflG4k/oLxtNesCsX6LBt/ta0Ugm6htkg+
         FxDx/Xyy9dfk9jAMeJN6g761BjoPnlr0uFFlkZrV3okzef7c03njm6olI8J/ISLamGvn
         KqfTt9D1pC3EEycje4zBSWrfbuHGjrE70w3MdXFPH1vbXlr0zbFoIVEYVAFB3ryqER4g
         CHM9GVJT5T+Mgm1IKa4yniqH/0tTkTzqoCfbq9HFmxUbQXsTE8FpKu2UC63UBZ5M/d6O
         bYNBKkaG3dvPpe0B4IL1oG4Pin2M4nwW+bF6hA0b5cme1o6tYpfEtMmmr7aMIjZaJ4cq
         vi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594111; x=1712198911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9X/k4Ur7ktRAsFVEZTgADbEiXncvofPy+APEnCk0Uuc=;
        b=e0kG7VUsWBtlrWhwf89Sk6uBvTvD5IGOyelP+JcrYhdV87SH9lbLpMOnuo+wsYJVBQ
         6tw53vFg06La5HykFD06DIASFm5gdYKHrHL+1QvxwIAum3eut4Hi8VGeqtD4KmWXezJj
         nrEshFH5XtoClu6W26/wolM47XKwQmgr8kBGQHN/8M1VQjJrZddJ1n6wLm7u/n7hHRMm
         UhYyepTdv1Foe34PfovU4fpx5bB7djsJ0diIlTR/cN1kJCcN+GIqL/iO+uYbO0CO7XiD
         hWN4bRnRwr1NIRZymmQh/cuq5+OiaOxp+lGQKprJxgXY+wNAYD1gJ6/1Ec5+dx7CWlIG
         EQVw==
X-Forwarded-Encrypted: i=1; AJvYcCU84a8ETf/bLFAVJDIUbSbEFmZ2z+SvH8AoCuXWA9A4cHPWFk7aLQ0HDQz5eJFfvgxelUwT7Np1cYkxaGHQ8B8vIL2Fo4Zm9nrKUqmiWLmR
X-Gm-Message-State: AOJu0Yzh6gr6yncxWhUK74+3tdtAxoNVwluIVT/yvn/OmCqd4vrM28Cn
	h0bGXncNJFG/Z6hspNREofcxjmA7LVzDK9FG3SKiCyl05Om2Gba3ufo49GaJaSivYRu9EDwpsVK
	zdJSAYuaLUxH6fm/uaFgTHg==
X-Google-Smtp-Source: AGHT+IHCBcXGdwnKOw373UKcOQTGGrOXXtILBB7knODDR6g2De9IJeAdRjNIMJCvIjU14tTQdEZAyXnNc8ki3rX1vA==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:260b:b0:dc8:27e6:cde1 with
 SMTP id dw11-20020a056902260b00b00dc827e6cde1mr124693ybb.5.1711594111169;
 Wed, 27 Mar 2024 19:48:31 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:48:27 +0000
In-Reply-To: <20240314232637.2538648-3-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-3-seanjc@google.com>
Message-ID: <diqzle63kr5w.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 02/18] KVM: sefltests: Add kvm_util_types.h to hold common
 types, e.g. vm_vaddr_t
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_024834_412497_6C1A1953 
X-CRM114-Status: GOOD (  18.38  )
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

Sean Christopherson <seanjc@google.com> writes:

> Move the base types unique to KVM selftests out of kvm_util.h and into a
> new header, kvm_util_types.h.  This will allow kvm_util_arch.h, i.e. core
> arch headers, to reference common types, e.g. vm_vaddr_t and vm_paddr_t.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  | 16 +--------------
>  .../selftests/kvm/include/kvm_util_types.h    | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 15 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/kvm_util_types.h
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 95baee5142a7..acdcddf78e3f 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -21,28 +21,14 @@
>  #include <sys/ioctl.h>
>  
>  #include "kvm_util_arch.h"
> +#include "kvm_util_types.h"
>  #include "sparsebit.h"
>  
> -/*
> - * Provide a version of static_assert() that is guaranteed to have an optional
> - * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
> - * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
> - * i.e. effectively makes the message mandatory.  Many KVM selftests #define
> - * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
> - * a result, static_assert() behavior is non-deterministic and may or may not
> - * require a message depending on #include order.
> - */
> -#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
> -#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
> -
>  #define KVM_DEV_PATH "/dev/kvm"
>  #define KVM_MAX_VCPUS 512
>  
>  #define NSEC_PER_SEC 1000000000L
>  
> -typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
> -typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
> -
>  struct userspace_mem_region {
>  	struct kvm_userspace_memory_region2 region;
>  	struct sparsebit *unused_phy_pages;
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
> new file mode 100644
> index 000000000000..764491366eb9
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTEST_KVM_UTIL_TYPES_H
> +#define SELFTEST_KVM_UTIL_TYPES_H
> +
> +/*
> + * Provide a version of static_assert() that is guaranteed to have an optional
> + * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
> + * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
> + * i.e. effectively makes the message mandatory.  Many KVM selftests #define
> + * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
> + * a result, static_assert() behavior is non-deterministic and may or may not
> + * require a message depending on #include order.
> + */
> +#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
> +#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
> +
> +typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
> +typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
> +
> +#endif /* SELFTEST_KVM_UTIL_TYPES_H */
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
