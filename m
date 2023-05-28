Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5293CC7EE2C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SuvMqFdI042pAe0Q25kb9d3eM0htOv9AwxQdS/3zhg=; b=0bgl3HWfjRiRbh
	mN6cTZ24USx3crcOWHGWBHGU7AgCykXFnmzri2q/xj1KPGGgQjNXTzrLFZT2h7s9nr+eTPk0u4o/P
	llIs/RyGXzP9ijpHOZl9zjtQ0tIXfh1N4gkUYtYKaIGeuaSoh5PIDv989z9Z1nYUmOSV/O7XRNFtg
	QXB/RYVyOtaB2RaiLy2awpm67G4dMLwPkbc1BEybAfDnA9JDVLstzWbaKTm02kXIGSzpSx196YgKP
	4CGfCI0z32oIas+2G0HoWHBFOWBg8X2NkzHHSJX2NTCIymcOlyONWX/hMbOjeE2lPWjeU/UxOOsEK
	jGjoulexgFjwjSgPV36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3C55-007DKs-2b;
	Sun, 28 May 2023 08:48:51 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3C51-007DIW-1w
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 08:48:49 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id C1A2032007F9;
	Sun, 28 May 2023 04:48:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 28 May 2023 04:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1685263722; x=1685350122; bh=dbKqJffHV3+pecTgDfQClj4wiqdZaANtKaF
	kt+SsH/g=; b=Tv2E3uUrtLBy2QKoeONeldiMNdpg6aLqu8QF/rrkSiRLOT5cjz0
	2fLEpW8vyASR9mA3Mzhiwn5BKVclmpDPSvvdUz1pqLqc+UlLvp+7EeoDWvZxeOky
	NuvYJ28OhKIEpaiWcNzX9px7nKR1cSuyM7JsuaufiR86tRSF/jCtD2Si3oAWgiiQ
	e5vgjq3f5m7XAMidY7sVwI3AthMTozE72BYNJVL4iW/WBlU5s+iJTKPHm0aNd2HN
	NcU+WiDRDFT1ATeGVcD1pbiLzAaVnldpvkK/J1qdaTM904TPIV2+omWuF3bLE63B
	I+jevwj+8OG9bndinGMoQWxSMvU5qv0cM/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1685263722; x=1685350122; bh=dbKqJffHV3+pecTgDfQClj4wiqdZaANtKaF
	kt+SsH/g=; b=hG00OSxux0WIwOwHpOeMTe5riqTGkenybsGeCByKaiWIvN62/9/
	NvHEYkxgZhltRf4xLvurXskOkmxEkcAEAdKFXGiXldB1NUZShjGuWTwP8kaELdXl
	G8KbzNVfqBkxkyerJOjeicPbkOleoOJ6t9KDYIucpJE885ydoD9O/Cf6dS7NJL/n
	g4JCMrrFxRjcwyv4+QOk/cT9Ddgc8AUG+/PSX1GGzJ1hVzCSHsc5odl6KnUzzGgk
	BVLU7xg5kMhguVjlin6maI6NJ2LohbyRLT7a1IGXMeUOe+UhgRLKZazZ6TW8rIF0
	tUNOFS4b8Uk7W142wq100n/IiEVL+Hzc7Fg==
X-ME-Sender: <xms:ahVzZCQOGpZ583z5KzNxJV-esR1t_GGc9KRBMYr3BfeseIPIrGWhTQ>
    <xme:ahVzZHx58tqW9SqjX1q3WmwUpfjZ9f5GihvwGVdT1jtXWvZ1z4FjL4MpZ7rKici8k
    Dn-i0tvPTMeeYvKw9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ahVzZP15E5B_QRNofh8yefy6zH_cdZxvPWfDRqT6SQPgUryvoC4_pg>
    <xmx:ahVzZOCqA_hcIcgk5Ux2za4siiOMWZjrXcI3OxIEFKFfhfdNcaEeNw>
    <xmx:ahVzZLjF2OfPnQPNnnQ43LrJu0jYlRQikHH_fpmVXThQazkKSrgv7A>
    <xmx:ahVzZBYmIc7C9FrVAQbxbWMrsHTcguiTAJ-bG74RcfSpuWfs_DAbGw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F404DB60086; Sun, 28 May 2023 04:48:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <9e4064fc-f0c5-4dd3-941f-344d2150e1cd@app.fastmail.com>
In-Reply-To: <20230528082509.293250-1-falcon@tinylab.org>
References: <83ab9f47-e1ed-463c-a717-26aad6bf2b71@app.fastmail.com>
 <20230528082509.293250-1-falcon@tinylab.org>
Date: Sun, 28 May 2023 10:48:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use __NR_ppoll_time64 for
 rv32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_014848_086762_1259F7DD 
X-CRM114-Status: GOOD (  17.23  )
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

T24gU3VuLCBNYXkgMjgsIDIwMjMsIGF0IDEwOjI1LCBaaGFuZ2ppbiBXdSB3cm90ZToKPj4gT24g
RnJpLCBNYXkgMjYsIDIwMjMsIGF0IDA5OjE1LCBUaG9tYXMgV2VpPUMzPTlGc2NodWggd3JvdGU6
Cgo+ICogVXNlIF9fTlJfKnRpbWU2NCBmb3IgYWxsIDMyYml0IHBsYXRmb3Jtcwo+ICogVXNlIF9f
TlJfcHNlbGVjdDYvcHBvbGwvY2xvY2tfZ2V0dGltZSBvbmx5IGZvciA2NGJpdCBwbGF0Zm9ybXMK
PiAqIE5ldyBzaXplb2YgdGVzdHMgYWRkZWQgdG8gdmVyaWZ5IG9mZl90LCB0aW1lX3QsIHRpbWVz
cGVjLCBpdGltZXJzcGVjLi4uCj4KPiAgICAJQ0FTRV9URVNUKHNpemVvZl90aW1lX3QpOyAgICAg
ICAgICAgRVhQRUNUX0VRKDEsIDgsICAgCj4gc2l6ZW9mKHRpbWVfdCkpOyBicmVhazsKPiAgICAg
CUNBU0VfVEVTVChzaXplb2ZfdGltZXNwZWMpOyAgICAgICAgIEVYUEVDVF9FUSgxLCAxNiwgIAo+
IHNpemVvZihzdHJ1Y3QgdGltZXNwZWMpKTsgYnJlYWs7Cj4gICAgICNpZmRlZiBOT0xJQkMKPiAg
ICAgCUNBU0VfVEVTVChzaXplb2ZfaXRpbWVyc3BlYyk7ICAgICAgIEVYUEVDVF9FUSgxLCAzMiwg
IAo+IHNpemVvZihzdHJ1Y3QgaXRpbWVyc3BlYykpOyBicmVhazsKPiAgICAgI2VuZGlmCj4gICAg
IAlDQVNFX1RFU1Qoc2l6ZW9mX3RpbWV2YWwpOyAgICAgICAgICBFWFBFQ1RfRVEoMSwgMTYsICAK
PiBzaXplb2Yoc3RydWN0IHRpbWV2YWwpKTsgYnJlYWs7Cj4gICAgIAlDQVNFX1RFU1Qoc2l6ZW9m
X2l0aW1lcnZhbCk7ICAgICAgICBFWFBFQ1RfRVEoMSwgMzIsICAKPiBzaXplb2Yoc3RydWN0IGl0
aW1lcnZhbCkpOyBicmVhazsKPiAgICAgCUNBU0VfVEVTVChzaXplb2Zfb2ZmX3QpOyAgICAgICAg
ICAgIEVYUEVDVF9FUSgxLCA4LCAgIAo+IHNpemVvZihvZmZfdCkpOyBicmVhazsKPgo+Cj4gQEFy
bmQsIHRoZSBhYm92ZSB0aW1ldmFsL2l0aW1lcnZhbCBkZWZpbml0aW9ucyBhcmUgdXNlZCB0byBv
dmVycmlkZSB0aGUgb25lcwo+IGZyb20gbGludXgvdGltZS5oIHRvIGF2b2lkIHN1Y2ggZXJyb3I6
Cj4KPiAgICAgZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDigJhzdHJ1Y3QgdGltZXZhbOKAmQo+Cj4g
ICAgIG5vbGliYy9zeXNyb290L3Jpc2N2L2luY2x1ZGUvdHlwZXMuaDoyMjU6ODogZXJyb3I6IHJl
ZGVmaW5pdGlvbiBvZiAKPiDigJhzdHJ1Y3QgdGltZXZhbOKAmQo+ICAgICAgIDIyNSB8IHN0cnVj
dCB0aW1ldmFsIHsKPiAgICAgICAgICAgfCAgICAgICAgXn5+fn5+fgo+ICAgICBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gbm9saWJjL3N5c3Jvb3QvcmlzY3YvaW5jbHVkZS90eXBlcy5oOjExLAo+ICAg
ICAgICAgICAgICAgICAgICAgIGZyb20gbm9saWJjL3N5c3Jvb3QvcmlzY3YvaW5jbHVkZS9ub2xp
YmMuaDo5OCwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIG5vbGliYy9zeXNyb290L3Jpc2N2
L2luY2x1ZGUvZXJybm8uaDoyNiwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIG5vbGliYy9z
eXNyb290L3Jpc2N2L2luY2x1ZGUvc3RkaW8uaDoxNCwKPiAgICAgICAgICAgICAgICAgICAgICBm
cm9tIAo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jOjEyOgo+
ICAgICBub2xpYmMvc3lzcm9vdC9yaXNjdi9pbmNsdWRlL2xpbnV4L3RpbWUuaDoxNjo4OiBub3Rl
OiBvcmlnaW5hbGx5IAo+IGRlZmluZWQgaGVyZQo+ICAgICAgICAxNiB8IHN0cnVjdCB0aW1ldmFs
IHsKPgo+IEBBcm5kLCBBcyB5b3UgY29tbWVudGVkIGluIGFub3RoZXIgcmVwbHksIGlzIGl0IHRp
bWUgZm9yIHVzIHRvIHVwZGF0ZQo+IGluY2x1ZGUvdWFwaS9saW51eC90aW1lLmggdG9nZXRoZXIg
YW5kIGxldCBpdCBwcm92aWRlIHRpbWU2NCB0aW1ldmFsL2l0aW1lcnZhbAo+IGluc3RlYWQgb2Yg
dGhlIG9sZCBvbmVzPyBwZXJoYXBzIHNvbWUgbGliYydzIGFyZSBzdGlsbCB1c2luZyB0aGVtLgoK
SXQncyBoYXJkIHRvIGtub3cgaWYgYW55dGhpbmcgaXMgdXNpbmcgaXQgdW50aWwgd2UgdHJ5LiBP
biB0aGUgb3RoZXIKaGFuZCwgd2UgYWxzbyBrbm93IHRoYXQgYW55dGhpbmcgc3RpbGwgcmVseWlu
ZyBvbiBpdCBpcyBnb2luZyB0byBiZQppbmNyZWFzaW5nbHkgYnJva2VuIG9uIDMyLWJpdCBhcmNo
aXRlY3R1cmVzIG92ZXIgYXMgd2UgZ2V0IGNsb3NlciB0bwp5MjAzOCwgc28gd2UgY2FuIGp1c3Qg
dHJ5IHJlbW92aW5nIHRoZXNlIGhlcmUgdG8gc2VlIHdoYXQgaGFwcGVucy4KCj4gT3IgcGVyaGFw
cyB3ZSBjYW4gYWRkIGEgc3dpdGNoIGxpa2UgX19BUkNIX1dBTlRfVElNRTMyX1NZU0NBTExTLCBh
ZGQgYQo+IF9fQVJDSF9XQU5UX1RJTUUzMl9TVFJVQ1RTIGFuZCBzaW1wbHkgYmluZCBpdCB3aXRo
IF9fQVJDSF9XQU5UX1RJTUUzMl9TWVNDQUxMUz8KCkkgZG9uJ3QgbGlrZSB0aGF0IGlkZWE6IF9f
QVJDSF9XQU5UX1RJTUUzMl9TWVNDQUxMUyB0ZWxscyB1cyB0aGF0CmFuIGFyY2hpdGV0dXJlIHN0
aWxsIHByb3ZpZGVzIHRob3NlIHN5c2NhbGxzIGZvciBjb21wYXRpYmlsaXR5LCBzbwp0aGF0IGlz
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYywgYnV0IF9fQVJDSF9XQU5UX1RJTUUzMl9TVFJVQ1RTIGlz
IG5vdApzb21ldGhpbmcgdGhhdCBpcyBhbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVjaXNpb24g
YXQgYWxsLCBpdCdzCm9ubHkgbmVlZGVkIGZvciBvbGQgc291cmNlIGNvZGUuCgo+IEFib3V0IHRo
ZSBhYm92ZSB1Z2x5IG92ZXJyaWRlIGNvZGUsIFdoYXQncyB5b3VyIHN1Z2dlc3Rpb24gaW4gdjI/
IDstKQoKQ2FuIHlvdSBtYXliZSBqdXN0IHJlbW92ZSB0aGUgIiNpbmNsdWRlIDxsaW51eC90aW1l
Lmg+IiBmcm9tIGFsbAppbmNsdWRlL3VhcGkvIGFuZCBub2xpYmMgaGVhZGVycyBzbyBpdCBqdXN0
IG5ldmVyIGdldHMgc2Vlbj8KClVuZm9ydHVuYXRlbHkgSSBzZWUgdGhlIGhlYWRlciBjb250YWlu
cyBhIGZldyBvdGhlciBkZWZpbml0aW9ucywKd2hpY2ggbWlnaHQgaGF2ZSB0byBnZXQgbW92ZWQg
b3V0IG9mIHRoZSB3YXksIHBvc3NpYmx5IHRvCmxpbnV4L3RpbWVfdHlwZXMuaC4KCiAgICAgICBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
