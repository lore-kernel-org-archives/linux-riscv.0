Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF182C61D92
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+CkM4MxPY41E9F5jSj1SoGSgkdPNjqsPn0BRoPAuzM=; b=SuCYJhrfqKTcYs
	j8kOkLlWxxyW+VFNIb0FnGxx42FLpKfRerYtAM9jKtKkGTj/8baMh7flrgLZJIjEgZg2DUStIM7L4
	nM+BRMVJXXraQaeW+RO9A/UdkZWZMI8hJzngtxx/4pXNr/dQx7IFFfd4ifl/ix8SZCwwlaSnKO1QE
	4+ilA6JJFMwsUqYK22PvUPVTl/I3n3tA2v81+2Pp72fAtQXMDfIUsUvsJ2PEKNU2qR0tO/hgyTGoV
	kug2Ppqkrff8tE7kfjz+TYNl1Y2e/eJxXUMo34JJ5fHBb/m/1cOctGTQ/FcrghHkp083LSSnZkwkK
	fsVj1sd0ibza/l8jDMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4p-00Gs9E-1N;
	Tue, 21 Nov 2023 13:46:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4W-00GrrP-2K;
	Tue, 21 Nov 2023 13:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=l0bVO3Ofxt9I6VpXHzidso1VbLhWBJYttUHQB+3pVpM=; b=d+uT+Nw5gdMd0oFCe4Mcim6ocp
	rmDkfzUhIikGOK9OBGN12aZPhcCkaS/ZJahum0Oj6r5nSjjJMxPL5oSo8VNM3IJMz2/1iZo57cM7n
	tf6roD67jZMiTeT5miNEpXGtic3P0U6CWn4gg+Crw5aM79OKMHvkN6Brvj9umtcSbVEaq6hs4TLdg
	Tjykveq2ynmj4fdmdupWJ5g5MWBJ1HDnAdnUiWVel1BTKvQ9MD66BDZmu3mqtQWBz6n4YoEu21knN
	ufiwl+//ufIS8zD2cwGSfF1tBEmc+5kJ3XO8KqAExHLdXbeix8eN2p+FjTnaaZjY/u8yK3Wlw6WOc
	EWY5mIaA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4S-00BSIQ-2E;
	Tue, 21 Nov 2023 13:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l0bVO3Ofxt9I6VpXHzidso1VbLhWBJYttUHQB+3pVpM=; b=zuBcYUCQiAG0NR88MSgxbqDO6V
	Xrx1OtZxl7qgEAcM4dhRnGuG4j4UAfNVoteCbEsmDpsS18qgO1t6X4tE6HheDuU+sGcwB61GFsXY3
	oAsHidn5Amx9CErfoca+RAWdG+p+9hdYGw7FtnYFnqcQWpdrXDSiZC1x26zWOaaMM/IMc+HaJSod/
	L3yyVf812AHdqwjcVS07SJ4E3oY48l13IDkcNT+YfqUNMWwEQGWxajN9gNGiZWPDyO4oHavpx0HSR
	R0OqxZdTKTKtchrXvERekFPPpwVEabOxvXL9IQPbrSo6u8W/MzMCqUOPPtmMok8Gwh4a4LeqjOWnq
	2zkVvF6g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43168 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R44-0007B5-1i;
	Tue, 21 Nov 2023 13:45:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R46-00Ct0A-GJ; Tue, 21 Nov 2023 13:45:22 +0000
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 18/21] LoongArch: Use the __weak version of
 arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R46-00Ct0A-GJ@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:45:22 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_134544_993133_7FBAB1EA 
X-CRM114-Status: UNSURE (   7.29  )
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
