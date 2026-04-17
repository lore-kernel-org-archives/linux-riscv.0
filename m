Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C3F8E4AB
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y19ekXkyb+0hSlxtbEerAc5jdxUdtaZ0FB81xsYrnuM=; b=c/E9fhXlwORn8n
	/sGBfTV+UmV/Dm8V4nDwbM2ZnSLVhspC+gn5Dz0iaofN9vsLOfCUSbAt4yWPUVUK8jLUVh4GOSg9g
	Yd8CdroJEmU7CLIulrEAM+9Q7Z3TYwYzK46fsA0GBL+50lbOu46M138RnMr3YEfZ2JDglYel3k3PC
	4vM0OTWaSWWzkP2wD/fMYF0bvJESuygRiUHFsKa0C5Hj+wluv2fyIc8jaP6zLDDI6CmII8XXX4GnZ
	1V6VgdGisFyuMxrsid+aDrjE0Vc8n4Iuy072PxvsoTu5p/QFfSpbvDiEUwi+blIFFzSK5C6BcRKSV
	PSG/7gZ1uu8nlB6sA8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQM-00000003VTC-0ZO4;
	Fri, 17 Apr 2026 06:11:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQK-00000003VQq-2MbG
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 06:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A87026012A;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E30C19425;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=cVfA52v+sdW2YwccylzuvwEwBs8Iu8EG8i6EHkWsERE=;
	h=From:To:Cc:Subject:Date:From;
	b=lFHzYIVK7DLZCoTSf1ZbfAcy4kySM3sX0J/CjA/CReQXJC6ANWjDSieNSZCNyIVy9
	 aTfHnZRgMwl6zTUm1EkLaLjUfBqNkIN6fU+ZtwHWdAFFE/WI2MNWppRcrnEnEUx2KR
	 qBN39CMruCXQFBsI18ty/K+gaK068jvwNfh7NQ7tnThJBkTVirYQgvx1QZiRSVitmL
	 xEsbc5PS6jjkW6OcOM6FU8KGe/7IuyJWe3coBQApreSB3FpTCnx4dpFdA3Db9neW9m
	 BHAmluml7er0c4YXMTwxLbKU9WeBr9Zr2cTTW1ApKHjpXoKYVb/ECFE+7nniPARwla
	 VfYIpMpO54Ahg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sO-1n6C;
	Fri, 17 Apr 2026 08:11:25 +0200
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
Subject: [PATCH v2 00/11] Auto-generate maintainer profile entries
Date: Fri, 17 Apr 2026 08:11:10 +0200
Message-ID: <cover.1776405189.git.mchehab+huawei@kernel.org>
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

Hi Jon,

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

Mauro Carvalho Chehab (11):
  MAINTAINERS: add an entry for media maintainers profile
  MAINTAINERS: add maintainer-tip.rst to X86
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
 Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
 MAINTAINERS                                   |   2 +
 4 files changed, 150 insertions(+), 54 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
