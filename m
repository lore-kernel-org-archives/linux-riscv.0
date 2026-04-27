Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA19AFF886A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATsQkMCGgddMmP/JveR+gsIThluj0d+lMlJGVlBCRM8=; b=qiNloY5OQfoL32
	ODoCUv1dAQ4gj1XMQHpM5KWxgV6QsQ5lPL8CMNIPop0N9PvnYDEz583kFeFGErM6//VReBBJairoL
	eH6ly07r4wvCfFqKCYmsRYlg8ws/dH6vXEVC1CuxpgKsxMiOsDRMx4aZE7cG2bPu7lxR7IPYxv1tp
	+WOKjYgoj5gZXRqY0xQXDDUheE9b+UI/QicgDTcORMQGtEkGjp89d/ajXeD9LW48i2HpzWDBglydV
	QI1JzMW0ePXFDV13GmD/NY9IHDImU61TgZCajXOZDE/nyzaXcyhO5BRD4sBXyrURnp+O83KJLunHt
	sEfsaINEPmb4blMb7q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr9-0000000H4ps-38Az;
	Mon, 27 Apr 2026 14:22:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr6-0000000H4n6-26ci
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AB7842A19;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A15C2BCB5;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=yvJZ1GDHURo4wpDVebQJO6GRAN8RUuGUnTVcK5HT+04=;
	h=From:To:Cc:Subject:Date:From;
	b=QoUzcRWAu91OGOQdrvGaOSZMZKrY4p40ZHxF870Reazad4KPw3aZA7uqDLvugWbhQ
	 vvcUtI0dzd39917CGlUcQzRb9cyjQwXxBjVGqmFSKPSGKRVxLEGvEB7I6gSMOnR6Fq
	 dqBMRhL9UN911iuUB7500aRNveONyEmYhZe5GK3wx5hwxMBip0UcKUwGQ1NvampzLW
	 o+wclDVkHDbHODKvR6hvPvy+XyCF09DgrxJG6NIih01/qBeUNNCmguVwjQI1rQ5SpA
	 LJyI5ZsyMgR7bJipg77H/NyMQQWJq5Sr1ZHbZKVu3/rmtzYbvcyrK1XwfVEJY2h4vR
	 HETt0ClpAcpIw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8Os-1uPW;
	Mon, 27 Apr 2026 16:22:33 +0200
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
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH v4 00/10] Auto-generate maintainer profile entries
Date: Mon, 27 Apr 2026 16:22:18 +0200
Message-ID: <cover.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072236_583060_E4F05E0B 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Jon,

This is basically the same patch series I sent during the merge
window, rebased on the top of post 7.1-rc1 docs-next branch.
It is tested both with and without O=DOCS.

It contains just one extra trivial patch adding a missing SPDX
header, and, on v4, I dropped two patches touching MAINTAINERS,
as those aren't needed anymore.

This patch series change the way maintainer entry profile links
are added to the documentation. Instead of having an entry for
each of them at an ReST file, get them from MAINTAINERS content.

That should likely make easier to maintain, as there will be a single
point to place all such profiles.

The output is a per-subsystem sorted (*) series of links shown as a
list like this:

    - Arm And Arm64 Soc Sub-Architectures (Common Parts)
    - Arm/Samsung S3C, S5P And Exynos Arm Architectures
    - Arm/Tesla Fsd Soc Support
    ...
    - Xfs Filesystem

Please notice that the series is doing one logical change per patch.
I could have merged some changes altogether, but I opted doing it
in small steps to help reviews. If you prefer, feel free to merge
maintainers_include changes on merge.

There is one interesting side effect of this series: there is no
need to add rst files containing profiles inside a TOC tree: Just
creating the file anywhere inside Documentation and adding a P entry
is enough. Adding them to a TOC won't hurt.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/

(*) At the end, I opted to use sorted(), just to ensure it, even
    knowing that MAINTAINER entries are supposed to be sorted, as
    the cost of sorting ~20 already-sorted entries is negligible.

---

v4:
 - Dropped changes to MAINTAINERS, as other patches already
   updated media and tip entries.

v3:
 - Added SPDX entry to process/maintainers.rst file;
 - rebased after 7.1-rc1 release.

v2:
  - I placed the to MAINTAINERS changes at the beginning.
  - fix a bug when O=DOCS is used;
  - proper handle glob "P" entries (just in case, no profiles use it ATM);
  - when SPHINXDIRS=process, instead of producing warnings, point to
    entries at https://docs.kernel.org;
  - MAINTAINERS parsing now happens just once;
  - The output won't be numered for entries inside numered TOC trees;
  - TOC tree is now hidden;
  - instead of display a TOC tree, it shows a list of profiles,
    ordered and named after file system name taken from MAINTAINERS file;
  - At the output list, both https and file profiles are shown the same
    way.


Mauro Carvalho Chehab (10):
  docs: maintainers: add SPDX license to the file
  docs: maintainers_include: auto-generate maintainer profile TOC
  docs: auto-generate maintainer entry profile links
  docs: maintainers_include: use a better title for profiles
  docs: maintainers_include: add external profile URLs
  docs: maintainers_include: preserve names for files under process/
  docs: maintainers_include: Only show main entry for profiles
  docs: maintainers_include: improve its output
  docs: maintainers_include: fix support for O=dir
  docs: maintainers_include: parse MAINTAINERS just once

 .../maintainer/maintainer-entry-profile.rst   |  24 +--
 .../process/maintainer-handbooks.rst          |  17 +-
 Documentation/process/maintainers.rst         |   2 +
 Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
 4 files changed, 150 insertions(+), 54 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
