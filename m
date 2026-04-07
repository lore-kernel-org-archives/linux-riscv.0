Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0AFB5179
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QUyO6S1WH71UnaizDwWtk6PaPv08zhYhaPJFJlrOjpI=; b=wdukPFcUtfkCZX
	h3Cn39MF1uSFr+WDWx1AlAHnEvXvwj+zNumMpGJjORdVxLxFKAE+5PD7nCT7XXVVfLM/fpt52Pv7/
	osDUzfCfQat/BK+5diKB42TcaJbKkpry5Xw6rkqnStkzYEmJNv3NgZrlE1sC33YKzoy8xkmLl0qXE
	avwxBIzPDAMWJ0+LtU4QMvqsf9LgjkePMVRBFbhh/q9+zPxQ+kY5HuMe+32K+lCEhtBxiALkKnSqz
	HaoZBCYNQMA72MqFwQUmsh2jmxSFakH68Jqp/RAOKAflARI859gLrTtMKPKozAuePUoAquuHa4c7k
	PFxkXv6YDWe20MFR2z5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9z0X-00000005vSz-0Gqi;
	Tue, 07 Apr 2026 05:29:49 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9z0S-00000005vRY-1yqN
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 05:29:47 +0000
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id 3DCA0C005A;
	Tue, 07 Apr 2026 08:29:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WT6S93BRI8c0-fTbDN3AH;
	Tue, 07 Apr 2026 08:29:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775539774; bh=sXQKU380blcfAvEL6uxfqq3C0+Hxb+mUsOV3xGjqwYY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=lonKPNr7sGCh78znmMaKP51DDTYFBS7d2OV3uojXjwq8jWxttg5PnvCaVAzwsRSBe
	 5cSxClC/JLoNwQDX/psDrpCpV7p937jiH9AMlmoPvFsjWQNycounLwQP9CuZKi2flq
	 YCubBTXuPsCfMAVhMYR4HIN3WCNhlPXQ4SNpKJJg=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 0/2] add riscv32 double-word shifts and library test
Date: Tue,  7 Apr 2026 08:28:22 +0300
Message-ID: <20260407052824.1260071-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222945_043055_1D879977 
X-CRM114-Status: UNSURE (   8.54  )
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
double-word shifts and corresponding KUnit test (known to work on ARM too).

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
 lib/tests/shdi3_kunit.c        | 174 +++++++++++++++++++++++++++++++++
 9 files changed, 302 insertions(+), 3 deletions(-)
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
