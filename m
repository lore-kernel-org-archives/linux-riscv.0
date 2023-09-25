Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F1E6FE31
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuRO0olmjkoZKEzKSNjKANZWNlxATUzGwnfZVMFCCXs=; b=hOT5UN1HmpNREF
	s7ngxbiziYtC0MU7LrLd8Un3dnjNA2VNUkXeLUZ47HisWoUfT8CSdclYgsdaof4fnuQ+3Hw8QCTEh
	/FierRqNxjW49AtXMKB4V9/9Cb8FueUKCSGtvHM2s9iWtXbm+SKLaDqeUzjzyA3RGwzPB8MBEyXJg
	ioxLHMRqyqf9u+3hmi3TDGETVNjpjrq7LIO7daZ5ntef23Zq476H8k8WcDtDsm4b5OvHIbutK6cDx
	TgnDTfCn4EQ2wUBbTZf1HLudAcw+XpjK3hC8bi6WOBzkVRY6wMbIz9SMG/VxEXPpt85cLnk+ok8pW
	DJ59tztKoPoZuNgvCnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuAt-00F96X-04;
	Mon, 25 Sep 2023 22:35:31 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuAq-00F95q-0U
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:35:29 +0000
X-QQ-mid: bizesmtp69t1695681314trhnno76
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:35:13 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: 5q30pvLz2ifym5SLIzsh144Znm6wRlu+bPV0w9peTQtfsIPVYY0hXdp41PdCD
	qNzUX3VU0ZbZvFxqzdl781ox5Wff3pzWuKKNI6Te1Y8Odq1dErSA2qLbFA/SMI2cKUrzOVs
	JqSkwphfZ1OdgeG+SXhsqzaC3EdPtZ01WiX3xWijTjjHsIaAgg69GAJkp+9VvBK+LXtqy1j
	nrLN7pG00O3beVVn6nNJXOacEGL+QVJsdzrevmusz0g8QdKt9Gmkrc6JmfWCThmyuCXGiVh
	gjxq5yWAioV+s2WgKuEpfsGOozhlcqRN+oC8EBu5Z9jN5LH+6xf8e1VBtfxSu4YLC8kyaQi
	XdE5S4RGw+7MohBQiYCuUk9wCwPZJByKg1RLiR97lDnE03vxkhVdJMeJFQ4NQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1656431424344420643
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: falcon@tinylab.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v1 1/7] DCE: add debug support
Date: Tue, 26 Sep 2023 06:35:11 +0800
Message-Id: <36d7ee5122e3a9c2b307cf6ab1a9508860fd7710.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_153528_521702_E5869623 
X-CRM114-Status: UNSURE (   7.15  )
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

Enable --print-gc-sections for --gc-sections to monitor which sections
are really eliminated.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 Makefile     | 3 +++
 init/Kconfig | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 57698d048e2c..a4e522b747cb 100644
--- a/Makefile
+++ b/Makefile
@@ -938,6 +938,9 @@ ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
 KBUILD_RUSTFLAGS_KERNEL += -Zfunction-sections=y
 LDFLAGS_vmlinux += --gc-sections
+ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION_DEBUG
+LDFLAGS_vmlinux += --print-gc-sections
+endif
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/init/Kconfig b/init/Kconfig
index 6d35728b94b2..4350d8ba7db4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1404,6 +1404,13 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	  present. This option is not well tested yet, so use at your
 	  own risk.
 
+config LD_DEAD_CODE_DATA_ELIMINATION_DEBUG
+	bool "Debug dead code and data elimination (EXPERIMENTAL)"
+	depends on LD_DEAD_CODE_DATA_ELIMINATION
+	default n
+	help
+	  Enable --print-gc-sections for --gc-sections
+
 config LD_ORPHAN_WARN
 	def_bool y
 	depends on ARCH_WANT_LD_ORPHAN_WARN
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
