Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220FEC07CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpZVlz56zTrkln9KiEV+kFM6bBu16ltMiuYVsm0hDqQ=; b=YI4Hb7eOYwnocu
	1Ba1LaoWCWnMcBUX/VXbTjTWwK30jg4GZkFZffEMLLMSZRiugnaAhNcvI89jcDi7l8I4sWofQvrJc
	dltXJ5Snym3WGLtCaEOi4be8LPBpdqwMBgd6WTZrhutUw78GsqK5ExZyvmMhqNJDT6plaFjmHKyMF
	HnQMd7XYYS0sAbSB957ij3ZW7ReUBmo4pTK7gLeqKQ6wIQaKoD2JqqZHFJmNr1H0GJphbZtO89Ja3
	FwzWdMw/cKj04lEy2B1nlOFtKY1Zyq7xqsojrSnmcIZrRY7A2YRynOoUTT0pH0oBJEW09hVzHaXjO
	AOFf7QltzkB4lLnqfVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTc-005ZAe-3D;
	Tue, 28 Nov 2023 14:54:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTZ-005Z8v-34
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cfd04a6e49so17419425ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183252; x=1701788052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4m04trocO8QoZj3cdN/f9S82XI37vaZYUmcpO0zJtiU=;
        b=Y6PbHBGpj5pvCLYu4O0RAukMtrESZ9Y63TKOkDmftkwDsxVAaMSliZDftQHGmGrFuC
         oWHcnEBFl7O9pT9VvvjS5qDDuEKeBATwxuDy63ngy0dLuRpgSB1/3zSbx0LJkf4uidKg
         pGmwkIhr6l+3eWo+U1RfOm3QmIQp/bWUfLdYH6DneJE0HeNPhY2MQHkgA6Yjg+YhwJRU
         YHQGAQ8D8uKlNr56LKNmcnb3WwpSTgKdS0JnRizaVx+9CDN719iYJ69IeTG5ttVOplQy
         GBCO7vwPS5DG7mGEJ4sAPz5tG/VehtRtxgsZMjSaq3XMHG9KokXuCzErR83yP++DPu6o
         cyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183252; x=1701788052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4m04trocO8QoZj3cdN/f9S82XI37vaZYUmcpO0zJtiU=;
        b=TmVty1T4fLmRyqFg4UDFm4C5dKp256Tbs62t3/lTUZ/et1vvF31qjvg8cK4ftSIXhS
         0xN1JnkvBpNis0uWweoDmpGP+o1OTWj+Y3a+0N6bpKkvcABfYj0UDd/4tmmGzYpG0gxW
         03uxMwxYPLuaMy2ZWMg937DPQsnlMhtBPuUFK1Ji8cKCX1zrJ7RpkKpSYVucVcqXTib5
         2FhCUairXBXAZ6w9h7eOhohKvEaj3PV7pD7bE4E3fhcOuyu0Kw8JhV0roNbPgXSchYwA
         M+ztHrhIxR3wAB972rU66N0HYGIaF2ZXR+4jZoyzgPbz8TrLeQsczHqm5++JcsW+w/Ps
         eHCQ==
X-Gm-Message-State: AOJu0YxvR/MP0Pkv1VTYNPnuNNhKyAiak9x9Xt1ZiKaLZEfJef8cPnBM
	Tm/70FwcLbv56iC2uKDc1nQ9YQ==
X-Google-Smtp-Source: AGHT+IGXuZ+iyvAlrX/pLnzURWVAdu7BmENdq5XZ42sO3dIOOkgu9oI2dJBaf36rifwZKEx33JRxYA==
X-Received: by 2002:a17:902:ce90:b0:1cf:d9b5:5aba with SMTP id f16-20020a170902ce9000b001cfd9b55abamr7712485plg.30.1701183252164;
        Tue, 28 Nov 2023 06:54:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:11 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 01/15] KVM: riscv: selftests: Generate ISA extension reg_list using macros
Date: Tue, 28 Nov 2023 20:23:43 +0530
Message-Id: <20231128145357.413321-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065413_990667_C1A32B63 
X-CRM114-Status: UNSURE (   9.56  )
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

Various ISA extension reg_list have common pattern so let us generate
these using macros.

We define two macros for the above purpose:
1) KVM_ISA_EXT_SIMPLE_CONFIG - Macro to generate reg_list for
   ISA extension without any additional ONE_REG registers
2) KVM_ISA_EXT_SUBLIST_CONFIG - Macro to generate reg_list for
   ISA extension with additional ONE_REG registers

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 331 ++++--------------
 1 file changed, 76 insertions(+), 255 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 6bedaea95395..b6b4b6d7dacd 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -581,10 +581,6 @@ static __u64 base_skips_set[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
 };
 
-static __u64 h_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H,
-};
-
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -595,54 +591,6 @@ static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
-static __u64 svpbmt_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT,
-};
-
-static __u64 sstc_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC,
-};
-
-static __u64 svinval_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL,
-};
-
-static __u64 zihintpause_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
-};
-
-static __u64 zba_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA,
-};
-
-static __u64 zbb_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB,
-};
-
-static __u64 zbs_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS,
-};
-
-static __u64 zicntr_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR,
-};
-
-static __u64 zicond_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND,
-};
-
-static __u64 zicsr_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR,
-};
-
-static __u64 zifencei_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI,
-};
-
-static __u64 zihpm_regs[] = {
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM,
-};
-
 static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1),
@@ -733,221 +681,94 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
 };
 
-#define BASE_SUBLIST \
+#define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
-#define H_REGS_SUBLIST \
-	{"h", .feature = KVM_RISCV_ISA_EXT_H, .regs = h_regs, .regs_n = ARRAY_SIZE(h_regs),}
-#define ZICBOM_REGS_SUBLIST \
+#define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
-#define ZICBOZ_REGS_SUBLIST \
+#define SUBLIST_ZICBOZ \
 	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
-#define SVPBMT_REGS_SUBLIST \
-	{"svpbmt", .feature = KVM_RISCV_ISA_EXT_SVPBMT, .regs = svpbmt_regs, .regs_n = ARRAY_SIZE(svpbmt_regs),}
-#define SSTC_REGS_SUBLIST \
-	{"sstc", .feature = KVM_RISCV_ISA_EXT_SSTC, .regs = sstc_regs, .regs_n = ARRAY_SIZE(sstc_regs),}
-#define SVINVAL_REGS_SUBLIST \
-	{"svinval", .feature = KVM_RISCV_ISA_EXT_SVINVAL, .regs = svinval_regs, .regs_n = ARRAY_SIZE(svinval_regs),}
-#define ZIHINTPAUSE_REGS_SUBLIST \
-	{"zihintpause", .feature = KVM_RISCV_ISA_EXT_ZIHINTPAUSE, .regs = zihintpause_regs, .regs_n = ARRAY_SIZE(zihintpause_regs),}
-#define ZBA_REGS_SUBLIST \
-	{"zba", .feature = KVM_RISCV_ISA_EXT_ZBA, .regs = zba_regs, .regs_n = ARRAY_SIZE(zba_regs),}
-#define ZBB_REGS_SUBLIST \
-	{"zbb", .feature = KVM_RISCV_ISA_EXT_ZBB, .regs = zbb_regs, .regs_n = ARRAY_SIZE(zbb_regs),}
-#define ZBS_REGS_SUBLIST \
-	{"zbs", .feature = KVM_RISCV_ISA_EXT_ZBS, .regs = zbs_regs, .regs_n = ARRAY_SIZE(zbs_regs),}
-#define ZICNTR_REGS_SUBLIST \
-	{"zicntr", .feature = KVM_RISCV_ISA_EXT_ZICNTR, .regs = zicntr_regs, .regs_n = ARRAY_SIZE(zicntr_regs),}
-#define ZICOND_REGS_SUBLIST \
-	{"zicond", .feature = KVM_RISCV_ISA_EXT_ZICOND, .regs = zicond_regs, .regs_n = ARRAY_SIZE(zicond_regs),}
-#define ZICSR_REGS_SUBLIST \
-	{"zicsr", .feature = KVM_RISCV_ISA_EXT_ZICSR, .regs = zicsr_regs, .regs_n = ARRAY_SIZE(zicsr_regs),}
-#define ZIFENCEI_REGS_SUBLIST \
-	{"zifencei", .feature = KVM_RISCV_ISA_EXT_ZIFENCEI, .regs = zifencei_regs, .regs_n = ARRAY_SIZE(zifencei_regs),}
-#define ZIHPM_REGS_SUBLIST \
-	{"zihpm", .feature = KVM_RISCV_ISA_EXT_ZIHPM, .regs = zihpm_regs, .regs_n = ARRAY_SIZE(zihpm_regs),}
-#define AIA_REGS_SUBLIST \
+#define SUBLIST_AIA \
 	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
-#define SMSTATEEN_REGS_SUBLIST \
+#define SUBLIST_SMSTATEEN \
 	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
-#define FP_F_REGS_SUBLIST \
+#define SUBLIST_FP_F \
 	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
 		.regs_n = ARRAY_SIZE(fp_f_regs),}
-#define FP_D_REGS_SUBLIST \
+#define SUBLIST_FP_D \
 	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
 		.regs_n = ARRAY_SIZE(fp_d_regs),}
 
-static struct vcpu_reg_list h_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	H_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zicbom_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZICBOM_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zicboz_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZICBOZ_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list svpbmt_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	SVPBMT_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list sstc_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	SSTC_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list svinval_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	SVINVAL_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zihintpause_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZIHINTPAUSE_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zba_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZBA_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zbb_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZBB_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zbs_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZBS_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zicntr_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZICNTR_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zicond_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZICOND_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zicsr_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZICSR_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zifencei_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZIFENCEI_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list zihpm_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	ZIHPM_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list aia_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	AIA_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list smstateen_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	SMSTATEEN_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list fp_f_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	FP_F_REGS_SUBLIST,
-	{0},
-	},
-};
-
-static struct vcpu_reg_list fp_d_config = {
-	.sublists = {
-	BASE_SUBLIST,
-	FP_D_REGS_SUBLIST,
-	{0},
-	},
-};
+#define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
+static __u64 regs_##ext[] = {					\
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
+	KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_##extu,	\
+};								\
+static struct vcpu_reg_list config_##ext = {			\
+	.sublists = {						\
+		SUBLIST_BASE,					\
+		{						\
+			.name = #ext,				\
+			.feature = KVM_RISCV_ISA_EXT_##extu,	\
+			.regs = regs_##ext,			\
+			.regs_n = ARRAY_SIZE(regs_##ext),	\
+		},						\
+		{0},						\
+	},							\
+}								\
+
+#define KVM_ISA_EXT_SUBLIST_CONFIG(ext, extu)			\
+static struct vcpu_reg_list config_##ext = {			\
+	.sublists = {						\
+		SUBLIST_BASE,					\
+		SUBLIST_##extu,					\
+		{0},						\
+	},							\
+}								\
+
+/* Note: The below list is alphabetically sorted. */
+
+KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
+KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
+KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
+KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
+KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
+KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
+KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
+KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
+KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
+KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
+KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
 
 struct vcpu_reg_list *vcpu_configs[] = {
-	&h_config,
-	&zicbom_config,
-	&zicboz_config,
-	&svpbmt_config,
-	&sstc_config,
-	&svinval_config,
-	&zihintpause_config,
-	&zba_config,
-	&zbb_config,
-	&zbs_config,
-	&zicntr_config,
-	&zicond_config,
-	&zicsr_config,
-	&zifencei_config,
-	&zihpm_config,
-	&aia_config,
-	&smstateen_config,
-	&fp_f_config,
-	&fp_d_config,
+	&config_aia,
+	&config_fp_f,
+	&config_fp_d,
+	&config_h,
+	&config_smstateen,
+	&config_sstc,
+	&config_svinval,
+	&config_svnapot,
+	&config_svpbmt,
+	&config_zba,
+	&config_zbb,
+	&config_zbs,
+	&config_zicbom,
+	&config_zicboz,
+	&config_zicntr,
+	&config_zicond,
+	&config_zicsr,
+	&config_zifencei,
+	&config_zihintpause,
+	&config_zihpm,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
