Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A8DC87FD3
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3k4tXj03H5ou2MvYURL+YLcuQNjl/caGO5O1ZmyWTw=; b=G6LeL+pQNdNZqt
	BGwy3MshHQtE1wdKI91HfDO/4+/O4qbLt3MZva2UFecCXuXt30t1WcAOgibwH2/SE8yizE/MYNAFF
	rDTdEK02aqp3FV1Fy6Wp6AVQ/T99/dMWKX8tpwbbqZPS5xH6DMkMOBVTgTtzabKPjFvM9p2obQPLW
	u3VypB7tzg/wgJ61QONU6UrCxtm4UhjVDSxkygmiIFCkSTephe1uPAnjH0ukYUxA57mA49SB2yI9I
	/etl/6c64zUCX5ThY83+UftEjIiehsWygBmyUiUpHTFHSZO3jbpRJQ50VftzFA/kqCzRHscH0z1rE
	WG42Lb66KliI/cixBo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdd3-00000004jdL-0WVn;
	Fri, 01 Aug 2025 00:28:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZf-00000004bpx-369X
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:20:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-31f3b54da19so1084089a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004035; x=1754608835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04baGaWIOcpAM10BsvDKc2YnzV44Y+9Sv7IQZJnFcq0=;
        b=IUZ6sImRmKYZlCDzVSzz9FU5L4OVqJUULOLE9sD67MljFpDrWmIuWvuSxUd9lT/PG5
         5DfShhNL8Oub2/+teOVNopsxRq6TnKYNvfERDdOh1M+blmtxeTFnSUwVyAqQWWz6+u5D
         qqbO6Fz3+39VQo7WOwypsDE60bP9lYxINbLMdqE5fu3g+vfbCt8MMn+gUwcB/VBzOvEU
         v6NM7hIXC2TNZPV+mkY+olETrqTosveQZ8w7MxQf0IA8EYBYU4R/L9bUfI6eeH1wazaO
         bGB1lYimHl2ZqLTyk/8tnAjWbfAJJQF/2aO1qJ2TT3NS/KAkGS2GNy79mXkCu0LK6WCD
         RItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004035; x=1754608835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04baGaWIOcpAM10BsvDKc2YnzV44Y+9Sv7IQZJnFcq0=;
        b=C75FzCynNFdsYlOCZSjQkQczwH8KQrUsFo7vFsjwykFj6WZ5MWWDE1APyg0jqu8956
         WnvCmX6val+g6N5j0vmRXKp6kNcqD3ttmGx3k561Oq9TBV1q1cwqZaYseiJkiGAupnUO
         KQthqCzAsBDPhFraAEV36I/9+J9tBUW/FuN4okaHTlpI1eOdtULMs1QnJdTiRh1RGmX2
         RRtJ+1xyh0LKdPzhI9azdgm6vJcD4uNqGqCVF/mMi3o2xljA4H4+qFfi4y7KD0ISY06z
         m2QzTxyJSP05c9E+u17tLdBe31MX+Jzv7+gTdmvbzevGnPzYPUSCB9GIw63p/MlIwzBc
         YIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMjgJ8N4vWGa6vs9GpPU3gLmZbIFD+OTo8ymMSevwOWE8CWZQO1U0PtN542HineQpBUR26EBL4lPj8gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6muM8pOcxDtaw+2vmjEv0D3EqcDFPyq0JUUaAjb+KXEHxgdwz
	rbs52AXqjpyHHkFDOhbwUdfVnrSbPJTos4pcOLYUjRFvHAY40jWzyFPsBQa5/EhnZ6M=
X-Gm-Gg: ASbGncsgfcHZ/D7w2quf9TII4E7ZJjjDHdDAjLl3jq+5FpIln4xRCxH6c3C+zv0HmAS
	SJIdo4LtcZQYvn1V8ZxT5MzgKhsXbv1pisVQmMoAv15jCO4e1XUQ8d91jCBdZKcAl/oVtclQm6G
	mCpDYTcMT14OKFkMWc2kSH/ixm+1bUaXp0hDeLmGzMh2sz2GpmQBuHwj1J+FQftWPJLIWT+W072
	WQQX/l/U4wSrrYNgvdri660UBoZSs+QYImUyJBUrQNTfnYxyGNUhh5m8NPDuUGgXPsKBJ3lB2g5
	t1JtcMwZabg5amI2YQ/b/OSfBDHQW1ZBA3Ul9Bz4Fy6Tl9+zLmGeyvY+69IEw2biTVJcoJlTxKn
	lPtKO29T80U2Srd8GL063KVmlfzU6urrJ
X-Google-Smtp-Source: AGHT+IEyDj4erId7aawGI/VqypIEWKc7AcRxtwEhlRwUvhT5Xgkct9IWPfC1WhG/YZBxwkqZsdc1Bw==
X-Received: by 2002:a17:90b:3d07:b0:31e:beae:2934 with SMTP id 98e67ed59e1d1-31f5de4b8f5mr13878801a91.18.1754004035067;
        Thu, 31 Jul 2025 16:20:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:35 -0700
Subject: [PATCH v19 25/27] riscv: Documentation for landing pad / indirect
 branch tracking
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-25-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_162035_823352_4B781E7E 
X-CRM114-Status: GOOD (  19.33  )
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
index 000000000000..dcf43de73a06
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
+	Such form of indirect control transfer are still immutable and don't rely
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
