Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6754E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FH4x4KREMM2ALqWrqXCpj1s/KitgCRbVyFoOjwakHAY=; b=j7kiseenjNkm/W
	QUqwlkORHL8t2C7OXCyWKSZtEMD+2ouvqhsJqI5CFsUNoG2l8MxLCXbaz0RSOPzLhipf4HocatOZ2
	N9bK15XlBBc1P6sNZ+On3i9UAkdt85ls8BkxqXFzNGtml8byBf950f2Yd7onedczKw3ziYVhkHGEE
	ZfsuDel8+6rnwF42JSGVMGCej9/U25icdoOqzjxNeieVzRp3KVsA8MTu0y3Ee/PYIxvMFUPXvoi+S
	do658DurcqbyGsCRv2sW85mRakYlOSjuRzwmTspQO1Bnvxc6udwseodiZrWxhQiFN9EZgRPLRJFFN
	U7ShUKHu8tdGBMnW3L8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOP-00000005Nzy-0pgj;
	Fri, 20 Dec 2024 15:58:21 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005NqW-2hYk
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ruKKFBAzXsfOYIveTHx5A2fel7bTCFu3W2rswFq5xAA=; b=QXEF8Io239Nqj/eRSFfP73K4s+
	bmWH1MlljygJdi/TPCYl/Bl5wvoxK30ozisqb1wh3Jzlyb07m0QqnTHM5MMHg8B1hC12C7F3qQJpw
	lWA9+bel7kRoxmaiLDBJr4YZDaBip+XU0LI87/61zxvQmA6cokkzBzU5rIoJoCRhpBOh+dj8D+fc3
	s8HfHp5wyswNikD133r4gOaJI6WhjsJW5kB6lftTeuB30FajO0iyU66hTPfpQlYi4wqRxpI7TJxRI
	TzwkQ7UmQfIhgHvmxfebTMr9/C85K9T3SuBsJDj7sQhn0y+4PeUQp0WMicakqI30mS7h05D5gbd1p
	f1TNsMJQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfO9-00ADAH-Re; Fri, 20 Dec 2024 15:58:05 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSY-2fyV;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 01/15] riscv: add initial kconfig and build flags for big-endian
Date: Fri, 20 Dec 2024 15:57:47 +0000
Message-Id: <20241220155801.1988785-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_683375_8D30DBFA 
X-CRM114-Status: GOOD (  10.34  )
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

this is the initial kconfig and makefile updates to get a base
big-endian build for arch/riscv. Will require header updates
for IO code and features whcih are known to not work.
---
 arch/riscv/Kconfig  | 22 ++++++++++++++++++++++
 arch/riscv/Makefile | 15 ++++++++++++---
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa8f2da87a0a..e352e022ed4a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -426,6 +426,28 @@ choice
 		bool "medium any code model"
 endchoice
 
+choice
+	prompt "Data endian"
+	default CPU_LITTLE_ENDIAN
+	help
+	  Configure the endiannes of data access performed by the CPU.
+	  This will require system to be booted from M mode in big endian
+	  and the userland to be compiled for the same endian-ness.
+
+config CPU_BIG_ENDIAN
+	bool "Build big-endian kernel"
+	depends on EXPERT
+	help
+	  Say Y if you want to run big-endian kernel and userspace
+	  Set for expert as this experimental
+
+config CPU_LITTLE_ENDIAN
+       bool "Build little-endian kernel (default)"
+       help
+	  Say  Y if you want to run little-endian kernel and userspace
+	  This is the default for most distributions
+endchoice
+
 config MODULE_SECTIONS
 	bool
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d469db9f46f4..535cbbb76f5c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -21,6 +21,11 @@ else
 endif
 endif
 
+ifeq ($(CONFIG_CPU_BIG_ENDIAN),y)
+KBUILD_CPPFLAGS	+= -mbig-endian -D__RISCVEB__
+CHECKFLAGS	+= -D__RISCVEB__
+endif
+
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
 KBUILD_CFLAGS_MODULE += -mcmodel=medany
 endif
@@ -28,13 +33,17 @@ endif
 export BITS
 ifeq ($(CONFIG_ARCH_RV64I),y)
 	BITS := 64
-	UTS_MACHINE := riscv64
+	ifeq ($(CONFIG_CPU_BIG_ENDIAN),y)
+		UTS_MACHINE := riscv64_be
+		KBUILD_LDFLAGS += -melf64briscv
+	else	
+		UTS_MACHINE := riscv64
+		KBUILD_LDFLAGS += -melf64lriscv
+	endif
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
 
-	KBUILD_LDFLAGS += -melf64lriscv
-
 	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64 --target=riscv64imac-unknown-none-elf \
 			    -Cno-redzone
 else
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
