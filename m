Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D6EC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BHDJGBOpoSlSb4qBvDrODCivg/NbfSrhZnZjaDYmlg=; b=vIPX8xtDbn0/a/
	nWECHKbgAitAhbQhvj/khd1g7X+RCdsdRUu0SjjtrxeDlZMlNng0ihAnXbauf0ODaf3hqdUl+W6fG
	/brX1940o82BVE3yo4qSCwg0tR9xoDDtaH+jV0kZuFVVCcdSZd0+WnxfIngJlagLCh+lZUY7VbyXm
	RGeoG3/onFNsVr5lWJ4zBMTGw/ibYd+QGxS7LEY2c9khQmJ40qyZcLW8p877+sYSMWpXoSiVPw85f
	IilzWYlp+SsAbHg4ez7/7RFM1ZPFg9Om7+gTq4P+Imx6LauV7pZn8B0cBBGYw2fJf8EtbZNvdqse7
	zJTUIxtlhXEUL8v0QlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxK-00CFfP-Hs; Fri, 17 Feb 2023 00:50:30 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxH-00CFbu-Mi
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 00:50:29 +0000
X-QQ-mid: bizesmtp76t1676594974t44ilj1c
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Feb 2023 08:49:31 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
X-QQ-FEAT: znfcQSa1hKbHsodWWJ7dLyJeU0dQLSJ2PPtzz1iLzMNgSELCkUn2ujNlhycbg
	vLg03SNvb9EFMysNu9WjgjH2yYBaAi1fGVqPKaFhctNfTwt+bbxYpXQIVh9rDo/8cNrLyPt
	ToX08gVh/Po6w/uiFpE5NpG8RVgjCEHPEAjNBEvKB228hcFV2zJd7lPvufzHTfmfzprQ+fT
	BT5FvJHdZIQ0ZHz+hIneTfMRDTSLb6HDEunI+ke40/IGoYkdjw1kyDvwLpdYHmyCpkkWnqA
	O1Hes08eR/3n/SlY9lwkeFrEDn7M4DXKn75YILTWaoiJycDGTzD8fi1d+13MWbJyxm4+S3n
	g5P3PHo4ATnp0TD9593FPSzON//EjXHb6RjyzNWaKJfKxUqmS92Hopcemr0iQ8IBGReu7VW
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Willy Tarreau <w@1wt.eu>,
	Paul Burton <paulburton@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 1/5] syscall: Allow configure used system calls
Date: Fri, 17 Feb 2023 08:49:21 +0800
Message-Id: <ad53ec9ec7168b6ca5a55e4c6b4583baa4dd0fc6.1676594211.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676594211.git.falcon@tinylab.org>
References: <cover.1676594211.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_165027_974525_93F87C0A 
X-CRM114-Status: GOOD (  10.75  )
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

A new CONFIG_SYSCALLS_USED is added to configure the system calls used
in a target system (especially for the ultra small embedded systems),
the other system calls will be disabled.

If further enabling CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION, the other
ones (if also not used by kernel itself) will be removed automatically.

The used system calls should be listed one by one like this:

    write exit reboot

The architecture should implement it and then select the
HAVE_SYSCALLS_USED option.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 44e90b28a30f..2c4b8b234168 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1502,6 +1502,10 @@ config BPF
 	bool
 	select CRYPTO_LIB_SHA1
 
+config HAVE_SYSCALLS_USED
+	bool
+	default n
+
 menuconfig EXPERT
 	bool "Configure standard kernel features (expert users)"
 	# Unhide debug options, to make the on-by-default options visible
@@ -1728,6 +1732,24 @@ config MEMBARRIER
 
 	  If unsure, say Y.
 
+config SYSCALLS_USED
+	string "Configure used syscalls (EXPERIMENTAL)"  if EXPERT
+	depends on HAVE_SYSCALLS_USED
+	default ""
+	help
+          This option allows to configure the system calls used in a target
+          system, the other system calls will be disabled.
+
+          If further enabling CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION, the
+          other ones (if also not used by kernel itself) will be removed
+          automatically.
+
+          The used system calls should be listed one by one like this:
+
+              write exit reboot
+
+          If unsure, keep this empty.
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
