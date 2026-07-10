Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F68C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FSr77V2fXbktKSHnmrlnxW4+02s1tiha+1HEgLLWG88=; b=41OVJ6DyXistP4zau1V7M3lcfx
	4GctRMJqTw3fWoLPGlEU16b1xK+wpQSBrd4WTOxtmo64s4GKmIP6nTIXqTR50v8eGbIx3c5JGY2aY
	HvYw8CgJNwS2qFJ9yxOVqZnDrEzFruqUIw8akhywIdYklcS+bNpe8iBnlewSgBd5CadyPEfB2LiUk
	/THlKQECEZET6zSnOc/GZDtfHsN7ypV2NkWiyac5D3br1f25hvG9c9DoYhRrBKYN+iVixmatsnj8F
	PU30C3LcXtRv7DLoKNvowfmIVZP2sBoMrVKN0eUves6L5on2Bqrrzo406ME3dhQOxsz011S2XwyBE
	o51zisJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9K-000000054li-3GKm;
	Fri, 10 Jul 2026 14:24:18 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9I-000000054lM-3Kgv
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 14:24:17 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BDCA1400124;
	Fri, 10 Jul 2026 10:24:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 10:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783693455;
	 x=1783779855; bh=I0M6LfptZTcKLS8CnN8AzILITWzUURi8rWY5mGa7zRw=; b=
	KcReVP/f6VGxxEIacCb8OFhB4GYSkKqDgVHxGA0/9fZfSt58u9ktFncWKxSZ9jM/
	TV86CeRr5l5qH8OXQ91S1vmO70iO6D9qwBC3fSnBGT+77L4XENyM8UpHcL8AE23B
	KaGqvFJ4gaPPIJU6IV6ne0AzuLgjzdcfnhTaREaoiInC8VWYpv7dKl2xce0AmFu4
	lAQbDHLvebeqyiGkReJYVMJ20MPA+cpMt1jEeyVORfVp4iEiAYBk2yEcmMzo5vhH
	6SCpkvGHCSbnm9xXp16Q/GeiC/Is1O5tYdnD2LzARfdrgZ3s8HJ9WBTs+OFln9be
	Wx2ChZwNrYWh4Nauw6I59g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783693455; x=
	1783779855; bh=I0M6LfptZTcKLS8CnN8AzILITWzUURi8rWY5mGa7zRw=; b=T
	7SxRJj1fgLftd66sohkydUSSFIuSmektkKdTqnJRNeUPBrK7FSr/6vipN0VPzloA
	u4Lcbnd8QJ9069u6efMsQrFPNtwayf6ptYZ1cBtjCzP2TtQuFK1iaQIEIFQCROm5
	FkADWgL02TE42Ced8eAQ4LGRJVmK/qJ5xzm1w/7P0vSswIzvbyHeHv/25d0n3Co7
	ANQgAVu165mOGJ5sgJairjsBWnMK464iTeVQdLbpiJ9naGnQrvsrUS/eCzeF4VTm
	NE/BR0aatcuFunvsxo9zY0hO/g0dB7czu93YBhpxFLry3o0NVFomKZPGUNojvjWK
	YgcRnP6lGosuUFkVGoJsw==
X-ME-Sender: <xms:jwBRaloDsOFgRXIyTHG9D9x4P7s9WilGdcrHV5cxtbziZDb-ULSzPw>
    <xme:jwBRaicdezlQmo5b4crAMn9ysZGMg1Jk1nODTkJFjS2ZHFSSS5odhe5Yv_KmZOcrf
    JblLALtXYJtHrd4mt5F7T2n5GfkSjMFjBetgjV676Jgzazuhj-CIUw>
X-ME-Proxy-Cause: dmFkZTGYxMZDU4x6fQf/RciM8257I9FixCyODKFI/alj9C/tuXfmRgoPcc6CQi7yWJZqRD
    B0yjY/cmTp2AaGCEDIlqCmIw9JCXn/jhmSIzMVPaKD7sAiXPbaLUqkvUI/gdywvDgEEml/
    O277Yi/m5c28v8+KreEOrpsHEfUYLyz4fds6MmCJbfzXQ6MOQrQjSfvmKKCmmtYwe4Nz76
    mKM2ozlgg2qCTYuxVFi3FFAgfe3HxGwrk6AwwIP7kZUgwSlgYP47uQ997CCsHIB/0C9Tbq
    o5St2lclqrCRK3VbLZV/NnxZOdSkZarQvMUjeR1vLJt5CAI0L38+gt2g69PPlxDSxAFyHo
    im0NBLt2IiSP4F8g+gntGaNX2kgx4Hwv2zik2j71GQs807BbARqKa1Q0AghtaC3YgG2hVj
    Yp5cCQhAmR9DO0Fz43U0l11kBS4MV12h43aeQN2p0jvlHbnBpU8oLAaFH3nZQu2jpkJB2p
    yZdsZxmRstat3qfe5PbAOQi2kPVIBdnd0QVwJDLyDUvdIQUJ16vLyy1LRXngG9GQ9JeLA7
    Bp3iPHR9yLXOKd3Bdstm/qGl4ajLK0jXTLD0iC+vkIaWj+DAi4reiLHgqqzh/cRfJ5+JBN
    /8c4uw9c2pL9V36A9vFDA+0uBmXiOkVDkEE/ssHX3srWOvfUZPZ0hqr9u0Zg
X-ME-Proxy: <xmx:jwBRas6Slia7Ma8gBNhkWarE1znVd4BSwEPuxUvCHSyNaF1SyvvMGA>
    <xmx:jwBRauVLi8GM64Yt-Unv4li3jTjZ3LElSD0tXwCoMP_VbDNK1RpZ3w>
    <xmx:jwBRasIKouSZa6WWTmHIvTSZfLc-6Ra9KgM7PnpC0oFrfXtL0WL_lg>
    <xmx:jwBRaovHTI3VLR7a12dQcbXDtGHm36FiORab0O_KkR5RIgwiaASzvA>
    <xmx:jwBRan7dmmRxVylRXPQ7w12Uhx_c6kI09f0_9g5IsxYxhE8_k3gm8lgm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F24291820082; Fri, 10 Jul 2026 10:24:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AxFSti9e2Kpo
Date: Fri, 10 Jul 2026 16:23:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Drew Fustini" <fustini@kernel.org>, soc@kernel.org
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Conor Dooley" <conor@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>
In-Reply-To: <ajAt3ml9pMIMTLTq@x1>
References: <ajAt3ml9pMIMTLTq@x1>
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_072416_903232_6C20819A 
X-CRM114-Status: GOOD (  14.37  )
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

On Mon, Jun 15, 2026, at 18:52, Drew Fustini wrote:
> Hi, this is a late pull request so no problem if it misses this window.
> It is just a single patch for the WiFi driver on the TH1520-based LPi4a.
>
> I recently setup new branches for riscv defconfig patches and they have
> been added to linux-next. I talked with Conor and this seemed like a
> good way to pull in defconfig patches that RISC-V SoCs need without
> adding more to the plate of the arch maintainer (Paul).
>
> Thanks,
> Drew
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   git@github.com:tenstorrent/linux.git riscv-config-for-v7.2
>

Hi Drew,

I assume you saw that this didn't make it into v7.2 and you
already plan to send it again for 7.3. If not, note that
the URL above is invalid and the tag is no longer there.

When resending, please use an https:// type URL.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
