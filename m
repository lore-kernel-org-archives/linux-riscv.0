Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+CkM4MxPY41E9F5jSj1SoGSgkdPNjqsPn0BRoPAuzM=; b=zIJOVOK1GrsXqe
	3r24F3gfqfXe5z/wgbM28i7iQuh5X1eo7D/+lrEH6t9x1Ubbc70DlHEMK8UviHMB0IUWuay/VL1gd
	PrNKferENACo/y9hrQCWKbVvJ2VXBJ8s7+V5RK+vqu1em60YNQq7JVcG45QE8Ox42v42fgZ6CUMZL
	jtt4FgeqvZl6jz0wYPNjWgmPEKxasBUH3TKpOtty8RvT06gp3HwqiP3dp7l5UZgphz4RRQwVJnnUF
	UDimuZi1zM4JajRi2CR8ItgvreEkU+mX6O8ZkZe2yrEvXnU4+DN7/IN0znWGrf5Wh7WTH388g4KWP
	TodajFWVajj3ij5bNAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMr-0014XO-2r;
	Tue, 07 Nov 2023 10:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMf-0014IU-1c;
	Tue, 07 Nov 2023 10:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=l0bVO3Ofxt9I6VpXHzidso1VbLhWBJYttUHQB+3pVpM=; b=QrWr9Ps9Xi61eGJ/hx6Ro1ziGl
	yB/Ly3mqbZWgZa3mLyftHIpxUFID2vqoZSNvgcrVRXt9OV4CTuZx0tT/7Obn3Sy8jndrYHxLe6ySq
	1s0iJFC3XGCz3gTDpSXqeTjdUWO1qdxTy5trjOfIyMm0XlFgXDf5G4d2NEJpVE+c6CGjfihFZWLs3
	mEBR39oxpo3DQ1Fcv8jH8hFu0J0fnTZi0bFbVYcWa3gs1Cd7dl3BrNWi4F1Rz5Q9VqFOZbKdDrED9
	MzTEBKYJTn9ktEcws/WuM65TAmiDHK7pfkA5eEaCDuRUU2jYSRCP/hsWHmGrDX84bHioNJocolHog
	kD1blAYw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMN-00BvdT-0r;
	Tue, 07 Nov 2023 10:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l0bVO3Ofxt9I6VpXHzidso1VbLhWBJYttUHQB+3pVpM=; b=X5xIfco6mYR2jckL1Cjx6XpoY6
	F1j+OEIHu3sEhpzLOB+6C5P7A5s5MOemp9bper5vAt8AtlMODmCE1NmQF1xul0c7UFLIJWlbYhos3
	WVj5fDpIBk7p9pgPh6bnfgTw+atcLoD/d9QmrJIIluoISvDKmF+N3MZWxiKVhLsBiXVshQHbfpJqv
	e99I+AC3VrkDORY/ZprE1wCSOPIGGxAiesS/O18HG1utrXCksLOIlrC8VGe038QtNtNM2y70RLEva
	tpcXg87Q6zNr9aNTdc9DNqGIH8RSkaAYz0uSPevSMETjZ87SFXlrOTjwM0SXIqdowsEGbOS5u6Pi8
	KotwPOjA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34768 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JME-0000Jj-1K;
	Tue, 07 Nov 2023 10:30:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JMG-00CTyP-4X; Tue, 07 Nov 2023 10:30:56 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH RFC 19/22] LoongArch: Use the __weak version of
 arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JMG-00CTyP-4X@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103103_640826_1F7A6F17 
X-CRM114-Status: UNSURE (   6.94  )
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

LoongArch provides its own arch_unregister_cpu(). This clears the
hotpluggable flag, then unregisters the CPU.

It isn't necessary to clear the hotpluggable flag when unregistering
a cpu. unregister_cpu() writes NULL to the percpu cpu_sys_devices
pointer, meaning cpu_is_hotpluggable() will return false, as
get_cpu_device() has returned NULL.

Remove arch_unregister_cpu() and use the __weak version.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v3:
 * Adapt for removal of EXPORT_SYMBOL()s
---
 arch/loongarch/kernel/topology.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
index 7dfb46c68f58..866c2c9ef6ab 100644
--- a/arch/loongarch/kernel/topology.c
+++ b/arch/loongarch/kernel/topology.c
@@ -18,12 +18,4 @@ int arch_register_cpu(int cpu)
 	c->hotpluggable = !io_master(cpu);
 	return register_cpu(c, cpu);
 }
-
-void arch_unregister_cpu(int cpu)
-{
-	struct cpu *c = &per_cpu(cpu_devices, cpu);
-
-	c->hotpluggable = 0;
-	unregister_cpu(c);
-}
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
