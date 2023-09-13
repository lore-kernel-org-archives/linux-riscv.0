Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06479EE01E2
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yP9OUFZ5SrYD5WxKDJB406FByK+kRYc8k24C9QO4+Pg=; b=TglUVQCH12C3Tk
	fhsFp/ztiJezxSe7TWt0ByNWzdP0bUJlqvPS+TE4NkHNmVHICFRWjGDSUa8VURAGEmm77c5mdzZdi
	BlyL+HKyQJQXUDpW9YLsrgUgDaQvALACmZ+FNxKAhosvLInFeQa5QtJKQ9mrYcGo9rpqAuRxGjja3
	YGag+Fa/x//9e5b/C/804TN4Ujwwr02GO5dRJ4Irv8q+ivJcu3AQaVAh1f8UXJc3a5JO/3L1NjgVY
	tL9NMLs0J/oez+XDBfZvHqK+mD0IGqOTl48ccdNdTWRpLBELk/thr5729Q9WMlYWe5BNKMQPW4SAt
	YGRbg8t4tZPWsc8ywxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSwe-006OV0-0b;
	Wed, 13 Sep 2023 16:42:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuE-006Lgh-0e;
	Wed, 13 Sep 2023 16:40:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8EB13D5;
	Wed, 13 Sep 2023 09:40:34 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50C7C3F5A1;
	Wed, 13 Sep 2023 09:39:55 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: x86@kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Russell King <linux@armlinux.org.uk>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com
Subject: [RFC PATCH v2 32/35] ACPI: add support to register CPUs based on the _STA enabled bit
Date: Wed, 13 Sep 2023 16:38:20 +0000
Message-Id: <20230913163823.7880-33-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093958_583161_D60D0157 
X-CRM114-Status: GOOD (  14.30  )
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

acpi_processor_get_info() registers all present CPUs. Registering a
CPU is what creates the sysfs entries and triggers the udev
notifications.

arm64 virtual machines that support 'virtual cpu hotplug' use the
enabled bit to indicate whether the CPU can be brought online, as
the existing ACPI tables require all hardware to be described and
present.

If firmware describes a CPU as present, but disabled, skip the
registration. Such CPUs are present, but can't be brought online for
whatever reason. (e.g. firmware/hypervisor policy).

Once firmware sets the enabled bit, the CPU can be registered and
brought online by user-space. Online CPUs, or CPUs that are missing
an _STA method must always be registered.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/acpi/acpi_processor.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index b67616079751..b49859eab01a 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -227,6 +227,32 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
 	return ret;
 }
 
+static int acpi_processor_make_enabled(struct acpi_processor *pr)
+{
+	unsigned long long sta;
+	acpi_status status;
+	bool present, enabled;
+
+	if (!acpi_has_method(pr->handle, "_STA"))
+		return arch_register_cpu(pr->id);
+
+	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	present = sta & ACPI_STA_DEVICE_PRESENT;
+	enabled = sta & ACPI_STA_DEVICE_ENABLED;
+
+	if (cpu_online(pr->id) && (!present || !enabled)) {
+		pr_err_once(FW_BUG "CPU %u is online, but described as not present or disabled!\n", pr->id);
+		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
+	} else if (!present || !enabled) {
+		return -ENODEV;
+	}
+
+	return arch_register_cpu(pr->id);
+}
+
 static int acpi_processor_get_info(struct acpi_device *device)
 {
 	union acpi_object object = { 0 };
@@ -318,7 +344,7 @@ static int acpi_processor_get_info(struct acpi_device *device)
 	 */
 	if (!invalid_logical_cpuid(pr->id) && cpu_present(pr->id) &&
 	    !get_cpu_device(pr->id)) {
-		int ret = arch_register_cpu(pr->id);
+		int ret = acpi_processor_make_enabled(pr);
 
 		if (ret)
 			return ret;
@@ -526,6 +552,9 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 		acpi_processor_make_not_present(device);
 		return;
 	}
+
+	if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_ENABLED))
+		arch_unregister_cpu(pr->id);
 }
 
 #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
