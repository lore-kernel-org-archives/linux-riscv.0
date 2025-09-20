Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88904CAC597
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 05:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7Yh5wDts0GKfsfg1uqt3pMXhHwTeZ/PzV8GnpKmgmA=; b=amB3vKUQomKv0X
	GEEowsSyio9rqBklCLUsNrV7FRXgbR6qS61xq+RL4I8SMIBtVQxaXRJZf3pRrFUKAN5BZMkIvf8ak
	+G0y3/woSfk5gqlQEE8lofC5HHYGlyqVB9TpuWNdwKMoW53IP2EwUFWXhGge40eAih6P6T5Hm9/VX
	OIQvHkHQhfwMorFy9GE1MIpoB+kMQojF0MsdMVIZWJ1KYYFjMkKPX6tIrczxe2wmjuQHLub7Ya4Xw
	lKPdVcgVyKqex71V/tZuSZtV/8ghAPAWLf0sWEeflBGHUDYDHqWL392mDWA0TV0FJhovUnhqm3Moo
	Ggy1lJEpQ3zMiLAfyCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZG-00000004q55-0gi5;
	Sat, 20 Sep 2025 05:55:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZD-00000004q43-1TR2
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 05:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB6B84060D;
	Sat, 20 Sep 2025 05:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B319C4CEEB;
	Sat, 20 Sep 2025 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347726;
	bh=DYIeAQ0TLW3TMUkna6JF37DWFsPCSFCNfuE1sZ8Bbc8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WruQLqWWzr5GNtYoVTf08cnZotogSisGJxOP9X/UZrSraSa51hro6Jf/wjjtx0jN9
	 IAX59DO64rZQ2ZDqbEE0wKjY7BtM0taxBlWRS4oRdAfrXAAX0BPkhqk8cYyuHe63qX
	 iDfS459VL3yEitYe/WXWB8xTvcOT0GxCHp4dOwuexQ9fNCNOo8E5mD7xV/QNin9aHQ
	 HqmDA96A6PEyZICA6P+S9EMGJeamJL0WSaM7VFLmfbtauDy/CR9TOe0C43D1wUWqGi
	 j1FpeQmO8OOzlFEdfzNCf9ooorqtyoG6KHxbYIEe5r8XL6+wCPortZT/HusIPXCAQ7
	 cDuas2687yA4A==
MIME-Version: 1.0
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com> <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
Subject: Re: [PATCH RESEND v4 2/3] clk: spacemit: introduce pre-div for ddn clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Sep 2025 22:55:25 -0700
Message-ID: <175834772572.4354.12866225004369548359@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_225528_197790_614C90E7 
X-CRM114-Status: UNSURE (   6.04  )
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

Quoting Troy Mitchell (2025-09-10 20:34:04)
> The original DDN operations applied an implicit divide-by-2, which should
> not be a default behavior.
> 
> This patch removes that assumption, letting each clock define its
> actual behavior explicitly.
> 
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
