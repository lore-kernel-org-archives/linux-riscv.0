Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F8606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzrNJ5+U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=St3o9qMW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fLDOJ0kZ5GEIvxxftMYF2tGwGzxD49u1ccUfP607Jyc=; b=gzrNJ5+UWEmIdtTN8Nu1kyC44H
	qaFrNiSap97ACpcOtHat6VZfPP8XwRQcmN6OY2MlArMA8jkjsNDmyziUBJqdfhQUTiOekKUSl/wvd
	1fxB3TsUigrQG88YbbkeK7P1RZ+xQCiZSuSqFsPGOuAFd3PGA1czB1o6qlF/d8gBWks137BAHqZlk
	o0i16ZShu15Q/l43dMiMVq4oqEraHjAdSlIjvJ0O+iBNqktGBdKvZw6SwsxCUnwI0sq/XzG2LGUcJ
	UfOMreS82+0e1Ovh38DSXbobhpIJVAj1JL9BsIWnuk75FVJgdJwDcb33n91yhqbZ09vo8VWnY3+w4
	sedjTdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWVx-0000000Ciuf-05EZ;
	Thu, 26 Nov 2026 10:15:41 +0000
Received: from forward104e.mail.yandex.net ([2a02:6b8:c32:0:1:45:d181:d104])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWVt-0000000CiuH-3LZb
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 10:15:40 +0000
Received: from mail-nwsmtp-smtp-production-main-65 (mail-nwsmtp-smtp-production-main-65.yp-c.yandex.net)
	by forward104e.mail.yandex.net (postfix) with ESMTPS id 31936C04DE;
	Thu, 26 Nov 2026 13:15:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-65 with ESMTPSA id LFfZVbOZPKo0-3Nht8b5V;
	Thu, 26 Nov 2026 13:15:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795688128; bh=6VTmwgM3jPKMLJbdQSkA0PURopOAUivqXzDuEiYHuBc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=St3o9qMW7b6FGt3QVXZ+sR5crQHhMxjWWD8KpmP+YUgHArLoHAOSj8atGzyDYbGHK
	 DXlV9v7nq/Wd+BTGJ4AhuYJ+N2CU2kLvLX8+X5l6CpMcIkzwKI1c9TKqLHHxGG0SAc
	 igH0K59CQHb9qPK71TzLgvw8jAFFAe4z3FLlUVT8=
Authentication-Results: mail-nwsmtp-smtp-production-main-65; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] efi/libstub: fix building loongarch32 without zboot enabled
Date: Thu, 26 Nov 2026 13:14:52 +0300
Message-ID: <20261126101452.590895-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_021538_372036_52863B4C 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Kernel test robot has reported the following error observed on loongarch:

loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
__efistub_cmdline.c:(.init.text+0x258): undefined reference to `__efistub___ashldi3'
loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x268): undefined reference to `__efistub___lshrdi3'

Since this happens with CONFIG_EFI_GENERIC_STUB enabled but
CONFIG_EFI_ZBOOT disabled, tweak loongarch32 build to hook
extra library objects on the former rather than latter. And
this quirk seems no longer neeeded on riscv32 because it has
architecture-specific implementations of ashldi3() and lsrdi3()
which are aliased to corresponding EFI stubs via
arch/riscv/kernel/image-vars.h.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/firmware/efi/libstub/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..77f0d3047b95 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -97,11 +97,11 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
-lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
+extra-loongarch-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
+extra-obj-$(CONFIG_LOONGARCH)	+= $(extra-loongarch-obj-y)
+lib-$(CONFIG_EFI_GENERIC_STUB)	+= $(extra-obj-y)
+
+lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
