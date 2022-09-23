Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA920C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5moK904Hqt9CM+HnRKEgWtn37pgyFR3Z4oWBPutaSMw=; b=XJ0WO2ipjbNebN
	CoCvWKmA7G0VR/bjic8QTPZXOi0GWA3lATevg7Ckejq7z40L70qM0SzXFvr3qSg2HW0K7hkdVN4vW
	/au8ufhA0uYxq1HbvdbuDMOIiD5gHO6PD9zbEmTkch5LOtyfoua3iQExzBC25oDKGjSW3uQcjTKvC
	RSRc3mP+X7gtLjQ2k+VXGkeeJLxkY4y4bJgrFjqyOPe7dfjWgXAeJZRl341dD9rieLCvGOADmLZNp
	KO7ci55f5fy+Yy6z174mgC37cr0PzE0em5URGN26S6iKBNWX/OS7GZlkxzW/YjN69FmbHh4OWR9ec
	37QnmnIardA8FnIrSgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrc-005QPU-0l; Fri, 23 Sep 2022 18:57:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrW-005QM8-I7
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6F4F61018;
	Fri, 23 Sep 2022 18:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D140C433D7;
	Fri, 23 Sep 2022 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959441;
	bh=Ie9tup+PG24nxiudtqJc+/cxeoaAIvziRyVYopTjAUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9VmJAtSwrFSfCBVPL8Fg857vsUCtoI62rERYobT4SK79mQcgeHqdw4qjlHVttM0t
	 befulf7PIEXRDLXT6yHuB/1gFmXlMPHpi/VVp/4V9iGuFMzDbsQM+1i99lcvlDXm9T
	 uHAHX2MN6u4r/cnZ8XqmWRH+nj5Rx5RhJ2eCJ5snErTL5WB1KpJav1CSBmz2XLC0lE
	 LG/6PE1NFM6XuMOlUVdUKtZ609oBdFLobYb8bSdFdVoi3S1NZv7GeoXWbgwZY28JPF
	 uR534rQRjdlfpBnSg3e9mK+uG+a6ntV4PrOIF0RJoyJNEVXgvlM4YS67hb4pZZkxbE
	 CsDDi1wbxa2Kg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 05/27] rtc: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
Date: Fri, 23 Sep 2022 19:55:44 +0100
Message-Id: <20220923185605.1900083-6-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115722_667309_073E67F2 
X-CRM114-Status: GOOD (  12.68  )
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

At LPC, we decided that for the sake of consistency the SOC_FOO symbols
in arch/riscv should be replaced with ARCH_FOO so that we could have a
consistent policy regardless of whether a vendor had ARM legacy or was
a RISC-V "incumbent".

As the PolarFire SoC RTC depends on the SOC_ symbol convert it, and
while we are at it, add the ability to compile test it for the craic.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index b8de25118ad0..fe0ea16aa571 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1986,7 +1986,7 @@ config RTC_DRV_MSC313
 
 config RTC_DRV_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC built-in RTC"
-	depends on SOC_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the
 	  built-in RTC on Polarfire SoC.
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
