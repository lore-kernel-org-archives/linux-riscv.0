Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75210606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwDZvJx+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=BcsHNlT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gnDXkEfQDnX6lexQBC9NHiMcKlkumKNc7fRihI8l/c4=; b=WwDZvJx+9Dr/7tBc/VPOYAG70P
	L7OuR+Ybp3BRp+zZvNbC9J21G8eHwJyHNmRbV6/1ID8cx318fPgepCPR8KgpjRSewDMzGPnEXshjX
	ULV53TMM9scONl2kauB3xGp3AoF+1TZ8JbqdknFchVboGwivdrQV87CgnND74VGlzy7dZ92Il2bHj
	Ie863r1m32BQTMHnNx4YGVaX7f2Her3WuhrhxrEcJpmXysdExtQwwy158aEAITu0Cedg0bmOMZ/25
	wFZeG6kByMrcfS9ynuP/eM+hzg7X8s2bHbTQzsML5bvcnXxzcQcZ5mjURppaoMGm14dbiOQsZdklO
	bUzJ3WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxiR-00000009A36-270e;
	Thu, 05 Nov 2026 13:41:19 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxiM-00000009A28-163R
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 13:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cayOl+ah2VntGuMKSFZe0/sOYOLHGMSfHTljLp1hqos=; b=BcsHNlT12nA+YrSs/yRQfTMO5p
	C1AEYURjocvZzLl7GjwphDEfRVdYqCD9RQ4WSY1RRadoooX7PEBQd2njIbSf0/8jAi5D8GScOyO0Z
	nQzofL3rkkHavZNegA2NJpWPSzvkTW65cBDV5gGUBpYYF1At8PsL5E957J0wG74iUl78HgOMgRWVd
	8krpw4mt0iFi6G3+l0/amB2R9RxV3H1IsBL4A7HUApVc9x8AdTicgmu3Kzm8VOt3JFnGSCilpsRyr
	TBApv+jFdlfxpHhRB+A8nXol+C281WEVBnrOR1udOBkiuXEDHDjppxGjcjT8697ze2O3nyo2UcxNm
	RKs+KCLQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOxhk-008XWA-2g;
	Thu, 05 Nov 2026 13:40:37 +0000
Date: Thu, 5 Nov 2026 05:40:31 -0800
From: Breno Leitao <leitao@debian.org>
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Tomas Hlavacek <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
Message-ID: <auyG7hGJtMzV0Gbi@gmail.com>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_054114_304776_5F8AAB0E 
X-CRM114-Status: GOOD (  10.03  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 05:34:37PM +0500, Ali Tariq wrote:
> The emac_resume() calls the emac_open() and emac_suspend() calls
> emac_stop() functions directly without holding the lock through
> rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
> with rtnl_dereference(). But since no lock is being held,
> rtnl_dereference throws a suspicious RCU usage on
> Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.
> 
> WARNING: suspicious RCU usage
> drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
> Call Trace:
> phy_detach_internal+0x490/0x5f2
> phy_disconnect+0x90/0xc0
> emac_stop+0x114/0x626
> emac_suspend+0xac/0x126
> platform_pm_suspend+0x72/0xe4
> 
> Hold RTNL lock before emac_open() and emac_stop() with rtnl_lock() and
> release the lock when functions return with rtnl_unlock().

This would work, but I am wondering if it would be possible to call rtnl
inside the _open function, when dealing with the PHY? in other words,
shrink the time rtnl is held.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
