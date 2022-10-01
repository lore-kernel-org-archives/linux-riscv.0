Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE93C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Oct 2022 19:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1cPEkap7NxFqtzvAV6wjj8Yv2TvjesEwRXFm3INhJI=; b=J3UHvgt6bd6iPi
	x6kef8KLXDXaqIxi4h+E4WmWt2A5x3s9NzwVqNt+9kxqUC61MZqVNbbO89jOrS+tTC3C5nGs/lYUO
	NmAVf9Zsngu5CQMJHixBoeBqofhPTtthPOVRvbRm9NBci5fcZLLfxkWUe4uJzI4sbglV59FrQp5Cf
	fFH1UCNWFCnq2IXu+DB6xaZDnecYij4naQe9vH0/8VdVVgzh3ClDENnBkB56GZjVSsI8W5aZl9nHq
	3YwR76inK0/GmnMc0LrHW8PToUk9IeizDK+8PNcX0/30OAkbx1eW17FVlayKQT8TZNLA8nfFFZfQx
	c7h2lrUwsaNlSlt7+LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oehim-00FjPn-1t; Sat, 01 Oct 2022 19:00:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oehij-00FjNO-1w
	for linux-riscv@lists.infradead.org; Sat, 01 Oct 2022 19:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 22F3FB80880;
	Sat,  1 Oct 2022 19:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180CDC433D6;
	Sat,  1 Oct 2022 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664650811;
	bh=g4PS4PGQJBvGxQS+muhT3nqQSmiyaQFW9X6VLT0SfSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqdQt4CO6xuIv0ntyDctjy7mqYLiWj0Zefm5nOmEcUaaT/fzRksPAKOVL9aZS2iUu
	 GA4v38gxcQATJzoDmz/zyby+B1LoV2n1Yhfr17fISUWUK/WA6z3tXIRu4+xSNuDYTt
	 87SKJWYGMzcuuxDMovwqr6mkhVGwKAQrfbMhNtBF5EMW8RpAOd35xk8ndUMWTkloV2
	 e3kRtJDSpJKBwAWYmM4sB3aEixtxdMIvqtvEUc6oiOqgIYgnGhNZY7f692yCUQhD5s
	 zGtXPx+SGvF2JS9REBkQpuC4/xE4rAEx4qXT4e0KLssQ9usTB+ie9tQe6zIn9ZBSx8
	 cGbJKgfXMqtVg==
Date: Sat, 1 Oct 2022 20:00:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and
 HAVE_ARCH_HUGE_VMALLOC
Message-ID: <YziON3JMobFOyaqV@spud>
References: <20220915065027.3501044-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220915065027.3501044-1-liushixin2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_120017_273920_192CCA25 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, Sep 15, 2022 at 02:50:25PM +0800, Liu Shixin wrote:
> Since riscv64 has already support SATP_MODE_57 by default, it is time to
> support more hugepage-related features. These two patches will enable
> HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC.
> 
> Liu Shixin (2):
>   riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
>   riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT

Hey Liu Shixin,
As I'm sure you saw earlier today LKP randconfig testing of linux-next*
found a problem with your patchset, but looks like it should be
trivially fixable.

Thanks,
Conor.

* I accidentally added it to my dt-for-next branch, from which it is now
dropped.

> 
>  .../features/vm/huge-vmap/arch-support.txt    |  2 +-
>  arch/riscv/Kconfig                            |  2 +
>  arch/riscv/include/asm/vmalloc.h              | 18 ++++
>  arch/riscv/mm/Makefile                        |  1 +
>  arch/riscv/mm/pgtable.c                       | 83 +++++++++++++++++++
>  5 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/mm/pgtable.c
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
