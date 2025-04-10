Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B063CC369A8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvSTZVYwkeM9YIwWlO92iL2owXB5e0x3iSDNo4arp7M=; b=XRMSholNEFXMhk
	fHEP8ULrecsijU6BPMXTtjpWXaodlaQYQvuArfPbnZn+QZ88EMMBV07tnzgVUGORNGlhOf9bNoeiv
	bd1LZflUHJXpQkffcrcVIgDNbuWCD3aDEXSPvSFSxG5puz7h0kt8DdwEg0FBfpfFnu4p+Iy7Hl/tj
	Dx8oH/dCo5WNUK08wSkUG9yJmF0IheAr3Bk0JdRv/gbKZUNCVoexiwQ2GjFBqTFLRH1ro+vfsOapz
	oxkPKHiAN7GIhNgCnMF9g8oHFBCGCBwHsdOL7Pu9ZAz/S59PrMFj9pnaZLS5ZisYUb7hzT5E/dDV6
	hEk5RTrDgYnTNgJY0A8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvD-0000000AEwJ-1iMH;
	Thu, 10 Apr 2025 11:18:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oeN-0000000A0od-2ITM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 09:56:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf861f936so973415e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744279006; x=1744883806; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PsTek2iG0P9gXerP0u/dhkc6G7oyliO6C0xZFmP/8A=;
        b=UD8jD+F6AYH+3LhY0IerfE/VkOBGqaok0V01m0RY5xV4ZosJR3pI7a/scesnBO2HuI
         LNV9we4hoYQhKaAsAIFXTTfG2IL3z8aZmmmVlvj7iyU3zx7LatlERhrZjuP1BKvpCaXS
         SLZR80R4mYHJk3dRafeICxsF78j0H0W+EOFBCSM1nwGO7+AtfuMzHOH0ZwORZGckTjKm
         4BnrLjpgh4ymmU2NHfhqKYnm41DHnvD3JzD9VVT1oGHAGQrIAonTe4z6l8RpRcj8rDLk
         doKB61LSTAHqiywJrbT9awC40eh6HSkJD4XrmIWUumX8rThOLXqTv15UuLZwQXkrN8xT
         DOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279006; x=1744883806;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PsTek2iG0P9gXerP0u/dhkc6G7oyliO6C0xZFmP/8A=;
        b=stiGrDLe8qTcoOTBRcL+atFF8nokUMUxlQOsLDaAhOXEqUdVziwZUg39Cr6n8nFxiA
         pRp4+Ra8JrcQu5jV/1swjjop4DVC6aegK3TxG1NWHOsCXU1w2urSTsVksaXa6CEmf5ys
         8NIryNdD+MKjJQ+Fg3Fg8NYxgHF0dZH9D9d1NkV/g754BrWGIJN+6h/wUYcl3aqFFtFb
         d2KzNr7t5CTMKwo4U/t7O8uOrM0j4QYNV7cg0BN0X3LBJ6YWXFZsgWHowC+6r4cC3ZE5
         h1HoYGwS9ziJRiRa5zzbGSU21NgI6UbiOeAX+cITbdkzejg3S7mEcdA9UdtE6ql/7O7e
         kegw==
X-Forwarded-Encrypted: i=1; AJvYcCXwYzmtgmkhZ0Zj55LazTDfLqkZ4F6sDPMr4AeAlP29olyuc7Dt9B1iKFn3cY8Tl4tD14Zje/Lo6d2v1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxHQIMA7+hqIcalR9agNv8RuXucW10S9BU8/o6s7tFPjFPNJFM
	jkFcT6XaUO57bZZE04YZlLBZ3fmWxu+VajElFHS/R3XaHA0M8xhB31oYwa9HpFw=
X-Gm-Gg: ASbGncsTfI2v+VzjS2ujYfsWk7thtHOYHBnXLuchLB4yF7GMCJf8ZGAPt6o2eEKpfRa
	zwiZBWGNYXbRKC3BMBzDQyRuG4jtqHzF1+1HXoq3GU3K614hUsCzzjnU2WM2Dhztt9+a4lXzJH1
	9cSNdhlrRYODkYCWqOaIJKWDRKpmBG+X4Itx29pHbBqMvubwJhye3w8/z3Yl4j6ydXAHNokMwvO
	Dq9C5u/IQrTxn6yEI3kIX7ugHcqTrzuUCPhW2Z0wfIOb4or8tVrDhCJcv8V7kTOELf8iY+ZAaqt
	NBdVQwHEOG3uitar1RFjm8uJlYb9XzEUMSol/3uKjz93zqZ7
X-Google-Smtp-Source: AGHT+IHBsekVmgMMcd9frJRGybN0tNs9jfPFgV6X7l6TgORlz7EkCuYcLx9G1wBU1KIlE1VBTkos1Q==
X-Received: by 2002:a5d:6d8a:0:b0:39b:f12c:3862 with SMTP id ffacd0b85a97d-39d87aa7badmr2003379f8f.2.1744279005675;
        Thu, 10 Apr 2025 02:56:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89362fd6sm4349691f8f.16.2025.04.10.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:56:45 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Apr 2025 11:56:44 +0200
Message-Id: <D92VAWLM8AGD.3CF1VH6NYHCYV@ventanamicro.com>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack()
 syscall
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_025647_598433_45BE9C79 
X-CRM114-Status: GOOD (  18.79  )
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

2025-03-14T14:39:29-07:00, Deepak Gupta <debug@rivosinc.com>:
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for shadow stack memory since they lead to windows
> where memory is allocated but not yet protected or stacks which are not
> properly and safely initialised. Instead a new syscall map_shadow_stack()
> has been defined which allocates and initialises a shadow stack page.
>
> This patch implements this syscall for riscv. riscv doesn't require token
> to be setup by kernel because user mode can do that by itself. However to
> provide compatibility and portability with other architectues, user mode
> can specify token set flag.

RISC-V shadow stack could use mmap() and madvise() perfectly well.
Userspace can always initialize the shadow stack properly and the shadow
stack memory is never protected from other malicious threads.

I think that the compatibility argument is reasonable.  We'd need to
modify the other syscalls to allow a write-only mapping anyway.

> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
> +{
> +	/*
> +	 * Never expect -1 on shadow stack. Expect return addresses and zero
> +	 */
> +	unsigned long swap = -1;
> +	__enable_user_access();
> +	asm goto(
> +		".option push\n"
> +		".option arch, +zicfiss\n"

Shouldn't compiler accept ssamoswap.d opcode even without zicfiss arch?

> +		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
> +		_ASM_EXTABLE(1b, %l[fault])
> +		RISCV_ACQUIRE_BARRIER

Why is the barrier here?

> +		".option pop\n"
> +		: [swap] "=r" (swap), [addr] "+A" (*addr)
> +		: [val] "r" (val)
> +		: "memory"
> +		: fault
> +		);
> +	__disable_user_access();
> +	return swap;
> +fault:
> +	__disable_user_access();
> +	return -1;

I think we should return 0 and -EFAULT.
We can ignore the swapped value, or return it through a pointer.

> +}
> +
> +static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
> +					   unsigned long token_offset, bool set_tok)
> +{
> +	int flags = MAP_ANONYMOUS | MAP_PRIVATE;

Is MAP_GROWSDOWN pointless?

> +	struct mm_struct *mm = current->mm;
> +	unsigned long populate, tok_loc = 0;
> +
> +	if (addr)
> +		flags |= MAP_FIXED_NOREPLACE;
> +
> +	mmap_write_lock(mm);
> +	addr = do_mmap(NULL, addr, size, PROT_READ, flags,

PROT_READ implies VM_READ, so won't this select PAGE_COPY in the
protection_map instead of PAGE_SHADOWSTACK?

Wouldn't avoiding VM_READ also allow us to get rid of the ugly hack in
pte_mkwrite?  (VM_WRITE would naturally select the right XWR flags.)

> +		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
> +	mmap_write_unlock(mm);
> +
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
> +{
> [...]
> +	if (addr && (addr & (PAGE_SIZE - 1)))

if (!PAGE_ALIGNED(addr))

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
