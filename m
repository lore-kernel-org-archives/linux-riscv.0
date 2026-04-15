Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9717CF41998
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uF6MG7JajYXqUQn9HSgZZowSNrDK+TbNl76oYpbcrIw=; b=dBb9wwtwCqQwE9
	znFtcHVjtmHVsUB+dvimwjICQA6+lkxOzy6o8LqabOgdmOJF0UFD3nTpkZLGc6JB5ekPAK/Mhn9ys
	Y5simXB4tBaH3oovtdW+Ba4+batZ7c/bpZg+Bq/PpFe5oPhUmhKyt7A1153NKmCNm6ShTofr+gbz3
	bDFHB6MmSvY3LKexWq+qn/qQKxQAT0QjkTRTPlSvTXQ6GuHqgarkxsUkET1GO4ka570lAfP57yufZ
	tnveIkmoV38dwXqKYFKxUqbtUzyT6jmt/bDYOTG2dNtALiITOInsEgzugoEfBkbqOnFHa6OyJvSQM
	Gvp7h12dxlCWOZQXDNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzQD-000000017a5-11nt;
	Wed, 15 Apr 2026 12:32:45 +0000
Received: from forward103b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzQ8-000000017YJ-3u1X
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 12:32:43 +0000
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1c:2e1d:0:640:64e7:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id 75E22C005E;
	Wed, 15 Apr 2026 15:32:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id QWLFfkFSpa60-fWxjpLOM;
	Wed, 15 Apr 2026 15:32:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776256351; bh=2Fm4UadpJUMXgEsrz1RnV1p+C7tVZ8VV5N1M0lx5SDg=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=PH/nlyWgvMn2baLyP5Cl1EjIMJwip6gegFkrRvvKa+374sx0ghwoyAWWPxl+h+8Ia
	 +QAGrS4sAySiZobZy1gNlg9+Fs9ANP61stabyN/x+HhzwyJTMmBtE2+Uzzq8tDpSFb
	 +2D1FlYCeKt4BfdEnKNdqHdsanBdzkazoAMeL2ms=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v5 3/3] riscv: fix building compressed EFI image
Date: Wed, 15 Apr 2026 15:32:04 +0300
Message-ID: <20260415123204.1467909-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415123204.1467909-1-dmantipov@yandex.ru>
References: <20260415123204.1467909-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_053241_160621_54DBC7A0 
X-CRM114-Status: UNSURE (   9.13  )
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
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v5: rely on CONFIG_32BIT rather than dedicated Kconfig symbol (Ard)
v4: use more meaningful CONFIG_EFI_ZBOOT_USE_LIBGCC and adjust tags (Andy)
v3: initial version to join the series
---
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index fbb8d4e33256..a19e0bd97d69 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -95,7 +95,8 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o lib-ashldi3.o
+zboot-riscv-obj-$(CONFIG_32BIT)	+= lib-ashldi3.o lib-lshrdi3.o
+zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
 lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
