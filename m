Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0152EC83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/hznPkKyiF9YdFZyVKH1zQil4uMI7tk8rGsnXYNGebo=; b=FU5cALCm2X0Nmu1NBLKRstA59/
	XSaHJnWasGSzBCslUrmnl+KjcvZ5RqThMVDb9FNJIAnji6943pxOqdtlkQ7RP1waLPYVhZEUqywX5
	KFoXRAG36HLKZxT1IMnkjSbJIiKzSNZF5hRGInwEmg4MpboyGrWYzCKIL2u6+9uDG6eNNm1bxiLYv
	CiMgjqY4d5w0B+iV9/VI+ADfyD4L5I9eU4UKLj0YfIPjKVZkTL7ATJBmzUA6oQW8ulvkwLlxHw0yZ
	ZNFDCiSk6o56yhjzwf47zRKPOMVJ43y1+bgli4caYrC5WnOuAZPdJm9GXuvCyaY/KY99agvLvdEbz
	LDxdjttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRwe-000000043Dz-2U60;
	Wed, 23 Jul 2025 05:23:12 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRwb-000000043DZ-3xzS
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 05:23:11 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7D7641400225;
	Wed, 23 Jul 2025 01:23:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 23 Jul 2025 01:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753248188;
	 x=1753334588; bh=CROXlFb8ogf4F7x6KgK3ulj+f+G9vusMA6l6kVGU2aE=; b=
	UP4oXmLOU2sC9ucq32q0KDguiqYORm8NtemlW58gw7yb6JE5uKShkTn3OE98EMi4
	pFhH8DrXT8QuUPnPsAHF0a6/LiATpFxJPtnzgfIstlSfEBdZ0FZETov4h/QIQJ+C
	Mx7WMX/7xxAkIuWBsyK+ioJUvny+VzqpmdsHgjcaF//uQ9oozh6FoalsZjrqYDlf
	MBALeIbks7Pj4PG8KTv5FawXajh8hfCcmkatBxIP4Gvd16ldeH8hdNfuaNM19hQu
	ySYrs4JOoPAx+37L0MULMOpydhJCsnFE00Hl0vER9x0SeE0q1giR1gsxQdQQKuOo
	8xdgPB8raYlAo8KggBCglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753248188; x=
	1753334588; bh=CROXlFb8ogf4F7x6KgK3ulj+f+G9vusMA6l6kVGU2aE=; b=J
	cnDzOdNUBVGvES7XdpSXUmKRIHWLQ7NcKB6bcyvsBSq6Pt5/mQm63sr8EID2w6Km
	93iGMOojgt9n7Zs4APaZKI3lCGLNRbtxKVpRHSHTJ38j/2ddwJrdcNPXZdWH0oa6
	E51PPW/TGF24TN/aByDjQjM0u3riV5ZPQYzw8Y2Cuyi7bNGj824ez62XG92x9Eup
	MQ8PYbSqepgIycv+cVgpWpw+mCC8WpgUiLZO9nHuMF1Gl039QS/leIrgWhNRgzxN
	mN5RzMNXGHMQGSLHhk1y7v28/f7lVfN57kRNIPA4TwzVxUZjvKnhVGWJ3PYBfLss
	V+EBgIvX3P2+WtDKSp2PA==
X-ME-Sender: <xms:vHGAaKpAcxwpWhGiZtTs2Y7HsQzZgasIixTnrS6LI7v9dng20zK7ZA>
    <xme:vHGAaIpg2floEUJLPabcoNZcwfrA2BNo1-upN_9nvX3xy5NneHObcWhwVBa2Hjr6J
    47BhO7FHA8d6NMoXnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejieelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnuggvrh
    drshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhnohgthhhirghm
    rgesghhmrghilhdrtghomhdprhgtphhtthhopehlohhoohhnghdrsghinhesghhmrghilh
    drtghomhdprhgtphhtthhopehrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhl
    ohhokhdrtghomh
X-ME-Proxy: <xmx:vHGAaDiYghFWgEZOAzZ1FhPsNT6PSiQOJSw9CB49JHB_H9eY2dBOzg>
    <xmx:vHGAaBkcBHbj0LinhHzkRNs1ZfT-nR8kPLqjU4ZN0GL0dT3tN3tWQQ>
    <xmx:vHGAaJZT1v0ojIWUsvMBExk5H7pNI-sWmLuUHnUrO7QOkYdY3B1f5Q>
    <xmx:vHGAaMGTSDlu5hNG49-S8XeTiVgS8CYWKENTCmEKXGt74nNS8UHyRw>
    <xmx:vHGAaDP-1Xj97rpIJ_1fcyWffcPrLKKtOz4TqWp9dKHsdHRuWyjBXOtU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 329F9700065; Wed, 23 Jul 2025 01:23:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T807ab912e45cbdf6
Date: Wed, 23 Jul 2025 07:22:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Han Gao" <rabenda.cn@gmail.com>, "Longbin Li" <looong.bin@gmail.com>
Message-Id: <f8ca0ac4-9965-4fea-b9fd-47ab589792ba@app.fastmail.com>
In-Reply-To: <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
 <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_222310_489051_AF877DE2 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, Jul 23, 2025, at 04:25, Chen Wang wrote:
> On 2025/7/23 4:17, Arnd Bergmann wrote:
>> On Wed, Jul 16, 2025, at 02:31, Chen Wang wrote:

> According to your request, I have rebuilt two branches for PR (temporary):
> https://github.com/sophgo/linux/tree/temp-riscv-sophgo-dt-for-next
> https://github.com/sophgo/linux/tree/temp-arm-sophgo-dt-for-next
>
> Please check whether it meets your requirements. Both branches are based 
> on v6.16-rc1. If there is no problem, I will submit PRs using these two 
> branches respectively.

Thanks a lot for updating the contents so quickly, this all looks
good to me.

> It should be noted that about the commit "610f943a66be dt-bindings: soc: 
> sophgo: Move SoCs/boards from riscv into soc, add SG2000" on 
> temp-riscv-sophgo-dt-for-next. This change was originally made for 
> SG2000/ARM, moving sophgo.yaml from the riscv directory to soc/sophgo 
> for sharing between riscv and arm. Because this file will also be 
> involved in subsequent changes for riscv, I placed it in 
> temp-riscv-sophgo-dt-for-next.

Yes, that is fine. Technically what you could do here is to put this
commit on 6.16-rc1 first and then base both of the branches on
the same commit ID. We sometimes do this when there are hard
dependencies on a commit that otherwise prevent bisection. I don't
think it's necessary here.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
