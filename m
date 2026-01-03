Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3A2FC6180
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e29menuCgoGBpllBcMgwVAqoGi7SKcvRWAICBix6Czo=; b=rxzYlIuXj8cGgs
	qCrrimD3NJsMKr4XAM5aNrmRPp+39Sutn5bJun7cIVb1RjjjVstA+dPXWIg6+SWeeU/hPxvB1eyds
	nmlFhdA38XJ4BbE6v75oZcFCnLmfjwKs8KMWbq4ZWGW0cwbvfM9Ls46+X9KbEZPf58oxhOOE5LLZT
	rDFI6jU5G+SW457bU9q0ODPk7XDMD7HpGdP0+FtxNmBuvHL05cqw3guxjxa1GKAL9TBAutZL5jRk7
	ewOC8h7S06Ak7VNPUTTKD6B1ZCgl1ETcuHDIVXio5bN+leNxfATRrPrSgCIegsBULlBdkiQ4u4InX
	e8HN9QnnZpjBgG+6i5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9fU-00000009reW-1l2N;
	Sat, 03 Jan 2026 22:00:16 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9fP-00000009re9-32vF
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 22:00:15 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0ABC6341050;
	Sat, 03 Jan 2026 22:00:09 +0000 (UTC)
Date: Sun, 4 Jan 2026 06:00:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20260103220005-GYA2070627@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
 <aUYMjAi8YIqValwb@pie>
 <20251220025926-GYA1962618@gentoo.org>
 <20251224114848-GYA1993014@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224114848-GYA1993014@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_140013_672271_34A62362 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Philipp Zabel,

 I still need your opinion in order to know which direction I should
go..

On 19:48 Wed 24 Dec     , Yixun Lan wrote:
> Hi Philipp Zabel,
> 
> I'd like to see your preference for this issue, see my comment below
> 
> On 10:59 Sat 20 Dec     , Yixun Lan wrote:
> > Hi Yao,
> > 
> > On 02:40 Sat 20 Dec     , Yao Zi wrote:
> > > On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> > > > Due to the auxiliary register procedure moved to ccu common module,
> > > > the auxiliary device id need to be adjusted, otherwise reset driver
> > > > will fail to probe.
> > > 
> > > Does it mean the reset driver fails to probe with only PATCH 1 in the
> > > series applied? If so these two patches should probably be merged, or we
> > > will get unfunctional commits.
> > yes, it will fail with only patch 1
> > 
> > and no, I do not want to combine them together as they belong to
> > different subsystem. it shouldn't be a problem if they are accepted in
> > same merge window, or if people too picky to worry bisectable breakage,
> > then I would ask reset/clock maintainer an ack instead to make it go
> > via clock tree in one combined PR
> > 
..
> I'd consider above approach is less optimal, would it ok if I create an
> immutable tag for this single patch, and send it to you? so can be shared
> by both clock and reset subsystem.. eventually reset driver should go via
> reset tree, and I also know Guodong is working on new reset driver to
> add support for incoming K3 SoC, which means potential conflicts or
> extra dependency..
> 
see my above comment

although I've updated this series[1] to v3, the problem still exist,
for this refactoring work, taking this single patch[2] should be enough

but for incoming K3 reset driver, a shared header file[3] also need to go
with same approach.. as both clock and reset driver need it
(we could postpone this for now, and take action once things really happen)

[1] https://lore.kernel.org/spacemit/20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org/
[2] https://lore.kernel.org/spacemit/20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org/
[3] https://lore.kernel.org/spacemit/20260103-k3-clk-v4-4-4cccba2360f0@gentoo.org/

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
