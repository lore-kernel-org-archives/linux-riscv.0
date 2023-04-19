Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D80BC77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZprFIVTFx7vo5oQnU8sGej6WL9Xgkaz2/FCM47Lv3pY=; b=aMXlwnFNFFBZLi
	HgUwxSaBcMRhM7kjgcdlP59RJi0TZ2x40vdpFPS9k/m98X3eBNspAtz6wOeY20IVeek+v9QUN/w65
	POGEKOsr/rQLskbsVP7RNtfcUq+0Pl1qH/q0ItVmDDcEs9yqCEdzDwu6u7W89aS8USZguFazcKkF3
	WXLrf8b1V8efcqfKCiHMB/0XaVW5exiZ9akT3HEMWiBRlaAE710r4+8tRVi8kXUXwQiqRNobxzM9H
	ND7zpF1unKAnV03RfIC/8lG2MhmbAhq3t0GR6XI4vldLgfTSTXHoWer5daoae+aW7qE/tV2rPGVTq
	AeFNNpDgEsBAtq57nh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5he-0058A3-1P;
	Wed, 19 Apr 2023 11:10:22 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5ha-00586k-2f
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b50a02bffso2732397b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902617; x=1684494617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmVkd/UrXriHJHxvxxsPlqAajEG3FYZbywzFeJQXIHk=;
        b=zPbQZG9UKwm7GRyIqZChI5pPpnjrvhb8Q5Cx0LVS9GCn0om8iAHe+VSMXHgYhN4iIE
         8hHCqRn6dwTm2nsiT9GilKXMZ1FCN5xuGY6ikI9a3/jb7VDcGrJSy6OtfIdK3QlW6N6+
         RxvuxkbB2fpmlt3qaEEq/XF6YsyaBgL3a3uLDu9C3fO+5Ry3wbbsbycb9tLDG71pLFqj
         6Ph52NPqQie9WLd/4O6LUZjHBRNlMGRcO41aMzbPqSyM/UYae08hx6DIu6+5KiIvg/BL
         iP1p9QGFXCiDa/ohQY7K8Ow0ju7miafcpNFTqcaScbcUWUl3Y1ontHOlSlMSlZHcrBr2
         V3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902617; x=1684494617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmVkd/UrXriHJHxvxxsPlqAajEG3FYZbywzFeJQXIHk=;
        b=QmnwxGEPriPfX9uzodCzLqpw9twWREfX4QqFzZbUM5W+FxMVdOWPOzuSibBL/HY2z8
         CGXDeoMZY77E5ZzLuXYuF8ZL2XJMBwjCKnZfE5dqMe71CI1JhsXIbQGX3XY0dbiGpcmN
         3jyCCwIDW99pqr725wiCE/Ya89Q7dmGROEdnHZIy/SAlvQVbRpMM08GWTzexHYxqx1M4
         9fcXZuiRwJBY0SjTvizrV4VV1k0tdLHysocPSMupLr3VeSJvFLChI5LeTLOy0QiwxHHf
         GKNDNndQ12YRoVDKNV9YsX6J4lok/fwhGMdT9RIkAb5nMSw2f/PceqR9BC4AexjJSf36
         q6pA==
X-Gm-Message-State: AAQBX9fDpRw0WeEJFOJFlOoOvpFWQUsiDIw5aTkvYODWKw+nQk+nyQin
	a4KTUo0cHMAJMa4aBLiDUN9Pvol2pG5aC/xBcMo=
X-Google-Smtp-Source: AKy350Zyw3Ulaxp08aBwcGKciKhzrEtrdld4xIv32oyd3Jnf/nHEuPYG4H87WQ56JWkt1m7BYEv28Q==
X-Received: by 2002:a17:902:c941:b0:1a6:387a:6572 with SMTP id i1-20020a170902c94100b001a6387a6572mr6089976pla.13.1681902616795;
        Wed, 19 Apr 2023 04:10:16 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:16 -0700 (PDT)
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
Subject: [RFC PATCH 05/21] RISC-V: QoS: define prototypes for resctrl interface
Date: Wed, 19 Apr 2023 04:10:55 -0700
Message-Id: <20230419111111.477118-6-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041018_877100_48466ED6 
X-CRM114-Status: GOOD (  12.98  )
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

Define the prototypes for the resctrl interface functions that are
implemented on RISC-V.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 include/linux/riscv_qos.h | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/linux/riscv_qos.h b/include/linux/riscv_qos.h
index 95016810b575..537e503a8e99 100644
--- a/include/linux/riscv_qos.h
+++ b/include/linux/riscv_qos.h
@@ -3,6 +3,7 @@
 #ifndef __LINUX_RISCV_QOS_H
 #define __LINUX_RISCV_QOS_H
 
+#include <linux/resctrl_types.h>
 #include <linux/iommu.h>
 #include <linux/types.h>
 
@@ -31,4 +32,61 @@ struct cbqri_controller_info {
 
 extern struct list_head cbqri_controllers;
 
+bool resctrl_arch_alloc_capable(void);
+bool resctrl_arch_mon_capable(void);
+bool resctrl_arch_is_llc_occupancy_enabled(void);
+bool resctrl_arch_is_mbm_local_enabled(void);
+bool resctrl_arch_is_mbm_total_enabled(void);
+
+struct rdt_resource;
+/*
+ * Note about terminology between x86 (Intel RDT/AMD QoS) and RISC-V:
+ *   CLOSID on x86 is RCID on RISC-V
+ *     RMID on x86 is MCID on RISC-V
+ *      CDP on x86 is AT (access type) on RISC-V
+ */
+bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level ignored);
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+int  resctrl_arch_mon_ctx_alloc_no_wait(struct rdt_resource *r, int evtid);
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid, int ctx);
+void resctrl_arch_reset_resources(void);
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
+u32  resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+int  resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable);
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 pmg);
+u32  resctrl_arch_system_num_rmid_idx(void);
+void resctrl_sched_in(void);
+
+static inline bool resctrl_arch_event_is_free_running(enum resctrl_event_id evt)
+{
+	/* must be true for resctrl L3 monitoring files to be created */
+	return true;
+}
+
+static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
+/* Pseudo lock is not supported on RISC-V */
+static inline int resctrl_arch_pseudo_lock_fn(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_l2_residency(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_l3_residency(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_cycles_lat_fn(void *_plr) { return 0; }
+static inline u64 resctrl_arch_get_prefetch_disable_bits(void) { return 0; }
+
+/* Not needed for RISC-V */
+bool resctrl_arch_match_iommu_closid(struct iommu_group *group, u32 closid);
+bool resctrl_arch_match_iommu_closid_rmid(struct iommu_group *group, u32 closid, u32 rmid);
+int  resctrl_arch_set_iommu_closid_rmid(struct iommu_group *group, u32 closid, u32 rmid);
+
+/* Not needed for RISC-V */
+static inline void resctrl_arch_enable_mon(void) { }
+static inline void resctrl_arch_disable_mon(void) { }
+static inline void resctrl_arch_enable_alloc(void) { }
+static inline void resctrl_arch_disable_alloc(void) { }
+
 #endif /* __LINUX_RISCV_QOS_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
