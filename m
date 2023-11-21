Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10FC61D92
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQg62H5qUyImqVwCWTAe0CLmzMx8sUdDkrezGensaY8=; b=NcKOfQ2FTeB1Ha
	WdM6y5Lx4Xxk0qmeryg9rRpDw/iBo15X3zZVkv7EjKsRBUM3BokclBwQQrNryJdsftkIbpYMeA+tX
	gy45y/7CQK4pYxWjn+fkgxbUYsCV00P7bomodMEZQv8wJ2hrWq2j/fh80NQ5b+mo1Vbhdclo/8dhH
	P6QD0kSdxzqXqHJv1ZMZyDkDmhgNvJuu8GI+v6XF2i/HiBo+wOQPWX+xVqCJH/CPK/L/K4Jq+FKf9
	Wrm6Ut6GkOGMm+IAJLEcNQLEmmO01evWi12WjKG/l/YcEVPy1DmT+FFKUabe5YdNKAXai1QkLi3Gr
	iKFr8unW4ZaVTbHvknMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R69-00GtHu-1Y;
	Tue, 21 Nov 2023 13:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R66-00GtFz-2Q;
	Tue, 21 Nov 2023 13:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=6zOoGrrmAHYsbAYjPwlImlFJnip+vYBWOCuz8Ez17B0=; b=frV0WfI8EcvIbHWPV6O2NfoRNX
	gcjPuXdMQOaTZpabakNW5eugyLOlnh+06VIgssOxXMC5gqMVVING95CDO1iUhEMn1XYikF1y9ns3w
	X5WGdXEHT2q465QgqdUPkzEnJvbxQFSlQ/OoGqttvPxZcpcTMo+hSb+VyWuQU4jj3/zNIBO9VK7N0
	eZOAgO/LuIT63gndJcrIuRRYnRY6rJrOcjxW1KKV6i+/tJ7tWeXw9qnZGruyovg4mKNaqwitnHtH3
	uEpUzR1oCe3C7R7gKG8eVHYUnyVVHC55bDmNWZL34eBTCSOVH1r0i6CS1CbGKk/5p6s3JvazlGYFu
	jayF6tPA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4T-00BSJv-2e;
	Tue, 21 Nov 2023 13:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6zOoGrrmAHYsbAYjPwlImlFJnip+vYBWOCuz8Ez17B0=; b=oU7Nb4IXXCx1oE0KlmHdTcLpUu
	kg/KqIwuxpe4VR+Ms2sPwNfjqTsW28iX6HEpHO0QawAPus9kVilpyvN9KFs240JWrKUXUaIoY0TUL
	PryuKTIwrKdrPCTN9P+nOVElqmUyTUF5B1vkvUCZb56DexWEnOAHwBAerF/rq4VKcsmjsHh0wvUsm
	oeUjK0M1VhPsya3CJvb6qbHU0+JLoKJjoOdsK5Jz3Fx2F6Ms9NJd3+XlQJ6FhsWIOJXhKI/m2mgHh
	gp2IPAWUI+jyk4pKhYJ/1f/Uv+vvd3Q/Z/D9qyW2KqSj7IKYtPaFjvhfVR4zi9y657CGrZnVjXJN1
	5beqDYGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40512 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R4J-0007Bz-32;
	Tue, 21 Nov 2023 13:45:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R4L-00Ct0d-To; Tue, 21 Nov 2023 13:45:37 +0000
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 21/21] riscv: convert to use arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R4L-00Ct0d-To@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:45:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_134546_415811_83E40786 
X-CRM114-Status: UNSURE (   8.54  )
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/riscv/kernel/setup.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b3a0aa2b78d5..7493fafbe4cb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -298,12 +298,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_user_isa_enable();
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
