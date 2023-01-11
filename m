Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4AEC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UAuVSjC/+8/N0e6LF9pxUU1N3nwZ4LNIoGHPxU5KqYY=; b=g0UdOyEOp0CTLz
	OO/FzMp6HkIXgn8J36Digfn52ZYz6bKYrSubSrYcK82wK1mB2NatRC8se+JoZGh7rDm1bFQwyPJ8v
	da2j60jwKXZ9QVb1Q1Txs+5EglR8OM2FsbskJ2T7f11la378BAD32qFugPopGEBj6KuP+q5xCENnA
	fQGQgkGLIdAtMmiJoEBWpB/FhEVI05RpaRZM/3r7MmQ1iZCS8LN0OBHaUpo+CYMsKmUihO48HUOO+
	5gCfVs3vEfu+istjExobY3159i5U7Rf8XzY6ilaMKDS8VacXz8Q8qfRwn5ZDxMKX3K0Patb4fbbnw
	4gUtGAWODXIDCedtsUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYhD-00Av1H-Iu; Wed, 11 Jan 2023 10:51:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYgS-00AuW1-Tx
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 10:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673434216; x=1704970216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DoZBxvYywwqdWUMyEhh9wRzBc+ZVE32NhmnoIJJMk7w=;
  b=QGI/QHdn0CMiZua0kU8ezsVNbhL9JRdDipBS/Q1ZnEKV5AuVXWiwIU7f
   TvlLS05gDFpLuz29dYs9/vQ50p5jqDkbAYDWl5NOrFaIvprjxc6nk+kTg
   XoSzW7wsGdCGVgCbLvLxOXeig3AJBrrKNMMdNLocq6R6xHdcpVrBmxw3s
   tdaVCkZrybHJ6DsB/2DI4IGinZO/Pl0Uqr38lmltOke/0mW2QRsbSz/49
   wjfHZd3tHQMyjvkO4Nax1IYRfofyOQeJmDCCcpiEwfg2R3JkL3sCEp/A8
   hoeDs7NLUdjyJtb4m33xUjWbf6ti4BZsVjNnKc9WFW54NBJMZGPtwVW2O
   g==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="195248496"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 03:50:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 03:50:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 03:50:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1] RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE
Date: Wed, 11 Jan 2023 10:48:49 +0000
Message-ID: <20230111104848.2088516-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_025017_177357_838A1AC8 
X-CRM114-Status: GOOD (  10.28  )
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

When adding the ARCH_ symbol for the builtin K210 dtb, I erroneously
used the bool type for something that is quite obviously a string.
Unfortunately, there is no such thing as "def_string", but in this case
we can use "default" to propagate the value of
SOC_CANAAN_K210_DTB_SOURCE to ARCH_CANAAN_K210_DTB_SOURCE.
ARCH_CANAAN_K210_DTB_SOURCE is not user selectable, so using
olddefconfig etc will update ARCH_CANAAN_K210_DTB_SOURCE to reflect any
changes made to SOC_CANAAN_K210_DTB_SOURCE.

Fixes: fc43211939bb ("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, this one's for you btw

CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig.socs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 34a54e5310a1..d36a5f39f13a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -79,7 +79,8 @@ config SOC_CANAAN_K210_DTB_BUILTIN
 	  If unsure, say Y.
 
 config ARCH_CANAAN_K210_DTB_SOURCE
-	def_bool SOC_CANAAN_K210_DTB_SOURCE
+	string
+	default SOC_CANAAN_K210_DTB_SOURCE
 
 config SOC_CANAAN_K210_DTB_SOURCE
 	string "Source file for the Canaan Kendryte K210 builtin DTB"
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
