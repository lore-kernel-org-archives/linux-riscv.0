Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5499EEF9008
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAijBk6PbE0LIp0xxY/URhpJ6noB1lnm+6X15cxlgPI=; b=ISiaxxfy9A/9HU
	frNzezsStBij+aHjJKLiCI/kgDttt2nLk5en9Re5mu8oLWmNLiIhJNKCaWJrozsFWDgo3VWxnf+yV
	GQGAplY6dA9g9cVrrKm2ISDjquhGrIHpPU9aZyrlhrgCV7wlUwOOybs9a6YCle9h3faLG3lr0g1zf
	a3L6KCfiwXXlIuqstqBnuqkOaez2BD8au8GvGuj41O9p+AiqRCmgLVBW5nsU7pB8p95NND5oJut0p
	N4tVlqmnf+A7VwlI1uLyBxWR/ThLEvn6ayxwe2No9U3IuUFmnOvKvJjYnHbbU5ANGW2UVWBKpwN9c
	A+FHviptweamJAyySV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpcl-000000007tA-0CYS;
	Wed, 04 Mar 2026 17:03:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpci-000000007sn-1I2b
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 17:03:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61EA61A2CA1;
	Wed,  4 Mar 2026 17:02:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F80D5FF5C;
	Wed,  4 Mar 2026 17:02:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3E6F10369809;
	Wed,  4 Mar 2026 18:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772643772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sODLPMYGQLwK7VG/qzqpYRuey9+fGjObXaGpaoPYVxA=;
	b=vlHbg9XWQISpg0A5b+4H8VkG3UaKYlL6eZtxbiRBCiQMh896b3mlEYG3TF7Hhr6tlPSWA9
	FBSKD1XiHVdbgZVsS09NT1gkvPZV+DJQ/4fUrSfrcJQNMuqK1b5DytMGsmtMfcz02oi4lM
	32ATO7UCJauYy4JyH/CY4wGJeMsaGh90VRzR9S70sNp7fEO5FpWtSvjQLG8kC0nTfrIJIE
	pCnuwBqOoqMgEI1Gh9aGAjdGQdzm0nW+TduPjXdiYymjFumKBWPvaTSEFnuQZ+Pd5mCGDI
	7lD6Tm/SlVbPRxng5/dkphat4okLKT1+AjNC4plqD4bTIm6OrDYl28cptnGKXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,  Ron Economos <re@w6rz.net>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  wsa+renesas@sang-engineering.com
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
In-Reply-To: <20260228-defuse-extenuate-cf2a90ae66ea@spud> (Conor Dooley's
	message of "Sat, 28 Feb 2026 15:39:01 +0000")
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
	<aaL2WVO_7bl6vNp5@sirena.co.uk>
	<20260228-ragweed-theater-b02967937353@spud>
	<20260228-defuse-extenuate-cf2a90ae66ea@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 04 Mar 2026 18:02:47 +0100
Message-ID: <87tsuvh6iw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090300_505748_7A5515F4 
X-CRM114-Status: GOOD (  13.57  )
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

T24gMjgvMDIvMjAyNiBhdCAxNTozOTowMSBHTVQsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFNhdCwgRmViIDI4LCAyMDI2IGF0IDAyOjIzOjAwUE0gKzAwMDAs
IENvbm9yIERvb2xleSB3cm90ZToKPj4gT24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMDI6MDY6MTdQ
TSArMDAwMCwgTWFyayBCcm93biB3cm90ZToKPj4gPiBPbiBTYXQsIEZlYiAyOCwgMjAyNiBhdCAw
NTo1NDowNkFNIC0wODAwLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4+ID4gCj4+ID4gPiBJJ20gZ2V0
dGluZyBhbiBTUEkgZmFpbHVyZSB3aXRoIExpbnV4IHY3LjAtcmMxIG9uIHRoZSBWaXNpb25GaXZl
IDIgUklTQy1WIGJvYXJkLgo+PiA+IAo+PiA+ID4gRmViIDI4IDAwOjI5OjMzIHZpc2lvbmZpdmUg
a2VybmVsOiBjYWRlbmNlLXFzcGkgMTMwMTAwMDAuc3BpOiBRU1BJIGlzIHN0aWxsIGJ1c3kgYWZ0
ZXIgNTAwbXMgdGltZW91dC4KPj4gPiA+IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5l
bDogY2FkZW5jZS1xc3BpIDEzMDEwMDAwLnNwaTogZGV0ZWN0ZWQgRklGTyBkZXB0aCAoMSkgZGlm
ZmVyZW50IGZyb20gY29uZmlnICgyNTYpCj4+ID4gPiBGZWIgMjggMDA6Mjk6MzMgdmlzaW9uZml2
ZSBrZXJuZWw6IGNhZGVuY2UtcXNwaSAxMzAxMDAwMC5zcGk6IFFTUEkgaXMgc3RpbGwgYnVzeSBh
ZnRlciA1MDBtcyB0aW1lb3V0Lgo+PiA+ID4gRmViIDI4IDAwOjI5OjMzIHZpc2lvbmZpdmUga2Vy
bmVsOiBjYWRlbmNlLXFzcGkgMTMwMTAwMDAuc3BpOiBRU1BJIGlzIHN0aWxsIGJ1c3kgYWZ0ZXIg
NTAwbXMgdGltZW91dC4KPj4gPiA+IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDog
c3BpLW5vciBzcGkxLjA6IG9wZXJhdGlvbiBmYWlsZWQgd2l0aCAtMTEwCj4+ID4gPiBGZWIgMjgg
MDA6Mjk6MzMgdmlzaW9uZml2ZSBrZXJuZWw6IHNwaS1ub3Igc3BpMS4wOiBwcm9iZSB3aXRoIGRy
aXZlciBzcGktbm9yIGZhaWxlZCB3aXRoIGVycm9yIC0xMTAKPj4gPiAKPj4gPiBGV0lXIGNvbmZp
cm1lZCBvbiBteSBzeXN0ZW06Cj4+ID4gCj4+ID4gICAgaHR0cHM6Ly9sYXZhLnNpcmVuYS5vcmcu
dWsvc2NoZWR1bGVyL2pvYi8yNTA0MDI2I0w3MTUKPj4gPiAKPj4gPiAod2hpY2ggSSBkaWRuJ3Qg
bm90aWNlIGFzIHRoYXQgd2FzIGp1c3QgYnVpbGRyb290IGFuZCBub3QgcnVubmluZwo+PiA+IGtz
ZWxmdGVzdC1kdC4uLikuCj4+IAo+PiBUaGlzIHByb2JhYmx5IGNvbnN0aXR1dGVzIHJhbmRvbSBz
cGVjdWxhdGlvbiwgYnV0IEkgYW0gY3VyaW91cyBpZgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTEwLmR0c2kKPj4gaW5kZXggNmU1NmU5ZDIwYmIwNi4uMzkwZmE4N2VkYmFmOCAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+IEBAIC04
NzMsOSArODczLDkgQEAgcXNwaTogc3BpQDEzMDEwMDAwIHsKPj4gIAkJCSAgICAgIDwweDAgMHgy
MTAwMDAwMCAweDAgMHg0MDAwMDA+Owo+PiAgCQkJaW50ZXJydXB0cyA9IDwyNT47Cj4+ICAJCQlj
bG9ja3MgPSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX1FTUElfUkVGPiwKPj4gLQkJCQkgPCZzeXNj
cmcgSkg3MTEwX1NZU0NMS19RU1BJX0FIQj4sCj4+IC0JCQkJIDwmc3lzY3JnIEpINzExMF9TWVND
TEtfUVNQSV9BUEI+Owo+PiAtCQkJY2xvY2stbmFtZXMgPSAicmVmIiwgImFoYiIsICJhcGIiOwo+
PiArCQkJCSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX1FTUElfQVBCPiwKPj4gKwkJCQkgPCZzeXNj
cmcgSkg3MTEwX1NZU0NMS19RU1BJX0FIQj47Cj4+ICsJCQljbG9jay1uYW1lcyA9ICJyZWYiLCAi
YXBiIiwgImFoYiI7Cj4+ICAJCQlyZXNldHMgPSA8JnN5c2NyZyBKSDcxMTBfU1lTUlNUX1FTUElf
QVBCPiwKPj4gIAkJCQkgPCZzeXNjcmcgSkg3MTEwX1NZU1JTVF9RU1BJX0FIQj4sCj4+ICAJCQkJ
IDwmc3lzY3JnIEpINzExMF9TWVNSU1RfUVNQSV9SRUY+Owo+PiBoYXMgYW55IGltcGFjdC4gR29p
bmcgZnJvbSBqaDcxMTAgc3BlY2lmaWMgY29kZSB0byBidWxrIGFwaXMgaXMgYW4KPj4gb3JkZXJp
bmcgY2hhbmdlLCByaWdodD8KPgo+IEFjY29yZGluZyB0byBSb24sIGl0IGhhZCBubyBpbXBhY3Qu
CgpUaGUgb3RoZXIgY2hhbmdlIHRoYXQgY291bGQgYmUgIml0IiBpcyB0aGUgY2hhbmdlIG9mIG9y
ZGVyIGJldHdlZW4gcmVzZXQKaGFuZGxpbmcgYW5kIGNsb2NrLiBUaGF0IHdvdWxkIGJlIHF1aXRl
IG1lc3N5IGlmIHRoYXQgd2FzIHRoZSBlcnJvciBidXQKSSBjYW5ub3QgZmluZCBhbm90aGVyIGV4
cGxhbmF0aW9uLiBSb24sIGNhbiB5b3UgcGxlYXNlIHRyeSB0byByZXZlcnQKdGhpcyBwYXRjaCBs
b2NhbGx5IGFuZCB0aGVuIG1vdmUgdGhlIGNsa19wcmVwYXJlX2VuYWJsZSgpIG9mIHRoZSBBUEIg
YW5kCkFIQiBjbG9ja3MgZWFybGllciwgcmlnaHQgYWZ0ZXIgdGhlIHJlZiBjbG9jayBpcyBhbHNv
IGVuYWJsZWQ/IElmIHRoZQpwbGF0Zm9ybSBmYWlscyB0byBib290LCB0aGVyZSBpcyBtYXliZSBh
IHdlaXJkIGludGVybmFsIHJlbGF0aW9uc2hpcAp3aXRoIHRoZSByZXNldHMuCgpPdGhlcndpc2Ug
Y2FuIHlvdSBjb21wYXJlIHRoZSBjbGtfZ2V0X3JhdGUoKSBvbiBhbGwgdGhyZWUgY2xvY2tzIGlu
IGJvdGgKY2FzZXM/CgpUaGFuayB5b3UsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
