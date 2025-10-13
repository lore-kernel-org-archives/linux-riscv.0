Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50712CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqk03cItrAqd7xISt+vC0pqBJbE27STApin0SjmvEdM=; b=L/zvhMzSIHxuep
	jg8lgw5rHujI/aeHddOOnSwV2inNiWxZPg+0R78ajhKiodDSloF37QEosCxZYdegssgW8CPqZf6wI
	ID0lvggzVhH0PH+aG67ntn2BPIlFt3ERae4t5go14hkjM0gmDIACayBANX0cQoIAO+Frvo1AU2B9p
	iCdbCDnyXe2WnjoEL+D4CTcM+04sQB+G53UGHYtdYTjWc+hAudiBxzrUFmYhq9UoeuQS2c+P/ZQCl
	krI7YKZBrV7yvvtP4cmhWfFLsM8Lp88oRrur58FJDZ/+DB5Q1Irf7ZnxS/wdjMLGq7IZiT3bQ3/fs
	5IEFyjp0Qc0f9P08Fpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QcS-0000000EemW-0Zr7;
	Mon, 13 Oct 2025 22:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QcQ-0000000EelY-3Io9
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 22:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EG1CujsNwBaYp55w8jydf3By/QJhyDp8hEQZ+a6RoEM=; b=CSQreqNhATCmx1kxIdqFri1zqA
	5c3JYDgHPiNqlWffbAeRy4jGE6CCR/Aqqax6EobcQ5ceIwUTC/urIjU4ab8JRfmP/HTqEEx9hYUJR
	vUf7FllaHte4Do/lunoz/WRZ2JlGZJ+jnolb9mknFzQsjEuoL+I1dpy+wcjNQHQ1Z6ToFfg5m70FK
	eJoadRg4jo/gJI+gPzKoAonqUyHipKhAui7l0GvIZh62HMV4VkAY5pHwS0WROGTaukSP9m9d9XbTi
	WOiubO/tqwJCUGGgtgH6Re0Vsg2gP/uRTvYCe2j2u/S8aivDtnN2hbF8Sv2mYis8E/JI7J+Zo0kDr
	jY864b7g==;
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QcN-00000004ft3-04us
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 22:02:13 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-638ac2981b9so1514878eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392928; x=1760997728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG1CujsNwBaYp55w8jydf3By/QJhyDp8hEQZ+a6RoEM=;
        b=BQzywTajAZL2eyexpl1pYakDY8g6MTI49i/exYXswweUJXmRKhs9n5Vw7CP3B100RN
         RXm3ziH5jPSTOeHPkMWsKZV6w1bJ3jVQbvfP8/OchIQq+/dR/D+2BdiY9zSqQkC39MKJ
         20n5TPxQ7aSGW0DQqtjwmSiPJde5/w5w91zpCPqU5YPiQ8DL7eAAOQa7BPNJ6LgzUmKS
         OrOKqK9+Ip+jkbq612krQlawBtPxI0n3xquDH1MZ4JzOv1PHjzTw4X9211Ajb4jei5M4
         CIMuAGscXeXzJQVPieFya6HFLMS0k40uprYFljvL7xSyoX9gyexoZmB2ywdN6VObDeTY
         l6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392928; x=1760997728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG1CujsNwBaYp55w8jydf3By/QJhyDp8hEQZ+a6RoEM=;
        b=AzKJT7o6TUesxVdncX1KPfr/FzT1GpDG1uMktfPZOVFDZMl8jEZ5yBWQnrgWBc5L+k
         boxiX1G3xhSFQqHVsRCaqdM5BX9IhchCjI/E8H8O6h7KF8bgb5CwSNZrrHNRsStoMtz9
         31bZM3wvwVOMo5rXNwglgkTmibukHMw6hXN9D3wYlWt0zxA1IANW2QUTAWMvDVZ9lXkG
         qEsXhE8FFbM3H8g27EZGHaAHsQxMnTfsLSBO1LTqTqGdLWyrN5inY/PM++cmJTQCzUMW
         dT0XsrZ/ukFDlNCyFHBmIv6VGBP6q+D+szbjcIy09S8hqRt7Fdub3HktINSmgZekTh6w
         r/dA==
X-Forwarded-Encrypted: i=1; AJvYcCUibpcYw4N5LFusExQo3snVVi3MSydy3VQ1bTc1KunR/w2KOKEQcDFv2OAnjqsJRHUyatSTBm0fHrkymA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+x4OVAao8eBbd43vx1aRc3WU9x8HbZqy4C7SGsu8O1dAyRcvu
	68017b71d1qcGej4E0epMTrNrCKT4tJ7Fib3bL8RPXjQdpVt60cMNNNn98oRxdJ1cL4fd2WkB9Z
	2dTLR
X-Gm-Gg: ASbGnctC6FcZ1WtPxcXbDjLUUsOXcVJ0aVvaqhGAH+yWL2Duz+RfAVIdvXJkEL7VEHH
	LvL22iCTdrWTxLA9ZyEdATV4Q5huA4cKEUax76aFcdnsCHTaAIvWS4chyTGrcbQ+wnHO910HZMt
	Cy0i4qnmlIppCrFEemYHn3iLBYkFc4Wl0jphYKRsqF1OBGb6h7cLqpji56m5O1qvYHa0mMvJ4Bd
	enjmvGliz/veWFzzn9Z/uXZJGpr25aIXvjCdOcKWTXqALHV9gktDUVMgec2VDpC2Ve/NmH3deTS
	jsJbmvErqzT68qz1bQpFL2ZffL3JMskyP1Bsw6RYyoq7bVrLmtxr5ExwCs1j3Pf9x8e9UHqumfS
	mYJF1Kg49fkHstdyE3HZKPTyIEDODKJARUoncaG05dcIqBko6VAyS0X0O8iaXsg==
X-Google-Smtp-Source: AGHT+IGfid4ZsMR3CoaIlWB5+Gunj6s0lNmjIuB2fbZTvaSGFUFt+EbWkoJNHt/MTShbkGbwbhds1g==
X-Received: by 2002:a17:90b:38c3:b0:336:b60f:3935 with SMTP id 98e67ed59e1d1-33b51386232mr32947105a91.23.1760392616746;
        Mon, 13 Oct 2025 14:56:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:18 -0700
Subject: [PATCH v20 26/28] riscv: Documentation for landing pad / indirect
 branch tracking
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-26-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_230211_335337_1B42909B 
X-CRM114-Status: GOOD (  19.00  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
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
index 000000000000..3575c7db2cef
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
+to enable indirect branch tracking for user mode applications on RISC-V
+
+1. Feature Overview
+--------------------
+
+Memory corruption issues usually result into crashes, however when in hands of
+an adversary and if used creatively can result into a variety security issues.
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
+    Such form of indirect control transfer are still immutable and don't rely
+    on memory and thus rs1=x7 is exempted from tracking and considered software
+    guarded jumps.
+
+``lpad`` instruction is pseudo of ``auipc rd, <imm_20bit>`` with ``rd=x0`` and
+is a HINT nop. ``lpad`` instruction must be aligned on 4 byte boundary and
+compares 20 bit immediate with x7. If ``imm_20bit`` == 0, CPU doesn't perform
+any comparision with ``x7``. If ``imm_20bit`` != 0, then ``imm_20bit`` must
+match ``x7`` else CPU will raise ``software check exception`` (``cause=18``)
+with ``*tval = 2``.
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
+then kernel will enable indirect branch tracking for the task. Dynamic loader
+can issue this :c:macro:`prctl` once it has determined that all the objects
+loaded in address space support indirect branch tracking. Additionally if there
+is a `dlopen` to an object which wasn't compiled with ``zicfilp``, dynamic
+loader can issue this prctl with arg1 set to 0 (i.e.
+:c:macro:`PR_INDIR_BR_LP_ENABLE` being clear)
+
+* prctl(PR_GET_INDIR_BR_LP_STATUS, unsigned long * arg)
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
+Linux kernel will treat this as :c:macro:`SIGSEGV` with code =
+:c:macro:`SEGV_CPERR` and follow normal course of signal delivery.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
