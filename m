Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33ADC6FA82
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSVer5AYTcBZ+nxXiNuNv9UO6jA6Zjp/31Gbs8hDWuU=; b=nNPNtjNSHW+ChQ
	t/pBTA238ZBxFNjCp2oy2Ix1z1HgE930rd9ZtQ9KMgEyYBUwvcfOg1RzJ11VmEA80eReCARgURX7R
	z5oHS/KkHbXH5HltMUZalHpO3QWd1NubhJw07fbEx96WuBf6jzB0ZJx8NfRMopmUuSIcEb+/idSx8
	a8fNzzIVkBF8kt7f8eG7/UanG1bKdOVYAGiGPnegSOCEznuZjTHr8BR3KXfzRb2wtFcCQ7RrrqV47
	OjuFNgxG4FY0F/ms4GEF8MeiqoBeZjbHmtSlGp4jFvJDJhvWJPWHuzmoDC8kLprSGzWBm6dPQttjs
	wq6bKXhQx3BRNpDGECvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuW-00FUoN-5t; Thu, 01 Sep 2022 22:43:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuS-00FUjI-6e
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:43:42 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9CD86601EBA;
	Thu,  1 Sep 2022 23:43:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662072214;
	bh=KzKhwls9rXQht8qlDBSXnDEtPH0QZN4XnleCNhtFc2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kpfF10M5FSXdKo0xIxEt1vC/iH6NSySzU3FZjcVe/7rN8d5OR5up1eZhQu5YiZ/fu
	 ObJrfeJaVpEmyXLSvgR0QnPqX10nAeQavXd0fxostkX9WOE2AjGkty5OBVWlVJZ5aU
	 jMIRPVv8OlE1Fgt4YSpIPJrZu1/TYFll/AxcVQDsFJciGJRMc+qcLcN+bEkeX8IoWW
	 G46sX0BWmBIkaQjsbGfTQ4XxNe2NEPSSZtbKQHgd9b4QuBM7ZKdcxIPOjBcDdRG/gu
	 M5NUuZq0JhlA5+KN/ccJew0mpr8AymDHv/mVpvbWplBb3qWGKlJcYBFOTZ5ZSFCZc6
	 sRwNh6vOZT+qA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/3] dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
Date: Fri,  2 Sep 2022 01:42:51 +0300
Message-Id: <20220901224253.2353071-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
References: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_154340_468136_52C51BFB 
X-CRM114-Status: UNSURE (   8.68  )
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

Document the compatibles for StarFive VisionFive V1 SBC [1].
The board is based on the StarFive JH7100 SoC.

[1] https://github.com/starfive-tech/VisionFive

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 5b36243fd674..9c948b379c8f 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -21,6 +21,9 @@ properties:
       - items:
           - const: beagle,beaglev-starlight-jh7100-r0
           - const: starfive,jh7100
+      - items:
+          - const: starfive,visionfive-v1
+          - const: starfive,jh7100
 
 additionalProperties: true
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
