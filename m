Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FCC64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+qpMakciYlDEplqo5Vkx5DRmtG4VtHQ06VxHXyrmvk=; b=VeBjloRRxxQ/p1
	2nHC1SruJq2bOVNNK8RitBypl5BY2z5jXKqz7pXQiKDuw/y0ucBCgbBDmWrna4lbuoktKSPnXITUd
	CQbrV9BKXYxCpa/7iq2UU76rYNPz8JoiKzXdJEoaHiNcKxqkjdLt8mWrAySwn3lAOBxYrkpjqnI3D
	Iiu8p+BGNPPzPnlt8LWJ7Z7/CFJ+VEujbIX4en27pmloxLgZPcYcbW2j1lcexIFG3s1ztdT5WXWCj
	fpXS4FAHVS6416n49rL8A71jIs1zTOnxcxqAIAz63u3m6O2elS/pvoemt6fkvqOq6ebGr7lE7Exws
	xfpWU0K2oQ2g3Q62imgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHHo-00Es9D-1f; Mon, 06 Mar 2023 20:18:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHHY-00Erzt-Sh
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 20:18:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BB5BEB8110A;
	Mon,  6 Mar 2023 20:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE70C4339E;
	Mon,  6 Mar 2023 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678133877;
	bh=ovaisSO9ZlCn6dh9S+udG+WRrE7AKHP3BafUX8BrrPo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ah7Ecli74vrlB34dEIVxVHICsXEet2SnJBv+SdUOYtPZ/cgcruoAmn9dNai7YCl/p
	 NahoL79aeJpxxe/rcQWPv6wxGPneZWGK4RIFXixY7yb/Ac15lR8pbj8cgBYub/SCKJ
	 65vLvgqZAg3bTjO8JweRm/EUCxqbbLUzd4FcG668nvVHx25Glv2D73y9mKpp6Yn2Xi
	 7DNlG7c1WlRpGHMDR4Gb22cfOFr8DI7QZTV09i97SR+LNuzfXF6ql4Tu47gHI7B7o6
	 /eVBClPmN0oKQP9gPPcH82jNpEdMyMvcKcfKdscCeUacDSWunCAiLlwOa4HOfCqVek
	 et5vySU3s+hXg==
Message-ID: <aeb088d8b7bec8929c7c9e9539a0b187.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230222124610.257101-1-conor.dooley@microchip.com>
References: <20230222124610.257101-1-conor.dooley@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: add missing clock driver coverage for Microchip FPGAs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
Date: Mon, 06 Mar 2023 12:17:53 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_121805_212954_FB7FA1B4 
X-CRM114-Status: UNSURE (   7.39  )
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

Quoting Conor Dooley (2023-02-22 04:46:11)
> When the CCC support was added, the clock binding coverage was
> converted to a regex in commit 71c8517e004b ("MAINTAINERS: update
> polarfire soc clock binding"), but the coverage for the clock drivers
> themselves was not updated. Rectify that now.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
