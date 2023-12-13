Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7125BC4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjLyBokZh02YYGD+1FQD5ibrkOqZ1h1yFxsKcesuez4=; b=atgP0GnpwW/NHK
	tE8iROGnF40VX5DdQKKNj76GFrOV+2p5tsD8ve4+8ktTr6ZJ3AtU0+1TyBni2a+WHwZXRmd9y+ZXn
	3Ku+FU3/iRwKnsGgXG1k41yyZUE9Iz0cjBnxvrxrTqgfFIrjRUhIRQdSWzYt+fqzWFMhGR8Xk7Apr
	K+vai34H7S6aKXASsSdnZ4qVc5xXIkf8XfKVXDYFZdUYlxn0l455vTqC0GPbP3o9gAYZOcnXTWnig
	/hIvaMIdMK8r9AXCpQ35QBcjjF4dhUvhtlkVdZwYjhYFuFEr9y90gJBrWjJmrp70u8yzod27BWalz
	QtYyxHezWhNwlaSkbyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPnj-00EvzC-2M;
	Wed, 13 Dec 2023 14:01:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOgi-00EeKi-2F;
	Wed, 13 Dec 2023 12:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oPeme1Idl7Or3jdMYkiOWAf3GphaNVmJTG+4LYE0TBg=; b=AGYycIJJ1HK/RXsJpD4nE7Zosg
	WJHYKYmLu98XkzqmJxjN/Ejtq/87JEgiJq/3fsU9u2Vd0hVEkWMPHhvaTrGlWOQ+97ar8oNzGWutu
	zwVgUDd3oP50s85O+DSifKJCgZ0JIs8pUWOFCFqGeW6fnNa89FFJLrhiU78AxYABi2PgZ7OnVC5c0
	mPqNLJhbC8p01YDBwk8YMbQ1VHZo97tq6RvwJNYezmZ++MFgEFBeOtxkMaRAL3gitdNMUh43SuFR0
	nzuNl8YomZk5pxXIBUm73pO8DiZslIc/orjfmoZgpp64FReJp0wHLUanvPkpT2mDNEgsjhJ+AqeOb
	RDyeENMw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50920 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgV-0008Ei-1G;
	Wed, 13 Dec 2023 12:49:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgX-00DvkQ-Lg; Wed, 13 Dec 2023 12:49:57 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
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
	acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: [PATCH RFC v3 09/21] ACPI: convert acpi_processor_post_eject() to use
 IS_ENABLED()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgX-00DvkQ-Lg@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:49:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_045008_742978_4B12FA37 
X-CRM114-Status: UNSURE (   9.28  )
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

Rather than ifdef'ing acpi_processor_post_eject() and its use site, use
IS_ENABLED() to increase compile coverage.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/acpi/acpi_processor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index b6f5005985c3..01c460881662 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -457,12 +457,14 @@ static int acpi_processor_add(struct acpi_device *device,
 	return result;
 }
 
-#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
 /* Removal */
 static void acpi_processor_post_eject(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+		return;
+
 	if (!device || !acpi_driver_data(device))
 		return;
 
@@ -501,7 +503,6 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 	free_cpumask_var(pr->throttling.shared_cpu_map);
 	kfree(pr);
 }
-#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
 
 #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
 bool __init processor_physically_present(acpi_handle handle)
@@ -626,9 +627,7 @@ static const struct acpi_device_id processor_device_ids[] = {
 static struct acpi_scan_handler processor_handler = {
 	.ids = processor_device_ids,
 	.attach = acpi_processor_add,
-#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
 	.post_eject = acpi_processor_post_eject,
-#endif
 	.hotplug = {
 		.enabled = true,
 	},
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
