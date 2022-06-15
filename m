Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E8CCCA473
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HuLS/8OIt9fJCTu8C+MdYC0jIBcdR4RTYWu9G8zlsw=; b=sFRmf8zTT5h+56
	iQTO5bKd8lT4kd9ZRyvMvDBd6vrUoQu8g9nocjGOxpN370CS5BiiwpdfLhO2v2mrTDlZRnKo7uJg3
	ELLlUTOzHLZmRlZDgNyN21l2RChHB8CeNhUNJOpCKaHZ9mZXh64aEfOq4txGP/RFRB+JJRTXSQD2M
	0YJaKGAQ27PBeXi2CZEjybIAOKJ5y0aXek766zvTk1xMtik7HudTvP4VlhEAdB35GPzPnLJq9x2jq
	Z52dnqC1XNINjLCqeZoGgaQXIm2J9TYyU1l5OIpmjrr/N8AAfq+lNAyM5IKd1y/9K8aEe0dZZx8L9
	0LwxboHymgzR0SZ4zYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1PtR-00DfjX-LF; Wed, 15 Jun 2022 10:04:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Psj-00DfQb-W7; Wed, 15 Jun 2022 10:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 781C660B76;
	Wed, 15 Jun 2022 10:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E08C34115;
	Wed, 15 Jun 2022 10:04:06 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:04:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, dvhart@infradead.org,
	andy@infradead.org, rppt@kernel.org, akpm@linux-foundation.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	paulmck@kernel.org, keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 4/5] arm64: mm: Only remove nomap flag for initrd
Message-ID: <Yqmukqq5E2FPz+/6@arm.com>
References: <20220614092156.1972846-1-mawupeng1@huawei.com>
 <20220614092156.1972846-5-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614092156.1972846-5-mawupeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_030414_078718_AFA9A809 
X-CRM114-Status: GOOD (  12.37  )
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

On Tue, Jun 14, 2022 at 05:21:55PM +0800, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Commit 177e15f0c144 ("arm64: add the initrd region to the linear mapping explicitly")
> remove all the flags of the memory used by initrd. This is fine since
> MEMBLOCK_MIRROR is not used in arm64.
> 
> However with mirrored feature introduced to arm64, this will clear the mirrored
> flag used by initrd, which will lead to error log printed by
> find_zone_movable_pfns_for_nodes() if the lower 4G range has some non-mirrored
> memory.
> 
> To solve this problem, only MEMBLOCK_NOMAP flag will be removed via
> memblock_clear_nomap().
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
