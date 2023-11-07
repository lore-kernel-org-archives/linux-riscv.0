Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E3DC4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onpjIxaZI+bvxuQmV9D2psA8laTD+bJq38Ie1oMGNlU=; b=glYM3H6PvNQj4d
	7Qao5fxuWzLq1tqXLasNp3nFAFLTLbQFZaCOsP1TNZplrHddkfyl9aXxSVT6D4fWRP7dnZGYHdgBy
	ttMQzGk0n5ohJfiJH+X/Nf1z1172q25f7CHyNrN8rH6R+DIGiehVRUsgWj5qLZydeUPylfyrbGZ33
	KdthjfIiv+XAhyZa6GcECTynrDOlBdndU5ouQxMm8MQdsl9SS+Zk3/ozdoJpysCvZr1jLqaLFK+MV
	e2sY6pRm0tbK6EzqQscdbG5XS1PwlbyTrOyten/rmKYxPq7LZ45lhpsEt051CJqLOSgN2nrJUHPN+
	KHRF2lbdzZsDvVzV/wXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMp-0014US-1O;
	Tue, 07 Nov 2023 10:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMe-0014GM-0H;
	Tue, 07 Nov 2023 10:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=rn+nQnI2yglZwok5i89nv8u0BQpqBkj7ueRqazA/SwA=; b=V6ZznzFkNixCbSfKsDnYICW7cL
	ZYcYMPchNqxY14dypYD1fwIwEgKrLPHpoe+3NQ7JfQ18HAmxWICV5d8I4/+w/FthihRi57LUia4QR
	PjKWgntIIBLzmTBivJM2J8KIpo1xn5JpvW2X5MVVuBN+cI4S7oM9BJTZZIP29V+bgWKx2eLLuws27
	7RwGMzC+2dT4bm1C57fhD9XgvkdtIFmoiPh++PHjL2a3hSOJm30juYzic9RD12d70szeuFlOdJB9T
	Yg7mTEvj9GmwUqwyLAZdbx4H+cTt0eWxyWaDU7MfBYyRzLM5SmJRkKSpwOsA1NPDddBQyCyEWX9y4
	aBwZyC5w==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMK-00Bvck-2I;
	Tue, 07 Nov 2023 10:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rn+nQnI2yglZwok5i89nv8u0BQpqBkj7ueRqazA/SwA=; b=ddKuX8lEUlMdHFtZSDgFPzDDic
	/mKla6TitBWW3KzAxoicTfcstTIgEptTLnGNDn9kpl7ZjHcoobmgT+KVhkl5l1Foq4xbsmZhRLw/v
	kq+/+siAPMILuvjusDAGfIYvbUdCrNKNaaivh+jaWQ70ykEFzq1KH1oylvQOJWaN9sKtRcYCegsoE
	yx6Qh4RJJaCGWyP0LWxj5rdXAKLBwGFFtPm+SV8M5cCV3xwn0Z5ndicwFDLnYdL2KXVMSkj+qf3m4
	PT89PODMfm8S77sYHpqCsEDNmtTqFZlEViLg8TmdUnvIxG0NpCFDCua6VwVhvPlbElHZppp2QfPZ1
	aL9tJ+8g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55706 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JM4-0000J7-0N;
	Tue, 07 Nov 2023 10:30:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JM5-00CTyD-Ri; Tue, 07 Nov 2023 10:30:45 +0000
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
Subject: [PATCH RFC 17/22] x86/topology: convert to use
 arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JM5-00CTyD-Ri@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103100_878411_FA8FC652 
X-CRM114-Status: UNSURE (   9.93  )
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

Convert x86 to use the arch_cpu_is_hotpluggable() helper rather than
arch_register_cpu().

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
