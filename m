Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B57C48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImGYYKjlXTOkyXLU+k3vYk3xwThyOLTFTxS7AtyAce4=; b=sle7tXGjvMt1Lg
	NdJFtHfKnzQxCCD+MW1uAnB4ARxEwJ3eOXZDMDsm5FSfzrLD1vy3mz3lt4TW2KOpChV61SeKOGjKv
	5chb9TuDNPIbMX0I29+UfxiS1n7lRELPa/7RVYMOXekdlx3mhx9MePRopf217ChgT9qg4h+Zxf5hl
	GaLp9hCYrwVLFHn48ZjmezAKXw15BRgVHRcar4Dt8FqXmiuoUn0XJrEoscRlmZUNrAdq6Qorlj1IB
	j7t2DVM0ccgB5MQvAwGT962MxZHrtWwbHXnI0Zqfgh+4zvHMm/4Wlwgav4Z4NdKi9dW4s3I7YuYnE
	EeDqAL4fRzJ5V0LCwdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM5r-00000005rfD-05yq;
	Sat, 17 Feb 2024 14:55:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM5o-00000005reB-0C4j
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 14:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66FCA61387;
	Sat, 17 Feb 2024 14:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3151C43394;
	Sat, 17 Feb 2024 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708181703;
	bh=UJc8Pftdab1S/MgsZW8hxK4dRCrJbQnMNrplUSPk6L0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hdw2mjoacpFfvtxW0Xx39lnqAvTuZy4rvCresHMo6Ayvc2p3UG32PNZlVI8nj4gHc
	 4d15vZkCGAsCNgUH98zbLdxvvLo9Ag9GMvlh0hfj0XVXaZg16GjiHzwA8y7dsxrjE1
	 QAevFzx72i1UPZ642yXtrzVA1PkGDp8ws3zfivut6OTf0CEUjVr2atmW1PyIl5KrMD
	 iG/J/iQR0d1L8iiTnVLMmYoFlwnlFzt9BskCK5/ZszT+WtKos6CRu11byEU5c7L5wb
	 RMBZJaZ59c94/gNxWgZLCLQ7zC8Of0VI4ean/Yymtr/qADlKHnUwbu9r+kkXYUylbn
	 KKtDoNu2cmxzw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo CV1800B and SG2002 support
Date: Sat, 17 Feb 2024 22:42:01 +0800
Message-ID: <20240217144202.3808-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217144202.3808-1-jszhang@kernel.org>
References: <20240217144202.3808-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_065504_152785_CCADF119 
X-CRM114-Status: UNSURE (   8.23  )
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

Add compatible value for the dwcmshc controller in Sophgo's CV1800B and
SG2002.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 42804d955293..4d3031d9965f 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,8 @@ properties:
       - rockchip,rk3568-dwcmshc
       - rockchip,rk3588-dwcmshc
       - snps,dwcmshc-sdhci
+      - sophgo,cv1800b-dwcmshc
+      - sophgo,sg2002-dwcmshc
       - thead,th1520-dwcmshc
 
   reg:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
