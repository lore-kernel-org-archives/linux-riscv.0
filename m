Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80015CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TETJKE1GZg6wZJoyAVj3bLAMY3SF3fHFqLu8Np2k4Ck=; b=3ET1CHXK7YhH8k
	m0PnnPW0mKHeQpwMgo98jStzmPAn4RZaB5wTrjojw7nepUNpe5JGch3l3U6VetvpUiMWhv4pJu1Ca
	g5jrJoV/Vhxz8xkkheuKIUI5ZqL4r9zE+7Uduyhxa+O9QRr6+XhNbXjQt3JSGDQi+vW/0iPoBa7Vt
	jn5jCFXia+VJU21BJgj3K1p2fg9S1maxtYjZ0KhtSTxEgPiYWE4xPd+I+PZlc7CR54zfguRiJf13D
	zJrltXM1082VeWGJXXHuRgeecYmvBWf6fEgTnqvaI92Uj5AioHPs+nFGygNqYr9MB00yRMTDSFSuZ
	dkk0Glb/FMIiYYZzGreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq49h-0000000GoXs-481v;
	Fri, 29 Mar 2024 04:47:54 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48y-0000000Gny8-0Lo9
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:47:14 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5a4817189c8so1069534eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687625; x=1712292425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5ifazHbpOl/UA3v79b+PzDDuljcd/dBpmVrUfFdj7c=;
        b=BiMgEqCFU8VNkIhuSa2QDRsFUYLiDAsYaEXc89rr1w4guLLqSmLpxeQBuSc49/txhy
         LbMiKiyGnUVCrAqYKNOSl+yGp6ulrZzv6hUbaZsHL5g4azR+gXEvgm2rgGRQ2yA6bkBq
         KTC2rU3vxSfwwiLBvLAjrUjZzbBzBr8iM07jxMdozjSQnGB79WUYZ7QI7/Q1Am2OoBfM
         ++YoJM7gl57ObjBHgps709LaCT5YxibLerMrEgfLeLzoAjOlJACvwRCA/13MX4f4iljE
         13Q0KRC8c+gDWwoa6cUB5Z7rS9Xk68xtRdQ3ZBE4zRA/JxkwXbD2bb01CCYkrs1en+Fe
         Z/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687625; x=1712292425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5ifazHbpOl/UA3v79b+PzDDuljcd/dBpmVrUfFdj7c=;
        b=ePdv7cyccdIld7ms1bSQa6gGobIpsClsetsiDrY40PWH188Q8CSXzttt6xW8NLvNdM
         H03cAl2YFj4oZwzjko6WRJWHzyn6mp1uvO53NZfVgfP43ZU4MbEH8cRmCAnRZ2iAEGBY
         N6Mook2lVlZrYsgzApAvkKs7AttfIKyOS2TeehHX6wJ1wHGNoh/EPyfxTrYGbAchtmqD
         3eUz2h4d05TP8RYHHWE2RPmxkTQbMNyRrhkvpw4+gNIeapT80FMy5P2gtxOaYcHrnJQt
         KenGGGPzYElTZ8ro5r3HhIUmLMc4mb7DoD0cMytGwQsDyuaRYZCbJmU9nxSPWR4ateHI
         Z8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXGEWNuTnaowNhulDbc5rncUKF8MYM29YdGr6mp+aIRsGGi7ZPTkFWrH/bKrMJIP8hfpHLumMx8NDVAe3ukkOA9VfZPknZoiLGvj7wgQmNb
X-Gm-Message-State: AOJu0Yw1cpk/0U34M2nkEz1eacBZTeeTjOarZcOiWajm0+VGYFWz+Iwe
	B1TIoi/OjhKxEglSEsCFvgXCz67rtnfjOAm46onTi959xN6QA7B1EDtCFgCPmoI=
X-Google-Smtp-Source: AGHT+IErdAfZ2YKd7ZlzSeS592zYA4TFUt0LCB93K8r2LIl39Tat2IOKwkbBJaRLu5ZvxofXUIE51w==
X-Received: by 2002:a05:6870:3912:b0:229:819a:d2e6 with SMTP id b18-20020a056870391200b00229819ad2e6mr1199667oap.15.1711687625326;
        Thu, 28 Mar 2024 21:47:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:47:04 -0700 (PDT)
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
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
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
Subject: [PATCH v2 25/27] riscv: Documentation for landing pad / indirect branch tracking
Date: Thu, 28 Mar 2024 21:44:57 -0700
Message-Id: <20240329044459.3990638-26-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214708_665277_85D59129 
X-CRM114-Status: GOOD (  16.48  )
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
