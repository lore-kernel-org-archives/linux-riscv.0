Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A96BC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 01:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5zqvZHtbrzNUV50bXiaXQ0dit6q6NQsd8IjGErU4w4=; b=aRWJm75CqRT0/2dmWRNPvmoTBi
	FRkrHpehUpJcxsqq9M4KbF6ymncu7nRa46oxCo0pXVjImqn0WG1UkQcOD30nlUdUidlsMO95L/5+G
	qYjBBC+xWxXuxT3vdlLo0d9T2Jtn77It0/p43+ie+dr/UG3lr5FqPAeFhhWfLJhxSz4cpgkw0zPoJ
	an1edX86d8OT/zFcoYN8mq1aJEpnrOG+/lZIi2awUfyfMOu773MO3S2+tn/altPHEzrg5HkcMjGux
	CigP6sxEGx2gULRWYPVZtMFULqy+let2t1liGCCGy2pmTomrIiAfCqy8CthXOw7CmH1mlH1LjHnBU
	Z210SsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxxR-00000003AM0-2m5Q;
	Thu, 22 Feb 2024 01:33:05 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxxO-00000003AL6-1BV1
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 01:33:03 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso997322a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 17:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708565581; x=1709170381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1/PMiHWsYAN4wzFhndBXh4DI3dHrcZRXiJQjN9iXLY=;
        b=0blH1nKDd7dqxwVl35ytN0ub5Id3cavfUUgxtYuXPjXcv4mct3PGKo+DgcmgmIwBoI
         Zlo3DJWdqcAiQ8WNHvNPSFvUjUsyZJKRIHJnQ7Agb/aT22g1vLJ+wl4r2n2BpcPQgDJX
         pzOeWnsaRaSCiTSDpTHrU6p/YosShK7FLgEn9z+yLWhMUM1xOKyoGi0xnyRIhpd1V7bK
         Ua7mmSA+LmcR+D8u76jHTwIiU+fUDQ5xj34nX5pnB92y29tOHd8IzVkHk17wL7CUkBWj
         rwy9hhvLJgboxFVcDAcf2bvlivxHaafXVjaRcFsOKlAvdecUgCUGzjDCYT9bzPiRHx2j
         Dysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708565581; x=1709170381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1/PMiHWsYAN4wzFhndBXh4DI3dHrcZRXiJQjN9iXLY=;
        b=PYTSAh9ruB7li6b8f6jGc7fpHOtLe+3v+SjUQ1Q7/ujZwx/LFU8OZpwsZGSb4ckZYw
         KFj2gcS4/pYP1IgTlWs+GiF50Spfd+3PvlcvqClH9g4pWpWoP9efp8EmjFGKT/pJEel7
         cCHqy3DJmeQWMCdEAx1yHZEW8G4qcTyLA6zGr8aJedRT/Y3+eymyLKAIB5IiGE00PzWT
         dBWFjPdbBejv+PEpIDTXckltNK/GHb1+FkP0n+ySxLfkoi3pQ/dVaK4Lqmg5hhizTZ06
         Jm6V6ijr4sIHQlLDA6N4BdpHEDnMDfmC+GBkiezh7VyrLvbB+FHrh8xxfHZQ86lA8B5A
         YGpg==
X-Forwarded-Encrypted: i=1; AJvYcCWq7HU8XV9yEsxvIyXjyizQC1EFEYPlQ6Y3umL1CKGDV07Y1K508pDTVtHx7h6n3ai6C/v0Hu2PRG4MK6DC5MTtS1ZNyVNvMOfpf4rvwyu3
X-Gm-Message-State: AOJu0YzCM/GO+RYg7MztrSvd3MXm76u7MCZdnJRsCW3p5caJ/Qo/hGx5
	0ULLXmSXyXbbM9pU0H3s8rAzmriZ2GCNUlhiFbiaF/qD6yfVVN8rFw5oiSf+1nA=
X-Google-Smtp-Source: AGHT+IG0sRbKUEOwlZ17s8jdpcAQ2S3+xO2BqNa6Gjn/TJGMcrfmrjlgVTyqtDhwxmWPGy2rlyUFuw==
X-Received: by 2002:a05:6a21:394c:b0:19e:4aa7:e6ab with SMTP id ac12-20020a056a21394c00b0019e4aa7e6abmr22177735pzc.47.1708565580594;
        Wed, 21 Feb 2024 17:33:00 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170902fb4800b001db5ea825b2sm8782350plb.123.2024.02.21.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 17:32:59 -0800 (PST)
Date: Wed, 21 Feb 2024 17:32:56 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 09/28] mm: abstract shadow stack vma behind
 `arch_is_shadow_stack`
Message-ID: <ZdakSM7KcXGgOoU6@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-10-debug@rivosinc.com>
 <2f34f6aa-99fa-4545-b706-a1d50864f9e9@redhat.com>
 <ZbKVNm5ubV8yQtSE@debug.ba.rivosinc.com>
 <45d5b98c-bad8-471d-a285-47f47c5b50bb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d5b98c-bad8-471d-a285-47f47c5b50bb@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_173302_354925_6723CBC4 
X-CRM114-Status: GOOD (  16.52  )
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

On Tue, Feb 13, 2024 at 11:34:59AM +0100, David Hildenbrand wrote:
>On 25.01.24 18:07, Deepak Gupta wrote:
>>On Thu, Jan 25, 2024 at 09:18:07AM +0100, David Hildenbrand wrote:
>>>On 25.01.24 07:21, debug@rivosinc.com wrote:
>>>>From: Deepak Gupta <debug@rivosinc.com>
>>>>
>>>>x86 has used VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow
>>>>stack VMA. VM_SHADOW_STACK is thus not possible on 32bit. Some arches may
>>>>need a way to encode shadow stack on 32bit and 64bit both and they may
>>>>encode this information differently in VMAs.
>>>>
>>>>This patch changes checks of VM_SHADOW_STACK flag in generic code to call
>>>>to a function `arch_is_shadow_stack` which will return true if arch
>>>>supports shadow stack and vma is shadow stack else stub returns false.
>>>>
>>>>There was a suggestion to name it as `vma_is_shadow_stack`. I preferred to
>>>>keep `arch` prefix in there because it's each arch specific.
>>>>
>>>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>>>---
>>>>  include/linux/mm.h | 18 +++++++++++++++++-
>>>>  mm/gup.c           |  5 +++--
>>>>  mm/internal.h      |  2 +-
>>>>  3 files changed, 21 insertions(+), 4 deletions(-)
>>>>
>>>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>index dfe0e8118669..15c70fc677a3 100644
>>>>--- a/include/linux/mm.h
>>>>+++ b/include/linux/mm.h
>>>>@@ -352,6 +352,10 @@ extern unsigned int kobjsize(const void *objp);
>>>>   * for more details on the guard size.
>>>>   */
>>>>  # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
>>>>+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>>>+{
>>>>+	return (vm_flags & VM_SHADOW_STACK);
>>>>+}
>>>>  #endif
>>>>  #ifdef CONFIG_RISCV_USER_CFI
>>>>@@ -362,10 +366,22 @@ extern unsigned int kobjsize(const void *objp);
>>>>   * with VM_SHARED.
>>>>   */
>>>>  #define VM_SHADOW_STACK	VM_WRITE
>>>>+
>>>>+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>>>+{
>>>>+	return ((vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) == VM_WRITE);
>>>>+}
>>>>+
>>>
>>>Please no such hacks just to work around the 32bit vmflags limitation.
>>
>>As I said in another response. Noted.
>>And if there're no takers for 32bit on riscv (which highly likely is the case)
>>This will go away in next version of patchsets.
>
>Sorry for the (unusually for me) late reply. Simplifying to riscv64 
>sounds great.
>
>Alternatively, maybe VM_SHADOW_STACK is not even required at all on 
>riscv if we can teach all code to only stare at arch_is_shadow_stack() 
>instead.

Sorry for late reply.

I think for risc-v this can be done, if done in following way

static inline bool arch_is_shadow_stack(struct vm_flags_t vm_flags)
{
		return (vm_get_page_prot(vm_flags) == PAGE_SHADOWSTACK);
}

But doing above will require following

- Inventing a new PROT_XXX type (let's call it PROT_SHADOWSTACK) that
   is only exposed to kernel. PROT_SHADOWSTACK protection flag would allow
   `do_mmap` to do right thing and setup appropriate protection perms.
   We wouldn't want to expose this protection type to user mode (because
   `map_shadow_stack` already exists for that).
   Current patch series uses PROT_SHADOWSTACK because VM_SHADOW_STACK was
   aliased to VM_WRITE.

- As you said teach all the generic code as well to use arch_is_shadow_stack
   which might become complicated (can't say for sure)


>
>... but, just using the same VM_SHADOW_STACK will it all much cleaner. 
>Eventually, we can just stop playing arch-specific games with 
>arch_is_shadow_stack and VM_SHADOW_STACK.

Yeah for now, looks like easier thing to do.

>
>-- 
>Cheers,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
