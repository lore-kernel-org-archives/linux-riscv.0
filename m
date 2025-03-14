Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C262C35FFA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfiKFN3BRLD0mEz9M1sEFlEWkzXDvyB3nEb56tYRKIg=; b=kmDT3wNQHhN0nd
	5+i2QV1CylPwh9ygUs03pE4jsMwSBtduFJ5/JVeSc46ThcNHWXdgYzBr7RzFzEp47f4Mo6mCBUOm9
	NIP2un+dLLW+sLJJOd28XsL1rUWkPRh+LrwQ+kKvUmWoLPDawe+HPXq3tTh+cJScDhupwEFC9MRlL
	qyqK//vMF+DB5NvGjvME3jjClur+iKquJYtl3pecsSRvEIzXkETS/WDIaE0IpyT2pwmX3YtErFPkx
	0GigN4r7yXs6k3nC+i2jkiDfIkEHI/jHfd0jinZeo+nPOQwtNAnHsxSAWlS21VESVGaU5Hl/cbtiB
	ZmXtqhOcKYmfaA9p64Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs2-0000000FSwc-2cxt;
	Fri, 14 Mar 2025 22:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClx-0000000FLWl-2kqJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=S58lE55A7IFUYe9923mKAAObQ+TwOi1jWkuglFq4t0Q=; b=Q8TSJy3fxUIGz2ZQNd9+l3tBw/
	JOp+ZagXTNpDo3tMu3Y6O5anCeHSjwTShzJUayr4JZE6nfPEghaDnJEz8iVpd//z1PGoXaqy+dNjW
	HjKRFf71AIQVqOzDugK18ro4S24hfLVFbPADRpW7aX8ag3sQ+g3pJqRihlMcmIlEuXrznnD3hlciy
	Tzjht0sIeXaaJGOWDmZs5gi5XkQkE2QOkxsnw0YPtePu64MSARC+PFlP7xOiaADcAsnl/pm3Do31v
	yl014/qr2tV8eNB5KtSdEy7e5lJM+rGiCtySDmddO4iL5CbLVgzJjgbi5sX1Ige19ib2AO5Jbw2LH
	qfscOQqg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClh-00000002xJL-3jnJ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2239c066347so54033235ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988436; x=1742593236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S58lE55A7IFUYe9923mKAAObQ+TwOi1jWkuglFq4t0Q=;
        b=mX/PGE3ZfD5DEc/vxXf9Nbl5drEiSKrHB1h24A5roKQ3T21Se853Wr3gYEzGr/ySbu
         pzZpCkrWhst5Pme4J3B8uCh53g/e5mnaKd0EhtOYGr5mbwryPYcXIYVxQAoQp2YdnIVZ
         TiExGVCy//ip9PfWHxMIjbjSKgHgzO5YyUOVl0iTsW+KK9zGqv0Afs4MXbDtDnq1U5d8
         ioOoqcTLPG1Xiths1j+ecFQORexxkBQDpXOZHbi1AoTsBg/UDbqummRYJtk9RFFSgvqg
         AED2IXPepdaVeUITTPEIUSOFcsktgplteHzzse7PDPX/brddF3nMg8OMW7l3BEf93yqA
         WfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988436; x=1742593236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S58lE55A7IFUYe9923mKAAObQ+TwOi1jWkuglFq4t0Q=;
        b=Qsuh2KEBX0sY95erdCkDh9bSMVDLK7UTdkTGj0azMSuNAt0Wa1079NDAmlOePKHzhz
         W3/jy4DAJx8hzaVv6eihCBqQ13wQ7jGGrgRuDJwUWLrSIRKKYIvyB+3RCVwMIelgiAPH
         +Up5Y4w4lBi0oMOLL9QDx/TmJBXNNjHH2OcMNt7moXg/b1CpFjiQ6/f5ugCHJZwGAfBC
         k4cBqIx1dxwXlKJS3siAg3e4XhRl8C0RIa6TCX6CMd1/mdh+UzoGW5LgctBEpTsJoXQU
         syaai+z9NMHv5pce5Laukr6JtLvFYQgudCJso7e2LU1z1ZYO7f0dvcLGllai14z3LHXK
         zpnw==
X-Forwarded-Encrypted: i=1; AJvYcCVbEVpbSEx5rSe9FwkDSRI1mRJ5Dy6UTZpGfdjqfIt8B95lLK9IKeVu5wiIwSK01wPXrcUc/AGIo/ja4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ5ICfylFPngoL+6W11tjzceAvfiza5POgBdde4VOp4lDQo5U+
	EXicgAsXVkgIZnO+TL/9rwYYjJrmkYZbOSCl1SXyAWKS/lsJyrYJiMjZPk+tH28=
X-Gm-Gg: ASbGnculNXiPaxoW5wxAgcSYkItWhVculaTec+pjMnVnseSK5TXGE9W5fJTFnyxIRe5
	kf96WSNSN22yA4uBKGuax8gzwphQb7m/+6GS+g4G2mqwR8fQ/q707NJHxmYYgRQvMAxXuZtgcZR
	3rd5ugQnPbAM/IWEibcs3j7V0MzgGTcldVKIREGf2VdNuP780z+lpEPdQuPZC27lIqyjmrb7qdR
	vHYI9WwD+O1AOxlbYC0XVfzINVmt1nGKC8BF/KqdNSg1W+ZAtQ5UItXobgDFq1wPiWgTdUYin2L
	2HJSRq+MWASclSEblZLaOWv88fFlG4XJ8NRSO+lDexniJTx/OS9w0PF51XC/dUF9+A==
X-Google-Smtp-Source: AGHT+IHxioJjWTqWYTnSKNhIGhNEZD+Fw6H3+v9MmF1O2GdMnurdCyxzj4vsKuZgW7kLmsjMSOe+qA==
X-Received: by 2002:a17:902:da90:b0:224:10a2:cae7 with SMTP id d9443c01a7336-225e0af9d92mr50203725ad.40.1741988436457;
        Fri, 14 Mar 2025 14:40:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:45 -0700
Subject: [PATCH v12 26/28] riscv: Documentation for landing pad / indirect
 branch tracking
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-26-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_214038_194103_074E6263 
X-CRM114-Status: GOOD (  18.96  )
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
