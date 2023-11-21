Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA822C61D92
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSbTLnv6r038tsueoBjbqfwQViQ69ixcotYC84kk/i8=; b=qSMWguTNBQ5iVA
	FlUAdqGqAQBxNyShtV2Cc0WazUnvrk6idS5JC8fi7eZffkhlklCU1eF0q8SQDWuQAr3I1CRE+CqhA
	FM+8eZwrjsxSCZlDwBD22pvrTLXqUJ/EPb1sTcAJ2v8g1NXvJ0qf9+siCF1AHpLumlltqmNftN9zY
	LwtPvwPLnSM3C/CMxPzLEa1sl+wQL+qlLFn46jI0zveLgRkeaX3r5igIy1wksC42HSvq7Hq/swG7m
	RJA4Rnu4qZKh2pSLWD7Z4Nc7Oyf4RsnUH/XEeJLxZFlPF8szscpoXJlGoYEIpXI/vAEoXnFQLTUB3
	rIVwU2vOEIOxo3fyTpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5S19-00H4B1-0V;
	Tue, 21 Nov 2023 14:46:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R47-00GrS2-26;
	Tue, 21 Nov 2023 13:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MhhE4Ut9mqeHhKVj+/PHQ3JCmojZ6M726/mjHJlz/w8=; b=unb6CQu8/SVIdkTDD0Bb5tw/M6
	U9/JXAYBfcu+nGmLJBQHSx1UV1S2/QPaGueE4yek069NzdBsBB+I7/4ojYiNwjGA3h6Bg1XXsmZpN
	3CSKIqMu997bXRRnuIwkaE8FD3xVWi3G12tr2CgGDps6zOXIoxhEyVAgWZ4YoUH0OJFxQZMLWK8dw
	Sh/sfXO4biONXAp/RC1d8c/MjfMAU5PndN/rBx5ETg7LCum7tsd6675hO1wpWIgOPlvZgUG/o6QUG
	eO0YsUZBYqKFqbzrftNN8UGAMTbnjfoUslVE5G0U+wH8GlDRMXlITXcwhRzULbXJoZK5hQ1AGp9j5
	6XMqG1Rw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52666 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R3p-0007AJ-0J;
	Tue, 21 Nov 2023 13:45:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R3r-00Cszs-2R; Tue, 21 Nov 2023 13:45:07 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 15/21] x86/topology: use weak version of arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R3r-00Cszs-2R@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:45:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054523_713046_51629EDE 
X-CRM114-Status: UNSURE (   8.90  )
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

Since the x86 version of arch_unregister_cpu() is the same as the weak
version, drop the x86 specific version.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v3:
 * Adapt to removal of EXPORT_SYMBOL()s
---
 arch/x86/kernel/topology.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index c2ed3145a93b..211863cb5b81 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -43,9 +43,4 @@ int arch_register_cpu(int cpu)
 	c->hotpluggable = cpu > 0;
 	return register_cpu(c, cpu);
 }
-
-void arch_unregister_cpu(int num)
-{
-	unregister_cpu(&per_cpu(cpu_devices, num));
-}
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
