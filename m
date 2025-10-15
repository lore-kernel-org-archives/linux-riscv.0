Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9208CCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asM9tsVOF4ZNmFQumdmQ6mXGExNRpo7yZ232gWhfacU=; b=PcxdGt1aF+5NGC
	ctfc/fowRNdLTUfgfF9k+rF81laHAAm8kUbNxyqOuzLt6WWAHQu6zm+oD1+Zb4NuJnpypi6LD/gNw
	O0KQrT9ON5Ajc8aPg61FwuBkU5oDnziZnC2zNvOUk6ZWp2TkD54QkTgv95NHFd2AHXL+i8n7Fuaw5
	xfPQ/zpz1+/fcmAODcZEKxc+EashPIY51D4s2m9QH+pU47qzyz7wRfGcWXRn0KdLUTFER/LLKlGaS
	O5lE9ECAIYo1WEhoNk75K8dEcZUJNF8PzVjyQNcv/e0vNl70R1kOgz0Q8aW8n0CMZkyJwLo52c8cI
	V9/Ld2ld/1uyAY7RHhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961W-00000002YLK-3zxN;
	Wed, 15 Oct 2025 18:14:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961V-00000002YHg-2ImV
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vF8qB1ggi2AgO42vY2E0TYNR0wLng1Z038sHj948ols=; b=TA/jpH+6Khi2S/QAxK0PGCbvo2
	lefhmLWrW8XzNPiWxpyylarcs/1t7AWoYm7dMtvZUw/bM8c+fkYbeXYLIp4JqPWWP5LsrNChIqZ0P
	d7G0g/KK/I3n1RjS1CLy5i3ayczxTndUdl3asqV9sSaMaOidMiQLsdwsvUnD5yGHqXqrtQcVA/Zqb
	PLZEM8WAFtb8ELMzx1gZRLyHq4wa6DaYJd85BMrACqA/QX5dgzM9oEa2vYeuSbLt0Rm6GSmBEV+FO
	QOaoDNQs7SLy2A9GWFqeBoV1i5iY8YADaTRxzZNBTdaMbYWeT0Z5CVgyVVlE4ZoxcmO8cbQcnz2U/
	39o6ix1g==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961P-00000003jc3-1Pra
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2907ba47f71so23412265ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552085; x=1761156885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF8qB1ggi2AgO42vY2E0TYNR0wLng1Z038sHj948ols=;
        b=Ax6vS6ewvrOTV3+ImEFjawhEbZdQBMmQuPK/9q60NmYqjvFhw+ttV8NaCAg2hS0+Ev
         7z6jZDEjGEmMGbRMnpW0iJ5MqBKo1QldlKk8uV1NHUyBYZqwPH0rsUUMCKgpmSD+cYqy
         fx1HFVC1Sz+XLEGEw+xmEkJYPD8L91bIfBtjfHnv7TGF7sATbA0J5AW4vgmz7v6mVgWq
         r+kIGPRMW3WtmWZo/r03VIcJg9naYnycZvmsy7rM0b+wK0qMTzdBfjAC0da1N9gHat50
         IpsR3aJL+CDRIaKEo4hby+/VhNIkB22jj3Iov3VUI7GDWnvvKd/LvslSwq5FsVktzMl2
         vcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552085; x=1761156885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF8qB1ggi2AgO42vY2E0TYNR0wLng1Z038sHj948ols=;
        b=g07ssE+LEOtmyXZdjjJ8dpCkML09ij4v/98MgsMGY/HzfAxgvEm/v+MsRVMAAxnaJ0
         0pJO1eS10jphI9yoS6ZuOihEr2YbKfRLjiyv2QuqI1xCWICPywG4mu+2TzcMPD9rvWLC
         579TfhuNTcSCR+tZ9fzRSKpLOn1xi2vFe0sCmVMURKXKp9eyxIk+Bn4+Xzus4A1MiRyK
         GiPlfEyvYBxb0JAsAEbaAwvmYbD7J1R7V4VnqMihFXdoXUHJsxb57aOpXMBejptVcMot
         TDfLkc3O6TLISug1YRnaWQ2xkKAJrlVB3d1vQUSEax1QUIQYiBaj6CWcK1h5DnszmBeq
         AIdA==
X-Forwarded-Encrypted: i=1; AJvYcCWRp1RTTE988mFpOc6jDOnYqDepkutazhKSf4hWovIat2hndJHt5tkwERha7FaCa9u2MUQqlUz4+WL37g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzliNU9env2qu2ZxRm6GFU8EELH6v5MtCKLAm2J6bcAZeeX/RCo
	2JXgFkAFm2Ang5VCaRGgUZFmGOpQBkRbskhYVrl4Cgc59PxM7bU8HbZGGRk1S4o9VV8=
X-Gm-Gg: ASbGncvtySJTXbWzCELM+A4bcRwS67HjE1ZGLWWgL+CZ8RpaPOizMT71aMGP96lyaZC
	rHSAc7KW4ErHqv1Kj2oW9fwa4YingYCTHy0GOocagGSJnf/4Czi3oZ4/3we7m6I3/hG/CIPCBSI
	8dfYWqSfX2mIWNICxX1pGRKL3ygWSCO/rVwKf4CRt84WdOX4XbgyEwIq0J5dc5ADVECpljlpvFk
	8PI7cXvnbgjsjxDujW0bo+13X6SZhYy/jxugSQKbWQ6ryh7uES9YVJHtfg160MA/tV4FW9LO/06
	O3gwJ+MBvA5ENQTK6edohdMj0Y7DUvLR4F4HdcCUdO3COa52RM9aUHBu9R9FH8FpTiV9+nBzt8G
	2EQH1CIWzqr7oAW0dUYhQD91gub13rTPZM4CGcRYqXMACtZ0PMXs=
X-Google-Smtp-Source: AGHT+IFRxaKa/T4laOB1ws3sBGOU/x0bAxdw6xsigN7K/CZNZgfgVlPeOpzGbLKmrJG+9D7I82erMA==
X-Received: by 2002:a17:903:11cf:b0:261:1521:17a8 with SMTP id d9443c01a7336-2902723b1d9mr418718815ad.16.1760552084843;
        Wed, 15 Oct 2025 11:14:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:59 -0700
Subject: [PATCH v21 27/28] riscv: Documentation for shadow stack on riscv
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-27-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_191448_711510_4A725C4F 
X-CRM114-Status: GOOD (  22.79  )
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

Adding documentation on shadow stack for user mode on riscv and kernel
interfaces exposed so that user tasks can enable it.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/arch/riscv/index.rst   |   1 +
 Documentation/arch/riscv/zicfiss.rst | 179 +++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index be7237b69682..e240eb0ceb70 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -15,6 +15,7 @@ RISC-V architecture
     vector
     cmodx
     zicfilp
+    zicfiss
 
     features
 
diff --git a/Documentation/arch/riscv/zicfiss.rst b/Documentation/arch/riscv/zicfiss.rst
new file mode 100644
index 000000000000..7fb86d5ba120
--- /dev/null
+++ b/Documentation/arch/riscv/zicfiss.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Author: Deepak Gupta <debug@rivosinc.com>
+:Date:   12 January 2024
+
+=========================================================
+Shadow stack to protect function returns on RISC-V Linux
+=========================================================
+
+This document briefly describes the interface provided to userspace by Linux
+to enable shadow stack for user mode applications on RISC-V
+
+1. Feature Overview
+--------------------
+
+Memory corruption issues usually result into crashes, however when in hands of
+an adversary and if used creatively can result into a variety security issues.
+
+One of those security issues can be code re-use attacks on program where
+adversary can use corrupt return addresses present on stack and chain them
+together to perform return oriented programming (ROP) and thus compromising
+control flow integrity (CFI) of the program.
+
+Return addresses live on stack and thus in read-write memory and thus are
+susceptible to corruption and which allows an adversary to reach any program
+counter (PC) in address space. On RISC-V ``zicfiss`` extension provides an
+alternate stack termed as shadow stack on which return addresses can be safely
+placed in prolog of the function and retrieved in epilog. ``zicfiss`` extension
+makes following changes:
+
+- PTE encodings for shadow stack virtual memory
+  An earlier reserved encoding in first stage translation i.e.
+  PTE.R=0, PTE.W=1, PTE.X=0  becomes PTE encoding for shadow stack pages.
+
+- ``sspush x1/x5`` instruction pushes (stores) ``x1/x5`` to shadow stack.
+
+- ``sspopchk x1/x5`` instruction pops (loads) from shadow stack and compares
+  with ``x1/x5`` and if un-equal, CPU raises ``software check exception`` with
+  ``*tval = 3``
+
+Compiler toolchain makes sure that function prologue have ``sspush x1/x5`` to
+save return address on shadow stack in addition to regular stack. Similarly
+function epilogs have ``ld x5, offset(x2)`` followed by ``sspopchk x5`` to
+ensure that popped value from regular stack matches with popped value from
+shadow stack.
+
+2. Shadow stack protections and linux memory manager
+-----------------------------------------------------
+
+As mentioned earlier, shadow stacks get new page table encodings and thus have
+some special properties assigned to them and instructions that operate on them
+as below:
+
+- Regular stores to shadow stack memory raises access store faults. This way
+  shadow stack memory is protected from stray inadvertent writes.
+
+- Regular loads to shadow stack memory are allowed. This allows stack trace
+  utilities or backtrace functions to read true callstack (not tampered).
+
+- Only shadow stack instructions can generate shadow stack load or shadow stack
+  store.
+
+- Shadow stack load / shadow stack store on read-only memory raises AMO/store
+  page fault. Thus both ``sspush x1/x5`` and ``sspopchk x1/x5`` will raise AMO/
+  store page fault. This simplies COW handling in kernel during fork, kernel
+  can convert shadow stack pages into read-only memory (as it does for regular
+  read-write memory) and as soon as subsequent ``sspush`` or ``sspopchk`` in
+  userspace is encountered, then kernel can perform COW.
+
+- Shadow stack load / shadow stack store on read-write, read-write-execute
+  memory raises an access fault. This is a fatal condition because shadow stack
+  should never be operating on read-write, read-write-execute memory.
+
+3. ELF and psABI
+-----------------
+
+Toolchain sets up :c:macro:`GNU_PROPERTY_RISCV_FEATURE_1_BCFI` for property
+:c:macro:`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
+
+4. Linux enabling
+------------------
+
+User space programs can have multiple shared objects loaded in its address space
+and it's a difficult task to make sure all the dependencies have been compiled
+with support of shadow stack. Thus it's left to dynamic loader to enable
+shadow stack for the program.
+
+5. prctl() enabling
+--------------------
+
+:c:macro:`PR_SET_SHADOW_STACK_STATUS` / :c:macro:`PR_GET_SHADOW_STACK_STATUS` /
+:c:macro:`PR_LOCK_SHADOW_STACK_STATUS` are three prctls added to manage shadow
+stack enabling for tasks. prctls are arch agnostic and returns -EINVAL on other
+arches.
+
+* prctl(PR_SET_SHADOW_STACK_STATUS, unsigned long arg)
+
+If arg1 :c:macro:`PR_SHADOW_STACK_ENABLE` and if CPU supports ``zicfiss`` then
+kernel will enable shadow stack for the task. Dynamic loader can issue this
+:c:macro:`prctl` once it has determined that all the objects loaded in address
+space have support for shadow stack. Additionally if there is a
+:c:macro:`dlopen` to an object which wasn't compiled with ``zicfiss``, dynamic
+loader can issue this prctl with arg1 set to 0 (i.e.
+:c:macro:`PR_SHADOW_STACK_ENABLE` being clear)
+
+* prctl(PR_GET_SHADOW_STACK_STATUS, unsigned long * arg)
+
+Returns current status of indirect branch tracking. If enabled it'll return
+:c:macro:`PR_SHADOW_STACK_ENABLE`.
+
+* prctl(PR_LOCK_SHADOW_STACK_STATUS, unsigned long arg)
+
+Locks current status of shadow stack enabling on the task. User space may want
+to run with strict security posture and wouldn't want loading of objects
+without ``zicfiss`` support in it and thus would want to disallow disabling of
+shadow stack on current task. In that case user space can use this prctl to
+lock current settings.
+
+5. violations related to returns with shadow stack enabled
+-----------------------------------------------------------
+
+Pertaining to shadow stack, CPU raises software check exception in following
+condition:
+
+- On execution of ``sspopchk x1/x5``, ``x1/x5`` didn't match top of shadow
+  stack. If mismatch happens then cpu does ``*tval = 3`` and raise software
+  check exception.
+
+Linux kernel will treat this as :c:macro:`SIGSEGV` with code =
+:c:macro:`SEGV_CPERR` and follow normal course of signal delivery.
+
+6. Shadow stack tokens
+-----------------------
+Regular stores on shadow stacks are not allowed and thus can't be tampered
+with via arbitrary stray writes due to bugs. However method of pivoting /
+switching to shadow stack is simply writing to csr ``CSR_SSP`` and that will
+change active shadow stack for the program. Instances of writes to ``CSR_SSP``
+in the address space of the program should be mostly limited to context
+switching, stack unwind, longjmp or similar mechanisms (like context switching
+of green threads) in languages like go, rust. This can be problematic because
+an attacker can use memory corruption bugs and eventually use such context
+switching routines to pivot to any shadow stack. Shadow stack tokens can help
+mitigate this problem by making sure that:
+
+- When software is switching away from a shadow stack, shadow stack pointer
+  should be saved on shadow stack itself and call it ``shadow stack token``
+
+- When software is switching to a shadow stack, it should read the
+  ``shadow stack token`` from shadow stack pointer and verify that
+  ``shadow stack token`` itself is pointer to shadow stack itself.
+
+- Once the token verification is done, software can perform the write to
+  ``CSR_SSP`` to switch shadow stack.
+
+Here software can be user mode task runtime itself which is managing various
+contexts as part of single thread. Software can be kernel as well when kernel
+has to deliver a signal to user task and must save shadow stack pointer. Kernel
+can perform similar procedure by saving a token on user shadow stack itself.
+This way whenever :c:macro:`sigreturn` happens, kernel can read the token and
+verify the token and then switch to shadow stack. Using this mechanism, kernel
+helps user task so that any corruption issue in user task is not exploited by
+adversary by arbitrarily using :c:macro:`sigreturn`. Adversary will have to
+make sure that there is a ``shadow stack token`` in addition to invoking
+:c:macro:`sigreturn`
+
+7. Signal shadow stack
+-----------------------
+Following structure has been added to sigcontext for RISC-V::
+
+    struct __sc_riscv_cfi_state {
+        unsigned long ss_ptr;
+    };
+
+As part of signal delivery, shadow stack token is saved on current shadow stack
+itself and updated pointer is saved away in :c:macro:`ss_ptr` field in
+:c:macro:`__sc_riscv_cfi_state` under :c:macro:`sigcontext`. Existing shadow
+stack allocation is used for signal delivery. During :c:macro:`sigreturn`,
+kernel will obtain :c:macro:`ss_ptr` from :c:macro:`sigcontext` and verify the
+saved token on shadow stack itself and switch shadow stack.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
