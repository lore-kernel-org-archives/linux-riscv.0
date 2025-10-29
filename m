Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E59CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCsr4qVx1EebOXnHhDY7wzMAK1/qU6wtOfBXXJRUFCk=; b=QBKk4BRWIPwa77
	TdPRQz3K++TePF0PiJ1r5AvqhRZ7rqFxXCmXtriqQMZ45WMFMaDbdrOOskC60v8XxXXPaCccxX0Zf
	pcQyuQOCUxhnyL5RXkZx4KOQHei+bKc1bYw6lpxaZy0gEHZD+iT16/9ZDKxEUb57srcvv+FPq39YS
	Dnxxe/Lc/lbv90+Rn2djdm1K77exaS3hZEhe4v+FgsuQGsrld8NC0RamsmRslr/5+9ClnPkyQwxL2
	hGTVUlO2DHzE+QZ2/kK29z2aHElL7VZESX1lZHdYPj0C8MWU1ljt5T6rcspwfmaqcck1dfqPjXiW/
	/teDUt4cQwYgU7BDvVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8mG-00000001woI-1RQE;
	Wed, 29 Oct 2025 16:12:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8mD-00000001wlt-2iKb
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A29E43C91;
	Wed, 29 Oct 2025 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9E4C4CEF8;
	Wed, 29 Oct 2025 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754317;
	bh=4tliw4UQndH1N9g1/up84eMEVp/xYC+YCAsm2JdOf3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DDik67Xj2g89qtJbhs05ihSJj1yuG8PXOTAlyqGqaHz91XBjOhszwyGqHOVvLB/4U
	 rqmdClAvEu+T4Ct5K8CAGQRCtqcK+N5cDJ0A0SMUOIk4tjw+waLVHy2csrayoOjxyH
	 oYMTQyfA2utC8FJ8FieW2497NYjVTk2G5DRqwGPhzMwy002nKv1gFDhUe+TYZnm/oO
	 BDCVIueC6yO1hzRzl+la8/bEWGwKwzh4rujaN8N3gZSP7ZUZxUs6LGsfuPusMB31Sd
	 uuKme3s/ZEBMq3/KhhFL7nkHX0HZ781nSOhcyZK11GooOwrPFc0OcnHK0qGcIo44X/
	 PTt6vXAgwIVPQ==
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
Subject: [PATCH v6 7/7] MAINTAINERS: rename Microchip RISC-V entry
Date: Wed, 29 Oct 2025 16:11:23 +0000
Message-ID: <20251029-timing-venue-1cd20c3450ac@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WjqbuqvJbBVUVn1s3EoLv4wSnU+jVPnRC0yZy4Sseq4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlMNusF9rzrT3y85rnMwW1Ve/sfH/j9ccWcxf3H+mWPe l1pU2na3lHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJuMUw/K/M3HBAemLkxk2K 9xmmJPQlHLw8ecIbdqcyp2nb/vxOfviekWGGyeEk84JLk3mTV1qoiCc9nKu58tTMxlX6X1dVuKd LcnIDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_091157_709529_412FB459 
X-CRM114-Status: UNSURE (   9.47  )
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
