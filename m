Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A733CCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BS+2NDesoUeplA7fFFzij6UDk4ltEmDFY0XCJWmhzSc=; b=MYx48y2eVNJX16
	jIpv9Z0BmwhkMdSjEOyKK6GiSlZ62T/yjkuY56tI8v0SaDveyzcX5TWCWOSCT/equTDfNElIeD8Vk
	k7NDeTeOdaJcdpsB+rJ14YdfusjOQjfGFhHbLRiohv2GmPwncO5nX8NGnzALEb7mRTjm9BGYTbgbr
	GAior1P047emdbKpl12PyTNYxcNZQD+vvzHzwC+naVdbs5yRhKmNo08tfXR7TVFVCwTpJwK4xQ7Kb
	vfPBzvovJIn8BTrmRwuFN6NMA9V5+MEMPdMYyu6tWTE2RfcIzMjwILW58yv7JIQVMUNPcjv71zV9o
	/apTlRdWwrxd1EzPsNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgA-00000008Mwf-22fH;
	Mon, 25 Aug 2025 15:00:14 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXBa-000000084di-0kqw
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 13:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=984; q=dns/txt;
  s=NAESA-Selector1; t=1756128274; x=1787664274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bgmM2Zs4MaGQXBFuvCCgN18B8VLoS/Ba6OvWoP3vue0=;
  b=s/LvV/TU93UxljOhqA7FNcEZWr2AMLjXVpeIIwk/HXI/WmspJ/9jTTU2
   E9df871QJDMLy3m9SiaZWw7ZakfZCLGtDkBde5Br9WZu3XhqXBL9te46H
   3sW0p6Dz1egrgYLjHSOL2CW0XNhAzV0SYYyLzPYVK0Hzh32PPo9sMkhGY
   tEdESeAxBYq9Po9vGV5UlLzjGce+7EhHW7j8wgxRoL3Fo0DXdBdou1dlk
   0yKWSB8ri/Ep0jZOEOmvR86TY2oyWAX/OYenABtBz2ro0XYhwANWtDRYb
   jMKY3DqLPrzkICPwbR6hTVTAYK3R67zk7QfcBmQxqxIWLicupCsewnb9j
   A==;
X-CSE-ConnectionGUID: FQt+OotzTViIs+wL/oYrYA==
X-CSE-MsgGUID: azmOoB4yQiyb1QNC0IsLZg==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31566529"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 25 Aug 2025 07:24:29 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 1/6] dt-bindings: riscv: Add SiFive P550 CPU compatible
Date: Mon, 25 Aug 2025 18:54:22 +0530
Message-Id: <20250825132427.1618089-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0814 (UTC) FILETIME=[95132C60:01DC15C3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_062434_273076_A1B64A19 
X-CRM114-Status: UNSURE (   6.20  )
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

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Update Documentation for supporting SiFive P550 based CPU

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 1a0cf0702a45..153d0dac57fb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -52,6 +52,7 @@ properties:
               - sifive,e5
               - sifive,e7
               - sifive,e71
+              - sifive,p550
               - sifive,rocket0
               - sifive,s7
               - sifive,u5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
