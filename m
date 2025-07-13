Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E92EC83F1D
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdohvzFETzYoTINxW4vvK3RXAtJy4cjckB3KsjTnIK0=; b=ayEXBFaqdgRH0w
	iDd90jiS3HWn4Dec4Z42UGVieo8E00HH0KeiXGWLV9LnbHsMXsQbJufHgrzVNNb5W0SheJsYqyxcO
	oUry5dm+4jM09T1MPNX2kmAjEZmupuTJjoIGpGHsOFw0dXZ3eHyFol3ZAZVBjXx9+2HFBo/dWCgB6
	uHrLZwsMIBTdftG4oAKM62/dxko+aWjk2c73TymKilrPZHKwm4+tYPkkPcShtpe5BvbNcPNtG7coI
	Qz5VqyNX0D0XcJgBLeb7+klKhevuOPgIRa0jte+j0I0s0MovrTfYoNnSnD6a7goni+Ax9NAMB4aNZ
	3dG4D8i/UrIiqDLR/FLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub0AD-00000000QP1-2gsP;
	Sun, 13 Jul 2025 17:06:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub0AB-00000000QOf-1pQU
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 17:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 681E6A4FD1C;
	Sun, 13 Jul 2025 17:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011A0C4CEE3;
	Sun, 13 Jul 2025 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752426414;
	bh=OEZ7eLIEFl1LPSh8Fr+hYgEXUccuy8XYoLUfvat4/l0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BLiOSK48+OPpf6pNNiM/B9DEKnRTymJhOdyHgPRpL5CQ12I5bCS1g+GSDNJMuwOhh
	 04s0XFVwRNpQhZhaNW0eVwppGHfHgKDbPOMr5+ezfVrdicIKC1roDcPWkj2q/hGC04
	 QIQDyRDKRjrqx++BtIlqg9Jk9unSdJH+1UyS7SWls1uwYgANaB5Q9NmVPFUl7ToigZ
	 tP/dcYq6q38u81PTDhDuTsetaVNTY48gsA4giD91n4/MSe1n1uEhz5mEyL08mQVxSa
	 8eXMEaH+TkU16x6n1xl3I44ENC4aAFXazlaq1Leku83ELNbYjWIDVPBYCtXNgr1W/y
	 BnKnk9MDPk7HA==
MIME-Version: 1.0
In-Reply-To: <20250709011528-GYA487904@gentoo>
References: <20250709011528-GYA487904@gentoo>
Subject: Re: [GIT PULL] clk: spacemit: add changes for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Alex Elder <elder@riscstar.com>, Philipp Zabel <p.zabel@pengutronix.de>, Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
To: Yixun Lan <dlan@gentoo.org>
Date: Sun, 13 Jul 2025 10:06:52 -0700
Message-ID: <175242641282.1004940.6776191948188477776@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_100655_539022_CF7B1303 
X-CRM114-Status: UNSURE (   9.44  )
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

Quoting Yixun Lan (2025-07-08 18:15:28)
> Hi Stephen,
> 
>  Here is clock changes for v6.17, please pull.
> 
>  Basically, what we've added here are two changes:
> 
>   1) Mark pll1_d8 clock as critical to prevent it from being shut down
>      in the resource withdrawal path once the probe phase fails
> 
>   2) Extend K1 clock framework to support reset auxiliary devices, and
>      also route the reset driver via clock tree to avoid shared tags,
>      please see discussion here[1] with reset maintainer for more
>      details if needed.
> 
>   Thank you!
> 
> 
> Link: https://lore.kernel.org/r/3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de [1]
> 
> Yixun Lan
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.17-1
> 
> for you to fetch changes up to c79550f69f0f21be069385c20cd6490b862ba2a5:
> 
>   Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-com/linux (2025-07-07 22:07:15 +0800)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
