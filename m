Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB034C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9ZxW4zjTVFZU0VP8068YT7uf76OybYgT4B/+4uTUgM=; b=IDNqVwAxQv+kHA
	PmzqnuDnFhTdZWSvMTtPKHmS2S1lTKziPyKwgv8sx/7IZXLV4GWNUhDeihdnz9WcD3iGP2vyos0iL
	igtKXhlSz0LAK2CkEBENekWibfPYrlH8xMzqVDVMyg4nxNXcZw0Nz6wIvql+2PwY1RyuSLo9Ow3c+
	JAefO2TE/84DRffkKSuS6ZeHl2gyd3zS2d+C6MmYgeYh3Vm7xV2pu26zxkHCfZwms4W4ELPnk6p43
	20xb/vqMW3Ow+GuR4TM+IyPXURe/ztEbg3fUBD3pMwD8tE7el2q4p38RXTnNqOzGbulwZlNnIqrwi
	q2fHvPHR/o8uEmWAAfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWXQ-0000000A9sS-1KB9;
	Wed, 27 Mar 2024 16:54:08 +0000
Received: from fout4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWXN-0000000A9rm-07JT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:54:07 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 52AEA1380053;
	Wed, 27 Mar 2024 12:54:03 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 27 Mar 2024 12:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711558443;
	 x=1711644843; bh=N6uU6LHUMt1sWQ3PaA2EU3jjeJj0dzgfVf7qZ8Yvtn8=; b=
	kwt1oSbh0XyRDK2SRHiZZX9JxcMz2njCjAqjsUOERU6dtcMt1Y/BLdE3r6U5kjyS
	ebntq99CYGWACVCqYLGyCIm5q0CWHBpySU2JDfw0abDKMbWSOrKnb4b8CbFgf1uF
	u90og8u5LA70tl9Kbl2o4IdkzVr+ZrCp7vywupzEbbComvdYFmXTUrzTOxk5cVLx
	g/EEUnRPEhnhmzYsGXzfxBQoZNpTn+yCuDs0JWDUY7f3ashB0tqf8tj1Oxo5mG9z
	70MlBxbZlVDwZvJAgP9SnLlqozqHTfT1eQnYBluV+rn4bXfxpCqyKGBzLAIx5ANd
	mP9l5BIhkLyJM/tyCOATpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711558443; x=
	1711644843; bh=N6uU6LHUMt1sWQ3PaA2EU3jjeJj0dzgfVf7qZ8Yvtn8=; b=A
	CHfJROo80VHzPkdFVwoBVbq5GaRdlkR7uvbF4p7h3YT6kNSwB85SZ8XP81IdBOkB
	RNUiIcdhYHzEuIVcfTT3AytLh4UtI0LYbua4LBtdTyvr1kbkpnATvaVGBQ8GzjXF
	h9QOXzKHzMJwUfwS/CynroBMiaXiEHA2ujxj9BS8Xl38O9sgU68aWV2P7bbHcOe8
	vPeS0r4x8jxP1nCwgyFSWjOwGiAZLt80H6D+SW2VSjUuw7/eOYSHGkbeefwDDAeI
	dHusrbtaKQDgfi3zzDeODwOs0YksC12s5nGqxFZe2cUCXznqoUNxkU/ugS+JYwFi
	8Pe+GCDmQg56wcZuC2oBQ==
X-ME-Sender: <xms:Kk8EZqbxOmVVGjnH7J1RSD92DupqhhUgALlvwkFecIUazl-BTqKNkw>
    <xme:Kk8EZtYjMhAMGUQaSDIuUw64QCb2Kq401hWOsWDUKkduXAWe31L3TjDge1vuf9NCR
    fyHeBVgxmwUIlS6RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpedtueetgeeutedujefgkeelfeeglefgudeigfffvefgledu
    gfelvefggeefheduteenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhes
    fhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Kk8EZk_eM4ara4s9MKJ4e7JB-uHOUl1RqN5zvxE1ltHB_9xrxr-2YA>
    <xmx:K08EZsoNiHWkoXTuc4M_NF1G1so5xBsJWX5hyvlt_EVCj04evjZflQ>
    <xmx:K08EZlofzWXGpR88Q6dgb4ll3ibkZcXBLtRZdh2CTjYwNLfDwHIL4Q>
    <xmx:K08EZqTRXxZsa5u0FcN6PiCWA9ek9tGo86Tsua9crCFekfTMab2Yhg>
    <xmx:K08EZmcMgJSrgAdDyK5UJWA66huL20h3aGO6aDhmTwzQrVZRWGS1DA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1E501700098; Wed, 27 Mar 2024 12:54:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <234c458c-15f1-423f-a2fd-0abfc6232c66@app.fastmail.com>
In-Reply-To: <CAEEQ3w=yNEktgUucmKuUvqfwDYYztVX+jofi5Q7hG-yQWcLbTA@mail.gmail.com>
References: <20240327061258.2370291-1-sorear@fastmail.com>
 <CAEEQ3w=yNEktgUucmKuUvqfwDYYztVX+jofi5Q7hG-yQWcLbTA@mail.gmail.com>
Date: Wed, 27 Mar 2024 12:53:33 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org
Subject: Re: [External] [PATCH] riscv: process: Fix kernel gp leakage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_095405_348680_36081135 
X-CRM114-Status: GOOD (  23.38  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQsIGF0IDQ6NDMgQU0sIHl1bmh1aSBjdWkgd3JvdGU6Cj4gSGkg
U3RlZmFuLAo+Cj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMjoxNOKAr1BNIFN0ZWZhbiBPJ1Jl
YXIgPHNvcmVhckBmYXN0bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBjaGlsZHJlZ3MgcmVwcmVzZW50
cyB0aGUgcmVnaXN0ZXJzIHdoaWNoIGFyZSBhY3RpdmUgZm9yIHRoZSBuZXcgdGhyZWFkCj4+IGlu
IHVzZXIgY29udGV4dC4gRm9yIGEga2VybmVsIHRocmVhZCwgY2hpbGRyZWdzLT5ncCBpcyBuZXZl
ciB1c2VkIHNpbmNlCj4+IHRoZSBrZXJuZWwgZ3AgaXMgbm90IHRvdWNoZWQgYnkgc3dpdGNoX3Rv
LiBGb3IgYSB1c2VyIG1vZGUgaGVscGVyLCB0aGUKPj4gZ3AgdmFsdWUgY2FuIGJlIG9ic2VydmVk
IGluIHVzZXIgc3BhY2UgYWZ0ZXIgZXhlY3ZlIG9yIHBvc3NpYmx5IGJ5IG90aGVyCj4+IG1lYW5z
Lgo+Pgo+PiBGaXhlczogN2RiOTFlNTdhMGFjICgiUklTQy1WOiBUYXNrIGltcGxlbWVudGF0aW9u
IikKPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4K
Pj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgfCAzIC0tLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPj4gaW5kZXggOTI5
MjJkYmQ1YjVjLi41MTA0MmY0OGRhMTcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPj4gQEAgLTI3
LDggKzI3LDYgQEAKPj4gICNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4+ICAjaW5jbHVkZSA8YXNt
L2NwdWZlYXR1cmUuaD4KPj4KPj4gLXJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFs
IF9fYXNtX18oImdwIik7Cj4+IC0KPj4gICNpZiBkZWZpbmVkKENPTkZJR19TVEFDS1BST1RFQ1RP
UikgJiYgIWRlZmluZWQoQ09ORklHX1NUQUNLUFJPVEVDVE9SX1BFUl9UQVNLKQo+PiAgI2luY2x1
ZGUgPGxpbnV4L3N0YWNrcHJvdGVjdG9yLmg+Cj4+ICB1bnNpZ25lZCBsb25nIF9fc3RhY2tfY2hr
X2d1YXJkIF9fcmVhZF9tb3N0bHk7Cj4+IEBAIC0yMDcsNyArMjA1LDYgQEAgaW50IGNvcHlfdGhy
ZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdz
ICphcmdzKQo+PiAgICAgICAgIGlmICh1bmxpa2VseShhcmdzLT5mbikpIHsKPj4gICAgICAgICAg
ICAgICAgIC8qIEtlcm5lbCB0aHJlYWQgKi8KPj4gICAgICAgICAgICAgICAgIG1lbXNldChjaGls
ZHJlZ3MsIDAsIHNpemVvZihzdHJ1Y3QgcHRfcmVncykpOwo+PiAtICAgICAgICAgICAgICAgY2hp
bGRyZWdzLT5ncCA9IGdwX2luX2dsb2JhbDsKPj4gICAgICAgICAgICAgICAgIC8qIFN1cGVydmlz
b3IvTWFjaGluZSwgaXJxcyBvbjogKi8KPj4gICAgICAgICAgICAgICAgIGNoaWxkcmVncy0+c3Rh
dHVzID0gU1JfUFAgfCBTUl9QSUU7Cj4+Cj4+IC0tCj4+IDIuNDAuMQo+Pgo+Pgo+IENhbiB5b3Ug
aGVscCBleHByZXNzIGluIG1vcmUgZGV0YWlsIHdoYXQgdGhlIHByb2JsZW0gd2FzIGJlZm9yZSBm
aXhpbmcgaXQ/CgpJdCdzIGEgS0FTTFIgYnlwYXNzLCBzaW5jZSBncF9pbl9nbG9iYWwgaXMgdGhl
IGFkZHJlc3Mgb2YgdGhlIGtlcm5lbCBzeW1ib2wKX19nbG9iYWxfcG9pbnRlciQuCgpUaGUgLyog
S2VybmVsIHRocmVhZCAqLyBjb21tZW50IGlzIHNvbWV3aGF0IGluYWNjdXJhdGUgaW4gdGhhdCBp
dCBpcyBhbHNvIHVzZWQKZm9yIHVzZXJfbW9kZV9oZWxwZXIgdGhyZWFkcywgd2hpY2ggZXhlYyBh
IHVzZXIgcHJvY2VzcywgZS5nLiAvc2Jpbi9pbml0IG9yCndoZW4gL3Byb2Mvc3lzL2tlcm5lbC9j
b3JlX3BhdHRlcm4gaXMgYSBwaXBlLiBTdWNoIHRocmVhZHMgZG8gbm90IGhhdmUKUEZfS1RIUkVB
RCBzZXQgYW5kIGFyZSB2YWxpZCB0YXJnZXRzIGZvciBwdHJhY2UgZXRjLiBldmVuIGJlZm9yZSB0
aGV5IGV4ZWMuCgpjaGlsZHJlZ3MgaXMgdGhlICp1c2VyKiBjb250ZXh0IGR1cmluZyBzeXNjYWxs
IGV4ZWN1dGlvbiBhbmQgaXQgaXMgb2JzZXJ2YWJsZQpmcm9tIHVzZXJzcGFjZSBpbiBhdCBsZWFz
dCBmaXZlIHdheXM6CgoxLiBrZXJuZWxfZXhlY3ZlIGRvZXMgbm90IGN1cnJlbnRseSBjbGVhciBp
bnRlZ2VyIHJlZ2lzdGVycywgc28gdGhlIHN0YXJ0aW5nCiAgIHJlZ2lzdGVyIHN0YXRlIGZvciBQ
SUQgMSBhbmQgb3RoZXIgdXNlciBwcm9jZXNzZXMgc3RhcnRlZCBieSB0aGUga2VybmVsIGhhcwog
ICBzcCA9IHVzZXIgc3RhY2ssIGdwID0ga2VybmVsIF9fZ2xvYmFsX3BvaW50ZXIkLCBhbGwgb3Ro
ZXIgaW50ZWdlciByZWdpc3RlcnMKICAgemVyb2VkIGJ5IHRoZSBtZW1zZXQgaW4gdGhlIHBhdGNo
IGNvbW1lbnQuCgogICBUaGlzIGlzIGEgYnVnIGluIGl0cyBvd24gcmlnaHQsIGJ1dCBJJ20gdW53
aWxsaW5nIHRvIGJldCB0aGF0IGl0IGlzIHRoZSBvbmx5CiAgIHdheSB0byBleHBsb2l0IHRoZSBp
c3N1ZSBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaC4KCjIuIHB0cmFjZShQVFJBQ0VfR0VUUkVHU0VU
KTogeW91IGNhbiBQVFJBQ0VfQVRUQUNIIHRvIGEgdXNlcl9tb2RlX2hlbHBlciB0aHJlYWQKICAg
YmVmb3JlIGl0IGV4ZWNzLCBidXQgcHRyYWNlIHJlcXVpcmVzIFNJR1NUT1AgdG8gYmUgZGVsaXZl
cmVkIHdoaWNoIGNhbiBvbmx5CiAgIGhhcHBlbiBhdCB1c2VyL2tlcm5lbCBib3VuZGFyaWVzLgoK
My4gL3Byb2MvKi90YXNrLyovc3lzY2FsbDogdGhpcyBpcyBwZXJmZWN0bHkgaGFwcHkgdG8gcmVh
ZCBwdF9yZWdzIGZvcgogICB1c2VyX21vZGVfaGVscGVycyBiZWZvcmUgdGhlIGV4ZWMgY29tcGxl
dGVzLCBidXQgZ3AgaXMgbm90IG9uZSBvZiB0aGUKICAgcmVnaXN0ZXJzIGl0IHJldHVybnMuCgo0
LiBQRVJGX1NBTVBMRV9SRUdTX1VTRVI6IExPQ0tET1dOX1BFUkYgbm9ybWFsbHkgcHJldmVudHMg
YWNjZXNzIHRvIGtlcm5lbAogICBhZGRyZXNzZXMgdmlhIFBFUkZfU0FNUExFX1JFR1NfSU5UUiwg
YnV0IGR1ZSB0byB0aGlzIGJ1ZyBrZXJuZWwgYWRkcmVzc2VzCiAgIGFyZSBhbHNvIGV4cG9zZWQg
dmlhIFBFUkZfU0FNUExFX1JFR1NfVVNFUiB3aGljaCBpcyBwZXJtaXR0ZWQgdW5kZXIKICAgTE9D
S0RPV05fUEVSRi4gSSBoYXZlIG5vdCBhdHRlbXB0ZWQgdG8gd3JpdGUgZXhwbG9pdCBjb2RlLgoK
NS4gTXVjaCBvZiB0aGUgdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBhbGxvd3MgYWNjZXNzIHRvIHVz
ZXIgcmVnaXN0ZXJzLiBJIGhhdmUKICAgbm90IGF0dGVtcHRlZCB0byBkZXRlcm1pbmUgd2hpY2gg
Zm9ybXMgb2YgdHJhY2luZyBhbGxvdyBhY2Nlc3MgdG8gdXNlcgogICByZWdpc3RlcnMgd2l0aG91
dCBhbHJlYWR5IGFsbG93aW5nIGFjY2VzcyB0byBrZXJuZWwgcmVnaXN0ZXJzLgoKRG9lcyB0aGlz
IGhlbHA/IEhvdyBtdWNoIG9mIHRoaXMgc2hvdWxkIGJlIGluIHRoZSBjb21taXQgbWVzc2FnZT8K
Ci1zCgo+IFRoYW5rcywKPiBZdW5odWkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
