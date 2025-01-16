Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB65C02187
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ixan5jrSQ9/FIDvmjnU3UE5sHtijRJksvjccRMu61c=; b=ixT18Tc/NpsKLy
	squ3sPRM4SuNQclac97AbD4dLjKXksienLt5hODFnRgIFb5t4ojW//PNYFbzc6cS8cx3Y0lr/O7LF
	1VEePDe/8TmwoLZjf8CKxNDB4fdfGNqXV5R36kCRiOBGo8VJCK/+bynq2tNKzX3pJOJfGXEjDhbel
	Dylk+5u+PgulRIdBYyQtTAgSJVRnG+esMRhdqga1t6uqaiEARnJ1DHVeMukzBcpQ8SXbcSKQC5DyR
	Ywl2GqlA49TYo7lbtheaCAb18Yl1epKl1Hr/1yarZTdRwMaziPdrkp94cBVLaH0HVSldIsE/aUp+l
	LnqUPl2HDxoqw9m+U1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0T-0000000GJj6-3zDp;
	Thu, 16 Jan 2025 23:10:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0R-0000000GJfn-0SGv
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436281c8a38so9734725e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069029; x=1737673829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iExoXWcsgpz1yiXKVDiuJsm//UYZR8b0hyvjPLZ7n2M=;
        b=wDu7s26l961Pimu+pXywJs75pcLYaMBKGvLwCWqHOr/JlwFEEkrSWde60O8s4iz/sb
         L5zyrtx0UDFo7M2WU7NR8ykcn11zgeQKuM+FYtPCBcv+6GJOfMsolgQWAFgD0897aF9K
         1ei8bK063MnNhlPjtEVhLs+GO2tGYaIIiGxuOSI3hPFCBTH4jsLr3hTKbGF1dmFsSmeA
         nDxKEDWihSjPsk7zQW4YwehpPyHtPRndw3DyyamPGJq/aY4m9TMpuVqhehI55qmLOpuC
         1W36qZdoShWZ8SR/gFilsgWqW6ucbcuE4Ox3XjGuxmcfoYEVXC+7Cu1As51EHBqFxSFB
         qSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069029; x=1737673829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iExoXWcsgpz1yiXKVDiuJsm//UYZR8b0hyvjPLZ7n2M=;
        b=nb37uFG/wB6hzs96+RVSwgy99K9uGq6JUCwRtxDuZagzxHjZrxiWVEb0X9Az0X7NNP
         zQVqWYYCygQatpq1tpkkq/3Hh0zO9nczPp5qO6EbS2Gx7trupRZcNoK3trkRiv7MtxE2
         v3qOj6j3lqp8qNhUlcgrfS5t65M3GEbJ0CR2O+Ot2/h1gUVVm7qwZQmx8NZ1yodPzK7y
         ZKvcIMLiZJlR/3C0CsfIKUg8AXwWB9jJ2G/3loXLP3AGs57wBj4W7vsKK4Q38xm5ThPg
         X67K+l+FVO5eFYMgAEUP6K0Scz06LkYcm26yHDkzmTwsM+PHS5c/KwmKP9a7CR2CtKOj
         ZBNg==
X-Forwarded-Encrypted: i=1; AJvYcCUTheMlehx5+mPKFeD8A0qpTfoTkHXQZslYMg6wQNeObKGtxP2iN2vHPRJaa+Q0CIzD5a4LcUrOXrOXYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfYGMYbkx1fw8sDzu0YQsWCJOHGF8JkBJM+yk5wTfsbO7fRbw
	nZRMMHOd8BCA+1S6JrspuXWtI8aiI+vxhDL728cHRuqcjhDaszmC7DWrlQDUFiY=
X-Gm-Gg: ASbGnctuRG+zQnk2XEgVQMobiOUwBQNNzBAx3/7vBtgIt9kcSJXPvPspCPU3JD7SiYx
	yXBhSBnNGSHc1+9PY82oHceDeENlPGaa+ED03/5aQif7BEjSO0kp4YW6bb5N5bosMK5YZCVSLYn
	KHcJSwH8pp+VrKysmVfsIOGTLaAu3E57k1wUVowOx3kJYVY8WXWEqCTLayS1dPxsYrKFn4eJ2uB
	iUHzXHpISzjOWHaRPFTTZK7EkkMiidrxwDfRx1j5JxSWU7EJypF1R4GDyyiLOxMblhjrHVzmf4T
	O2K5EKM0gqXFr3xr
X-Google-Smtp-Source: AGHT+IEE85RzZXgjKSxtatDeczrhYN+ZJtEmiy39XawqUlljd+N8P1eGO6eoSvUUxpVRipcUDt0wBw==
X-Received: by 2002:a5d:6d06:0:b0:38a:418e:1177 with SMTP id ffacd0b85a97d-38bf565531dmr377720f8f.11.1737069029362;
        Thu, 16 Jan 2025 15:10:29 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:29 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 2/7] riscv: pmu: Add Control transfer records CSR definations.
Date: Thu, 16 Jan 2025 23:09:50 +0000
Message-Id: <20250116230955.867152-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151031_144720_C807C60A 
X-CRM114-Status: UNSURE (   7.20  )
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

Adding CSR defines for RISCV Control Transfer Records extension [0]
along with bit-field macros for each CSR.

[0]: https://github.com/riscv/riscv-control-transfer-records

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 83 ++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index a06d5fec6e6d..465a5e338ccb 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -325,6 +325,85 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* M-mode Control Transfer Records CSRs */
+#define CSR_MCTRCTL		0x34e
+
+/* S-mode Control Transfer Records CSRs */
+#define CSR_SCTRCTL		0x14e
+#define CSR_SCTRSTATUS		0x14f
+#define CSR_SCTRDEPTH		0x15f
+
+/* VS-mode Control Transfer Records CSRs */
+#define CSR_VSCTRCTL		0x24e
+
+/* xctrtl CSR bits. */
+#define CTRCTL_U_ENABLE		_AC(0x1, UL)
+#define CTRCTL_S_ENABLE		_AC(0x2, UL)
+#define CTRCTL_M_ENABLE		_AC(0x4, UL)
+#define CTRCTL_RASEMU		_AC(0x80, UL)
+#define CTRCTL_STE		_AC(0x100, UL)
+#define CTRCTL_MTE		_AC(0x200, UL)
+#define CTRCTL_BPFRZ		_AC(0x800, UL)
+#define CTRCTL_LCOFIFRZ		_AC(0x1000, UL)
+#define CTRCTL_EXCINH		_AC(0x200000000, UL)
+#define CTRCTL_INTRINH		_AC(0x400000000, UL)
+#define CTRCTL_TRETINH		_AC(0x800000000, UL)
+#define CTRCTL_NTBREN		_AC(0x1000000000, UL)
+#define CTRCTL_TKBRINH		_AC(0x2000000000, UL)
+#define CTRCTL_INDCALL_INH	_AC(0x10000000000, UL)
+#define CTRCTL_DIRCALL_INH	_AC(0x20000000000, UL)
+#define CTRCTL_INDJUMP_INH	_AC(0x40000000000, UL)
+#define CTRCTL_DIRJUMP_INH	_AC(0x80000000000, UL)
+#define CTRCTL_CORSWAP_INH	_AC(0x100000000000, UL)
+#define CTRCTL_RET_INH		_AC(0x200000000000, UL)
+#define CTRCTL_INDOJUMP_INH	_AC(0x400000000000, UL)
+#define CTRCTL_DIROJUMP_INH	_AC(0x800000000000, UL)
+
+/* sctrstatus CSR bits. */
+#define SCTRSTATUS_WRPTR_MASK	0xFF
+#define SCTRSTATUS_FROZEN	_AC(0x80000000, UL)
+
+#ifdef CONFIG_RISCV_M_MODE
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_M_ENABLE
+#else
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_S_ENABLE
+#endif
+
+/* sctrdepth CSR bits. */
+#define SCTRDEPTH_MASK		0x7
+
+#define SCTRDEPTH_MIN		0x0 /* 16 Entries. */
+#define SCTRDEPTH_MAX		0x4 /* 256 Entries. */
+
+/* ctrsource, ctrtarget and ctrdata CSR bits. */
+#define CTRSOURCE_VALID		0x1ULL
+#define CTRTARGET_MISP		0x1ULL
+
+#define CTRDATA_TYPE_MASK	0xF
+#define CTRDATA_CCV		0x8000
+#define CTRDATA_CCM_MASK	0xFFF0000
+#define CTRDATA_CCE_MASK	0xF0000000
+
+#define CTRDATA_TYPE_NONE			0
+#define CTRDATA_TYPE_EXCEPTION			1
+#define CTRDATA_TYPE_INTERRUPT			2
+#define CTRDATA_TYPE_TRAP_RET			3
+#define CTRDATA_TYPE_NONTAKEN_BRANCH		4
+#define CTRDATA_TYPE_TAKEN_BRANCH		5
+#define CTRDATA_TYPE_RESERVED_6			6
+#define CTRDATA_TYPE_RESERVED_7			7
+#define CTRDATA_TYPE_INDIRECT_CALL		8
+#define CTRDATA_TYPE_DIRECT_CALL		9
+#define CTRDATA_TYPE_INDIRECT_JUMP		10
+#define CTRDATA_TYPE_DIRECT_JUMP		11
+#define CTRDATA_TYPE_CO_ROUTINE_SWAP		12
+#define CTRDATA_TYPE_RETURN			13
+#define CTRDATA_TYPE_OTHER_INDIRECT_JUMP	14
+#define CTRDATA_TYPE_OTHER_DIRECT_JUMP		15
+
+#define CTR_ENTRIES_FIRST	0x200
+#define CTR_ENTRIES_LAST	0x2ff
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
@@ -508,6 +587,8 @@
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
 
+# define CSR_CTRCTL     CSR_MCTRCTL
+
 # define SR_IE		SR_MIE
 # define SR_PIE		SR_MPIE
 # define SR_PP		SR_MPP
@@ -538,6 +619,8 @@
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI
 
+# define CSR_CTRCTL     CSR_SCTRCTL
+
 # define SR_IE		SR_SIE
 # define SR_PIE		SR_SPIE
 # define SR_PP		SR_SPP
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
