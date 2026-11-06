Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8656606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N6gWDpyZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=WLxq2Wd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b+aDZdxQd0CeaRbiKLWohyXEIXEdmy+0VGF4zojG31U=; b=N6gWDpyZXX6vrywsY6rCWfnJKq
	Y6MBhC0bVPOrnMweSeeaEuggkQTEpUqqaC5cAJUctkbEiO6x8lisz47DMjzrf7AeJKY2SWr4fFFF0
	OcGcfdBVYpCOOeWkII9knIfPjcA36Axsvemif0lH0xjzvA5bAV6RqsAPftapVGwZ8WzpjHIqJRDKf
	lRGy3s86pLYcbDMCxevhDVMvYXlFuF8DLVlerS7XYzHixQ8a5hRIiUEbsJMgLkvmCj/JqA+rFJR5P
	U1/M6nqn4CXCp9MAoVmmUD61CJxiuxw1EfWfFKfaSSPyeLALgdgOmdHLHyIkVUAgyU43XIXtF3quC
	2luromMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIWp-0000000CEE4-3TDv;
	Fri, 06 Nov 2026 11:54:43 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIWn-0000000CEDM-0pI2
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 11:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pB0iZgKEny2fvSR6eS1A0tzFJUrMX/Uyf3/srhOTE2A=; b=WLxq2Wd/hptJdFC/EzGqrSGlvq
	yIsyA3/bgqiOO7kXsrqke/n5XlMt/7rMp5rvXYbotyo3YWNAx4jWx5ZyUKaDhyzaHA8TGjvkQnoC4
	b+rPKv93sD7Q3rDWIRvszfrCcPo1ljWrB2BEiRjk4sf67HZKIKvePdGc4LKqsq8GmuJWx70+yIVvK
	KGjgOKsduh09JDUqgNgCZbOVPeDyn3J3pdbuKCHA+QJcYPDueKIiP3ZwFnfCT4PwFXKu3ncEQYe5m
	47Q8IKHNhMeeqo3oM51IHdG3WdcJg30YMCtu/3tjuvktCpGmXHsqDXJ42Rp3oPveLqIh9fGGIhtDF
	gl/MdH6A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPIWS-009GUp-0P;
	Fri, 06 Nov 2026 11:54:20 +0000
Date: Fri, 6 Nov 2026 03:54:14 -0800
From: Breno Leitao <leitao@debian.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Ali Tariq <alitariq45892@gmail.com>, netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Muhammad Bilal <meatuni001@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
Message-ID: <au2_yS85zJYqOaYm@gmail.com>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <auyG7hGJtMzV0Gbi@gmail.com>
 <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
 <DMO12HWY5N64.2IJ5XMUKM8WWR@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMO12HWY5N64.2IJ5XMUKM8WWR@linux.spacemit.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035441_236884_9164DC80 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 09:41:31AM +0000, Troy Mitchell wrote:
> On Thu, 5 Nov 2026 23:28:31 +0100, Vadim Fedorenko wrote:
> > > This would work, but I am wondering if it would be possible to call
> > > rtnl inside the _open function, when dealing with the PHY? in other
> > > words, shrink the time rtnl is held.
> >
> > +1, especially in emac_open() rtnl is needed only in error path case
> 
> emac_open() and emac_stop() are also the driver's .ndo_open and
> .ndo_stop, which the core already calls with RTNL held, see
> Documentation/networking/netdevices.rst +214. Taking rtnl_lock()
> inside them would deadlock on every open and close, so the lock has to
> stay in the PM callbacks.

That makes sense to me.

Reviewed-by: Breno Leitao <leitao@debian.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
