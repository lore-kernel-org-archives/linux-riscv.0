Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37E2FF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WFhAjTTmfJjUL1s2I1ZusLGZOg5LaVxiXSOypYvLSrg=; b=4Dz1Y7QyhR75Qt
	5NbkBTfcP1AzrDGDYsZj7+53uRc3Wp/UQhkGmrsgsQ0g/lL3g7EWLpNMzmfc7PeTqVyqhsjlwlWVd
	uJQFdbxiTcqxzL+msmf3Ub6y3snw2YTMciqrEmW5BT/7afv9e/q9H4IONM0J1cnNX50If0+WYw1LI
	9/TMkzgihCC97g13fwDj/uf17b2m1PyXSZh8JluKXkyTd2PMHPINImgjRBXjuPxdPTiB7HFJEQyn6
	OhTRWQVJguWLNkfkIi1jTZjj58YWBGTpjX0hpR6zjOQJ6UURKraXzxPJgYUXvkAMikTesHBoEbM9U
	CNvQxYmX5SO9FZZY6lYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHqe-0000000GWoP-3O43;
	Mon, 27 Apr 2026 09:01:48 +0000
Received: from forward100d.mail.yandex.net ([178.154.239.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHqZ-0000000GWmO-2Jf4
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 09:01:47 +0000
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 7B800C00EA;
	Mon, 27 Apr 2026 12:01:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp) with ESMTPSA id X1UMu7lR5a60-ZAa3Jhfy;
	Mon, 27 Apr 2026 12:01:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1777280496; bh=7boIdMFjh/eDTdbjKKi7DGQVGpt+5ny1FtpPOfcellM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=AYh1SRFU+HWIoVT8vhgolQy3u/joFrsyDzyK8ZFT9TpUb43RKpjcp6OP9zG6eTVhO
	 bNiPhB/cpx9q9R5E9Ewsgsae/nsEUlhpL7eoPf3DXWEPY2CHzUApEEqJDkL+SZaTGu
	 Eds07EvtLhPtIrnvGIvv11VOTnqbOUwWL1K5OcJc=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
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
Subject: [PATCH v7 0/3] riscv32 library enhancements and build fixes
Date: Mon, 27 Apr 2026 12:01:02 +0300
Message-ID: <20260427090105.705529-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_020143_757996_F0CE4361 
X-CRM114-Status: UNSURE (   8.46  )
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
 arch/riscv/kernel/image-vars.h        |   9 ++
 arch/riscv/lib/Makefile               |   1 +
 arch/riscv/lib/ashldi3.S              |  36 ++++++
 arch/riscv/lib/ashrdi3.S              |  36 ++++++
 arch/riscv/lib/lshrdi3.S              |  36 ++++++
 drivers/firmware/efi/libstub/Makefile |   3 +-
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
