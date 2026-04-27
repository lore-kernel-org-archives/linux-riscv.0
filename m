Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9ACFF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcMJLeKxGjcnDf+9zveAhHSM5UCiNf2RHCzLCzZoCw4=; b=kQzk13aPg3v3xd
	oBithKLimN4BK2aaRhnLbQn2d1tbSZxf/6qr3c1clYAgyj+6mHLsWFM2ieX09H8CZM236NV66cgrP
	txYBdoUm9c8HElVlpHEb5BK0HbYmbAtJez+JTO46KLbIIp6EDmbz+Btvi3YZqFpZHawSHDb5H9q2V
	o4npV5zgRfKbnHloAAuplECiiPvdLHvn6EJHicFJu/xLed/54Vbh/iZyh5eLsAAFT9ZMV+0p1Ny+k
	//4uDB0tvVAJwIrbgBiTRyYaEoL4TRKVvjG5mmapK0rjodm7ih2BBjIoQh3NGaAYqPEk24KRb7gx4
	tp8JoXytLyThLlQqtOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHqi-0000000GWpA-0Slf;
	Mon, 27 Apr 2026 09:01:52 +0000
Received: from forward100d.mail.yandex.net ([178.154.239.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHqZ-0000000GWmP-2JhQ
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 09:01:48 +0000
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 6118DC0081;
	Mon, 27 Apr 2026 12:01:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp) with ESMTPSA id X1UMu7lR5a60-Xb9gGYSr;
	Mon, 27 Apr 2026 12:01:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1777280499; bh=Ff9SdFCbk25ZtmQGhp1frc27zJiUuk0lebZaoptedLo=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=UKkGAP0fCWCVBGHrvOWdDvj4Yjc1QQ9vPO+PzzayQEI4EuTz8WfZbAp4U0hZlycHt
	 xTmfrZCxlJcpus3bZ+CKkSmiznOZ4N2c5GJby7nZS42WD3dnO+4c73y2I9oRE/ZPF8
	 R0qLFHbjZ71gB644M+cWVNJsQJc/8A9PuufW+jQw=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v7 3/3] riscv: fix building compressed EFI image
Date: Mon, 27 Apr 2026 12:01:05 +0300
Message-ID: <20260427090105.705529-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427090105.705529-1-dmantipov@yandex.ru>
References: <20260427090105.705529-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_020143_777379_66B6FD20 
X-CRM114-Status: UNSURE (   9.27  )
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

When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
'__lshrdi3()' is also needed to fix yet another link error:

riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
__efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'

And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need
these library routines, rely on CONFIG_32BIT to manage linking
of lib-ashldi3.o and lib-lshrdi3.o on riscv32 only.

Reported-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Closes: https://lore.kernel.org/linux-riscv/20260409050018.GA371560@inky.localdomain
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Assisted-by: gemini/gemini-3.1-pro-preview sashiko
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v7: use lib-clz_ctz.o exactly once (Sashiko)
v6: adjust to match recent upstream changes
v5: rely on CONFIG_32BIT rather than dedicated Kconfig symbol (Ard)
v4: use more meaningful CONFIG_EFI_ZBOOT_USE_LIBGCC and adjust tags (Andy)
v3: initial version to join the series
---
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 983a438e35f3..7fc654e99305 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -95,7 +95,8 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o lib-ashldi3.o
+zboot-riscv-obj-$(CONFIG_32BIT)	+= lib-ashldi3.o lib-lshrdi3.o
+zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
 zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o lib-ashldi3.o
 lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
