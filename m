Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68EC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4suAoXCK6dhvHnf0AoWMpzXMhNZd9j7qSeImK4Gnmac=; b=QlXUyZBrwIkq0X
	jjHhb0gPJ7N4HiVzXM8YBXUHBWZPq67cXdI8RO3XREjHxFTMzBxaZW9fhoIGZAtcfpq0YKae4l9Fn
	5dBKgghc6ezsNS1mOK6qqwNGeM3Aoilgz1inR04PFUkK59vpoVArgmJDfmIKncwgeZxFME0iOCkbM
	qvJFQNM6iYDDaufpEEvTFdrSAYM1c+/6zkPcDi7GVpnd+pm9sYscfODW4IiTE4/a0QPQhAdknC8y1
	zXhH5rz13mz7jErMMBcHGZcpRl8T04kuWMQfO6Mg/j6cbL8QCDNkbgLoJsWi4z1tTzEgoeho7GXmc
	60jPVYX884WoOSQiGA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLood-00000000KOy-3VUe;
	Mon, 24 Jun 2024 18:53:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoob-00000000KOC-1B5w
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 18:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA4FE60F80;
	Mon, 24 Jun 2024 18:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84DEC2BBFC;
	Mon, 24 Jun 2024 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719255199;
	bh=5SQ6k8ql2FtQ24ggunQpn42cMs/9ehVKj7ffUjrSWaY=;
	h=From:To:Cc:Subject:Date:From;
	b=VXtXonHvyo+lWD0+pd+wr848CsLJDdbee4dVtqEC+taFZleV+/ScGSS1Uh5KTQv5a
	 QnFj79HuE41StMAO09LmxsiUmLstImWmWCDWn9q/8trkmxUYT8DvzromPaS2Qg6S+c
	 yV+9dimLGjxNQQ9lyL5Leh41aBeHHK3yr2nSTCCobOdAmIQfQluJ2yGek/SeYlcNbS
	 NwEYmE70UeDPIsdiuGmk/c3RnO+nRiAyMNO1/lHiMhtxOY+SkmgIYqN7gcT3Z1UQaq
	 +sF+wjYNdfcq3fyuNJpJ+OypNUfBlIgqoSAUVIEwvBslVQ4xxkIFgnhj+a4ejS3oRM
	 Svk9o0CE5wYNw==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: SeongJae Park <sj@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alex Shi <alexs@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Bill Wendling <morbo@google.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] minor document fixups
Date: Mon, 24 Jun 2024 11:53:05 -0700
Message-Id: <20240624185312.94537-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_115321_443824_2F0D0E91 
X-CRM114-Status: UNSURE (   6.46  )
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

This patch series is for minor document fixups.  First five patches
clean up and remove 'Other material' section of process/index in favor
of 'staging/' and better place for docs on the section.  A patch for
adding DAMON maintainer-profile reference on maintainers' handbook
follows.  And then the last patch adds 'hkml' as one of available email
tools on email-clients document.

SeongJae Park (7):
  Docs/process/index: Remove unaligned-memory-access from 'Other
    material'
  Docs/process/index: Remove riscv/patch-acceptance from 'Other
    material' section
  Docs: Move magic-number from process to staging
  Docs: Move clang-format from process/ to dev-tools/
  Docs/process/index: Remove unsorted docs section
  Docs/maintainer/maintainer-entry-profile: add DAMON maintainer profile
  Docs/process/email-clients: Document HacKerMaiL

 .clang-format                                         |  2 +-
 Documentation/{process => dev-tools}/clang-format.rst |  0
 Documentation/dev-tools/index.rst                     |  1 +
 Documentation/maintainer/maintainer-entry-profile.rst |  1 +
 Documentation/process/4.Coding.rst                    |  2 +-
 Documentation/process/coding-style.rst                |  2 +-
 Documentation/process/email-clients.rst               |  9 +++++++++
 Documentation/process/index.rst                       | 11 -----------
 Documentation/staging/index.rst                       |  1 +
 Documentation/{process => staging}/magic-number.rst   |  0
 .../translations/it_IT/process/clang-format.rst       |  2 +-
 .../translations/it_IT/process/magic-number.rst       |  2 +-
 .../translations/sp_SP/process/coding-style.rst       |  2 +-
 .../translations/sp_SP/process/magic-number.rst       |  2 +-
 Documentation/translations/zh_CN/process/4.Coding.rst |  2 +-
 .../translations/zh_CN/process/coding-style.rst       |  2 +-
 .../translations/zh_CN/process/magic-number.rst       |  2 +-
 Documentation/translations/zh_TW/process/4.Coding.rst |  2 +-
 .../translations/zh_TW/process/coding-style.rst       |  2 +-
 .../translations/zh_TW/process/magic-number.rst       |  2 +-
 20 files changed, 25 insertions(+), 24 deletions(-)
 rename Documentation/{process => dev-tools}/clang-format.rst (100%)
 rename Documentation/{process => staging}/magic-number.rst (100%)


base-commit: 88407e61007a3d3ebb62fc65479cc58d891ef74e
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
