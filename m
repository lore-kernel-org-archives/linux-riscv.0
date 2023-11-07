Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+DdiBsfv5PgUqHbm1Uyysvl3udvXMxeyHZOpI3V6xc=; b=4p/UYvsp33iHW3
	8+T3mUdUPNkkLDs2uk+2Wcf1s6r3qUWwdL+wauDeByYztcG9XeAhCFFac7vSFD0dPbZwXQmHrsU5y
	Y2GqGUuZMOI1FnqKk1kOTaZFLnqLhAqosm5W+DW0iWz1gH/ikVzZ0SJKEnHPc3NFyYPmIDhUWretV
	0gGTgghB5K4Sc1JQx4Ul60uuOO0jS7YPiz26sl6Xao8Fp25FDeBfVYfYM2QLef+ZC8l2tZkV4I00i
	nMo7zSNF+d5dqSAtjv5BjGh8jkeGoXrAAxXXLps3pqzpzIxY2i11HLobPEDsvHVqZ0ZycJ2GKxDzN
	bdgQFP0IuXLLJgGEEveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMu-0014aN-0n;
	Tue, 07 Nov 2023 10:31:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMh-0014LO-2A;
	Tue, 07 Nov 2023 10:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=hkV3u8SP8pK5MBGOaBSxiZt0Srks+QBo3B2iRj21hSA=; b=Cj+XfQtmRwbOVvV4TyhvOXo01g
	6dFiPorYq6SdpU8MO2dQFiGQjOoMHkboPMMhQhg6yzuOU1i7RmTSPCdvVYdEeNLCcsNyyXlhI3Y4M
	tJrx5d8uoOgpgdfnTwWlWa09lYkZkB4OWLJSZ+k9dRHqRsKsNW8z/yCt6xXOpsV6imh74uBMoAD7l
	09eOyg1H3pxmnWqgtS08tmQdNPj2m/SBOGTiPRhPffHk1j4unw/hZsHz982lz9lJEbeVKMC7Fk8Oh
	lAgTxUsB95S0uPgaS9PpezR3roT2EIuaN799vEAYDole4rDVV6dOZalXmDvlX8968Ib/DBq4EUdA9
	sf3PzWAQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMQ-00Bvdl-1T;
	Tue, 07 Nov 2023 10:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hkV3u8SP8pK5MBGOaBSxiZt0Srks+QBo3B2iRj21hSA=; b=EolyTIuKQIlvKfIObhgfe71No3
	YX+EzeWPL00Q28npII+EZ04fjX/awD0l9DtDKJuWMu3qzWp+fGLKwO3ZEsxMxOiw657TsZTdF7B3u
	8nuCCfwXHvUem5i73c3jyDlrT1E3kFJ+l8Vs7XFamiDDQJz0j7+NkX6gN7v1SLOeiNZ/KhH7W52hm
	/Gh0lW1AFpk3hinV3kigfuy42L9VokGcHCx1fPXrRx8ump8zKb7b3u+wBoPXhiSS9yTKViHL52Q9y
	K/XXQYlrKpRR4xF7UMk2Qo7xnRZrHxWoqxBPsddllXHNiPRSaW9MsEbbaP1uz2gt9fWHan5qNJiir
	wLY0ysfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34784 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JMJ-0000K5-20;
	Tue, 07 Nov 2023 10:30:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JML-00CTyV-9a; Tue, 07 Nov 2023 10:31:01 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH RFC 20/22] LoongArch: convert to use
 arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JML-00CTyV-9a@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:31:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103106_606078_B757B7DF 
X-CRM114-Status: UNSURE (   8.74  )
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

Convert loongarch to use the arch_cpu_is_hotpluggable() helper rather
than arch_register_cpu(). Also remove the export as nothing should be
using arch_register_cpu() outside of the core kernel/acpi code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/loongarch/kernel/topology.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
index 866c2c9ef6ab..75d5c51a7cd3 100644
--- a/arch/loongarch/kernel/topology.c
+++ b/arch/loongarch/kernel/topology.c
@@ -11,11 +11,8 @@
 #include <acpi/processor.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_register_cpu(int cpu)
+bool arch_cpu_is_hotpluggable(int cpu)
 {
-	struct cpu *c = &per_cpu(cpu_devices, cpu);
-
-	c->hotpluggable = !io_master(cpu);
-	return register_cpu(c, cpu);
+	return !io_master(cpu);
 }
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
