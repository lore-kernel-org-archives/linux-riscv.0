Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F55D6AB1B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsrBYfN2/DIDmLFs/AFu+cJ9dW1GUvPX79MQ3iPRrm8=; b=gWPYJO+6fJKeMo
	7CjMcHsoqtkFIcoywlvK9Hmf6wjUbQdxKYKPEC6MbsyXkepTUWI3vK+pc6Hkin9P6lKUkKK3YOyAy
	ermfpdwCrte2IqWhXUm4HL948yILYfX6Lb5V41URdt0qLmxYCvb50x7HJ7IX7uKrRtdEtuhXwhi76
	9LeAfL/Mg1sXon5muqGPPjRxdXZhEvm7vMZgZnSyX6gzJTzGpeWKQ+HjZqbmJu0wtDtGmx9avBp2b
	wHlmsRGIIZz5ivDPG+gZQM3FNfNrHvfih7nA8La90eRpX8ZQwplcmnkYQBrzdg/DUuU1mtZIpSuZ8
	VNELZZlADsrb0esFJcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SDS-00000000y9Q-269J;
	Fri, 03 Apr 2026 00:16:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SDP-00000000y8u-3x1w
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 00:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCA7E42AFE;
	Fri,  3 Apr 2026 00:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452B4C116C6;
	Fri,  3 Apr 2026 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775175406;
	bh=nJRCuS1ixM/gb++UPGhHZf3hIcGTNYq+PUNd5HIN53Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDb8U9Nlw/oJEJOToA5jMnNzJLXrkuwEVyYkzJVipDUt1AB6XbhnR551DaQfXeO93
	 MFjozAow6sn8JZ3JSQ4GUMNcBK4QiIdMQBCiRUdQPBl6XGhK2lzgjGcd8XuSIfNaMX
	 WkqjkDH9496cIoEjiItuY8DDgmkP3ftdP2xNfQqvFDRxkhCAYgYY5pNvdnlRr4YAFU
	 /DpVqEFyZE113+oPFj11qOyxBRjj4QdAPznjxpCrb5mRa4gqirCyN9CB+OSeYMuzzX
	 xkv3HZQYtaZODhrCjTVii/WfF0OkG+Q0jefgIhZOy8HKsX25cicZquA2TQbeZD7KWs
	 rt8zS6Z2iTH5g==
Date: Fri, 3 Apr 2026 08:16:44 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Message-ID: <20260403001644-GKC1016296@kernel.org>
References: <20260402122045-GKA1016296@kernel.org>
 <20260402130608.133154-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402130608.133154-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_171648_004847_8F5F5847 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Chukun,

On 21:06 Thu 02 Apr     , Chukun Pan wrote:
> Hi,
> 
> > Can you work with Han for adding USB support[1]? this will simply
> > distribute our effort, and make the review process even harder
> 
> Sorry, I didn't consider this. 
> Could you drop this patch ([PATCH v2 3/3]...)? 
> The first two patches should not cause conflicts.
> 
> > > +	vbus-supply = <&vcc5v0_usb30>;
> > IMO, the vbus doesn't directly tie to dwc3 host, but to HUB's port
> > so I think this is still wrong, although it may work on the board..
> 
> We can switch to the onboard_usb_dev driver after it's merged.
Sure, I think that's a more elegant solution

> Keeping vbus always-on may cause unnecessary waste.
> I won't insist if you think this is wrong.
Currently either way isn't ideal.. but binding vbus to the host is kind
of acceptable to me, if no ojection, I can take this, then we can adjust
later once the USB HUB vbus support[1] landing in tree
https://lore.kernel.org/all/20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de/ [1]

btw, Could you take a look at Han's patch? if you have final say?
https://lore.kernel.org/spacemit/20260403000539-GKB1016296@kernel.org/ [2]

I'd like to push this series to v7.1, it's almost running out of time..

> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
