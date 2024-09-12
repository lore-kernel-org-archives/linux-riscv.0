Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894A7EEE278
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMZCkdlMx+8O+J+kfbGl7FPAxHliR0oMrpbpa/tAaRA=; b=FOL9rPBtiPZKBC
	+ogRynN42bhXL8sLT+o/TIE8nUcvtxaP9UQng30B0u75MseCFBSOT287eP3UKpXPgE6hpybADr3p8
	92oKsA3GVSw7p/r3h9c1MHEXtSDtLWsW9FBFxGrw2PcrWxw14ivIyKdmf/tOWVPqMzASwLJiVZQ7p
	FtTqL2pYU9XVtTBHdJ95vv6xMbdkxz19F2CqsyfqSacWqQQrfZtKQXjdVlolDAXHCsmf4teSJgZfq
	xuTkL0K9P9WIAwctdGRf993XSc++glt6KdA/9DWQMh/c/NABNsBi7ZMpDW83m0+OwlIFl1tNkjYH0
	9AAvBf7c9OuV/t544R8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDK-0000000EaYx-2uDu;
	Fri, 13 Sep 2024 00:31:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5s-0000000ESm5-2HsH
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dA4GtqjPLbFcczpyYhfz2PBDm+Kw3MITc0s5Cuc65RY=; b=nc/5wv7lS+knEzbsAot/yHiXNr
	G8plNeNQaBBU+CvRlWLPDs2MbFziW+YAybdY1AoEy/dqxBV+NKZxb8f9a9Ia9JHSj/r7ex5QcTPhQ
	9Uf/lOv3ZEJr1IkTpduV6aBUwZhFlz/McIxSPJ5VmqSh7IRMrNKDkdiLlj0oWfFC5HOBA21KXLVty
	sUtd/1ToQsObM4F58anNTBtm2RtbvL75h6TvK2u2YUus78wuWHI9eUiZdPUDo6GMDH/9Ll26IsRRC
	u53cQp2SXmmWHA0i2TkylDvCC0/G9fexb2t+Mj8YnA+Rfzbqz8/om5rw9Lmsw0bjHVU0gr4LZ1SIN
	NljeTibw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5o-0000000CNrJ-30kT
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:19:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d87176316eso1958428a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183153; x=1726787953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA4GtqjPLbFcczpyYhfz2PBDm+Kw3MITc0s5Cuc65RY=;
        b=hFOS0NTS8KslhRy4GOKbdcNmdj3e+X6+jSVqX1xT0wbI5QAMMaEBDmhwG9K2sSNz0D
         njaWOHwday0NKc+sN28fH454zfUvNE8mN/ok0OHfDAdgUv5rr/BVQ4scxsDnIVMSYW5G
         eYKzW5Ainm1Aa9tNvQE6TGymIFo7chVuSTRgPqqchZudmqHMxkiJbGlA+ow9hlivt0y9
         mKTGWn4dqyNpX/6kzt/i0Gyq5s/aUCbargfuTuPvpnLWntJygF0PwAGBYq1Vd0x3cCQt
         Kv7YtwsIw4pZczy28eoE24HFA/tQAeXQOYss2CKu11Rvw2boAVI+INx3kxLV1cQBbu0w
         icig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183153; x=1726787953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA4GtqjPLbFcczpyYhfz2PBDm+Kw3MITc0s5Cuc65RY=;
        b=G6q8MmVgTf5QOzxt0Z7fCt0j5pFGzBEU3oWWhOyMJY6rLO29bdhq3d5izxjE55z5SI
         B+fkOZqmLMCRHHhAXseuxwSt/snK8lY7AlNDg9z+vEBvkC7+tOsuhasKliMMvLHl+LWY
         0977dQzsDudFbKhZa+6BY16Q/59QA/6JPgYgnZk/NpUIgjLWC2YN8LK+Ehtk+lHZos5n
         aNaR44Pp24Hd7OcVRkBST2fRptEAxd6I9ArT9sxP3lOCqJEoO2sb5d6gFlWlLI6y1Z0m
         ikLdKJHn7Okp0sKRI9E+TwZ0f0gJY1XHab3Ln6d1Ga6b/Q1ozcf6++sZAjuiFxrlEuYY
         UYtg==
X-Forwarded-Encrypted: i=1; AJvYcCWEq4IXq48L+0CJwcQc2uFqcb92/oMKAGgtPjbb16iN2IUN0+jVFktMoMnixrEHRdz+wSAgK0iDF+P2GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzbJYFs5fbQc/u7W8ClWu+vAOXnr06Nuddu4VKLxg+I6Pz3aLN
	inv7A8zTmyFuRxcKumaKCtKPOx34kzc6Nru4eySLt6ISNq24OJR9dMLnjuNSTbxcVKo2pDpmYIM
	/
X-Google-Smtp-Source: AGHT+IFssDwDGbEBDsElM2G4SM2jHhtYY+v60zMZaes5wDvpv3V2oV9g/OYP3KitPGsedCggtBiS7g==
X-Received: by 2002:a17:90a:8a04:b0:2d8:aa5d:5856 with SMTP id 98e67ed59e1d1-2db9fc6e916mr7388901a91.11.1726183152820;
        Thu, 12 Sep 2024 16:19:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:19:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 29/30] riscv: Documentation for shadow stack on riscv
Date: Thu, 12 Sep 2024 16:16:48 -0700
Message-ID: <20240912231650.3740732-30-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001916_813304_9DCE0FC0 
X-CRM114-Status: GOOD (  20.40  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Adding documentation on shadow stack for user mode on riscv and kernel
interfaces exposed so that user tasks can enable it.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/arch/riscv/zicfiss.rst | 169 +++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/arch/riscv/zicfiss.rst

diff --git a/Documentation/arch/riscv/zicfiss.rst b/Documentation/arch/riscv/zicfiss.rst
new file mode 100644
index 000000000000..f133b6af9c15
--- /dev/null
+++ b/Documentation/arch/riscv/zicfiss.rst
@@ -0,0 +1,169 @@
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
+One of those security issues can be code re-use attacks on program where adversary
+can use corrupt return addresses present on stack and chain them together to perform
+return oriented programming (ROP) and thus compromising control flow integrity (CFI)
+of the program.
+
+Return addresses live on stack and thus in read-write memory and thus are
+susceptible to corruption and allows an adversary to reach any program counter
+(PC) in address space. On RISC-V `zicfiss` extension provides an alternate stack
+`shadow stack` on which return addresses can be safely placed in prolog of the
+function and retrieved in epilog. `zicfiss` extension makes following changes
+
+	- PTE encodings for shadow stack virtual memory
+	  An earlier reserved encoding in first stage translation i.e.
+	  PTE.R=0, PTE.W=1, PTE.X=0  becomes PTE encoding for shadow stack pages.
+
+	- `sspush x1/x5` instruction pushes (stores) `x1/x5` to shadow stack.
+
+	- `sspopchk x1/x5` instruction pops (loads) from shadow stack and compares
+	  with `x1/x5` and if un-equal, CPU raises `software check exception` with
+	  `*tval = 3`
+
+Compiler toolchain makes sure that function prologs have `sspush x1/x5` to save return
+address on shadow stack in addition to regular stack. Similarly function epilogs have
+`ld x5, offset(x2)`; `sspopchk x5` to ensure that popped value from regular stack
+matches with popped value from shadow stack.
+
+2. Shadow stack protections and linux memory manager
+-----------------------------------------------------
+
+As mentioned earlier, shadow stack get new page table encodings and thus have some
+special properties assigned to them and instructions that operate on them as below
+
+	- Regular stores to shadow stack memory raises access store faults.
+	  This way shadow stack memory is protected from stray inadvertant
+	  writes
+
+	- Regular loads to shadow stack memory are allowed.
+	  This allows stack trace utilities or backtrace functions to read
+	  true callstack (not tampered)
+
+	- Only shadow stack instructions can generate shadow stack load or
+	  shadow stack store.
+
+	- Shadow stack load / shadow stack store on read-only memory raises
+	  AMO/store page fault. Thus both `sspush x1/x5` and `sspopchk x1/x5`
+	  will raise AMO/store page fault. This simplies COW handling in kernel
+	  During fork, kernel can convert shadow stack pages into read-only
+	  memory (as it does for regular read-write memory) and as soon as
+	  subsequent `sspush` or `sspopchk` in userspace is encountered, then
+	  kernel can perform COW.
+
+	- Shadow stack load / shadow stack store on read-write, read-write-
+	  execute memory raises an access fault. This is a fatal condition
+	  because shadow stack should never be operating on read-write, read-
+	  write-execute memory.
+
+3. ELF and psABI
+-----------------
+
+Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_BCFI` for property
+`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
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
+`PR_SET_SHADOW_STACK_STATUS` / `PR_GET_SHADOW_STACK_STATUS` /
+`PR_LOCK_SHADOW_STACK_STATUS` are three prctls added to manage shadow stack
+enabling for tasks. prctls are arch agnostic and returns -EINVAL on other arches.
+
+`PR_SET_SHADOW_STACK_STATUS`: If arg1 `PR_SHADOW_STACK_ENABLE` and if CPU supports
+`zicfiss` then kernel will enable shadow stack for the task. Dynamic loader can
+issue this `prctl` once it has determined that all the objects loaded in address
+space have support for shadow stack. Additionally if there is a `dlopen` to an
+object which wasn't compiled with `zicfiss`, dynamic loader can issue this prctl
+with arg1 set to 0 (i.e. `PR_SHADOW_STACK_ENABLE` being clear)
+
+`PR_GET_SHADOW_STACK_STATUS`: Returns current status of indirect branch tracking.
+If enabled it'll return `PR_SHADOW_STACK_ENABLE`
+
+`PR_LOCK_SHADOW_STACK_STATUS`: Locks current status of shadow stack enabling on the
+task. User space may want to run with strict security posture and wouldn't want
+loading of objects without `zicfiss` support in it and thus would want to disallow
+disabling of shadow stack on current task. In that case user space can use this prctl
+to lock current settings.
+
+5. violations related to returns with shadow stack enabled
+-----------------------------------------------------------
+
+Pertaining to shadow stack, CPU raises software check exception in following
+condition
+
+	- On execution of `sspopchk x1/x5`, x1/x5 didn't match top of shadow stack.
+	  If mismatch happens then cpu does `*tval = 3` and raise software check
+	  exception
+
+Linux kernel will treat this as `SIGSEV`` with code = `SEGV_CPERR` and follow
+normal course of signal delivery.
+
+6. Shadow stack tokens
+-----------------------
+Regular stores on shadow stacks are not allowed and thus can't be tampered with via
+arbitrary stray writes due to bugs. Method of pivoting / switching to shadow stack
+is simply writing to csr `CSR_SSP` changes active shadow stack. This can be problematic
+because usually value to be written to `CSR_SSP` will be loaded somewhere in writeable
+memory and thus allows an adversary to corruption bug in software to pivot to an any
+address in shadow stack range. Shadow stack tokens can help mitigate this problem by
+making sure that:
+
+ - When software is switching away from a shadow stack, shadow stack pointer should be
+   saved on shadow stack itself and call it `shadow stack token`
+
+ - When software is switching to a shadow stack, it should read the `shadow stack token`
+   from shadow stack pointer and verify that `shadow stack token` itself is pointer to
+   shadow stack itself.
+
+ - Once the token verification is done, software can perform the write to `CSR_SSP` to
+   switch shadow stack.
+
+Here software can be user mode task runtime itself which is managing various contexts
+as part of single thread. Software can be kernel as well when kernel has to deliver a
+signal to user task and must save shadow stack pointer. Kernel can perform similar
+procedure by saving a token on user shadow stack itself. This way whenever sigreturn
+happens, kernel can read the token and verify the token and then switch to shadow stack.
+Using this mechanism, kernel helps user task so that any corruption issue in user task
+is not exploited by adversary by arbitrarily using `sigreturn`. Adversary will have to
+make sure that there is a `shadow stack token` in addition to invoking `sigreturn`
+
+7. Signal shadow stack
+-----------------------
+Following structure has been added to sigcontext for RISC-V. `rsvd` field has been kept
+in case we need some extra information in future for landing pads / indirect branch
+tracking. It has been kept today in order to allow backward compatibility in future.
+
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;
+	unsigned long rsvd;
+};
+
+As part of signal delivery, shadow stack token is saved on current shadow stack itself and
+updated pointer is saved away in `ss_ptr` field in `__sc_riscv_cfi_state` under `sigcontext`
+Existing shadow stack allocation is used for signal delivery. During `sigreturn`, kernel will
+obtain `ss_ptr` from `sigcontext` and verify the saved token on shadow stack itself and switch
+shadow stack.
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
