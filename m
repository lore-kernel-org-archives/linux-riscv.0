Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F3CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a5JbI7WvA6yZt5x8rEzBipAPf478EZKpymgZHiLO0w=; b=SMQa5FP4aKsQ7k
	2VeBLGPwsOJyMRLsQq/0mGo7vTNseztnrXQaBCgmLOlTJZ4Cbe/fPAym5b86nEYPXM5OzPTlsguVG
	P26jtmg7pxKl0T4fLL7V9axaLkDqBNBtUZQGEq+3uxI5JHe0c1lgtzSafnl61aHmmzoTKecqbTmXi
	w8b4VqPBHwtg371ZkEBChXBhHHaTRWQbHpxxSlKa7z15lLHvCvrHQ3yzHuOAUI7oE5hTt8YZMduVD
	Jnwfe/AdeRB8G2g4IQwtq0NsDYkshKGpHc6K+m2zttCaPFzeTXpdg7ZKtzB1H1dGDPwWh1Id55ZVF
	85TGoorbYnGG6xuY0ZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2kZi-0000000Dyjg-1Ak7;
	Sun, 28 Sep 2025 06:07:58 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2kZf-0000000Dyip-01dR
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 06:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759039625;
	bh=cc31dHKQ97poTSVYFyMonuGh7mgdDdLkybwefE2Gb0Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=gOz/3bgeXJkZNV7fvkGEhCNKhRJhy3LPfbW8IgJ2vbz0LRa9mvUCBrGU0ifW/0oCg
	 8nSYo3vWmu7xHa/8cCyr4/nATHteH1Ttm36RpN/Zlojbv6zwOeDmZKWR5IDBg4Zs4b
	 5yZKRGBdhy6zsacreYlUb30NQ2umOBGoA/SV6feQ=
X-QQ-mid: esmtpsz21t1759039617taf35aede
X-QQ-Originating-IP: 6dN3nUS+saf+Q2aWdR6Kclb8uT4I3Xw3siwEG0sA9V8=
Received: from = ( [14.123.252.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 14:06:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7651757460385003930
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 14:06:55 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <4AE256D88658986A+aNjQf1whw2K1t6JC@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926111055-GYB1324993@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N+/GyfuFbcLiD9fTcUZPzBRZFFZUEfDHSUu0PCFgb69GACTJ6gtri+Ea
	IMN1JYDDkvZnBIvz0ii4qgr1o8DoWmjluu/2faiKAeBecIpPG3fvGR23JqU62vN9Zr1zVah
	eLLv+8x16OWwQFFm9SW+s6nJMIQNZGQTP6RVqqUtj3i0bzOvBN8+bXe+CNChPttioF+/oOm
	jCbf+sBtfKzeeAeBflYPfc2/14AAqCcQMqJJn9ahueFKcIONJhh8k3iRKvwZH2kiNEjV5p7
	RN53yyJblJShdyxtn0JjOZ4SGvmmF7JxsNQpPNAERhaRMhCeo0Aiyujvlf0bMti2hgmcgCI
	9rcND0c0hE4A0UYIuXm5tb9kU2pesaKOCNXIq8lqLYFLtJw9P+rZ5ECwEvtkfZR6iw/NFRJ
	komCwKBYC0AQqLvu5XtVlvnkhg1I3+DofRKR/2e00H57UujLzX157OeyF0WThDuLC5Xrvs4
	JkFcu2orbZJh1qc9n8jFmlk+/JVqK55Gzb64zBBO21EEPKQTE+8gc/N4MI6U6A6z39LfOZa
	7YhLHOndzLh8Sb4dM7+Zc7ETc5iHkgdhBPsmiu732KRq5i3dXrOWHNx5FHbSBua5f4H8sXq
	BMOZhT8TtPn2PgBhu56ekv3Ghyk/MfqL9QKIzp5wgbjn/UM22zOqOWTUsWGDlu4lL5SgBsV
	ENz+Xluv2O5kKQCFvORWNnzKYvCCgw+Y64jAGG9BMJasutcfiEoRmNVCoFKaleP+kLx2kkK
	2Kd7Fp6KjIaTnixksxsVJcF78cMhEiJerDqm4li21QQu9i5uVTiWQ9mNwlyGfNS8iclmwKR
	wcuswnS5CGKCqJNMyDPpGS2f62Ug1Dgek24EhnVZd7RM6a61caPeHr8aRetcvLJdp7qayqY
	SX247/cBuO8dKp4l6VgH4A9jh9wRnF3YLrjwiZiCgtyyYeLg8anaPsHH6m6MCg+iUvE+/cX
	zQTw7qtUDGwigMB5FfGrE7p9lEMPea3jYbr0FWxigH7tdbOA3HcNqswu0331OrcwblQzxRr
	Ii6EFZY/wXEzIwXoMSIubcTgsXVpW37lJOj8cYj5ly9Mjfuj+m16aShG0V+XI=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_230755_931039_D4D87AC4 
X-CRM114-Status: GOOD (  17.31  )
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

On Fri, Sep 26, 2025 at 07:10:55PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C with interrupts disabled.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 140 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -97,6 +97,9 @@
> >  
> >  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> >  
> > +/* Constants */
> > +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> > +
> >  enum spacemit_i2c_state {
> >  	SPACEMIT_STATE_IDLE,
> >  	SPACEMIT_STATE_START,
> > @@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
> >  
> >  	enum spacemit_i2c_state state;
> >  	bool read;
> > +	bool is_pio;
> using_pio_mode or simply use_pio, but have to say..
> 
> I feel it's improper to have this flag here, since it's not a controller
> level feature, I understand it was introduced to support aotmic operation
> 
> Personally, I'd suggest to pass the flag in xfer(), then propagate down to
> whatever needed, so it limit to single transmission which more flexible
I no longer agree with moving the flag into xfer.
Keeping it as a global variable is better,
otherwise it would affect several functions:
wait_bus_idle(), start(), init(), handle_write(), handle_read(), etc.

                - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
