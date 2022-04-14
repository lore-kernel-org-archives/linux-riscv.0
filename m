Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC9FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOOo5eCbDYKTcyxqUg8aMKrVnl1nfe1SV+ziGXSxS+k=; b=q2smCmv4iNq+oh
	nNRnfTWRfsreSR/q1c/laqMS/M+07KzhA5AmK6ND8suTQfW0M3WuredQzQyt20lXAopKnnSNO9iRw
	RcOP0Pp7Zd+foHBrEdw6D34TeQ57CQRH8DIChEt2qdu6BMaBjtpN9KZ8rgIeuTmgUBBgQNc5v8Ea/
	z5OrmhLablrR8U117spyYxr6XzclZnTxWHA5K6q0+QUJ5V7oDdOckJRDc4dLM06UMhFG9v/6TdtzH
	FQSjNJr4N134Bh313paVwY06+iibx/RBu1echBCfTTdsGDrpz+kX7Dz2Xmfj+76DDVQrqCMMrzJMv
	yDtlc9qYwk3EW3JDHokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1DK-006Bru-A6; Thu, 14 Apr 2022 15:16:54 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1DH-006BrD-Kt
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 15:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649949411; x=1681485411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iYec80PJQH6rxvX/OaQmAixOdX4LN48hjcV/HrL4vFw=;
 b=DzCJhw7nwStKto5FF8mLwi/h/ZLr+mr51CQPVu36gUFSCYKRjYEEYT8L
 fy8elcOxm2swaMWnzO8JX+tTFWPGUYDRG5fx+FfsbEOOIT0IGiqDgs7Sl
 TxHmeD7D1EyDccL6YAp48UjdIyX50AESkS+Mgy5untds5ug5b3zRV2g+2
 7l1UKWeL530OZ1QmV1GwUOv2ZEcmD2W6MCfAcuZq4zQSeGtXDqiBeEV0v
 QsYiO8ey2ZIikQ3WenuAn+kaLxmDXt+GfMt6qK88+ITEsEUI7Hz2U9f9x
 VQcu8fAJDLNfWD82intBnbPPEYqiWUPuHERy28rXN45vT+1gZEMqCIkSU w==;
X-IronPort-AV: E=Sophos;i="5.90,260,1643644800"; d="scan'208";a="196786202"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 23:16:48 +0800
IronPort-SDR: 3DEFnMJ9Zzs9zguw357YA6+Gf6+k8ORIl9ZdcA5T9OsXobk43k1ynWkLdFGChBMJNuSxWA72qa
 dclCXsKHqpIDy0L8jXso20/WSJQyvcucor/XzX8EvvOvBiSjJI+rXe306d3BWld8uBnjFjkb8b
 xTqk8DefbYw4yMa9s5uVyKefCICcwi7brfbl63cRWeg+O89/uJeiAPrPOD8WQJXLoqQj8BoEHg
 WqzJG2fZFoaJLzJjXNmEHYW3JmFLOykzS8cQZcvXc3b/JjRo6Ctc8EBe854KSeY8jjJS8iPX9t
 E5GaXStFaA+WIhXKmoojmf+A
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 07:48:01 -0700
IronPort-SDR: A4SysRNAyrMZ1jbwnAGGOFL7qmGl1pz2l4bHnQ1SNYk6pK1Mj3j1iJRqZqJs7dATyRyPgb2kVb
 Xba79PTuJQaBQPwDMYDSCNXwu4ADfG/X/8faX4JwafjgNjS2RmAGbH/KQNoAghsqCF8UjogYdQ
 ngP69Sm4hpGnuDosDKY0Tgl4iSIWcuOEacR7cznkYEw4Dxx1UBc9rwOnMXKl3IMKqtFxTFMaQK
 k9CRJqu7ZOyhx/LBpImamW164d04JplOPVkZzXkZrMx3ZCp7q97mKvuIBGMaojVWKZiHkqctBr
 vzc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.21])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Apr 2022 08:16:46 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: riscv: Add mmu-type riscv,sv57
Date: Thu, 14 Apr 2022 17:16:38 +0200
Message-Id: <20220414151639.1359969-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_081651_841022_7F2F6475 
X-CRM114-Status: UNSURE (   8.43  )
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

sv57 is defined in the RISC-V Privileged Specification document.

Additionally, commit 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
changed the default MMU mode to sv57, if supported by current hardware.

Add riscv,sv57 to the list of valid mmu-type values.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..3100fa233ca4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,sv57
       - riscv,none
 
   riscv,isa:
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
