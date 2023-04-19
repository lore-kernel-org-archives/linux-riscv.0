Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67711C7EE20
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQi6bs1ZZsGr2pYeMxARhsqmJl/cl8Y6iGRvf7Y3geg=; b=IRVDasuaWOcSFy
	k9xFRzvU6VjLGE9tqHafjcJQ1oQI2SgAXOEmqh/AqOSF/hM4ncJSh11frE+IYlpl3UIuhWDhGD/Eu
	cqPfwlTBzM/RkXr4+l/jDEwmcnfJDQfQ0FVqAw1DWY5lZ3pYCabUdSDgto5p2Ga9XE+F846EqYI5R
	RrRdqAMMuy6SMaMLu8NB8WzFtg1Bmi77yAs5jJVMPCwb6CeDDxeQ8iod5iplpfu5doaV7+4Kmk1jF
	aJeoJfzgKuGk+opajrKHXMuE7kmb+kj2O9/SkDXyK0sXbqrlTPOekc8Xg4UVDXFt6zVWOq0dmxgrL
	0FejUuinH3ZhFh7jw+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hf-0058Ab-06;
	Wed, 19 Apr 2023 11:10:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hb-005882-1W
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a52667955dso35500515ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902618; x=1684494618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erF7h0FFrrflFOP1De39iTiQwqZxcNsKEc8OIQm5UJM=;
        b=wz3bVzECh81V9P/8eSWWBlXF/ppb7Eo6YzU8zyukUtrt3VzZ0IEpHBtlfje9DVEk8A
         WgQ43IxHuPg5JxpS+AeX0+JDT9BXNewP9GBxLEbdYftK7bLLCUGMUBxE7QFEhweo+hXs
         ikPvUAgfl+FTTZIHdjmvg1mvLBoejr44HJSj8MVhg6jkkNQb0V/xq7HvECgQM+xvxg07
         /rhj2VeNHkSdv02dw84Cnm0BPWlGc4/tYeOszJHSqvjMvIJoOYvVzIpUznLiSKPl9ow8
         IW5VIWbPwZJgWUbhYU2YozHm+nuM/R3jyKv8aDekyuNVAe3ivBaYboWEbeNyyV528ZgP
         kQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902618; x=1684494618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erF7h0FFrrflFOP1De39iTiQwqZxcNsKEc8OIQm5UJM=;
        b=IoO86J57w7i+PHVqDNagA9+Kp2ZKyZiSD0ezcwcZXa8VsyEvv1sUSyLT0+QHenO83p
         ulEAF+DeSy/EV/TuXd5LOH8TX6PRmKKPxYatFN5QNmdGHWTtlnkHQostG+a4/2BNxJXP
         0iLu+D9r/GRaEhJmLq0YGheneIZIybsraMhwoZEXuWPdGDdXo8q8nwbY9pPUDz07Vhv/
         crlzt/pzoXu3sX2zQJYz4kOv+v7A0DRkFLkTt2g1p81CWQGMQCNsZRbjk0hmFL6sg1nb
         5q1U/vecJt1avFk9VnFsFJVGBgm6ganSrlrSNzu0qtmQyIpISrOzTvIbTyT/tOZimILv
         hG2g==
X-Gm-Message-State: AAQBX9fNp6NeUx27igZ4fWjYuxZDuphYH14I0B948AtrFYzttRVri2MH
	aPXgxhKqfFXEOgSBnZS0nLFEOxhvre0DEjRDiJw=
X-Google-Smtp-Source: AKy350ZRSZ8md3xymsWabEgKJyV9SXGwr0uyWNsabbIVXDib5OEDsFleXNsdFcITKR6mAw9AfBngJw==
X-Received: by 2002:a17:903:41c2:b0:1a8:106c:4a1a with SMTP id u2-20020a17090341c200b001a8106c4a1amr3748412ple.1.1681902618470;
        Wed, 19 Apr 2023 04:10:18 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:17 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 06/21] RISC-V: QoS: define CBQRI resctrl resources and domains
Date: Wed, 19 Apr 2023 04:10:56 -0700
Message-Id: <20230419111111.477118-7-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041019_520130_78E1A741 
X-CRM114-Status: GOOD (  11.59  )
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

Define data structures to encapsulate the resctrl resource
and domain structures.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/kernel/qos/internal.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
index e07d7f92e206..a3ed98ce5dd6 100644
--- a/arch/riscv/kernel/qos/internal.h
+++ b/arch/riscv/kernel/qos/internal.h
@@ -65,6 +65,11 @@
 #define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
 #define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
 
+int qos_resctrl_setup(void);
+void qos_resctrl_exit(void);
+int qos_resctrl_online_cpu(unsigned int cpu);
+int qos_resctrl_offline_cpu(unsigned int cpu);
+
 /* Capacity Controller hardware capabilities */
 /* from qemu/include/hw/riscv/cbqri.h */
 struct riscv_cbqri_capacity_caps {
@@ -127,4 +132,26 @@ struct cbqri_controller {
 	bool mon_capable;
 };
 
+struct cbqri_resctrl_res {
+	struct rdt_resource     resctrl_res;
+	struct cbqri_controller controller;
+	u32 max_rcid;
+	u32 max_mcid;
+};
+
+struct cbqri_resctrl_dom {
+	struct rdt_domain       resctrl_dom;
+	// NCBLKS is 16 bit which is 2^16 = 65536
+	// If each bit is a block, then cc_block_mask could 1024 times 64 byte
+	u64 cbm;
+	u64 rbwb;
+	u64 *ctrl_val;
+	struct cbqri_controller *hw_ctrl;
+};
+
+struct cbqri_config {
+	u64 cbm; /* capacity block mask */
+	u64 rbwb; /* reserved bandwidth blocks */
+};
+
 #endif /* _ASM_RISCV_QOS_INTERNAL_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
