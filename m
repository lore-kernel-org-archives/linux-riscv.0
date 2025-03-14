Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B71C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQAS0rQc+7+LbLP80ouiq9HCyR+CUsPJRwsiKGZpUEs=; b=yCYZKu6anLTXAg
	0fMRuxb5KoShhTNa+U+hDIIcGJZy3Ti5CxVyebr8twCdqGBidLLdWAmwvHi0EjRw/ybWjTOITk7B8
	N+kjZcCbbplilejCifX7IOKJDo5PlrLgAFyWrGh2WLeZbBZXnkcZUUCAHhvHNvvuU6Y/qIOaMLeMK
	TTi0EHIrl6Mwlrouecunopc/6VF9XmrjaDKp/+07ru/Zc6008UAARh/FyD67J/mKrcTA6D5iHuX99
	KsPPgrQWPPmvyhLutJpb/9xnf7VNRBd4F/MhtmsVxu3V/sZ680dp+Sykzei1wZnCEYpX0xFiBbQ3L
	dD27LjE3TQdY4lqgrgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs1-0000000FSwE-3z7r;
	Fri, 14 Mar 2025 22:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClt-0000000FLU7-1HcQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZcP/paQnVT7Rdltm9MHSxDkYfx/z6vUAqK1vSSq+KwM=; b=fUy5RXodUa8LzkY5qCCM8ytiTE
	uGNtiepjDL3Qh6xSLzkN2ZYX+ISzjzw59XnqBcLFmaNFxIubxLkfV/ApbdqLP/ICGKN1bZ+nrh4wq
	/FReN89KDSa0po5lB0QSCXb0rU6hVM3GO6j3NCUnLL6fETWlf47311QUP8gJtq6NuYleWdebqo34m
	6WXlsGj4doY2leZdKTUOJyUj9goS5rhQMiS9FqxmhQl/MzVkuf5aoePYjRMjafFuGP33ASE8ZAEDS
	ygC6rxAS1Yvj2wUFakURS2/Gjwyh0UezC5ACH2+SBilbXVRoBu7T31jrLtvD9hdVhdueEe8IdrfP8
	H6+aVosw==;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCll-00000002xNO-0Ddb
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:46 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241053582dso61497205ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988439; x=1742593239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcP/paQnVT7Rdltm9MHSxDkYfx/z6vUAqK1vSSq+KwM=;
        b=lwFAhGxkQ+CgPq02I1Z5I2FrWJA15zQJuTZZ7ycRR9KJQgp2VWxwBw3iiRo4TD2vu4
         TO5Ky5xjUyiMq3/EsuqrSBXQGRaO+DllVET/7phWO9TCj7kdAYoo77OSe52VsnBKqTmA
         eUV1ysd94A5sqj3qCHYkDeXy2NDXf++5WaMH445Dsmh90YYqkvP98VJKSlILkMOn9F3u
         ehbDAoA1KcONY82DJR0SEmvjoaU/XhplThHbYY5dVJWXM2A/j9zVony1eUoAG2jw9IZ0
         YgIacGd1oY85guaf7SkF7sv3PGz690lKyTzFXXYnDNk8J90Khy6Ueyo/8j6xXgDoA1AF
         0AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988439; x=1742593239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcP/paQnVT7Rdltm9MHSxDkYfx/z6vUAqK1vSSq+KwM=;
        b=rLwYZGJTSqPjTij8z7UhN0hIVABpK4aDGGzuRaTCSyQkYl5kQZ7Tm9pKzsX9FIiUoG
         27khnN7H5AIkenJazCDr9HJSBD8T5gh0RFIVJc1qFm2wEcjLfHrDyPnhNZ7pYSJX6zhY
         pZDF3Ivp3JkZOgD9BWYgNTHbOeyUyv3uWvdUwSUGjShZ88zdLnpgOgGwv7yPaZsdtWQW
         hqWR7dWkBsuKNwAKpuEKdRDs6/b7nl3JSzAi+tUUnFsnTd1g/39eCVM6dlsrIqheH/wT
         7fstbqAK6P9xgy9Izhuc60omKb3xO3w/plB6EUino0FXpV2FYu8pUpGQ31kUD66r4sE4
         VRuw==
X-Forwarded-Encrypted: i=1; AJvYcCXgorINq7suzYXmy3M6DT8lc9EI8w7+XBZ4X/YyzAMov+fLK5fPIEmiyzMDYeAApUCfva7raMS0objy6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU0V0ldejK/UN48eN+/5nfFw0t5yEPk0bpT2DUeSiolCLa3SvM
	q25JdfZHBH3nrPygHxgZSnxSVHU2OntNMYy+deB2isVqD6HXHhJD/11bU/P8wWA=
X-Gm-Gg: ASbGncsjDS5UjKchTGIG1UJK/Rw2ou51jyD5cneGb8wtcZMpWGuIzkBhFNLAFMDIA0U
	EBa8DybSSpaKGhwEOmHPsXDmqgiU2Eh7VPWrQaQw10O8Qv57J5VP/VXhxXibZ82cAnNFJ4GZeMR
	Cy51OwQ2bSe1DgIM4lAdZzXUp4MOlv8Vq7oIYqLo53NYfVsU1uwJOpPDYMRBWax4vZSaymwq5K0
	7maHmZlVKLrulJ+HnyfaFwCJer52GJXjfY5mnFAwHWk9D42YlLR0sabcmp4z2p95uwAWHTaut+7
	Hx6KI+lvwVHGBsqTa5VIestgI7TgWKTEQGqwSkWSUp5PF38kKGENrYw=
X-Google-Smtp-Source: AGHT+IFAr9w0NnfJekHlQM0Z291vOiYWAmpXp0eFWmQKfncujb2meKT0mbAImpm+WZ61lNPTT6Tc/g==
X-Received: by 2002:a17:902:f70c:b0:224:191d:8a79 with SMTP id d9443c01a7336-225e0ac31aamr56778535ad.27.1741988439190;
        Fri, 14 Mar 2025 14:40:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:46 -0700
Subject: [PATCH v12 27/28] riscv: Documentation for shadow stack on riscv
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-27-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214043_580673_88CC531A 
X-CRM114-Status: GOOD (  23.41  )
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
 Documentation/arch/riscv/zicfiss.rst | 176 +++++++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)

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
index 000000000000..5ba389f15b3f
--- /dev/null
+++ b/Documentation/arch/riscv/zicfiss.rst
@@ -0,0 +1,176 @@
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
+to enable shadow stack for user mode applications on RISV-V
+
+1. Feature Overview
+--------------------
+
+Memory corruption issues usually result in to crashes, however when in hands of
+an adversary and if used creatively can result into variety security issues.
+
+One of those security issues can be code re-use attacks on program where
+adversary can use corrupt return addresses present on stack and chain them
+together to perform return oriented programming (ROP) and thus compromising
+control flow integrity (CFI) of the program.
+
+Return addresses live on stack and thus in read-write memory and thus are
+susceptible to corruption and allows an adversary to reach any program counter
+(PC) in address space. On RISC-V ``zicfiss`` extension provides an alternate
+stack termed as shadow stack on which return addresses can be safely placed in
+prolog of the function and retrieved in epilog. ``zicfiss`` extension makes
+following changes:
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
+As mentioned earlier, shadow stack get new page table encodings and thus have
+some special properties assigned to them and instructions that operate on them
+as below:
+
+- Regular stores to shadow stack memory raises access store faults. This way
+  shadow stack memory is protected from stray inadvertant writes.
+
+- Regular loads to shadow stack memory are allowed. This allows stack trace
+  utilities or backtrace functions to read true callstack (not tampered).
+
+- Only shadow stack instructions can generate shadow stack load or shadow stack
+  store.
+
+- Shadow stack load / shadow stack store on read-only memory raises AMO/store
+  page fault. Thus both ``sspush x1/x5`` and ``sspopchk x1/x5`` will raise AMO/
+  store page fault. This simplies COW handling in kernel During fork, kernel
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
+with via arbitrary stray writes due to bugs. Method of pivoting / switching to
+shadow stack is simply writing to csr ``CSR_SSP`` changes active shadow stack.
+This can be problematic because usually value to be written to ``CSR_SSP`` will
+be loaded somewhere in writeable memory and thus allows an adversary to
+corruption bug in software to pivot to an any address in shadow stack range.
+Shadow stack tokens can help mitigate this problem by making sure that:
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
