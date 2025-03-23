Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D7C36002
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ibVeSq6mmy0mnEVWYS7PmGvRgXpGuf4Rmueim23wY8=; b=sOPp73Zf83pGKg
	P9MaqVeXwDTwUTSWntRlEtW7fZGwXIiLTd8M+p5M5bsSx7yx1+xLHbAV6RHBPlL8dCGOhVDZKpNWL
	iWKMfzFwuKQlcwR0YqgDX+3h4jtyLGJ5OGP4fXTgNguEiN4B0MMWkcMo/qRpg5qyaGigDoKVl2PMV
	+Z/l2UzjP3vO7VPmtduJZLIrcfXLWBCA+TZhMlpi2lv9QVSL9dNnkH5xetNHmw9VA64j2EQmOch+O
	Ox+wA7zWZK1/ndO5wp+yjhImRXXVbb+vKzKTYxL4GQSVfz5LuU0l3YAbDpVUM1Gvpeo1aLlhCwyjW
	I2qvbL6zbfzFOpYPhiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twL0R-00000001E0h-3h6d;
	Sun, 23 Mar 2025 13:04:47 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twL0P-00000001E04-0zU6
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 13:04:46 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 42A01343513;
	Sun, 23 Mar 2025 13:04:41 +0000 (UTC)
Date: Sun, 23 Mar 2025 13:04:30 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
Message-ID: <20250323130430-GYB15267@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com>
 <20250322155034-GYB11633@gentoo>
 <45526855-17b2-4de4-8e12-6320b7d84c8e@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45526855-17b2-4de4-8e12-6320b7d84c8e@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_060445_302864_92A824E9 
X-CRM114-Status: GOOD (  13.27  )
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

On 07:43 Sun 23 Mar     , Alex Elder wrote:
> On 3/22/25 10:50 AM, Yixun Lan wrote:
> > Hi Alex:
> > 
> > this patch change relate to clock only, so how about let's fold
> > it into clk patches (which now has not been merged), so we make
> > the code right at first place? cause some moving around and renaming
> 
> No I don't want to do that.
> 
> The clock patches are Haylen's and the are getting closer to
> acceptance.  Let's not confuse things by adding a bunch of new
> functionality.  Get those patches in, and mine can follow not
> too long after that.
> 

I only mean patch [2/7], not all patches, as it's still clock related
but, either way fine by me if you insist

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
