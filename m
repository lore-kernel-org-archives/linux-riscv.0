Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E0AF428F5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyS94YrPyf1XD6cjGLkmushHYMSoQiF1i0BHGxbKv44=; b=meI9O8sWCa+GwN
	4BnwlzBG2WOGvhnwZ8c+ZpKJOqHpqSvv9FqZZUGt+9/sQJfAqMw717zuxuaulTjnvmX8qk2kt6vUA
	l2D17uNoreBCKo+E01e3m2THXxbwTvnxI7sA6C9OWzScpwRja7ocbRRnABikMokOUtVtECCWi5tU/
	KXVIZikufHdgoo/wakALWCzJQG+XAD8PnnjfRHNwPOwy1vmVpHhIBzGhFxCvOIXs2mJOtKQqn1J4z
	JpZywJYrC4xfIAu1eJATdvdBuobTnqiCcPLT5Le9SBUfc6h+xCfVBPf21yDuKWASBy3sI9qwc+ywn
	5p8Vvq0c29mjTMyRXgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD73m-00000001b0e-1NLu;
	Wed, 15 Apr 2026 20:42:09 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD731-00000001az3-2X16;
	Wed, 15 Apr 2026 20:41:30 +0000
Message-ID: <88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org>
Date: Wed, 15 Apr 2026 13:41:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/8] Auto-generate maintainer profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <djbw@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Content-Language: en-US
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
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

Hi Mauro,

Thanks for tackling this issue.

On 4/15/26 1:52 AM, Mauro Carvalho Chehab wrote:
> Date: Tue, 14 Apr 2026 16:29:03 +0200
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Dan Williams <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>
> Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>
> 
> Hi Dan/Jon,
> 
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
> 
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
> 
> On this version, I added Dan's text to patch 4.
> 
> I also added a couple of other patches to improve its output. While
> I could have them merged at the first patch, I opted to make them
> separate, as, in case of problems or needed changes, it would be
> easier to revert or modify the corresponding logic. Also, it should
> be better to review, in case one wants some changes there.
> 
> The main changes against RFC are:
> 
> - now, the TOC will be presented with 1 depth identation level,
>   meaning that it would look like a list;
> - for files outside Documentation/process, it will use the name of
>   the subsystem with title capitalization for the name of the
>   profile entry;
> - the logic also parses and produces a list of profiles that are
>   maintained elsewhere, picking its http/https link;
> - entries are now better sorted: first by subsystem name, then
>   by its name.
> 
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> 
> Mauro Carvalho Chehab (8):
>   docs: maintainers_include: auto-generate maintainer profile TOC
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86
>   docs: auto-generate maintainer entry profile links
>   docs: maintainers_include: use a better title for profiles
>   docs: maintainers_include: add external profile URLs
>   docs: maintainers_include: preserve names for files under process/
>   docs: maintainers_include: Only show main entry for profiles
> 
>  .../maintainer/maintainer-entry-profile.rst   |  24 +---
>  .../process/maintainer-handbooks.rst          |  17 ++-
>  Documentation/sphinx/maintainers_include.py   | 131 +++++++++++++++---
>  MAINTAINERS                                   |   2 +
>  4 files changed, 128 insertions(+), 46 deletions(-)

When building htmldocs with O=DOCS, I get a bunch of warnings.
I tested against today's linux-next tree.

The 'make O=DOCS htmldocs' warnings are (subset of all warnings):

linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-kvm-x86' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/filesystems/xfs/xfs-maintainer-entry-profile' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-soc-clean-dts' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-netdev' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-tip' [toc.not_readable]

linux-next/Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-kvm-x86.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-netdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc-clean-dts.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-tip.rst: WARNING: document isn't included in any toctree [toc.not_included]

linux-next/MAINTAINERS:1: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc' [ref.doc]
linux-next/MAINTAINERS:2: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
linux-next/MAINTAINERS:3: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
linux-next/MAINTAINERS:5: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]
linux-next/MAINTAINERS:6: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
