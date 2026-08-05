Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81B3C55838
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 02:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoQ08FjtP3LlMzMVBhQfWjUrh57+ztNAFonMXclGs20=; b=ihYuJLlBu8eL1/
	3Z+3yydFCxjTdqZvRrbrib5+dKqCwX+xUnIYVvXDybO2UaAlCDUsQmR+tfgNKY3MnZSBL8xobk4yz
	3fa5IDRCrJCOq81/K0MSgVzDhX/yiKZevXiXKIENJk/Zv9Do4RN/hEkgHXpGKegiCSb021y0A5Bnf
	foFEKwBoiht6FUvYlyLqz2DN3OsTkqcMa7941t26+N8BsDa0sL5YlRYZVIv1KfkZ/DXF+fE+uui8W
	TWIp4usAOf6CE6rUObkN3017JG6n78I+BF0QBwC1CvxNYHsL0kN7Em1YVK6xtk+Vcj2o13EatRvAq
	Wq9XCcPppxWL/cr2FRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRly-000000039Nh-08eQ;
	Wed, 05 Aug 2026 02:54:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRlw-000000039NZ-3aBx
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 02:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC26440337;
	Wed,  5 Aug 2026 02:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192111F000E9;
	Wed,  5 Aug 2026 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785898463;
	bh=hPZc/45ps7rDVjXO2mMddaftcA4mDvKoamKZkAuhllk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=HuNtYGO/2Ob01YuCIVm/dddAlh27D+i2ka8kFuPBSt6Vy/V/g7lAnNoL984SVSEAZ
	 cexbJqAuz7a0RvpPBO8pfw/7R6FWY66nsuGYjPm1s4SGmfEuakw8nvsFWMDPhwfa72
	 LMVN4p8L+Ct6yE6J1FRjhkLA/uZSAsGFInplu9achPhcItQ4L/f2vwSXEpkKyPfsfa
	 xmZgfcDh4h3q/m7bKzrQUiWJ0PbCmhIgoznA6OSg429XCjoOtJeO/6qvB34bwcHNYd
	 Dg5WUjFHB+CLt0dKKI93VCbbob3/1nDRQWMztg5/fx4qqEmKLUitJVpkHoFU7KesOF
	 albNdIDWgIktQ==
Date: Tue, 4 Aug 2026 20:54:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
    Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
In-Reply-To: <al+cTw/+z7xoJXxp@x1>
Message-ID: <55196187-178b-1f88-0947-1612410372e0@kernel.org>
References: <al+cTw/+z7xoJXxp@x1>
MIME-Version: 1.0
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

Hi,

On Tue, 21 Jul 2026, Drew Fustini wrote:

> Hi, I created my riscv-confg branches to shepard defconfig patches
> related to the riscv platforms that I maintain. The branches are in
> linux-next. For 7.3, there is just a single patch for the WiFi driver on
> the TH1520-based LPi4a.

Looks like this one hasn't gone anywhere, so maybe I'll just take that 
patch into riscv for-next.  Thanks Drew


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
