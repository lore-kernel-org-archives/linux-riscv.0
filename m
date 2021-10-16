Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C8C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635D460F9D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 635D460F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZEg2t+AhOErNRcE7InrTYL3z8DKT+jz19KFX0VV8lQ=; b=2H6jpMqsty0w80
	XhQPC0+EKWEqmxWOfcKVAZTjLYwS3dpRweLWXiTKL3jwr6X4e2aFhrKk8+brsk1jHiTFcBrvARuZO
	gQUOJp/igQH/zTD5X94lCYO2HstrG1XVblttsmX1QAfTp7Wg4ktUnWvgU3ePz6mqWCS2D+Q74ZvhC
	ExAlmYmJzhrs6RjifLvJD1drfE5Pu5AUGWpaZEYVEx4y6BKihXibuusGyeSxQPZeXcEDKI7v8mKs6
	Keb1DdSBro23+6BjpdpoGMHmbNQBQkvTN9fuLlEMSWhxvNcy0+BOhlEfXJKfBAgYR9OPAWx8oH044
	pCrckOZWOIFdZKamyK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbaHD-009dgj-1M; Sat, 16 Oct 2021 03:22:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbaHA-009dg0-Mx
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 03:22:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A7EE60F9D;
 Sat, 16 Oct 2021 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634354544;
 bh=T6/kZ40mW3xUpYbbHsU2TYb0pOsp3BMjsL9hE9AMFIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LTyQc1dnYk8LtKXzotya/s2dFyrrlGqgFo24nzMHFmK5+7wV7lMJwteLSQwT/UmUf
 tpblBpxSdu/KAZVbNWm2Lm68eDDPYHB3xb1JTd0TKawlQVsluggGNGkd6iP/urD5vj
 3xi6Rvhi7zJOt/1IEQsWQqffrItK9wX5zeKiUnuSutVzVTSK1Ge3aoK0AutcxM0WPD
 dCH2pRK428vPyJl+a86TfEkBnyLyTW5nz6yeXd4QEwmyBypSmSr83LQPzDmwL//BAw
 jQ2zFGPT2NLuTIdNMilcnLGvCCjYOniA2j6Ekhuc5Pd9m+pr4O49oXqgploLIy0ZE7
 if+RhhLDLzxQw==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 3/3] dt-bindings: vendor-prefixes: add T-Head Semiconductor
Date: Sat, 16 Oct 2021 11:22:00 +0800
Message-Id: <20211016032200.2869998-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016032200.2869998-1-guoren@kernel.org>
References: <20211016032200.2869998-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_202224_800293_E1B7614A 
X-CRM114-Status: UNSURE (   5.73  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add vendor prefix for T-Head Semiconductor [1] [2]

[1] https://github.com/T-head-Semi
[2] https://www.t-head.cn/

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..f532a8830693 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1169,6 +1169,8 @@ patternProperties:
     description: Terasic Inc.
   "^tfc,.*":
     description: Three Five Corp
+  "^thead,.*":
+    description: T-Head Semiconductor Co., Ltd.
   "^thine,.*":
     description: THine Electronics, Inc.
   "^thingyjp,.*":
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
