Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4ACC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFD061369
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFD061369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LUKV/tjBHzj89KpdHBd/H+qU4jW5D5HMN9Nv+WSRge0=; b=TlZkFuS13g0MNA
	5Peu1C3ixQTCPdpgc2EM9ZTq0FiVmL36LzZjHeGZOH8ozGVBocUT3k/X48yLbOypK/JyRE0aH8zgM
	MGQZjQ1AjQk6LFwam2apjr7XbmyIL0tel1/7HgFV1iZpg7iygVCgG7tSimuqktsJgO1Z6k9d920o+
	kBZiCjt0LlHljF483scEYiMe32BDtuw+TvaPNJ/X6xXjEF/g+Pm0nQCrj/AOI6CQemfQZeTKidFEf
	yXUTUQ14/vA/woPrfqT1pmWxLK9huh2nmjqywyEtHj5qtjm8AIa5FLJ7hLKhG/SUdX4YEh/BfwoV9
	GEhxRlRPNlK7R0sFPY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltOdK-004z0n-6A; Wed, 16 Jun 2021 06:02:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltOdH-004yzt-CG
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 06:02:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t7so1070601edd.5
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMUSU6K99n6eMM6v4FzWd/f27lBpf54QdzrLJZNzXWQ=;
 b=eDN7IcteeBW4ejR5DRBrsgYhQOoiuJ445WSsziNHLbmBVvdC4qCg2bt2/k5YK60zMj
 b4Wa7iPsDjhQTII9rx36auunzXxRLRvHgADrKjQOKo+RikCRxoQYJSm6V6e/i2Jc5/rV
 b0UCGqJgiI6enMqfOXw5kA20Ye45mVpQ0mGUvkrBQEEdGIge3sILbdxX0Yv1Q+zWcgBh
 0rKE6LbO3vexIRNGGiRgmFd45IpCgow3Y+YOWZ0bYEZDg7bY36cjsEmsJXe2R/6CHO2o
 Z7WgaTswPIpc5xsiAThSNuRZvoLr+6RmEN2dOgt8EducoCIaOEPO4Ff6R2fRtbngu7f8
 tH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMUSU6K99n6eMM6v4FzWd/f27lBpf54QdzrLJZNzXWQ=;
 b=iB+fp34ACLOXfpfsGyC2Q/yxECWm4ZxF1r13Qud2Ss/HU52C01I3K8tZmqIvbf2Exi
 Cc3iW6R4OcW5kdU1acebKJ9hEd/f+Rg3TF+7ujE5ZjhGfeVeUijLW09LNpZwvkTcEC+Z
 FLdWuTdJw44LjmpL612WWGh6akdHWIoiNPTxUmEBGJaMAvjynw22b+2E0G9OKHbexGeT
 poGWRSS4hWVOXt6sIBszsq3WSX9wfriZH062eeLH+pvdRm+tnW2tfVu91rz5PkJfE8VS
 5ymGKBeJk4nzb/K/XvnmrdIBM2q/zF5rdAdfJYkfOk1rMg74VNnXLA1JbTND89eIAoo9
 ewBQ==
X-Gm-Message-State: AOAM532NxdJ87My1FqrXExzRn4Xzs5chk9BXsV+54IZv6Db+jYMRUmOE
 0haJOVk+g+zRoA7YIBAM9zw=
X-Google-Smtp-Source: ABdhPJxIvbVJTmCEKtkq24sb9u/ZYB59aYl7KgDmjRTDadndL9icBjx+ZhbJBmaqMhFR1S2RZfTQwg==
X-Received: by 2002:a05:6402:49:: with SMTP id
 f9mr2113932edu.178.1623823353666; 
 Tue, 15 Jun 2021 23:02:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id ot30sm810474ejb.61.2021.06.15.23.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 23:02:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency" property of
 cpu nodes
Date: Wed, 16 Jun 2021 14:02:50 +0800
Message-Id: <20210616060251.398444-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_230235_454577_370269D7 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Bin Meng <bin.meng@windriver.com>

The "clock-frequency" property of cpu nodes isn't required. Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b9819570a7d1..ee54878b3f89 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -17,7 +17,6 @@ cpus {
 		#size-cells = <0>;
 
 		cpu@0 {
-			clock-frequency = <0>;
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -35,7 +34,6 @@ cpu0_intc: interrupt-controller {
 		};
 
 		cpu@1 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -62,7 +60,6 @@ cpu1_intc: interrupt-controller {
 		};
 
 		cpu@2 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -89,7 +86,6 @@ cpu2_intc: interrupt-controller {
 		};
 
 		cpu@3 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -116,7 +112,6 @@ cpu3_intc: interrupt-controller {
 		};
 
 		cpu@4 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
