Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0109BC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdZ3b1hPYQpKz5q1H8roCabZKsQ3oEUwtmxeINMbE/c=; b=BmnqjW63xHiGy6
	1Tga9BdY7kNXcLa4PjykQlZQQWc6Uw5fedwwg9r9UnrfwEDfpijVyKuvveLOcZ5q//CIP+78z48m7
	xOj248L/wETo14SVdp5mYDz1lg4aB+xHyRs4wha9beonGkDXYMTm9pEJPALl9w3Ecbn83wL3Sqs2h
	3+7EfxU5LYzJCwLaczbd8oIAa/Pl/ZScoS1cSgUG1Xv2k4OzJFPPSM7OPcOEBAmqY2u0P/R8yRY/m
	trJYAC8s0jq6vDlKiwPfvFXyHdvAdErvA1GR3Qfa0KFVdY5s4IYYHsJOvmSkf1eiTNXXQuBVcdcz/
	f8zI1SVgoYphN2MiBSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWDSO-0000000G7Qq-0c9H;
	Sat, 03 Feb 2024 10:41:08 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWDSH-0000000G7PM-3xjw
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 10:41:06 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F12FD3200B15;
	Sat,  3 Feb 2024 05:40:54 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sat, 03 Feb 2024 05:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706956854;
	 x=1707043254; bh=5i1vqb5NehMGoPuv1e9ZjiUnajUF+hzp+g2HFH1CXoM=; b=
	IrmA9BloMIRk9DuufY7g71TtazNUwzM2XjbIvTlrtEXjVpWOYaDrBH2jLTrx5kj6
	aihz+zqUEJuLokGHvt9HastOyFmGv1mOvwqxs/wQk2lhkt59+neUvR2gJNeTCs0R
	kd5yJOHMV5/bE9mH44VeXekDo8S1w27GP5CCUaVwHmqFpmB6Gns/GJC43HT+p2hE
	cGyoIRgV+b3LF2JN/+Rx53ppVeoIA5IjwwLnjfiIM/7GLzJIUgVd/Ry/YOwbuww/
	KDEP0tTyYzApTfsjMVh2DoLKs1VLbJe8/Pnfii1lH4YrxuRLtVXj+SZF2HdGmTz8
	mLMTMhnkYjjA7nkDI4yquw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706956854; x=
	1707043254; bh=5i1vqb5NehMGoPuv1e9ZjiUnajUF+hzp+g2HFH1CXoM=; b=A
	6V7wSqYX3vuYt8RellyWE0DmACaKNVt/mHGsbY5cC4G/0NTcawFPXRKH4YFe0Wsx
	7Y/cVwvjAvLc06E85s0ZtinCfcpTrcJEbDfg9nQEsfHRKtD8AokvMUSrMcXaaEkF
	zG55O3+jPraT02V4JT1azsIlNkMBER4/Sua2RZT0CJ21dlSFCDQHWhJqIK3Zxrm+
	1+aV8YrJ2cADWhQscfaD6SCIrxUyqjeJx1ABQAZFKAvQgl/T5XL1+3karPqOUNx2
	AnFrbN1wed3ABygMEfc6aO1fGyNTcorzJyhUWyH+cu32H6NqgNSt0k0wduF2lWwH
	tKS8rY7OCCnR12m3GgxOg==
X-ME-Sender: <xms:NRi-ZUNj4Dsw3FNu9ThpsIy_UJBzt9yJWyIiPSwBOQzhlpz_nkgwvw>
    <xme:NRi-Za-RcvvQhz6wNaNGhb_P49q155RPQPjXE5x5_ruJS8KCTxTr--r0ECctKjdq7
    vZFJ4mZP7pTWGFf0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpefhudfhffetvdegfeeiudduleekheelteefgfdtleffuddt
    ffduffeigffghfegieenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhinhhfrhgrug
    gvrggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Nhi-ZbSZXwUZnQWrffX5b9IabcbW8dAVCeBfnJCvx6MvYRLCU53u_w>
    <xmx:Nhi-ZcuVnzzuPDEjOv-exsaewy2a5lD1Ixvd4O1zxpWfRl-8fzc6Pg>
    <xmx:Nhi-Zcft7o0p5F6m2bvBaLIR1hwgdcaZ6F0Ao1f6mfYb5w0lwrid7Q>
    <xmx:Nhi-Zavl71KwJAgeAGvURdX7bSrP6FyGq9CVg0a-avtCKUXOJ-l2Pg>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DE8071700093; Sat,  3 Feb 2024 05:40:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <5657c211-531b-4890-8c52-182b7b4eae7c@app.fastmail.com>
In-Reply-To: <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
References: <20240201140319.360088-1-cleger@rivosinc.com>
 <ZbxUUsKdKIPI8Fb/@ghost> <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
Date: Sat, 03 Feb 2024 05:40:06 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
 "Charlie Jenkins" <charlie@rivosinc.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Robin Ehn" <rehn@rivosinc.com>
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_024102_328742_835A2592 
X-CRM114-Status: GOOD (  19.45  )
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

T24gRnJpLCBGZWIgMiwgMjAyNCwgYXQgMzoyMiBBTSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
IE9uIDAyLzAyLzIwMjQgMDM6MzIsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4gT24gVGh1LCBG
ZWIgMDEsIDIwMjQgYXQgMDM6MDI6NDVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pj4gU29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNl
cyB0aGUgZnJlZSBiaXRzCj4+PiBpbiBwb2ludGVycyB0byBpbnNlcnQgYWRkaXRpb25hbCBpbmZv
cm1hdGlvbiBmb3IgdGhlaXIgb3duIGxvZ2ljLgo+Pj4gQ3VycmVudGx5IHRoZXkgcmVseSBvbiBw
YXJzaW5nIC9wcm9jL2NwdWluZm8gdG8gb2J0YWluIHRoZSBjdXJyZW50IHZhbHVlCj4+PiBvZiB2
aXJ0dWFsIGFkZHJlc3MgdXNlZCBiaXRzIFsxXS4gRXhwb3J0aW5nIFZBX0JJVFMgdGhyb3VnaCBo
d3Byb2JlIHdpbGwKPj4+IGFsbG93IGZvciBhIG1vcmUgc3RhYmxlIGludGVyZmFjZSB0byBiZSB1
c2VkLgo+PiAKPj4gbW1hcCBhbHJlYWR5IHN1cHBvcnRzIHRoaXMgd2l0aG91dCBhIG5lZWQgZm9y
IGFwcGxpY2F0aW9ucyB0byBrbm93IHRoZQo+PiB1bmRlcmx5aW5nIGhhcmR3YXJlLiBJZiBhIGhp
bnQgYWRkcmVzcyBpcyBwYXNzZWQgaW50byBtbWFwLCBpdCB3aWxsIG5ldmVyCj4+IHJldHVybiBh
biBhZGRyZXNzIHRoYXQgdXNlcyBtb3JlIGJpdHMgdGhhbiB0aGUgaGludCBhZGRyZXNzLiBJIGRl
c2lnbmVkCj4+IGl0IHRoYXQgd2F5IHNvIHRoYXQgc29tZXRoaW5nIGxpa2UgdGhpcyB3YXNuJ3Qg
bmVjZXNzYXJ5Lgo+Cj4gT2sgZXZlbiB0aG91Z2ggcHJvYmluZyB0aGlzIGtpbmQgb2YgdGhpbmcg
aXMgcHJvYmFibHkgbm90IHdoYXQgbW1hcCBpcwo+IG1lYW50IHRvIGRvLiBJTUhPLCBwcm9iaW5n
IHRoaXMgdGhyb3VnaCB0aGUgcmVndWxhciBod3Byb2JlIGludGVyZmFjZSBpcwo+IHByb2JhYmx5
IG1vcmUgY29oZXJlbnQgYnV0IG1heWJlIFJvYmluICh3aGljaCBuZWVkcyB0aGlzIGluZm9ybWF0
aW9uKQo+IGNhbiByZWx5IG9uIHRoYXQuCgpCb3RoIG9mIHRoZXNlIGFyZSB1c2VmdWwsIHNlcGFy
YXRlbHkgYW5kIGluIGNvbmp1bmN0aW9uLgoKaHdwcm9iZSBhbGxvd3MgYXBwbGljYXRpb25zIHdo
aWNoIGNhbiBhZGFwdCB0byBkaWZmZXJlbnQgVkEgc2l6ZXMgdG8gbGVhcm4Kd2hpY2ggaXMgaW4g
dXNlIHByaW9yIHRvIGFsbG9jYXRpbmcgbWVtb3J5LgoKbW1hcCBoaW50cyBhbGxvdyBhcHBsaWNh
dGlvbnMgd2hpY2ggcmVxdWlyZSBhIGZpeGVkIGxpbWl0IG9uIHRoZSBWQSBzaXplIHRvCmV4cHJl
c3MgdGhhdCBsaW1pdCBhdCB0aGUgcG9pbnQgb2YgcmVxdWlyZW1lbnQsIHRoZSBoaW50IGNhbiBi
ZSBzZXQgYmFzZWQgb24KdGhlIGh3cHJvYmUgcmVzdWx0IHRvIGV4cGxpY2l0bHkgaW5kaWNhdGUg
aXRzIHVzZS4KCi1zCgo+IENsw6ltZW50Cj4KPj4gCj4+IC0gQ2hhcmxpZQo+PiAKPj4+Cj4+PiBM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9tYXN0ZXIvc3JjL2hvdHNw
b3Qvb3NfY3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlzY3YuY3BwI0wxNzEgWzFd
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4+Pgo+Pj4gLS0tCj4+PiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8
IDMgKysrCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICB8IDIgKy0K
Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4+PiAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDMgKysrCj4+PiAgNCBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4+PiBpbmRleCBiMmJjYzllZWQ5YWEuLjZmMTk4YzZlZDRm
MCAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4+PiBAQCAtMjEw
LDMgKzIxMCw2IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPj4+ICAKPj4+ICAq
IDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRWA6IEFuIHVuc2ln
bmVkIGludCB3aGljaAo+Pj4gICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJs
b2NrIGluIGJ5dGVzLgo+Pj4gKwo+Pj4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1ZB
X0JJVFNgOiBBbiB1bnNpZ25lZCBsb25nIHdoaWNoCj4+PiArICByZXByZXNlbnQgdGhlIG51bWJl
ciBvZiBiaXRzIHVzZWQgdG8gc3RvcmUgdmlydHVhbCBhZGRyZXNzZXMuCj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3cHJvYmUuaAo+Pj4gaW5kZXggNjMwNTA3ZGZmNWVhLi4xNTBhOTg3N2IwYWYgMTAwNjQ0
Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+Pj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPj4+IEBAIC04LDcgKzgsNyBAQAo+Pj4gIAo+
Pj4gICNpbmNsdWRlIDx1YXBpL2FzbS9od3Byb2JlLmg+Cj4+PiAgCj4+PiAtI2RlZmluZSBSSVND
Vl9IV1BST0JFX01BWF9LRVkgNgo+Pj4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDcK
Pj4+ICAKPj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3ZfaHdwcm9iZV9rZXlfaXNfdmFsaWQo
X19zNjQga2V5KQo+Pj4gIHsKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+
Pj4gaW5kZXggOWYyYThlM2ZmMjA0Li4yYTUwMDZjZGRiN2IgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+PiBAQCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3Qgcmlz
Y3ZfaHdwcm9iZSB7Cj4+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOU1VQ
UE9SVEVECSg0IDw8IDApCj4+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX01B
U0sJCSg3IDw8IDApCj4+PiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tf
U0laRQk2Cj4+PiArI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9WQV9CSVRTCQk3Cj4+PiAgLyog
SW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Pj4g
IAo+Pj4gIC8qIEZsYWdzICovCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4+IGluZGV4IGE3
YzU2YjQxZWZkMi4uMzI4NDM1ODM2ZTM2IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
Ywo+Pj4gQEAgLTIwMiw2ICsyMDIsOSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0
cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+Pj4gIAkJaWYgKGh3cHJvYmVfZXh0MF9oYXMoY3B1
cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKSkKPj4+ICAJCQlwYWlyLT52YWx1ZSA9IHJpc2N2
X2Nib3pfYmxvY2tfc2l6ZTsKPj4+ICAJCWJyZWFrOwo+Pj4gKwljYXNlIFJJU0NWX0hXUFJPQkVf
S0VZX1ZBX0JJVFM6Cj4+PiArCQlwYWlyLT52YWx1ZSA9IFZBX0JJVFM7Cj4+PiArCQlicmVhazsK
Pj4+ICAKPj4+ICAJLyoKPj4+ICAJICogRm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgdW5rbm93
biBrZXlzIGRvbid0IGZhaWwgdGhlIHdob2xlCj4+PiAtLSAKPj4+IDIuNDMuMAo+Pj4KPj4+Cj4+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
