Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7BDC4708E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0kYMMKX8s10ZQy/o0AlAtlE2Ue6Sbde9+fM7Ik9jUY=; b=ADyGE0IPCmMTFG
	PzHgVZzCcwStvwTLrISrA9fhTsXP9kzOOcu2PYF2z/8E1d+LUid/h3kLVXQsmusobjy0zP/xaRq9b
	yMAU+Vm088PoUwiOKqb7zqDxLBMN5RJdNA3xqUV57FuD8nBWBb6Zpko7tTq5HsGtXyDVX7I3LN6CA
	dFr+H6R9p1w4fqslSAbpsN22KlT/FjJk7a5KH429x1Lb8dFJ0/8PHsSOUnwPk7+hu85qf+3Hrrm60
	M+rbJinPXNjHfrf5VDSx3H+TtRowGuixg2yr1DTj3gLPMPjVgMfZm6BcgpPvlSBTwuxcoMlhA+kWK
	R/zUO4dPIZZcWd+mfrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMC-0013pD-21;
	Tue, 07 Nov 2023 10:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMA-0013nj-28;
	Tue, 07 Nov 2023 10:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=GkdeqsXOg8rKv49jTJX2d/LBiktqtOBS+rLmfKOoquM=; b=jAbo0/+/ponHan5AAgYVYEtOov
	X1uVGFn9TeO9ROUs0nONZBLZ5Wth0gkyzIm28QKbXb7yKYrhdWClCU9g1AqXZEFlGuxrasPVJJTkv
	zRIdPFcIR+AAEtCrWNOItE9P7DHWVt4a5VNVVyWe/zEQwMImFFpH2odgcp80GAb7Z53feYay3cnge
	dWXXPH4jhybETAei76mqWivKfLnE//mj9DkAZ/yZLFiDAkaAUZujKBj+7Rmp2MO72RThOk+wu7fyq
	1wp/x/R0Sf2rdTMQzGQChI/PuaPkl8d5DooglLY/wulmWX9MTHkEwsF1OZI9CHM1vkSopRsY4a+Pe
	954e1x8g==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JM1-00BvYa-15;
	Tue, 07 Nov 2023 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GkdeqsXOg8rKv49jTJX2d/LBiktqtOBS+rLmfKOoquM=; b=MyYKTlQ4jHWTasvjC6TbG0Pn5v
	P9AN29GtgNwpSvjFIVRwMBpOzm/tMulHHlu+yyH/OyTX5s4WWIz37Dtjl1y/WPH/X4zy9J+zBaUy/
	sQPRWr9EHhLLcjqfRf9xu+CVbx8l/Q6xnAx+idFJmKecFP7iInqaTMLv73dIIMZMCLoHJWhR2TVa8
	SQwyLuS4qnOC8vvYex+DMwPWotgCmLwYpvp5cTabGyV115o0oOWVeAcISMgyk2teMl71o2T3pEIXU
	bpadyxfoNPuvSVkPS4G0Z6g/V+Lyt1FbdZz19EPvAnmAg69SlXeIHGx9nn99a8ORaDXNta2gFZbpf
	GuA08UgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54780 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLo-0000IB-29;
	Tue, 07 Nov 2023 10:30:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLq-00CTxq-CF; Tue, 07 Nov 2023 10:30:30 +0000
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103041_525449_A21F5F19 
X-CRM114-Status: UNSURE (   7.99  )
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

Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
arch_register_cpu().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/kernel/setup.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 165bd2c0dd5a..42c690bb2d60 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -402,13 +402,9 @@ static inline bool cpu_can_disable(unsigned int cpu)
 	return false;
 }
 
-int arch_register_cpu(int num)
+bool arch_cpu_is_hotpluggable(int num)
 {
-	struct cpu *cpu = &per_cpu(cpu_devices, num);
-
-	cpu->hotpluggable = cpu_can_disable(num);
-
-	return register_cpu(cpu, num);
+	return cpu_can_disable(num);
 }
 
 static void dump_kernel_offset(void)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
