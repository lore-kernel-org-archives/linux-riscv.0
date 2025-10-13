Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E0CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCsr4qVx1EebOXnHhDY7wzMAK1/qU6wtOfBXXJRUFCk=; b=d5SNg4UH6xZCeR
	rr0lnh6RRBXP18oYHeiPQQlQq3se4Gzhyr+MesgxVDLuoRpGzFQCTrTqLEa8eRAHq9F7i1i9ylAGZ
	HUnoDSKNV9wFYm1U5yupZVmQgY3pNLCNOZFb38P+Fb5zoaoyuiiZrLXzruO1gYvItqneNPMtDoeeY
	ZwzzfI+JAZEOVThC5o6D57HpSWxsbc2K3SQoQzHx/svbxsJLdAuzzJh1M/3NpCJgiMip84VCHHyKO
	uMWeOQvz/avDTL48IZDEVZQFYYUH0jeM5ArjD8ujt7MRX4b9dmV0yFJ17ZvyIllJj0iWUdSECdqjj
	GeWQbgLsA/KPoqqdD2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Mee-0000000E50x-19KJ;
	Mon, 13 Oct 2025 17:48:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Meb-0000000E4zc-44XQ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACB7D45231;
	Mon, 13 Oct 2025 17:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD02CC19421;
	Mon, 13 Oct 2025 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377693;
	bh=4tliw4UQndH1N9g1/up84eMEVp/xYC+YCAsm2JdOf3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jEke+fgYjB1mUr/bWEFrIGcs/AqCyLZw0E7ayMz2kpPI96yMJE5HZnMvF22I5BHQ+
	 HvXtKAaqDDy/5VW7q3zwbN78pIS0HAJjdZngKmuxViGWUCnahZmzIfFXXgzSs2pGFQ
	 cLPqeJMIpfwLcAb5ZVBhOiiUwOez5aBh/PcJBFIChLHOk/ip8yA+fPFKWGL4uML6YE
	 jaYJwxOeAB/xwFIBtBVkzS9ExjXLCdKYS4eoAHBsnYFtGPeQRNCYqpYx7CnzQ9bpr1
	 wRaCbEBihdVk1OQj0hVY6zCqaxOX4/UFhpszImq7SkLhAYKLGpdpy5dhS8ijtRzjbj
	 Xy1sl0jrUSK9Q==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] MAINTAINERS: rename Microchip RISC-V entry
Date: Mon, 13 Oct 2025 18:45:41 +0100
Message-ID: <20251013-unwelcome-crusher-2bedb9ecb35f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WjqbuqvJbBVUVn1s3EoLv4wSnU+jVPnRC0yZy4Sseq4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrQ6y/Nq440O46HGvly8niUk2cq5knPvlxNb4/weSa l0+1/+O7ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEHnkz/FOzPcL1ciUf5+Id 5pEn38tpNAcv+X9EqKN1X9XlEuMAcXuGfzoX+61nz7q9OC0s8F7VovQpZZktUTKdR2bvm5b90+1 GDxsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104814_032216_0F6F1175 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Conor Dooley <conor.dooley@microchip.com>

There's now non-FPGA RISC-V SoCs from Microchip, so rename the entry
to reflect that.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a28740a7d87a..24efae3df425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22079,7 +22079,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
-RISC-V MICROCHIP FPGA SUPPORT
+RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
