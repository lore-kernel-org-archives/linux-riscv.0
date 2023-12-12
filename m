Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5CAC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3NC8FR4uW8M4HqWc7RV4+oDT0wL2l4TzjiYAYcxqg0=; b=KU7EiWZwSi5l5H
	y9TqPG0MH3tdPkz1vHjg/a5k8hik2TWWTnGVijVpATAwf7JLlV1o47kH1utvnQRPGvNI7Hw+0Q4/W
	IZkAYvnnd3GIiFqII346aAZckT33gBGpxhC+No2VBHvW0XJ+pWSHGzHvT7zthf/BlCp6yA3RMP5LA
	v0rIAf8qbvrWEFmbLR+QjiuUsev/HasUTdz4ve7cM1bNbwtnCOAvXEbuxJZbHvHh31w/XqySD+AaX
	nRYutMyNm+Lj6QN5W7ROpupaBMEiN0JQWezOyCurK2J2WhiZWCfpsqSMdrQBuTYIw2io1Y1znKac7
	Xyx0KnDGtaLpIPMXXjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2P7-00BkLd-2R;
	Tue, 12 Dec 2023 13:02:29 +0000
Received: from fzi-msx-e-01.fzi.de ([141.21.8.251])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2P2-00BkHq-2T
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 13:02:26 +0000
From: Frederik Haxel <haxel@fzi.de>
To: 
CC: Vitaly Wool <vitaly.wool@konsulko.com>, Frederik Haxel <haxel@fzi.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko@sntech.de>, Greentime Hu <greentime.hu@sifive.com>, Conor Dooley
	<conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Sami Tolvanen
	<samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, Nam Cao
	<namcaov@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Baoquan He
	<bhe@redhat.com>, Andrew Jones <ajones@ventanamicro.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] riscv: Allow disabling of BUILTIN_DTB for XIP
Date: Tue, 12 Dec 2023 14:01:14 +0100
Message-ID: <20231212130116.848530-4-haxel@fzi.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212130116.848530-1-haxel@fzi.de>
References: <20231212130116.848530-1-haxel@fzi.de>
MIME-Version: 1.0
X-Originating-IP: [141.21.46.139]
X-ClientProxiedBy: fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45) To
 fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_050224_805377_1CC33150 
X-CRM114-Status: UNSURE (   9.45  )
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

This enables, among other things, testing with the QEMU virt machine.

To build an XIP kernel for the QEMU virt machine, configure the
the kernel as desired and apply the following configuration
```
CONFIG_NONPORTABLE=y
CONFIG_XIP_KERNEL=y
CONFIG_XIP_PHYS_ADDR=0x20000000
CONFIG_PHYS_RAM_BASE=0x80200000
CONFIG_BUILTIN_DTB=n
```

Since the QEMU virt flash memory expects a 32 MB file, the built image
must be padded. For example, with
`truncate -s 32M arch/riscv/boot/xipImage`

The kernel can be started using the following command in QEMU (v8+)
```
qemu-system-riscv64 -M virt,pflash0=pflash0 \
 -blockdev node-name=pflash0,driver=file,read-only=on,\
filename=arch/riscv/boot/xipImage <optional parameters>
```

Signed-off-by: Frederik Haxel <haxel@fzi.de>
---
 arch/riscv/Kconfig       | 6 +++---
 arch/riscv/kernel/head.S | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..72bc31b6eeb9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -904,13 +904,13 @@ config RISCV_ISA_FALLBACK
 	  on the replacement properties, "riscv,isa-base" and
 	  "riscv,isa-extensions".
 
-endmenu # "Boot options"
-
 config BUILTIN_DTB
-	bool
+	bool "Built-in device tree"
 	depends on OF && NONPORTABLE
 	default y if XIP_KERNEL
 
+endmenu # "Boot options"
+
 config PORTABLE
 	bool
 	default !NONPORTABLE
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index a2e2f0dd3899..a8939558702c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -266,10 +266,12 @@ SYM_CODE_START(_start_kernel)
 	la sp, _end + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 	mv s0, a0
+	mv s1, a1
 	call __copy_data
 
-	/* Restore a0 copy */
+	/* Restore a0 & a1 copy */
 	mv a0, s0
+	mv a1, s1
 #endif
 
 #ifndef CONFIG_XIP_KERNEL
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
