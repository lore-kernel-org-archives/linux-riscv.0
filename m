Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40139ED7B9B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ao+RzR24fCkj3ck0Z1EylDv7ufRjeMC9/Dt8m/RiKEI=; b=y+IYAP5Cx4XdXX
	9BQMLAvmkN17S+S4MIhMUib6rvXd74w8XglldTOs9Xw8ohpJamzYT1cl3irZ1KtKEIEZS6Q8t1BdY
	xop6J0b5oNlCYKVJLLtdfhe1SvlFghzyQqUSQ83U+Czye0+9n82+7IUnDVQ/Uc/1Iox+lgvJakS+7
	qWzqR4QZZoMHIKnFy8EFSjGP/x9tB6WgfFKb5Ig/ev0IyMvZ3aiNYZxdcUY0+rbU2DnY2AZvN9CeV
	5Hd5Hxh3A0gFwTAycgoROppdUJ/uWBiRyChdrcRM+8PQ/l0VoXpZ16LInFyUHy/s+zmjBm9jKe7Hy
	zxuSSc3UsuGC498EaXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayR-0000000H8WK-283m;
	Tue, 14 Apr 2026 10:26:27 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayN-0000000H8V7-3cr6
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 10:26:26 +0000
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3d95:0:640:5c83:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id D41B3C009D;
	Tue, 14 Apr 2026 13:26:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BQI23sTa1uQ0-YGZ1Ar9n;
	Tue, 14 Apr 2026 13:26:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776162374; bh=Mr1hTPyQNlez2JlQ/uPi299mOYyEk6C+zkloCGhX058=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=SdKlovDmd8CdJfyM7WLceE2/vTm7AeMdEkMj1Doq0KLonHwrOwqw8N0jHAUV0JK/3
	 diisuT7wYBxmln0P4CUPvpGTMzKiLu/ivGpezSIOt2GEfP/MYNFtnD53S1qd3/WU3b
	 ytZd4O86S19C74qwnRfgK/FgNKicSN36o083pa4c=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
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
Subject: [PATCH v4 0/3] riscv32 library enhancements and build fixes
Date: Tue, 14 Apr 2026 13:26:05 +0300
Message-ID: <20260414102608.573555-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_032624_458789_59155205 
X-CRM114-Status: UNSURE (   8.71  )
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

This series should immediately follow v8 of lib and lib/cmdline enhancements,
see https://patchew.org/linux/20260212164413.889625-1-dmantipov@yandex.ru.
Started from riscv32 build quirk, now it aims to provide platform-specific
double-word shifts and corresponding KUnit test (tested on ARM as well).

Dmitry Antipov (3):
  riscv: add platform-specific double word shifts for riscv32
  lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()
  riscv: fix building compressed EFI image

 arch/riscv/Kconfig                    |   3 -
 arch/riscv/kernel/image-vars.h        |   7 ++
 arch/riscv/lib/Makefile               |   1 +
 arch/riscv/lib/ashldi3.S              |  36 ++++++
 arch/riscv/lib/ashrdi3.S              |  37 ++++++
 arch/riscv/lib/lshrdi3.S              |  36 ++++++
 drivers/firmware/efi/Kconfig          |   4 +
 drivers/firmware/efi/libstub/Makefile |   3 +-
 lib/Kconfig.debug                     |  10 ++
 lib/tests/Makefile                    |   1 +
 lib/tests/shdi3_kunit.c               | 175 ++++++++++++++++++++++++++
 11 files changed, 309 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/lib/ashldi3.S
 create mode 100644 arch/riscv/lib/ashrdi3.S
 create mode 100644 arch/riscv/lib/lshrdi3.S
 create mode 100644 lib/tests/shdi3_kunit.c

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
