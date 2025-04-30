Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFCC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyPG6R5YTaBpe7yypep7wy9ireivE9jfNW3siaqf5+0=; b=YVhAkjVfGEZPFn
	CSgjxWtU3Ue1WTrRMuWafmMcvV3Haf7ACzabIExmhKNIjDyfoOY4Y6A3SIy2MLqber7Xp3NWF/Ma8
	wtU5QwSwahtG9BfSRnYGWh4eHxyCoEvRqiQD/wS51389EpNhOxrbZWxStWtaAzv+nKIsjcF/MzMEH
	5dXcom3J9nW/RAGjjpqoIw0IOAstp1x0p4xkbxj/rKPZuDfyiCOolkn29eTpwnd+Nsb+kFwXMU9th
	BnSMLNYztStVCSyJnjVaRnqXtSNRAMePOnhBTtL1VIZ8sJ3FLWBPxnLbNMsEDaYv5F3LQ9E56IYTc
	ZWlbIZ3Zr/SCgLRoMupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v9K-0000000BHcb-1JlB;
	Wed, 30 Apr 2025 00:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v9I-0000000BHaD-11Ay
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VgTX5jh6pXjtEDHfXrNgVX78ota6UPFjSNVgqZFbeUU=; b=gvyWbTEt4Hb+dpDMJm4+cUa/uf
	6NX4O9abT4UsHIL9lK/4nWHbdBtJp4koHvH0aCuX66jvT03a+oQP3W1fhgA1jdvgQprtny3SQb6Ih
	Mrq7bpgrSABNLVKMoR6e8SqUswhIQe2YAsSEHujesy9KT7gKtd3FzoYAEqdqZrGylcsMC3ofOVLYD
	iq16Mbe2fymsb4MyYIy2NCm6RHKHu0hIgET7wF9sUpgAINM2hJthudm7MkpgCpv4bljxPWvg1KhPd
	XrkxcZChzdINgI0nFz2nQaLQ9/RjLrnF5rGGAWVYWmC3FdkbJFVJzIH4c7HwQIwvZb4cr0wGlfD15
	kfVLh3og==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9v96-0000000DY8Z-2OQz
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2254e0b4b79so99469715ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972269; x=1746577069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgTX5jh6pXjtEDHfXrNgVX78ota6UPFjSNVgqZFbeUU=;
        b=lKA5k9zEIlRGWTd6WmVtTPmyeIpc0hbikMXyzHSKHvhMwcTcm9mSpwW9nPgStAXU2+
         xOYNIVYg2ME8xu8dsXVRV/CUhniF/eDVHLvybomolXj5NqnAzLGWbfvg4b7eFRppx4hM
         SQepCHbmtTLY7M69fBO32xjL5E6cpnrh+2blEmZjFAXm7nslPoa5pXcsDNk4c1XE1j4j
         /AxSALqmQH19FRTvZiAOFqJZSLNIDb0ADSVTKS6L1c7shMP+1PrDHDxfRAB4VMdZfcSZ
         cbCzNxrNnljmjtCgDEptjnZIr/tuLgBLL6Sukc67BqP86kw7ko0eTcBUgxtxXE4xfqsf
         rNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972269; x=1746577069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgTX5jh6pXjtEDHfXrNgVX78ota6UPFjSNVgqZFbeUU=;
        b=kQGzvkWGp6r2mfL7vyOkoCBQguru0Z1Lqn0T3kvc1JlSLJ6jqH5KiVFKvO2I/NoGjX
         rnEK7zF7T3V8c9L043XU0G57y6qjKpOvIVz40mLUrah3afxnic1o3iZQOlDVIOcxdgKm
         AVSOq1PsH+PRRToKRAft0K+MDskWgtSc6WnO7dXxUP+O+0cIGY5gv9BN83DMtHG/TRww
         64/+fxD6Lo4MDCaLftLMPhu7vQpewAHNQxFj5EC6DaUfpmjO8x5qCJz5P43zNmD+hBRr
         zYCAhy9DzzgdK6F5U11Gdh/xBH4ekDlKyVYrMZ7oMBg6YMXX+WK5L2E3IFLaHZ6Yu+1q
         eAcA==
X-Forwarded-Encrypted: i=1; AJvYcCVOPqX6Fs4kwFDq04M8RHzk0vPTIgz8qGCWvuXTq+IDFV0WC7YKEiB6J0y1gVrBefN0poKzRfVQG6us3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1tmbXZpOnYIrlfIAXlBFV4O8Tk7dMiItBHT+eBLVOQGhTmW69
	v+ew+E1IF1fuGH4P8QwJrEA3fvljgkjPvzAwEU48wiqbhT+lwo94rNIDEwwk3cU=
X-Gm-Gg: ASbGncvTljisDQIgU1QptkQEOzOX2cYih+tKBOPk0iydFDWuLL+W18k0sRPAuyQheG3
	1MdlepQY5pHJM89x/Rp96nM6rKZou4w26HrV/9QBSDc4TI3csMWczK1k66gvlBdJDJBUEjvqsCM
	1WgrbxKJLlPlhEkxZuvJv57RF655V0zR0ai9AOmas8y8gnRIFgXRTGrJH5fdYP/1JSY/TlvCm2+
	TxKAZuuMQYQNtMEM7kBebCQQr+s9/waTM4dT8BTjlOIIYvxXyg0kNmiUwZC3gzme1YCBwZK9miQ
	zlKJApOvlEUVgLbH99qsDh5M7wkaaLk5Yka8zjSSuom6k5NkZ1A=
X-Google-Smtp-Source: AGHT+IGa8vS8uKwTI9Nr6bnOyy7vihtQT6bMlUTwxhIcF5vUQRVtBRqCW4ybYh7YVtedVV6Zap7MLw==
X-Received: by 2002:a17:902:e946:b0:22d:b2c9:7fd7 with SMTP id d9443c01a7336-22df34d9375mr19894915ad.21.1745972268970;
        Tue, 29 Apr 2025 17:17:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:48 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:43 -0700
Subject: [PATCH v14 26/27] riscv: Documentation for shadow stack on riscv
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-26-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250430_011757_646586_3952E515 
X-CRM114-Status: GOOD (  24.24  )
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
index 000000000000..b50089e6a52b
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
+* prctl(PR_GET_SHADOW_STACK_STATUS, unsigned long *arg)
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
+Linux kernel will treat this as :c:macro:`SIGSEV`` with code =
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
