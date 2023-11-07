Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB448C001B2
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkdYAcaGkYafkERIqELGyptinPqJoJ0y0UiPr7TY42M=; b=U2mxoLN1BH1oT+
	9j9ppkh+UadB5v20klJlIftHAf/IMFv/BomancmJDwxmpRQPUrkiEcdjHpZo8BSM44mgAG4XJ+ojL
	ju2DLE7fddaKEN+6GKqQqSZY1ALvuY8HiQb1aTYBklQ4Lp7xCYSpuZcHIzZe/BzbWj245i19bMECB
	jPtMveLNk9t8K7k2C7rEIhN71M9Lu8sdjC/zwrt2w446Qmm06k7eOxypQt2v9us5mh8XJipgle8lS
	gdZR17AEd6e32+zVRWr0PXAHl5muIpcFaZqs5aGwqqrUux9wS/AWdIJtasW6aFr84b9ErJZfaHIyr
	YYZcWzXA3MKDC/aVyShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMX-00149r-39;
	Tue, 07 Nov 2023 10:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMU-00145A-2J;
	Tue, 07 Nov 2023 10:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=+s9xgA1S5l9eRtr8DZZjQL4h0ntqIwe36xkQpYSMw1w=; b=SV/vT4yP5kqCnJMRk6bqrcRWpL
	rK130ZYiGScFeO9W0AYXj3TXHuayxQy1O3jj6empLG+nBGJgJREbwdpdo2vlSqehZozlMSgBIZfs1
	6D7BsHjKg2XFAtq6vUTuasdKVIM/SsxZTu2naphqMK6Oe2Q4vItlURz0Z3tNcMvPVDDtwmR6e1TSa
	r8wBDv4811ifOJQqPiURFGebTIJuuti2T0o4AiU6qxonX+H624QCW/e50Nnf5Ectk396BJTAxj0R9
	9LREKdsIN5Xx08XNVcCa2OTnh7y/x8vzo8szSbBNMah4kA4mrwWjMww3jWxqVRCFwApmct59fLYYR
	znVc+Lnw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMH-00BvaC-1H;
	Tue, 07 Nov 2023 10:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+s9xgA1S5l9eRtr8DZZjQL4h0ntqIwe36xkQpYSMw1w=; b=h9D80g5K+lZgWC042x21SqM77U
	NTzwcCWe9nLIZgkF5wHMhdxZlh++ZGqVqmxaIdKfMCOOtV1Hn1ALGZZ2vHn2PPGyni0n3V9fOK6uN
	9f3RJdfcWJiAIAr+fqKwB+jwGB2DJx0euTQE9UytmEoRrRMM+zpi+Ct6Z/6guKtczqfbbV5IRl9P4
	RVrhW9KRCXXnrVOu+qel2E3joIiaBKoub+WcMiA3ZIIXQpkA4q2hV7qgdike2znaoRv48sGl8lad5
	/xxhkxA3WxJB522Tp5HCp1zXx/70fbANkhbCExBcMl9G5osvCEc7DPCYaSbEfsWG4tq/NNTRIVbp+
	HyiBqboQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54076 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLy-0000Ir-3D;
	Tue, 07 Nov 2023 10:30:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JM0-00CTy7-NL; Tue, 07 Nov 2023 10:30:40 +0000
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RFC 16/22] x86/topology: use weak version of
 arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JM0-00CTy7-NL@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:40 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103059_490391_5C737A64 
X-CRM114-Status: UNSURE (   8.59  )
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
