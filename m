Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DDDC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aF9+5QwU4IwbINv/J3y4zMfsQTeQABf5yigs86O6olA=; b=MPjEdHDl0YLeQE
	Ls6qjn9HTqvH/WJYtBohyqW/pZXdZdtZ9vcaB5CLX2rdsLxlEJhbo5ueb77TvZ8J2IbSWNTEFK2uJ
	s/Yqx7Jfjf+5TTY0Vge31xYGQqyElHSHk4pqGLk6f5IBfzQ9zyo0P/nfRvsXWG/GePfQeq56WoxGk
	MuoEw/IldBCYQqeFK4b1ZtYngg/u9Vo5YYEWPtNBszuMsYhWhuRZeu+4UAAVVJcFKvaV6qaOxP52/
	Cg54JRDPaFmUOab2mJ0qI+vUXmQoPPCzNZHGTBMeaqfXv8dwiorrxxXX64eZLiogmTRHOcz57u3EK
	G+O3Z2Gw8dwAi691fETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJjQ-00000004smj-2brQ;
	Thu, 02 Jul 2026 15:53:40 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJjN-00000004slm-0T1x
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 15:53:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9E7DD200EDF;
	Thu, 02 Jul 2026 17:53:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjK-005lg1-1j;
	Thu, 02 Jul 2026 17:53:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjK-00000000Fe5-1uow;
	Thu, 02 Jul 2026 17:53:34 +0200
Message-ID: <ae1e67ae363956c1df695213c13f2463b73dfa72.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] spacemit: fix USB2 clock and reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Junzhong Pan
	 <panjunzhong@linux.spacemit.com>
Date: Thu, 02 Jul 2026 17:53:34 +0200
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_085337_322500_006F6892 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mo, 2026-05-18 at 02:58 +0000, Yixun Lan wrote:
> In current code (v7.1-rc1), the register bit of bus clock and ahb reset
> for USB2 were wrongly swapped, but this didn't cause any problem, because
> from setting the register bits perspective, the de-assert reset operation
> is effectly equivalent to enabling the clock bit, both of them will set
> value 1.
> 
> This issue was found during suspend/resume test with vendor's internal
> kernel.

[...]

Applied to reset/fixes, thanks!

[2/2] reset: spacemit: k3: fix USB2 ahb reset
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/?id=1ca22c6aa006

regards
Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
