Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B783ECA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1KeGdiQLXkPS3bz+4h85d3KhznQW0uWpolkETNelpI=; b=YUdbgExVslZTN4
	x/GbCbG1stSDxg7vbTjinQ/dtXJ2H+uW6BBSAjHSInpDwcY50Azcl8cYPHArmVZkFoRrUHhnQiVkt
	EHVcfXDpmlCf8LBUNH011CXTU2alGeskOh0xaht71FEmYDCpiznrgjJrWSlgiwvSoZx4+b54sdjla
	GAD94aO0Ume+unwnIYtIesf/ZkvFKkRn5OFxmKiTpdQ37Fsw2RuzPj/3MAxdyXxof33mw8sjmAM2v
	kYjy9OCjpFs+Ufi5oJ5t++27OsfF7TllxByE8liCfoDhoFC9D/Mf3cJTtQzUqtRBlciDFZZTfa6r5
	JyVYGHMVbSOQ24SOo3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaZ2-00000008knN-21kU;
	Mon, 25 Aug 2025 17:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZwg-00000008dsv-3NzE
	for linux-riscv@bombadil.infradead.org;
	Mon, 25 Aug 2025 16:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/K4vVf1HF66L74g6Dn1Eex7g3tfrB2PCZA0PgsdPoOM=; b=ng+4wt0A70wXrkMSoBWy8bfoIG
	Ff2t6AX3VaANQso8s5Ab+DW/EvKuHFKL4g+sqW2XexsFqrMEp2UDkVTA5MXIso1e35hRowZQofQ70
	KK0j+pR3cOomxJNOnOs9dFcUpM7Ej9lvyK/n8MJoxtUH5IAUbhhxPanKFTrvV+qctXL50rKK7Fu/b
	Px9wZjCRZwevi5Wnv2XeXHxHqYCfUxZbkIi55J5VpFdgfjzvkDVRl0KJxnVcSc5z3cOlQyjN/NXpN
	h17iv87c7YgEvcOTtt7CqvkbebmNnS9iQVltSoVU2h6HAELXKg5ATRnCMsyrEzMsyBUA6mX1rWSP7
	3b1VDLWQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZwd-00000001w4p-0ARx
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756138879; x=1787674879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAnyCLRfE3EQgtrPFVJVltgt/YNxdMV/5FZ7fdcJlJA=;
  b=0VVin9diPeLz4zRfTwVFKcG08Beu7V8HR62IElFiawJw9Y5k+HpGnHfG
   Z1QERz95fXfj7G2K5yiVBSjSHrTZVggarewEusT69Iz//jDG+M9Tnj8nQ
   pMV1WAD6P6KbV6o1NiII08Rn2M0AgAQ6lmgrU1XzZIZ+4q/nQs6lmOgDx
   rEj/1WhzZAsS4hYjz+qW+BHR343mJb4B0i4U5pFajTmHUarN4be4NYz4Z
   8734GNIFF5SDYQGee1XoSZE/0OGzOXeBwNkjtUwatB2TfkmFUOfMpMUYY
   jrkrws+/BuBK7gk2MxIN9zrdOcC358LSN41YDEISuCey95noAhISbwNL7
   w==;
X-CSE-ConnectionGUID: aOjtNZFgQlqEbp9cjaRbcw==
X-CSE-MsgGUID: /KQ3Pb1bTmigdZ4WLoj/cw==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="45617317"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 09:21:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 09:20:52 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 25 Aug 2025 09:20:50 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v1 4/5] dt-bindings: riscv: microchip: document Discovery Kit
Date: Mon, 25 Aug 2025 17:19:51 +0100
Message-ID: <20250825161952.3902672-5-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_172119_534167_ABF8CA71 
X-CRM114-Status: UNSURE (   6.51  )
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

The Discovery Kit (MPFS-DISCO-KIT) is a development board featuring
a Microchip PolarFire SoC MPFS095T.

Link: https://www.microchip.com/en-us/development-tool/mpfs-disco-kit
Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 8ddc5c02973e..381d6eb6672e 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -33,6 +33,11 @@ properties:
           - const: microchip,mpfs-icicle-kit
           - const: microchip,mpfs
 
+      - items:
+          - const: microchip,mpfs-disco-kit-reference-rtl-v2507
+          - const: microchip,mpfs-disco-kit
+          - const: microchip,mpfs
+
       - items:
           - enum:
               - aldec,tysom-m-mpfs250t-rev2
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
