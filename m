Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59648C0219A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TQ+a8yVy3B/bxqeOdneO2JL5XTeOfgmUQ3FcZuqPaw=; b=UJzgl+tk6t9M8c
	oVsPm6j45U1tlGgFCFK5EoeoF1uAPYjaRu9weEGFx4v6az/5iUAsvu74nNyLnelrlximvPJRVW0l6
	32arCHOfJvrdi92ddVPSu6ZthMDjk0aYTu4+pznG2Nq37mpfL36ND9Z2ut4otHvZ2/xJ19iUEsqWh
	8pr89I0M5SmbuipL4ONex7wNkQQ9fauWq/4a5Dvm2SCpW/66hHZmCcKhgtBC2wTiP4Dv8FNSwJZaZ
	H+7ufyPkakK8bkWsHwx0qKPHJEqebQjw1GmFqjQJ11pFNiJnOMGRIr7nEoGL0Mxb6J+MRxwKkmfUT
	YRQ4I3QhrZbYxR3W0eIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC6-000000028bN-0YZL;
	Wed, 05 Feb 2025 02:31:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU83-0000000224k-1B7o
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tdDNQkSVTKtNTxsV0uSmAnlAiDQNW7ggaTdWphzDp8I=; b=FRgYa7NDEPeTPe6ZQReNQKtWQo
	HzRh4HsRu1Nh8sgACLjOn/yGNJWdQ7z1gv0hyBvZ+Lgsmx7Nnn0OfG9Hogz2bxzsYRXHjCywPiQqy
	QUtQiQri0D8lFF+dEOI5g48n1vH/DrMVjSdfauTBmPjypoLdPqEz9u2yA2siw4hFCGwN76u8T2pF3
	WFPkUZ25m6Axq5ZsF3skp8fqqOvZzrxKy5+wBHinG4+utM3LgsQmCAohtjhEq73+hI6y+nMn6bOHV
	dtRr37+ZugheNbhg31/xSMeLEyxVNdBFq2vEUwHY2fm4egrIldBUtFWEbbyc2623hjPY4Cbiu64P5
	Bk8/IX0Q==;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7o-0000000GU12-3AVu
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:51 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f1b2480a2so397915ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718562; x=1739323362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdDNQkSVTKtNTxsV0uSmAnlAiDQNW7ggaTdWphzDp8I=;
        b=Wh19o8GDkrWb9ce0JDrDASzx+zcjxLeQ+mzKc+NMENEhlMPmHsCRtUt8DwDAQB9PIS
         LJ7bpIdn9VwZQXPkwb0a36Na8Zw0XHOZa2MdXDTxfdvjmiug33ig4bxI5Y/rDmAPoY9m
         v6xsi+B1BeEohkF0czxmN4UbelWu3pNg0tRyWf7p6d9HbaOKLp2/Lxll93Qlr1sQhgzy
         Blvg+peVHV2XdF8ijJp6sMBxK/4/1uoU4jWO3828+SVH2lTRFExyoIQVZPytDIB6wf/R
         iO3EIai3xB2SnMXJMgCBWdLBGOGPIdASTDBrX1rGGoSePKBpOdZA2a5ClQ+GirbzqmOm
         nb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718562; x=1739323362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdDNQkSVTKtNTxsV0uSmAnlAiDQNW7ggaTdWphzDp8I=;
        b=Di/YrPAYfHjF/5fONXgicQld4dD7YUpUlnOYR7YhDiLAUf1hIKdcuihYlebFd2l/Xu
         gducHdPIy+wsrU/EI2yOkdxxb1bom17qQ+xLellycr/O+zYE36mQJ+c9iU2sIrjX4MeM
         Sql4vsvZCmmsG5Tzy63EPaMv/gc7O6o8BtbCCORZl/mF7ymrDF225Qi0oKjxmKYlNnaT
         Yp1/a/4Ii0UZjJf9NfZvszL8SG+myq4WXsYf1JfWrajhKN0Fnl9BIN/2E/qpoJv7zFGn
         w8KMkTXmWz6dLkzpriHc9zYY98Qu/v8jlTlfEubDOF21KHTiiuNT/e6vgTAwFwAkHmKR
         CCPA==
X-Forwarded-Encrypted: i=1; AJvYcCV3W3WYy6C5ZbFbqKxHTdUq2A6cJ3xlDzN8i6A5tTwirY/KGDIxMlm7KSRQHi8FqLC2gyLbu1D0Dz/kNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRRYhSkFQ+mfnb2U2Fv6Z8+hq/Nn22m+WHjTVFxY3+2/71XMwf
	0hUblV+5NIpyHuqjqI9rIf8NPwbeE2AHuywpwe45dtAvSxvR4AXBcYZcFSOFUdyxdfdF4mgTW5A
	X
X-Gm-Gg: ASbGncte2ytC1WW5JBSGpWHG42QBaOluq120sY9vm8BQZ4yUdtJd6mHHmZdP/4OyBh+
	HMrONA7JTOL+Cg/kwlg+f76RJ/1hLkfAfggVSKKPa8laT2Y0lp6KYp5758tVDJTz04vhKtcNEAn
	Jg/R6nNb4ynh+ezEu3kE/vU+sPSwk3aSWyvQLrGHdqEWTa/3vkMqhJNWLTLIA+dUqgQZ9+gQStK
	bubLbdxwvP3CYsfDy0VxmsmYfFhKWy65BM8SI3tK9ksics/mwx7EI6TELK5Iy16MDxsDQNNm83Q
	VgGZ2E0ei2RoGKAUTBm+hjOiwQ==
X-Google-Smtp-Source: AGHT+IGL7fIu4kBCNVhHF/oYTJgronEm0XH3kZauHP9nqwG/U0J2y3PAuF3fExMjCq+Sq89z969Y4g==
X-Received: by 2002:a05:6a21:2d05:b0:1e1:c0d7:7502 with SMTP id adf61e73a8af0-1ede88b872dmr1661901637.37.1738718561611;
        Tue, 04 Feb 2025 17:22:41 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:41 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:12 -0800
Subject: [PATCH v9 25/26] riscv: Documentation for shadow stack on riscv
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-25-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012249_776205_DBE1CDB5 
X-CRM114-Status: GOOD (  23.57  )
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
