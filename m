Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA94EDE987
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 06:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YznhMKYVHIAq98PW+ZjkIx7jr6JoW/Sxu9SHs4LGMBo=; b=EEnKB2HPD2RFXa
	DNiI5ybW1IjIXts4frgzeJNsVwHwwhSg0hBUNivHt+BAu7SFrPO1KI5mqSyHaZlHwLDnaNY/SpEiY
	YJmdAI4rV3C1KHkqU/k+hobuoyIlwDGbPlH37OxkAuw87OWvfe7gMVpz8xuj7X1ufFDe0CryqyPtG
	1iZLMhkmSPlyw7FNnm3ceCPTiS2EsFLfhmSxHCC0ukspH01Tha2aIF9TBmIGJrAt3oe2fM1fEoKbK
	+Kv/dc1kRnZ541ce7h3btuidGWTtqjHWJ9Sqn2neV6V+3gzI/SsontcpU/lPKI2LBGYc4vPOjXmyN
	A4p6x7smiJzZvil5+Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggDR-007YLx-1K;
	Thu, 14 Sep 2023 06:52:41 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggDN-007YL9-2G
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 06:52:40 +0000
X-QQ-mid: bizesmtp66t1694674308t5grj0hy
Received: from [10.4.6.71] ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 14:51:44 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: QityeSR92A1mgVQ1XhhOgX/qTsqmJVLJ7VlmlQ3v1R2RSAEbV4tpASXMJp4g2
	yGFGg5xIL3mrCSntp03UvnjCgfi7+CyZZsjhD62l4W2UthZFj6hCCoRBLIcdSEJ6/vuV+lT
	Ic0jLhbFaMKt5QDTyM7x7VtqSOyEzlqH0OrxXDmIiNQ7K4cu3b4qmR9K99wliy3iQSADrle
	lpuqHw+IhAIXQVnssRND95on4lPUPHi3/Jaepea9VthPflXPomLIUHxBCl5rc8eSUh51x+x
	qQISC9P/FeE+Dmsal4yU9HjxUjWjQfcuh9CYnYGhz5Jt85x56CQXOcZw3cfjaDRNyXOtfj9
	irew9dQ49ErHnWb1kjDxT/vA9A318kZbmTUkIwui7+eONoWPtQ=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3595057428919100681
Message-ID: <A1D410BE9DD1128F+45f92224-dc0f-0bfd-d122-fbbcac48eaf3@tinylab.org>
Date: Thu, 14 Sep 2023 14:51:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com, alexghiti@rivosinc.com, anup@brainfault.org,
 samuel@sholland.org, rppt@kernel.org, suagrfillet@gmail.com,
 panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
 <CAJF2gTRHbvwyZR_qUNsc3E9X=Y1H7yTcZo3NLgXQ45=jm1jbTg@mail.gmail.com>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <CAJF2gTRHbvwyZR_qUNsc3E9X=Y1H7yTcZo3NLgXQ45=jm1jbTg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_235238_071766_0E71C333 
X-CRM114-Status: GOOD (  15.46  )
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

CgrlnKggMjAyMy85LzE0IDEyOjU5LCBHdW8gUmVuIOWGmemBkzoKPiBPbiBXZWQsIEF1ZyA5LCAy
MDIzIGF0IDExOjEx4oCvQU0gU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+
IHdyb3RlOgo+Pgo+PiBGcm9tOiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4+
Cj4+IFNpbmNlIHRoZSBjb21taXQgMDExZjA5ZDEyMDUyIHNldCBzdjU3IGFzIGRlZmF1bHQgZm9y
IENPTkZJR182NEJJVCwKPj4gdGhlIGNvbW1lbnQgb2YgQ09ORklHX1BBR0VfT0ZGU0VUIHNob3Vs
ZCBiZSB1cGRhdGVkIHRvby4KPj4KPj4gRml4ZXM6IDAxMWYwOWQxMjA1MiAoInJpc2N2OiBtbTog
U2V0IHN2NTcgb24gZGVmYXVsdGx5IikKPj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3Vh
Z3JmaWxsZXRAZ21haWwuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bh
Z2UuaCB8IDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2Uu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4+IGluZGV4IGI1NWJhMjA5MDNlYy4u
NTNjMDAxNjRjMDQyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2Uu
aAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+PiBAQCAtMzMsOCArMzMs
OCBAQAo+PiAgICNkZWZpbmUgUEFHRV9PRkZTRVQgICAgICAgICAgICBfQUMoQ09ORklHX1BBR0Vf
T0ZGU0VULCBVTCkKPiBXaHkgbm90IHJlbW92ZSBDT05GSUdfUEFHRV9PRkZTRVQgYW5kIGRlZmlu
ZSBQQUdFX09GRlNFVF9MMiA/Cj4KQ09ORklHX1BBR0VfT0ZGU0VUIGhvbGRzIHRoZSBmaXJzdCBt
ZW1vcnkgYWRkcmVzcyByZWdhcmRpbmcgdGhlIApkaWZmZXJlbnQgQ09ORklHcyAoTU1VLDMyQklU
LDY0QklUKS4KCkFzIGZvciA2NEJJVCwgaXQgYWN0dWFsbHkgcmVwcmVzZW50cyAiUEFHRV9PRkZT
RVRfTDUiIGZvciBTdjU3IHBhZ2UgbW9kZSAKZGVmYXVsdGx5LiBBbmQgdGhlIHJlYWwgcGFnZSBt
b2RlIG1heSBiZSBkb3duZ3JhZGVkIGZyb20ga2VybmVsIGNtZGxpbmUgCm9yIHJlc3RyaWN0ZWQg
YnkgdGhlIGhhcmR3YXJlLCBzbyB0aGUgUEFHRV9PRkZTRVRfTDMvTDQgd2FzIGRlZmluZWQgdG8g
CnNldCB0aGUgcmVhbCBQQUdFX09GRlNFVC4KCklJVUMsIHRoZSAiUEFHRV9PRkZTRVRfTDIiIHlv
dSBzcGVjaWZpZWQgbWlnaHQgYmUgdGhlICJQQUdFX09GRlNFVF9MNSIgSSAKcHJldmlvdXNseSBt
ZW50aW9uZWQsCklmIG5vdCwgdGhlIFBBR0VfT0ZGU0VUX0wyIHNlbWFudGljYWxseSBtZWFucyB0
aGUgcGFnZSBvZmZzZXQgZm9yIAozMkJJVCdzIGRlZmF1bHQgU3YzMiBwYWdlIG1vZGUsYW5kIGl0
IGhhcyBhbHJlYWR5IGJlZW4gaGVsZCBpbiAKQ09ORklHX1BBR0VfT0ZGU0VUIHRvby4KClNvIElN
TyB0aGVyZSBpcyBubyBuZWVkIHRvIHRvdWNoIENPTkZJR19QQUdFX09GRlNFVCBpbiB0aGlzIGNv
bnRleHQuCgpQbGVhc2UgY29ycmVjdCBtZSBJZiBJJ20gd3JvbmcuCj4+ICAgI2VuZGlmCj4+ICAg
LyoKPj4gLSAqIEJ5IGRlZmF1bHQsIENPTkZJR19QQUdFX09GRlNFVCB2YWx1ZSBjb3JyZXNwb25k
cyB0byBTVjQ4IGFkZHJlc3Mgc3BhY2Ugc28KPj4gLSAqIGRlZmluZSB0aGUgUEFHRV9PRkZTRVQg
dmFsdWUgZm9yIFNWMzkuCj4+ICsgKiBCeSBkZWZhdWx0LCBDT05GSUdfUEFHRV9PRkZTRVQgdmFs
dWUgY29ycmVzcG9uZHMgdG8gU1Y1NyBhZGRyZXNzIHNwYWNlIHNvCj4+ICsgKiBkZWZpbmUgdGhl
IFBBR0VfT0ZGU0VUIHZhbHVlIGZvciBTVjQ4IGFuZCBTVjM5Lgo+PiAgICAqLwo+PiAgICNkZWZp
bmUgUEFHRV9PRkZTRVRfTDQgICAgICAgICBfQUMoMHhmZmZmYWY4MDAwMDAwMDAwLCBVTCkKPj4g
ICAjZGVmaW5lIFBBR0VfT0ZGU0VUX0wzICAgICAgICAgX0FDKDB4ZmZmZmZmZDgwMDAwMDAwMCwg
VUwpCj4+IC0tCj4+IDIuMjAuMQo+Pgo+IAo+IAoKLS0gClRoYW5rcwpTb25nIFNodWFpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
