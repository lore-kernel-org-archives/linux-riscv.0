Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B61DC001E0
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hBdl41QEJshaIfnPcnJTN1BjIBhbDlCQOXzoK3C7zk=; b=xXODZxbf93dZU0
	3dfmK5zcqYRS4yAuPhexk6+1Kf6Kdj60ABkgptakUDu21Rox0d298Ia8BXh1t0V1LZYJWtQvRfIHI
	UwUvtXz1DWauD6TcPTSO5MDFTG1ZKIZOJaLCgpQspy92xGavOKtYZVS1IIFXJRPKtjKWyEg64lP85
	xZn2nP5tsc3qg8JUvV9Edu2j0to0uIb6JinyIg+s9hqz3/Ttuja7HIkc3GNBgVV+RFwSY5VifZaUN
	WAFxoALJpspb5+KAuSVKarbNPgVGETiydeRIE0TYtwdHXQZNOIEyfSDe9TnLgjn39olk0FWfnZ44q
	E6qxgt5Ut9mOvZd82Nig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUj9Q-00CrJT-28;
	Sat, 12 Aug 2023 07:35:08 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUj9M-00CrIF-23;
	Sat, 12 Aug 2023 07:35:06 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 421FA5C010A;
	Sat, 12 Aug 2023 03:34:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 12 Aug 2023 03:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691825698; x=1691912098; bh=WqC8jR6InInnZuzJ+EysqTz0wUT8dxSKNcu
	7C0/3HeM=; b=dCGtWjTqROLM6UxVFCraHYHQ93peZaX+KBPrAxD6DxzW1Fz8A43
	e7Ed4i4hlKEuwz0SnKpQSkkLEFoAq6fb3JEM4Jd4ColFKfP7hLoYxneRg/oycL8u
	xmXbouGul7Br09wVApRftWd/ooRKHGNo4ApWziU5Nnk7bk78pCdTsb/CZK7DVMhC
	CibmlPP5nI2gP4QQjcWiF+fk7W7hyNgcPbGoXOENXr63LGGixBZ+5YgNKOWeriqg
	3+iC74fliRCBa0B5W8mBIylmvv6Fy43b/HQXdp5lp1uiN3p3TBKrrhfbh17C4+F6
	ysRly1L/Ow8754uhJnKUIAfaTS3vF2ZYYcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1691825698; x=1691912098; bh=WqC8jR6InInnZuzJ+EysqTz0wUT8dxSKNcu
	7C0/3HeM=; b=DP2DRRCSYCmH5Vfp2ZXKBFUrGaDAQPGRPgl+FNYDOEdieS0SE19
	JNP/ODsMQJaoU/LJBkTUAFXGRy5vC8B38YVhYrgJeEOYd6V53ZzyVuYMEXTSoFNg
	D3Fc7q2cYgIw7mo8HtkJJroZ0lUO7j7HEyNqYb7oVusQIdHriGmXyNZ4Yv+77upG
	DsU5zmiivJlulALcRScuDvmuHdvkv1skAEJ4bRYQCrsGTf3MXAmSOLP4UUFaMtT4
	S86UN40x9tOGMXbNVVFNDcTd+bsJ8jCNZoc2jERdPV9RRKguotvYY7cdlIUcjg50
	d34/pnmq4Kml5cagBF+Vi40bIyXUDl+x6Qg==
X-ME-Sender: <xms:IDbXZPRqug4D5loXD9mqZwGG01r8_DF4jp6JMEyUv3YNuWMVCp91Ww>
    <xme:IDbXZAzeXDrYMSyeEcktmCocCqNijokzQFVaeobj9F0v3sO8Mccih9cLrokD7gWmm
    ELYlEQN21wGsA7ZOdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleelgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:IDbXZE2reVts5QORz11lIuYb0ri67D5pxZ0Lxz86Zt6H-MC0BYus2A>
    <xmx:IDbXZPCJlDjCa7sT1zk_P8UtlsBICHZZbS-XgxPowKHUnVywGFSu8g>
    <xmx:IDbXZIgfsBCSiRk7Z6sGqJRPxgYvC50Uv9WhLXMZb7zdluX1d_V5Pw>
    <xmx:IjbXZGNwGwINM4cV6nu9MlZ27AA4Y36mzxWPvUPjn28DmeE2U-bY5A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 44DDAB60089; Sat, 12 Aug 2023 03:34:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <fbaf6de9-e1cc-4290-9016-46be21863ff5@app.fastmail.com>
In-Reply-To: <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-3-arnd@kernel.org>
 <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Date: Sat, 12 Aug 2023 09:34:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, guoren <guoren@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Russell King" <linux@armlinux.org.uk>, "Will Deacon" <will@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH 02/17] [RESEND] irq_work: consolidate arch_irq_work_raise
 prototypes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_003505_115845_7FA82BB3 
X-CRM114-Status: UNSURE (   9.98  )
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

T24gU2F0LCBBdWcgMTIsIDIwMjMsIGF0IDAwOjEwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4g
T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMTA6MDDigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
Pgo+Pgo+PiBUaGUgcHJvdG90eXBlIHdhcyBoaWRkZW4gb24geDg2LCB3aGljaCBjYXVzZXMgYSB3
YXJuaW5nOgo+Cj4KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJoaWRkZW4gb24geDg2Ij8KPgo+IGFy
Y2hfaXJxX3dvcmtfcmFpc2UoKSB3YXMgZGVjbGFyZWQgb24gNyBhcmNoaXRlY3R1cmVzLAo+IGlu
Y2x1ZGluZyB4ODYuCj4KCkkgbWVhbnQgaGlkZGVuIGluIHNvbWUgY29uZmlndXJhdGlvbnMuIFNw
ZWNpZmljYWxseSwgeDg2Cm9ubHkgZGVjbGFyZXMgdGhlIGZ1bmN0aW9uIHdoZW4gaXQgb3ZlcnJp
ZGVzIGl0IGZvcgpDT05GSUdfWDg2X0xPQ0FMX0FQSUMsIHdoaWxlIHdpdGhvdXQgdGhhdCBvcHRp
b24gdGhlIGdlbmVyaWMKc3R1YiBzdGlsbCBnZXRzIGNvbXBpbGVkIGJ1dCBpcyBuZXZlciBkZWNs
YXJlZC4KCiAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
