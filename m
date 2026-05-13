Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2346CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXffAOHyhNZeD1/yeal2u2n1yt21G0MHzY9EY1ux+do=; b=fGp2TpafVj/+yG
	oUozJk/DmHOj71DmYgHWF5Z/SIC9O9GYW4b7y7QS9DC137t+2BNj9ePU0/VJN27pMi0ARa4MWPU0h
	du+WFXyWLPOAS0PFmexxJYC8OPNGH5YB2S0wVMHXKNWHA0WQF1YfOfv5gy+huf4AEDWsoVsgUNyeh
	noyjZH7magjseAbZp69FVX6RJncgZ3EP8X6ruvcVK5tnoU6SbDeGoIziOHbfIr2zsC570a5ycDhUj
	sJsFwIwqKn4F9y7vTiCC4+ucIYvHjmhBmcxxvVKAWNMwDlVDfgBCOqXxZJkvsT5BXu+w2A6SBXjIr
	uMKOWauMSoEwcX4N4GFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA0Q-00000002ott-2XxA;
	Wed, 13 May 2026 13:52:10 +0000
Received: from forward102b.mail.yandex.net ([178.154.239.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA0K-00000002ope-2Rgu
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 13:52:08 +0000
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:1ba8:0:640:1638:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id B70ACC0109;
	Wed, 13 May 2026 16:51:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp) with ESMTPSA id ppLkjiGSViE0-Mzh5yw02;
	Wed, 13 May 2026 16:51:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1778680314; bh=sgqPZBhmLj4CjzmFgb1iK96kcHfpdHHB/4dRlyF8re0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=dCfD1Zv9ttQtvFyIJ9d86qEn4UqLYMHwHRDFEJlDcx38PQgd27NkoOBpDJC37t0us
	 TZsvodkrQAz06Kuag5Uh2xFc0gvU5Mr1wF/DDVAqZeznQTcCsT2uvTw89Kf/QbpMDp
	 ZhKMBQm/auLpmzDgB+FBWQUC1qelhSd9xgQMQEW4=
Authentication-Results: mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v10 0/8] lib and lib/cmdline enhancements
Date: Wed, 13 May 2026 16:43:59 +0300
Message-ID: <20260513134407.884033-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065205_169328_9CB87A98 
X-CRM114-Status: UNSURE (   9.83  )
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

This series is a merge of the recently posted [1] and [2]. The first
one is intended to adjust '_parse_integer_limit()' and 'memparse()' to
not ignore overflows, extend string to 64-bit integer conversion tests,
add KUnit-based test for 'memparse()' and fix kernel-doc glitches found
in lib/cmdline.c. The second one was originated from RISCV-specific
build fixes needed to integrate the former and now aims to provide
platform-specific double-word shifts and corresponding KUnit test.

This series was briefly tested on X86, RISCV32, ARM, and MIPS using QEMU.

Getting feedback from RISC-V core maintainers would be very helpful.

Special thanks to Andy Shevchenko, Charlie Jenkins, and Andrew Morton.

[1] https://lore.kernel.org/linux-riscv/20260403103338.1122415-1-dmantipov@yandex.ru
[2] https://lore.kernel.org/linux-riscv/20260427090105.705529-1-dmantipov@yandex.ru

Dmitry Antipov (8):
  lib: fix _parse_integer_limit() to handle overflow
  lib: fix memparse() to handle overflow
  lib: add more string to 64-bit integer conversion overflow tests
  lib/cmdline_kunit: add test case for memparse()
  lib/cmdline: adjust a few comments to fix kernel-doc -Wreturn warnings
  riscv: add platform-specific double word shifts for riscv32
  lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()
  riscv: fix building compressed EFI image

 arch/riscv/Kconfig                    |   3 -
 arch/riscv/kernel/image-vars.h        |   9 ++
 arch/riscv/lib/Makefile               |   1 +
 arch/riscv/lib/ashldi3.S              |  36 ++++++
 arch/riscv/lib/ashrdi3.S              |  36 ++++++
 arch/riscv/lib/lshrdi3.S              |  36 ++++++
 drivers/firmware/efi/libstub/Makefile |   3 +-
 lib/Kconfig.debug                     |  10 ++
 lib/cmdline.c                         |  30 +++--
 lib/kstrtox.c                         |  37 +++---
 lib/test-kstrtox.c                    |   6 +
 lib/tests/Makefile                    |   1 +
 lib/tests/cmdline_kunit.c             |  56 +++++++++
 lib/tests/shdi3_kunit.c               | 175 ++++++++++++++++++++++++++
 14 files changed, 410 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/lib/ashldi3.S
 create mode 100644 arch/riscv/lib/ashrdi3.S
 create mode 100644 arch/riscv/lib/lshrdi3.S
 create mode 100644 lib/tests/shdi3_kunit.c

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
