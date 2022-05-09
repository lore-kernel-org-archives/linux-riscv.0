Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D117C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svQgQdqGWu8Ek2QSVBmvTiwzOllV6MRt+B035VTTvyk=; b=izr9sSnVRheWG0
	gW17jDFyEp05w6sAS/bsseNVrrKbbi7zgxXrFb7wtiScUBCGCywvcnWfjOQx5+yU0yVcBjVGopF6i
	D6MdvegS1bh0i5UuPvOnaDlPLH1hlL4z98gY0bienPXIS7BpldRl8eqOYatyc2QDf9HrE3sZNUhAm
	FuRAIEPp1woua9/BcZXjOfdALhHID2dg91VC8HXMHokqamqo6wNdbTUOnnA7G6ZfUSTFveVtq7uNW
	NJwN7YX0fKjxoEWBol8CZ3vTAji5KmLAXIJi3/ruG9afJx5lWTcaoDqghaC4Log3cy1bTGrIFCIud
	K/E31izHpkCX8M8N4ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCu4-00GlVZ-J4; Mon, 09 May 2022 23:35:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCta-00Gl5F-Ta
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 8E5731F44225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139269;
 bh=EWW47oALn1Py7rO4Rd4kvLdqb3xgTFAdsjGRYU8cAKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XdL/zWKlCfq+TjvuU5fks/wPZFNjeji7AfXoYAF4bTiiFsU+GbQDWY5508Nou7Rce
 WYBcyhfJDaUwS8cKmQ/6xhTDhEn7DgZ437y6IJmFfUHbyhUr2I0pUQT65Nc5H/sWQX
 4CQ3Oqfcv1qGbFpHVtnQr4Z3IC7yIc9gWPTXPgaxSTbFDl6YwL8B3phA9z7ZaOppvE
 f7qvUmb7kMaTIEa9YuMPH0XJi4FR1vaJB4JWphvOXWQxkyMm2uwk+0LT1pd1wpZb/e
 wcTKgqKz4FgaEUjSUJQHs+uwYiB91IQ/Go1i+BrOc9tM3Caq7CuU3nClpmaBT9NJXU
 qmHj9eFJTTNIg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 22/27] ACPI: power: Switch to sys-off handler API
Date: Tue, 10 May 2022 02:32:30 +0300
Message-Id: <20220509233235.995021-23-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163431_136109_6B90CE56 
X-CRM114-Status: GOOD (  14.10  )
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

Switch to sys-off API that replaces legacy pm_power_off callbacks,
allowing us to remove global pm_* variables and support chaining of
all restart and power-off modes consistently.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/acpi/sleep.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index c992e57b2c79..c3e3cee27f01 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -1023,20 +1023,22 @@ static void acpi_sleep_hibernate_setup(void)
 static inline void acpi_sleep_hibernate_setup(void) {}
 #endif /* !CONFIG_HIBERNATION */
 
-static void acpi_power_off_prepare(void)
+static int acpi_power_off_prepare(struct sys_off_data *data)
 {
 	/* Prepare to power off the system */
 	acpi_sleep_prepare(ACPI_STATE_S5);
 	acpi_disable_all_gpes();
 	acpi_os_wait_events_complete();
+	return NOTIFY_DONE;
 }
 
-static void acpi_power_off(void)
+static int acpi_power_off(struct sys_off_data *data)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
 	pr_debug("%s called\n", __func__);
 	local_irq_disable();
 	acpi_enter_sleep_state(ACPI_STATE_S5);
+	return NOTIFY_DONE;
 }
 
 int __init acpi_sleep_init(void)
@@ -1055,8 +1057,14 @@ int __init acpi_sleep_init(void)
 
 	if (acpi_sleep_state_supported(ACPI_STATE_S5)) {
 		sleep_states[ACPI_STATE_S5] = 1;
-		pm_power_off_prepare = acpi_power_off_prepare;
-		pm_power_off = acpi_power_off;
+
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF_PREPARE,
+					 SYS_OFF_PRIO_FIRMWARE,
+					 acpi_power_off_prepare, NULL);
+
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					 SYS_OFF_PRIO_FIRMWARE,
+					 acpi_power_off, NULL);
 	} else {
 		acpi_no_s5 = true;
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
