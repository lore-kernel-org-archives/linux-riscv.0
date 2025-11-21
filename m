Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AEECFA47B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUC6dhtjlwvnrk5+sMJ99RUx4gizra7eq25AWfMkbXc=; b=mzbbxAMkzPTWZM
	bSJsFFoF/QwoaF69IQUI9gUp6/DPFYlLdCdcNM3g2rG4RFWKGOKZs5UyEmrXoqKshu6qIT2+vRtYJ
	mhhCMMNjAG2T0nmOMnRhnm0rqSuwD7nAvfu9cxd2DfUmO0HI5u/v8jRYNl0/W7k/SneBC0wbchVU4
	/P4uO96T08XZtwhMTRsddCn905l0GcyKDmRvSPGKcgOPOEnmdiKlMH/wjwkb3V3g2qefOvugNHvMU
	yDB6NkJs8V57wNKSTaXzplUrMP6Zd5yt2SqzO3axyzUgVNJUZWoYptW55ER8Q4zgak2SrbKc2/tEt
	1TzLrWqBAJYeGKPpxySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKji-00000007vCX-3KNw;
	Fri, 21 Nov 2025 06:35:14 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKjb-00000007v9N-2Qvz
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 06:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763706903; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hpRbi0CeVm4uXkBY/YnhHVn+gxawjyC4Z7fefd3l0iE=;
	b=rLqrkcf9qfKfz+kja+Ca6Qv3diX2orOQjmm2cWp+hzsL7xkCDcV8Bg4IFYZeh+eRAKpHUGggHX7wFXp3I1e1lFfCsGlJxASiXOBCVWf2qXWTNIEHuHHWDh3iIobc0vi/JQxbT4CHWLPbyl0vb82bYy3SkbzbJeHnqzHL+7MLAcQ=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wt-RZKt_1763706901 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Nov 2025 14:35:01 +0800
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
Subject: [PATCH v2 2/4] dt-bindings: riscv: Add XuanTie C930 CPU compatible
Date: Fri, 21 Nov 2025 14:34:37 +0800
Message-ID: <20251121063439.2545-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121063439.2545-1-cp0613@linux.alibaba.com>
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_223508_337333_E505DB22 
X-CRM114-Status: UNSURE (   5.38  )
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

Update Documentation for supporting XuanTie C930.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 153d0dac57fb..581a95eba932 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -65,6 +65,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - xuantie,c930
           - const: riscv
       - items:
           - enum:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
