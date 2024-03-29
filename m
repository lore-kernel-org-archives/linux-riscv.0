Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298A1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmTnUfEEj8QvDKzK9I0QXG6cZTe4Uat8W3dLqp4Fl1A=; b=TwcMRM+Xp82gha
	nWCIVhzgu9kDvmd5aNl2sce8ht2k+RbWo0758CTQyQCxR7+ZMo+rLB1iMjKJF4GRE8TzP6CW0L0JR
	vOrrka7UwwWzvb7ZTrIMWBLdaUP/122uKdOepOw5h9eXDMCgrMwNGTHnGwXEDah9AGgPZwvSVtKbw
	o8cNtTvPeych0X7sIaCRiXot+4P9NwDGELe9a+lphNYSxZs3Yve/Kc92ykjaFtg1F5XWhCYQpUfue
	nidYiWCeh40VipIhb8VV+mLbWXQRIVj+hN5Tinhfex8AUPbohG/lEGVDQDfV3lYY4ERlCS3p7DTFG
	6BIEKfhQ2TcMu+RxO3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq483-0000000GnOB-2TCm;
	Fri, 29 Mar 2024 04:46:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47y-0000000GnIo-1FrW
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:08 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e8f51d0bf0so1448750b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687564; x=1712292364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I6BxlsTuM8aPnLudo3zS/ouO48NeQKH2Qm0sPb12tM=;
        b=KjSUHIJk8Corfjho/xyuMUB+D4ccte3d4YhKoRNVn3EOQnnDnlFo+Y9/lESRShjbFs
         fpxH+N93K4fSTF2tzX91BVRUhNZYJLPx3FhuyLzKNNbb6lcechgVdKOVa+3l0AnpkETg
         sDzYQ2VOrI60oWlWXuW0sdNO0g/2tyMJAkXSr3daA33xxFn/kZLlQKfTwYYc5fH3cTcq
         UAI/6tqdnhk6Gvv+O6VSwL/wiNGQUajQ/epsM6ykYUk7FnUyF2gMJvC8QYVDP/IVmnrz
         QMHPdC/whF5rBDtLVAqEbVWuNjhttaeR8Ihqwusbu9gCLPhBcp8feF1W98zm1bIfUubv
         Q8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687564; x=1712292364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I6BxlsTuM8aPnLudo3zS/ouO48NeQKH2Qm0sPb12tM=;
        b=vkORvt6KdDkmvhpQY5AjvwAw3yC5F/YXgbPCzqA0xXhxxs7wAT6q/GZmfUnrY3bahB
         KHIo320CpfA84pO/3YYj3cRNU3OYD98hoCibAnpphzBPJm+FFaeHa7wBoUtpB3FBbnEp
         xG8peZcNxAE62/XxjGCnDfIlqZDi3zDB5XHprHiqgk+8S4utI1QH0h8rA42ACvPtOM2G
         WBjI4oA8hPLldA8ah+Q35nfk1udq96d7C8Pz+Jb4RIQoZ+VK0Vrd+jgsj8z9c4jvB4Wb
         uLE7CmJi81AXfHaFv2ef3fYoE8xPd4pAe0PP99OAvEZw8CsR+iYnThDeuAKGGGM/KgA0
         7BbA==
X-Forwarded-Encrypted: i=1; AJvYcCVyK3F9DTsI9CKmoylF3DKKGcaimLMPV8VsFKhd2xlaVMDbCFKUos+9sJ5LFZwWBhwsfZ74ZIgdrhaqp1kexY/01dzwovk8//Om2+VBaE0e
X-Gm-Message-State: AOJu0YzYWekSZA1UnRCFVkV+LMg3/6M1gBqdfvOcCsn0eoj7Kxee9nWL
	+wcU1WCFes3G85CTUUIzCKZyXgKwWxdTkgAKCymSRFvTKcYEu+/+8DXJTq543vE=
X-Google-Smtp-Source: AGHT+IHE6usyMFBQxvFagxY/LvFEXsQVHbAuxvgF7MaJ2nwwxjQI5uC10jSUwmgfFjplPX6uFLGn9A==
X-Received: by 2002:a05:6a00:b46:b0:6ea:d792:b721 with SMTP id p6-20020a056a000b4600b006ead792b721mr1470047pfo.14.1711687564387;
        Thu, 28 Mar 2024 21:46:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:04 -0700 (PDT)
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
Subject: [PATCH v2 05/27] riscv: zicfiss/zicfilp extension csr and bit definitions
Date: Thu, 28 Mar 2024 21:44:37 -0700
Message-Id: <20240329044459.3990638-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214606_547581_60EB2382 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS while
senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target instr.
`expected landing pad` bit from CPU is recorded into xstatus CSR so that when
supervisor performs xret, `expected landing pad` state of CPU can be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index bbd2207adb39..3bb126d1c5ff 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -196,6 +205,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -216,6 +227,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
