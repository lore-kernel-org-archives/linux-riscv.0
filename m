Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EE4E6FE31
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNsa/86afP87iHvrven4IvAt5j48z2qj/v6a1W04ac4=; b=Dzkz+jIo/G/Y3g
	y0ZuMwfJ3sn0q0x126l3YdqYG2nFfeZxGS5HFURSzW0het7qPS+j+7nalyafgeLEDhveiwXEE3IVn
	Xwct1DKxiEZTyimAq58RXLw5rVIkCZhKPNAyQYwPFZnD/+EqqXPY0O9Sv9hlQ8Srl6MtRK7MhhDGZ
	WqZdMa/YcwzZo7hdxoq0vmIV4s1OcwNXw8LewjajWZYSQAbYZfLePBOo5ZAROcRe7Pe/4BZVo9sHQ
	bDmxs8b7DtXhZWZAiM/Gvt5OYxuYanJ6WVEdeOIr+Nsj6GdagfF6oOZCzVX6fd+dTfTsqxi3N2Vfg
	CsPu4yrjxK5LShupF6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuC7-00F9Fc-1x;
	Mon, 25 Sep 2023 22:36:47 +0000
Received: from bg2.exmail.qq.com ([114.132.224.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuC4-00F9Eb-0M
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:36:45 +0000
X-QQ-mid: bizesmtp66t1695681384tmochcm2
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:36:22 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: TVZM0Uoyj00JUk8OvUcLIPa/EY8r7PpEQ1C4lcN0OuATw0N34N96kW+oYTtBN
	Jaai4dDH6wtD7ZkDRGpxrDXJs8kGC6i0K1xINYbt7WEradLvwu7MjA6BcfUnB7FQ28vLUNE
	oQHy3mNLduqnMVzzsi6WBKxgK0AAM3INML+mLcNbhvWg2TzhqPZTKPUYjS11nZRjvZcUiuD
	NRW/R54I/WUXENzteFZ23F0t6lmXK5Gg+8WdV//S+i7xLiuIrZryziyd/4peU2qgsix+rev
	4q/4iJniLeeMCnq1PbhyWM3hk3jVoJGyF2rmv3i3bq3HesUqB4dLD5mRubDvLJZ1TV80lce
	ETiR3coFd9RGXByeptpmtL7fTDNYSIbW6nDutyAuvYsEvMnBnNwa0HvNQHDPey2/Yz4tq+W
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16786486805464770233
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
Subject: [PATCH v1 2/7] DCE/DSE: add unused syscalls elimination configure support
Date: Tue, 26 Sep 2023 06:36:21 +0800
Message-Id: <3f0eaf5fcb19f1c70cab075a97f067846f36f736.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_153644_488837_4E907509 
X-CRM114-Status: GOOD (  11.64  )
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

A minimal embedded Linux system may only has a very few of functions and
only uses a minimal subset of the posix syscalls, the unused syscalls
will never be used and eventually in a dead status, that also means disk
storage and memory footprint waste.

Based on dead code elimination support, it is able to further eliminate
the above dead or unused syscalls.

Firstly, both a new common CONFIG_TRIM_UNUSED_SYSCALLS option and a new
architecture specific HAVE_TRIM_UNUSED_SYSCALLS are added to enable or
disable such feature.

Secondly, a new CONFIG_USED_SYSCALLS option is added to allow configure
the syscalls used in a target system. CONFIG_USED_SYSCALLS can be a list
of the used syscalls or a file to store such a list.

Based on the above options, it is able to only reserve the used syscalls
and let CONFIG_LD_DEAD_CODE_DATA_ELIMINATION trim the unused ones for us
automatically.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 4350d8ba7db4..aa648ce8bca1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1457,6 +1457,11 @@ config BPF
 	bool
 	select CRYPTO_LIB_SHA1
 
+config HAVE_TRIM_UNUSED_SYSCALLS
+	bool
+	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	default n
+
 menuconfig EXPERT
 	bool "Configure standard kernel features (expert users)"
 	# Unhide debug options, to make the on-by-default options visible
@@ -1683,6 +1688,43 @@ config MEMBARRIER
 
 	  If unsure, say Y.
 
+config TRIM_UNUSED_SYSCALLS
+	bool "Trim unused syscalls (EXPERIMENTAL)" if EXPERT
+	default n
+	depends on HAVE_TRIM_UNUSED_SYSCALLS
+	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	select LD_DEAD_CODE_DATA_ELIMINATION
+	help
+	  Say Y here to trim all of the unused syscalls for a target system.
+
+	  Note, this is only for minimal embedded systems, please don't use it
+	  for generic Linux distributions.
+
+	  If unsure, say N.
+
+config USED_SYSCALLS
+	string "Configure used syscalls (EXPERIMENTAL)" if EXPERT
+	depends on TRIM_UNUSED_SYSCALLS
+	default ""
+	help
+	  This option allows to configure the syscalls used in a target system,
+	  the unused ones will be disabled and trimmed by TRIM_UNUSED_SYSCALLS.
+
+	  The used syscalls should be listed one by one like this:
+
+	      write exit reboot
+
+	  Or put them into a file specified by this option, one syscall per
+	  line is recommended for such a config file:
+
+	      write
+	      exit
+	      reboot
+
+	  Note, If keep this empty, all of the syscalls will be trimmed.
+
+	  If unsure, please disable TRIM_UNUSED_SYSCALLS.
+
 config KALLSYMS
 	bool "Load all symbols for debugging/ksymoops" if EXPERT
 	default y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
