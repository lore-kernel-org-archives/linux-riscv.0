Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABD1D30CFD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 01:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mePhhJ3n8nYAfa+eVpYwvsEy6svNIaEAyPAIfRkv07Y=; b=g3CCAAubcW8DLM
	cp6u/eR2CPiAAjCneJMqZTU5buecnAzWYq1PtQn0KdPK18euxZFoAd2+ElG6Y5PV+iaef5tZGKwLU
	TLCyPcAUS36B77JkVo1mVb5hV4tdhEgprFyG9y/PqqImLZm2DyONhPDSSNJ/5PowXQy6Tx9prYSKP
	lCuN+y8G1WyYLSlmFfW+rreqidbSxx/9Zm54M43TIYvkUPpYogEyDCgCDqFH6u5kj8AH+VrYfFuIm
	CAgcdjKIJDeC7k4T+HRWuOiFMaw+ZsgPJsl+glw2+aJZxMS/k2TlxOQbRewxHohIdw4a6bAq6C1Ft
	NnDeC85/UKk4pjRAmQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpoH-00000007wnK-258L;
	Wed, 14 Jan 2026 01:36:33 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpoE-00000007wn1-0zQ6
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 01:36:32 +0000
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 28D2D340E6C;
	Wed, 14 Jan 2026 01:36:23 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v4 0/4] clk: spacemit: refactor common ccu driver
Date: Wed, 14 Jan 2026 09:35:56 +0800
Message-ID: <176835246085.13007.17884535903023346937.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_173631_532018_5533400D 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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


On 21:39 Thu 08 Jan     , Yixun Lan wrote:
> The goal here is to refactor the clock driver to extract common part, and
> reuse it, so in the future, we can maximize the source code usage once
> adding new clock driver (specifically, for the SpacemiT K3 SoC here)
>
> Since reset driver register via auxiliary bus which requires a adjustment
> of the auxiliary device id accordingly.
>
> This patch will depend on Kconfig fix for building modules [1], and the idea
> come from K3 clock's review[2]
>
> [...]


Applied, thanks!

[1/4] clk: spacemit: prepare common ccu header
      https://github.com/spacemit-com/linux/commit/2b7a02c322922a37cc5fc15d055b794cc2193062
[2/4] clk: spacemit: extract common ccu functions
      https://github.com/spacemit-com/linux/commit/99669468d24ce21be12f3751e7381c47ab2c9ecd
[3/4] clk: spacemit: add platform SoC prefix to reset name
      https://github.com/spacemit-com/linux/commit/0664a46f93e2fb2f75fa05b5f08949600cce88f9
[4/4] reset: spacemit: fix auxiliary device id
      https://github.com/spacemit-com/linux/commit/ecff77f7c04141cc18ee2482936c96117060c0f2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
