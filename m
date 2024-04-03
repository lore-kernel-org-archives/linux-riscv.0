Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EE8CD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TETJKE1GZg6wZJoyAVj3bLAMY3SF3fHFqLu8Np2k4Ck=; b=Nf7H6OtQ2E2H93
	q1y4d+v/uwpbL4wRjmr5X648aQdaMyQ/5qbNTyzDmYiDF1IbWPsT1avB4UhnpVWggWy4O5GlhuPxu
	u9wWk5CzW5ncfVms1hsfyNA3ckS32GOJwIqhw9Up+1sW7pEXAAOjwjal/+ioZ3qGbHurzqWNDcsc2
	ksnVUXAyk6tnWsPNBHkXlwNu8fjSopoarxHUNMhsd6tC6E4VM8yG32ifw94Jc+I0G3NezKQlwKIyo
	+uQ2jY2wevn6Qvt2cZ/l5lHJ/1KZJDPKP24bVsFjGe/gLBsX4WFsGA18UUb6OfiuFmZfrg71C/mP1
	i2voRVUTvieF90omPwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBIJ-00000000oQG-0dje;
	Thu, 04 Apr 2024 00:49:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFv-00000000adX-3fGo
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f5ifazHbpOl/UA3v79b+PzDDuljcd/dBpmVrUfFdj7c=; b=wMG0a/FZ9DAaASXEBzW5JQkQj6
	P9nmqwnNuEnwVWwZ/XlsBbWDW4yZT/UEKVEGLRe+1tRAYhmkTqzgKugQ/LbZghfeoM/nGihJkecz1
	T0MDCESD60XUATWsuCb4B53gRFMEScrS5I/7O+HO6jiJRpyKV7C4Ei+hwdFzzrBXMqarPa7DYSq8t
	WXxX/UsdhWEYl9BPha9P/niIJa2iC0GzU0/FjSyN0e53wyJR3sQb+xJGL6pw/+SUch1XvjCTGkmzG
	tK6Nf9ezz+hDbMKvgS2tpS95KFpuVK4OVzaVFHuwup0kx+L+q1Pb9gLvRBtJI50ZAhBfi4+53Y5D3
	y8QkfSBg==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFs-00000006jYE-0DDw
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso31675b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187770; x=1712792570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5ifazHbpOl/UA3v79b+PzDDuljcd/dBpmVrUfFdj7c=;
        b=UVZXbL6FSm7UHpMc09Bgif/vvudkX6dvwSI6aN1vKni6IGTiXUOF/grtXgimAh5iy4
         Tzvgj09J6QSFqwZsU5cgkxNeJ9DlIILhmdt7L5KkBG+cCsQnwyLJsHCY1hPt/eL5zEjs
         3DOIX5/b6VqJTb1Xdt0xn8U25DdCTMyoo1s1am9wmM+dpyN2mFfCjQHwesEULOJO83Wy
         oA80MltXXOVQbElmJ5fyGrDoPMgWQpzAqZ4EjfNvEnujKk1bL453i5mGSJ1I5Atjs9Mq
         j+AKciUX76A3a5wpMPKtVDVWP8Fl3O727ynr17KHkkEN6HJeazbr5ZKLxZc7YUvmuC8v
         sXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187770; x=1712792570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5ifazHbpOl/UA3v79b+PzDDuljcd/dBpmVrUfFdj7c=;
        b=NJbG7jwE6YFqAlFBAjCvPwvE50/ODZYsW74tlLazYSsjEdVdIg7S8Fg8Ars6OXlKGZ
         MvIRKS1ArVTWZEHWfwRvHydcJnm9Uix6qd8C6bDxtUL/XAiyXD6vHOjP5oRB9NZIE7fx
         VhQzgjhY9vWg0FVsZt1OhOcjcHeFT1Exb9JVQukzUVuAm77LAXAfavPEp9nveWnqZUeL
         pYHjyuMgHkJqecIu1373OmPOkPKWvNhvd1WUmUKmqzoF3mKjAQu0bU6QQHVcBsD6EYJp
         DVvDZkmMn8pLQ0OStHupvoWQXlHBe03f8DPbBXgBIo+ev/P9XJ2KGfFXr8FcrbgDNzp9
         jB1A==
X-Forwarded-Encrypted: i=1; AJvYcCWfuuVCFgJHRCY0fDZwd1L3Ow7ctyDnsfihCIf1IAsrKuULxzXPQS75AaouJDKrHur7nNjrBD7h7tZtG4Ai7Av43mgLd2HS5fPBwfD6n8f4
X-Gm-Message-State: AOJu0YwZrZrMfbPy9lZFfkVbAE8WJ9Y+hBHS44fCV/hv7JS2F31RiyjM
	yvBodl8Y8C8rqMRUFGr0AYhAdFNn87JtX/k7JGwhvso6o33MZG2I5y2dKjMB3cs=
X-Google-Smtp-Source: AGHT+IFOcGirbQfLQaLb5+nO2ahsn6EhtiBDapL2BrJtt/8rvvrO0dXtCiXExOYOg70SFiumQnh5iA==
X-Received: by 2002:a05:6a20:3d03:b0:1a3:3fbd:f859 with SMTP id y3-20020a056a203d0300b001a33fbdf859mr1489558pzi.2.1712187769990;
        Wed, 03 Apr 2024 16:42:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 27/29] riscv: Documentation for landing pad / indirect branch tracking
Date: Wed,  3 Apr 2024 16:35:15 -0700
Message-ID: <20240403234054.2020347-28-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004256_109331_B9905C50 
X-CRM114-Status: GOOD (  14.96  )
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
 Documentation/arch/riscv/zicfilp.rst | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst

diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
new file mode 100644
index 000000000000..3007c81f0465
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
+`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` and is a HINT nop. `lpad`
+instruction must be aligned on 4 byte boundary and compares 20 bit immediate with x7.
+If `imm_20bit` == 0, CPU don't perform any comparision with x7. If `imm_20bit` != 0,
+then `imm_20bit` must match x7 else CPU will raise `software check exception`
+(cause=18)with `*tval = 2`.
+
+Compiler can generate a hash over function signatures and setup them (truncated
+to 20bit) in x7 at callsites and function proglogs can have `lpad` with same
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
