Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C787C61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwoCN5EyKtrJDXjinU44O1QJinBJk1pXJT0S4bKY4IE=; b=CarxaZeG+WAheG
	lzSapdSiKtf7qd9i+UNueyD8XdN+6jGZNOD8RvJGqRIvu1jCsWLAnB9Swj7kuVLVOo6+fQhGeM2mR
	8OaVg3t5sihmYxMlIWSZQthkEUEt2jdZ8hVDnhUbvM7r87Hm+JhX1NvgG3NSo1oYzElWf5uoX2PZN
	kMFxlucVRWapaPvsW1Toiv7Wn4hav5Y3jYXw+YSIG5DefhSStQy/HnOd3JQp/S//1naIb/T59/Lyh
	2aMGfbE/YhrEFENXC2xmQ8yRmB9EnEHfFsnK+lV3BeDHBI0YAu8KlbHqVaEz+ecVI4an/75/sq3G3
	XXsYrog3dSjBog6SaxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4Q-00GrmV-2S;
	Tue, 21 Nov 2023 13:45:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4B-00GrXR-38;
	Tue, 21 Nov 2023 13:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gaUuxoRP2iSef3HGwjZTXVv7sp9dUHlrSN6JEtACmSA=; b=MG0g9GvHPLNzYgIMRjPbdF3Zjd
	MWnJjqRCsvPoH2okKjYX6iX5oYgvzh3unPGb8gsRm+/0j2HuiWbN6KE8oLw8a3H8OBvWDIK4b5xb9
	pcwSRY5fwtLgbO0/b+4UsGX5H+lmgyNpOkleh7Dln/pOGLyFrOXauYKhTJHi0n39uEvWNKXJlgL6B
	0+9jSY0gyVtms+qjjQL3QEscua+BVqfwHHHbHN1UZn2eGo1LBUJmJQaLwVp7JWkncmAqRmf2/VQSR
	UUmskRxCB1+woeIzyUCnH+nIHcRzvF0H+A7OqbPFL8fvBG+8ufHTL/uPDPApx6U5O1Hl6GIAmg4EO
	XYJxioMQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52668 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R3u-0007AY-0r;
	Tue, 21 Nov 2023 13:45:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R3w-00Cszy-6k; Tue, 21 Nov 2023 13:45:12 +0000
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
Subject: [PATCH 16/21] x86/topology: convert to use arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R3w-00Cszy-6k@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:45:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054528_015758_4364DCAF 
X-CRM114-Status: GOOD (  10.25  )
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

Convert x86 to use the arch_cpu_is_hotpluggable() helper rather than
arch_register_cpu().

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/x86/kernel/topology.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index 211863cb5b81..d42c28b8bfd8 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -36,11 +36,8 @@
 #include <asm/cpu.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_register_cpu(int cpu)
+bool arch_cpu_is_hotpluggable(int cpu)
 {
-	struct cpu *c = per_cpu_ptr(&cpu_devices, cpu);
-
-	c->hotpluggable = cpu > 0;
-	return register_cpu(c, cpu);
+	return cpu > 0;
 }
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
