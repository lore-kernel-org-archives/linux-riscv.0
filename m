Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CACCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD5q306v+0YtzVf8J8Srqk6h5fc1ZjDkrrsdmd837zo=; b=lNoRUih9AbvZZM
	Pr0e37VNtu1gQNKEn3wzFBEdwPwaPeqDNvytBxV/LFmodMDqLW5sNIlDR8+dN11xJWeHrMYr+Pq3R
	YUNWmjk3eodtbZ2O4C2cS82vAUsZG9JTPnqLMcM4nVqmEzFmJCKVEjvjJRMoR60cBKsEHIkKBfOpO
	aZ+56/YFM10BuMguQ1TJhGq7BHUXGUhmg3325uSZ91Q9VIumcF7KfPvmvAnRycPr1c+gHIb8YLbXb
	uYQBnMHtmkUKLKsgEIyN6K58B4f1lnMNC5ev1l00Fo8FDTpPv6EpgaZIF2OTipu/LbkTI8nyOsEQi
	n22wjF7pFef12EQr3LKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphv6-00000004BZa-3XYD;
	Sat, 23 Aug 2025 06:40:08 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0b-00000003CVy-3aXC
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TXncvORCD2AdZAD+v4rtFl/E1j8jVcnEbUa0OYdZ9jg=; b=ihFI99obgptCOosM3dKhtpAceb
	45B/kUbAA8uHfTLhMFndhQh32DzO6fsQhU7fsc9t0T6tLgv9Brv8nYdpgCfaR5oQkc2Sasjjcs589
	I3htIeNdIrwC62njEAAKzKxw9hx7//9VZSUcdHPhKU+oXPESMEKSacWpdddE2ohnGZeoiWsJi2O1S
	ECaKI4ag6YEFsHzRgkCUJA4x8w6Oiv71JNCgiH28OLlYioBETOxhuLXqwVpLjbheK62+at4zdOI95
	GPU32bHknBaaWY2p32R7yFuYz8Vr8LmFbhlLq9ZZvs1ORYLTtx77suZWXRcAe6gBe8FKts7cPU73L
	r35qrNZA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGo-9H; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DOw-1nR7;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 01/18] riscv: add initial kconfig and build flags for big-endian
Date: Fri, 22 Aug 2025 17:52:31 +0100
Message-Id: <20250822165248.289802-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095257_974867_070A82F9 
X-CRM114-Status: GOOD (  11.79  )
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

Add initial kconfig and makefile updates to get a base big-endian
build for arch/riscv. Will require header updates for IO code and
features whcih are known to not work.

Make this depend on CONFIG_EXPERIMENTAL for now as there are bits
that have not been fully fixed to work big-endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/Kconfig  | 22 ++++++++++++++++++++++
 arch/riscv/Makefile | 15 ++++++++++++---
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..f1c0a655cd47 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -436,6 +436,28 @@ choice
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
index df57654a615e..ec3096fd9075 100644
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
