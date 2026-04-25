Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3919FF8860
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYG2DUHf5S0oRh7aqrEWPNj9oeR9MIueO3SxxAbd5FM=; b=TQkyCBdNQUUfjB
	gYp0jRSNPQKI26L84bWitri9JhET847dMtApt6dMXtyMHKTubDWu14GUKhQ+uehtfi8b08LPxSbQO
	ZRHg2LbLPqQc10+dYuIQsV0P+Hx8LtcsDuVBUKkenX20XFWw2pS/DAfsuJdIuzASJ5y++4oagfV+Q
	N7+rgA5fOMpVh3QSp7qivzEZqIqqbCZFvDa7Lohgv9LXYRWV+/eXJxlSeJ33WrUYgwHTmBBv+ZJXQ
	AuGh+GrdD+EotrHc/8ar2hLmNhcd7dsXR9U2jE2nL5cPNnn888TOZ4mTVYP5n01IMVfFjIfzq33H5
	zoVuN9bBg34CQkoMxyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGi6w-0000000Ejyq-15nX;
	Sat, 25 Apr 2026 18:52:14 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGi6s-0000000Ejx7-00l1
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 18:52:12 +0000
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:143b:0:640:90e9:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id E0C72C0038;
	Sat, 25 Apr 2026 21:52:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp) with ESMTPSA id upbkSmRSGOs0-meWgy57M;
	Sat, 25 Apr 2026 21:52:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1777143120; bh=Z32NmT5CVy7Z7bGrRY4+g5I67jzTqY1eawuxieoIPEM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=RmzV3NK/HX+OHzuwqZn+2Wjc0UHB/TUEM5YlFyoCCxfU/2R32PWrgVfDWEuQB0UZg
	 SRme54zGqbKeVgiiMdzkD271AUdd7bO3xkMIL616D19AFXx0DfkaYkW/ax2F/Xc1sh
	 CNsXAd0fx9MzCr00pzg5aLKxxufb73jq+JFu4AJM=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
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
Subject: [PATCH v6 0/3] riscv32 library enhancements and build fixes
Date: Sat, 25 Apr 2026 21:51:47 +0300
Message-ID: <20260425185151.477442-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_115210_265875_C9659AEE 
X-CRM114-Status: UNSURE (   8.63  )
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
 drivers/firmware/efi/libstub/Makefile |   4 +-
 lib/Kconfig.debug                     |  10 ++
 lib/tests/Makefile                    |   1 +
 lib/tests/shdi3_kunit.c               | 175 ++++++++++++++++++++++++++
 10 files changed, 306 insertions(+), 4 deletions(-)
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
