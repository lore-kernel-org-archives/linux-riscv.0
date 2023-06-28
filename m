Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47948EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rqWdqPhH8jjafW1AR5/RP/9aa7iU6ug5OrOh9d9bTVY=; b=PMLH84iR8U7c+S
	c81evgYORmmPsr74ulLu6oj5cBAYN71gtrFQRON0pl6+QdeuzBySFra6fLwm7jC+BIFpc5kPheyA/
	k+g129Ay1qo/iQh/cp+PBBVYBmgAGN2143ktpY1Tny6YVIj/EQUOVdGytxJmpzKQ2gqK7OSdRCyVJ
	qm9/jpw9XcZJA53i/2hxmxCGrD2jDC+k25/n8ARFsTBOG5j0dpe2/0ikX44PLyIBQQGdZmuoWRJ+y
	iVb+y3p3ey7QEL5gSAH4/efVYbqQyIgt8So5HAh7wIS6YAnLyJLe9CinNzw+DBwgr5YhUAAAnVx1x
	h030d0X2MDU+BMrhk5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPNJ-00F2nT-1K;
	Wed, 28 Jun 2023 07:14:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPNE-00F2mj-1W
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 07:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687936436; x=1719472436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iBi0RwTc2avL6Nnxdn64K9mSHsLrRGl/QBwCBLoaXC0=;
  b=fc85bqXwi8I05KjIbtZWBPLjFA7YY/nGaYm5mcswM9FDbOtbeFH67OK2
   Yqzd8+uQX9F36vooFWEM9oO3H3/dLB4/modmg0tCC/MI5YBQb8WtXWUgi
   RrGAMBlpYEC1PfnmSlifhilFEVZDJa5gj2u2bisUtxtv19SlY7uLCwY+w
   gf478SGsjLLWfbY64oD5PmlOzUwcSDlgfVBgTdpPydSfpALQfW7JU28Yu
   RqXSA6r2rRYGufLRGBCMhUpZqeILumX/VHnT2FmorjsxP2V5qAocdJPc7
   6ghzmUxZ6OSsu3xQ31vuJLRH6gG7qEADB5x9bU+e+5aozH9olHn/fwr1f
   g==;
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="232608868"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2023 00:13:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 28 Jun 2023 00:13:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 28 Jun 2023 00:13:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <soc@kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [GIT PULL] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
Date: Wed, 28 Jun 2023 08:12:30 +0100
Message-ID: <20230628-left-attractor-94b7bd5fbb83@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iBi0RwTc2avL6Nnxdn64K9mSHsLrRGl/QBwCBLoaXC0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmz70aZCVYq8r5d8DC1UObwB58nbjs8Gwzs73Id/Hn606n/ nNuvdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiRSqMDOfONT0+o7T2eqnfT4PDE+ uWOqdkfQ57pPxzhbRbzY9D4aKMDNschDLcGjSPaz/ZYDc59svLSRF9doxJ+wquCJ7RFy6czwkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_001356_603389_FC56A6E0 
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

Randy reported build errors in linux-next where XIP_KERNEL was enabled.
ARCH_THEAD requires alternatives to support the non-standard ISA
extensions used by the THEAD cores, which are mutually exclusive with
XIP kernels. Clone the dependency list from the Allwinner entry, since
Allwinner's D1 uses T-Head cores with the same non-standard extensions.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Link: https://lore.kernel.org/all/ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org/
Fixes: da47ce003963 ("riscv: Add the T-HEAD SoC family Kconfig option")
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
A fix for a randconfig issue Randy spotted in linux-next at the weekend.
This fix has been in linux-next since Monday. Noticed your PRs hadn't
gone out, so figured I should send this, rather than let the issue sneak
into mainline.
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ce10a38dff37..6833d01e2e70 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -43,6 +43,7 @@ config ARCH_SUNXI
 
 config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
+	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
