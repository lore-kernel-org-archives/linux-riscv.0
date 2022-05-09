Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6906DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+PkuOkYNYjrtiPyGbTl9foVbISR0xFSLKdVxg/I+/E=; b=YEsHAwd+lsAlYe
	otTO5Uxc3sBIN8pbkxZaDOn3cP3V+DqTBseBESSWe7fRXy0nF2Jn7zdj0Ovvs04qJ3ttdU+M89lGt
	kXyRj103/DTNR82VfrL9FlZsEIxypJOK3M1tfRtWeKTs/wpUR9bVFN9zIa7CXQVMkse2yJeA1wxEZ
	03NfVMBwfbPt85Wt8I+uA+XqreSiiMlRGZnY8ETB4euw4UXAR6uglVrTWz8F0Glx5zcSDRJb2bdPN
	RxB5uFCSdTMD/y5WYfpwlLPPkOkrnyjGHpy7ajLjznnQJmZifBkWjVbArZgBr9IRXm3XDes4aKb/m
	17lsFV+PsQISq8mfD0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCsh-00Gk5g-Eh; Mon, 09 May 2022 23:33:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsd-00Gjzq-NG
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id DDF821F430B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139210;
 bh=YK0F6fR8XWeV2rG0cbTxAWJjHbs9t/ROkX6NXAfeuRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WX2wLAoFqw2NcqFA+1BgEi+pnSqQ/OT0ntArBclZh3rRdgYWFpNobAvm6ZwR47f5O
 UVB/nJt08DF0z35eem1y5e29iS6TGa3FlqumDo8Gztlg9RTEy3yXgoM/PdqWZ72qjH
 BBXHhpZMhXXq1gmyrAUnf9JuPFEL0VuxOWgpl0g7gErLQMCAr8EBR7mlBfM7b/CzpF
 rbbVZCAv5Su19JHE0dZAYAwszfCQR2CPfwc4wUkYqtr+WKd4w8pxs2RFEPFv5Qa681
 /mjY+RYiodQ7Rz1Y3p36rejWNrVlI8LiNaH4VL6v6O9rIPyvlE8v1d9uqae+R0n5sB
 mZdrZdLthuUpw==
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
Subject: [PATCH v8 07/27] kernel/reboot: Add kernel_can_power_off()
Date: Tue, 10 May 2022 02:32:15 +0300
Message-Id: <20220509233235.995021-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163332_011116_0B10F207 
X-CRM114-Status: GOOD (  15.84  )
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

Add kernel_can_power_off() helper that replaces open-coded checks of
the global pm_power_off variable. This is a necessary step towards
supporting chained power-off handlers.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/linux/reboot.h |  1 +
 kernel/reboot.c        | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 6b951d68c0c7..c52f77ee4ddd 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -149,6 +149,7 @@ extern void kernel_restart_prepare(char *cmd);
 extern void kernel_restart(char *cmd);
 extern void kernel_halt(void);
 extern void kernel_power_off(void);
+extern bool kernel_can_power_off(void);
 
 void ctrl_alt_del(void);
 
diff --git a/kernel/reboot.c b/kernel/reboot.c
index eaede35f45e2..982e58c11ce8 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -523,6 +523,18 @@ void do_kernel_power_off(void)
 	atomic_notifier_call_chain(&power_off_handler_list, 0, NULL);
 }
 
+/**
+ *	kernel_can_power_off - check whether system can be powered off
+ *
+ *	Returns true if power-off handler is registered and system can be
+ *	powered off, false otherwise.
+ */
+bool kernel_can_power_off(void)
+{
+	return !atomic_notifier_call_chain_is_empty(&power_off_handler_list);
+}
+EXPORT_SYMBOL_GPL(kernel_can_power_off);
+
 /**
  *	kernel_power_off - power_off the system
  *
@@ -581,7 +593,7 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 	/* Instead of trying to make the power_off code look like
 	 * halt when pm_power_off is not set do it the easy way.
 	 */
-	if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !pm_power_off)
+	if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !kernel_can_power_off())
 		cmd = LINUX_REBOOT_CMD_HALT;
 
 	mutex_lock(&system_transition_mutex);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
