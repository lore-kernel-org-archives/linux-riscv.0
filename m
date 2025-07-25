Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD7FC83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 02:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBTzvQGB2JjRhhlx9Q7x2Ik0iyIFbs1iiFAtoCIXyXo=; b=Z69zKxkuOJAWa7
	15cFjb74ztJttXR+N1Rxc+2rA8sSz32Adl+TnTf0DwLbSYuLZ3+kq72YajHSG+hH1btgzOMehgeqz
	83V3q0Z2Jf+X5znGVhG7qUSnT2Pac67N0OIWD18c1C03Ct0I4YEhhBXAHXnaSDPjdnY7O3k0stIEt
	FlryTGCJpkfDi1LpXC6h3vcGdA+gJaxd2AgVyN8dv0daw8foeFoJseFD86OhGN3De4WlOU+Y5vv7y
	C3bJiJwakQwD1jv3IQJ5W+AS1ZnK7rQFTMFNmzOGGnSoxQsKHZuHFCrqlV2/37bTgGZLhSMQnQgtc
	Aj+7SgT40M+r89rsh3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8Ii-00000008uVj-27wH;
	Fri, 25 Jul 2025 02:36:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8Ig-00000008uVV-3hw5
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 02:36:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E76DE601EA;
	Fri, 25 Jul 2025 02:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92400C4CEED;
	Fri, 25 Jul 2025 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411005;
	bh=NcQNLpCapTocLDEkrklXTk9xmH7O0wOVOHF2U8L23PQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MsSbZw0WrGmeLdlsR73muQEXhDwRkjqEVCYIXt06wTyB0IiBfncY5gV2qvFT7Kdpv
	 PRo28nQZoPh1lepd5VteAn3PhMI8Ovk9NtahLcTtPRoBxbvaOQyoTJQmHdaz++Yz1a
	 krKXqy9dqbxRRb5ipx/Tmdk/6LBoMuOKs2x8sLK6NagJQsGN2xWFZ/XxTFyIbj8fbj
	 5zB5Kz7zfvD2j7aiTWarUMa4taUepCMVQ1nySoHBUOLLXeHywZFt+XHQ1o4xEz+Zy1
	 r+1LkJygl18AKwJrnQLrS4NTw2cC8zDtKUhde7vJSHwWPOQ9mhnw5jR0E41X0zyBH9
	 6fkGqtUx3nkyg==
MIME-Version: 1.0
In-Reply-To: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
From: Stephen Boyd <sboyd@kernel.org>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, dlan@gentoo.org
Date: Thu, 24 Jul 2025 19:36:44 -0700
Message-ID: <175341100482.3513.10826909212334043021@lazor>
User-Agent: alot/0.11
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

Quoting Hendrik Hamerlinck (2025-07-23 06:25:04)
> The function spacemit_ccu_reset_register() allocates memory for an
> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
> these resources, resulting in leaks.
> 
> Fix this by using the appropriate error handling path.
> 
> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
