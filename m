Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA42C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjxVbE0ARK/aqE/rqN+TyKkYm7ukWfImxelT/PzUiFs=; b=QBfniyhlJnpnDm
	Zgk+CXH9pDxxNF0d6jTgaSyN2R3g+PdxPdwsb/V+KsMyVg/GcgsqsD3LUI9S6JixkeupOJ4mieWbQ
	Z7AOmLk2bIn1t9kaTGiFKKfNV+k6zfbrwOCHtzy5Q2ltdKuuxAK8VEPMEhg+tc8ZokHtcFn9+N8Is
	kdrtCLakh3yVXJvlmhAUB0G8HoLb7mDT7d5Fk1Pt8RckgQNjSPQEFhddMMRUdoLz//DuIpjsTlC44
	kkcTE4q8YQsla/xyoefkkEu4G2we4OoGuMy8MlE6dHakvcS1SfuBkOAjNF5COFFyAPoCQ3/os10gw
	ywJK0TJDJ69zcEIFFdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JN1-0014ie-1x;
	Tue, 07 Nov 2023 10:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMp-0014UD-2S;
	Tue, 07 Nov 2023 10:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=s/nJSc12wTo3rC59/Tj7C6Qxk/YhPkpMlGmhBF4UOwQ=; b=V8zVSvTx+Kd7Iathr/FiU5pxvD
	egynNpyETtkNUSs93c5F9TcOPWTVWyV27xeQEk30RydyKwnn8Z3sbUKJMCo53M25PwVrPYlFKqV7o
	ECcKcOlbO1ibNI5y75fLWhZiZg/I5Unsctxd88Wm/tYZ1SkUzX0sTq/1WiCsoW0NlrRZzL7dBKJZ1
	zFq7GZAQ09IfU1rjpRZNLWRvlcOHqfXalwdAE5E/trqAZviWOwNhFh/e4b0UGjH2TO5a1pz9ick5x
	bJj8dJeBtIy7JcW/var36S4LUrGJnP/VRYXqEn2VF8QjUc3hVKLVHuQYoJyFbvYG2qdljWgRjpN13
	yiEXWTaw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMb-00Bvej-2Q;
	Tue, 07 Nov 2023 10:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s/nJSc12wTo3rC59/Tj7C6Qxk/YhPkpMlGmhBF4UOwQ=; b=iBWuSBO8byS44iey2YnZSgJM8U
	MFt1NMp2w5pAfZ6wCLyhFFlLsovAEisNzEANGVeTWzW/SvgUOWs8hzrl8E6fK+iTUQlweEEngqE3f
	clKt8RH9RkEOEHOUca70RLavt4Q4aMF3hqPZwPOI9vFg9kh++U7+bjIdhqcec+iRE9IOnhXewhCqH
	6LPO3PA4SHNnRIpc2kCc3AAFwOldWLYZ8485pEq5BSo1Ktymanumc1ZnMMGf0asTqW9d5XypAMciV
	XC9/SCnbDNdQN4NpBcW4WiP5nljAPkKxazCZz/vCJxqPKHMlq3Z6Rfls/ZgiL/ixuTbrlcSmxHnl7
	BTSz1Lxg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51274 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JMT-0000Kg-2d;
	Tue, 07 Nov 2023 10:31:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JMV-00CTyh-It; Tue, 07 Nov 2023 10:31:11 +0000
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RFC 22/22] riscv: convert to use arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JMV-00CTyh-It@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:31:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103117_868991_941D7CF2 
X-CRM114-Status: UNSURE (   8.37  )
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

Convert riscv to use the arch_cpu_is_hotpluggable() helper rather than
arch_register_cpu().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/riscv/kernel/setup.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f8875ae1b0aa..168f0db63d53 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -294,12 +294,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_set_dma_cache_alignment();
 }
 
-int arch_register_cpu(int cpu)
+bool arch_cpu_is_hotpluggable(int cpu)
 {
-	struct cpu *c = &per_cpu(cpu_devices, cpu);
-
-	c->hotpluggable = cpu_has_hotplug(cpu);
-	return register_cpu(c, cpu);
+	return cpu_has_hotplug(cpu);
 }
 
 void free_initmem(void)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
