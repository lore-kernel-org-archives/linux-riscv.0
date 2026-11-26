Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2787606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=32IjF/H+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mB1zVfI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FS0mM0gk5zCjULJwRbnbQrC3ZuZyTHC6iRVv6c/IVao=; b=32IjF/H+F8arGwEBl0QlSMkHdF
	BJc5O+rMPywTxwceemruBLlWaZ96p3c5Z+UITP/l9pULEjfOm1Mog3509hclhZizW8hOYtn1zPbUt
	XQCwcR6cxPb29hpVciXb971yIQfhOSVhZ+eqzLRvRaEux1xbOY1xDhKvGEkPWfXRHZ1S4lk85I007
	mxrS254sb5sl64F3M9VKb42I0EhGEZzjWvS4PWhm3pMbjKg8KvcfWXUiVwlQXWIW4Y3mY3AYL2jvp
	myAHfGGqVsZ5gAKYilZxhE1nb0sLgfwsU3MNa9K8uIkpG8M+5Jaz8eakWgjb/ElyFKGqpB/QC/MCW
	PyyVlbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSOo-0000000C93j-2wxZ;
	Thu, 26 Nov 2026 05:52:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSOm-0000000C93W-1Xwh
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 05:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8300261F4C;
	Thu, 26 Nov 2026 05:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178B71F000CA;
	Thu, 26 Nov 2026 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795672319;
	bh=JbegetZtdMJY0UH56qsA+4py+WjtuP90DgylLUgZa9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mB1zVfI+R01hF2zbBQpgEqOuzZm7P7/2DdcJwuDqxeovKJXk64nnnOjiX5OlQ45fk
	 GMNmS5fYcbULpgzOTMJ7LRDo+LFpPa+5feR3jByJIyXwmYLGh+oJtaNuBd2g2wsJL1
	 ++lsT/uvODPYCFgtfqlyGP2tWNR5X0m30k2lpSOpntrfDBogP+0MS3elU/RBKjnKpF
	 T16Q2NBpf4H1veqrcW2dEGGOTg8xHgbaWVMP2SXCW1AkjqpsSaU4gP7qXbnXNK5y/3
	 ydkzmxIo/lG4y94MrDk2vJJdHlQqj4HX13EO9/LyIV/ggPbQ0SLodSA+Ivq+x7pzxC
	 y960LSgW17mRg==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Date: Thu, 26 Nov 2026 05:51:51 +0000
Message-ID: <179567190353.1020552.6488313745742549977.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-clk@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 08 Oct 2026 02:57:54 +0000, Yixun Lan wrote:
> The APMU (Application Subsystem Power Management Unit) register region block
> not only provides clock and reset support, but also the pm domain management
> capabilities, so registering pm domain driver via auxilary bus is feasible
> way to go.
> 
> The series try to extend the CCU driver to do some preparation for addition
> of pm domain driver via the auxilary bus.
> 
> [...]

Applied to SpacemiT SoC tree (branch: clk-for-next), thanks!

[1/2] clk: spacemit: rename to generic ccu aux register function
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=92abd348af1882c1f91af67e6c66cc1e0a437814
[2/2] clk: spacemit: register pm domain auxiliary driver
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a2aa2b526090cad0199bda2fcf713f25cb15dd18

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
