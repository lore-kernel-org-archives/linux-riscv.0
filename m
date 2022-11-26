Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71921C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 19:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PU7Zc07vZZEKdwvJbghziSH/gt70Zy6aYk6LlWuNgsU=; b=hG/W/mizYK7Iy2
	FBUMv40WH+4ZvI5Wc8o0BlRFmEDeb9cohKvWos8hsVZU72sReCfw5wtl5pqzjIR0Irc5sSewqfgDH
	jT4DbhBRe26ghTKvAlFxNnzuLicfNvpqmZE6HFQ+b37vKA+4yVQJgIKBqMgQojoGb8c2N1AaPQP6Z
	MDFbaGBLyCPcwZ6ybU4yjs5fvl92xUq+lnKRaTGXe+KQiBIQQl8VuG5YyDlCuI81rYnh1YaXqx9sz
	5d5aGGvaPzzAm9c+9dXN832hrsUKYp3IzhfEFTesQlNPPFXS1NRBwsXAVCyfXmCd/KSKnFaDAY4hG
	qB4dKzjdNOrAwMRwG8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz11E-007yub-JL; Sat, 26 Nov 2022 19:39:20 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz11A-007ytj-S4
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 19:39:18 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D81D75C00B7;
	Sat, 26 Nov 2022 14:39:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 26 Nov 2022 14:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669491555; x=
	1669577955; bh=0Xacy2MFR0NStzqlX4jQQv2QXRX4Mm2Xkg6hMAxNiYI=; b=F
	aIpojefdjZ3ipXpZo6YTdFlE8vmSfNU+qvhPx11yUpypsLhSfRRHV9vQCzBDYfWw
	a6UnSfXp3de5XiI+TifetoH0sVuJbY+vkNskFe51z5Rhz63JQRJUSS1HmhA+cK+8
	sHGLeDzA0KKBYT3k2F4NuHKYucSCEli+qHzoUn4B8UIrGkKZ8PboCZVskRO3pVWf
	0exUdSVdLU7t8uBMUYNqIQNDc02M675KYOXb8PHryTmI23eHTQf30iZrE8Peddzc
	qJ4d1uJuhz3MbNLq9Wx1VtUEnICMzkuhU72GfgdpLqn7xLpz+G5bCk6Hf+FYodUT
	e11jKA5oSqv+2rAo5fsJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669491555; x=
	1669577955; bh=0Xacy2MFR0NStzqlX4jQQv2QXRX4Mm2Xkg6hMAxNiYI=; b=x
	HYqKe2eD1pbU8yOC7ItQNuXwKAOuFgiqpeEcO5uvpercZ44w5cEuNY79Z5H9yci4
	OZnVhT+NJIBMdiPR92QT0vWoeg3CKplMpIy4KdLQf+QxW7Hv62WuavO9mmjULAh4
	FWQKxeL4+oa6WBVqrLTjgVerEWqyLxa8xzWJaFnL/R9X3cDcp85G5iNSbQ1UuTgg
	nnYReXr0YYjG9H7WJ935TLaFrWH1QAqkSErl9Pk3AJkbsJ5y0CsupHk6P6beffE4
	RSyFT91gEvfL0XiJLTCJwLI+09B/txo3K5u9Yh0EELhlR4DCkTZ773bRzZwiqgnV
	DDSYPxwpmpFgmTWa58NCA==
X-ME-Sender: <xms:Y2uCY-OFQy8GWAooGDbwA8xXQE2OSmoxikSRT2dKKNPwO9FDUawSVw>
    <xme:Y2uCY88PRFlItwSp2iqBk0bK-DS0_F0chGnScfSkXJ_yp0-URtHIBc5K6E5VRLbId
    4J86XXzpgMUDV1JSA>
X-ME-Received: <xmr:Y2uCY1QNYzQcUe3wnuxTZbit26VXpDjbIicDfw83wAkLWWrjwXUqXqbi08jm5fN7poEAo5_3pmzSaQKvizZGjOp_6floU-8rz5n8sA2bDPz1B8MOR3TGkWAjqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieejgddufedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Y2uCY-uQebIl79PaIlW3vUggSs2u5lZKJl7tm91i_vzNChaK-yQRTA>
    <xmx:Y2uCY2ea3dReSJp7QD3zyjL5MKd1V39EzbEexNjETaQzlc5qLeA3UQ>
    <xmx:Y2uCYy3k7eRYiPvUgIeeXFkGlmEa8WAoiiH3Z093JpXf5GGKvsO6Ow>
    <xmx:Y2uCY27CkCtxy0FZDlOW_l4nJvPbUd9qC8fjc1Zo1TjLDSb2-WiYtw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 14:39:14 -0500 (EST)
Message-ID: <f9039589-410e-faa9-fc7a-b1e71039dae5@sholland.org>
Date: Sat, 26 Nov 2022 13:39:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add comaptibles for
 T-Head's C9xx
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-2-uwu@icenowy.me>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221121041757.418645-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_113917_160841_611F9DEA 
X-CRM114-Status: UNSURE (   9.86  )
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

On 11/20/22 22:17, Icenowy Zheng wrote:
> T-Head C906/C910 CLINT is not compliant to SiFive ones (and even not
> compliant to the newcoming ACLINT spec) because of lack of mtime
> register.
> 
> Add a compatible string formatted like the C9xx-specific PLIC
> compatible, and do not allow a SiFive one as fallback because they're
> not really compliant.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Samuel Holland <samuel@sholland.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
