Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36EFCA17D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIwNQQ1hPOHaQ13hNhVG4KvnVri5PJLv7hL0bNFnR2o=; b=FQu8KYH472E0WX
	2YYf8prIBO1cDmcU6ksrTl/Ud6Eac+XviS1rzvSMe58xxd55W9rPbjXAdoHdcNp676VuPjPLDaVBD
	5Lp5QqMnI/ainw7hQXzGp+0jcuB6uJQaSxoI3RZrQff9BQwBqSNxAaFCOAgbyNpMRS7r5vXzgCcW7
	TKo4rpW76rvMtFVvUuKcRcSMvwK5JKajheLV5qSYsQ4ZGXcokI8VbYGFJ/FjfPKRLufgR4zEhm2vC
	75rvUDn5g3hpXnh5bzaPIxds+Jmkw4CiSyaPBGvAYu3cMiG3qMFPJzlUpHmP+jWQdvUqORSuFmGSr
	HHlR9gXS51UljoHFCk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgdS-0000000855u-1ASs;
	Mon, 09 Mar 2026 19:51:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgdQ-0000000855n-2etz
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 19:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA33A60097;
	Mon,  9 Mar 2026 19:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E8AC4CEF7;
	Mon,  9 Mar 2026 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085883;
	bh=tc/hXjaPOs4r7lYuxgCDxoSagD04bxl3JaOq+bwMeZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSQ52WVjThj/b4JXmo5ZzqQIQw7aHD/oVdg6NxD3iBrH1hcyu2WlidL5PYBOOyh25
	 SninXDJC3ov4Sr2ZHfBzhyVPgKBMeAuesm/YWDLfZ9DCdhq9n1jLq8/oFccVqWs1JU
	 fzCycZtwsOWkdIkeQ5VSgOfYkw5SoytrXt+ZIUUgkLHlFxgAuaM7j/q3boEISdwqWJ
	 wOJpxGHbCa6TIYlCt6MvnxabaPQ10+IxTBSy54pJCiq2g1OePgHJVHzHbvBCsCT/vZ
	 LUWAebNUzLu7E57fZffMmMltGMlqwoaRh4xEpEEn2hyng9+k0SzSR+aghvWXuxDou1
	 3f66n05QiPUow==
Date: Mon, 9 Mar 2026 12:51:21 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com, bmasney@redhat.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
Message-ID: <aa8kuXgxfqSWC2Yh@x1>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-2-6c9b14a4aa8e@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-atlantis-clocks-v8-2-6c9b14a4aa8e@oss.tenstorrent.com>
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

On Fri, Mar 06, 2026 at 11:12:18AM -0600, Anirudh Srinivasan wrote:
> Adds Atlantis Reset Controller driver, which shares the same regmap as
> prcm ( clock controller).
> 
> This version of the reset controller driver covers resets from the RCPU
> prcm.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                                |   1 +
>  drivers/reset/Kconfig                      |  11 ++
>  drivers/reset/Makefile                     |   1 +
>  drivers/reset/reset-tenstorrent-atlantis.c | 173 +++++++++++++++++++++++++++++
>  4 files changed, 186 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
