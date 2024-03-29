Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925FCCD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmLtdyKhJ/HEKGiMQL4Zgz92kBNB22GOIPSrkSZ0n64=; b=JVbFwbE4cd3b6/
	1bSxQ+SXeluYlqj68tRvau3M7iKQOFoZvohNgFtdsC2Mn9D8EpQ1I7n0+8ZFw1xdF/FGEajZwPpAe
	a12l62EQxszY1ppVAe2JUiMH17lbTCELtDUpzRo66mBcmSrfRYhaJe9GQVcIxL83CVKD6r47EI5Bp
	eOnajM02lGbzHtwVG2T+DBzJVqt05kUUbbqQGxxIhrbtf5Ls2GS1SMvEFlIht4WWBHdbv3c9H6KBe
	t2tAZqTJFhmIOjEliVuGyUqmfER7Z/WozqYWODb+yt9vWbcWW5AVV/xmJ4njkQp3LNFqHqqy38yLh
	PphQ3r7mM9OznelBvyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq49m-0000000GobH-0kOe;
	Fri, 29 Mar 2024 04:47:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq495-0000000Go5V-3kTG
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9MOz30J7VxjH8ZagxzRr7bVMOq1rQVKKUTnSRMNh/j0=; b=iTiIBxl7l24qi42jZztoN51bXK
	Q0QpeEovxTKBTuDzRxf4vmWMqZ7yA17wDLgCBrsmqt5pPWsCuoMLE5ms4OTFENlmYnyRZszmEeRTB
	MZbOgMbbFS8/T/h5Byn/wr0BwI01uZbd3flkao0yhJPU2oA/edzHXqBVUypZTXrRof+GWedY1ZXF+
	Uhttsh4A9u2/nuzXEQ0tQG9Y+fK8RcXcn/Iw7nNIYCKNcMhGBV0V4MDhTvH2//i2xA5J/Bns2+71P
	DUpFyivaQosKpYG6R0ofT3AaCNMNaHDQO2+lCya5bM98kO0vqc4k/p9iPhTbP9OuazFm9Kg2KtB2y
	9FWGa4eA==;
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq490-00000001MfZ-2OGR
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:47:12 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-22215ccbafeso928862fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687628; x=1712292428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MOz30J7VxjH8ZagxzRr7bVMOq1rQVKKUTnSRMNh/j0=;
        b=smK00Kk8x1SfpArMh+Dc2l7vcDuYu6ImhTyadAVQYxw3RluFBv9SfJgVq5CSAkmwNZ
         xNGBBqHOnGyEYdzHRX3+akOqnGsA0AxqpzyiRfV8iz3qRZCKRJjOYWTopzZ0D0G4dnlV
         m9R3nu9NgCnC62ns9myVD5b1pUbVcGGlT+C0s+st4ReqiAzmsf70GpYEe4n8znD3+HR1
         VQT3R5ZtibxyM//L7eiAlVoHhibB7+GwdJ0sc/0flPW9TBBS+YJq/axe+jKSKN9q6EQ1
         L1wV+2TCcp6DgI6aTOBEuRHLiDZ/4OgtDFEogo3W0Sl6xeYJdghXPp4bwSPX/ndw01yg
         aUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687628; x=1712292428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MOz30J7VxjH8ZagxzRr7bVMOq1rQVKKUTnSRMNh/j0=;
        b=UNfvGf4crBP53zH+lswtYObbq7uyX40HKdPUWDnVq9L8cgsL07yaoMNBcIxAkCWms3
         8YtyGTP72mmePMUIiHZgnbo4r3voJIXKaQxmKi6v3FB1vYtCgZq5FVpAAwVzq+bRvoKF
         s7YSKuCqzyB1sIvx7qVJdeprM6jVx3xYqAK7nFWh6jmjuhkNSPnkDScDTHBJygFuxMR7
         WSqiDzLobtdQ48g9PUEH6no2UCnTfsnnFP28D050REz40xkCabQmLJ2lbxOEYFJf5A8F
         uDJetiZxfK3AjSbFLIHgbpfIFTtNR5xX10ep7X9mmUxx08116REKYkoKslDAb6dtnwoV
         NMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+QYiJ2C1tJT5DvjuDD64aIwTlMcQeAoGy85rWm/QS37iiTMdquEvmXRRk4LyzRegYi6rreTi07BKccKaNNi/klsqnjct8zHdru9O15KAy
X-Gm-Message-State: AOJu0YzQwEl00mhRN0Iyo5gT4+fK1PgbFZ5ecEl5ZPfpEf6S13GNeq2Y
	euKKc5YMAMXOJGIQBh8ldTQNXU/SUSOi+IN2U4iGWyq/MqLnYeg1XTW4wHsg/cg=
X-Google-Smtp-Source: AGHT+IGB+y7twcpxmoV8AXjju7qFPWK1mID4DF6lwVek2eRahswiUwgjJa6zI5wt5U4lG69wDyeurg==
X-Received: by 2002:a05:6871:410b:b0:22a:9e26:4789 with SMTP id la11-20020a056871410b00b0022a9e264789mr1115705oab.13.1711687628350;
        Thu, 28 Mar 2024 21:47:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:47:07 -0700 (PDT)
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
Subject: [PATCH v2 26/27] riscv: Documentation for shadow stack on riscv
Date: Thu, 28 Mar 2024 21:44:58 -0700
Message-Id: <20240329044459.3990638-27-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044711_218625_CDFF52DA 
X-CRM114-Status: GOOD (  21.22  )
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
