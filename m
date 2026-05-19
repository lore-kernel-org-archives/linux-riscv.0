Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C437CCD4F5E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2eshmEbYeudjRc339NzsCUfvdLIovo/12RLpOrJIVlg=; b=0JYB6RUAzQZZlC
	qrXCrPWwi+Muz8P31TTQzbxrBZhgf462N19CioILy39hfKu77gYeBMfet+yMpcjwooav9E3AoBgiB
	eLMEh0/fm4qyT+DpdnfOXgjNKbh3NAiR2fpQS5pQGvvmGuoeixssvqA87mEhtoUtDTAwsU9Nw4bho
	PVOAzmITp/l/+7FbVK3CVwvtA+QbIMSRBfN98Orwkwr0QYYGhi/lFZv4vtPLoGn8/DsJKUGwz/Ac/
	A8yGA5VPPO0bcnRcJ84/CTH25p67ROzpP7F22CLZwi3YoARUu2Gd7T9AXF/NEVv7DPqK971ry/MkA
	44EhgpL0MG31AbAEFPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOA4-00000002N5s-0nnh;
	Tue, 19 May 2026 17:23:20 +0000
Received: from forward100a.mail.yandex.net ([178.154.239.83])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPO9x-00000002N2A-3h5t
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:23:17 +0000
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id AEC44C0169;
	Tue, 19 May 2026 20:23:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp) with ESMTPSA id 0NVul40SU0U0-fzsC5bFj;
	Tue, 19 May 2026 20:23:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1779211383; bh=7c+9bkOD0NfFHWVEjJO5bWET/2NkPh9vtXTbM/GJVa0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Eb1W3Qdo5DuQUgcIIMYkjGapyo9UIgOGw6gYQY4cQm0/1krvxkzC8K2Qx3gJNaN2g
	 thGnc3BY7nmen/bFnS2hs71Y+X6fdCjc7MYyVVs6wXbedziBrL2ysQSJ5o8QpBzA0b
	 374teJ9aYYojzcLf/R/w/0wbRMeB6iFB3mtDhDlA=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
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
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v11 0/8] lib and lib/cmdline enhancements
Date: Tue, 19 May 2026 20:22:51 +0300
Message-ID: <20260519172259.908980-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_102314_433839_FBB6A087 
X-CRM114-Status: GOOD (  11.50  )
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

This series was briefly tested on X86, RISCV32, ARM, and MIPS using QEMU,
and compile-tested for LoongArch32 as well.

Getting feedback from RISCV core maintainers would be very helpful.

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

 arch/riscv/Kconfig                      |   3 -
 arch/riscv/include/asm/asm-prototypes.h |   4 +
 arch/riscv/kernel/image-vars.h          |   9 ++
 arch/riscv/lib/Makefile                 |   1 +
 arch/riscv/lib/ashldi3.S                |  36 +++++
 arch/riscv/lib/ashrdi3.S                |  36 +++++
 arch/riscv/lib/lshrdi3.S                |  36 +++++
 drivers/firmware/efi/libstub/Makefile   |   3 +-
 lib/Kconfig.debug                       |  10 ++
 lib/cmdline.c                           |  30 ++--
 lib/kstrtox.c                           |  37 +++--
 lib/test-kstrtox.c                      |   6 +
 lib/tests/Makefile                      |   1 +
 lib/tests/cmdline_kunit.c               |  56 ++++++++
 lib/tests/shdi3_kunit.c                 | 175 ++++++++++++++++++++++++
 15 files changed, 414 insertions(+), 29 deletions(-)
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
