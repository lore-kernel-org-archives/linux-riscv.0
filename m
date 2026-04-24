Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C05FE51F2
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnsnQyuez11/YHhw/6vPVGRSIFckFMhWvWOPE1B6C7Q=; b=IYev9VKak9EYuL
	nJfiNVdTmHPZIAsAt2dhE9E7tQlw1f/CFDiMFj/CKIjQ+q6wSYSBy5tdOdaeRPjjSkfuaiem7jJbP
	Dx6EWDXycRcdqQQhQCGHvAjIzInwOFp93p+MErlIM/Dy418nW00tiDFV8iaD2Al9WHzVE0IVWFbsa
	1XbtllQbwYZWlRrFcd9kqmu8K+NbyEQ+hyUtqvIQadJltRRjobMWIFt1a6VGw+OnMYtZ2s4MTJpvE
	2ZwcKEO5A9KgAPnXA/STRzOuPzVCVVtwiq2Wv4DvyEMkpTBba1gxdn3BuK80no6uCmk7zsuE9Kr8z
	DyDMBZLw2TE5Lf4f/lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCoF-0000000CvmX-3R1V;
	Fri, 24 Apr 2026 09:26:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCoD-0000000CvmB-30Yy
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 09:26:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-441209fb77eso2785530f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2026 02:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022807; x=1777627607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8M0nQZrfHDg73egODEGdfkVN1W5dPtLpH0g+ZjNsw8=;
        b=iySIRZWcuun7VlNKvHqmRNBEQg60EqtyU2Ehdorf0QdU0Nh3XI+Mwk4JATLUf7plX8
         OVrTn3cCdg/pVi7TRhKgHt04oxAKDrmipCAXdcJwtOFDBIDGSgK2End0xqlipiY9MdTe
         juza+/HPsa8oujmlvTCwaAbixvwgRHt8tgUhilJeN8QF1PMQxpdRBzRYp9yNJV4pAim0
         kxT/GLJsN1NULMSdT1J28zyGdnYqf2uslZAgTDT8+VuSvF755xhbetWvvdpX7DWbMsF0
         N8nWIs/qAD3QtzhHBJrmy6pQYb2W+rOvHuZCLOzvklIQd7+IR2jbZGt+MNG/gyBC2qEm
         qT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022807; x=1777627607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8M0nQZrfHDg73egODEGdfkVN1W5dPtLpH0g+ZjNsw8=;
        b=cx6ZCwkjXMqVyxTcvNgeQmcC+FOPPP82TKisHpOdR/wzvlyahI3RWkN857nsCNHpnK
         aTrsd/SHc+B2GJDtzOS0V4iKqS9TR/OokwtXcujIFRa06uPl8baHzcCDPtKvsYLa/5p7
         7LJ31qW6YNNISUE/8iIL241i67ZYCqagiqGp3mjxuDDvgfEtOaLbi8IR1Xnge1mp5CZp
         YQ844DgZwF1rGLPOChzeJN33VAGqhmc5Vd1ABfm8cwObZly+KzT0J57QS/zkrnMJ/uGR
         Sgtl4E1m8GkrAOUWl6qb4sx9MuX/uUAxnYN5eWZPw++cnsPpqY7zUKbyakg3006aF3Bs
         i7ew==
X-Forwarded-Encrypted: i=1; AFNElJ8pzHMv6Co54OqblFCkNu2ltAEoJN/0ItDm8MINvnQvDVNi6O7I/UQAqeYoWt2khF24IFnLVVkKKyrnDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPstz5Zir0n+RCnPae8wEdm3R2oHAJXzgxL8zISOudzQvouSRQ
	V60sxAPsGQRiBCqeg4S8dct7Zfh5BZpDG6QOW1XTHAtBFybSoESR6xBa
X-Gm-Gg: AeBDieuFQ7FhAi0i9ErSkwhGxcDsxeOONU61QJZprd6+Y389ctic8oSwMa+J6qpyLJn
	zE6We6lI721Eu3GE+vuGlAipiINf1vQ/I0nkseACu4d8pYYFZqrz6A46WCUmwpKPPU3vrY9eO03
	+5bX7ckjpjXFNI8kAKVPRWbQzulTDrnai5whJ//HoKGPsKAwMv0Nr74DkbBzxUl7vv8aOfiy2gE
	1PjQHLLl4N4oV+t5YUPlNmjlt8FDQpEj2UuJcRdIimz8rWuNSQ3yhgDD8yslD1gmzasHoHIYIlI
	4YLboxhXgLsSXlxs2sq+MfW0hBVg4Sn1mhMUUiiNK2HHbvB/HggDM85RgDsSUl8E1v9TzfT6YIK
	ww6k8E5q6fGK4W5hBNrizLxZISLM/9ViD259pDBkychBadxuxiyodAUHCj4CaxLSvaVXsVXOn7g
	C2cAsZvRHocw3QT1g/JAeiKpEKR5B9BBMqrRiWd3c7VWjaqzkygPGFixNaeApxPKIuYKGGXW7rv
	GA=
X-Received: by 2002:a05:6000:1866:b0:43c:f257:c706 with SMTP id ffacd0b85a97d-43fe4088c1cmr48386250f8f.23.1777022807102;
        Fri, 24 Apr 2026 02:26:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm64204586f8f.24.2026.04.24.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:26:46 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:26:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cif: reduce shadow stack size limit from 4GB to
 2GB
Message-ID: <20260424102645.14fa41cd@pumpkin>
In-Reply-To: <20260424065540.3480755-1-zong.li@sifive.com>
References: <20260424065540.3480755-1-zong.li@sifive.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_022649_800263_812D5DD4 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, 23 Apr 2026 23:55:40 -0700
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
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/usercfi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 6eaa0d94fdfe..4a48dd28d113 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -109,15 +109,16 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
>  	task->thread_info.user_cfi_state.ufcfi_locked = lock;
>  }
>  /*
> - * If size is 0, then to be compatible with regular stack we want it to be as big as
> - * regular stack. Else PAGE_ALIGN it and return back
> + * The shadow stack only stores the return address and not any variables
> + * this should be more than sufficient for most applications.
> + * Else PAGE_ALIGN it and return back
>   */
>  static unsigned long calc_shstk_size(unsigned long size)
>  {
>  	if (size)
>  		return PAGE_ALIGN(size);
>  
> -	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
> +	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK) / 2, SZ_2G));

Use min() instead of min_t().
All the values (before and after the patch) are unsigned.

	David


>  }
>  
>  /*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
