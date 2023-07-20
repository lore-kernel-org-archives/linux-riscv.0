Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284FFC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cCnKV/VdksfTZvITTlQZEhkmuhcHcpoz+yvTQ0bPDtQ=; b=4Dgv+9pLnq/TJf
	/5SglfubwLNdxNerA0/0OMvDzBDdNlE/IsncvawNpwNJqu5qR4uBFAqXo6s3qEK1b+BabWyzUL6I3
	OvIYFLvlEjz9sBWfDyyJfszc2EnGQXSyFEqvw6PDoTAPOGmGaSkc8za8Fsj6BeHx4wCZkz7hmIQcL
	FXrM7rz5tQcl3BxCjYZmUwaFEXA5qUSvEbSj6Ds2J5QHlUgYR8CrPwE9XBV71dqgsX3RxNiXpL7yy
	QIDhlGK8FRpId7/N/5oTs5A/jF8HiYL+LOgTw9T9rKGCdxEMebLoVaV8CAQMg7KJ0YqfMZencwMxx
	erk2GguL56TsCwJRVYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMHSy-009LXx-1y;
	Thu, 20 Jul 2023 00:24:24 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMHSt-009LVX-2R
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 00:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1689812641;
	bh=XDRuLIHkJfQQZemCigyLqfDZFz49CdHiP3pF+50Mh4Y=;
	h=From:To:Cc:Subject:Date;
	b=zE75NID500HHx7AXNN5cAVidTlWUW9W7yclZ3H094MkhZSeSOC3S65qXrsQXV92Kp
	 u3TbVgURqICL5ZmPNIfoonVx17GozG/3KqHpAAsFPv4r0w8naQ/MPsgo/ZY9efTMsB
	 5Hyb/rohhcv15NG+9i6yWz6R6hUccPhEgGJjNPuA=
Received: from localhost ([101.224.148.235])
	by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
	id 5FB3E47E; Thu, 20 Jul 2023 08:23:59 +0800
X-QQ-mid: xmsmtpt1689812639tblmroxam
Message-ID: <tencent_B931BF1864B6AE8C674686ED9852ACFA0609@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjyoRLlB1WdJIvKEZ+uXLTVV6mobk6OIzYcsk9NcixTRI+09csj6
	 A6Yso/kzi3FrJfhROjQ3VF/tdNNQJf0/gMKVus8ZxYR3irBaDnNyINv8rziCQUriDNs3t38ZC31z
	 G9ovwpjDqNp9cp2eR/EeE3zEVziqloAzv3z4bSsh4aprnUjOWJpFFcG4qC/P21cRNX1P+ZiKx+m1
	 IlxhI2lJc20BuZKnUm6/wFDQnfNhFrH6Aq1RfJQJGMSmH+/5/C9DJVtU61l9xKRlmHvJ0FTvVqyJ
	 ek1ciGmIHfgINhAM2puKYK2ayzTy0QnRVdl3tGMnGp1JXL+hisra5Bh/OAux8w9sK6lEURusk52M
	 rzqtUisrZOIXwqzyjeHXh6V3wJ4IhhAzwQbqoZoFcsNt/WBYECzzOcGGRJF8hjT/GDT6GFCkj3SR
	 +zV71ZPMwBRZdmOLDJq14Ry4Kvh00/Fv1H8bN3eduUH0sEUGaDCKB4xbumOLti8An1OrqyXTi1vf
	 YL/b/4OeSOO1Ri+TCnl6QqgkllPIPYktfM6BVUBVgvw2xyWxeJzyvVdrN0aK682CqWmI0Qj8vvVf
	 alemCeYCVuUbETBDLwCOhv2JYvr5eIEgPIRv8ZR5Hfz733fY01jrKxbWQ7gn0eFjV7KRdzgKOtxI
	 M/yFOeUaX9CRKoeM7OLhZi6VxKsXkrBUPOwYcqqUxmysg+edwrTLmAGI6ZwcsZAMfGzbSmHQrjAk
	 KsVl7BRsxTrfx6oxAT/zOzQxGp1ZtHjuPcxjN49Wiv4xkMIY8ZvqCvQu9zGMyZ/VkBD+cucoJn4N
	 Uc81tG0T473Y13dDXyZWGTqKI0iU3JZnEJ4UExl9GcScjhvVArdnsPx7r2kPcERauwfTqm2zgxyK
	 taoEiAfO1PMlrSd8cqMtbgRbKzJJrK4FYVwzxaiLejsrKiHW7EjxKGofgZI+tz/XeY2lYCeRgqFw
	 rVSG/V7eFueGunGRujUJoaDcPr+bP+qbSm2MEWMexLG77UC1uC9g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Woody Zhang <woodylab@foxmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH] riscv: add SBI SUSP extension support
Date: Thu, 20 Jul 2023 08:23:19 +0800
X-OQ-MSGID: <20230720002318.2543822-1-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_172420_339825_7337D952 
X-CRM114-Status: GOOD (  13.16  )
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

RISC-V SBI spec 2.0 [1] introduces System Suspend Extension which can be
used to suspend the platform via SBI firmware.

This patch can be tested on Qemu with recent OpenSBI with
`system-suspend-test` enabled like [2] in DTB.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://github.com/woodyzhang666/qemu/commit/e4a5120133c1dc354e6ac437ec1f870f6c0f6d05

Signed-off-by: Woody Zhang <woodylab@foxmail.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 arch/riscv/kernel/sbi.c      | 26 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..3b04016da671 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
+	SBI_EXT_SUSP = 0x53555350,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -236,6 +237,15 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+enum sbi_ext_susp_fid {
+	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
+};
+
+/* SBI suspend sleep types */
+enum sbi_susp_sleep_type {
+	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0x0,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..9a68959f9f18 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -9,8 +9,10 @@
 #include <linux/init.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
+#include <linux/suspend.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/suspend.h>
 
 /* default SBI version is 0.1 */
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
@@ -520,6 +522,26 @@ static void sbi_srst_power_off(void)
 		       SBI_SRST_RESET_REASON_NONE);
 }
 
+static int sbi_system_suspend(unsigned long arg,
+		unsigned long resume_entry, unsigned long context)
+{
+	struct sbiret ret = {0};
+
+	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
+			SBI_SUSP_SLEEP_TYPE_SUSPEND, resume_entry, context, 0, 0, 0);
+	return ret.error;
+}
+
+static int sbi_system_suspend_enter(suspend_state_t state)
+{
+	return cpu_suspend(0, sbi_system_suspend);
+}
+
+static const struct platform_suspend_ops sbi_suspend_ops = {
+	.valid          = suspend_valid_only_mem,
+	.enter          = sbi_system_suspend_enter,
+};
+
 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
  * @extid: The extension ID to be probed.
@@ -624,6 +646,10 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
+		if (sbi_probe_extension(SBI_EXT_SUSP)) {
+			pr_info("SBI SUSP extension detected\n");
+			suspend_set_ops(&sbi_suspend_ops);
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
