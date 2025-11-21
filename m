Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE7ACFA478
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swbNN9bDzGNmfXyE66AbxYdaMYwKJuh6QBFMgLufGE4=; b=D7RG7Mr4muyk2O
	RCGj+TS4/NX+/iHWaiZxfiwoQuXnTchMqp+tP/Dmxtw7eihZcD+oQAR/XysC2U1yRb+8Z9Iox+5ft
	Avskog5r2xGxis8JdbWzaTeX3M5dyAPDmAXM7JR8R8JQlRQNfl9kDdq4p12Wru63Fg7tVC7SxdO89
	BPUWmPjxyVq3o3ZlCZnbxbb6lSu+jcRgc5w7SjGFeSW8HC6NEdVsS/ZlcKtunIVX6vyeXMn2RckmX
	UrwpPq3sfC6dWrWRr6y60BgaF757eHjIdygAoM3ptgm2CVoFdQS5vBzBxdu3Ag8nlVhvG7o9Cx3ZL
	wZq/Cfs/kDj0e2iRcpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKjf-00000007vB0-0oSw;
	Fri, 21 Nov 2025 06:35:11 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKjb-00000007v9V-3nDV
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 06:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763706906; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=48Ey0y3O33KKcN2qk5Z3Lr1o4LbwnuPTXJlui7gSguo=;
	b=nWmUuDlAcLqTuTmqFl1751y7mqqPHvzKxlBWUWrTh9kfRZYeURlZ7rzOMDAJmQV2cXcZ2mw5qV3AMqSVAS7dmiJqv+F7c/vEeYserMyV+2vzmo0v/RMrRDTATSfhqNdr/VXjzRw1B+yv0Tp2zuAILDByJopEMhb/F9rmZBPBP3o=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wt-RZKC_1763706899 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Nov 2025 14:35:00 +0800
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
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for XuanTie
Date: Fri, 21 Nov 2025 14:34:36 +0800
Message-ID: <20251121063439.2545-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121063439.2545-1-cp0613@linux.alibaba.com>
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_223508_326137_375F9731 
X-CRM114-Status: UNSURE (   5.65  )
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

Add new vendor strings to dt bindings for RISC-V vendor XuanTie.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..5d28b2da94cd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1829,6 +1829,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xuantie,.*":
+    description: C-SKY Microsystems Co., Ltd. (XuanTie)
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
