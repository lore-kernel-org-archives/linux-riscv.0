Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC4C61D96
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4Wnjyad5xBKmB9QoATW8nvbYUFhpVRZTyJGNQvJSdo=; b=RkBtXCNKRokNbF
	i4opH/vf5BDhZ1aVvwxIhUPGpvrPXWLC/wdpkCf82bhpa8ESMLYefd3SnZxwG6l4v1+VCATZRmgEO
	wAtXETO/h1ZG1no3nBEHgAkf4DQbeipRREvBknsUQZ1Y5nM+n/ZmOxwdNru2hhGbH5Var7DVbWjV+
	PrHIwFGaVivKlCLQGt2FeEWrZ7Wee2lK3+3Jj4k1dT1ureBwofnCYdD3eeBnR8CQTiC52qH5ew5FE
	eRfns9F2kZLy5IuvGfffu9l4/576El3LYeBspKAQAyGDdmnxWBZzGTFLvFkpTFjmSicbRPMNUjijw
	/e7sqG4el96u62yNgAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R3k-00Gr3C-0f;
	Tue, 21 Nov 2023 13:45:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R3X-00Gqpq-28;
	Tue, 21 Nov 2023 13:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AMLeOPj97UWFUJITi7pviQd/DMBECoV/Ju2iA1XroZM=; b=dI9yNfhWRlCZl2+N08sQCDjYKs
	HxjUEsFQQmz6As04wvLH79yIs+qlGPFJTWcoEZTD9UUJIr/vHeutTsr6tYoo8H3u+CsmDq7B3k1w2
	mO6LjeSYGpAxvi5yCXLeC/ZaGCAaHLEJKBQB2YPiyqpUtfWuJlAVPoDcB46AFmA7cFsWNPCHz4+sI
	GQQlvrIIZNDnU1gHZveHchJT4uo0fmHV0eCqzmIG408o8C120HJi05c6c0ImV71L856//EjPjMDZi
	AunSnfERbi105QA9vE/sfd/2W7HthBqFQwE/wHLQb6sMnBM1ATBzzLWx8P5O/732oPEk1tL2TNAgg
	nl29rHGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44222 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R3P-00078T-1c;
	Tue, 21 Nov 2023 13:44:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R3R-00CszO-C0; Tue, 21 Nov 2023 13:44:41 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 10/21] drivers: base: Move cpu_dev_init() after
 node_dev_init()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R3R-00CszO-C0@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:44:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054447_738564_FB5E4D60 
X-CRM114-Status: UNSURE (   9.98  )
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

From: James Morse <james.morse@arm.com>

NUMA systems require the node descriptions to be ready before CPUs are
registered. This is so that the node symlinks can be created in sysfs.

Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
are registered by arch code, instead of cpu_dev_init().

Move cpu_dev_init() after node_dev_init() so that NUMA architectures
can use GENERIC_CPU_DEVICES.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Note: Jonathan's comment still needs addressing - see
  https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
---
 drivers/base/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/init.c b/drivers/base/init.c
index 397eb9880cec..c4954835128c 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -35,8 +35,8 @@ void __init driver_init(void)
 	of_core_init();
 	platform_bus_init();
 	auxiliary_bus_init();
-	cpu_dev_init();
 	memory_dev_init();
 	node_dev_init();
+	cpu_dev_init();
 	container_dev_init();
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
