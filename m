Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A579C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp0BpmcuTuUUJKSfkwqD+u1aybVl4TCBdXQT2SN5Evw=; b=QqsAXqUtUPXIS+
	Qe2vDxypu0uTHYqrRJ4j6HHtYYgIkYH6g8QLbT+/Lzs3DWmnwfb4UxokKLxA/2T34YGsTHJDTYLcD
	7fsP22p+pLqB2l64oGOy6FGGzpx8bYCTFUQPhOiG8ENIobyQoKph1EcvfvY5EqhYVD5CMQHz5Er7s
	+SqbFrBCKlJ363Vc3OR64f2s3NSmxUtRuG0jOCX6HSNk6HvKCN+pDWkNjQZfUsqVth0V0j/IHI081
	BIUqLrO6lTmCvF3gllaLomo9+92U1SNrczqtlEHVQdt0m2PMjGd02S6D5XOvh4mtnCOcYiae4uU0T
	a5q5mrEJkRvmDOcHtgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGggj-0068BJ-1y;
	Fri, 22 Dec 2023 14:39:45 +0000
Received: from smtp56.i.mail.ru ([95.163.41.94])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGggg-0068Ap-01
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 14:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=Nf9azq1dr1z2dpFM9eMLA/tB6ok0rLUWyMMPYho3Nds=; t=1703255979; x=1703345979; 
	b=EBGJH1pcjQ4fA+jJiqgJKSiP8SF2n/FuS4O1CN2+/gt7O2J0ixZ4X8JBgLysfztv7nFxld5tev7
	UJX+2rXHOvqr2nPRWHNhSPX30vi5AdNco9BrWQfYt7MqJS0Yae9slQoRGz/T3Cs8cPMW5B2wrigLF
	ETTN1F53DR3+mOtAIXQ57dJB8exP4K6Wff+TXB20J4om6gD6/yEk6kuEXJRqCW+zx+gKST4nYYr68
	vGtAi7beDGp72l/A3ERGtA9UXW3J704y9je4xC+HqLsVIggDMh12fcpOP4x/fgRs39F3NJGbas8UW
	rx/nXKu7jIOpmiI43BR0HGi7kne6IZSp80bg==;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rGggZ-002Msc-0P; Fri, 22 Dec 2023 17:39:35 +0300
Message-ID: <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru>
Date: Fri, 22 Dec 2023 17:39:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
To: Christoph Hellwig <hch@lst.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, mpe@ellerman.id.au, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, Conor Dooley <conor@kernel.org>
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
 <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
 <20231222041428.GA2803@lst.de>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20231222041428.GA2803@lst.de>
Authentication-Results: smtp56.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CAA89CC280A9C73C8312970F1BEE6B7403182A05F5380850405CF697BA74B6A9674E373B0751E947592A9A657C7DC718F9C700AD7340762BFD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70386A6136E33FD82EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377E85B0EC44E8FD73EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD8713C30587881FF020BBA20AE9EC107FDF020879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B9773578FCF50C7EAF9C588941B15DA834481FA18204E546F3947CFA486DC37A503D0BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063741F7343E26298569389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B08F9A42B2210255C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5422B6D5EE5F5B38D9D624E766B6FDA5FEE6E75F450048A99F87CCE6106E1FC07E67D4AC08A07B9B0DB8A315C1FF4794DBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34CAFBC0A7A4BEEE01EF0AC99BFA6B3341E98FB265FC4AF88B1E2C477CFBF0BD0176E9627D99F0F6D91D7E09C32AA3244CEBDF470873A2F30615B62B3E339914E151E887DA02A9F7BFAFF760E3CF2A505DB6C6411D86935C892AB2189BCAD71E73D640157F23F2FFE137E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2irTGYQEnL0n463ASQOuOg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3337E863210FDBA5BD78E186746C83CDCF98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_063942_407518_A3684188 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi4xMi4yMDIzIDA3OjE0LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBUaHUs
IERlYyAyMSwgMjAyMyBhdCAxMDoyNzozM1BNICswMDAwLCBKaWF4dW4gWWFuZyB3cm90ZToKPj4K
Pj4KPj4g5ZyoIDIwMjMvMTIvMjEgMjA6MjksIENvbm9yIERvb2xleSDlhpnpgZM6Cj4+PiArIENo
cmlzdG9waAo+Pj4KPj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBpcyBjb3JyZWN0LiBSZWdh
cmRsZXNzIG9mIHdoZXRoZXIgd2Ugc3VwcG9ydAo+Pj4gY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRp
b25zLCBETUEgaXMgYXNzdW1lZCB0byBiZSBjb2hlcmVudCB1bmxlc3MKPj4+IHBlcmlwaGVyYWxz
IGV0YyBhcmUgc3BlY2lmaWVkIHRvIG90aGVyd2lzZSBpbiBEVCAob3IgaG93ZXZlciBBQ1BJIGRl
YWxzCj4+PiB3aXRoIHRoYXQga2luZCBvZiB0aGluZykuCj4+Pgo+Pj4gV2hhdCBwcm9ibGVtIGFy
ZSB5b3UgdHJ5aW5nIHRvIHNvbHZlIGhlcmU/Cj4+Pgo+Pj4gT24gVGh1LCBEZWMgMjEsIDIwMjMg
YXQgMDk6NTE6NTJQTSArMDMwMCwgTWF4aW0gS29jaGV0a292IHdyb3RlOgo+Pj4+IE5vdCBhbGwg
dGhlIFJJU0NWIGFyZSBETUEgY29oZXJlbnQgYnkgZGVmYXVsdC4KPj4KPj4gU29ycnkgZm9yIGNo
aW1lIGluIGhlcmUuCj4+IElNTyBpZiB5b3VyIHBsYXRmb3JtIGlzIG5vdCBjb2hlcmVudCBieSBk
ZWZhdWx0LCBqdXN0IGluc2VydAo+PiAiZG1hLW5vbmNvaGVyZW50Igo+PiBhdCBkZXZpY2V0cmVl
IHJvb3Qgbm9kZS4KPiAKPiBFeGFjdGx5LiAgQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVGlzIGEg
c2V0dGluZyB0aGF0IGp1c3Qgc2F5cyBmb3IKPiBhIGdpdmVuIGFyY2hpdGVjdHVyZSBhc3N1bWVz
IGNvaGVyZW50IHVubGVzcyBvdGhlcndpc2Ugc3BlY2lmaWVkLAo+IHdoaWNoIGhhcyBoaXN0b3Jp
Y2FsbHkgYmVlbiB0aGUgY2FzZSBmb3IgbWlwcy4gIE5vdCBzZXR0aW5nIGl0IG1lYW5zCj4gbm9u
LWNvaGVyZW50IHVubGVzcyBzcGVjaWZpZWQsIHdoaWNoIGhhcyBoaXN0b3JpYWxseSBiZWVuIHRo
ZSBjYXNlCj4gZm9yIGFybS4KPiAKPiBSSVNDLVYgc3RhcnRlIG91dCB3aXRob3V0IHN1cHBvcnQg
Zm9yIG5vbi1jb2hlcmVudCBETUEsIGFuZCBoaWdoIHVwcwo+IGluIFJJU0NWIHN0aWxsIHRvbGQg
bWUgaW4gMjAxOSB0aGF0IFJJU0MtViBkb2Vzbid0IG5lZWQgY2FjaGUKPiBtYW5hZ2VtZW50IGlu
c3RydWN0aW9ucyBiZWNhdXNlIG5vIG5ldyBoYXJkd2FyZSB3b3VsZCBldmVyIG5vdCBiZQo+IGRt
YSBjb2hlcmVudC4gIFllYWgsIHJpZ2h0Li4KPiAKPiBBbnlheSwgTGludXggZm9yIFJJU0MtViBo
YXMgaGlzdG9yaWNhbGx5IGJlZW4gY29oZXJlbnQgb25seSBhbmQgdGhlbgo+IGNvaGVyZW50IGRl
ZmF1bHQsIHNvIHRoaXMgb3B0aW9uIGlzIHdyb25nLCBhbmQgeW91IG5lZWQgdG8gbWFyawo+IHlv
dSBwbGF0Zm9ybSBhcyBub24tY29oZXJlbnQgYnkgaW5zZXJ0aW5nIGRtYS1ub25jb2hlcmVudCBz
b21ld2hlcmUuCj4gCkNvbm9yLCBDaHJpc3RvcGgsIEppYXh1biwgdGhhbmtzIGZvciBxdWljayBm
ZWVkYmFjayEKClRoZSBwcm9ibGVtIGlzIHZlcnkgc2ltcGxlOgpGb3Igbm9uIG1pcHMgcGxhdGZv
cm1zIGRtYV9kZWZhdWx0X2NvaGVyZW50IGlzIHVzZWQgYXQgCm9mX2RtYV9pc19jb2hlcmVudCgp
IGFuZCBkZXZpY2VfaW5pdGlhbGl6ZSgpLgpvZl9kbWFfaXNfY29oZXJlbnQoKSBhZmZlY3RzIG9u
bHkgRFQgZGV2aWNlcy4gQW5kIHdlIGNhbiBvdmVycmlkZSBpdCAKd2l0aCAiZG1hLWNvaGVyZW50
Ii8iZG1hLW5vbmNvaGVyZW50Ii4gQUNQSSBkZXZpY2VzIGNhbiBzcGVjaWZ5IGJ5CiJhdHRyID09
IERFVl9ETUFfQ09IRVJFTlQiLiBCdXQgYWxsIG90aGVyIGRldmljZXMgKHBsYXRmb3JtX2Rldmlj
ZSwgdXNiLCAKZXRjLi4pIGRvIG5vdCBoYXZlIHRoaXMgZmVhdHVyZS4gVGhlc2UgZGV2aWNlcyB3
aWxsIHVzZSB2YWx1ZSBmcm9tIApkZXZpY2VfaW5pdGlhbGl6ZSgpLiBBbmQgd2UgaGF2ZSBubyBw
b3NzaWJpbGl0eSB0byBjaGFuZ2UgCmRtYV9kZWZhdWx0X2NvaGVyZW50IHZhbHVlIGJ5IGRpc2Fi
bGluZyBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5ULgpNb3Jlb3ZlciwgY2hhbmdpbmcgZG1hX2Rl
ZmF1bHRfY29oZXJlbnQgZnJvbSBmYWxzZSB0byB0cnVlIG1heSBjYXVzZSAKcmVncmVzc2lvbiBm
b3Igb3RoZXIgZGV2aWNlcy4gVGhhdCBpcyB3aHkgSSBzdWdnZXN0IHBvc3NpYmlsaXR5IHRvIApk
aXNhYmxlIEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQgYnkgUklTQ1ZfRE1BX05PTkNPSEVSRU5U
IG9wdGlvbi4KSXQgd2lsbCB3b3JrcyBsaWtlIGZvciBQUEM6Ci4uLi4uCmNvbmZpZyBQUEMKCWJv
b2wKCWRlZmF1bHQgeQoJIwoJIyBQbGVhc2Uga2VlcCB0aGlzIGxpc3Qgc29ydGVkIGFscGhhYmV0
aWNhbGx5LgoJIwoJc2VsZWN0IEFSQ0hfMzJCSVRfT0ZGX1QgaWYgUFBDMzIKCXNlbGVjdCBBUkNI
X0RJU0FCTEVfS0FTQU5fSU5MSU5FCWlmIFBQQ19SQURJWF9NTVUKCXNlbGVjdCBBUkNIX0RNQV9E
RUZBVUxUX0NPSEVSRU5UCWlmICFOT1RfQ09IRVJFTlRfQ0FDSEUKLi4uLi4KRG9lc24ndCB0aGUg
b3B0aW9uIFJJU0NWX0RNQV9OT05DT0hFUkVOVCBzYXkgdGhlIERNQSBzaG91bGQgYmUgCm5vbi1j
b2hlcmVudCBieSBkZWZhdWx0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
