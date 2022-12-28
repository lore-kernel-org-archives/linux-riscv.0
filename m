Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33800C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PnufoeMAReyM66dr8/krY9exVl9NoCPJaHipqCAwQ4=; b=bKS6o8Xr+BiGJ7
	QMTFf6IxPeM9k19vwS/zZt2gi0Ycu6WRhR3DnJQxCn78TtQ0FOVbOGkvaACueFP6fI/lUIhK8yFhF
	wQql83e004zZX/nsdZkeHn+HC5fLXjprfjHqdAigI1rbDN+++GsV/uCQiGpTeHfJLgO/DzIuLbDNq
	1l8Ae5ynUwBz+ItYvSDl3gY7oDK8yKfGzV1YRzHQy9iiPDw9SDnHHaL0QiU3X4A7rnd3x1W5lU85L
	M7V5zuZfgBF/AieJbQQwvWiRNANFwDNVYaW+D4hhXKeXaK5rSd/OPPt+f4jU4zBQ9GWfYNTOKQKqe
	sgNjL1g4garUxtR2DnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9Y-006J3a-Qn; Wed, 28 Dec 2022 16:19:40 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9I-006Iqc-6m
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 16:19:27 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8055B5C016A;
	Wed, 28 Dec 2022 11:19:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 28 Dec 2022 11:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672244363; x=1672330763; bh=tN
	PPicb71bW2Kkv83J5nMmqaOBqEDoEyAGBVtrD7K44=; b=TbueCSE7mAQv23DvP8
	mOfeGFH9G7YmfvOdXAlRalPfIY3bGsWjSkDSsuf45D5MfOy3vQclW1fA8Sdzq8W9
	TWhrkcdUMxTtIMVs77QBREbkEWed3JWmiL+FyTmC3z7NqXbw08QKffLoxctuOFW5
	QYZLFmCTTz/PSaPKgf03sq3zZV1ur5hGT0Oju/O8hFPLG1uUxbkT1s/MonzJFtPy
	bwnC8Mdvko3nMCWThcew6/JnivB8rzr/WLm36HlfIeGpHHLDgMflUbL2kH68hpeH
	DycAfD06Nu5RPde6eUjq7AEn3xhNXdnEDrQufRl4saGzKrEic5eP+hWJe2eJGHgJ
	tAwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672244363; x=1672330763; bh=tNPPicb71bW2K
	kv83J5nMmqaOBqEDoEyAGBVtrD7K44=; b=MfOiLrflpldJKncXeb5+CfhFO4VoZ
	XZE7QF/FtBEaP8SCQkECtHij1BsQMDoZBoP2YkK758J4lCdub9ZLU6eOr/leODO2
	MihTCIVx7n7M+k3X/Z9gGMkiTsZiA7YTdBL5fG+8Vd0q3u2bYgBwOELAltvHYY6T
	wE6nEQ8Ug7IhHqrmGnY6PfeOLbsGzqYwQ+SXIKDdmPngQwWkMMciFGr4VdFl3uX1
	nhijrEgL4O6OlaRIIUsYfjzbN57Oc55WZBBR7An1vZrOj3LZbT/Wt9zCCF+u3BK9
	eWwVd0fqry43TLsyR84rD6YW2d17gRF8EktbulbeHbSxaFbqPyGvFDCkA==
X-ME-Sender: <xms:i2ysY9W23dUf7cMF4P6aV6V7WvJzBTCSqltMhkri9__YiOYCYtgKcQ>
    <xme:i2ysY9lS_MuiEHfQVf68AdN1Ea89FjdKER7K_wzugksm_3clWo2Yu1IDyoJh4vNh_
    28w0FrNAz9-bTcCMQ>
X-ME-Received: <xmr:i2ysY5aUShLndy4drpbv5AUMZo9YDTPXxvxhSCB3T936JkqN3M62mDqqFtb9W1npAufyr4cf9up-NRxBc5GsKk_B9tJ6_Rkg7fq7qXf4BiMGN8KNvsmKJO5VbCx_cbNcx-ZU1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:i2ysYwV0ax7Dex3m1QDOVRaZjlC7EA4jErsTsh0bBiyJqngWusXE8w>
    <xmx:i2ysY3mo3AS8Kak18np_NhohFAnOyNB0Ds3_sUWQvX5-9dQaxCgJqw>
    <xmx:i2ysY9cNww-Qu1J-TQtE71-YFASoUTWXjLOxKVZFZQSZhT6qmRrTng>
    <xmx:i2ysY50uij-XpUgY_CfNPMbpefROjXLDH-D7Pm-ABYCQGkisJu9ZUA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 11:19:22 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	tangmeng <tangmeng@uniontech.com>
Subject: [PATCH 3/3] riscv: sbi: Switch to the sys-off handler API
Date: Wed, 28 Dec 2022 10:19:15 -0600
Message-Id: <20221228161915.13194-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221228161915.13194-1-samuel@sholland.org>
References: <20221228161915.13194-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_081924_416133_EB74AFFC 
X-CRM114-Status: GOOD (  14.13  )
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

Any other poweroff handlers registered at the default priority will
run before the legacy pm_power_off() function. Register the SBI
poweroff handler with the correct priority to ensure it runs first.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/include/asm/sbi.h |  1 -
 arch/riscv/kernel/sbi.c      | 52 +++++++++++++++++++++---------------
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fbacff42..2915a3ddf7c6 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -267,7 +267,6 @@ long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
 void sbi_set_timer(uint64_t stime_value);
-void sbi_shutdown(void);
 void sbi_clear_ipi(void);
 int sbi_send_ipi(const struct cpumask *cpu_mask);
 int sbi_remote_fence_i(const struct cpumask *cpu_mask);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1196c12299f6..9574851eae6e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,7 +7,6 @@
 
 #include <linux/bits.h>
 #include <linux/init.h>
-#include <linux/pm.h>
 #include <linux/reboot.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
@@ -120,15 +119,16 @@ int sbi_console_getchar(void)
 EXPORT_SYMBOL(sbi_console_getchar);
 
 /**
- * sbi_shutdown() - Remove all the harts from executing supervisor code.
+ * __sbi_shutdown_v01() - Remove all the harts from executing supervisor code.
  *
- * Return: None
+ * Return: NOTIFY_DONE
  */
-void sbi_shutdown(void)
+static int __sbi_shutdown_v01(struct sys_off_data *data)
 {
 	sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
+
+	return NOTIFY_DONE;
 }
-EXPORT_SYMBOL(sbi_shutdown);
 
 /**
  * sbi_clear_ipi() - Clear any pending IPIs for the calling hart.
@@ -204,11 +204,6 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 
 	return result;
 }
-
-static void sbi_set_power_off(void)
-{
-	pm_power_off = sbi_shutdown;
-}
 #else
 static void __sbi_warn_unsupported(const char *extension)
 {
@@ -216,6 +211,13 @@ static void __sbi_warn_unsupported(const char *extension)
 		extension, sbi_major_version(), sbi_minor_version());
 }
 
+static int __sbi_shutdown_v01(struct sys_off_data *data)
+{
+	__sbi_warn_unsupported("Shutdown");
+
+	return NOTIFY_DONE;
+}
+
 static void __sbi_set_timer_v01(uint64_t stime_value)
 {
 	__sbi_warn_unsupported("Timer");
@@ -236,8 +238,6 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 
 	return 0;
 }
-
-static void sbi_set_power_off(void) {}
 #endif /* CONFIG_RISCV_SBI_V01 */
 
 static void __sbi_set_timer_v02(uint64_t stime_value)
@@ -574,10 +574,12 @@ static int sbi_srst_reboot(struct notifier_block *this,
 
 static struct notifier_block sbi_srst_reboot_nb;
 
-static void sbi_srst_power_off(void)
+static int sbi_srst_power_off(struct sys_off_data *data)
 {
 	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
 		       SBI_SRST_RESET_REASON_NONE);
+
+	return NOTIFY_DONE;
 }
 
 /**
@@ -657,7 +659,6 @@ void __init sbi_init(void)
 {
 	int ret;
 
-	sbi_set_power_off();
 	ret = sbi_get_spec_version();
 	if (ret > 0)
 		sbi_spec_version = ret;
@@ -686,19 +687,26 @@ void __init sbi_init(void)
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
-		if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
-		    (sbi_probe_extension(SBI_EXT_SRST) > 0)) {
-			pr_info("SBI SRST extension detected\n");
-			pm_power_off = sbi_srst_power_off;
-			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
-			sbi_srst_reboot_nb.priority = 192;
-			register_restart_handler(&sbi_srst_reboot_nb);
-		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
 		__sbi_rfence	= __sbi_rfence_v01;
 	}
 
+	if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
+	    (sbi_probe_extension(SBI_EXT_SRST) > 0)) {
+		pr_info("SBI SRST extension detected\n");
+		sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
+		sbi_srst_reboot_nb.priority = 192;
+		register_restart_handler(&sbi_srst_reboot_nb);
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					 SYS_OFF_PRIO_FIRMWARE,
+					 sbi_srst_power_off, NULL);
+	} else {
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					 SYS_OFF_PRIO_FIRMWARE,
+					 __sbi_shutdown_v01, NULL);
+	}
+
 	riscv_set_ipi_ops(&sbi_ipi_ops);
 }
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
