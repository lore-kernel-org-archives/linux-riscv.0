Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C1C0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGBnYRCFj2pq9AMdyqj4UEl4WGlEgnvBxRgQcjbNKgw=; b=hIzmOw3BxBX1b9
	VR0ENBM4yew26rnvEH0+xsGTebCa5AOqTo4EYOzwWe+88sse2CRGT0BowvTaS0K92jN4Ky51ubHMy
	o700c5UJCc4/9Y6TpgGt17/tAvhYNL1/IsFRmxXk01NBakd4rEM1NWir4IkNehA0FpLMlm4d+Myte
	ZwbZNOR0wZmRz0v6kLOItmBhZ/1iATdmZSdV6+lft80Yu5jBEph22/wL6k06ft3jQDUN0ROn8SXoi
	4HwmBwDeaRGuALe+48UvMHeGpXImFPdtBdpSKlPeYaHvJOqZ2f7FNCjfrTBdQAVNC1ZoQA8kTCtNd
	ivejhT7xuVFO9GfF5m9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaOu-00000001LPq-3EZr;
	Mon, 10 Feb 2025 20:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNk-00000001Ksf-3B6i
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vh4CUvpz/fzJO7m3g4Lrx30VWLQNLgBESiJnDVTGIvg=; b=e1GkXwPBPUMa+FF/PEWkcqhPJt
	SAc+phvKR2e27DptTeDpa1ana+MVRgZ/6RzYBwdtqRRkepEMruERoJJlCGE3LbQDDotoxZfOhcOP/
	hBcqF+4QGUzC9mtfMDOeoZYot3mbm/T27A/TjNjh9jAxwUlJSH8OJw4PIBmGTYXCKBVby51kEkC7p
	taRA3LwNZRUMkl4yoXY0V/nmYNG+HirRslIgq2rlqztFS9YOvrS8YreUl80sh1IjGHR+59kQfFjda
	yjD2B0y1pfaC0fhkCXr4a1DWOGRf0QPpxQyykxNp5j+FudUsamTrDDyeFvn+ZngRUWfklTFVBPNWs
	Bba/Fvvw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNe-00000000DvA-438q
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f55fbb72bso56910445ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219264; x=1739824064; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh4CUvpz/fzJO7m3g4Lrx30VWLQNLgBESiJnDVTGIvg=;
        b=y1E1+wVbW6ve9YQ2fwXzzizK7wcM+XJmD1Usst03IMRcIihDfrskpsrmYmiJsqN1h1
         r/66OdHYeqmvHuovhMIm6opRs0HRUjD3A/IN7F2sxc0Ln1woB9GFkD3NQ1s+NXRqOJEq
         VlWZZdrNuC+ObRRmrbqL5bDyTrE1Mct5Rg3K0M8/A7gkgY5K2uAoYAA7ifPwteS+deug
         XTXNeyhZpHMTTLOXgXEjVCbIRQoo+0csYMZAUpx0rdsZtx4uwMghz6D1go+MzBMOavHL
         YsuoacsmbiH7JDWcn39cgzTxyfzvMlkMkLD/o0sFlMViUpf8LZtexLxeQf4belgZvXym
         Pc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219264; x=1739824064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh4CUvpz/fzJO7m3g4Lrx30VWLQNLgBESiJnDVTGIvg=;
        b=VYyqsCx8WJrBdxaQ18FSuoVf0UC3CUhMVmUlHdkgxHTt7ae9ZoBX92E9x451BHWTxd
         5u73RgZhokqtmDyyQsbjbGoopvGMHT6InenEhYslbiokA0lSEkEzQfXe8OPHra7Oubks
         TUsEHNG8DT4nQs9V2EpHumU3HX2iu/WBNcO7AGkESdMDXPTVouv1uI79Aw1eWeu+ssPY
         jctqOpmlbycqetoTsY5Ecg4QTURrrdVPA4CWyieaXgQPxbNzzAAscEFJ6LhSFUUkwHNn
         yCEeP3qsGlUvfwCygw4jLe7+G8YcD5O9lHvUzJ1lGB/WbavV0H4GmV3vYe9FB+8HtypD
         M2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtGdOJs0FfB34voNFS9upvqmCqCRl+QSNRG5aAkenNLcNiV92aBFJi08EcqxuyDkPR5shcf+cmBMA+kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytd0/XJcYJ9gUTrY20AbCPmyabMU1PA6MpjqTvvOKc8tJL3o/u
	roJdXCAcFveyg5U8fwsIbzzjJGb03bQwd/JYnzBlQLphqI2aXEtqtSd+HjwsrcA=
X-Gm-Gg: ASbGnctd429NqSA4VPnwb1RdLFbVDi0zPwUkD9VP4Wk/7lUG0sgUQE3KWZaUpGWqBS9
	Hbn5BMoqRicPsnYC/d0eQt436oFTr/RuioAKyCZd4DHawGfYSz6SjywFo5TQ5136bbTbjO7kBHP
	uMRlp1GNlhe9nHSzFmnTzYcrPy8yetnMiuaLE5ofK8sqeAnIXTmp0Ro4RNA1hIvX2TMGUAf9v/s
	0UH78GrveU3eoCWbDcBkPOE9IJ8G4kUsvMXJlXXAQzlfIzeqyD52WaNpu3YRK0pHTalxv3f5F9l
	QK2ZxExzZANnIKs2GZrZsY+AqQ==
X-Google-Smtp-Source: AGHT+IHONYQapq26xKI/Nlqt2sawgQ5ST7q18FCOtyS0Axv9TidoEnrL+FFU0G/ytCjykvg19tyLYQ==
X-Received: by 2002:a17:902:d4cc:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-21f6a369009mr211502955ad.12.1739219264447;
        Mon, 10 Feb 2025 12:27:44 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:44 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:58 -0800
Subject: [PATCH v10 25/27] riscv: Documentation for landing pad / indirect
 branch tracking
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-25-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_202749_388254_A948C83E 
X-CRM114-Status: GOOD (  19.41  )
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

Adding documentation on landing pad aka indirect branch tracking on riscv
and kernel interfaces exposed so that user tasks can enable it.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/arch/riscv/index.rst   |   1 +
 Documentation/arch/riscv/zicfilp.rst | 115 +++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index eecf347ce849..be7237b69682 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -14,6 +14,7 @@ RISC-V architecture
     uabi
     vector
     cmodx
+    zicfilp
 
     features
 
diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
new file mode 100644
index 000000000000..a188d78fcde6
--- /dev/null
+++ b/Documentation/arch/riscv/zicfilp.rst
@@ -0,0 +1,115 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Author: Deepak Gupta <debug@rivosinc.com>
+:Date:   12 January 2024
+
+====================================================
+Tracking indirect control transfers on RISC-V Linux
+====================================================
+
+This document briefly describes the interface provided to userspace by Linux
+to enable indirect branch tracking for user mode applications on RISV-V
+
+1. Feature Overview
+--------------------
+
+Memory corruption issues usually result in to crashes, however when in hands of
+an adversary and if used creatively can result into variety security issues.
+
+One of those security issues can be code re-use attacks on program where adversary
+can use corrupt function pointers and chain them together to perform jump oriented
+programming (JOP) or call oriented programming (COP) and thus compromising control
+flow integrity (CFI) of the program.
+
+Function pointers live in read-write memory and thus are susceptible to corruption
+and allows an adversary to reach any program counter (PC) in address space. On
+RISC-V zicfilp extension enforces a restriction on such indirect control
+transfers:
+
+- indirect control transfers must land on a landing pad instruction ``lpad``.
+  There are two exception to this rule:
+
+  - rs1 = x1 or rs1 = x5, i.e. a return from a function and returns are
+    protected using shadow stack (see zicfiss.rst)
+
+  - rs1 = x7. On RISC-V compiler usually does below to reach function
+    which is beyond the offset possible J-type instruction::
+
+      auipc x7, <imm>
+      jalr (x7)
+
+	Such form of indirect control transfer are still immutable and don't rely
+    on memory and thus rs1=x7 is exempted from tracking and considered software
+    guarded jumps.
+
+``lpad`` instruction is pseudo of ``auipc rd, <imm_20bit>`` with ``rd=x0`` and
+is a HINT nop. ``lpad`` instruction must be aligned on 4 byte boundary and
+compares 20 bit immediate withx7. If ``imm_20bit`` == 0, CPU don't perform any
+comparision with ``x7``. If ``imm_20bit`` != 0, then ``imm_20bit`` must match
+``x7`` else CPU will raise ``software check exception`` (``cause=18``) with
+``*tval = 2``.
+
+Compiler can generate a hash over function signatures and setup them (truncated
+to 20bit) in x7 at callsites and function prologues can have ``lpad`` with same
+function hash. This further reduces number of program counters a call site can
+reach.
+
+2. ELF and psABI
+-----------------
+
+Toolchain sets up :c:macro:`GNU_PROPERTY_RISCV_FEATURE_1_FCFI` for property
+:c:macro:`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
+
+3. Linux enabling
+------------------
+
+User space programs can have multiple shared objects loaded in its address space
+and it's a difficult task to make sure all the dependencies have been compiled
+with support of indirect branch. Thus it's left to dynamic loader to enable
+indirect branch tracking for the program.
+
+4. prctl() enabling
+--------------------
+
+:c:macro:`PR_SET_INDIR_BR_LP_STATUS` / :c:macro:`PR_GET_INDIR_BR_LP_STATUS` /
+:c:macro:`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect
+branch tracking. prctls are arch agnostic and returns -EINVAL on other arches.
+
+* prctl(PR_SET_INDIR_BR_LP_STATUS, unsigned long arg)
+
+If arg1 is :c:macro:`PR_INDIR_BR_LP_ENABLE` and if CPU supports ``zicfilp``
+then kernel will enabled indirect branch tracking for the task. Dynamic loader
+can issue this :c:macro:`prctl` once it has determined that all the objects
+loaded in address space support indirect branch tracking. Additionally if there
+is a `dlopen` to an object which wasn't compiled with ``zicfilp``, dynamic
+loader can issue this prctl with arg1 set to 0 (i.e.
+:c:macro:`PR_INDIR_BR_LP_ENABLE` being clear)
+
+* prctl(PR_GET_INDIR_BR_LP_STATUS, unsigned long arg)
+
+Returns current status of indirect branch tracking. If enabled it'll return
+:c:macro:`PR_INDIR_BR_LP_ENABLE`
+
+* prctl(PR_LOCK_INDIR_BR_LP_STATUS, unsigned long arg)
+
+Locks current status of indirect branch tracking on the task. User space may
+want to run with strict security posture and wouldn't want loading of objects
+without ``zicfilp`` support in it and thus would want to disallow disabling of
+indirect branch tracking. In that case user space can use this prctl to lock
+current settings.
+
+5. violations related to indirect branch tracking
+--------------------------------------------------
+
+Pertaining to indirect branch tracking, CPU raises software check exception in
+following conditions:
+
+- missing ``lpad`` after indirect call / jmp
+- ``lpad`` not on 4 byte boundary
+- ``imm_20bit`` embedded in ``lpad`` instruction doesn't match with ``x7``
+
+In all 3 cases, ``*tval = 2`` is captured and software check exception is
+raised (``cause=18``)
+
+Linux kernel will treat this as :c:macro:`SIGSEV`` with code =
+:c:macro:`SEGV_CPERR` and follow normal course of signal delivery.

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
