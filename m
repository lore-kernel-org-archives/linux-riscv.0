Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184C3D33A20
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 18:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxh0ShkSXMjjDKYghrq2ZFVrMogJeDxOdkeC6oF6cnc=; b=vPddrtyql787KM
	o5mz0zm8gXGk/Xt0H3FbSV9hHqtTToyiSjamC27vti2hndRYZOHNNoR3Z+iO/Lcx2TIzH+u8UALBa
	oADYzxptOWqNGkeJ9ZCdoNklYJAC0OsllBqMq4/YQrNoisP6DnWL1KELlVCaCqZy/1g6vpNezWees
	v8QdJg0UO49p6j1eHRaJ2ii9IwIpvaL2whyqIn3OdISooRLEgOXP7D58RYFPXbqUdMR2ETpiwlgxF
	fLjP3rXnaArdSuncMSqnKWpz1mXf4gOmFB9EtZDEU1/3XjTyEj3u8yxvToU0tyKSma+m5Fkq7/qNd
	krGS7QgHlbPEHn2AJSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OV7-00000000Plu-2lrT;
	Tue, 05 Nov 2024 18:42:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OPk-00000000OES-0Nil
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 18:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730831788; x=1762367788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z6u/32qG+4VOxWxyQMcxtikghEw3g/GuPpIgKl24hiQ=;
  b=tjuIRhfkE8cn3XnCLsOHmUvrlH2mYcW3+bnhp1CMWJ54DhluvNTrXYsL
   5fQa5bd7raLrw70eD0Kw5RhZLDw380oGj8CUWTjNyPjrTHfnt+TqMlQtJ
   lS9nt5t4cm6lynZsByjqJAZAPk8Giu7HymiMUrF15ZQeEy0sQ43IUyrL4
   fiqLOlEkj54PHJ8jmjevDDofc9FWskoxh4GlXwYLYS9yr0vEsr5DrzgKR
   vsbzPo1lY2p37qtEQsb7fTKVTz0E3UNcGBPiYSCFfBxfV3Ye39U2VH9Be
   LXXSUkFyn1uuhsOndpdMTCYMT7YlWo4gPpgLY8AQqSGT8xbGbK/wMYBiQ
   Q==;
X-CSE-ConnectionGUID: T1uVhdVNQzWREZUebUBC5w==
X-CSE-MsgGUID: KUCIu0viQTCzfI5QziG2lQ==
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="37385616"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2024 11:36:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Nov 2024 11:36:21 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Nov 2024 11:36:18 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ycliang@andestech.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<peterlin@andestech.com>, <samuel.holland@sifive.com>,
	<conor.dooley@microchip.com>, <alexghiti@rivosinc.com>,
	<ruanjinjie@huawei.com>, <takakura@valinux.co.jp>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 2/4] riscv: export __cpuid_to_hartid_map
Date: Tue, 5 Nov 2024 18:35:11 +0000
Message-ID: <20241105183513.1358736-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
References: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_103628_295769_9CEEC5F4 
X-CRM114-Status: UNSURE (   7.17  )
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
