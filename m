Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7886EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJ9pH1K8En6MYjhos0Q6mnqr6J9AV3zbuu+9A/pdkPc=; b=tfiK/Pv1HSqu4t
	NDx0Ol7mou8OSjVWGkCBCmcyZyeXfQYfs+N9HTZ9IPBohhnKVp4kuVjO+9jzbaAwSeuuY57vjxi5q
	0Zbm3N+cH4KUrfIPPMhTXv7OizP9GLQhyfj2WwwARJEL2i7FyrPmfR2+u+mkNVMOAMO9w/FK6iC/L
	vuEyH8vynXoG0w/cA/BUKIdIVHZy7IGeO++ArSv5bCCbvDnAJPB3iYGVpV8akiCEH5UhBf5X3hAZ8
	4QsJKLUKeL97yudXmiZAWKoeVWnQxn1nauJ0djeZPzTZk4mND65siI2bH7OFXmXtI1jnDIrtHVlv5
	MXhrw1BmgMtCTeXXUGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwbX-000HgJ-KV; Thu, 29 Dec 2022 17:22:07 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwbU-000Hab-E5
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 17:22:06 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2FCEA32005C1;
	Thu, 29 Dec 2022 12:21:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 29 Dec 2022 12:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672334516; x=
	1672420916; bh=QJOjYC8ur79wEhI5X44d2FsV4Yf4TjIn7hONPRpkry8=; b=r
	+jVhARpBTe3OVe5K2tzzMXVW8/D6qP8pu0qkT46TXlZHSvBUfxWkCthV/1oQ7qqK
	0nvo6qB/6RyetqVoY1spxV2A4YKfVFK5WT8MLKea6OB4F0mmBA5z5sNzDPX2mLAL
	V9xT822r9DiUDMPqfLEtW6P6wLXA+2jhsiLX440/yOfqmGqwPt7YzFZdQPWj0ktD
	hICSH1riQIL+d/y9j6DsxbXHDzT4oNLE95D1kLynpmpC+/Uwzz2ZZvyHtq9hjyVI
	e5GJfuA6BjECmb76o6cZRKoelsXxwaOkMRwjhr7t8U+urWvOwt/WttEuoE5OSwss
	Hqr7sLXsogVHPP3Qr+SpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672334516; x=
	1672420916; bh=QJOjYC8ur79wEhI5X44d2FsV4Yf4TjIn7hONPRpkry8=; b=w
	9LnjGR97KXyu5hMUQ0lMxeXJrSXD6c2cK0Pdd9fs7SmxAC9ExnselbifOEnijxMW
	Di2vSF+mCiGjFlPAdnmtfscrRAdZDNPXO9aFXrf/HJhHbNO707c+eGrCNZhOOh+k
	jydFnKYaCAehkYL/OOXvqdd8xMPXEYIvc/wCRGAfz1IS7O1cSA7ZvnJniUPjlbm0
	TEn+6Ltpp59ZaM5aHZT8FHxwOT1XZlIsgGAhEy8dh3pLZGUTXTNGpzRoUh+9VFDG
	yhpiNSlGUuXEwDS18MUGZ/RNOdKpOkoUnER6GTNL2syhYzOMtgMym+ZozlCP25Og
	8gZ9t1ZbAvaewUcWueSfg==
X-ME-Sender: <xms:s8ytYyViZIgZ0PKto4SfZ9s7odJXjdaBOxTrb10g1CHWquCHt6IyLg>
    <xme:s8ytY-kj_Rqc1g1gAu6Z1maGgE1mzVUwscMo2bsAJMskrQHGDi_1vAU6c9__oIH3-
    Hb4nBdweIQTnS3_gA>
X-ME-Received: <xmr:s8ytY2b4Nwxyaz85nkWWqjOf1E1HEhis5wIs9UJJXel9TYsjw8yQaa95XVVgdP-7KQxkgq23JZuI1fdPF0EAuKl1QU5LXRiA6Y0SC8bmuXIJXM_8uXATXVgZzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeeikefgheduvdfhheelkedvffelueehgeejtdeuieduieejhedv
    vddtfeevleeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:s8ytY5XT6zNYfXtnGR6EzMX_7elxSRtPASlTviAwrKKCmRWwJ3cuaQ>
    <xmx:s8ytY8m4IHvcv3gmFQpizdQSQOzTMcUfSdCvTeDQ3eQAM2jU00zDUA>
    <xmx:s8ytY-ffJfvgNW-49u2McTdNmQ56es7_A7L-RiVI9SsVcGJrM_Q94Q>
    <xmx:tMytY6aacm78Tw1mwEv-MR8SKqMo5dFw7uffQcgSxILEJFhdTvfjzQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 12:21:55 -0500 (EST)
Message-ID: <86ad9bca-dc30-924c-6017-8cec5a0389b3@sholland.org>
Date: Thu, 29 Dec 2022 11:21:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 prabhakar.csengg@gmail.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <mhng-e60a7fcd-f497-4bca-8de3-b57e2a2d3532@palmer-ri-x1c9>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock source
 rating
In-Reply-To: <mhng-e60a7fcd-f497-4bca-8de3-b57e2a2d3532@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_092204_801874_F044EF3E 
X-CRM114-Status: GOOD (  26.90  )
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

SGkgUGFsbWVyLAoKT24gMTIvMjkvMjIgMTA6MjIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9u
IFR1ZSwgMjcgRGVjIDIwMjIgMTY6NDQ6NDQgUFNUICgtMDgwMCksIHNhbXVlbEBzaG9sbGFuZC5v
cmcgd3JvdGU6Cj4+IFJJU0MtViBwcm92aWRlcyBhbiBhcmNoaXRlY3R1cmFsIGNsb2NrIHNvdXJj
ZSB2aWEgdGhlIHRpbWUgQ1NSLiBUaGlzCj4+IGNsb2NrIHNvdXJjZSBleHBvc2VzIGEgNjQtYml0
IGNvdW50ZXIgc3luY2hyb25pemVkIGFjcm9zcyBhbGwgQ1BVcy4KPj4gQmVjYXVzZSBpdCBpcyBh
Y2Nlc3NlZCB1c2luZyBhIENTUiwgaXQgaXMgbXVjaCBtb3JlIGVmZmljaWVudCB0byByZWFkCj4+
IHRoYW4gTU1JTyBjbG9jayBzb3VyY2VzLiBGb3IgZXhhbXBsZSwgb24gdGhlIEFsbHdpbm5lciBE
MSwgcmVhZGluZyB0aGUKPj4gc3VuNGkgdGltZXIgaW4gYSBsb29wIHRha2VzIDEzMSBjeWNsZXMv
aXRlcmF0aW9uLCB3aGlsZSByZWFkaW5nIHRoZQo+PiBSSVNDLVYgdGltZSBDU1IgdGFrZXMgb25s
eSA1IGN5Y2xlcy9pdGVyYXRpb24uCj4+Cj4+IEFkanVzdCB0aGUgUklTQy1WIGNsb2NrIHNvdXJj
ZSByYXRpbmcgc28gaXQgaXMgcHJlZmVycmVkIG92ZXIgdGhlCj4+IHZhcmlvdXMgcGxhdGZvcm0t
c3BlY2lmaWMgTU1JTyBjbG9jayBzb3VyY2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwg
SG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPj4gLS0tCj4+Cj4+IMKgZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMiArLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3Nv
dXJjZS90aW1lci1yaXNjdi5jCj4+IGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5j
Cj4+IGluZGV4IGEwZDY2ZmFiZjA3My4uNTVkYWQ3OTY1ZjQzIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCj4+IEBAIC03Myw3ICs3Myw3IEBAIHN0YXRpYyB1NjQgbm90cmFjZSBy
aXNjdl9zY2hlZF9jbG9jayh2b2lkKQo+Pgo+PiDCoHN0YXRpYyBzdHJ1Y3QgY2xvY2tzb3VyY2Ug
cmlzY3ZfY2xvY2tzb3VyY2UgPSB7Cj4+IMKgwqDCoMKgIC5uYW1lwqDCoMKgwqDCoMKgwqAgPSAi
cmlzY3ZfY2xvY2tzb3VyY2UiLAo+PiAtwqDCoMKgIC5yYXRpbmfCoMKgwqDCoMKgwqDCoCA9IDMw
MCwKPj4gK8KgwqDCoCAucmF0aW5nwqDCoMKgwqDCoMKgwqAgPSA0MDAsCj4+IMKgwqDCoMKgIC5t
YXNrwqDCoMKgwqDCoMKgwqAgPSBDTE9DS1NPVVJDRV9NQVNLKDY0KSwKPj4gwqDCoMKgwqAgLmZs
YWdzwqDCoMKgwqDCoMKgwqAgPSBDTE9DS19TT1VSQ0VfSVNfQ09OVElOVU9VUywKPj4gwqDCoMKg
wqAgLnJlYWTCoMKgwqDCoMKgwqDCoCA9IHJpc2N2X2Nsb2Nrc291cmNlX3JkdGltZSwKPiAKPiBJ
J3ZlIG5ldmVyIHJlYWxseSB1bmRlcnN0b29kIHdoYXQgd2UncmUgc3VwcG9zZWQgdG8gZG8gaGVy
ZSwgaXQgc2VlbXMKPiBsaWtlIHdlJ3JlIGp1c3QgcGlja2luZyBhcmJpdHJhcnkgcmF0aW5ncyBm
b3IgdGhlIHZhcmlvdXMgY2xvY2sgZHJpdmVycwo+IHRvIGdldCB0aGUgb25lIHdlIHdhbnQuwqAg
VGhhdCdzIHJlYWxseSBhIHByb3BlcnR5IG9mIHRoZSB3aG9sZSBwbGF0Zm9ybSwKPiB0aG91Z2gs
IG5vdCB0aGUgZHJpdmVycywgc28gdHJ5aW5nIHRvIGVuY29kZSBpdCBhcyBwYXJ0IG9mIHRoZSBk
cml2ZXIKPiBzZWVtcyBhd2t3YXJkIC0tIGlmIGFueXRoaW5nIEknZCBleHBlY3QgdGhlIElTQSBj
bG9jayBkcml2ZXJzIHRvIGJlIHRoZQo+IHdvcnN0IG9uIGFueSBwbGF0Zm9ybSwgYXMgb3RoZXJ3
aXNlIHdoYXQncyB0aGUgcG9pbnQgb2YgYWRkaW5nIHRoZQo+IHBsYXRmb3JtLXNwZWNpZmljIG1l
Y2hhbmlzbT8KCkZvciBzdW54aSBhdCBsZWFzdCwgdGhlIHBsYXRmb3JtLXNwZWNpZmljIE1NSU8g
dGltZXJzIGNhbWUgZmlyc3QsIGFzIHRoZQpBUk0gYXJjaGl0ZWN0dXJhbCB0aW1lciB3YXMgbm90
IGltcGxlbWVudGVkIGluIHRoZSBmaXJzdCBjb3VwbGUgb2YgU29Dcy4KVGhlIEFSTSBhcmNoaXRl
Y3R1cmFsIHRpbWVyIHdhcyB1bml2ZXJzYWxseSBiZXR0ZXIgZm9yIHRpbWVrZWVwaW5nCihwZXJj
cHUgZXZlbnRzLCBmYXN0ZXIgYWNjZXNzLCBsYXJnZXIgcmFuZ2UpLCBzbyB3ZSBjb21wbGV0ZWx5
IGlnbm9yZWQKdGhlIE1NSU8gdGltZXJzIG9uY2UgaXQgd2FzIGF2YWlsYWJsZS4KCldlIGV2ZW50
dWFsbHkgd2VudCBiYWNrIGFuZCBlbmFibGVkIHRoZSBNTUlPIHRpbWVycyBldmVyeXdoZXJlIGJl
Y2F1c2UKdGhleSBhcmUgdXNlZnVsIGZvciBQTS4gRWl0aGVyIHRoZXkgZG9uJ3QgaGF2ZSBDTE9D
S19FVlRfRkVBVF9DM1NUT1AsIG9yCnRoZXkgZG8gaGF2ZSBDTE9DS19TT1VSQ0VfU1VTUEVORF9O
T05TVE9QLCBvciBib3RoLgoKSSBpbWFnaW5lIHRoZSBSSVNDLVYgc2l0dWF0aW9uIHdpbGwgYmUg
c2ltaWxhci4gVGhlIHRpbWUgQ1NSIHdpbGwgYmUKdXNlZCBhcyB0aGUgcHJpbWFyeSBjbG9ja3Nv
dXJjZSBhbmQgZm9yIHNjaGVkX2Nsb2NrLCB3aGlsZSBNTUlPIGNsb2NrCnNvdXJjZXMgd2lsbCBv
bmx5IGJlIHVzZWQgaW4gc3BlY2lmaWMgUE0gc2NlbmFyaW9zIHdoZXJlIHRoZSB0aW1lIENTUiBp
cwp1bmF2YWlsYWJsZS4KClBsdXMgdGhlcmUgaXMgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gY2xv
Y2sgc291cmNlcyBhbmQgY2xvY2sgZXZlbnRzLgpEcml2ZXJzIHVzdWFsbHkgcHJvdmlkZSBib3Ro
LCBidXQgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQgdGhhdCBib3RoIGJlCnVzZWQuIFRoZSBSSVND
LVYgYXJjaGl0ZWN0dXJlIHByb3ZpZGVzIGEgaGlnaCBxdWFsaXR5IGNsb2NrIHNvdXJjZSAodGlt
ZQpDU1IpIGJ1dCBhIHBvb3IgcXVhbGl0eSBjbG9jayBldmVudCAoU0JJIGNhbGwpIHVubGVzcyBT
c3RjIGlzIGF2YWlsYWJsZS4KU28gcGxhdGZvcm1zIHdpdGhvdXQgU3N0YyBtYXkgdXNlIGEgY29t
YmluYXRpb24gb2YgZHJpdmVyczogdGhlIFJJU0MtVgpjbG9jayBzb3VyY2UgYWxvbmcgd2l0aCBh
IHBsYXRmb3JtLXNwZWNpZmljIGNsb2NrIGV2ZW50LgoKPiBUaGF0IHNhaWQsIEknbSBmaW5lIHdp
dGggdGhpcyBhcyBsb25nIGFzIGl0J3MgaW1wcm92aW5nIHRoaW5ncyBvbiB0aGUKPiBwbGF0Zm9y
bXMgdGhhdCBhY3R1YWxseSBleGlzdC7CoCBJSVVDIGl0J3Mgb25seSB0aGUgRDEgdGhhdCBoYXMg
bXVsdGlwbGUKPiBjbG9jayBkcml2ZXJzIGN1cnJlbnRseSwgc28gaWYgaXQncyBnb29kIHRoZXJl
IGl0J3MgZ29vZCBmb3IgbWUuwqAgV2UnbGwKClJaL0ZpdmUgYWxzbyBoYXMgYSBwbGF0Zm9ybSBN
TUlPIHRpbWVyIGRyaXZlclsxXS4KClsxXToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIyMTIxMTIxNTg0My4yNDAyNC0xLXByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbS8KCj4gZ28gY3JhenkgdHJ5aW5nIHRvIHJlYXNvbiBhYm91dCBhbGwgcG9zc2libGUgZnV0
dXJlIGhhcmR3YXJlLCBzbyB3ZSBjYW4KPiBqdXN0IHNvcnQgb3V0IGhvdyB0byBtYWtlIHN0dWZm
IHdvcmsgYXMgaXQgc2hvd3MgdXAuwqAgU286Cj4gCj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KPiAKPiBJJ2xsIGxldCB0aGUgY2xvY2sgZm9sa3MgY2hpbWUgaW4s
IGhhcHB5IHRvIHRha2UgaXQgdGhyb3VnaCB0aGUgUklTQy1WCj4gdHJlZSBidXQgdW5sZXNzIHNv
bWVvbmUgc2F5cyBzb21ldGhpbmcgSSdtIGdvaW5nIHRvIGFzc3VtZSBpdCdzIGFpbWVkCj4gb3Zl
ciB0aGVyZS4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKClJlZ2FyZHMsClNhbXVlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
