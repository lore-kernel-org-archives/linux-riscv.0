Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD53EEE271
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPxZhJWDF0m5hwuliqIlrRZJNCcATD2YaWGC9rq1pbA=; b=MXYgBfdmjLbT8Q
	bR3FCI/nxryEgruu+PI4Cmy3R8/ThM+d7ZS1mBsD/zhSyzwXUjC9Hvd7Fgk4YQMOMY8qXhRV/Jrrw
	bnzwF3zCMXUgj8Y1UdSm7JjtS0b6yZFPoYWvg0oLtUtzeLG/cOYn6ughcL5esHtRtwtK/I/1q25jQ
	2QxEZOdXnb5RIjiFy5kg9rvKpxgy+HhE1ruCxr9EoFI5kJE/I0mZhhrKrteVh04DmAcK8TJOMR0Fk
	HtBQs6aznjFqZ1ihIZAGOJaNjvwQIyedEjb4d5b76HPbe+w1PUMexZ+8XQqHdRXPn2eG7LlgaqLmd
	cNrdl7W7F85WEt6Er8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot62-0000000ESv7-3iL3;
	Thu, 12 Sep 2024 23:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5w-0000000ESoS-0N2o
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Iyonew7njYYUDgOFlccFcLDkYmWknDQSdFdIbsgjEzE=; b=LgJOcPjhm5R/xtWAwEywzYRIpR
	Tx1Kh8qrt8FfvdXGBFrfXQLR1ajMwxYM5Pc9oZoqtvKnJqKuOPB7FW1xXnUxTBqOxcxWba8fzOfGC
	3AuMUVbPfPdFSkMQdLwcNd3DJAcbaQiSuhuW71zQz9kzu8iyg5u1fBBiKRjecw3+9Z8H0DOvRtx/1
	Ep8H7ZnuU+uJFWaiImhAuVunLb8FHREvlqQSQhQTUHd6zoFw55Z/BJxFS7eLvHmmzuNrvJ0XqD6tH
	vFcE8HhCRGCnAmAMRxkOnxpXSYccxeomY0pACq2BlgcoBJbUf3PnvH9UiDPi7bJ4AdqA0QNL5NVxW
	rBfoP/rw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5n-00000000YM9-0MlL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:19:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d877dab61fso278981a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183149; x=1726787949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyonew7njYYUDgOFlccFcLDkYmWknDQSdFdIbsgjEzE=;
        b=wWIjWnA8YHcT/+phxap+1m6AnB/smDbsfdsOpj5hwTHt/knj31A3jRh3fzFNTHQkxE
         VEN8Wkpny+H7VhHpOSw894+/rHVUmBUMZbbJ2breq6DfeLtjoNMQHvlAeWA8wGKP5FRd
         JZatxAIQfE+HDxYfG28Cqrs4i9HjFBg6K20O4mzYaNtw4tZSvrKVV2WsiE+elzE8y9ZH
         V4sUBUMVRz+bimMvlV2r3PVORHfuzSfAO2cVRp0xiPJ/Q/Umq2ber9UC7yR8RdO6GbCS
         rjF2cPNetmjEKJB3tdO3rQxwDy4i3gKaQCTBhwTOdGK2VSoKyuFKyVmd9FXiie7bTXcl
         YAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183149; x=1726787949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iyonew7njYYUDgOFlccFcLDkYmWknDQSdFdIbsgjEzE=;
        b=Ytbywg0ClN6ODwwLSMSfity6L7BTT3/B2olih2Ew5BCzURyTLS3WQtnqtRkOdTFCxR
         hRdUBbMQA14YqIQ6fSi+DBR+gYmKg2R2DcduPCYeT+Rf8vy0Hx/ukLAurhuOfNPovsTb
         U69P3X7mM9W4hjPVf9T6p2h0xIq3v+TIx2oxo7MDoa8WJXoedNowf2FaSgG50fQHb8U6
         wVZR2fwfhuTm+Aj344zmFjlc7YOeWe0hRPGaP2zyR5TgNu5+OmE0lzet/FLvoAneVk5W
         f9CWhoVJVtdHTivDs3+7w1S4AmLAW9WldPdjMjW815XOS7hx9eDYBwSPjuaacAhqKzjD
         CBRg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Cmfk15m2IWaaoDvv0d6qZcA8faS96wDDYIGduHUNQXbnR8ztVtjyoZNnBgu6Yu+zkQOT7zKKAArQMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjXo0GSHNLHAuhv5UKNWH1iw2QjkSJ0OgiBXt5YQ4q5mLlBGNF
	AncbBertYeISu9TEWOPidAc7Kr1e33nQKXz4aoTtahkILpQybp6F42UH9OhoO0E=
X-Google-Smtp-Source: AGHT+IFQFXeegIq20jMre9WaWvSrfHhLDrwK4rARP/3T0r/5M87gFpvdLVA9mkxvLCR99S6cpVQrqw==
X-Received: by 2002:a17:90a:4b87:b0:2d8:f0b4:9acb with SMTP id 98e67ed59e1d1-2dbb9f08179mr1017556a91.34.1726183148685;
        Thu, 12 Sep 2024 16:19:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:19:08 -0700 (PDT)
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
Subject: [PATCH v4 28/30] riscv: Documentation for landing pad / indirect branch tracking
Date: Thu, 12 Sep 2024 16:16:47 -0700
Message-ID: <20240912231650.3740732-29-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001918_916493_4DEE20D5 
X-CRM114-Status: GOOD (  17.08  )
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

Adding documentation on landing pad aka indirect branch tracking on riscv
and kernel interfaces exposed so that user tasks can enable it.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/arch/riscv/zicfilp.rst | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst

diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
new file mode 100644
index 000000000000..23013ee711ac
--- /dev/null
+++ b/Documentation/arch/riscv/zicfilp.rst
@@ -0,0 +1,104 @@
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
+RISC-V zicfilp extension enforces a restriction on such indirect control transfers
+
+	- indirect control transfers must land on a landing pad instruction `lpad`.
+	  There are two exception to this rule
+		- rs1 = x1 or rs1 = x5, i.e. a return from a function and returns are
+		  protected using shadow stack (see zicfiss.rst)
+
+		- rs1 = x7. On RISC-V compiler usually does below to reach function
+		  which is beyond the offset possible J-type instruction.
+
+			"auipc x7, <imm>"
+			"jalr (x7)"
+
+		  Such form of indirect control transfer are still immutable and don't rely
+		  on memory and thus rs1=x7 is exempted from tracking and considered software
+		  guarded jumps.
+
+`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` with `rd=x0`` and is a HINT
+nop. `lpad` instruction must be aligned on 4 byte boundary and compares 20 bit
+immediate withx7. If `imm_20bit` == 0, CPU don't perform any comparision with x7. If
+`imm_20bit` != 0, then `imm_20bit` must match x7 else CPU will raise
+`software check exception` (cause=18)with `*tval = 2`.
+
+Compiler can generate a hash over function signatures and setup them (truncated
+to 20bit) in x7 at callsites and function prologues can have `lpad` with same
+function hash. This further reduces number of program counters a call site can
+reach.
+
+2. ELF and psABI
+-----------------
+
+Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_FCFI` for property
+`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
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
+`PR_SET_INDIR_BR_LP_STATUS` / `PR_GET_INDIR_BR_LP_STATUS` /
+`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect branch
+tracking. prctls are arch agnostic and returns -EINVAL on other arches.
+
+`PR_SET_INDIR_BR_LP_STATUS`: If arg1 `PR_INDIR_BR_LP_ENABLE` and if CPU supports
+`zicfilp` then kernel will enabled indirect branch tracking for the task.
+Dynamic loader can issue this `prctl` once it has determined that all the objects
+loaded in address space support indirect branch tracking. Additionally if there is
+a `dlopen` to an object which wasn't compiled with `zicfilp`, dynamic loader can
+issue this prctl with arg1 set to 0 (i.e. `PR_INDIR_BR_LP_ENABLE` being clear)
+
+`PR_GET_INDIR_BR_LP_STATUS`: Returns current status of indirect branch tracking.
+If enabled it'll return `PR_INDIR_BR_LP_ENABLE`
+
+`PR_LOCK_INDIR_BR_LP_STATUS`: Locks current status of indirect branch tracking on
+the task. User space may want to run with strict security posture and wouldn't want
+loading of objects without `zicfilp` support in it and thus would want to disallow
+disabling of indirect branch tracking. In that case user space can use this prctl
+to lock current settings.
+
+5. violations related to indirect branch tracking
+--------------------------------------------------
+
+Pertaining to indirect branch tracking, CPU raises software check exception in
+following conditions
+	- missing `lpad` after indirect call / jmp
+	- `lpad` not on 4 byte boundary
+	- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`
+
+In all 3 cases, `*tval = 2` is captured and software check exception is raised
+(cause=18)
+
+Linux kernel will treat this as `SIGSEV`` with code = `SEGV_CPERR` and follow
+normal course of signal delivery.
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
