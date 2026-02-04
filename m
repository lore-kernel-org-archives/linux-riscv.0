Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8361DE83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbzRXHupUTiPMT3E9dsg96/qNjF4LhAF5yysr8v4Wx0=; b=PzV25dADAjgvu6
	ZF6+XO/9HnCZnL+FtxGwjmpb94IsbW5Um3xgNKVnJ/MmViSRhY1w205iRvaJTNktI+lpyyWhegpkL
	n5GW9RkQwtC8ZmQQRD69bUVLOl3CHloQ7ipmOErop6cQXT7bXsJKgWtNoJRmHso4Xu7Oq3HnvRqnH
	jZoJJ+hjEj/TOAONA9hwz27reZq1+L75/cTNcecSjJgzw7XYm1T8J/dGn/hqCFOdAMTPRGVVxg0yd
	FXDKTgtiFi7npmaNAzsZexT08cswLPUWyCi8NAMIdPogUWcb6LRsQGMf/sq/y7AwrMCiYkF6zXMe/
	ar4tqRXgU2q9iVNF+jdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYu2-00000008AY6-1gjG;
	Wed, 04 Feb 2026 09:10:26 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYtz-00000008AMs-0WiU
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770196200;
	bh=EgJIHnad+b6A2LOWWhy4BtoavbNU0zZtyzPE8zCjc4w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E6E0LMNhekirNM3L86GHoYLjSnLPtbUINcLmxzUVR+Ph5DbpPJXAns+yvHxD7gbK9
	 gOlcx79h3IS+/LNqWuLuMFXwYR2Dk3dvUcNmOQ7GgSLg3ZTTpByTp6+d3MNrez8CCy
	 PCGGQsV8Vwc3Dv53qQlE456sXH06mU0ZlG8I6cbo=
X-QQ-mid: zesmtpsz7t1770196198taefc40b6
X-QQ-Originating-IP: mBozWA9Y+PFCCt1kixiwX9rViDm+vgGOQudZyHgPelI=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 17:09:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10106732724009350697
EX-QQ-RecipientCnt: 19
From: Lv Zheng <lv.zheng@linux.spacemit.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>,
	Lv Zheng <lv.zheng@linux.spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] perf vendor events riscv:: Add support for spacemit,riscv-iommu HPM aliasing
Date: Wed,  4 Feb 2026 17:09:52 +0800
Message-ID: <5242DDF0A783AF08+e141f1898581018f8dd0723cb5c870c23ec679d6.1770195980.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770195980.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NVJ0hJNx7N5S7OAqJS8spVOnE/fn5/CyBNG5bfTZdhkiCjkeFEV+k2Qf
	OIEqjv2b8C6I+V/E+Wr5TZ98OYzGpvDMBQDmBIWcTgSL9yX0sUVFiFLaj4efiiN2Gj3KCxT
	j/D4bMzORrXlmrKzTdUVaRX+5U6/tmYU0ux5qfWtLUYCFql5Q3Fx9885JJrH/x0bWAxX6j8
	VMwYgITuseUqiLWOzL9Y75LoV757VwfKBv+tx5pof4ipGd/ua3bqhQjOKG6oDE+kApqfLo0
	xq9JLL4lhRIBUSeD7ac37NtAPg0TKkzNEyfMyM85XRjGjISJNPSIM8Z3VXt1FAblg1q34Z/
	9cyiKbnxmb3XrBJGoVwN3s3E9/wXCcRRB8Wbw4k26+/UOzSWriSJSHb74ghdKkOcRXLgZkw
	dsrR4KaScs9f9VFoQYP0Zv3aqIXIV5fajjpW54zJxfklj061SMOn/hsgMYWdZ2m5srMuTm7
	18ob+OgkIhYYAsF8dMpGh5lf5+RuOhiOqgtKPoof5NDdwujeHjOs3N6qhHgD/oOI21IFwbw
	CDTNh7GwVxPuHvWW7Tsuq1FquAVPA7taMsZZjV1ZLB8pWRTCuvzoE4ZpiG4hJDQRSLYU2C4
	KFFilk6gkcFS/m4oaNMpzgljsYADfxk1eZaJ11U2bJhL+qSw0au1TsHsZzuFYJjn1wat9Ah
	zFFuflHrWnsewgd4EgDow2gXCmlm/2EZskIFTBXmRqaKi0P5riRbvrQR+JFb9wahXKUzp/W
	cBMiqIhdXFGCjBKETfY7GCcKoQif0KPA8bcZ/1iQ/dnMQmE1/awu35jnOWi1iOjCv1S5x+H
	BMRMlnqCWTk2q8MUZ2kBIxrbrjiFQPCdoHAUAhQaoxNSJwVxF74bsF5FDBkrqON50/1ZHGp
	7rNlaoEjcvI4pv0i9l0n7Ne8ZBhlCY6iz5bECDET6hM7h9MOC6j5CHQ8rzaMhl3p/fjn4tH
	6TleVyux1c0qO9OyivhpCweH32+dtZK8s2lc5TTRIwfiM6Cj2iNzz2ICC4HTF2pfz3UtUiv
	ldxwAA5QSBtZSZ9mufeE0f+SvT1WgwAVf5uj22wWM7igIacI7pbMGPCbXSImJe5PHM/svlc
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_011023_623381_16F510CF 
X-CRM114-Status: GOOD (  12.14  )
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

Add JSON HPM event aliases for SpacemiT distributed IOMMU (T100) which is
general and compatible for all SpacemiT RISC-V SoCs.

Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
Signed-off-by: Jingyu Li <joey.li@spacemit.com>
---
 MAINTAINERS                                   |   3 +
 .../arch/riscv/spacemit/iommu/sys/ioatc.json  |  30 ++++
 .../arch/riscv/spacemit/iommu/sys/ioats.json  | 163 ++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioatc.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioats.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c50701b6001..4d91f99aa742 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22459,12 +22459,15 @@ K:	riscv
 
 RISC-V IOMMU
 M:	Tomasz Jeznach <tjeznach@rivosinc.com>
+M:	Lv Zheng <lv.zheng@linux.spacemit.com>
+M:	Jingyu Li <joey.li@spacemit.com>
 L:	iommu@lists.linux.dev
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
+F:	tools/perf/pmu-events/arch/riscv/spacemit/iommu/
 
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
diff --git a/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioatc.json b/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioatc.json
new file mode 100644
index 000000000000..a16610ba2274
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioatc.json
@@ -0,0 +1,30 @@
+[
+  {
+    "EventName": "mtlb_lkp",
+    "EventCode": "0x38",
+    "BriefDescription": "IOATC main TLB (MTLB) lookups",
+    "Unit": "spacemit_ioatc_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "mtlb_mis",
+    "EventCode": "0x39",
+    "BriefDescription": "IOATC main TLB (MTLB) misses",
+    "Unit": "spacemit_ioatc_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "utlb_lkp",
+    "EventCode": "0x3A",
+    "BriefDescription": "IOATC micro TLB (uTLB) lookups",
+    "Unit": "spacemit_ioatc_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "utlb_mis",
+    "EventCode": "0x3B",
+    "BriefDescription": "IOATC micro TLB (uTLB) misses",
+    "Unit": "spacemit_ioatc_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioats.json b/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioats.json
new file mode 100644
index 000000000000..e1fea4e8125c
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/ioats.json
@@ -0,0 +1,163 @@
+[
+  {
+    "EventName": "pri_rq",
+    "EventCode": "0x10",
+    "BriefDescription": "IOATS PCIe page request interface (PRI) requests",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "ptwc_rq",
+    "EventCode": "0x11",
+    "BriefDescription": "IOATS page table walk (PTW) cache requests",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "dtwc_rq",
+    "EventCode": "0x12",
+    "BriefDescription": "IOATS directory table walk (DTW) cache requests",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "dtwc_mis",
+    "EventCode": "0x13",
+    "BriefDescription": "IOATS directory table walk (DTW) cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "ptwc_mis",
+    "EventCode": "0x14",
+    "BriefDescription": "IOATS page table walk (PTW) cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "all_trans_rq",
+    "EventCode": "0x15",
+    "BriefDescription": "IOATS all translation requests",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "dtwc_lkp",
+    "EventCode": "0x20",
+    "BriefDescription": "IOATS directory table walk (DTW) cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s0_ptwc_lkp",
+    "EventCode": "0x28",
+    "BriefDescription": "IOATS s-stage level-0 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s0_ptwc_mis",
+    "EventCode": "0x29",
+    "BriefDescription": "IOATS s-stage level-0 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s1_ptwc_lkp",
+    "EventCode": "0x2A",
+    "BriefDescription": "IOATS s-stage level-1 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s1_ptwc_mis",
+    "EventCode": "0x2B",
+    "BriefDescription": "IOATS s-stage level-1 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s2_ptwc_lkp",
+    "EventCode": "0x2C",
+    "BriefDescription": "IOATS s-stage level-2 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s2_ptwc_mis",
+    "EventCode": "0x2D",
+    "BriefDescription": "IOATS s-stage level-2 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s3_ptwc_lkp",
+    "EventCode": "0x2E",
+    "BriefDescription": "IOATS s-stage level-3 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "s3_ptwc_mis",
+    "EventCode": "0x2F",
+    "BriefDescription": "IOATS s-stage level-3 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g0_ptwc_lkp",
+    "EventCode": "0x30",
+    "BriefDescription": "IOATS g-stage level-0 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g0_ptwc_mis",
+    "EventCode": "0x31",
+    "BriefDescription": "IOATS g-stage level-0 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g1_ptwc_lkp",
+    "EventCode": "0x32",
+    "BriefDescription": "IOATS g-stage level-1 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g1_ptwc_mis",
+    "EventCode": "0x33",
+    "BriefDescription": "IOATS g-stage level-1 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g2_ptwc_lkp",
+    "EventCode": "0x34",
+    "BriefDescription": "IOATS g-stage level-2 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g2_ptwc_mis",
+    "EventCode": "0x35",
+    "BriefDescription": "IOATS g-stage level-2 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g3_ptwc_lkp",
+    "EventCode": "0x36",
+    "BriefDescription": "IOATS g-stage level-3 PTW cache lookups",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  },
+  {
+    "EventName": "g3_ptwc_mis",
+    "EventCode": "0x37",
+    "BriefDescription": "IOATS g-stage level-3 PTW cache misses",
+    "Unit": "spacemit_ioats_hpm",
+    "Compat": "spacemit,riscv-iommu"
+  }
+]
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
