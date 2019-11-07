Return-Path: <SRS0=OPVU=Y7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CFEC5DF61
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 21:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E4121D79
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 21:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LULKUd20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E4121D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb3GQa2Qnirp3ZjIeHvp11mqi6QICqyG+tq0qQhRzNo=; b=LULKUd20r1NN39
	sZ52d6U30yHIUxTkvsgGkJQqXdxdtHPl9SiiiW29to9oRf1blFINk63Rg7wmo5bM4n+XesLd71A1w
	PYJoeKYZCLYZk9YS2CttwYaCbA1GXwsNMtqgtOZL8ww7axTaiMsFb1PQlbCleCr7mR1u9awa9hg2P
	wsAHNFmieMYPVTwmX8YYk7hVg98VOK/sLiOxiUvT3GYFNOZx3bD5V2/LdHsNph9IxFixJaln+wkyk
	FZdtiTeOl1DdwLC46rIB/gG7lV4ayHYJTAYTcSBzPkCwINqNPEw9g3AJr6d6+wyrRDtMKTrRMwVkO
	S8h8Iquf/9S1vbzK4mAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSpGL-0007IL-Px; Thu, 07 Nov 2019 21:24:17 +0000
Received: from [2001:4bb8:184:e48:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSpGJ-0007Fe-VH; Thu, 07 Nov 2019 21:24:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/2] dt-bindings: power: reset: document the QEMU RISC-V virt
 machine poweroff device
Date: Thu,  7 Nov 2019 22:24:07 +0100
Message-Id: <20191107212408.11857-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107212408.11857-1-hch@lst.de>
References: <20191107212408.11857-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add the binding for the trivial Qemu RISC-V poweroff mechanism, which is
just a single MMIO register exposed through the DT.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../power/reset/qemu-riscv-virt-poweroff.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt b/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt
new file mode 100644
index 000000000000..80ff6fd4e3b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt
@@ -0,0 +1,16 @@
+QEMU RISC-V virt machine poweroff device
+
+This is a device in Qemu that can signal successful or error exit
+by writing two magic numbers to a trivial mmio register.
+A Linux poweroff is implemented as successful exit.
+
+Required Properties:
+-compatible: "sifive,test0"
+-reg: Specifies the physical address of the register
+
+Example:
+
+	test@100000 {
+		compatible = "sifive,test0";
+		reg = <0x100000 0x1000>;
+	};
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
