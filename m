Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C74AC761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNt+V8mLaW39ZI4lp4hruJEr8bIzVKm2tDoq0HlOR1M=; b=cPykjnS6gDBjzx
	wuyMNUCQlz9dyzV1y7BUoLRcZKP7inegelHBHTUIng+5PL2ocAfUF5lC/Wkgditztro7yauzr1N6k
	2s0HmoRstIVFx4soi6YzmzIq4LYDFeRe7aQ9YzCdcqvtBYzqQphckFOYb8O8BBD92nRg7ezZSROPN
	JG4t9C+OJQ8/McLgzX2BjSXFjg2TTn/robic5coka760rFznA+sT4DKf4peP3r9BlKhBOoY2h8/RT
	mIUKXe9uJC/akJqZhFnE47OUD44dXir5i1za1apAiXbgVQt/G58BF3pLqp6vI8B81ax6Lu6nlHlTy
	VMfpvzDTjPt1szYUkLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piECj-007Ptf-16;
	Fri, 31 Mar 2023 12:50:05 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEBd-007P6J-20;
	Fri, 31 Mar 2023 12:48:59 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9453058267B;
	Fri, 31 Mar 2023 08:48:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 08:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1680266936; x=1680274136; bh=1wl0PaNqVV1tf/UjJBVG7Hr1Nf6zuThoMUu
	qGEpn1MA=; b=BLukJoG1DbMb6R2AbqA/+7JjbZ7Oc/VY/GccCFivK2SLSyJIUDy
	eDvuj6KlJ9yQrHhbcVFZFc/7GfKYkkIJnc004z0WtfxhzT8F0Dryc/fj4uAQEHP5
	0uQBdRp2Y9CzikgGULwwka03ZtEYN+vA0NR1UYoJiMuMTtA+TbmqSw1RKb6bHBwu
	kgWKCmrmDScSe7b7EAcsyIEqiEeMn1uQFjhnq/BazbUn1vodHcRar+Z8amV+f2ZZ
	4SEu3kvSxhj8jR9TWpWv6H7rDT3W+eYIj1h32pDouk8U16vHi7UxgZYWiVlTR8pm
	cvHgSREjUd2DJv11jgWTdKV0doKNHN4KAQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680266936; x=1680274136; bh=1wl0PaNqVV1tf/UjJBVG7Hr1Nf6zuThoMUu
	qGEpn1MA=; b=QTw4z9BqGCp34jRTQ9lJ0Te2z7DjXCcjR1cRFuymA6teq1Ue47T
	RfmowyRx6v1MwMbGt3ApYDk7qwSROS25JV78fgnvrSJIUz/j3GedCAWFmvE8DLl3
	HoMeyCJb5WbZ+f8j44/HhL12AZyMqN3xRjT/IDdrxGjXOHILLMDS4nNm1QNzKgnt
	FLCEk9P9FtfqKPKXWuMbSuG7oHcgCKFsVXQhQDt+sRTlprJiPAhFBhU6avHf2Ete
	uaofk0N4pXe1j7VHba5yYeMGTXuCjt30lCiXSGhI7m4EIcITbbYAAY9vnjAdi0d+
	SAs1yBNQ6aJg2m3zpufn0UV2fnpNcc/oKsQ==
X-ME-Sender: <xms:ttYmZMk-K2WF_uQihYdEaE-WxRbKWanSV4_1kq4F_OoJAiQRztqr8Q>
    <xme:ttYmZL1tFGUNnFuZ3XoKvNtYojk3J4bwbaadBIOeVDI0Ukgz-8ewFG032ufxZ-SbD
    1b0xoms1quNu7guG_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ttYmZKrf5muOZ7qbqVpPjnkqBNMSMOU4gybMeyJ3rUMZTBnAWuP7Zg>
    <xmx:ttYmZIlj2z9EhXlgVWbMqhx-qYV5mMM2GAMIKkxak63PHlTsdJDm_Q>
    <xmx:ttYmZK07ZhhFcRRDILM_35s-tNIWEGc_cMzAk1ijnOb4EPEMJyMkfQ>
    <xmx:uNYmZAU6_XmPJuSgqvZ3Fo60bA3Va1J04nlnSMvYEI__B3v7Fjseqw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8952B6008D; Fri, 31 Mar 2023 08:48:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <f3637818-7528-4564-a208-6e587efd7128@app.fastmail.com>
In-Reply-To:  <CACRpkdZdnTX4-jnnXZveXxwOg76yH4Zyoa-ZSGeC7KzOnn+6Lg@mail.gmail.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-18-arnd@kernel.org>
 <CACRpkdZdnTX4-jnnXZveXxwOg76yH4Zyoa-ZSGeC7KzOnn+6Lg@mail.gmail.com>
Date: Fri, 31 Mar 2023 14:48:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}()
 internally
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054857_746589_A5D7CE19 
X-CRM114-Status: GOOD (  13.70  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMsIGF0IDExOjEwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9u
IE1vbiwgTWFyIDI3LCAyMDIzIGF0IDI6MTbigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+
Cj4+IFRoZSBhcm0gc3BlY2lmaWMgaW9tbXUgY29kZSBpbiBkbWEtbWFwcGluZy5jIHVzZXMgdGhl
IHBhZ2Urb2Zmc2V0IGJhc2VkCj4+IF9fZG1hX3BhZ2VfY3B1X3RvX2RldigpL19fZG1hX3BhZ2Vf
ZGV2X3RvX2NwdSgpIGhlbHBlcnMgaW4gcGxhY2Ugb2YgdGhlCj4+IHBoeXNfYWRkcl90IGJhc2Vk
IGFyY2hfc3luY19kbWFfZm9yX2RldmljZSgpL2FyY2hfc3luY19kbWFfZm9yX2NwdSgpCj4+IHdy
YXBwZXJzIGFyb3VuZCB0aGUuCj4KPiBCcm9rZW4gc2VudGVuY2U/CgpJJ3ZlIGNoYW5nZWQgcy90
aGUvdGhlbS8gbm93LCBhdCBsZWFzdCBJIHRoaW5rIHRoYXQncyB3aGF0IEkgbWVhbnQgdG8Kd3Jp
dGUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKPj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBtb3ZlIHRo
ZSBsYXR0ZXIgcGFydCBzZXQgb2YgZnVuY3Rpb25zIGludG8KPj4gY29tbW9uIGNvZGUsIGNoYW5n
ZSB0aGUgaW9tbXUgaW1wbGVtZW50YXRpb24gdG8gdXNlIHRoZW0gZGlyZWN0bHkKPj4gYW5kIHJl
bW92ZSB0aGUgaW50ZXJuYWwgb25lcyBhcyBhIHNlcGFyYXRlIGludGVyZmFjZS4KPj4KPj4gQXMg
cGFnZStvZmZzZXQgYW5kIHBoeXNfYWRkcmVzcyBhcmUgZXF1aXZhbGVudCwgYnV0IGFyZSB1c2Vk
IGluCj4+IGRpZmZlcmVudCBwYXJ0cyBvZiB0aGUgY29kZSBoZXJlLCB0aGlzIGFsbG93cyByZW1v
dmluZyBzb21lIG9mCj4+IHRoZSBjb252ZXJzaW9uIGJ1dCBhZGRzIHRoZW0gZWxzZXdoZXJlLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gTG9v
a3MgZ29vZCB0byBtZSwgdG9vayBtZSBzb21lIHRpbWUgdG8gdmVyaWZ5IGFuZCB1bmRlcnN0YW5k
Cj4gdGhlIG9wZW4tY29kZWQgdmVyc2lvbiBvZiBQRk5fVVAoKSBhbmQgdGhpcyByZWZhY3Rvcmlu
ZyBhbG9uZQo+IG1ha2VzIHRoZSBwYXRjaCBoaWdobHkgdmFsdWFibGUuCj4gUmV2aWV3ZWQtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KClRoYW5rcyEKCiAgICBB
Um5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
