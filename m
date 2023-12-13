Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1173C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Bz0e5db2Ia4qRQ+gmOtH1l+grM0Vei9AUtuQYYF5A=; b=Uu6MoHAOiA60PN
	iusF5NyV0JlrhVXnOAUxhnbTovalBPs0TQJm/hqDq7T4RXLL/ybA3dR0Lq4tR8RDB4VSPN1z0Toq7
	UrzVhCW+m9sgQ5n/WfgSJ6inVXu8ZcLxQrOpKnK07o3k5gU/wSW0r1SaP/AlvG5afoNil5uCNLF54
	AEMN3lflRNFzEufiHXeZt99QzbEJwRpmYc7p1An+fbsbyhjjq3mxifPamIxnqW/yMZ26c+REk/jol
	qlWvfOUthxpLlXTJcLWLxULaqWunPqFgVfTYW9rfVBOVHbbhXAL+KDA1IEjXzxmX+E/iLjurtaK1c
	xQfq/iDTYdeu9H7GOvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOj9-00EgtA-2q;
	Wed, 13 Dec 2023 12:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOj7-00EgqQ-0G;
	Wed, 13 Dec 2023 12:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=xRMKGWwlt+tDnJgmpjIjTzFwGAKGxwsQWsjqqxoBgt4=; b=RAylBw/g8Cf5WlazP1RjbjBu+r
	im54Kwi9lVQRRG9JSaGf5NFrFqcNdqag2k1RsqNLjsLcwdup0o+oLRDD6aF3GCTf1dXW3BKq3JWOL
	xd8Ul2RR8XPN8tD36O1GOqmbzdCNv0f07DKLrCHUgHlAYk1T31NdKuNJbWEf0MtLJqcIibuOj2Xgu
	nXem9nHgN9YdhLd5TK+TK+BQT6lDDmu6wcI6PT+1BzCQmaMpsDoGyCp1JJChgz4OD9MnlWj+yXKWM
	OkSuh5EdcJWhtzmdOoM10BSnbD+7Cuj2ogIW56U28LH4sB3kGjCe9SgB6nGh1YlvdSsTiMSSiX4S1
	sFmOyShQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOj3-00963n-3B;
	Wed, 13 Dec 2023 12:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xRMKGWwlt+tDnJgmpjIjTzFwGAKGxwsQWsjqqxoBgt4=; b=sAvIu/KfdRhiVQLQAzi1pftBLD
	AZtA0Hs5SOUW3Khxxl6f/hWMpFepsEJgQyGqVCXf2J6iqPGh1irYe61lsvzQauQCuuk+uH3FyHaw7
	AvzGgWM+IPItC0K7GAs/xGD92ORf6Skc8i2iWAeY2h5KaO3CYUXJv5yEt7Urk6M+uQaQNv9JbUQDV
	WhUE9WkIHa4o1Mu0hFaS70ASAxlzFvPz/G7aA7qW+OsLl7PvjXZFeIE6zhxGyqU2kqJAojzd1G5ES
	+rzSzq86l+CfY2K8inR1g8Pu6l9z/cbz6RWLKJk+7kIqPgRBox16Ks375iUFf7Q9Q5zjcipcX2OP+
	dwCo2UTw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgf-0008FI-2J;
	Wed, 13 Dec 2023 12:50:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgh-00Dvkc-U3; Wed, 13 Dec 2023 12:50:07 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
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
Subject: [PATCH RFC v3 11/21] ACPI: Warn when the present bit changes but the
 feature is not enabled
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgh-00Dvkc-U3@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125234_232655_565617EA 
X-CRM114-Status: GOOD (  12.00  )
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

From: James Morse <james.morse@arm.com>

ACPI firmware can trigger the events to add and remove CPUs, but the
OS may not support this.

Print an error message when this happens.

This gives early warning on arm64 systems that don't support
CONFIG_ACPI_HOTPLUG_PRESENT_CPU, as making CPUs not present has
side effects for other parts of the system.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2:
 * Update commit message with suggestion from Gavin Shan
---
 drivers/acpi/acpi_processor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 19fceb3ec4e2..b7a94c1348b0 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -189,8 +189,10 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
 	acpi_status status;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
+		pr_err_once("Changing CPU present bit is not supported\n");
 		return -ENODEV;
+	}
 
 	if (invalid_phys_cpuid(pr->phys_id))
 		return -ENODEV;
@@ -462,8 +464,10 @@ static void acpi_processor_make_not_present(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
-	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
+		pr_err_once("Changing CPU present bit is not supported");
 		return;
+	}
 
 	pr = acpi_driver_data(device);
 	if (pr->id >= nr_cpu_ids)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
