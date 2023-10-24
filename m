Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE0FC25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSwbgpLj7NgdgBRnB2emOgHya4+ZGUXCgid3X1MrvE4=; b=g0Y5D4i/V7fM3Z
	c9zgwGFmKgW+dYRjOcO5uKhg9ZUJF8SDUIBy3L3byevg4nNQU9QajIUK4R+XXeUUrt7TZUTvhcKQQ
	TzZbrvU4HJO+ZNIxe3ERtmESmUHGNX/LvmLW0sJmaBcszE/JjptuBzR+oS4OFv01OmWtXJxCpLE7R
	rOHzBmkYkF4moS72TYVMDBXYpacZFxZQhx0i7I7CeTJCqbBsvRpvC0ERYSNSzqtwlkjRI4NTaF2j5
	00D6m2Zy3nk6tSjmNiO2GyHWpMctSvPvC5MJaWPMEDitvQrVf/SnIBSla2h6KCl/AzHwHxtW6xnKr
	v2c4bnMtj+zMVgUq0Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ9z-00AFT7-2o;
	Tue, 24 Oct 2023 15:17:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ9g-00AFA1-2Z;
	Tue, 24 Oct 2023 15:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p0b2kl5ZQZyPpYGhGNqSy4gUePxhsbbkYmOZebf/OF0=; b=WJD1oE1NFD/kZPPg77oZXcXLhK
	9Pqyn4nFV27zeuKjdtDERgEsslVXNedy+BlubHJtYJFbHxxDfBScGLixdFr9WPUEpX/1+YetbsybU
	qrvP9b/uw3Rpt0zJTrtBOGlJGHS911VTGvRyycy+lGfdZ8YqUd83gae5alv3v3ZP1wrMNnRyoWl4W
	doRxS87uGXEkApJhiR29f8myrDPzjl66k3zINybCxnrzhfpQJhhQ6bQXGFDaxNp1cwkjwhiwplyKP
	0xrmnxqTeHsjk0yavbkbSgbmlzn9aGV772xFLoi251GT/ELYUbp5Wh46t2GbFuL/YKOd54xQj4njA
	At2bkVig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56516 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJ9P-0004Nu-12;
	Tue, 24 Oct 2023 16:16:59 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJ9Q-00AqPk-O9; Tue, 24 Oct 2023 16:17:00 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 10/39] drivers: base: Print a warning instead of panic() when
 register_cpu() fails
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJ9Q-00AqPk-O9@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:17:00 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081716_835442_68576369 
X-CRM114-Status: GOOD (  12.71  )
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

loongarch, mips, parisc, riscv and sh all print a warning if
register_cpu() returns an error. Architectures that use
GENERIC_CPU_DEVICES call panic() instead.

Errors in this path indicate something is wrong with the firmware
description of the platform, but the kernel is able to keep running.

Downgrade this to a warning to make it easier to debug this issue.

This will allow architectures that switching over to GENERIC_CPU_DEVICES
to drop their warning, but keep the existing behaviour.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 579064fda97b..d31c936f0955 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -535,14 +535,15 @@ int __weak arch_register_cpu(int cpu)
 
 static void __init cpu_dev_register_generic(void)
 {
-	int i;
+	int i, ret;
 
 	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
 		return;
 
 	for_each_present_cpu(i) {
-		if (arch_register_cpu(i))
-			panic("Failed to register CPU device");
+		ret = arch_register_cpu(i);
+		if (ret)
+			pr_warn("register_cpu %d failed (%d)\n", i, ret);
 	}
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
