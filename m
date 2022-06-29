Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF77C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k+gDEcNVxMU+m0DUYJrgKYG4yeSPo1IPGGcslyTpZiw=; b=1XmwCuolbaBCp1TwI88DQTzADB
	pC6qoew+j0pAH+8I/OGMuazGhjh7qUsTmo1Yc6y2NyQqoGA2yDMPsj5+jEz2RT2gQdRqj/5cfT34k
	R3bDIhuDNljJ6/tAMG1Np78d0RKoTjUrVnOCaotBRh4wdAMAObNe6RoJM2eDa78E2nqSDg9TsOIG0
	TC8cH89XTqIAYPLg/F9uWrmqChiR/NpzgaiMNp134qRKinbv2GF4fO9ZqQX/Jw1A0026rmH0B5Iad
	wgr8XLtbA1KxW2/AV2j1imj94lNovkvpycOHAcnrBKhBZv/8kUtWoYIxyiQKZRoJcRKFk5iDlbTv4
	NVdPZi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6MWn-008v4I-VH; Wed, 29 Jun 2022 01:30:01 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6MWl-008v24-Cf
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 01:30:00 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id B2926320029B;
	Tue, 28 Jun 2022 21:29:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 Jun 2022 21:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656466189; x=
	1656552589; bh=AXEjIB0EunPRYPNTHnXu/72xIuUpwUBfefYv+LYFhKA=; b=G
	qmrtRLhA4dXBrq+GXjSdXYLVvdTsnxe6CLbANT1451bjElKSxLK11IXY0uRLIbwP
	cfg2RKlM4yfrWt7dL3WhyFY9fZKKqMw8sr2ILiJnb8sAm3iZTUjaaP3V6Ioh+846
	NzILxCnTTsjB/s5qdZKS0GpWpLsV1zZf2T/01lvw7p93BFfjKD90YyGoKvIaTx0P
	1bBCAI3aOjKhsRI+dKWZHxeebyEAgqBW9nke8BqhNET0sSDNDDxfJJgmVBAtwLE4
	eA2ciHiSXa5jCZPX4tSDpTbomuQj94vbCZ2CW/7u5Xzjps3TmR8AWJAgV7N6x5ZT
	W2cKtbc3fn6y5T9wAO76w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656466189; x=
	1656552589; bh=AXEjIB0EunPRYPNTHnXu/72xIuUpwUBfefYv+LYFhKA=; b=f
	mcCBtXyXfdmZo3feQVsHY4E/QvrGAvwhz4IAkrWTqkPJAB/FypyoujxIAuPLehhh
	wzjfCRFjLKvoHYtku6Zz+a2CE+ts8czt4lk+AuRllNrTX9HNSlCynQHO0Hcsu8Xq
	D5VoNxQeGYHSZEGtn+aoLqGB8f5tHV723vMpntBSUCs0nWwzkSr3fgWsqWTy3cAf
	WZiOselO/ClHzYd7AcVrVf2Pyjzz4jZP46afmfTVpyb5o1vlYSV++LPa/9kDModL
	UP1YMb2pzBtpJVpxpPGrrQE/Bh6iOOfoW80IWomdncYIahu3J9D1s/sqj8f8HkuV
	hdT/3bA9g3JmR1ZfJZpqw==
X-ME-Sender: <xms:DKu7YmFNpE1ktm_1qYXghOYTYU47Y8DAfiOmABj_e6VCtd0vF2CI5g>
    <xme:DKu7YnU03GeAJGhYaElEuJR06jV4pxpuOZdd22fkLuds_bym7Js_gEbk_joHAPFOJ
    MYATC1Jdz08iTB4_g>
X-ME-Received: <xmr:DKu7YgLMH9lTGLIVg8FifbKnmKgakpCUI6Uv_UZm6kHWgOsrZBKGIuHu-n-8r9Fp8ll9IDO4Yu3CMuKuHSbyAPybfKwDPnMBsX0hdU-7ChScZUB-2HuMBDpjBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegkedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DKu7YgEVjxZHp2j4ARZQOHI-r1HLCxH-nPLYor_FYVswAVFerghlOw>
    <xmx:DKu7YsWb-p6XTrc22Fj4WsdXNk6Wd3Hs0_b2SOV2MStiJcZXJHM_ng>
    <xmx:DKu7YjPtKcn0Qx6Uv0QHeK_G0zGZMkMXRbSugStTFGNzlDaQ9GEMzg>
    <xmx:Dau7Yol6fhnxWH4uw6PG7GccnI1YZIHY-MT2x0EtO2kaluaenoiLLQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 21:29:47 -0400 (EDT)
Subject: Re: [PATCH 4/4] riscv: implement cache-management errata for T-Head
 SoCs
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, hch@lst.de, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org,
 rdunlap@infradead.org
References: <20220619203212.3604485-1-heiko@sntech.de>
 <20220619203212.3604485-5-heiko@sntech.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <3ea5c3a7-8b17-18d5-9f38-bc0dcd79497d@sholland.org>
Date: Tue, 28 Jun 2022 20:29:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220619203212.3604485-5-heiko@sntech.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_182959_510279_89A7784F 
X-CRM114-Status: UNSURE (   7.93  )
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

On 6/19/22 3:32 PM, Heiko Stuebner wrote:
> The T-Head C906 and C910 implement a scheme for handling
> cache operations different from the generic Zicbom extension.
> 
> Add an errata for it next to the generic dma coherency ops.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Thanks for the update!

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
