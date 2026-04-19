Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE6F99C98
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 00:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy67FRePi0L0jdRqqT49nziMOKcARMYYl4vT3ctcYkU=; b=tLGz9zMp/9bMV9
	CM7HgJ+0/CPK0vlM3KFNFlUFNLD17S1tfDYWP3OIT9qZbmT2eyFkIpr1QFWkJ5PKLlhAFh07NpKVT
	jX1EVyMw+/MstBh2QoRT1ElsMUoP+hv5XOvAYePAekecYwiBkO/aXsCWnDt8BX0mH1S+Kyu8OKkC3
	rMWvr490QDymUFtC/JNKZaKxMH9kr2NtKZlooVrv+us4WENKL5JM1ao6ECSmoOS4vDXm8C2S18klt
	CNCsVfy+XwZiAzjgt2hDPFan9VrjK5EVzGZjlXq25JPIcRLyOMhdQhz1h0JXnMPQN2knjX8cn0PNG
	sqsKVMhfwCgqH87k6JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFfn-00000005M4d-1CRS;
	Sun, 19 Apr 2026 00:06:03 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFfg-00000005M3y-2rpf;
	Sun, 19 Apr 2026 00:05:59 +0000
Message-ID: <9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
Date: Sat, 18 Apr 2026 17:05:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Auto-generate maintainer profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <djbw@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
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



On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
> 
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
> 
> The output is a per-subsystem sorted (*) series of links shown as a
> list like this:
> 
>     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
>     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
>     - Arm/Tesla Fsd Soc Support
>     ...
>     - Xfs Filesystem
> 
> Please notice that the series is doing one logical change per patch.
> I could have merged some changes altogether, but I opted doing it
> in small steps to help reviews. If you prefer, feel free to merge
> maintainers_include changes on merge.
> 
> There is one interesting side effect of this series: there is no
> need to add rst files containing profiles inside a TOC tree: Just
> creating the file anywhere inside Documentation and adding a P entry
> is enough. Adding them to a TOC won't hurt.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> 
> (*) At the end, I opted to use sorted(), just to ensure it, even
>     knowing that MAINTAINER entries are supposed to be sorted, as
>     the cost of sorting ~20 already-sorted entries is negligible.
> 
> ---
> 
> v2:
>   - I placed the to MAINTAINERS changes at the beginning.
>   - fix a bug when O=DOCS is used;
>   - proper handle glob "P" entries (just in case, no profiles use it ATM);
>   - when SPHINXDIRS=process, instead of producing warnings, point to
>     entries at https://docs.kernel.org;
>   - MAINTAINERS parsing now happens just once;
>   - The output won't be numered for entries inside numered TOC trees;
>   - TOC tree is now hidden;
>   - instead of display a TOC tree, it shows a list of profiles,
>     ordered and named after file system name taken from MAINTAINERS file;
>   - At the output list, both https and file profiles are shown the same
>     way.
> 
> Mauro Carvalho Chehab (11):
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86
>   docs: maintainers_include: auto-generate maintainer profile TOC
>   docs: auto-generate maintainer entry profile links
>   docs: maintainers_include: use a better title for profiles
>   docs: maintainers_include: add external profile URLs
>   docs: maintainers_include: preserve names for files under process/
>   docs: maintainers_include: Only show main entry for profiles
>   docs: maintainers_include: improve its output
>   docs: maintainers_include: fix support for O=dir
>   docs: maintainers_include: parse MAINTAINERS just once
> 
>  .../maintainer/maintainer-entry-profile.rst   |  24 +--
>  .../process/maintainer-handbooks.rst          |  17 +-
>  Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
>  MAINTAINERS                                   |   2 +
>  4 files changed, 150 insertions(+), 54 deletions(-)
> 

Just a note, not asking for a change or fix:

AFAICT, all P: entries are now listed nicely except for:

P:	rust/pin-init/CONTRIBUTING.md

so for the series:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
