Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE84E668AA
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 02:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6+zM1hhFmFymbOzAL/VgxyjYD3BeMawVV9wIT2ZiaE=; b=Y/90CQD/fkUqp5
	WgnmvhznVqf6M1o+R76MbXaPZx3YGoE/Go/qgmm7jYNS3jkKiBwSvR3qcwnZiisauIVNwMU9YGr/G
	/5Yei7/QN4e8BJC76lTNTt7fYEnpmppRmiVMW3enS+iSL0CePJE5Q8FMNb8T9eoLCXK2jE4bPuDWG
	yu5v7MT/+Jqyhf9jXRgP6SFQz+AkpgapovlAi0AY9CTl95MBVIy6zewA4TvDJBiCXsXglxpanLDtd
	7DZTIqIhXDgMp7V3oJGAKzA0DXL3+vThfLwAfJjbSCxyN4++09TIKhKhl37U1FPv965vPWH6zC80C
	zXi38oN4Gp8NBJsn9uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWnBy-0000000BE4A-3P6H;
	Sat, 20 Dec 2025 02:59:38 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWnBv-0000000BE3h-3ohr
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 02:59:37 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8FDBD341A5B;
	Sat, 20 Dec 2025 02:59:32 +0000 (UTC)
Date: Sat, 20 Dec 2025 10:59:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20251220025926-GYA1962618@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
 <aUYMjAi8YIqValwb@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUYMjAi8YIqValwb@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_185935_976930_4B7B45CF 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Yao,

On 02:40 Sat 20 Dec     , Yao Zi wrote:
> On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module,
> > the auxiliary device id need to be adjusted, otherwise reset driver
> > will fail to probe.
> 
> Does it mean the reset driver fails to probe with only PATCH 1 in the
> series applied? If so these two patches should probably be merged, or we
> will get unfunctional commits.
yes, it will fail with only patch 1

and no, I do not want to combine them together as they belong to
different subsystem. it shouldn't be a problem if they are accepted in
same merge window, or if people too picky to worry bisectable breakage,
then I would ask reset/clock maintainer an ack instead to make it go
via clock tree in one combined PR

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
