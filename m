Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2624C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqDI17/roEVdLI+NYCFpdREd4Px6MmYfUxKhE4/0WTk=; b=e7bts5AcZF3MBZ
	Jp8ZiYTM3KuM4KlvW7eWUq3DJYTI1sGHgn4TPD1R6mU5hP0pK4RCdkCUD7QaZJWZqZ/E59fi8+6be
	xLF3XQ8aPDpLRWCGTwvotWcgsCyA5bbT6ZFKCXBXufYHIDUjGUkWg69Uts+FHRvqdAnX8ge7LcfBc
	hWwGshP4Vohl7iYYGoNublfwe7ftCn2GOQKvjQkDA9tnYzPA7+GDE1BrX9486f/BPWwNeihY/7c8d
	s/nLlGkeGx+5gDSYp4ip6uMagCKNmTFF4ORvTTsWR+c1wRuA7IQ17a0aWsDs24eHz2T4ePq8muhiH
	aUrc22t213wsR3NkpHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oucWo-002o08-UF; Mon, 14 Nov 2022 16:41:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oucWl-002nxY-Il
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 16:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6370F612DA;
	Mon, 14 Nov 2022 16:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8F4C433D6;
	Mon, 14 Nov 2022 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668444101;
	bh=sJlYpdlEpWSZJfz2x3sOrQSeKfAOLQ7Vr/1pDVDUXAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cob+4nSMOS4k0r4QdKG7oEHPcdxmUh9+ev/F3T2LYs1yRQ3kDwtiDs7b1PK+ciUff
	 9IWJcHZiRs7CsoGwbp88dhGHpAOilcdhF1xXarW4dcHwQWFpPNR7+92fNSD3NCbJpQ
	 XsKfiOOroj7w7DLF52MCEk08btswoUJJP6xXD0Y39pD1abSZrCXs0kTidyzPLHwJXc
	 LyuxOTDN936sTl5oaabV1p7bJo/JZ3w6rX3BSsB7IH107k0mp9zfTUPHJR9W1pLHpV
	 ID2W6PgOO0wfH3wGlMp7UKimnB/6Yf5m//i3kCCoLa3RsO8VuXZmauvizF/BFuCY6D
	 WnsTNemuxffyg==
Date: Mon, 14 Nov 2022 16:41:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
Message-ID: <Y3JvwagRsMOJyayy@spud>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_084143_699613_9B7692ED 
X-CRM114-Status: GOOD (  18.96  )
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

Hey Anup,

Looks like patches 2 and 3 are failing for the nommu defconfigs:
https://patchwork.kernel.org/project/linux-riscv/list/?series=694995
Unfortunately, if the build fails NIPA doesn't appear to save a log.

In case it's relevant, should be gcc-11 & bintutils 2.37.

Thanks,
Conor.

On Mon, Nov 14, 2022 at 02:35:33PM +0530, Anup Patel wrote:
> The Linux NVDIMM PEM drivers require arch support to map and access the
> persistent memory device. This series adds RISC-V PMEM support using
> recently added Svpbmt and Zicbom support.
> 
> First two patches are fixes and remaining two patches add the required
> PMEM support for Linux RISC-V.
> 
> These patches can also be found in riscv_pmem_v6 branch at:
> https://github.com/avpatel/linux.git
> 
> Changes since v5:
>  - Rebased on Linux-6.1-rc5
>  - Directly add pmem.o in obj-y of PATCH3
>  - Dropped PATCH1 since this is already merged.
> 
> Changes since v4:
>  - Simplify PATCH2 by implementing RISC-V specific arch_memremap_wb()
> 
> Changes since v3:
>  - Pickup correct version of Drew's patch as PATCH1
> 
> Changes since v2:
>  - Rebased on Linux-6.1-rc1
>  - Replaced PATCH1 with the patch proposed by Drew
> 
> Changes since v1:
>  - Fix error reported by test bot
>    https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/
> 
> Anup Patel (3):
>   RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
>   RISC-V: Implement arch specific PMEM APIs
>   RISC-V: Enable PMEM drivers
> 
>  arch/riscv/Kconfig           |  1 +
>  arch/riscv/configs/defconfig |  1 +
>  arch/riscv/include/asm/io.h  |  5 +++++
>  arch/riscv/mm/Makefile       |  1 +
>  arch/riscv/mm/pmem.c         | 21 +++++++++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/mm/pmem.c
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
