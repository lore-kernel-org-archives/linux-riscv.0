Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4CEFA0C57
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AjY6t2PyaACdwZQBlOSXTrIEF8dVSqIPGlXSmDKm0Us=; b=XVyD38uhmolbTt
	hnBj/OV5PmdyLSJtsLU9SfJ3eWSrPYMMvM6UrgRNO5U+RDa1cZ0PppJgVseAuiJyDQ/6eqJTI/Fbf
	PWM2jyh+Uordum++eNlRtQQJkavePoogmO33s77ViwA5Dql+dBH1y4O8DPXwwxymSPplj+toHw0KQ
	YNpQ1vZksNK+fjYNcm75QxNww5W6R6JGC2oYHkRfndSamXz6ItbN6mDjwPogcM5j9oxpbSGASs1rM
	Jyc7QvxHuo6JlpX0Ar711Vgk3GP8KN3gWgI5F0w6RlazRg4A1xXOUBZrhql4HBDca2kG1l5NF47OL
	WvnRUmvA9qr1MtBzfsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz7-00000000qiT-1GKz;
	Wed, 15 Apr 2026 08:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz4-00000000qgY-3Fex
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 08:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05D9D60137;
	Wed, 15 Apr 2026 08:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900D4C2BCB0;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=cM6i2dqdYB7bquqYDadO6rTomOEopoC5wEog5eeYeTU=;
	h=From:To:Cc:Subject:Date:From;
	b=YloOutj2DFV4uhUrbByc7+kZKdXeSH2DTklHY2SeHSoFDQPLOPlFfZHaOZ6K4/hTT
	 3FupzResoirzc1lZZor7r97Mh2NheYT7Fu5Sf6TXU5wUY3cMeku50MaRkZvcopgLXZ
	 dqjzwqA5h5bcT1HXOcPpn3W6LyHxviUZ5mScNnSPS4lj3kiNLVLrAzpFzHy/EgaNnm
	 +NEKSpCRfYunzsOGWOuU8/5w5Xpn52Z6rd0m7wqJ9DMCvqkJmVZaBI1rvv7Ki6NCbR
	 7IhM1ec6++zdvsSUzGHy3rfIDY0Rosbhx+qGoiKR7hZiNaq3ac1SshBbKzGI55x9h0
	 s7Dj1aM3d0rag==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELvT-29QE;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH 0/8] Auto-generate maintainer profile entries
Date: Wed, 15 Apr 2026 10:52:16 +0200
Message-ID: <cover.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

Date: Tue, 14 Apr 2026 16:29:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Dan Williams <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>

Hi Dan/Jon,

This patch series change the way maintainer entry profile links
are added to the documentation. Instead of having an entry for
each of them at an ReST file, get them from MAINTAINERS content.

That should likely make easier to maintain, as there will be a single
point to place all such profiles.

On this version, I added Dan's text to patch 4.

I also added a couple of other patches to improve its output. While
I could have them merged at the first patch, I opted to make them
separate, as, in case of problems or needed changes, it would be
easier to revert or modify the corresponding logic. Also, it should
be better to review, in case one wants some changes there.

The main changes against RFC are:

- now, the TOC will be presented with 1 depth identation level,
  meaning that it would look like a list;
- for files outside Documentation/process, it will use the name of
  the subsystem with title capitalization for the name of the
  profile entry;
- the logic also parses and produces a list of profiles that are
  maintained elsewhere, picking its http/https link;
- entries are now better sorted: first by subsystem name, then
  by its name.

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/

Mauro Carvalho Chehab (8):
  docs: maintainers_include: auto-generate maintainer profile TOC
  MAINTAINERS: add an entry for media maintainers profile
  MAINTAINERS: add maintainer-tip.rst to X86
  docs: auto-generate maintainer entry profile links
  docs: maintainers_include: use a better title for profiles
  docs: maintainers_include: add external profile URLs
  docs: maintainers_include: preserve names for files under process/
  docs: maintainers_include: Only show main entry for profiles

 .../maintainer/maintainer-entry-profile.rst   |  24 +---
 .../process/maintainer-handbooks.rst          |  17 ++-
 Documentation/sphinx/maintainers_include.py   | 131 +++++++++++++++---
 MAINTAINERS                                   |   2 +
 4 files changed, 128 insertions(+), 46 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
