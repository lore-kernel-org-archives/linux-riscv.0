Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DF9CD5BCB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 23:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKKRa72+pmnt8casNX4DizqSvpB1DJdQ1Mrdvq6nim0=; b=VfU+qpzWRCf5v0
	YRwqm5awrfd10Uwg9EmpM5aVXJOxoFM1EJCtsY6vzqTyBUKGI7QUESdsu15H5VsUxyxKXiygIgeV0
	kkj1tWB5J6qUl3lPACKhkKyiYQxxSUGifga6Lqec9EARBlHQgF1aa69MnqPkTlBZAUpODb5elkxID
	ThTinBIjtuoTOrPP4ss2uE+fOhTyqeqMqMXfB2wuC5FSMUMQHux21E+Yv0GV0qGsyVVqN+U337QAi
	YyWNl4S2QUSnurnj+i1J9Qho+VFnIJHVDuvIWQ8vbSkw6hi9AxvJNaiqwvn3iIKN1ymO/fppAta+o
	FeVpc5KJ3UfisuMA3QKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhY-0000000FsZ7-0GSU;
	Sun, 24 May 2026 23:57:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhS-0000000FsX4-1Wqe
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 23:57:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7C7A60228;
	Sun, 24 May 2026 23:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8AC1F01565;
	Sun, 24 May 2026 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779667061;
	bh=hdVl/+tyQos8I/C5ukqEi2Utow5uJHPasq4qcGSCBrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VGP9OnMNr0yCBjlHyljdSZMV4b13pSzUVQUURp2FBCkRXmnowEms5ELGIICP4CR66
	 ol8ShUWl/dxn7rAKsbeY+DVTQLzZky4beP/DjW7DwfdLYvpdu7l4K77dgb+ms0+1c4
	 o/Q+Lcb/ouVHKm7Voxknyw+ul4NwmLuvtLsuKYNTn+jkGEqffkd6dHC3fi8R0e6Bgu
	 qER7Bs7q3Z7QAbOfQYzC6kkDRWD2FDzkEo7/HBR8spCyMNNhpeXD/GcCh/o/ga/T0U
	 DQIGx7WOsMDueKE4wjGnEyv9onnO2bKp2LxUzXcPb0nHrh/Iwj/ACBq1nPyx6ehH+1
	 N7uI+sXq7yPdw==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 24 May 2026 16:55:44 -0700
Subject: [PATCH RFC v5 14/18] riscv_cbqri: resctrl: Add MB_WGHT bandwidth
 allocation via Mweight
MIME-Version: 1.0
Message-Id: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-14-78d3a7ba9dbe@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5240; i=fustini@kernel.org;
 h=from:subject:message-id; bh=vmtFHEULsJC3IiO748IREdCMzpe08urQp1XmUWYGmFU=;
 b=kA0DAAoW2+wsw9kosQwByyZiAGoTkGmhVR6yTIuFTkO5UZkvXJdJmfIA3lcmEJrilNj6s4WVi
 4h1BAAWCgAdFiEEsvBu0KRKVfWgn+i22+wsw9kosQwFAmoTkGkACgkQ2+wsw9kosQza6gD/YRL1
 o+LihDooYDiNR9UkIftSnNfn+bvH3FQUUCT3fWIBANV0A8nE1MUBIjWl2sg/hrbZK4E7psJma3k
 /9xYbIzwG
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

Add bandwidth allocation through Mweight (shared weight for unreserved
bandwidth) exposed as the MB_WGHT resource. Mweight has no MBA
equivalent, so it lands as a new RDT_RESOURCE_*.

Mweight is an integer in [0, 255]. A value of 0 disables work-
conserving sharing for the group, capping its bandwidth at the
MB_MIN reservation. Values 1..255 compete for the leftover pool in
proportion to the weight.

The same BC backs both MB_MIN and MB_WGHT and bc_bw_alloc packs Rbwb and
Mweight in one register. cbqri_attach_cpu_to_bw_ctrl() attaches both
rids to the picked BC.

Reset gives every RCID the new-group default (max_bw = 255) for
equal opportunistic shares.

Assisted-by: Claude:claude-opus-4-7
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/cbqri_resctrl.c | 60 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
index 5d8389c58f4f..ba764bc6ef17 100644
--- a/drivers/resctrl/cbqri_resctrl.c
+++ b/drivers/resctrl/cbqri_resctrl.c
@@ -414,6 +414,8 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	case RDT_RESOURCE_MB_MIN:
 		/* sum(Rbwb) <= MRBWB validation runs inside cbqri_apply_rbwb(). */
 		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);
+	case RDT_RESOURCE_MB_WGHT:
+		return cbqri_apply_mweight_config(dom->hw_ctrl, closid, cfg_val);
 	default:
 		return -EINVAL;
 	}
@@ -474,6 +476,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			val = (u32)rbwb;
 		break;
 	}
+	case RDT_RESOURCE_MB_WGHT: {
+		u64 mweight;
+
+		err = cbqri_read_mweight(ctrl, closid, &mweight);
+		if (err == 0)
+			val = (u32)mweight;
+		break;
+	}
 	default:
 		break;
 	}
@@ -533,6 +543,18 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 							   rcid, rerr);
 			}
 			break;
+		case RDT_RESOURCE_MB_WGHT:
+			/* All RCIDs start at max weight (the new-group default). */
+			for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
+				int rerr;
+
+				rerr = cbqri_apply_mweight_config(dom->hw_ctrl, i,
+								  default_ctrl);
+				if (rerr)
+					pr_err_ratelimited("Mweight reset RCID %u failed (%d)\n",
+							   i, rerr);
+			}
+			break;
 		default:
 			for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
 				for (t = 0; t < CDP_NUM_TYPES; t++) {
@@ -597,6 +619,11 @@ static int cbqri_init_domain_ctrlval(struct rdt_resource *r, struct rdt_ctrl_dom
 
 			err = cbqri_apply_rbwb(dom->hw_ctrl, rcid, rbwb, false);
 			break;
+		case RDT_RESOURCE_MB_WGHT:
+			/* Match the new-group default: equal weights across RCIDs. */
+			err = cbqri_apply_mweight_config(dom->hw_ctrl, i,
+							 resctrl_get_default_ctrl(r));
+			break;
 		default:
 			/*
 			 * Seed both DATA and CODE staged slots so a later
@@ -739,6 +766,25 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
 		INIT_LIST_HEAD(&res->mon_domains);
 		break;
 
+	case RDT_RESOURCE_MB_WGHT:
+		res->name = "MB_WGHT";
+		res->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		res->ctrl_scope = RESCTRL_L3_CACHE;
+		/* Mweight is a dimensionless ratio. No delay/linear concept. */
+		res->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		/*
+		 * CBQRI section 4.5: Mweight is 0-255 (0 disables
+		 * work-conserving). No sum constraint, so leave
+		 * default_to_min false. Groups default to max_bw.
+		 */
+		res->membw.min_bw = 0;
+		res->membw.max_bw = 255;
+		res->membw.bw_gran = 1;
+		res->alloc_capable = ctrl->alloc_capable;
+		INIT_LIST_HEAD(&res->ctrl_domains);
+		INIT_LIST_HEAD(&res->mon_domains);
+		break;
+
 	default:
 		break;
 	}
@@ -747,13 +793,12 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
 }
 
 /*
- * Pick one BC to back MB_MIN.  Multiple BCs must agree on rcid_count
- * and mrbwb.  Mismatch is fatal because resctrl exposes a single set
- * of caps per rid.
+ * Pick one BC to back both MB_MIN and MB_WGHT.
  */
 static int cbqri_resctrl_pick_bw_alloc(void)
 {
 	struct cbqri_resctrl_res *mb_min = &cbqri_resctrl_resources[RDT_RESOURCE_MB_MIN];
+	struct cbqri_resctrl_res *mb_wght = &cbqri_resctrl_resources[RDT_RESOURCE_MB_WGHT];
 	struct cbqri_controller *ctrl;
 
 	list_for_each_entry(ctrl, &cbqri_controllers, list) {
@@ -772,6 +817,7 @@ static int cbqri_resctrl_pick_bw_alloc(void)
 		}
 
 		mb_min->ctrl = ctrl;
+		mb_wght->ctrl = ctrl;
 	}
 
 	return 0;
@@ -1019,7 +1065,13 @@ static int cbqri_attach_cpu_to_one_bw_res(struct cbqri_controller *ctrl,
 static int cbqri_attach_cpu_to_bw_ctrl(struct cbqri_controller *ctrl,
 				       unsigned int cpu)
 {
-	return cbqri_attach_cpu_to_one_bw_res(ctrl, RDT_RESOURCE_MB_MIN, cpu);
+	int err;
+
+	err = cbqri_attach_cpu_to_one_bw_res(ctrl, RDT_RESOURCE_MB_MIN, cpu);
+	if (err)
+		return err;
+
+	return cbqri_attach_cpu_to_one_bw_res(ctrl, RDT_RESOURCE_MB_WGHT, cpu);
 }
 
 static void cbqri_detach_cpu_from_l3_mon(struct rdt_resource *res,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
