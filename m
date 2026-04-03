Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F2BE7E36A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8j+wIdgnR37qvBKaN/4rtGi8+0xIMP+hVi118UdkvQI=; b=RZ+kPcznbTVGZI
	f4lJUruOLtoJuGhXwdSDPBBFSHgUC0jqaNk/Cw1KniJ53GDeDVMm3nn/8azZiLAnNRX5Da2eB9Hgf
	0R+CsGrSmNdkXWue0t0wTeoNVk8cTgUXZkkYDQDSg9AxNEyGHtfLbrqY6Pg6uWe8VvxPrQpbJGD+n
	n8gd+WAgMfT5qJM5C8Eua/YkRyZMPK/1S+ZvfUV+cOPkU++HQMiu9WyeP9uoFsA3N3raMAvhlnOmS
	4v7SRw7VuJ7uRcVeVQIrOzN0LK7aXdnAx6EN34pO//6h/pss4hQDH3t+hlFWK1HoTrNdn47isdr9L
	z3W6AJAxoQOk+VTg783g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqe-00000001tbm-1dfm;
	Fri, 03 Apr 2026 10:33:56 +0000
Received: from forward100d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqZ-00000001tYx-1yH9
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:33:54 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 7204CC0094;
	Fri, 03 Apr 2026 13:33:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eXaKrQ9QICg0-IBvZbH4J;
	Fri, 03 Apr 2026 13:33:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775212422; bh=o31dgXkAWDJ6BGs1YfSlPFlehE6i4ZqjuBg4lS/peO4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=iRK//pXEF0MNHgioaONLqrrhk4K7wPX44o1b5/aWsgW9V+3u6X9ow8R5nvUyGimZJ
	 /uXsUD3YGDx64fYNcVG+JyfWGgdtioglqVKyH1ds8CBsqmSTTh+A1G7QKkmSim/8Xe
	 i3VIk0FUMcpYZdtEfTJjfYdt5EJEjWfj1R3RXrb4=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v9 0/6] lib and lib/cmdline enhancements
Date: Fri,  3 Apr 2026 13:33:32 +0300
Message-ID: <20260403103338.1122415-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033352_055779_AD46F7D6 
X-CRM114-Status: UNSURE (   6.71  )
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

Adjust '_parse_integer_limit()' and 'memparse()' to not ignore overflows,
extend string to 64-bit integer conversion tests, add KUnit-based test
for 'memparse()', fix kernel-doc glitches found in lib/cmdline.c and
adjust riscv32 linker script to export symbols needed for EFI stub.

Dmitry Antipov (6):
  lib: fix _parse_integer_limit() to handle overflow
  lib: fix memparse() to handle overflow
  lib: add more string to 64-bit integer conversion overflow tests
  lib/cmdline_kunit: add test case for memparse()
  lib/cmdline: adjust a few comments to fix kernel-doc -Wreturn warnings
  riscv: export symbols needed for riscv32 EFI stub

 arch/riscv/kernel/image-vars.h |  9 ++++++
 lib/cmdline.c                  | 30 ++++++++++++------
 lib/kstrtox.c                  | 37 +++++++++++++---------
 lib/test-kstrtox.c             |  6 ++++
 lib/tests/cmdline_kunit.c      | 56 ++++++++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+), 25 deletions(-)

-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
