Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D27CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0YUj99tYUBUQF8tsT4Rsu676SkqywmFgbPfmh2BEsw=; b=AxNGgBzPJou5mq
	DdWgPQwr1CKJE8ts6iynxFXtCMBsZAjD5odL2ZTks71oRtVE9LHqzoooOX3k82jAj8wHgf6vCXrQ/
	OZlqMmzkqTyFSBXJJM6MU3I6oaG0qkiSuA8rO3IbtM2/DV7a1g93WEW4ThSvvLplMF6k2NaDgA5qE
	QtqrYgKXgzPsKANelCa/RmwNU4IRlLUNtPyVXvR1pDxZph+/snrS3fiCNV3dUa5ZO2M+cWbSDvoLW
	lcsLZDhd+wj4PbQ5oe3KorL5o/TmDWZO3+znTl/7Oxi/ZrNvA57H+j/T/H4hrQCnCWG7JlbqI1e3y
	srPHZwWiWFFkU/jDe3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRrY-00000004zjT-2dpQ;
	Thu, 14 May 2026 08:56:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRrV-00000004zik-3UaS
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 08:56:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d73422431so5726417f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778748967; x=1779353767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3LT0hR23Ad91sR/2WKkYMfAOBkKoFQtEPupdXVlcoY=;
        b=RFB6ME6uRD+JchEAVYLg4Yl0L0jWbYFoh5lJOLYQh64hmYAAfZq7R09UW2eh3MaWtp
         N2j/SVIK0WxaeS97rTR1LT+dC7/NxCI7SIroBv+Ve7mjk7SGzAKWm+rZ7aCEaeevrger
         axMYx013oZNoVjcaMUhftRYlZEVfFLBbzmuueCMiRZWeZkwgJanhfP32XbkEi0bUkVBF
         //haoI8xN43FZudAbUVF4jftedTSWQURjUJu39N5EOJvShPRUtjfjmj9qcqnN4MJlaa1
         9sBHHTxXnfmDOROt2TRFcNu6rp9zUv3uhhv9cbqbrNPpQTrh42nsbjUcI7Q6gPzzCaTz
         1dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778748967; x=1779353767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3LT0hR23Ad91sR/2WKkYMfAOBkKoFQtEPupdXVlcoY=;
        b=CYdAW/JtveYDyGI7N1Nkn3om80OPtjo2DU1spEsDavvrmaXUbZsNIkYxLBXK+M7zGQ
         8slWJtWyY//ujJjwSHjSROUkNPVH8V6zkCrTEM0dAE3qB54gk7yHlM0iUHFx+keUC3Sz
         YFb0DKyKPezegu1FAPFYf5a6PFdnYm3TimE/8FWf6YSBlCB4fG7BFIC3zxBITjf4EMrz
         m9CNsu0tmoYuFFLdAx73RIBjHmIpRjiT7ykR+7yAB8MJFX4xGB/0dMkSBKKQNsoCuXs7
         8kh69KDaSjK/cmeBxv+6z1/guxR4XRNjMBtBXjJBcgUrdrKTOzw7AAdnU+yNLEWb2mpi
         vwGA==
X-Forwarded-Encrypted: i=1; AFNElJ+i1O9zEr5+9lZEeH8Zu1wXyDQbghId3pcqd99UTnSj5mSAO2jr+GBD9hQvovA8Drfohho/moT1SyYtZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnolAAqR6YqogrDr7P0Nytc9Su3WHsW6GQWA4JNxR3dFiN0ez2
	Z3XQnfbb6jWfwSi4B+geFJfTzyzR7OSgnjAI6l7wYz2BD5vtyBWLEMFI
X-Gm-Gg: Acq92OEUSzkMQRycB9BlzI3Qt8+hlgSeyurSCWKmm0W2/fK6P+49cP6P83ZnQhdnbpH
	B0bbrTUuD7Trpd5ZAqPKcLEGh4tgvqQzj8jypbIZEbRB9M+cgOtgozg4SXLKaSt8tRLsMFrEc6Q
	dN7UtScbONiFgI0lZ+kTSOjqFK3y+33JYVA/G38UjjJlWckqhp7QdxOcbEXRsplb9WSE8DE+Da8
	UXT2+IW5ymDDpl0s0VhYFC9QjnVketWOf7lfqIGTXZqqXBHJDI7dZzXBhK/AlXE4n+FUOMDNTGe
	nD0StHkyYtKEqBDB3hVbRCN+fnPRqrKHW3nfxpBJgUH6Ph0cZzvI2FN/ooOoF6AmG6gacIrSinn
	C3NWWouwYM4DMEUqsQXYYTVFP1UQMPF6bBllFBrIJDQNDDDCd8bwMpVB5N6wdMBEPCB5P6VIPtg
	/Wcs/3s7rCghCfk85gGYhgUSsO2g9aCMHZ2DKjWfxopAVSiHADEjdtQhK97Rcl
X-Received: by 2002:a05:6000:2dc3:b0:45b:d2ff:4d4f with SMTP id ffacd0b85a97d-45c7a8d4c68mr10226319f8f.40.1778748967200;
        Thu, 14 May 2026 01:56:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm5236440f8f.5.2026.05.14.01.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:56:06 -0700 (PDT)
Date: Thu, 14 May 2026 09:56:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
Message-ID: <20260514095605.2c7d8761@pumpkin>
In-Reply-To: <20260514075036.1432352-1-zong.li@sifive.com>
References: <20260514075036.1432352-1-zong.li@sifive.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_015609_896949_BAC6C752 
X-CRM114-Status: GOOD (  27.32  )
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

On Thu, 14 May 2026 00:50:35 -0700
Zong Li <zong.li@sifive.com> wrote:

> Follow the ARM64 GCS (Guarded Control Stack) implementation approach
> by reducing the shadow stack size allocation from min(RLIMIT_STACK, 4GB)
> to min(RLIMIT_STACK/2, 2GB). see commit '506496bcbb42 "arm64/gcs: Ensure
> that new threads have a GCS")'
> 
> Rationale:
> 
> 1. Shadow stacks only store return addresses (8 bytes per entry), not
>    local variables, function parameters, or saved registers. A 2GB
>    shadow stack is far more than sufficient for any practical
>    application, even with extremely deep recursion. Using half the size
>    maintains adequate while being more resource-efficient margin
> 
> 2. On memory-constrained systems (e.g., platforms with only 4GB of
>    physical memory, which is a common configuration), allocating 4GB
>    of virtual address space for shadow stack per process/thread can
>    lead to virtual memory allocation failures when the overcommit mode
>    is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
>    Error: "__vm_enough_memory: not enough memory for the allocation"
> 
> This reduces virtual address space consumption by 50% while maintaining
> more than adequate space for return address storage.
> 
> Additionally, add max(PAGE_SIZE, size) constraint, which covers the
> case where RLIMIT_STACK is smaller than PAGE_SIZE.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
> 
> Changed in v2:
> - Add max() in case RLIMIT_STACK is smaller than PAGE_SIZE. Suggested by
>   Paul Walmsley and Sashiko
> 
> Changed in v1:
> - Use min() instead of min_t(). Suggested by David Laight
> 
>  arch/riscv/kernel/usercfi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 6eaa0d94fdfe..0f75e8f5d0ec 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -109,15 +109,17 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
>  	task->thread_info.user_cfi_state.ufcfi_locked = lock;
>  }
>  /*
> - * If size is 0, then to be compatible with regular stack we want it to be as big as
> - * regular stack. Else PAGE_ALIGN it and return back
> + * The shadow stack only stores the return address and not any variables
> + * 2G should be more than sufficient for most applications.
>   */
>  static unsigned long calc_shstk_size(unsigned long size)
>  {
>  	if (size)
>  		return PAGE_ALIGN(size);
>  
> -	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
> +	size = PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 2, SZ_2G));

PAGE_ALIGN() already rounds up, so the only problem would be if rlimit(STACK)
were 0 or 1, I'm sure that would fail earlier (or not be allowed).

I also don't understand the rational for just /2 and the 2G upper limit.
You need 512 nested function calls to even use 4k.
That would have to be quite deep recursion.

-- David

> +
> +	return max(PAGE_SIZE, size);
>  }
>  
>  /*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
