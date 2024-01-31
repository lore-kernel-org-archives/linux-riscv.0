Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E3C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dujs7toImBowdPcwBSNGyfjvdzazDE93msW4it8dV7k=; b=P6jq56eIuxoQTO
	3DdQHkqoiaYfAO4/9DWHkUC6TanCywmWqtGIDViGFe/p3oKYEBOVyrn0tSehaYJdTZAoPG2Hzfbkn
	LTCuSQuTyHzumOx/VsqZZ2Ht8/W2a0cAB1PvcdJ9wHiZ0l+xbXT7oh9OKw0n8pjUN5mPJY9DR8H71
	6q8gS/xS4cVJ5Ctn5kLj69yI49y0XywyMDwC71T5TcYOdZQoN2P4P45mCCP6FzazZFDm2AMCaFmmF
	8GJCWzFDgiV4E0eFhBB8ls2ItBL6NPT8m+agS4dEQHXaHd9s/fUKvdAxB2+A68ODL+wLB39znSDj+
	DPMiT3kI+CWO2SQ/3Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDo9-00000004eMA-0c5h;
	Wed, 31 Jan 2024 16:51:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDnM-00000004dkq-2dNX;
	Wed, 31 Jan 2024 16:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=o2MrjFvCOw1b7pTxYA5/NEaOWmpus9U7QuVGDdVa0nE=; b=loL2vcxec+ARqo67gcQqurIyZp
	GKR+socixmSwFHqQbwa+yQi94y2k+dP6/XcoMDAioxVT9pqM91lt6CccAEzX397bFCsn8OeTIRawn
	oanWrGMnxZNTMYsonbFVeZ3MGxr0soIZJwGwODvzXpD5ytQEnZlYcPNZgh+vZ9x2szIU4jYVhw6Fi
	m8Lzw5k3SAKE8rXQqi65T0jV1ZXPun5eN+2hqY4H5//VpaB4MguK+Oq91DvE4TeqFmEje3CploN1l
	4ZTOuIAr3U3ZIkgT40R9U7KwwwzGls/0V6sN0ShH3Zt1NSn4x8loLUNVXm3b1vHm3U47ZpBe0I7Uc
	LtrZYeMg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDnJ-000000097zC-2Nw9;
	Wed, 31 Jan 2024 16:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o2MrjFvCOw1b7pTxYA5/NEaOWmpus9U7QuVGDdVa0nE=; b=bU/a2cQUIWp4jFJhM2Z3n0C5WV
	uet9BddEoodtQ+GVvml+UvDt7YB2LuSm3+WYt9gHC8BESWulwJ7CDhKsY/dV4p92LzgphJLZfyjNc
	M6PLDkarQ6PzpuRhmreeo64qoAiZHsMFOJekaW5ywN6mOqys4dkJS59ly2KB0nZSf5oUmGYJQpJFf
	sQUGtj4Du98gprRQDrhgC1LkpUUGVwV7j/IbdbxCPsez4hgIybJUOpJLq1VeQdo6lRfl5XjAcbplW
	VYj5zQR5GMuZU1AOJhl9BQpqM69MY9d8ZSjlk2b0RNARabo1r7uDnH1z6zZyaWnGuklMnM+ffmIa3
	WrzoOnNw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56564 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rVDmt-0003Ub-31;
	Wed, 31 Jan 2024 16:50:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rVDmp-0027Yn-5x; Wed, 31 Jan 2024 16:50:07 +0000
In-Reply-To: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
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
	 James Morse <james.morse@arm.com>,
	 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH RFC v4 06/15] ACPI: convert acpi_processor_post_eject() to use
 IS_ENABLED()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVDmp-0027Yn-5x@rmk-PC.armlinux.org.uk>
Date: Wed, 31 Jan 2024 16:50:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_165037_718837_6C381D06 
X-CRM114-Status: UNSURE (   9.70  )
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/acpi/acpi_processor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 00809c3b09f7..5351095b6968 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -457,12 +457,14 @@ static int acpi_processor_add(struct acpi_device *device,
 	return result;
 }
 
-#ifdef CONFIG_ACPI_HOTPLUG_CPU
 /* Removal */
 static void acpi_processor_post_eject(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU))
+		return;
+
 	if (!device || !acpi_driver_data(device))
 		return;
 
@@ -501,7 +503,6 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 	free_cpumask_var(pr->throttling.shared_cpu_map);
 	kfree(pr);
 }
-#endif /* CONFIG_ACPI_HOTPLUG_CPU */
 
 #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
 bool __init processor_physically_present(acpi_handle handle)
@@ -626,9 +627,7 @@ static const struct acpi_device_id processor_device_ids[] = {
 static struct acpi_scan_handler processor_handler = {
 	.ids = processor_device_ids,
 	.attach = acpi_processor_add,
-#ifdef CONFIG_ACPI_HOTPLUG_CPU
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
