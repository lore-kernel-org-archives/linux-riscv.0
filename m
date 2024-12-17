Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF14E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxh0ShkSXMjjDKYghrq2ZFVrMogJeDxOdkeC6oF6cnc=; b=CU79dbekiOkNcQ
	CqX/zpqwDsTrpJ/dCa9YG4HOucXN7wx7K2CDuh5dKVW6s3KLEYdVebNI1HO/R/WaSv3UoFnkOI90+
	u2xkC+uaQqlM6ZbMepnWWBUHvxG2A/rhGK2sI9dL/l6M0HM3XWotyD0LiTPcLk9YM+7zI1ya5nh6n
	5cXfp545DYiveJ8psc3E3fs3y6isu0j+AIpuJJrP5tS76ajFt5814ZZ3MoYbrPTgcYLV90B+cryxh
	9jOCypAOtWUofepvM8/7QLIv3zdp4X51/Rl/0Mht8ofYWDXvLOQoAbSYPIqtAAsqhQaQ7CI4eQgsk
	vi0S+pNHSogjPWE458aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnm-0000000DG8Q-00hG;
	Tue, 17 Dec 2024 11:31:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnh-0000000DG5b-3DwR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 11:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734435101; x=1765971101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z6u/32qG+4VOxWxyQMcxtikghEw3g/GuPpIgKl24hiQ=;
  b=yelTUajBZrZ3UY7kmz3IM2k68go/KWV2e3OoSNQvfBFsXZZ6sWgUh7fc
   +MooTZoODtFcAKMNRDDzCc7YMq3P4YnBV6KPF6g8XjdkDta6nmE9J3DfS
   hjpzaxeOUpK8YgWTJCLEn9z00och62kMFjjsr6SdJBcUTw/abL3b5u4A0
   GHRGsMESFO2+iCAIuXPs74tvmQigNUl8hWr+9fPBUTskPu0RFU29g0KVz
   njjBmSXP+UJBaXTMLm6mnK+KaLEOHbsViRGQdoDyGq2c+uVAN0aDM4W/o
   uyd+EKQyhN0IMy5H5/llIkUcD1k1b4Xm7eX4O8TTC6TVFa9uHsbONwMUD
   w==;
X-CSE-ConnectionGUID: AFXRsVMVRgWVCl8fi3oPIQ==
X-CSE-MsgGUID: i8TL+rXOSa2GoTqCUNnINQ==
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="39361181"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2024 04:31:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Dec 2024 04:31:11 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Dec 2024 04:31:09 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v6 2/4] riscv: export __cpuid_to_hartid_map
Date: Tue, 17 Dec 2024 11:31:32 +0000
Message-ID: <20241217113134.3508333-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_033141_810380_E0E057D8 
X-CRM114-Status: UNSURE (   7.03  )
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
