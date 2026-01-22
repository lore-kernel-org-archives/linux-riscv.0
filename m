Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D003CC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 04:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CczSn3fm9U2tHhPXNKOLDmpNTEIP37QwIHYl7pkiXDM=; b=jWPkm2zrjJO5Ir
	M6BWE9n+RxfBGw4n0WpS71TeDpYykGIRaawdc2Cx94bh3XNqjW4kgzQ+SqSzo5/dqQK6dR9ZGNCta
	exeiRUcnSw4+fvdryd9oN+PitPLCgd2hEj3kdTmcMgY6x/tu0Kl/2sJhyfTeGXUyX4dMvrS+K6zrJ
	N94OIbFBeltCbOzG2yLFrOkFsV119g7vFIxkzEizmmvOcLKWuB4GO4pmG0L4Js3FN0uKX8STxkLob
	Hrjs9/xDeubiaMZcobXFU+c8J9YiKMqMH8KHAHq0greghhqLRzAcKpROf7ot0v418TV6Hfh2LeLoF
	K1Q2YRQlM0BhSxnUpxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilw5-00000006PNR-00xF;
	Thu, 22 Jan 2026 04:04:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilw2-00000006PN4-264S
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 04:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 835BE40E52;
	Thu, 22 Jan 2026 04:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42ABC116C6;
	Thu, 22 Jan 2026 04:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769054681;
	bh=gNw4Mn93YzCI8oJeAeU0yYtwdWCHimW6oGNe77uKZa8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pt1CGfZ0vyBhrqFG0Gn5nrZ09yl5Sm3aBudEWgbbxzlxNpYaBja7iES2Y1J8u6fSQ
	 tQ/CbI9RwOnn/Lf79757S7W7G0X5PTI6+NcdPKsT6pDxvsKjaD0Kjv372N97PTZaDM
	 jHtZ9G2uaTHZHuVurk28yJiEiu3ccbQ7KH9FMghVgq9rP7GVKU2IqpAtGxO9zVVIMO
	 aFyJ8OotAKGg9SalUec5uuSLQhF2btQf5o1xDeI2FxM1GK/t8R6FSDYqS5Z2hzO2z7
	 GhPKpIcFkd2XStdGbLia0x0ukw+x+USb9o54HvqHis3iQEA9NqZdG8UOs1VsDNbvpV
	 MJp/yB0X9vCGA==
Date: Wed, 21 Jan 2026 20:04:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Yixun Lan <dlan@gentoo.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
Message-ID: <20260121200439.64c22125@kernel.org>
In-Reply-To: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
References: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_200442_567795_FF419B4A 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, 21 Jan 2026 10:17:18 +0800 Vivian Wang wrote:
> This patch isn't a fix for the problem per se, since it is hardware
> behavior. The new message and comments, however, should direct those
> running into this on new hardware towards a fix.

Is it not possible to improve the situation?
Is the refclock disappearing because of power saving?
Or because the link is down?
Because if it's the latter we should be able to skip reading the stats
when link is down (still racy but better than waiting in cases we can
detect?)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
