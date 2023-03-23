Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07738C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rq+Tp1+nxvEOX1V65XAjWqBkDwCAdozrgiYGuqs/aDA=; b=Zgg3B2jXUf/gh9
	rAx3A3h/sI9BUAuQqDycfBFlhaOpNXpzK6nSoxr3gu1o46eX+HXwJKvwls8BA6FyMWRug0jv/dg/m
	mHErECycC/JyQtU1IqbrqZ3XQbEawiVk9qrIogKUKnVu61hwqca36Mb1DLSfwCQ2hfvRehg4Vv8oz
	OYSSKMd7kleLF8BgHfNMZLX7rrUC7n5nvKLsSfoLrzObN5g6Ncyd9l94zjAWi2AJogD4zd8r5xFb6
	qPg9UdWaEKlyxctx6n3a+c85NWI5YjeuPpGhvT89ja/uZcLCwr5fwZAEKUlToe2U+gnFkBtvlUNIk
	BOH2TFNumcIN90yj9JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSAA-002yrW-1w;
	Thu, 23 Mar 2023 21:07:58 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSA6-002yqe-1m
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 21:07:56 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 12B373200928;
	Thu, 23 Mar 2023 17:07:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 23 Mar 2023 17:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1679605665; x=1679692065; bh=LXh8RcHlRytWdP5giYX5SGps2z/loe7CAU6
	6Co3XisY=; b=XQhz4LBIVZPTu92lzWNdTkm4qB9wdOsltzzZLdkPOoLlT6yYGHc
	XN+a5SM0Ihkz/5bLUHj/Orxabp2j/sV+kZH6+YdVRSJ/TB3nsiDih/6LGXOJyIut
	scSWSFuqnoAUiPGYM4GF8f5cOI3q7DvJI+n3hz4UpqfXqnCO9Z5FEI9hGxPvjHXw
	8RLhgGA9j8VwdrsvctXuQVLQi6l6NnYDqvTuAJAASSUanS0+7NT6pdPMt/D3pTbO
	IyYPK34bdbsOl0HeQFBFDzpNXH4uWPj9PuDRhce1dAPFcr0uZAbzn0LMClpfqIHZ
	n9ysRHghK6cMsQpUHYrzK1NfkDaotsHGVuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679605665; x=1679692065; bh=LXh8RcHlRytWdP5giYX5SGps2z/loe7CAU6
	6Co3XisY=; b=cpEQNvbE5hLlP++gVezAgQEgbsiuhx6dRxwW7PKr83NBB+M7pFV
	eWwmjkCMKqOuE6V0mkV4PZXhwwNBLMfSbiMGZgSvLl7Wx4Ek1yh2KGfMfvc6lgcu
	uza5xL4ZO0rb163/9UcZyhpaTHdM8mseUgFh4TLEDrwqFQH0jjNRcfgwiRpg4Kwf
	nFOEoI0fBXH8AmU8zaJvZfvA1Qa74h449BuBqH/sBi78tg5yJzS1tSG1FHq0xzyK
	oGXMGWr7CS3ZbUYBsBoRUtl/sDmiVrAl+jn54xCxRVNsjHrirMX9ls/IM1cYGBlw
	lhYHb+J+YgWbG/kuaHG+0DGtBsa1c+0hBmw==
X-ME-Sender: <xms:oL8cZN0DgW3OLroYtCxDwFYqR7FHjzuYwiKht8HgHLPt4iSzaR4Ucw>
    <xme:oL8cZEFPGQclA8D3sCjgsO36VS_L7VmSCKBos1QIQYSiIIJKeezmqrqD0z8qLMUZ4
    MWdTgQ-R8YdU5ADIAc>
X-ME-Received: <xmr:oL8cZN58RyjaUsF1u28KDWgrDi66e2-wg8EW4H5jF0MBq7igueVmfuRoGYZiElOEAz2D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:oL8cZK0KK0apa41-Seog06lFkBh2mBy9jsHVnabkuaNzgqKbl_8_IQ>
    <xmx:oL8cZAG-qqU2-r1ZYwACu7bNCoumI1Ha6e0XWnQ5zoKsdDYXtHa1-Q>
    <xmx:oL8cZL9oOnha_c0iuCXL5YPwF-QLzMrQSR5RnR8eXNTrXPAa5PyIXw>
    <xmx:ob8cZI_SsG43gGf1L1mme11VE_CPTfEGk5dB_B0LoRHR7VXurq9SqA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 17:07:42 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230323072944.GA18524@lst.de>
Date: Thu, 23 Mar 2023 21:07:31 +0000
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-riscv@lists.infradead.org
Message-Id: <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_140754_960683_64A6225E 
X-CRM114-Status: UNSURE (   4.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cgo+IDIwMjPlubQz5pyIMjPml6UgMDc6MjnvvIxDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4g5YaZ6YGT77yaCj4gCj4gVGhlIHNlcmllcyBsb29rcyBmaW5lIHRvIG1lLiAgSG93IHNob3Vs
ZCB3ZSBtZXJnZSBpdD8KClBlcmhhcHMgZ28gdGhyb3VnaCBkbWEtbWFwcGluZyB0cmVlPwoKVGhh
bmtzCi0gSmlheHVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
