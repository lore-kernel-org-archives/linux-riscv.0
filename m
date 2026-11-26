Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3B606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VOx+G3me;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=CH6+PKjZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ANKUK2GIedxtjtS9FCu47X6ausO6XuEpQYK9fcFHIq0=; b=VOx+G3mec4ko3RpDXNkWx3mYgM
	X4USftNZU9EFPiu3FLhdNmno6FYTqFN60rPLGxR1Vv8QPIuFsHaT+ie3hn2A7bOO4ZhQXbskk8Er1
	Ovd2fIGKmunE/0OefLLZl/HvAI09sZ37wixkamaNM7lunPESJsN6/75Ey5l8Wu6VPTa/qevWS1Hg8
	bmdDWfOhirw4PvRX6DY3UKmbTa/PwAjgQGxU+dgIMihbpp60UC6WE6RrNZVXztJo6q3NoOZtzwqtY
	V1cEyDi3W2gTGDGj5D+lcCKBCM8np5i0zAhZsm9PBi3SYIm6HGteP6LHjY4N4wAyDNGuejSSun0Df
	BJHqmknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnl-0000000DC46-21bn;
	Thu, 26 Nov 2026 12:42:13 +0000
Received: from forward102d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnW-0000000DBoC-2eZh
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 12:42:12 +0000
Received: from mail-nwsmtp-smtp-production-main-58 (mail-nwsmtp-smtp-production-main-58.yp-c.yandex.net)
	by forward102d.mail.yandex.net (postfix) with ESMTPS id F05BCC03AD;
	Thu, 26 Nov 2026 15:41:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58 with ESMTPSA id lfhVEFQXeCg0-BoDN5UTt;
	Thu, 26 Nov 2026 15:41:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795696912; bh=JneyGuy1qh+xtE++6pF4sbi6Wsm8hasIC9ikeIhpHCU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=CH6+PKjZQzevZN+sT1po4LCM4WeGWy9GVETvf1uN1vvwewh+sfrRF5ehqeITcaM8A
	 i+bQzHZjiIBf44Hebnr43VoiX3iQOE8+p45UGouX6JGhJRNDz43SWbLs2iaFl7QqyE
	 NMZSUr4ZQPNZc+JkS42EmYB+jxb6X08RBWOmrMRw=
Authentication-Results: mail-nwsmtp-smtp-production-main-58; dkim=pass header.i=@yandex.ru
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
Subject: [PATCH v2] efi/libstub: fix building loongarch32 without zboot enabled
Date: Thu, 26 Nov 2026 15:41:45 +0300
Message-ID: <20261126124145.876953-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_044159_191806_59973F23 
X-CRM114-Status: UNSURE (   9.09  )
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

Following the approach introduced in commit a354b8de9ad6
("riscv: add platform-specific double word shifts for riscv32"),
define EFI stub aliases for __ashldi3() and __lshrdi3() for
loongarch32 as well, thus making the related EFI stub's Makefile
quirks redundant.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: define relevant EFI stubs in image-vars.h (Ard) 
---
 arch/loongarch/kernel/image-vars.h    | 2 ++
 drivers/firmware/efi/libstub/Makefile | 7 +------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..19202f4f84c2 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,6 +8,8 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
+__efistub___lshrdi3		= __lshrdi3;
+__efistub___ashldi3		= __ashldi3;
 __efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..bcf2a5981678 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -96,12 +96,7 @@ zboot-obj-y			:= zboot-decompress-gzip.o
 CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
-
-zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
-lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
+lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
