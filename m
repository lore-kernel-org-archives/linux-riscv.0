Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3E2C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWom5J/uNvfnDcyBHzpFJKUXvglt66owrPY3JlhCgy0=; b=DBiSqxASJZfbi4
	u3uietdfrUjdzczjx7UFh+he0cwcePLnwT1x77xfu8Ld7LXmCq264/oLt59ItdoRl8QYCTN01XoPF
	SZVmGrUf1r9/L9A4lMHQBOFSArhY0hPRdnJF+AiJcVbpdf0J8x3mdULYDPc4D+p6DoEbAiXM6WEND
	X5iHvSw6th1AobW4dEjkTFZ4l12T4xaztZoQ+b+taB/CJk5HXqLmcgs6GBohCxs1zn+rjN0K6AbgI
	atc8kMFAvOgRHBKtWh2flQdnfpiW1R0mC2tYIwXt27svEPhfY+M8iJ1qJLXCRB1sKYst9iikXhg30
	t0uGqvTyFyg/KNjKXPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhpo-006IMU-2j;
	Fri, 22 Dec 2023 15:53:12 +0000
Received: from smtp42.i.mail.ru ([95.163.41.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhpl-006ILk-2x
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 15:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=tFX7RIj6C4VOXEVclZN5OjxZXLaRdz1+7SGbge9WIxs=; t=1703260387; x=1703350387; 
	b=AEiewmGloX+u4+kxmpv1dxtP7ns64hU8CVbdc7cu8lNGR4IdIJ6aCRdNgZr83IXW9QdniedoVb1
	+GYkOSVendwcYqaaJ8JHTgctUpONLC5XCXWfJnk1mQfdoDr/NPWtjIFIQMw+BKu6pBTt+SRbdkDf5
	gNgMYHwuXqNyOKps1FPvqBbDkHj6FtfoNMr+G9/wM2uZH3jXDPnrRTw0RA9rnBLRvD5R/w0QqkL5N
	pkRBtPxfySIJTpGYkTdqmNOTvsOCV5WDaym6JlqHx0XhcdhhxXTMbxB02PXjXTYH/HSwcuN59VQEX
	sTAq8efSEId9Mg7cw2yvXrlJfy+eUumGQ6lQ==;
Received: by smtp42.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rGhpg-00796u-0F; Fri, 22 Dec 2023 18:53:04 +0300
Message-ID: <6fe34090-656d-491f-8173-217d20144166@inbox.ru>
Date: Fri, 22 Dec 2023 18:53:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Conor Dooley <conor@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, mpe@ellerman.id.au,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
 <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
 <20231222041428.GA2803@lst.de>
 <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru>
 <20231222-outburst-spoiling-75082a7826dd@spud>
 <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru>
 <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com>
Authentication-Results: smtp42.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CA109546F350B61F5EDC408D7902253DD5182A05F5380850408BBE584FEAE74C4539FF6257257E6F732B69E9FC229A0382F9F108893D24C065
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D3DF794D859AA4BFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C6DD7975580F9310C78194386F3CEFB36F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5A9DDD64047EE0ECD726471AB7954A9BFC5C376C41ADB842DF87CCE6106E1FC07E67D4AC08A07B9B0735DFC8FA7AC1207CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34D041FB2E16F174C4814B294BBADEE008254CAADB2070B4D94B27FDBDE07EC7DA9DFAD9A56969026F1D7E09C32AA3244C5A6F8828DC41BDF772EC9D558279C71A35DA7DC5AF9B58C0AFF760E3CF2A505DB6C6411D86935C892AB2189BCAD71E73D640157F23F2FFE137E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2irTGYQEnL3NODs1OB0pRw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33BFF2CCA92290786441A33AD183A5E18A98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_075310_316254_C8393148 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi4xMi4yMDIzIDE4OjQ1LCBKaWF4dW4gWWFuZyB3cm90ZToKPiAKPiAKPiDlnKggMjAy
My8xMi8yMiAxNTozOCwgTWF4aW0gS29jaGV0a292IOWGmemBkzoKPj4KPj4KPj4gT24gMjIuMTIu
MjAyMyAxNzo1NCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pgo+Pj4+IGV0Yy4uKSBkbyBub3QgaGF2
ZSB0aGlzIGZlYXR1cmUuIFRoZXNlIGRldmljZXMgd2lsbCB1c2UgdmFsdWUgZnJvbQo+Pj4+IGRl
dmljZV9pbml0aWFsaXplKCkuIEFuZCB3ZSBoYXZlIG5vIHBvc3NpYmlsaXR5IHRvIGNoYW5nZQo+
Pj4+IGRtYV9kZWZhdWx0X2NvaGVyZW50IHZhbHVlIGJ5IGRpc2FibGluZyBBUkNIX0RNQV9ERUZB
VUxUX0NPSEVSRU5ULgo+Pj4+IE1vcmVvdmVyLCBjaGFuZ2luZyBkbWFfZGVmYXVsdF9jb2hlcmVu
dCBmcm9tIGZhbHNlIHRvIHRydWUgbWF5IGNhdXNlCj4+Pj4gcmVncmVzc2lvbiBmb3Igb3RoZXIg
ZGV2aWNlcy4KPj4+Cj4+PiBIb3cgY2FuIHRoZXJlIGJlIGEgcmVncmVzc2lvbiB3aGVuIGRtYSBo
YXMgYmVlbiBjb2hlcmVudCBieSBkZWZhdWx0IGZvcgo+Pj4gdGhlIFJJU0MtViBrZXJuZWwgZnJv
bSBkYXkgMT8KPj4KPj4gQmVmb3JlIEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQgcGF0Y2ggZG1h
X2RlZmF1bHRfY29oZXJlbnQgd2FzIHVzZWQgCj4+IHVuYXNzaWduZWQgYXMgImZhbHNlIiBpbiBk
ZXZpY2VfaW5pdGlhbGl6ZSgpOgo+PiAuLi4uLi4uLi4uCj4+ICNpZiBkZWZpbmVkKENPTkZJR19B
UkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFKSB8fCBcCj4+IMKgwqDCoCBkZWZpbmVkKENPTkZJ
R19BUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVKSB8fCBcCj4+IMKgwqDCoCBkZWZpbmVkKENPTkZJ
R19BUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVX0FMTCkKPj4gwqDCoMKgwqBkZXYtPmRtYV9jb2hl
cmVudCA9IGRtYV9kZWZhdWx0X2NvaGVyZW50Owo+PiAjZW5kaWYKPj4gLi4uLi4uLi4uLgo+PiBB
bmQgbm93IGl0IGJlY29tZXMgInRydWUiLiBJdCBtYXkgY2hhbmdlIGJlaGF2aW9yIG9mIG90aGVy
IG5vbi1EVCAKPj4gZHJpdmVycy4KPiBJIGRvbid0IHNlZSBhbnkgcHJvYmxlbSBoZXJlLCBkZWZh
dWx0IGlzIGRlZmF1bHQuCj4gQWN0dWFsbHkgbGVhdmluZyB0aG9zZSBkZXZpY2Ugd2l0aMKgIGRl
di0+ZG1hX2NvaGVyZW50ID0gZmFsc2UgaXMgcmlza3ksIAo+IGJlY2F1c2UKPiB3ZSBjYW4ndCBn
dWFyYW50ZWUgdW5kZXJseWluZyBjYWNoZSBmbHVzaCBmdW5jdGlvbnMgYXJlIGhlcmUuCj4gCj4g
SWYgYSBub24tZHQgZGV2aWNlIGRvIG5lZWQgdG8gb3ZlcnJpZGUgaXQsIGl0IHNob3VsZCBiZSBk
b25lIGluIAo+IGFyY2hfc2V0dXBfZG1hX29wcy4KCkJ1dCBhcmNoX3NldHVwX2RtYV9vcHMoKSBp
cyBjYWxsZWQgb25seSBmcm9tIG9mX2RtYV9jb25maWd1cmVfaWQoKSBhbmQgCmFjcGlfZG1hX2Nv
bmZpZ3VyZV9pZCgpLiBTbyBpdCB3b3JrcyBvbmx5IGZvciBEVCBhbmQgQUNQSSBkZXZpY2VzLiBX
aGF0IAphYm91dCBwbGF0Zm9ybV9kZXZpY2U/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
