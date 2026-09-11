Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933CEC79FA1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 06:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkGbO0ZJYCayhGsDzb8zSJcpUl4CVnXMjamY4D/G7X0=; b=TymuA1aHzlCeLt
	n1Z2GkzgiWxljR6qS/stcFs71j1hlzQh1j/1XiqnaN1kMPpwGxHsiqh7QuaHeJYbVCN9BgSTpS0ty
	udeGz5BjeIDWGpo+HhTSHzG0gKRnD3uXQeDXfWFR07bEwUO9AGb5yxtXzilI5o6zHYQ3Cp+RWyvjf
	e9cJJnVr7atqrk3aWxbH2PuypJYbH6FuLVanRX4677dk6aKpnoMmcMbkKbPqPOQJ5aDLf6rDG/1wW
	t/iFkDaTB06+Aaj35W4xXUHE2DqgSRZr69oryfEqlCtsFkciATpM7ldn6OLtiugcArdDl2flgLO8W
	CDlXV2t4lCv00YUNOWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uS7-0000000Fuuh-0Isx;
	Fri, 11 Sep 2026 06:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uS6-0000000FuuI-0ucg
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Sep 2026 06:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BzCWIm9SHWefUAfRNuRqKetUCaMam98cRazVY0T6n/Q=; b=etwfiFhuD/GS448oz5wylOnjeN
	sG+59EC+8QHUy+19v6xRLE4bsJXnMx5P3DghdqRAUw4wX6bboyvNCJNQoFCnPXzs5HjXCVo4Ol5DB
	H3QUOMq/nc60a8aZKit1LgorO5GppHFBDCBEjVFgo0an8lakGdB0LuWvY0cKyRdSIdxNsiOyJlNWl
	rE+ztnCfayWIcsQ2/B3b5UWahlT5Wc0CrzUQgo0G9P89nsQj18KBu0ayefA7qw6f87YMG0FZQmfff
	iYRzQUDbQg1yrAbV4MndZzUhE4mvkZbh1jzQZkCvAMzEQ50tFqGF68s1X/HpkVR+gCCHGiWa74XXQ
	Z2hdKbBA==;
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4uRw-00000003HD3-1xnB
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 06:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789106942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MOdMMOA11nW6/J/W5UFmtmBK+Myeyrj9e4toNDjwVC6ozieasXr3f+Gddaim3g2OZAeFQRJuU9UugusvP3HdfByrZlAmNZWcOXjgFJtqD92zPZaMFi5AglvCYPahR33kuXXLGs85Gqjlu0O4EEZXQH2Gq+0QzzGjyCyDcOIzm10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789106942; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BzCWIm9SHWefUAfRNuRqKetUCaMam98cRazVY0T6n/Q=; 
	b=EHNXosPFiWD9gKtKX/rOoy0Aq0RPTa+lAyRI71yFewPwzVx6jrDCVloWAUhP33D+iJt3uLW1y7V0zdgvbqcWqRloTYD5oWMJXbtPMhKTNk8Q8jmVf3N8WBkK3VNbrYNxYgkT1MtxqYxU+FF+XMRRcjjyjxG+Itzu1xIpHWCJqYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789106942;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BzCWIm9SHWefUAfRNuRqKetUCaMam98cRazVY0T6n/Q=;
	b=EKdB/M5YRvPU4+d8P1+0AhgvguH8AVpGPwkMhjr+oAKdaz9S/KDjP3JkjXaerv4T
	NcbFZiYWds6qL9sDauM0YUpxpUAh2fnAMC0HyvxzAfF60bkx76FTbC2cA8hDqbrHclM
	Jxph0tnkk2lAiivc08DiQjMWfOyMwspreIS5IBqA=
Received: by mx.zohomail.com with SMTPS id 1789106940627378.773449342185;
	Thu, 10 Sep 2026 23:09:00 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:08:46 +0000
From: Yao Zi <me@ziyao.cc>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
	"Yao Zi" <me@ziyao.cc>, "Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>,
	"Inochi Amaoto" <inochiama@outlook.com>,
	"Haylen Chu" <heylenay@4d2.org>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
Message-ID: <aqOa7jnonuXhUoy5@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
 <aqKxMmgpFLE3CmQ8@pie>
 <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.97.79
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_070925_200173_1D4DDDA4 
X-CRM114-Status: GOOD (  16.13  )
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

On Fri, Sep 11, 2026 at 10:02:47AM +0800, Troy Mitchell wrote:
> On Thu Sep 10, 2026 at 9:31 PM +08, Yao Zi wrote:
> > On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
> >> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
> >> running by firmware can have a zero prepare count, so this flag alone
> >> cannot prevent set_rate() from reprogramming a live PLL.
> >
> > Would it be a better idea to simply turn off the PLL before reprogramming,
> > since protected by CLK_SET_RATE_GATE, re-programming never happens when
> > the PLL is required by downstream? This also seems to be simpler.
> Then assigned-clock-rates on the PLL provider node?

Protecting PLL from rate-changing when it's enabled, and re-programming
the PLL to a recommended rate, are separate goals. This review comment
only focuses on the former (i.e. changes in this patch).

> I tested this
> on K3: .set_rate() was called during provider registration, with PLL3's
> prepare count still zero while the CPUs were running on it. Disabling
> PLL3 hung the board. CLK_SET_RATE_GATE therefore does not protect users
> that CCF has not yet accounted for.

I think it's caused by asynchronous probing. The APMU controller might
probe and register clocks after the PLL one, so the prepare/enable
counters of the PLLs might not match the reality during the gap.

> 
> -- 
> Troy Mitchell
> 

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
