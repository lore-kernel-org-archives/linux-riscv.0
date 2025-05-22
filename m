Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5F6C54ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aw8Ucfb9PbJloOaEA8oXM8En3DlX9A7CBhe9QwQ94tw=; b=p+OX0thbRZ/gVh
	cASDzYZK4ojT1jQA5/1OQY4701MlxlmEm9tEPm3idOcmUOA8Z23vtxECHJKT0Mrf+FolnkNiRXFFI
	J9Grly0ErZZ+M7PEC82kTIN5fLfNBty+2I+jJ4/cRbUze/rRMmx2dd7P4JN5tBzNz4smhx1g1AmgW
	9DuzoNxQ0p0AXsxMSpDU552EDbYFOKE2OTRYK7AgzoEF9npX3Vhlo1El2QxXKCuA6yp7fcTjjesqm
	nTVxmVXM1OTRm27+m84xufJZu3qky8AmQfrbu2vN+RcRCHfxvmHYrQv/CsDVC4reg0WBiR5a3tiIs
	Zwau5DkKaCQR2Jt2vtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFND-00000002SyM-1GXz;
	Thu, 22 May 2025 23:30:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIp-00000002Rj4-4Acs
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 23:26:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a374f727dbso3727968f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956378; x=1748561178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l53aiezq63VwGVulH0Yi9XQBVwtNa/T40ZWDbw9c1U8=;
        b=Cow7vN5O6XQbTZATuZ+JNrC3uHRCoqCoMMxXjvrMGtTHpNVJVhLdokDdCvgH5843FH
         IQb1oQippBW6HtQnWu2+wp2MxLzPPXXv/EzT7lZ0cYL4JR/wSxPvC9PsRIENKzk/zt+2
         esE6fgBHunq6mGUjt1T9YWfK5n16OV3KE7hZPu2UfKFBC/jb3xmR8QQw5RY7KDDhOP2o
         76Pz9oT+vdDFoU7PxAY++lu2VRxBBVRHFp8Ea4Y/M4PFeLPz4Siwq102CbFN9R3YpAce
         vYp+VRK/b9Nq6kifAP9d46ki5FW6jGQYLUdEtFCbztrcMzxqENI/A44IyR1rzDxNU6s6
         /9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956378; x=1748561178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l53aiezq63VwGVulH0Yi9XQBVwtNa/T40ZWDbw9c1U8=;
        b=tmdAChRDdawWn06lB+sPIV2TAlNUc48r1dxZj2eagSm5Nlo9YG5PdlVdDd5aHacpWH
         +F8KY+fID/TONKTkf5WvSl1tpL1zqU3W9t3HAUrC9LFo9AfFJQcrsKUtYwKFfmf/uAxK
         hlHSZAvBP1XpnVXdn/mRUi8sO4amUWwsKZgutbbH5ZrDiuPbnGQFI00ZNaf4TVOSnK/j
         CW2jWqkaDVSvMoifbbY5Jvij1w4UxLGPCWTOKZPFyHlnLnplgewjQIAtk10tI7bIQNFf
         NgddU+SNOfNMOk9PI90WD9ma9K4kP+Y3oN8ZIGvWDvSosh9DuxyJsazu5hY1+e0TDtaP
         pIXg==
X-Forwarded-Encrypted: i=1; AJvYcCW9yOcUm+QM2awGp0OfVew4bbSEiqoRpeCLeVofe/q30lDCpcQFAQ0kjl5q/YOPG7PqXnKNafEffU5Bag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVxPzfcfybgTuVMWhMuBoLirDziLE4qkrsvkZx8YCAwO2F8TF9
	wMt7itu4Kfo7wbXD8ACIWnNnhsk68IJZfBbpW5N31Il+8trxzHhX0bcBO4hJkY3WEEs=
X-Gm-Gg: ASbGncuUNrfhVdSnx8k+9M8KXvjiPwbOlo/CWcI8zMzZh1dG1Oamz0EL4E+8WqWN6th
	Q5AVf1TaFPWdsJ75zRFIxv2WyjYrfcON1QGUPNxluBDX+K50CY2NXLW6DsWGh3sf8z319BiAL9H
	pwJZTI5/enm2/cX2xY0gMGnrXqBvbu7SD1ZZq2LsuCnbSxuwL2gmsR6wWRzpXXcNmtpsVDly0yI
	2T7hN+v0XJr9GKF4Duo2UPNcQWvqxVhTHXAHqGNGnJzJ9vsYTwYa7EhcRxN60cNXIRmJrbfIGd7
	vlSz6MuGozl8m8nbe3jTwq0jfHgNWMgX42BCcjRMFwFnZz5PKsMyZA==
X-Google-Smtp-Source: AGHT+IHAmL4SGVYuRfQdx4Te1SZB2AHBQgY26GyZwg325ZZdeZGi5gjiCaXcu6MypqA+Dk0jD2u8ww==
X-Received: by 2002:a05:6000:2903:b0:3a3:6f26:5816 with SMTP id ffacd0b85a97d-3a36f265984mr15292194f8f.36.1747956378244;
        Thu, 22 May 2025 16:26:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:18 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:08 +0100
Subject: [PATCH v3 2/7] riscv: pmu: Add Control transfer records CSR
 definations.
MIME-Version: 1.0
Message-Id: <20250523-b4-ctr_upstream_v3-v3-2-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=3834;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=FOp1y09/3SytdmvNsRNI8bjrwNGWBMKFRpE30aP/AEg=;
 b=VAKiiJbUQk/CKnHQk537iR4eh6srfGqgxMprrnILqLhhp+3+U+RkJeqfMk302Xmwyi5fnxrYd
 Ogwp9C565GICK4Ub/rWcyt+4/fWPFEieJZE2YOTuQ8gYHwDi31VfK57
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_162620_040134_83A9501B 
X-CRM114-Status: UNSURE (   9.40  )
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
 arch/riscv/include/asm/csr.h | 83 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 8b2f5ae1d60efadbec90eab4b1a3637488a9431f..3aef621657603483e1cafd036f126692a731a333 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -331,6 +331,85 @@
 
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
@@ -523,6 +602,8 @@
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
 
+# define CSR_CTRCTL     CSR_MCTRCTL
+
 # define SR_IE		SR_MIE
 # define SR_PIE		SR_MPIE
 # define SR_PP		SR_MPP
@@ -553,6 +634,8 @@
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI
 
+# define CSR_CTRCTL     CSR_SCTRCTL
+
 # define SR_IE		SR_SIE
 # define SR_PIE		SR_SPIE
 # define SR_PP		SR_SPP

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
