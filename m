Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3637ECD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JYl5xrdvQHUjeKJGoNgpO7O+8HaWi5uNC58UQ53MUs=; b=ksclZmGqtTl7aw
	KvLo1jh05TNbfxSZcTcHG9eVPYRR8/NkYOnEr0qQqQsF9seHHUXe0HT3f/nrN8YPimt68AIUJWI5e
	6LegdwHGLeDCLy1UYl8B/RjQf+9hwmv0qWBnVb1tRueX3WGRX0/jWr3OyqcnvEORjf4d/2fb2JfJN
	QpDqJISvnXi3W8gRDflhZw5Rak2bZclPbsS4OurWiDKGdCPr9zO5q4vs6YCZOWnH5GAZlaCdkl2LK
	655qlzAusPpWg/V6fpoZFhMf/kdPunbzzyq1jC9qFVv3NY07pAMjdHO0dVJ4m9QkgA/kadq8SJu98
	vRzQuRjRNBLus2r4Y1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEv-00000000ZbO-2o0m;
	Wed, 03 Apr 2024 23:41:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEm-00000000ZRR-0I54
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e0878b76f3so3541755ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187706; x=1712792506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eUDSnaDyxqGg81dPEndGGDTB0RLZ2EAet5NZFMb2JI=;
        b=gJfQDnGEGQ8UXC3qHQb/od5ku9vcOMvJpOMiBp2j6ZyOMBOrN4e4kkht8osK6c1YA4
         1jKCbpvaLobYGpTtg3ABkqqvJk4tfBnpROo6QhuWPh5cvts+COiv6Rijl4vWpvOzIU2Y
         3u4LsQvOFySUrXfswMTImcBuX9trn/Lcqqd4aKP7G3Bg4J+XzHcYPWFyEwnyXJ4UxKDO
         uKAtLXgeSDSPBNF6kXrIGqNjoeLJugKuMfS6wT+WZp3rGR0Fk9YwsWYkWksWeTziSPMM
         0lq2wVUSW5IuOu4gCM56tU2zyMqeOA6jaCXG1XcIinPmsDCSTcFcjPUB1vqngf8Er4MA
         AudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187706; x=1712792506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eUDSnaDyxqGg81dPEndGGDTB0RLZ2EAet5NZFMb2JI=;
        b=DToRt7xhtrF4hPW0XQ62ODEMsGx0nePAW3j28oyGR69takLTHJYjUc0uHXoTXPsN4Z
         5UB4Fb5l/spu7M67Nc/FJtRL4hUippTinX155goXRuy6fFM2WOiNKToqQJHKCJDKRxTm
         hhHXVPHvqbIchnznwKWfmH7MQtrtBco+AHmwVqiGIeL+v7C40jVG/a1AGizQ4YUEYqYd
         PUfs+z3FUSEEzgggAru+DzYGPEO6olFR8gJdSKuMtuka8z9tb/MHrdUVkm6i76RrlfHB
         qKYrEuOsbFXBngeZLGypUUHZ5h1RN7K/HO5Ck2emJLT/kvOClT51ykAB9AJJz9e30/EW
         L3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWo0P9IUMRAq1jIeuRoW4z7oiYwQCyvChRbBBQ8ivbWakQrioc7ZR6dZtV5TCpquzXxpfaWhJu6Z5dezWmsfb94GdF4f+u9njxKDGWLYIgl
X-Gm-Message-State: AOJu0YxlOKAfgMmQnr+JyCkseMEmmC8Y8Or3fXjNYA95HX7oTxljRFkF
	/Ok4au0KHQm+3rSK3qTThW1resGbmrrVBybJshhN4ZR2YScvzhoWNhZnDqxc+8o=
X-Google-Smtp-Source: AGHT+IFyjyOK4imuMufx/V8FtRsE6RLkCpoEsDyebREmag+E/YQOk+Aiq+uxRiaeRtydulTn7Ig+Gg==
X-Received: by 2002:a17:902:d2c4:b0:1e2:a61e:47fa with SMTP id n4-20020a170902d2c400b001e2a61e47famr1344360plc.15.1712187706092;
        Wed, 03 Apr 2024 16:41:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:45 -0700 (PDT)
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
Subject: [PATCH v3 06/29] riscv: zicfiss / zicfilp extension csr and bit definitions
Date: Wed,  3 Apr 2024 16:34:54 -0700
Message-ID: <20240403234054.2020347-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164148_301556_193EE44B 
X-CRM114-Status: UNSURE (   8.41  )
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
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

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
