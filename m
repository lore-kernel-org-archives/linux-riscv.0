Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B692FD78321
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxh0ShkSXMjjDKYghrq2ZFVrMogJeDxOdkeC6oF6cnc=; b=amOaW99dU/jDPb
	HWrQiraxtZOE4xbrlTpNI6XbAttvNLk7unTidg2tfXfUNncCBP7k4NCVRtLBbGWW7pNPhzuzAA6pq
	V/eorRrZkU2Uij9P+cnXKdo5ZwkAdPgU1Er0fWmKJ2szt+2FianCOSwsykOqTNWZLHyxSZ4BTcupZ
	Ae+d2pxjhYViq0H567LAOotZe5wVeBS2PLBIIUTEWh4eYWHX7tHKz0n0SFqS4XkDooRfRr/zROlJf
	V70p7q0tAb2zDVdfphfhuw1IzBBcFwmsA1YztyMeTG86kXUlkawamh4/fy/QaL3pW+BsGez0PAibf
	MpZN4GIweU4uKSVQOlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78s-00000006NGR-0ZHb;
	Mon, 02 Dec 2024 14:11:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78p-00000006NFI-36GO
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 14:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733148672; x=1764684672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z6u/32qG+4VOxWxyQMcxtikghEw3g/GuPpIgKl24hiQ=;
  b=tiIbQBRKDrO2QtgHraz3fyryDSs21pubOy1bduAYUXgQUAuYLSxNwlxh
   9h0maQNIsvLm4Ielt8UDGttBXzlX8UO8YcWBtIpoZbcurnJsfkFAiJvy1
   ILNw5TK59gjDQxvgGz1agcMLtiG/+z8zEnwBpkKh0bFeLwAqwxw9pk8d+
   wCWo9R6/1nkjhqROL6bYo41IeeT7ywkWl3oCWKNYese+Cxi6WvX9aERcl
   YoTBI+rpViZTPCU99+k0JtB7qHYt0159VhBBvhh41igWmyc1Qo6CNEyYW
   l5HekKASTU3RV/lyWyyQFzIZosve/bgvYUm14BNv+flKy6I4FdTh1Mwcj
   g==;
X-CSE-ConnectionGUID: 2KutSU5NQueuFpBXpCyxJA==
X-CSE-MsgGUID: G43RZOjTRM2h8K5I5CB4+g==
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="266205959"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2024 07:11:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 2 Dec 2024 07:10:55 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 2 Dec 2024 07:10:53 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 2/4] riscv: export __cpuid_to_hartid_map
Date: Mon, 2 Dec 2024 14:11:05 +0000
Message-ID: <20241202141107.193809-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
References: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_061111_794899_B3D90A65 
X-CRM114-Status: UNSURE (   6.95  )
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

EXPORT_SYMBOL_GPL() is missing for __cpuid_to_hartid_map array.
Export this symbol to allow drivers compiled as modules to use
cpuid_to_hartid_map().

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index c180a647a30e..d58b5e751286 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -43,6 +43,7 @@ enum ipi_message_type {
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
+EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);
 
 void __init smp_setup_processor_id(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
