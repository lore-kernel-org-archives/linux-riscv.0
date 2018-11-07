Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C95C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3762C2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEqAi6rM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=thunk.org header.i=@thunk.org header.b="RDN9QYKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3762C2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1EeTMclcl9vwwEN0vEhSkblcBqNJodkzmg5cXr0q3k=; b=FEqAi6rMdoAQB6
	7RYt72l+k8yp1IIqXpdEUUF4ba2DuzuX3X9YlE+tN8AHOlUSmwhM/pK6zlDNzzorvKDd87k5tWDvy
	FL6zUdi4qJxI2/aVFA+N62kegA0iDEpyYlM7XHtr7TqFcYzqwttTw10T5pPjdSfnymWYxKmW/sLDs
	HUgr12rBq0L7OJ1WSbTalqFVGIBSULbvCVAXu6a6sfGq3PW88WXHUdD3Os0MYPPQL022V4QifGr0m
	ClLUdluPq83yhnH+Um7p/9A6llnEZsG/79oHw65MrkFg8gHc3lua198dOkC1GMEo50DaH2l5Nn6A9
	atAiC5DLA10l6wKnpXUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKSvG-0000lB-EW; Wed, 07 Nov 2018 18:51:26 +0000
Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSv3-0000WV-Du; Wed, 07 Nov 2018 18:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org; 
 s=ef5046eb;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mDfzcpIVCyAnpr8CEjISU7iQqs+iG34FVggbrJC27uI=; b=RDN9QYKJ0AaLIoVql21liWIsHl
 YiS1QffjdyIEBtw24vXgANZSvK1eFyJHhvgGfx+cGUXsCoQ375mB4qYcsuW7g4GMdaL2QlRI+KbpK
 biVrAeEVEXqWzNKqBMPIESHMf5d2av7czTUGKwMV+RSwRuLja1XpTbsyzNaTnPeLYlNo=;
Received: from root (helo=callcc.thunk.org)
 by imap.thunk.org with local-esmtp (Exim 4.89)
 (envelope-from <tytso@thunk.org>)
 id 1gKSuk-0001ik-Cc; Wed, 07 Nov 2018 18:50:54 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 6B47A7A7D27; Wed,  7 Nov 2018 13:50:53 -0500 (EST)
Date: Wed, 7 Nov 2018 13:50:53 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [TECH TOPIC] SoC maintainer group
Message-ID: <20181107185053.GJ9919@thunk.org>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 Olof Johansson <olof@lixom.net>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 linux-clk <linux-clk@vger.kernel.org>, linux-gpio@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Russell King <rmk@armlinux.org.uk>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org>
 <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_105113_529295_6E57F5D5 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Russell King <rmk@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107185053.JBSwMyBEBAx-4Xp186eYm8QCtWlB567zdtQbmH7L5-M@z>

On Wed, Nov 07, 2018 at 09:35:09AM -0800, Olof Johansson wrote:
> 
> Tuesday afternoon looks least conflict-y when I squint at the
> schedule, or Thursday afternoon (but ideally not overlapping with
> Daniel's DRM/gitlab session).

I've posted a draft schedule, so why don't we move the conversation
about scheduling there.  I see a number of options that might work:
Tuesday immediately after lunch (2:00pm), or the last session before
the TAB elections (4:45pm), and on Thursday maybe at 2:45pm?

    	      		       		- Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
