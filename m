Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E708C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwP/fV/kCDzWNlWADyJ+2ihiK3wwLHb6BznpxDAdlEA=; b=FTkSPnGUCxwAG3
	p0rS84KMAI8w+EtDkNnhBs9lunWTI1Ps8ZnfmiveJR8KiefVMjc/5bMwKuYtaJLptC6gW9SsrX/BW
	9y/LcHq194w+3ljWKatbbbJuwbSQMZV5W7yKrN5YGGxZllWqmTKap3mEeryItE9hyadD8C3kufv4l
	OA7e94psZHnEfFy0BhQofWve1qzU6gFRJiYPMtEk53OrdV29cME11skG1E+O9oZyriPN3KIMcPGzG
	PTSg9rxvkJiEFozx+kZV8r8GSpmqHS/Vv8A7gp4HXpIa/NuSV2X8/Hka3qo0cnDyPfYLLHAPBQ0tM
	MYTDOCXqFhP88LUupinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBbC-002Jui-DX; Tue, 24 Jan 2023 05:11:58 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBak-002Jm5-5S; Tue, 24 Jan 2023 05:11:31 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2A836320093F;
	Tue, 24 Jan 2023 00:11:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 24 Jan 2023 00:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1674537083; x=
	1674623483; bh=FL4EH6QJK+d1XgoAroJrgotEkmtGHshewgrLCi3uekw=; b=r
	jtn/0FU/v56BlVNeisMMSPzODrC9lG+vIBgyK8yUBQYEnvi+NSW1PhRiWEWejf9y
	DBMts3ZbhgxCteSsaNrAbsrx3Lxx1vD3+Q+vSVME2JDSjsD+dERvQV14dttsIhE5
	4I5s9vH/amlpFzbVz03tX1gG2G5xbR5L9HQvKRYvQcxrzMBcTJ7GpKwDD//B5JHO
	UxJ5bY8pXReNk+13UuaMxtYSW/rYhKkoMSLwiUz7iRz33r/ES8RC+0yN9XygSY2G
	Baj/nMmnRVz+01qT+5NfcTRwO03mb2MSrC3QWFpuPqvioEM9lZaZ5u7utsp7Tg2W
	fFFEwBKr0ikIxckS9/m3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674537083; x=
	1674623483; bh=FL4EH6QJK+d1XgoAroJrgotEkmtGHshewgrLCi3uekw=; b=i
	odecc03ocFIbjUEYEowrzdz0krD8bba7o8+vnGpbpBYspcuqu02fQJaKkjIBxFsk
	GsVLWdT74zXF/d2NvlNGi8BENIkVxR4a/d6FLEBRZhvhihCXPRp8Ky5GB7A4Ysd3
	St8gM1tL03X1icXX9xEHlLplIubOWGv0+1ouPYmJYR5X64YObQzcDrjK6ZMJEttU
	7tReJrl+url8zt6QsbTOsAmrMaev/MHJHKQpxejPR7P9oesjIkAycZpzxsfOQaS9
	MYsD39/531WjGI30fHjyJQL3oNj9aK+hy7Tq1KKGZ/wu7FD/81fCWnK486mDmSQC
	bp32Kj2BqLkYT3h3t+MXg==
X-ME-Sender: <xms:e2jPY1iz9LZz-HZ8fMgwNQ1I9lgPn4QkKZ_bdijKT87dl3oSxbBdaQ>
    <xme:e2jPY6CIZ6wKxGCD0qFydX-9PWjtGI5ROGEOOyf_eLVTFiQmh6RKGELOanG7IXLIf
    Liz6ZgeAvv0FA0aWA>
X-ME-Received: <xmr:e2jPY1FEtRewVLA-CseS80ahykYUqa7mNJt84yyMZIixWmKuBOPV3C6PSso7wHMqAlOsZtxWu7TlAp6yUWkGlQ8OC3LxJp-wge2d9Zv9fg_mGPRtoWEHuypYEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:e2jPY6RIHnG1EUqXaC3ACprutbwXrzsJkoSMFBvXOrE7FVFTVWkTcQ>
    <xmx:e2jPYywKnMpkbb1B4hxUMyrqWP98vX9ORFVTLs90GVRcQbr7vkzpnA>
    <xmx:e2jPYw55Cn94tS4s1iUFh1Eke49XtFb0udXx6Er5tEjsc0LeR1G5ug>
    <xmx:e2jPYzomzZAebvz0EzYzrvupHjTo-qOA650_P1omIPpLDP9FJqGp3g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jan 2023 00:11:22 -0500 (EST)
Message-ID: <9d61bda2-17ea-723d-7fee-e911061054bc@sholland.org>
Date: Mon, 23 Jan 2023 23:11:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <0c411b60-1d12-1c34-0f35-5e38d38e2786@xs4all.nl>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 0/4] Allwinner D1 video engine support
In-Reply-To: <0c411b60-1d12-1c34-0f35-5e38d38e2786@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_211130_505229_EB7FBCA3 
X-CRM114-Status: GOOD (  11.42  )
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Hans, On 1/23/23 06:33, Hans Verkuil wrote: > Hi Samuel,
    > > What is the status of this series? It seems to be mostly OK, but I did
    see > a few comments suggesting improvements. > > Does this series depend
    [...] 
 
 Content analysis details:   (-1.4 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [64.147.123.20 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
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

Hi Hans,

On 1/23/23 06:33, Hans Verkuil wrote:
> Hi Samuel,
> 
> What is the status of this series? It seems to be mostly OK, but I did see
> a few comments suggesting improvements.
> 
> Does this series depend on your PPU work? That was not clear.

The first three patches do not, but the actual DT node does, for
completeness.

> I do think there were enough small comments to warrant a v2, unless you disagree?

I agree, and plan to send a v2 with the binding/driver changes made
compatible-specific.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
