Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F8CD4843
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLoUZyS4/3DAGOR/GPEzM6R/le79cNi0b9Lu6cZmwC8=; b=k4rrU9myr5tPtt
	WOC5u47NWx+aLfo+iyIJILQJ5mMdfye5bbCyUGWZim+i9BREqqJWiCqi/jNPYOu9dL1/zZM2zw6b6
	gbWdQbShwminK72yJRAsF9GsfK/oN6vJw40wH08ahf+5x0ioMeZZlf+zF56K2C/lFsfjwnZzeg3jJ
	4FbM6Y20MEP/wkR02tCS3BSNaRh0NILU8LRW+BbiPTHhHX6wLuQYv1bp62/389Gy1TPY93HISHwqN
	zrMRsWfC9KNRwr/TZEiIn+BKHltja3xJws0AsqVbMw/Her6rGTDTlI5to2d1TnmQ1ucEBTIT+H01p
	Av08vtuCf8ve5A3nW0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvX-0000000CLLi-1tqh;
	Mon, 11 May 2026 05:11:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvW-0000000CLKN-2c8l
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 05:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dpSvJx5CzibKRZs4tVRY9QKlSusTxAiTYsYWJ8NWq+s=; b=oxMvuIWmpK6CviSeaGC764YuWk
	cyOt8M/oh0UFXdj0ADJI4ykYRkvHxlsXNR67or4FauCJb5/A2yBSFgSo16Pta59LhvcLGs5eB3qqb
	XHK2AS8WTYxADfzH9zOBl8N/Y/RojzwQJEmM5sBNT32pRsFhG6TVHry6r9A6HEO34vx7/tfyS9yk2
	9QK2qWU/F8U5rio8HehlUCOXj0vCe96BeOD/PQz1ATdBQJQCdrn397w77gwsN5FTjfhMFeCITc1g3
	DURvx70BSeD7qR8GGIMX8RqcvRLBm1oLlWKPrU10ry40KyDykmWhWtK53zhJoALfCHngWLv98C/r+
	eKHJkBgw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvQ-00000007eJU-2Alo
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F33B4469E;
	Mon, 11 May 2026 05:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC57C2BCFD;
	Mon, 11 May 2026 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476275;
	bh=yRfUfMqB9K1PJUQCCArkJ3qd6XIOmBf27/4l1PzmHEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fivFiwAZHLmlRvOq/BTF8Q4kmXUD2MYUi4tapWO5CEZiB7cm5QH3w4plpva+Tbp/C
	 4bCql7uomP6c0ZtGqEEGM+DhKoffltxT4Mb4yY+xqgAwp+axVePdPAWbbxSdTk41RB
	 a7cw4GnInmbZBDkir+ZlIcUU02ZdofmYJBi80kUvNgAexuBtdHK30NdWfuWtUeAnwR
	 St2Z6wxkU8G1RfzG2c7u8IeYDKv4uvPoNogPa1skTPkwCpFO16DAQzfTFblmrHZf78
	 spGgt2D2xgbtYZHUKRU90VT26Gbz126ODhA7EzZnsguPiHr/2cVheAqr9ntG6tehgs
	 FhJ8Z9yTC57pw==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:11:06 -0700
Subject: [PATCH RFC v4 10/18] riscv_cbqri: Add bandwidth controller
 monitoring device ops
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-10-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
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
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6210; i=fustini@kernel.org;
 h=from:subject:message-id; bh=yRfUfMqB9K1PJUQCCArkJ3qd6XIOmBf27/4l1PzmHEk=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprwOzY79yTnlpMTVut36nV9PTp1RNGvB4eMVr2aWT
 tXRbbpwqKOUhUGMi0FWTJFl04e8C0u8Qr8umP9iG8wcViaQIQxcnAIwkZu+DP+9btXdt7+8zt0z
 gKnV/Jecv3qSnebypFclfVMahYyWxooyMlzb79va9+BY+ksVKQWjJTsd+u+/r136cNXnw1lGgQV
 K+qwA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061131_282450_1A317989 
X-CRM114-Status: GOOD (  17.93  )
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

Add the BC monitoring primitives. cbqri_init_bc_mon_counters() pre- arms
each MCID with the TOTAL_READ_WRITE event and allocates the per-MCID
software accumulator (struct cbqri_bc_mon_state) so subsequent reads can
extend the 62-bit hardware counter to the 64-bit byte total resctrl
expects. cbqri_bc_mon_overflow() recovers a single-wrap delta. The OVF
bit signals multi-wrap and is the caller's concern.

cbqri_find_only_mon_bc() returns NULL when zero or more than one
mon-capable BC is present. A BC's counter can only accurately back L3
mbm_total_bytes when every memory request flows through that BC.

Assisted-by: Claude:claude-opus-4-7
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/cbqri_devices.c  | 75 ++++++++++++++++++++++++++++++++++++++++
 drivers/resctrl/cbqri_internal.h | 37 ++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
index 7e5decd7a6b2..0b17a25b009c 100644
--- a/drivers/resctrl/cbqri_devices.c
+++ b/drivers/resctrl/cbqri_devices.c
@@ -820,8 +820,83 @@ int cbqri_init_mon_counters(struct cbqri_controller *ctrl)
 	return 0;
 }
 
+/*
+ * 62-bit BC counter delta. Inputs must be pre-masked to
+ * CBQRI_BC_MON_CTR_VAL_CTR_MASK. The shift promotes the modular
+ * subtraction into 64-bit so a single wrap (cur < prev) yields the
+ * correct delta. Multi-wrap is handled by the caller via the
+ * hardware OVF bit (CBQRI 4.3). This function only needs to recover
+ * from at most one wrap.
+ */
+u64 cbqri_bc_mon_overflow(u64 prev_ctr, u64 cur_ctr)
+{
+	const unsigned int shift = 64 - 62;
+	u64 chunks = (cur_ctr << shift) - (prev_ctr << shift);
+
+	return chunks >> shift;
+}
+
+/*
+ * Allocate the per-MCID software accumulator and pre-arm every MCID
+ * with TOTAL_READ_WRITE so subsequent reads just snapshot the live
+ * counter.
+ *
+ * Caller responsibility: serialize concurrent invocations on the same
+ * single mon-capable BC (cbqri_resctrl uses cbqri_domain_list_lock for
+ * this).
+ */
+int cbqri_init_bc_mon_counters(struct cbqri_controller *bc)
+{
+	int i, err;
+
+	if (bc->mbm_total_states)
+		return 0;
+
+	bc->mbm_total_states = kcalloc(bc->mcid_count,
+				       sizeof(*bc->mbm_total_states),
+				       GFP_KERNEL);
+	if (!bc->mbm_total_states)
+		return -ENOMEM;
+
+	for (i = 0; i < bc->mcid_count; i++) {
+		mutex_lock(&bc->lock);
+		err = cbqri_mon_op(bc, CBQRI_BC_MON_CTL_OFF,
+				   CBQRI_BC_MON_CTL_OP_CONFIG_EVENT,
+				   i, CBQRI_BC_EVT_ID_TOTAL_READ_WRITE, NULL);
+		mutex_unlock(&bc->lock);
+		if (err) {
+			kfree(bc->mbm_total_states);
+			bc->mbm_total_states = NULL;
+			return err;
+		}
+	}
+	return 0;
+}
+
+/*
+ * Return the single mon-capable BC, NULL if zero or more than one. BC
+ * counters can only honestly surface as L3 mbm_total_bytes if every memory
+ * request flows through the same BC.
+ */
+struct cbqri_controller *cbqri_find_only_mon_bc(void)
+{
+	struct cbqri_controller *ctrl, *only_bc = NULL;
+
+	list_for_each_entry(ctrl, &cbqri_controllers, list) {
+		if (ctrl->type != CBQRI_CONTROLLER_TYPE_BANDWIDTH)
+			continue;
+		if (!ctrl->mon_capable)
+			continue;
+		if (only_bc)
+			return NULL;
+		only_bc = ctrl;
+	}
+	return only_bc;
+}
+
 void cbqri_controller_destroy(struct cbqri_controller *ctrl)
 {
+	kfree(ctrl->mbm_total_states);
 	kfree(ctrl->rbwb_cache);
 	kfree(ctrl);
 }
diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
index 11a00f8e7436..1e5dd742273d 100644
--- a/drivers/resctrl/cbqri_internal.h
+++ b/drivers/resctrl/cbqri_internal.h
@@ -64,8 +64,17 @@
 #define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
 #define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
 
+#define CBQRI_BC_MON_CTL_OP_CONFIG_EVENT 1
 #define CBQRI_BC_MON_CTL_OP_READ_COUNTER 2
 
+/* Bandwidth usage monitoring event IDs (CBQRI spec Table 10) */
+#define CBQRI_BC_EVT_ID_TOTAL_READ_WRITE  1
+
+/* bc_mon_ctr_val layout (CBQRI spec section 4.3, Figure 7) */
+#define CBQRI_BC_MON_CTR_VAL_CTR_MASK    GENMASK_ULL(61, 0)
+#define CBQRI_BC_MON_CTR_VAL_INVALID     BIT_ULL(62)
+#define CBQRI_BC_MON_CTR_VAL_OVF         BIT_ULL(63)
+
 /* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STATUS layout) */
 #define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
 #define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
@@ -91,6 +100,19 @@ struct riscv_cbqri_bandwidth_caps {
 	bool supports_alloc_at_code;
 };
 
+/**
+ * struct cbqri_bc_mon_state - per-MCID software accumulator for BC bandwidth
+ * @prev_ctr: previous 62-bit hardware snapshot (already masked to CTR field)
+ * @chunks:   accumulated 64-bit byte total across hardware wraparounds
+ *
+ * Updated in resctrl_arch_rmid_read() under cbqri_controller::lock and
+ * zeroed by resctrl_arch_reset_rmid().
+ */
+struct cbqri_bc_mon_state {
+	u64 prev_ctr;
+	u64 chunks;
+};
+
 /**
  * enum cbqri_at - capacity controller access type for CDP
  * @CBQRI_AT_DATA: data access (CBQRI Table 1, AT=0)
@@ -158,6 +180,15 @@ struct cbqri_controller {
 	 */
 	u16 *rbwb_cache;
 
+	/*
+	 * Per-MCID 64-bit software accumulator for the BC's mbm_total_bytes
+	 * event. Allocated by cbqri_init_bc_mon_counters() when this BC is
+	 * paired with an L3 monitoring domain, sized by ->mcid_count. NULL
+	 * on capacity controllers and on BCs that are not mon-paired.
+	 * Protected by ->lock along with the surrounding MMIO sequence.
+	 */
+	struct cbqri_bc_mon_state *mbm_total_states;
+
 	struct list_head list;
 
 	struct cache_controller {
@@ -200,4 +231,10 @@ int cbqri_read_rbwb(struct cbqri_controller *ctrl, u32 closid, u64 *rbwb_out);
 
 int cbqri_read_mweight(struct cbqri_controller *ctrl, u32 closid, u64 *mweight_out);
 
+u64 cbqri_bc_mon_overflow(u64 prev_ctr, u64 cur_ctr);
+
+int cbqri_init_bc_mon_counters(struct cbqri_controller *bc);
+
+struct cbqri_controller *cbqri_find_only_mon_bc(void);
+
 #endif /* _DRIVERS_RESCTRL_CBQRI_INTERNAL_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
