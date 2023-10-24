Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF1C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+Hw3ulthZvOJmcJb9pvjPViIsl/FV5NeSvqg4IjVho=; b=BoHLKxMnGdPOsA
	rVz95T6eTr+vDC8lFyC4W9/DW9boP1/0qjQBbCc7lgjrY1O45hm9Q3ojHZeSZdHFrrgUPyQ8Yjbu9
	9+sHWC3AZGAmFV+49BtmPHPz/FPdHoZF47xvX/Z6SJ8V1rCl50ZnINxStE1vRvFsmCRadSyEB0uev
	xd7nfRTPDP4Nx8gAF3ROZnXludDSmJqMVrIRQpm6LrruJklOIV1VZKDh2vDcd95gq3jfaDFnLZy4i
	9YSqD6f3lPG4zzhV5DE0RvV0f3OOfpG5KVHs3Bfzk7BLplHnOQaKbDGck/d0hkp6NXcls3uYrhddj
	nTc1oPL8JkcYy/RVP9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJCN-00AHn2-1f;
	Tue, 24 Oct 2023 15:20:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAp-00AEe0-1D;
	Tue, 24 Oct 2023 15:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lY8MAhZ9Z+rtoj2wYABQB+N0CKSqFLYW9u3X+b/CjEk=; b=MIuYVLL/ss5nnQ4+gplZqkXCRX
	/MNdqQD/kryr4L2BxVRmfVOR58iw9MZRAu7mb2BCNGmTN1dK7FEdQWftEa+sicdcBpQVsB35lO3+q
	loolpA9iU7Nq0WKV7S80BBm1kkkp3/Hqzxn2bhcPWBtllfuHD46+oW1MfiXWY4skJ8cNz6Fbxa5Q4
	BWHxYre5Zagm7L3Z/H5OVTAuVERhN8hxTx0akFq2Pp+ZMOft8NXNMMc/MRtlyagRrCGlVHUQunuWP
	CmhzqTPGGVUkyPEeeIwTclwblDOGmJVvUf+3/BRntJEDqLntj6Yxkh+eI2Dm/dz4qRwlNo/k7whLQ
	Md+spz1w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJ8e-0004LL-36;
	Tue, 24 Oct 2023 16:16:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJ8g-00AqOs-E9; Tue, 24 Oct 2023 16:16:14 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 01/39] parisc: simplify smp_prepare_boot_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJ8g-00AqOs-E9@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:16:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081827_420790_C185EEAE 
X-CRM114-Status: GOOD (  10.93  )
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

smp_prepare_boot_cpu() reads the cpuid of the first CPU, printing a
message to state which processor booted, and setting it online and
present.

This cpuid is retrieved from per_cpu(cpu_data, 0).cpuid, which is
initialised in arch/parisc/kernel/processor.c:processor_probe() thusly:

	p = &per_cpu(cpu_data, cpuid);
...
	p->cpuid = cpuid;	/* save CPU id */

Consequently, the cpuid retrieved seems to be guaranteed to also be
zero, meaning that the message printed in this boils down to:

	pr_info("SMP: bootstrap CPU ID is 0\n");

Moreover, since kernel/cpu.c::boot_cpu_init() already sets CPU 0 to
be present and online, there is no need to do this again in
smp_prepare_boot_cpu().

Remove this code, and simplify the printk().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/parisc/kernel/smp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 2019c1f04bd0..444154271f23 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -404,13 +404,7 @@ static int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
 
 void __init smp_prepare_boot_cpu(void)
 {
-	int bootstrap_processor = per_cpu(cpu_data, 0).cpuid;
-
-	/* Setup BSP mappings */
-	printk(KERN_INFO "SMP: bootstrap CPU ID is %d\n", bootstrap_processor);
-
-	set_cpu_online(bootstrap_processor, true);
-	set_cpu_present(bootstrap_processor, true);
+	pr_info("SMP: bootstrap CPU ID is 0\n");
 }
 
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
