Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72F1C4332E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C9E22522
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C9E22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KLpq49Z7DhnFMT9YCHkkDc29eH1VqMlXGk7x/1PdRc=; b=vxELrD9zJIUOGdXYWq0KTWC2r
	/Vmz1BesdNUvfWsN6Hn9sL/BWHvijArB+6ABbTaFbLTMklrGzXV4QsY0TrbAjlDBf98UCj3D0L8c9
	nSBglLCMKmRmapFNv6oHd9ReX4fjzNNkOBGosPhQ/2vqTyshBJCbCw24A4YyxwPyNMizcEhmH4Jzh
	Yr1Tf603dUulvKJ9aaQUis4RI7qsOrcGCs9EXNwuAQbs5qpX9WEj0L9Y6H3LnCsdJuBFPPh0FgxHz
	OWAbPIOnXIO9cXlWLEPZ8y84pZsFDI48BB8W4maP9U0+2+jkmmxpXF6TxxELr4W19buJjn63iFvcu
	Ms9i+vdHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsx-0003dz-Rm; Mon, 18 Jan 2021 02:03:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsv-0003Yc-Tm
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935393; x=1642471393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CN0WY+YBp4RNoOYHuHqovxX2R6rFlSK3nLo4F3hEm8c=;
 b=fRzmCrLJmtW4R7lOQQTqm2KkvgPSow94wFwGgJMIWzE5YPTI935xBJvs
 lzd/lTgbo5LkCCcGL/K1TSW4lrLI7nTmRtM9s2moo/7CzyIxoCa4EOBoj
 pTGRPxn1vijTZ2Q3c4JT5hTM645yx8/vWauFvuxHeRma+p4hV0imrAgbL
 9vlwgDPv4hpaBpFGhLFDfscFKvZPkwwT1J1YywaK9yQmQqf00AbUet8sO
 yG7PPlSzDMzcKZVWxWt8to9pA67ZD+sTb7HaOJgDuZp7Cpzwpc38D7WJK
 FPi8TeyJvbz7CkFRtHlYLqomiory57x8lCvWxzOpsNAHeM9gh9fVpbwii g==;
IronPort-SDR: 2pMdxYdrT2IVE5HA7ztEpN8Licw6Y0h/V0EB9QMEs+/fKuX8mYf7+uD1y1QCQtKpPTy8YeTW5H
 j6H4g0EaCXtuP91eC0BO3noTtwefZXNjyhHQn98l/HVljyFL5bsArDIjI+ky6Q0I+a/46s/rWt
 8iW13tvbmegHU8ugN3ZL+RoZ0fekzmug1Jq6DFKJVMsy0tx6H6c5lP7VpL2Dmb0E6foab55AMu
 JuHTFwbeRFRrLl20C4yuSQUYrk29Ln/8mlQj/DsvzMORLoyOR73JkDG5WppMAcjJqMSQEUPCag
 5sg=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979912"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:13 +0800
IronPort-SDR: lZ04qGO3bNvVsnrhmCos1ziCDOKbxBEJzsHf4Tsz6MQwyTeyPm5c7ggVo84D9g26KIUwME6W3t
 sxfBaMeK+i4JXmaTGPS6W1K1IrO0nDstFZrMdTbAAq0QJE+/pT+whQburFZb8nXm1alCsoIMmU
 mka36xXo0LijB84VnY2rWvJ9LQA7xmY/9SLbGKAaQwBe3UofzpkfPiw4u0rck0artSN7nZcXfo
 +HZ7yPy0jLff9XOXumGKYJNNe9tA4A+hz6EIhyQlypk5E2wOekW8xXC08NoSmNz7JL2x0YZF9k
 TToHEM70cg/LpSZ4XpXVQRHc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:50 -0800
IronPort-SDR: 0Ww+WspsWKqiL6scSyttJ7h5YcUOy30rm0T6J7XNY3hK+Q3rrPY+mCm8F9m2U6wkiKKz+EdO3x
 VHaiHoB2BsjRlmf03gAVfPFneIa+YeSvoc1jdLBSEjIclvcLd1CSaM3LiCPE+qV+p15px0BlTl
 FePKlcAYXcvGKdCc9nncgoY5jHLCwwSC7voWj2hhWpxBMcihIa+4nCR2pnmJXZrQJjmNtJZ6yF
 VUb68H+E41kngRKZwMGoBk3HzDOgacD1pcSNMWa9pjnWgbroASGkGsoW+kdTmfPl3do5aFJKaq
 ZY4=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:13 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 09/17] dt-bindings: add resets property to dw-apb-timer
Date: Mon, 18 Jan 2021 11:02:36 +0900
Message-Id: <20210118020244.103451-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210314_096194_6E1CAB62 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Synopsis DesignWare APB timer driver
(drivers/clocksource/dw_apb_timer_of.c) indirectly uses the resets
property of its node as it executes the function of_reset_control_get().
Make sure that this property is documented in
timer/snps,dw-apb-timer.yaml to avoid make dtbs_check warnings.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index d65faf289a83..d33c9205a909 100644
--- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -24,6 +24,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   clocks:
     minItems: 1
     items:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
