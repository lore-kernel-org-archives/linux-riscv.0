Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4956CFA477
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OA6S0EzodpccWUvZwwa7QXdnWUvx0VuZwg/cpS5TdA4=; b=XGT6tZ6pr6KH7X
	PFHqrafXbpI/+RCR7oTry+zedWOirP1szGDmD98uo8HqScVObHMLE/H/gkMvniG5mLMpA8VNVtJtl
	b2ZaHCEXRTwHvTYw3YxNiQ8nFTyWChQqTnT4OD6o43Dfxv3W7502uD8YX0wKgVRsiityNcOi8czEZ
	bl/hms/IOR3pyPZxOnrZ0Fm9JR5hcG4wmtHqKjRF32eNL+22KLkWNeBlZ63c6Guw0TdNxyEGQVBrs
	I7DlKpZz2bsL3sndv2NUae1PeTT/obX2AKveAxB6+ZiXkHb1ny+0ghGTu4mOGfUlV+xusHpmPsINX
	C8u2EnoWm8S2Gt4wDXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKjf-00000007vBM-25fE;
	Fri, 21 Nov 2025 06:35:11 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKjb-00000007v9H-2XwM
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 06:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763706900; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UmXbqM0JY6kjsKySz34atLgV4D046f4p8ol4pZE44Vo=;
	b=Q/kShyQnIcKKaT99GWYB5ctiS9zdpFKT/T33r5Wy3lZP92MvfReo0MNwQeutTChPh390J4R+n0GA9IxUaeaVelXBO5uMHv+r8+BD4VP2JvuFC41YflaURJhCDaA0FFQLa5txCjsbXmWETmL9Ggfyj1Dy8mpACJE7ljNupiKfjH4=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wt-RZCZ_1763706884 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Nov 2025 14:34:58 +0800
From: cp0613@linux.alibaba.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	guoren@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2 0/4] perf vendor events riscv: Add XuanTie C930 JSON files
Date: Fri, 21 Nov 2025 14:34:35 +0800
Message-ID: <20251121063439.2545-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_223508_327921_FC3EAFEC 
X-CRM114-Status: UNSURE (   6.03  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

XuanTie[1] is the RISC-V processor brand of C-SKY Microsystems Co., Ltd.
This patch series first adds vendor XuanTie, then adds XuanTie C930 CPU
compatible, and finally adds pmu json files for XuanTie C930, including
topdown and some other metric groups.

Note:
According to the "Standard Manufacturer's IDENTIFICATION CODE"[2], the
manufacturer of Code '0x5b7' has changed to C-SKY Microsystems Co., Ltd.

[1] https://www.xrvm.com/
[2] https://www.jedec.org/standards-documents/docs/jep-106ab

Chen Pei (4):
  dt-bindings: vendor-prefixes: Add prefix for XuanTie
  dt-bindings: riscv: Add XuanTie C930 CPU compatible
  perf vendor events riscv: Add XuanTie C930 JSON file
  perf vendor events riscv: Add XuanTie C930 metrics

 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 .../arch/riscv/xuantie/c930/basic.json        | 117 ++++
 .../arch/riscv/xuantie/c930/ieu.json          |  97 ++++
 .../arch/riscv/xuantie/c930/ifu.json          |  62 ++
 .../arch/riscv/xuantie/c930/l2c.json          |  87 +++
 .../arch/riscv/xuantie/c930/lsu.json          | 182 ++++++
 .../arch/riscv/xuantie/c930/metrics.json      | 538 ++++++++++++++++++
 .../arch/riscv/xuantie/c930/vfpu.json         | 177 ++++++
 10 files changed, 1264 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/basic.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/ieu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/ifu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/l2c.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/lsu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/xuantie/c930/vfpu.json

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
