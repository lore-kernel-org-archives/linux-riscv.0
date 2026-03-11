Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386C9106121C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eyHsDUxXHUCbaBEzBXrWcFQY//asBHh7qkp+JhPdzEk=; b=HK0LsGI+ChEtcr
	qXPlWxw4n5buGHYfJybIqNCXoyBegpIcss0zNMPNhL2hb0Bs6jHIJoSLqNIR/QKwdz5aV66Gx64Hp
	uLMFJhresNQblZesgLxiMLHXVV+gK6gJdjwN2OB9efxbA/ObycyD5wG0nAcfAUGW5vlO5UX6BC6Yw
	pfZuxKFiPTXlEwb9gNeRiU+vGG+kBcc6YfW/S7qQR9gaF+DDYrsa9nsJQrKEiSv/WaP3vCyDuTSow
	fD2hxLgD4s1CNbi68njUrbMA2IvcbWzwksl2rWJ0KdtfVGm85DickfbUXCBW5fY3k3Rjz9Vz6G3yK
	TqjWr3I7HFjgjNRe2NyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HXK-0000000BTiy-1KLy;
	Wed, 11 Mar 2026 11:15:34 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HXH-0000000BTif-3cGU
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 11:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=H6UZVAcNXBaTLTexeP5JDCR8y93YukQku0lGW/Zb9zU=; b=tvro1P2l/to0um
	uu7HLvT4zWU/Q38gHgRcU5yozgOJnk+dG7k4tZJPTkufd3DBYKIu6C50ycHGAxXfL2A1m+f/wW1o1
	+bUd7AKVNXnVnhkkLQVwZn4Iy90zlqaLaQC1p56ffJmI34Q7u8VgOfYKRb9Ls6L/VZhX8KV8M0EaE
	uw78rjRb4hGlyzjikEf5H/JGmC8sTQdthfdXk9fTJjkdZCgOoB07Bpvq7r/NCJft49KDMU+9nMJub
	tAKuQrS/Qfk+A10/PjSHRxvuzKT0xpttVbetW5lc+np4EwuGtfbCtxp3U+eP70TdIdtjBIqrDMTlr
	KT2DHtv9VG4eQvcLkx8Q==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w0Ghn-00F2nj-Ua; Wed, 11 Mar 2026 10:22:19 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1w0Ghn-00000001iV5-1ztc;
	Wed, 11 Mar 2026 10:22:19 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: linux-kernel@vger.kernel.org,
	alex@ghiti.fr,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] RISC-V: ACPI: fix two __iomem cast warnings
Date: Wed, 11 Mar 2026 10:22:17 +0000
Message-Id: <20260311102217.409376-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_041532_069983_D5CA6026 
X-CRM114-Status: UNSURE (   9.91  )
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

The __acpi_map_table() and __acpi_unmap_table() return and
take __iomem tagged pointers. Add a cast to fix the sparse
warnings:

arch/riscv/kernel/acpi.c:216:30: warning: incorrect type in return expression (different address spaces)
arch/riscv/kernel/acpi.c:216:30:    expected void [noderef] __iomem *
arch/riscv/kernel/acpi.c:216:30:    got void *
arch/riscv/kernel/acpi.c:224:24: warning: incorrect type in argument 1 (different address spaces)
arch/riscv/kernel/acpi.c:224:24:    expected void *addr
arch/riscv/kernel/acpi.c:224:24:    got void [noderef] __iomem *map

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..0d52942f94d5 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -213,7 +213,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
 	if (!size)
 		return NULL;
 
-	return early_memremap(phys, size);
+	return (void __iomem *)early_memremap(phys, size);
 }
 
 void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
@@ -221,7 +221,7 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	if (!map || !size)
 		return;
 
-	early_memunmap(map, size);
+	early_memunmap((void __force *)map, size);
 }
 
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
