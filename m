Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E4E98FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 03:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjrE+xWjboUY63YMXJZgXnvvXd7F0BoCOLxZuPc5+pI=; b=M7tzq6blc1iiR5
	xPFtUqqCaYP39ERJpu4/QyI2U3ixgkvDKReWH4ADxPDk+RQ53Z9vPYKhlWsHY7ez7YwakVDdtXwy0
	abcI+0B8kb8qUWR6pttgDD8y94Jly5x+omwu5G2qoyVoewGWjhe9/TNRuUvJ8wjpUsfO2cUtlHh2o
	Gr8BLN6bJMEGoXgYDZZkUxy085TqII0Tn49HdLgYAmizoEM5qPpduIiw5STEYgbYXYOuciWPIXe/O
	/UuHCdyaEnFLwEoAQpFwkuTwhww3ACpYFa862RW24zW3lpgqMCt16UdFK0+fEkfL2qR/J1yLzwS9P
	R1zSOtFGknDLTTeGPKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgEW-00000009fBh-0HNq;
	Thu, 09 Apr 2026 03:39:08 +0000
Received: from forward103b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgES-00000009fAi-2Y86
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 03:39:06 +0000
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id CDBFFC005A;
	Thu, 09 Apr 2026 06:38:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id qc6G5J7R4Gk0-z7cdg21a;
	Thu, 09 Apr 2026 06:38:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775705935; bh=e0/YutL4HhEmglCELpZRrBZSCadyUkhISf57mMLMdqw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=A3RrRR834/zHtSuVha1y10rk/9GGX1gr0ZgqSYnwDRVastDupI3vBgh84016zw83o
	 cSUYmsf1L6or2og2NYJyZGMM0Y3cl6ge1SOfpzQjppZi7gqasQ/cHQvwGjsOsJrJpT
	 pVnoH1OorEcjDUYn5I1I1fLMFOjlJRubwtw4aa0M=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 0/2] add riscv32 double-word shifts and library test
Date: Thu,  9 Apr 2026 06:38:22 +0300
Message-ID: <20260409033824.465455-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <adavgV5IF9jMzxr3@ashevche-desk.local>
References: <adavgV5IF9jMzxr3@ashevche-desk.local>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_203904_825404_8D0964FD 
X-CRM114-Status: UNSURE (   9.44  )
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

Dmitry Antipov (2):
  riscv: add platform-specific double word shifts for riscv32
  lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()

 arch/riscv/Kconfig             |   3 -
 arch/riscv/kernel/image-vars.h |   7 ++
 arch/riscv/lib/Makefile        |   1 +
 arch/riscv/lib/ashldi3.S       |  36 +++++++
 arch/riscv/lib/ashrdi3.S       |  37 +++++++
 arch/riscv/lib/lshrdi3.S       |  36 +++++++
 lib/Kconfig.debug              |  10 ++
 lib/tests/Makefile             |   1 +
 lib/tests/shdi3_kunit.c        | 175 +++++++++++++++++++++++++++++++++
 9 files changed, 303 insertions(+), 3 deletions(-)
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
