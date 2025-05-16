Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D81DC54754
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDGyaKWPTKuhZoyYDvM4utrSWUjvjioW9J6o/VgeKjQ=; b=XgK/hjIYnREeZXfjJllg8wd8m6
	U5+MlAQjZ0j1syfggwV2i0e6Z4lwrhI7L2TXWnhGAMjuyczcSn6tUyYyJrmW8FH4o4sYOhxnY/GnP
	u1vQ3rueNBCFRmqj34EAoAbWotIPXv69z62jUDyaiO85I7YfR9fWixtpmsLRwfgwbGIpXt2T3u0fA
	ozjN9JsX6qnbXVTuIqru8BqddT/OEOJJyszwZByhXzmIrZwSXrXstHCBzejQ8F0Jujp9cFQYOSpEe
	BQS/039uYreJctDGjH19gPhRyt+70O5OQXF2cs4GT2ul2O/o8eS3H0qx5mRZqniMgR3U6Vfjhmwvv
	+ctR1rEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx1y-00000003rIW-2Ap9;
	Fri, 16 May 2025 15:31:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwnH-00000003otM-1MPK
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:16:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2301ac32320so25842745ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 08:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747408574; x=1748013374; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0GNirFBXfZksDmcLkIx7giCST3II4UpjpZdHFvaex5s=;
        b=AHEVqAenD3LKar3UbSBfx/R/ckU/EpMrqUaXOgdGRWj2sKmzrSUpW1RR3ErPm1J5YP
         KQ5d4KBWE2rltPFYin59xP6gVmtSsBf2yVEa4n8/0GgPJq2EQp+w3G8TaTxB5jL88C2s
         sFFqinbeDC3sMkA9ZQ49qvXmOwwQzfdbKkADYcE6XtlQrpdTuOLxiMliIFqEy6RhFncB
         N+UsUQUhSRpz5syUDf7bHS5fMdVHFSNxeuowcTiw1QZ9UoYxOvJZgFgTvLtu5ATxzv7h
         exkguyGR9tG7Mgo5ChbYNt0Jey8f0PJSnQMSfH5b+yhXGwbhmV/XPqBwidQ08p7TaCiM
         DNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408574; x=1748013374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GNirFBXfZksDmcLkIx7giCST3II4UpjpZdHFvaex5s=;
        b=v/JNxoqceE1K66v2S/mSjG39h4tba5bxTKPoI0cCrrXAupE6BIUGUIwA7lbCwPo20p
         WDSO0tzlbJM43pTBfMELyy8tBAoBx0ePBRsibtdPPPOSrDYT+TLXhHtPmciBtGAi1kIe
         tHypg3pLFevAWw1WNCnFrYciDPXV5BogLTRakdUAsyj0KVCDIwtbYuXWrokUepVTFxt9
         wwBCJEUV2Q7+B4eOGDcL+8DsNXS/4JBhtw3elDONvYdeZaqMtyE92NuIT+fheI69Vr+c
         IATkZ705E3gUcFstrRnMzZpx/w9pqp6qeZvep4lZ5a0XzCOCK6pIgRV5LuhxR1gCHf9/
         VxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLCjsVyT5PDblMo//8dLRLFhQpMjcs8z76U0qbLi3wof9GW2eBvn4bQv1bNZU0S1hPjAAzcm0BSf/9+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTpcj8E2qIW2ehF7FWP1s9npwseHdh/Y8Ky6L+CSyg2lDds90i
	xo0/efviIxuQYXGb/hdzLpBElrDdVic2phZBRPcjBx5pLhEeYjpH6jpcmDDLw8xP6zo=
X-Gm-Gg: ASbGncuPMw/84EpBzQRTUvXfmk6vHKigBYqa+ws1kTlP4h2Yz8a9mvbVm4MX6MpvcZt
	9G6Atx5aRfea2SHOAWjgCXdFAnjx30fvw97pNyC6Dhz/gpHJYG/FA+MsSMWpQWlJHo3O1LVtIRP
	mJnODYTzoQeKgy9n8qSXyihYHfaBVfdKpQEAUyphQZDQ0ExL13HsonVOWCDFRkunP9+VDBiuTVo
	j2JKf7IcLQwv5fmVyyppXr2ix5wu0mYzfrn9xKZu6fbrcpj/Bi7kLfvBXJ2Kcmc1aO33YcMhNpC
	1yr+ZwQmCFvd/CcZYZoXkjTfxeBQejRebVVbPrHk1lOpE1AqHT+rFknQ44ke4w==
X-Google-Smtp-Source: AGHT+IHSSRQv6UaVUp1uY7YxcQ7Fp0Nkh/iVwU/C9R2BEes+S1JYlxj3SIRdl94BDLGOoJJBYixrLQ==
X-Received: by 2002:a17:903:faf:b0:224:c46:d167 with SMTP id d9443c01a7336-231d44e7049mr42573705ad.16.1747408573939;
        Fri, 16 May 2025 08:16:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0d4sm15446025ad.195.2025.05.16.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:16:13 -0700 (PDT)
Date: Fri, 16 May 2025 08:16:09 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
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
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v15 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <aCdWueNaGeru4CRW@debug.ba.rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-22-914966471885@rivosinc.com>
 <c911eead-30c4-497d-8a56-1450792b24bd@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c911eead-30c4-497d-8a56-1450792b24bd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_081615_575495_10981D05 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 15, 2025 at 09:10:08AM +0200, Alexandre Ghiti wrote:
>Hi Deepak,
>
>On 03/05/2025 01:30, Deepak Gupta wrote:
>>Kernel will have to perform shadow stack operations on user shadow stack.
>>Like during signal delivery and sigreturn, shadow stack token must be
>>created and validated respectively. Thus shadow stack access for kernel
>>must be enabled.
>>
>>In future when kernel shadow stacks are enabled for linux kernel, it must
>>be enabled as early as possible for better coverage and prevent imbalance
>>between regular stack and shadow stack. After `relocate_enable_mmu` has
>>been done, this is as early as possible it can enabled.
>>
>>Reviewed-by: Zong Li <zong.li@sifive.com>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/asm-offsets.c |  4 ++++
>>  arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
>>index f33945432f8f..7ab41f01aa17 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -514,4 +514,8 @@ void asm_offsets(void)
>>  	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
>>  	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
>>  #endif
>>+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>>+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>>+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>>+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>
>
>kernel test robot reported errors when !RV64 and !SBI, the following =

>diff fixes it:
>
>diff --git a/arch/riscv/kernel/asm-offsets.c =

>b/arch/riscv/kernel/asm-offsets.c
>index 7fc085d27ca79..3aa5f56a84e9a 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -532,8 +532,10 @@ void asm_offsets(void)
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(FREGS_A6,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 of=
fsetof(struct =

>__arch_ftrace_regs, a6));
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(FREGS_A7,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 of=
fsetof(struct =

>__arch_ftrace_regs, a7));
>=A0#endif
>+#ifdef CONFIG_RISCV_SBI
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>=A0=A0=A0=A0=A0=A0=A0 DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOC=
K);
>+#endif
>=A0}
>
>No need to resend the whole series, I'll squash it.

Thanks.
>
>Thanks,
>
>Alex
>
>
>>  }
>>diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>index 356d5397b2a2..7eae9a172351 100644
>>--- a/arch/riscv/kernel/head.S
>>+++ b/arch/riscv/kernel/head.S
>>@@ -15,6 +15,7 @@
>>  #include <asm/image.h>
>>  #include <asm/scs.h>
>>  #include <asm/xip_fixup.h>
>>+#include <asm/usercfi.h>
>>  #include "efi-header.S"
>>  __HEAD
>>@@ -164,6 +165,19 @@ secondary_start_sbi:
>>  	call relocate_enable_mmu
>>  #endif
>>  	call .Lsetup_trap_vector
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_SHADOW_STACK
>>+	li a1, 1 /* enable supervisor to access shadow stack access */
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall
>>+	beqz a0, 1f
>>+	la a1, riscv_nousercfi
>>+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
>>+	REG_S a0, (a1)
>>+1:
>>+#endif
>>  	scs_load_current
>>  	call smp_callin
>>  #endif /* CONFIG_SMP */
>>@@ -320,6 +334,19 @@ SYM_CODE_START(_start_kernel)
>>  	la tp, init_task
>>  	la sp, init_thread_union + THREAD_SIZE
>>  	addi sp, sp, -PT_SIZE_ON_STACK
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_SHADOW_STACK
>>+	li a1, 1 /* enable supervisor to access shadow stack access */
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall
>>+	beqz a0, 1f
>>+	la a1, riscv_nousercfi
>>+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
>>+	REG_S a0, (a1)
>>+1:
>>+#endif
>>  	scs_load_current
>>  #ifdef CONFIG_KASAN
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
