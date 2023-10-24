Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4884C25B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mk0bRL4oCTa/kWY1kjGbBtGu2f1YxefyN0ytkNoN2iE=; b=aQemXSIFnl+i11
	iV/40C5pahpCRPx6pZZMLTCuE9qxZ+vW8SfkyM5QgeLjmpq/V7GSJf2PFYXZjymSHZd7F8lfVHMpz
	Oj0tWUOBbsEQkMsQHq+S51Vsak1t1MVJz3FLWWCNzigF5zQQsuZNa0T70BaC9N9wW7avam6C9ulcC
	aALdngXDM4kV8n9Uk8liFaHXJYWo4LXNJDotkM4AI2QuP22fZyPmSoNIaE1KjlpMjFJG/4qIiqSB2
	e6cf2v5o3ULBpVvfMaxzBnAYorpAFHBEbzIvK+8iSjgBS9nPs2tEuHA+ojze4EzbG/XnrPJmbtM3O
	6IaOFejgacJRmwEzXOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJDU-00AIhX-0p;
	Tue, 24 Oct 2023 15:21:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBF-00AGhA-2k;
	Tue, 24 Oct 2023 15:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=OJBhmyu/vU7K1KRJlvc2+ydilRGhWCEq5NT0Tp7+EuE=; b=kWqYZqiH0Z7KJyjW033513sC1J
	6AcXPZzbl5zewPHrzmwmlciS3Kwu6j+afbhajszy9RgmNW1HUlAU4cCZbuuozH55uqz65V7W7VkyY
	2wuKHgc+ZDhJEAWqfaf129R3d2w4RD1uFDaFtmtVz8hIyFcqb9rZHVtcOkPc/ARPv4mZgnwXhj6pV
	/8nza+N+EMzk2k+SsTR7S55pnrcXC6AxPOPAFrB8eutvcT6zV4HhiXIGnebGoStBRSSwVLKUc1Otv
	BjnjBesmcAAqDXRkmi4BgIgwk9EAvnw0JiKwybvic0SKfQAyieWlOKou68VHyZYTMI8JNiyZvqb/C
	aF4V+x6A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBC-00FbJb-0E;
	Tue, 24 Oct 2023 15:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OJBhmyu/vU7K1KRJlvc2+ydilRGhWCEq5NT0Tp7+EuE=; b=iG1/WzYfoNKMjG2yRgqZ7a5B0t
	WY8q8c75UjwIZGLwimqMAq+a5yTVtFo/3pMzO+5/QGwrpwXMxCov9HkQ7Dn1xzchPFUFPSzJImOvY
	DwcMTnTgwJ0oSlPsItxxXEpaLM88bE1KJtLbUXsD+yhx9bjRTTSJSjIdQD9BjWYWTn5Y2oTZPOUU2
	qJuUrhkO/SLTo/YujC5eGYjr4v+HOW00S+A21rFPqgc/w/RF2BqHzD7Gcm58inz/AwZgGKsjT4p10
	6jybcpzSBfl4agcBvOuVM5jZrOfrhlUS7+RyIeP+amro9BXC+vhzHxrJ0TC39ACMtD5qSZOF60yB0
	DuAqUghg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47588 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAz-0004Uh-0A;
	Tue, 24 Oct 2023 16:18:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJB0-00AqRe-H9; Tue, 24 Oct 2023 16:18:38 +0100
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 29/39] LoongArch: Use the __weak version of
 arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJB0-00AqRe-H9@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:38 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161850_384530_6521F721 
X-CRM114-Status: UNSURE (   6.55  )
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
 arch/loongarch/kernel/topology.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
index bf58351beac1..b595edbfdbcd 100644
--- a/arch/loongarch/kernel/topology.c
+++ b/arch/loongarch/kernel/topology.c
@@ -19,13 +19,4 @@ int arch_register_cpu(int cpu)
 	return register_cpu(c, cpu);
 }
 EXPORT_SYMBOL(arch_register_cpu);
-
-void arch_unregister_cpu(int cpu)
-{
-	struct cpu *c = &per_cpu(cpu_devices, cpu);
-
-	c->hotpluggable = 0;
-	unregister_cpu(c);
-}
-EXPORT_SYMBOL(arch_unregister_cpu);
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
