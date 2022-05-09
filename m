Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1349CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWVTIhNqATsfTMOhE/747T8VHHGT1KiTtuN1DbPQ8rg=; b=tQOS0w/5rmyyQC
	JtP5cBIkKe0Bx+dIuUjksyhJKMNaOqabz4leCBODQWY4a3sZEVHDJVTwVvddBh1PqBcLCEle/RK3/
	4eyRW3HspuHc5vB9RX2RyM5K00Bzsbb8ZcC4XKWi0bSBx0NKS8wyYKp8ZXjsXdpB2T3s70sJuNRm1
	SEYIeL4layvTF6gS3MMfkqGRqG5iu8Yvqd955H6IGmwkOoOPcFfGiGByGq4MccOIZxrlEHv0OsemJ
	JN5Gp25+36GcX8DZBddg2ZASOh1/XAljRkViBbsLe/zaG12JrnmuPcXqGxPFyUrIC/FYI0O9kzXW6
	MIazg/1lcyF5l0NW/F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCse-00Gk0M-5h; Mon, 09 May 2022 23:33:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsa-00Gjv5-Te
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id EB6021F43062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139206;
 bh=ADq4GZWEPNK7q9JUz/PJH0s7RkDgF/Hn0bL9XYpd1xY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KGyjgFeHS4c4whO9DLRPI4YnH/I1kcxhGjuZMUHWMXxrPTowBH3nsSioG+grbG2E8
 mnkheS9YppXiE1XFZmpN8+NhD/nzj2UXihmV79dBZXmBvvWVTCKWXHTP8bvClUAXj1
 4nlNgidw2ooBaq465rODMaKeABNVE6nkuJ7Q8Xm3bGYMUs6PLqgcdGYa5CtQU2PUK/
 Jza3RN8pd4IlpFmarCSW5s3ufDshdt5+jjA/5gruEo9hsKxIniPgqZA10L6lW8+LoM
 tuiD7AddByNEUUZsYAIaBWxhshHGAxlCDHWH4Mq16erEhm603eMlSqLobcqsLKpUet
 qm4lCWHEs4Jdw==
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
Subject: [PATCH v8 06/27] kernel/reboot: Add stub for pm_power_off
Date: Tue, 10 May 2022 02:32:14 +0300
Message-Id: <20220509233235.995021-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163329_127893_4845F9D8 
X-CRM114-Status: GOOD (  13.69  )
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

Add weak stub for the global pm_power_off callback variable. This will
allow us to remove pm_power_off definitions from arch/ code and transition
to the new sys-off based API that will replace the global variable.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 kernel/reboot.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9afa99a32d62..eaede35f45e2 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -57,6 +57,12 @@ struct sys_off_handler {
 	void *list;
 };
 
+/*
+ * Temporary stub that prevents linkage failure while we're in process
+ * of removing all uses of legacy pm_power_off() around the kernel.
+ */
+void __weak (*pm_power_off)(void);
+
 /*
  * If set, this is used for preparing the system to power off.
  */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
