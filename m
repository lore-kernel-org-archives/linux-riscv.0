Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CC5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGPqIz4BHn3R4WgtW2uhlv0OvMP5b0x5mLtfU0mb4qs=; b=OxWM4fZgSfFVxy
	gcjkEtHFB3C7MrOnrfMoxG3oekK7BvLMpIvjPPuRDi+OTehLA4UWdj2CIPIRyM8IQE7sYhmcZHghR
	eOFvBI4uByHPMUlBQt/LlLm+EjIiypK2Ci27b1THN1RFD2IENgtB0ImsZfXaEScgX4io2Fw9LrhQm
	nsurTiFyK08hU/hhROfVkwY5PPtL2C46F0+hisSTwBGumDXXCdP9rPUr9dxfXU1NL/vHD0vodj/cS
	aOVDGe9YuiOAzT9ni6w858rr+FCJ54J/D1aruWk99yBUu/i3100OA6KvpbRwOtBLntUJbQSI6qto8
	12CB+/uScEkK/+MPpKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOho-00EfS6-2F;
	Wed, 13 Dec 2023 12:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhQ-00Ef2Q-2k;
	Wed, 13 Dec 2023 12:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=lmtH59uo0RH6OWln4SWiUMu9ATT5+EWsaWDCzIDILMw=; b=pMqckjb85eBCivxGbpsNv/CRjq
	ZRf05ySMnGbEeYhiKV96yYztuA19cyJ8fSCnGriut//JqO3b1zbkfmEIVsfTc+3tu2JzxDkppIiTJ
	9QbtlkCk5EXlZ9cc63sPA/xSUgkvdY1tZWi0wgXt0+Gto1CuF2b2dff6cfz35fCz1EcG/RoiEQbo6
	Gwp1xktk+IsxFHk/9uDQh6bwqheFg4E5njwOOafv9UpO6o5d52606kQsfqwVF+nXB6AHzzAZiPQEi
	mM/LQmSYyGQZUDKo5UNR6oI0UaCc47J5Odnt7zodK9u1kziwDzW7wstW5H9VklA3eXRyGTdMBW0Vi
	q0FqH4kg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhN-00967w-1F;
	Wed, 13 Dec 2023 12:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lmtH59uo0RH6OWln4SWiUMu9ATT5+EWsaWDCzIDILMw=; b=vjgZ5o4FgP2eXJBezIZp2zJ0xr
	t6xOqiS/tNc9Agtr4/gEtULHWFMdo+cMAqDbsj713CNHaHJh2E0IqnABMfHkAOf9zrsn8DfVcJDcA
	WkPWWZdNLaXZYBdXwmXvxAT4XOzI7++DthIonECZ/hHPO8CCBoK7myVrtmg7BcHy9HoM5Z1D8HRRy
	EeIGP/Kl3ObL1mjz6SIe0wNRspxRzY3s7YWxE88eF3Uk+9CSW1a2I7yhLMFjyPBF6Unn/nd9LnM7z
	EhdbIpoz0zO5WdAFp06vz+2/m5mcxpTMeF2HPrsXAVjTO1hJ+KQySmSlpsrEjacXbVpeeo8+7e5uu
	ck4N+yzw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51452 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOhF-0008HS-2A;
	Wed, 13 Dec 2023 12:50:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOhH-00DvlO-UP; Wed, 13 Dec 2023 12:50:43 +0000
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
Subject: [PATCH RFC v3 18/21] ACPI: processor: Only call arch_unregister_cpu()
 if HOTPLUG_CPU is selected
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOhH-00DvlO-UP@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125049_628264_549EAB23 
X-CRM114-Status: GOOD (  10.92  )
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

The kbuild robot points out that configurations without HOTPLUG_CPU
selected can try to build acpi_processor_post_eject() without success
as arch_unregister_cpu() is not defined.

Check this explicitly. This will be merged into:
| ACPI: Add post_eject to struct acpi_scan_handler for cpu hotplug
for any subsequent posting.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
---
This should probably be squashed into an earlier patch.
---
 drivers/acpi/acpi_processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 5dabb426481f..ea12e70dfd39 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -537,7 +537,7 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 	unsigned long long sta;
 	acpi_status status;
 
-	if (!device)
+	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU) || !device)
 		return;
 
 	pr = acpi_driver_data(device);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
