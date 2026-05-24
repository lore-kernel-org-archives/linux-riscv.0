Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A61CCD5BC9
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 23:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddiTybOcdqbw7/uRBaCeFjEubnInqssBmcy36Aaj3zc=; b=rx6mAv92p9IzEP
	mVy38SompV1U+ru5h5s4sVmP9nTYBlP7jYXQPXRf3/Y+mNQf8PmzpBwIliRFA8XWClL1ITcTu4Tr2
	9NzpwF77CWlvtj/2wCDEqKcn4SCioDu/J2NbE9RVffyrL9RwvzYYRPvf+TkLxyuVs78QxiTDPZjhT
	KvqyC+2q+XJ6TyXCy9RPGK+Z9W7u/KDkoIB5sOMRY9WLGaBLyDCRpGzh3Q5Y0PQ2MVr1lB9V7lFIF
	lMvyViEZR4dFu+qHin/ahPkTGy1kNXKSkyy8Dc76OMvk2oQfzLmZBAJNnvnFWTvoACGh3M4H64bQt
	zRH+7EBdgUz57wDj9VcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhQ-0000000FsWE-1LFn;
	Sun, 24 May 2026 23:57:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhN-0000000FsVR-3tkv
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 23:57:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FAE7601FD;
	Sun, 24 May 2026 23:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC351F0155C;
	Sun, 24 May 2026 23:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779667057;
	bh=/gf5ocEMGVrm/gl7ucDMg1ohgBZccKNn9r/RVvyzqXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C9uAaiZz/zX2CDRu42hJLbky7HPjkbqb5YRK7c6Q1uTXypfooC4CE3deaRQNzRY1c
	 OhZ4ghQC0BaL6Z4g5bp2CJjaOBdWvrBJIe6AHbEL6w3n4lWKIcdEij0je8UvDZYiAS
	 xsiC6OAC0Zr+Ugb5k4l76H9fc47zCys2WbDzE9pLBkyHlflH3IYjvvCUDWMbEqMYhb
	 XLsvddymdoGOV0eKCB4yxzHDunATA8KPmNE41j0dsam+a4RBeZWE75D5a6k6igxCDo
	 vGv4QbwatMwXL+hhGpfH9Oa6R08SZGexFAWz8DDkqxN4Yku66bhneQXJORKS7nr0jL
	 7E0hJSjfCs0KA==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 24 May 2026 16:55:38 -0700
Subject: [PATCH RFC v5 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
MIME-Version: 1.0
Message-Id: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-8-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6169; i=fustini@kernel.org;
 h=from:subject:message-id; bh=KSeuaYeV0iFU+JffHXhhJuQ12xnuLpzk0N1tloNJjn4=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQJT8g8fmD/jK+LOo+r/kozn2C1vS6x7aWa1cy/j+6tb
 N21mvGWcUcpC4MYF4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgImm2DP+srCsZz83fdWNS
 /1qv0OcmlYlLG3RPuBqxb3HyEVF0X7mDkeH9cUPLmk1hz16e+WPaLrvA/2rNvC6Th79rd7Qu8jg
 vs5cFAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Add capacity monitoring operations. cbqri_init_mon_counters() pre-arms
every MCID with the Occupancy event so a subsequent READ_COUNTER just
snapshots the live counter without re-configuring the slot.

cbqri_probe_cc() leaves ctrl->mon_capable false when cacheinfo has not
given a non-zero cache_size, since the byte conversion would be
meaningless. cbqri_mon_op() takes a reg_offset and serves both capacity
and bandwidth mon_ctl registers as they share an identical layout.

Assisted-by: Claude:claude-opus-4-7
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/cbqri_devices.c  | 82 ++++++++++++++++++++++++++++++++++++++++
 drivers/resctrl/cbqri_internal.h | 21 ++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
index a97511825eed..90a95fd11190 100644
--- a/drivers/resctrl/cbqri_devices.c
+++ b/drivers/resctrl/cbqri_devices.c
@@ -98,6 +98,43 @@ static int cbqri_cc_alloc_op(struct cbqri_controller *ctrl, int operation,
 	return 0;
 }
 
+/*
+ * Issue a monitoring op on a CC or BC controller's mon_ctl register at
+ * reg_offset (CBQRI_CC_MON_CTL_OFF or CBQRI_BC_MON_CTL_OFF). The CC and
+ * BC mon_ctl registers share an identical OP/MCID/EVT_ID/STATUS layout, so
+ * one helper covers both. Caller must hold ctrl->lock.
+ */
+int cbqri_mon_op(struct cbqri_controller *ctrl, int reg_offset,
+		 int operation, int mcid, int evt_id, u64 *out_reg)
+{
+	u64 reg;
+
+	lockdep_assert_held(&ctrl->lock);
+
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+		pr_err_ratelimited("BUSY timeout before starting operation\n");
+		return -EIO;
+	}
+	FIELD_MODIFY(CBQRI_MON_CTL_OP_MASK, &reg, operation);
+	FIELD_MODIFY(CBQRI_MON_CTL_MCID_MASK, &reg, mcid);
+	FIELD_MODIFY(CBQRI_MON_CTL_EVT_ID_MASK, &reg, evt_id);
+	iowrite64(reg, ctrl->base + reg_offset);
+
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+		pr_err_ratelimited("BUSY timeout\n");
+		return -EIO;
+	}
+
+	if (FIELD_GET(CBQRI_MON_CTL_STATUS_MASK, reg) !=
+	    CBQRI_MON_CTL_STATUS_SUCCESS)
+		return -EIO;
+
+	if (out_reg)
+		*out_reg = reg;
+
+	return 0;
+}
+
 /*
  * Apply a capacity block mask and verify via CONFIG_LIMIT + READ_LIMIT.
  *
@@ -318,6 +355,7 @@ static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
 
 static int cbqri_probe_cc(struct cbqri_controller *ctrl)
 {
+	bool has_mon_at_code = false;
 	int err, status;
 	u64 reg;
 
@@ -369,6 +407,28 @@ static int cbqri_probe_cc(struct cbqri_controller *ctrl)
 	}
 	cpus_read_unlock();
 
+	/* Probe monitoring features */
+	err = cbqri_probe_feature(ctrl, CBQRI_CC_MON_CTL_OFF,
+				  CBQRI_CC_MON_CTL_OP_READ_COUNTER, &status,
+				  &has_mon_at_code);
+	if (err)
+		return err;
+
+	if (status == CBQRI_MON_CTL_STATUS_SUCCESS) {
+		/*
+		 * Occupancy is reported to userspace in bytes, computed as
+		 * cache_size * counter / ncblks by the resctrl glue. If
+		 * cacheinfo has no cache_size, leave mon_capable false so
+		 * the file is not exposed at all rather than silently
+		 * returning 0.
+		 */
+		if (!ctrl->cache.cache_size)
+			pr_debug("CC @%pa: cache_size unknown, occupancy monitoring disabled\n",
+				 &ctrl->addr);
+		else
+			ctrl->mon_capable = true;
+	}
+
 	/* Probe allocation features */
 	err = cbqri_probe_feature(ctrl, CBQRI_CC_ALLOC_CTL_OFF,
 				  CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
@@ -436,6 +496,28 @@ static int cbqri_probe_controller(struct cbqri_controller *ctrl)
 	return err;
 }
 
+/*
+ * Pre-arm every MCID with the Occupancy event so a subsequent READ_COUNTER
+ * just snapshots the live counter rather than re-configuring the slot.
+ * Called once per CC during resctrl-side cpuhp online for the L3 monitoring
+ * domain.
+ */
+int cbqri_init_mon_counters(struct cbqri_controller *ctrl)
+{
+	int i, err;
+
+	for (i = 0; i < ctrl->mcid_count; i++) {
+		mutex_lock(&ctrl->lock);
+		err = cbqri_mon_op(ctrl, CBQRI_CC_MON_CTL_OFF,
+				   CBQRI_CC_MON_CTL_OP_CONFIG_EVENT,
+				   i, CBQRI_CC_EVT_ID_OCCUPANCY, NULL);
+		mutex_unlock(&ctrl->lock);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 void cbqri_controller_destroy(struct cbqri_controller *ctrl)
 {
 	/*
diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
index cce13026a11e..e776b0267837 100644
--- a/drivers/resctrl/cbqri_internal.h
+++ b/drivers/resctrl/cbqri_internal.h
@@ -11,6 +11,8 @@
 
 /* Capacity Controller (CC) MMIO register offsets. */
 #define CBQRI_CC_CAPABILITIES_OFF 0
+#define CBQRI_CC_MON_CTL_OFF      8
+#define CBQRI_CC_MON_CTL_VAL_OFF 16
 #define CBQRI_CC_ALLOC_CTL_OFF   24
 #define CBQRI_CC_BLOCK_MASK_OFF  32
 
@@ -39,6 +41,20 @@
 #define CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT   2
 #define CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS  1
 
+#define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
+#define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
+
+/* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STATUS layout) */
+#define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
+#define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
+#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK(27, 20)
+#define CBQRI_MON_CTL_STATUS_MASK    GENMASK_ULL(38, 32)
+#define CBQRI_MON_CTL_STATUS_SUCCESS 1
+
+/* Capacity usage monitoring event IDs (CBQRI spec Table 4) */
+#define CBQRI_CC_EVT_ID_NONE         0
+#define CBQRI_CC_EVT_ID_OCCUPANCY    1
+
 /* Capacity Controller hardware capabilities */
 struct riscv_cbqri_capacity_caps {
 	u16 ncblks;
@@ -125,4 +141,9 @@ int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
 int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
 			    enum cbqri_at at, u32 *cbm_out);
 
+int cbqri_mon_op(struct cbqri_controller *ctrl, int reg_offset,
+		 int operation, int mcid, int evt_id, u64 *out_reg);
+
+int cbqri_init_mon_counters(struct cbqri_controller *ctrl);
+
 #endif /* _DRIVERS_RESCTRL_CBQRI_INTERNAL_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
