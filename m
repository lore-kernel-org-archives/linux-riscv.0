Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09392C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCHQO9o41qD+MEsticSpb1t+trRvAOffyzGg3CfKG6g=; b=IOwrFbaESAQism
	cjhFNhNezEiRKZydzEHP/WAqmfwpFY2D80TMuE/g605KbfB8mBAd6EyiVfiF0VYuJ+EMm5SmwZaF4
	BTxaKe2rj6fBzx+MCc6HWtg59b+2RB/VfnuDXp24h1GzjbEgpPI9zP9J4+08QVO1nqRXzbSkbgR9k
	QSF3oaKFBu8zNjCSzyjl3Y5V7URmzkxV1uN7mqnBdSp4W1zDhxrNT+m6TmSRK7XA9mO83W39QdMcQ
	yLL71PYQpDqJK2mUab2a4pjPQBToCzG2xk+L2b1+pdE6tfERC5nhBUbkBJWiVDEMBfsDBSl+FThZe
	xdfNc32/dyyEWUAgt6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s4q-0000000AoYm-3vAH;
	Tue, 29 Apr 2025 21:01:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s1O-0000000Ao7z-0qYc
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 20:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99ADCA4C102;
	Tue, 29 Apr 2025 20:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0AFC4CEE3;
	Tue, 29 Apr 2025 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745960261;
	bh=Xesn+Je5Mt5M9tVGSEAzD09xDZ28m9HFOwV5V5cEVbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QSVJ+YKMOMuDSL7SK/i5TlUDSXmlvBk74EFl+c9cIdXMvyHk+rxzmIz0XXVuLV/Re
	 ZTb9Bi46psT00+U169beL/akE6eMtR7+YzZx810G5s9CitkVCP4pHbSmlcTdkZFnFb
	 2EAubpdSgSyPLmkrSBeWnSrjhbFdUvHyhv9kAgcKirx3pqRp0r27esKIEfOWAtRAJz
	 U6sgLQhQAr1QaB/4eVOElcHin4l+auf5ND6JNnGbVZ/gxVDAAwkHAYKCEUKcgT/Mv/
	 GslXYN87cvR/zVoAi5/C7MbLmAwDIkVjRF91fCP44P6QvHKCRmjxDg7qRTKOEVr2yY
	 J1Va3OXpW15nw==
Message-ID: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250421134218-GYA42923@gentoo>
References: <20250418145401.2603648-1-elder@riscstar.com> <20250421134218-GYA42923@gentoo>
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 29 Apr 2025 13:57:39 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_135742_308202_4529FC99 
X-CRM114-Status: UNSURE (   9.25  )
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

Quoting Yixun Lan (2025-04-21 06:42:18)
> Hi Alex,
>   I'm good with this version, but would wait a few more days for
> people to comment before taking them..
> 
> Hi Philipp,
>   Since these reset patches [3, 4, 6] are sitting on top of clk driver,
> I'd assume you're ok with taking them through clk tree? I'd plan to queue
> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
> 

No. Please put the reset driver in drivers/reset to get proper review
from reset maintainers. Use the auxiliary bus to do that when the device
is both a clk and reset controller.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
