Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0683CC25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 May 2024 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+90PCw1QqB7Ho/rxXUKgNtRl65Khj2ZwDCHBuBr72kI=; b=trzdif6qo4HzUWQAYMwrZKGfQM
	zTL6rcEqEr9zEuhTl2nrWbkKKmWXfE6han5KFsyFBM1v+E2u73UGUrsOUMmy1iSqPCBy/OWJEE1pi
	gY0RA4queQuje1rxjQnPg6VyeO2bmc9FYHDp3KR0x1RSfJCz9oHw8psjzEAGY98MX/XqrGWTsfr9P
	vHy8UACmZA4In9j3DV2TxyanbIY83tBy1bFvaLcigrSTIkzpASL5Ue98T15bH00sn/upjVUyq1akC
	F8gdAQXU5btbJOCKQbtpiI9k+Z2qFQsF113IN652GRkvQzrwVOKgWjgA2VIHkqV+bK94fOGiq0mt1
	ErJGLnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6BQP-0000000AEy3-4AUR;
	Sun, 12 May 2024 15:47:45 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6BQM-0000000AEx1-1X4a
	for linux-riscv@lists.infradead.org;
	Sun, 12 May 2024 15:47:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03BA41C0004;
	Sun, 12 May 2024 15:47:28 +0000 (UTC)
Message-ID: <46c70799-87b1-4478-95bb-4d4c90519f5b@ghiti.fr>
Date: Sun, 12 May 2024 17:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/7] remove size limit on XIP kernel
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
Content-Language: en-US
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_084742_587067_A497BA94 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Nam,

On 10/05/2024 08:28, Nam Cao wrote:
> Hi,
>
> For XIP kernel, the writable data section is always at offset specified in
> XIP_OFFSET, which is hard-coded to 32MB.
>
> Unfortunately, this means the read-only section (placed before the
> writable section) is restricted in size. This causes build failure if the
> kernel gets too large.
>
> This series remove the use of XIP_OFFSET one by one, then remove this
> macro entirely at the end, with the goal of lifting this size restriction.
>
> Also some cleanup and documentation along the way.
>
> This series depends on
>      https://lore.kernel.org/linux-riscv/20240508191917.2892064-1-namcao@linutronix.de/
> to apply cleanly, and also depends on
>      https://lore.kernel.org/linux-riscv/20240508173116.2866192-1-namcao@linutronix.de/
> which fixes a boot issue.
>
> Best regards,
> Nam
>
> Nam Cao (7):
>    riscv: cleanup XIP_FIXUP macro
>    riscv: replace va_kernel_pa_offset with va_kernel_data_pa_offset on
>      XIP
>    riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
>    riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
>    riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
>    riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
>    riscv: remove limit on the size of read-only section for XIP kernel
>
>   arch/riscv/include/asm/page.h       | 25 ++++++++++++++++++------
>   arch/riscv/include/asm/pgtable.h    | 18 +++++++----------
>   arch/riscv/include/asm/xip_fixup.h  | 30 +++++++++++++++++++++++------
>   arch/riscv/kernel/vmlinux-xip.lds.S |  4 ++--
>   arch/riscv/mm/init.c                | 11 +++++++----
>   5 files changed, 59 insertions(+), 29 deletions(-)
>

XIP kernels are intended for use with flash devices so the XIP_OFFSET 
restriction actually represents the size of the flash device: IIRC this 
32MB was chosen because it would fit "most devices". I think it would be 
good to come up with a mechanism that allows to restrict the size at 
build time: a config? XIP kernels are custom kernels so the user could 
enter its flash size so that if kernel ends up being too large, it 
fails. And by default, we could a very large size to avoid kernel test 
robot build failures.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
