Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B11BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0l6yxE/LXnqLcXvC88aUU3mH0VVy+Lw+4F0hvQ70hU=; b=0T+dtIxnsR4X+e
	l13F5G3y60eQsY3ITiEySTQicdFpGJ+kpq9fwGvCh4hS4RHuGZw5mGOIP1g3Udn3BIu9NRrkZlZyr
	CqZC3KFpvs4Kk9ivv7M33QkP+6iekccXSDmatBzE5Yhyr+fDk/y8NcAGcqUZslKasYm+qkrrlBGSt
	Mi+xV+8asW8Y3PIw8FxHeoThs9ZC7iNOapVXLnpBRH/foBbUnb4OrigmrQGxaRMD3WerCmlmz2QOT
	7J1V3OkFyy3uUL94lGfjvYpveEEE6zAUufJw5wWti7IXU9SK0ao7QIbL/9qMLxmx+2NPDIT37AB8w
	IFlRG/DBvcgVKs3J2KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStET-006kkp-2A;
	Thu, 25 Jan 2024 06:29:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStER-006kig-19
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ddc1fad6ddso959251b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164137; x=1706768937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvIQkZQQe0K7W+Tn30d/DsUxvdwzfahlImuX+CJcznc=;
        b=zXp7LJh9Mr5HKGtRVG3Ew6RMYoDVHJXtUdAxKEWTQO3gUPnzVcVpXdkQLSlBYENVXq
         mtGRnqfZg9+zOxI1R6x2jd6T6w2JWVwZcZR32JjBZNPG3QiXDN/wTvERACKK3gw6OZth
         rEYUq7HtNjLBYuaxdRFtCma+t2RV4Z4vGsQQsaGLxX2EPaEdRO+BqRyjNyyQ9Hn+4VI0
         RFfxGWpppdKjECvIQCLVrSSd0dztl0Yey+yNUfWDayq+7XzZ2eqNIgDN892a8CdKZkZn
         fI+eCtiLiN50Kq6g91fTaQhOORNrcTH2MebNntURpbs0CHZMlmiVis5lxn37iemRe7ux
         JPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164137; x=1706768937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvIQkZQQe0K7W+Tn30d/DsUxvdwzfahlImuX+CJcznc=;
        b=BlzXT7aDP7IaAcGbWe295/Y6HzJ8oeSD0fOXGV3rN99e3Rn4Wb2HerPc/E8vp1wRfM
         37W5rT+XR3jTG+3fv6lPD3QQqpt0ZdyukNc+SzSycr7IPtH1/hc7GaqEVNQgcoWm3gxG
         cbHropCSxy4g2CqsLjAEUvCSK/RIeSvo9rNUUXbaZsKSZIHftHM+HcKpmBF1b9md4gBV
         CAE7SbjqColdss8GoIbZpb84hNSUJFM3y8QX4Uj/ZO1t+c3tQcyENSwN1nAKXi2jhrnL
         FkHnOkpeiNK2QzYQvVVri0qo4/HOXUHRMvXaIVckC7VEuyFHAdE/Sooz3E6KPmTLueQZ
         JAFA==
X-Gm-Message-State: AOJu0YzwV768VJ1LIRNpX9Wnps0/yw+yr2VNs2un9IVwl42SYX/bJTzz
	j3TiVS6I0uR6+p60w5JcL58xAhYbbeM481U8UqCQSt4w8A7J4cZ+p5YT+8Ny0ec=
X-Google-Smtp-Source: AGHT+IG62+/0zfbVEYbfQN+QJI5rZ4lnUWc92boKfqE+8XigV4+ljqSZM4hwNuU+ih2eIoSJ6cAqUg==
X-Received: by 2002:a05:6a00:2d12:b0:6dd:a004:c193 with SMTP id fa18-20020a056a002d1200b006dda004c193mr601959pfb.12.1706164137214;
        Wed, 24 Jan 2024 22:28:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:56 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 06/28] riscv: zicfiss/zicfilp extension csr and bit definitions
Date: Wed, 24 Jan 2024 22:21:31 -0800
Message-ID: <20240125062739.1339782-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222859_411463_68F48BCF 
X-CRM114-Status: UNSURE (   7.84  )
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

From: Deepak Gupta <debug@rivosinc.com>

zicfiss and zicfilp extension gets enabled via b3 and b2 in xenvcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS while
senvcfg controls enabling for U/VU mode.

zicfilp extension extends xstatus CSR to hold `expected landing pad` bit.
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
index 01ba87954da2..80fe38d5de4a 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
