Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15536C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cin1ldJdDPmIJJteR1liF2UZpvff1ImIdVXd9/ftSro=; b=biiSg+gByX4KCX
	31DAqTHpaw+CzV1QxFVOcAxKRwoIcIdZXCkZPUWN6u++CpnFTml8MOvd5prSZjj/wVjeczwsQkts7
	PW8nyWCuNEh/kMzUxBw49viukEOaZVJ89afss0KmGSIrIZvd8PKxyjqd2vUtQVxyjmODw0acuJZyq
	WMXWMkx5NJYtoIDpJ9wxdt4OrqSEGtDOhk52OgMxJt8KKc5KMciq2RPCfegr5n7PF3U0uZzWwoP3g
	dmUxpqlZT9/JxNYCFEhzPM+JQGN1MW94qH5RWsRr3mm/HV2elPD6j093ix3dd4k+ZnOp9gwU+zWlU
	l6LnvSnDPW/qtxx6OsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxy0-00000007J68-2kjg;
	Fri, 19 Apr 2024 23:48:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxZ-00000007Iae-43qn
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e4266673bbso24363205ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570474; x=1714175274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=BMUe9neBlgW8/pgf5Hr6QvHsOKI77nS1IiFl8mB8WG8A09inOffuIGxsCvUcRrEgVo
         2SCkNfYtHIuvIE/zImoWQzSagYkzFLRwBFt43+MCmr07PUtmZQa2bR0XieqcvHeZbjS0
         aZe5gGfhtK4yXDjZIrJWTKTLeBHjbkMeXS4ULPuqmyCgtXdWWN5BAPK9UbygqV5WPaQf
         ZM07AFWm2BwOLa4bJKkSxTVqS1v7C7ffVQzuWs6tWyD/1FxOzvwS/eU7k3JLEzBGMDe4
         UHpXoeskAEVD8vCuwgSYFIL6A3Bqn08wny7elVzU6NPuD2cDjuR+gaLAM74e5Xw9Rv9X
         KuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570474; x=1714175274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=mcMKu7Zr12i7LP+gLy19SXJesxC0SmSRbu5IAfTIXvoGf51lYz9d4mJdC1VO30+zfu
         PSaa7/dkOXD1zKyho9USrWQiK2cwxng4xiFZzwkh1+3Xoz5NDppERbZ/lLBJ9uftas/D
         TgjybbjWKhAXqMRRfkc/DuBgl8XH6bryZzPga9OSNt3UvHfNpGsp/XZLEsQz8qbZkUoL
         NUXLX9YKGMyoodrJpCzMhOeH3kkWCIob7j0gXdEePPMczMClS1A4d1oNieKeMVdNpV7s
         MV0be47vodl6PfcKAoU84XO26UYO3tvMhY0nG5/biewYwbtvF07lBoURuk4kjZ9wxInU
         SKZw==
X-Forwarded-Encrypted: i=1; AJvYcCWB5vod9gTYcViFRMpBBcQ26+CUjMvGTcNWBAkVixELrUBhhkVgBdr5BAgQ+Ff8LVptYyaSwqWbEECSlAS3gMRMKzv5PDt3fti/XbFc1bgZ
X-Gm-Message-State: AOJu0YxgdAYJaKVUcoG7c/vnpvTpiwt7w3Q7/i6USKe3LcrDj1qcwF26
	XIf493SXER/na0p/1RJWxSywmRu2+1WoA/ZxePzHTY89fnU95V3oU+0BiKBPFnk=
X-Google-Smtp-Source: AGHT+IFXaW6wZywudrszg7M9K7pzeD0F1Y92Mkq1wCwVh8jMOhVOOMocPyY8L0Q71C8UhuUv6rBj9Q==
X-Received: by 2002:a17:903:120a:b0:1e4:70d0:9337 with SMTP id l10-20020a170903120a00b001e470d09337mr4759283plh.45.1713570473875;
        Fri, 19 Apr 2024 16:47:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 05/24] RISC-V: Add SBI PMU snapshot definitions
Date: Sat, 20 Apr 2024 08:17:21 -0700
Message-Id: <20240420151741.962500-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164802_194630_C822B1A1 
X-CRM114-Status: GOOD (  11.77  )
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

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4afa2cd01bae..9aada4b9f7b5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
+#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET BIT(0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -285,6 +295,7 @@ struct sbi_sta_struct {
 #define SBI_ERR_ALREADY_AVAILABLE -6
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
+#define SBI_ERR_NO_SHMEM	-9
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
