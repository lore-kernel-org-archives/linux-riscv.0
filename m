Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723DEBFD21
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIFqcFMj7Uu6Nsl9eKMw/Ym7LuRMDoNtHhlzOxHhE1s=; b=xELVWtSt+/KE3F
	UtpCMA07IiRBbJt41M2js/v6qCtZU8C3HXob4XMjM1t2EJkwiaXYqNEHdM7wnvIqyZrygciiLkyd8
	kcNOhMLB38agYsXpeB88yTdfNXsL5FunWvx85xjWrtIi/P/QeDE5m9BV5umFMfgp7VFrnc+WK33Dz
	2y/ra+0hQEJF3gNXOt0tbPUe/pqmZ6zfFLKVP89iKwtTk0CZ+a+59LsAc5I/eqbDgMSU4Z56DyFho
	8TJNDYXNMix9BK4Oxrq/D5lLF6X/VxwzOYskL/mq4/mFCRcn2P2IpJgSFpCIpn04zzeO25Qps7aoZ
	OzdYUz+uvd6MTeBHYEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDUz-0000000FMCu-0Vph;
	Mon, 13 Apr 2026 09:22:29 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDUs-0000000FM9K-1DRg
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 09:22:25 +0000
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:2409:0:640:85e8:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id CE528C007C;
	Mon, 13 Apr 2026 12:22:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BMGbUY0QrqM0-gAjYUuKm;
	Mon, 13 Apr 2026 12:22:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776072137; bh=voMqeQVH9FqU6nEefapBn9esCXQr+JucD1jehyO2FL0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=okjIe9AzjK33lJekYuNY+zuXRUGE0QaPIi+O8NniuZn2gsBn6oFE+OSssJVZPF2De
	 UkQyjk28rVhh2khU8mnjIwkWdvc8Jf68Rue0FEQ7MR8qU9Vr+pB+MUYrVSl0yRsBAG
	 PLH+vWzjfaVuy3x7GlXU2UAsY9Whhipdf1hDoXIg=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v3 3/3] riscv: fix building compressed EFI image
Date: Mon, 13 Apr 2026 12:22:02 +0300
Message-ID: <20260413092202.174394-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413092202.174394-1-dmantipov@yandex.ru>
References: <20260413092202.174394-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_022222_525908_F544F08C 
X-CRM114-Status: GOOD (  11.05  )
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

When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
'__lshrdi3()' is also needed to fix yet another link error:

riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
__efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'

And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need
these library routines, introduce CONFIG_EFI_ZBOOT_EXTRAS to
manage linking of lib-ashldi3.o lib-lshrdi3.o on riscv32 only.

Reviewed-and-tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: initial version to join the series
---
 drivers/firmware/efi/Kconfig          | 4 ++++
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 29e0729299f5..55fb5a20aa25 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -85,6 +85,10 @@ config EFI_ZBOOT
 	  provided that the loader implements the decompression algorithm.
 	  (The compression algorithm used is described in the zboot header)
 
+config EFI_ZBOOT_EXTRAS
+	bool
+	default y if RISCV && 32BIT
+
 config EFI_ARMSTUB_DTB_LOADER
 	bool "Enable the DTB loader"
 	depends on EFI_GENERIC_STUB && !RISCV && !LOONGARCH
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index e386ffd009b7..8f199b99d0f6 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -96,7 +96,8 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o lib-ashldi3.o
+zboot-obj-extras-$(CONFIG_EFI_ZBOOT_EXTRAS) += lib-ashldi3.o lib-lshrdi3.o
+zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-obj-extras-y)
 lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
