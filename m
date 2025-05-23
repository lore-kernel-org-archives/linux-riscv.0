Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64566C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3k4tXj03H5ou2MvYURL+YLcuQNjl/caGO5O1ZmyWTw=; b=frLZ5J5gEF8lHg
	BwncRlG4JrvvqR/TvUiKc4UbieW2Pajm1FMBGqpnJ3PtXzumgFyQ9KeCZvIh4XjgRuMsSzCACtGbG
	IIz3Ts9sp31hl/evK1Wp39fr+mXuf8JgYVnyhxfFADIj4uLm5OJjCe3foAn5EwftDQUQNZhQJVq6O
	U8F3kLQlQ+Tab8P9IJtgvVWQUxniMSocrIgQ6Ig5fXArqZicAhQuHDHxy9zvO9xe0G7amNoMiBrdB
	3S7rFA9tGt1vNWiL4mBPdMC4e2fcZFvNHlnDITnSshZ3i2yOkGSyfJaUJ+1zkEpnoDX8CJmeywjfp
	U2/cTQ+rarxkdZQlPB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM33-000000037XF-3V9i;
	Fri, 23 May 2025 06:38:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL1O-000000030kI-0ia5
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=04baGaWIOcpAM10BsvDKc2YnzV44Y+9Sv7IQZJnFcq0=; b=mjy0CsTiFyI1ci5Sz3aYG6RC/8
	5+UQ5ymrWz8rmD3fNpOjj3tdQX44MRQw4LTXeWByQ45ubu0W8sR6VDon61o8l3KTGieLKhv8DQJ9b
	B+Wy/5CxknMP5EbRi4ZRMzbpiW95phOb/oochQ6tzkwLtFy4i/CDDchR6aqBn0oLLOImVQcWcHXZk
	FiXyDSZ2pCfEqsZ7MGX0Cd8NRFCkFicu6rVf1rIKvdL/LfvLj4v+Ax0LnsPuK6XcS0HhQmI2WASVL
	EnWniTZiskcrI50/hHKh6IKQ83vxggUBdwTY7jEW6cDgj9CfGFRCel/JS/4nbYxTL2IFanEX7KL9w
	RJTbQfqA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL1J-000000018uU-31H1
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742caef5896so4890114b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978356; x=1748583156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04baGaWIOcpAM10BsvDKc2YnzV44Y+9Sv7IQZJnFcq0=;
        b=i1t9bme8rBnrWF3gUICRFIXp/3dmq8KDa3VAELtXYhlPUKbqBu++45OoWKew8CVZ02
         R41bhHbZzwi78rSMdARwANNSsAIC/2aJk41SM+Uv/U7wXFukpvI0i0HBvpIfCeSe0Ot7
         SzbbpSR4yJx3SUDJFm4koALSTD/VNZBpqNntgdqByWLw07FOE5V63VzkFq2aMNDBquSV
         U9oNAlewMs81RzOY7liR4AlCK43oYZb2Q3KR6vIxEon60r9p841Nuz3jsnHmQ5NcMf+o
         z91I/UdiNszVm0TKdHa3d4oeiAYWTcTX8D0hSzenIBYIvmHGJ1wZIXDUC5IsUvtmiVR1
         aYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978356; x=1748583156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04baGaWIOcpAM10BsvDKc2YnzV44Y+9Sv7IQZJnFcq0=;
        b=DoVA3KYrqBhXd7m2V5U0v6YZgV4I3L2PoyVx1RiDql3SYso0TYDMlR1Krq66RKelle
         L5oQuAidd5ba3KVMWFHtn/Gscw28HjJNZoLa5kffeWWC1HpuTjjJ5gBmBhHcLymOLeEC
         MPbwciUwGmlaGeGzQm28i4HOHT6CPP/93iOUg3qWElznIeOiyEFY6kTyOfux5m5X+HEF
         N/9oCmz+hTLSliccnXVgkRRnQOIW8b+EZGaGQ8yvnx7wIxDFENb+X2xIuEXrTFSYc3YU
         bzgh1+2pKi6FW0KHKVAWDiouXmX+M6+ijaPDUkSZUcizxMStYgksreRZs24Rd9sk6TAb
         pCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6YuotCY6dltybH2TqgK9hxbd3S2y0qEbtRHQZwEu0PA6XrhWfHDeu71b4JFKY6LVWw83gUmCmlb25tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNxdkk1OKLD09KKqMsSj7EvPzwCymnT4E8JSG4/81lSF+Wcnmo
	Wan4wA2bpYZh19YiMXeJO/+fusrNSFXwT+FPuf3EwwkEkfjfsjJVVKGWWtpFZpkEkUA=
X-Gm-Gg: ASbGnct04hfKqxmnnHD0cEe+Pg2s8NzkU7YEl+W6ygP1FFTIPhi2eP2ryGCuCDHOieG
	DW41/YO/r4QprQC4lyUj3/zPJxVOT7bqwWDsqIPJ+MpCrlED1WJuG+C9rQqKDBaj6S74bwAvy9b
	5bNzmn2Q8UaH/Me4P4ybH5sT/ZLyU9OLQnSDUkhxUjfXD8vE6cfyyMvBoTbdp5Zw06ePY+KQN2Y
	Oc4oea0TIuCdIyhdU0pbQ7n6A5UVf28YgTyVyYZKV53qX6SXITi0Xzip4VK+KGRZHKuL5AtTUEz
	fe6dlJxwTZP5TC75iwR0YIGRc0zTD86ZixjplJa2ys/86EilJS203GkgU0J2aQ==
X-Google-Smtp-Source: AGHT+IGY2mml7AXscMSxTVcExivaWeJQg450Faf3IiaTcz1vQGyBogO5Kxf2SHgDF5QZvOcb8ujfTA==
X-Received: by 2002:a05:6a00:982:b0:736:a7ec:a366 with SMTP id d2e1a72fcca58-742a97a2bcamr35352139b3a.9.1747978356133;
        Thu, 22 May 2025 22:32:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:28 -0700
Subject: [PATCH v16 25/27] riscv: Documentation for landing pad / indirect
 branch tracking
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-25-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063237_926788_46055EDE 
X-CRM114-Status: GOOD (  19.05  )
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
