Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D7C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMcF4aej3P1fh2IcWdGRZyQJB/LTBlHT6kRuVYtKib4=; b=HchPsmAAd51452
	ZQ9z5/OTFPoXZc+BSyBNB7x3P772Xhyv3z5Kck6MTi204VNs83rJo79LtYFWosxHHkf1EvgqxOyf3
	hU4WO9h4ekmjj1OWFf8lSEG7VrfA8RZqWI2auw9xXaK8l7kQZlGeaGkdW9+F7Vc9kbgWt+1hKBsJU
	i/UR8Ca9vuj6YUzjAe0dVXVo59tMHBga/4VNMUy6O4/fsuWLCQJOZHwEphL44dIGkiPHMhNLD0VTa
	fzdjLZbFT7BX/muxfUzDTBkQmPoDmKBYynEKL44LCgHkRmB7VERJGl50ypsKLgYXRZKsi6zORMgeJ
	ktaNDhGgEDdaG94iTkeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyt53-0000000GG8R-3NZO;
	Sun, 30 Mar 2025 13:52:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyt4z-0000000GG7l-35ik
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 13:52:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A514441B8;
	Sun, 30 Mar 2025 13:51:50 +0000 (UTC)
Message-ID: <deb70c8d-aef9-49df-819c-53007a9ad699@ghiti.fr>
Date: Sun, 30 Mar 2025 15:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeejvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeevfffhleelfedvjeegleefffeiveejkedvtdeggfdtgfeiudejueeghffgudejvdenucffohhmrghinheptghrihhurdhorhhgpdgrshgtihhinhgvmhgrrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgvhegumedvtggumeehugelieemjedtlegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvvgehugemvdgtugemheguleeimeejtdelugdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgvhegumedvtggumeehugelieemjedtlegungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmp
 dhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhgrnhhgrdhlhihrrgesghhmrghilhdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_065201_909590_02E11C42 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Chunyan,

On 13/11/2024 10:58, Chunyan Zhang wrote:
> This patchset adds soft dirty and userfaultfd write protect tracking
> support for RISC-V.
>
> As described in the patches, we are trying to utilize only one free PTE
> bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
> Users cannot have them supported at the same time (have to select
> one when building the kernel).
>
> This patchset has been tested with:
> 1) The kselftest mm suite in which soft-dirty, madv_populate,
> test_unmerge_uffd_wp, and uffd-unit-tests run and pass, and no regressions
> are observed in any of the other tests.
>
> 2) CRIU:
> - 'criu check --feature mem_dirty_track' returns supported;
> - incremental_dumps[1] and simple_loop [2] dump and restores work fine;
> - zdtm test suite can run under host mode.
>
> This patchset applies on top of v6.12-rc7.
>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://www.criu.org/Incremental_dumps
> [2] https://asciinema.org/a/232445
>
> Chunyan Zhang (3):
>    riscv: mm: Prepare for reusing PTE RSW bit(9)
>    riscv: mm: Add soft-dirty page tracking support
>    riscv: mm: Add uffd write-protect support
>
>   arch/riscv/Kconfig                    |  34 ++++++-
>   arch/riscv/include/asm/pgtable-64.h   |   2 +-
>   arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
>   arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
>   4 files changed, 197 insertions(+), 3 deletions(-)


As mentioned by Deepak, there is a new proposed extension Svrsw60t59b 
which will free 2 more bits. It would help if you can come up with a new 
version of this patchset using this new extension, would you mind 
working on this? If not possible, let's discuss how I can help.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
