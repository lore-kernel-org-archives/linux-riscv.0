Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED6CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCsr4qVx1EebOXnHhDY7wzMAK1/qU6wtOfBXXJRUFCk=; b=CJEPFqsmuBpwld
	UtrsT9ThI0VjLNv0ofioYyEcBi98lzZOPVI42RFLbnrnl8YJeiLTytSi5gqIaEKhWkjJzhtYRNS52
	DRjAscZRqLGBupRr8GpdYTBaATNZ/NE67+TMussHYkdhmYeBgiJlmCERrb21aWAJYk+CzhknBHa8u
	obOyEo62+NP08PvAZB2uEg7UWJGTA6wjR7X2jWhlLJe3gbjEb9gmUm1+ie9ZIVT9/AoiUX9Syjd11
	QV4xjKWa2hLoJ6jvS0n+tD62Clbr8XNYxyo22TgZswwJXixr1MEbfKnrR5vHFSkt5eDfzdR5ONEXG
	BsxZcGJTWb0WOn8NDfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0U-00000005Ipb-05si;
	Mon, 10 Nov 2025 11:24:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0R-00000005Imz-33bj
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 700FF446B3;
	Mon, 10 Nov 2025 11:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A71C16AAE;
	Mon, 10 Nov 2025 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773859;
	bh=4tliw4UQndH1N9g1/up84eMEVp/xYC+YCAsm2JdOf3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AEC6dCRfddyR78ZZ50BzzVGaRNGXHaxZrETUuQwVxhO+HJhud69ea51CVKnRUxMz1
	 GkYETkcs1qyjvHqbzVQnaccSKcsgHLpOu8A4unYLmdJfrccm+zzs9Fd2gg/JCe1b0b
	 0jxz8FGWkV3NEmKP/Vz08cmF05jtfFa8nSzacnmUY0wFiUq8e4Se4yoIK6kHfoJxW2
	 WfQe9imOiTgRIHZmHFHahtkc4Rus2qbkqE+VbekKx7ugMMTSqmOKPOnaE5+QypO54F
	 TA8jaWXfw8Qj/lJ5nRiNoGzGWVxUIUylYTalhLY+aUPkcC1or2skdYFgIcEO2XCz0l
	 r8WFyroMh9h+g==
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
Subject: [PATCH v7 5/5] MAINTAINERS: rename Microchip RISC-V entry
Date: Mon, 10 Nov 2025 11:23:54 +0000
Message-ID: <20251110-feminine-aware-9a4b62e8ac0a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110-zookeeper-femur-68a0ae346397@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WjqbuqvJbBVUVn1s3EoLv4wSnU+jVPnRC0yZy4Sseq4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmCpz1OVp1fejhP4cflksK2aancMk4fN3f39M9yestio yrgUFjfUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIms28XIcEbsr/syZxWtFdOu NfFYqm5X5GxWm7d4du0bhavJywI4lzP8r0ix2SIm8uz6PqkoJ+MXWi9EfJ0+6UZEW84QVYywfze dDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_032419_798235_C2392C3F 
X-CRM114-Status: UNSURE (   9.40  )
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
