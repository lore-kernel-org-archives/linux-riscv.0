Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0596C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 23:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvynyLV7pRKfdceeZ3Y81HW18wUOVaZlXczERZqqnpM=; b=c6nAkhO8Yfo86HozCPAn83KWA3
	tPFfD39SLKHjwwOq4cwHa5RSgl/1yW5neg21ylZUoNGZFY8oCD7g1U2+ej1+Y3t1sUzMl4jnYiiBz
	EFiWU3qTXZV3j4DXK7ZRfD8+MjPPa4vieHgt+tXcrVX8QqCdkdwY1yeejWmpT3JoTJxyPGCzS+Uwh
	ieUezI9ZCNpbd+qbCEsDlONibdFk6yhsUU0C1IfSo8xR6DTP+1/EpNqPpDu55CDkDzhyysOYMKWQC
	i9I8WsOY+BIAe2ujrXmjA+gURhFbsmWWF+BiH+BGsXHJFtkxpMZZcKmgrvd14cgUZKfGvXQ+Ou4As
	V89KdTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1S-0000000BXt6-2iVx;
	Fri, 07 Feb 2025 23:44:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1P-0000000BXrp-3ACt
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 23:44:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso5048985a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 15:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738971871; x=1739576671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFQiCNrm30AFPGwQY6ts0jjT1ZeITQwhTZXh/92SdFM=;
        b=oKQ9JvZ9vUz2KFYIyziPukwCAdsTlvaRrO2Iz57k/13CQPyDN+0+1JnPfNNm1/gMEG
         dGcQ8ZDcuaFv9P+S/n1o4/bInlnRsuTU76lSDB5OFWxKlPTsMRlOdmTLbfbAH/xlLeJf
         iUnkNQH8z89fT6u/D1nrWrosnO197EqjZ0xIvjz75R60Wdg+llHs42BDblBxXUhLpOHE
         QHGNHH9EoNII8Ts4OeckocwmRERVjdjeMwU1ReCR3X9IsA4hEHoSNV1iE3PYk7JAPYAh
         VrpkmtuLWTgHFRsaOkcqD3H4mlXRgOex1jDAEAsFANMptL5ZY0FkEDWqkO+2xpaUOSqv
         Z3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738971871; x=1739576671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFQiCNrm30AFPGwQY6ts0jjT1ZeITQwhTZXh/92SdFM=;
        b=PYGvvi8yYaCUZAxSK/B4MopufhoYbbVIb9JQm2PTVz2LsSBiPD40L0dzq1kl/h+H9x
         ZD2jFbxrqcB4/avxmE5DCIplG2/FOwgapnMjnfg/1PVE/T0Lvrkt+AIYsYS8d99weib3
         aNPCvxFmxmfwdm0gFqFIJUWyYLPoBSoU4AvD6tNoIByqfmCEIhtnmr2K+xr+SNHQMk1L
         pZdc2GAJXlm4Urv9dLL/C7PFfegYDUmh+lNYxPB8uiOt8usEFDz7TLKGjsWUoC5c+qAu
         O3MUnrcZYzMpPrAWupMqGFNN+XqHcqCBNyxXq7DhPR40InJCw6Rn5EZc5uuFsTX5X5Gk
         GF0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8boA5uNQOyKWuTXFA0CWAh8y2PorbuCYx2esvnSH3XE5CJ1YENDwOowdby9owE1/+WZiXbxakulGNqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ACNLpKqcs8ArTUCsgPnD+BfGS0xvDNYsLEsQ5Q3JEYUJZkYd
	CfXoCgcPN3zkj1rhLNol5AVC5i/j9jJt+V1Nhm0dSljNGnkqurY3m2X/gyF4mJg=
X-Gm-Gg: ASbGnctsDQVbhXT+DW/1lN8NlxmoWeGf3+aSyt0S7Rc664XRs9SF6VwoOc7c5NpRGvr
	qVOsghl0a+6ABQOlOdihNxgyxBuzeFn2Idi1M3b8tEuJFVljtxvyT3/IkyDWwh1rujgfKMDB77s
	wwPznn8F0FZfbYS7/UsRnIw9xzEXQjZqZEAgONA62Cz2PjCvScmQHAU2PKwjCg9ZyOC/bzQicPr
	lHPNYLqjJoEsAIoZt/pZ86ix/FjpXXxH10mg0CdDvVW0/ShRswRzxpRfelR8wvSUUAJReL6THmx
	shNIofehBhrU49wCrC/6PBIJcw==
X-Google-Smtp-Source: AGHT+IEu/BmgD+AgLAp2nKonkfG6/YX8d0cZZKASE/tVvqPiMWzUevWv2BoO4p6W9X0pvQWJ2zpYLw==
X-Received: by 2002:a17:90b:380e:b0:2fa:2133:bc87 with SMTP id 98e67ed59e1d1-2fa2133bf2amr8657814a91.6.1738971870845;
        Fri, 07 Feb 2025 15:44:30 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687d169sm36049505ad.202.2025.02.07.15.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:44:30 -0800 (PST)
Date: Fri, 7 Feb 2025 15:44:27 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6aa24/5M5Xdhe/A@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_154431_986342_F4E07762 
X-CRM114-Status: GOOD (  19.69  )
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

On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>On 2/5/25 02:21, Deepak Gupta wrote:
>> VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>
>I see that arm GCS uses VM_HIGH_ARCH_6.
>
>> VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
>
>And RISC-V doesn't define it at all, not even in this patchset, or did I
>miss it somewhere?
>

hmm...
Something wrong in my workflow and rebasing.
Thanks for catching this.

>> stack). In case architecture doesn't implement shadow stack, it's VM_NONE
>> Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
>> or not.
>
>This looks like an unfinished sentence. As if it was to continue with "...
>will allow us to ..." what?
>
>I'm not against a helper but this changelog is rather confusing and also
>code in arch/x86 and arch/arm64 isn't converted to the helper but testing
>VM_SHADOW_STACK still.
>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
>> ---
>>  mm/gup.c  |  2 +-
>>  mm/mmap.c |  2 +-
>>  mm/vma.h  | 10 +++++++---
>>  3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 3883b307780e..8c64f3ff34ab 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1291,7 +1291,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>>  		    !writable_file_mapping_allowed(vma, gup_flags))
>>  			return -EFAULT;
>>
>> -		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
>> +		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
>>  			if (!(gup_flags & FOLL_FORCE))
>>  				return -EFAULT;
>>  			/*
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index cda01071c7b1..7b6be4eec35d 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -648,7 +648,7 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
>>   */
>>  static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>>  {
>> -	if (vm_flags & VM_SHADOW_STACK)
>> +	if (is_shadow_stack_vma(vm_flags))
>>  		return PAGE_SIZE;
>>
>>  	return 0;
>> diff --git a/mm/vma.h b/mm/vma.h
>> index a2e8710b8c47..47482a25f5c3 100644
>> --- a/mm/vma.h
>> +++ b/mm/vma.h
>> @@ -278,7 +278,7 @@ static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
>>  }
>>
>>  /*
>> - * These three helpers classifies VMAs for virtual memory accounting.
>> + * These four helpers classifies VMAs for virtual memory accounting.
>>   */
>>
>>  /*
>> @@ -289,6 +289,11 @@ static inline bool is_exec_mapping(vm_flags_t flags)
>>  	return (flags & (VM_EXEC | VM_WRITE | VM_STACK)) == VM_EXEC;
>>  }
>>
>> +static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
>> +{
>> +	return !!(vm_flags & VM_SHADOW_STACK);
>> +}
>> +
>>  /*
>>   * Stack area (including shadow stacks)
>>   *
>> @@ -297,7 +302,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
>>   */
>>  static inline bool is_stack_mapping(vm_flags_t flags)
>>  {
>> -	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
>> +	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
>>  }
>>
>>  /*
>> @@ -308,7 +313,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
>>  	return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) == VM_WRITE;
>>  }
>>
>> -
>>  static inline void vma_iter_config(struct vma_iterator *vmi,
>>  		unsigned long index, unsigned long last)
>>  {
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
