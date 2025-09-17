Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B2ACAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+OxpoC+guvaX/tih3qUw1+ZHuEpHxUuGKQFT44Upmg=; b=uFTymyC8vBAIas
	iilwPjBTUSsMZvNzMCQjEnyybIiH4be+uZJCoRUYu6L5H1L5VqQ8UkQXoYqOvtzdcP14dWk2EJHtt
	ERbw2/n/eE37ZjxGK8A/Tt5inrF11OJ0FtFng+E3HTU1VvgXKUyMWyaQQB8W+5ITCIdyHzrd70GOn
	//IMcmPkUBgd9kr5ststPJUtUWcqdTZlb+N6WdIBqCVJltLYUSxjo6PSlduPMq3db5kwu2koADiRF
	G3aGZZiCe/+KMylzhZGrqEul1kNL14GgkVMlita7YHaGaLqVr+ElmfwGAdUc/D8D94lhX75k8tgTA
	LK0xqSVnwIxwgoWkXr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoCT-0000000Akx9-469l;
	Wed, 17 Sep 2025 09:11:41 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoCQ-0000000AkrL-43ZR
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 09:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758100217;
	bh=ri182HmaNLuB6srSO5qdmJymW/n4VZ9nIGHsaPZb9Ig=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lZ3SH21GVQ1vqKv/sxc8Q2cnolC/6gYgtz9Ee1HASYDlV2SOw6sGQaM0ZixTcXExi
	 vNlfiN/WRQajfZACGmgKnF9574Gdqta7cscnmNx3F2Hrfhf8nWpez0Y9KncwbNY4pZ
	 VhWM5nPo/C2QrE6CZ2Sj4OWVOJPi6ZSIai1O44V4=
X-QQ-mid: zesmtpsz4t1758100215tb76441bb
X-QQ-Originating-IP: wcCz1UpCwLB1mz6bBh5/zOt98BYf3vwoeUmG1MsFAR4=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 17:10:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2326041973068499152
EX-QQ-RecipientCnt: 16
Date: Wed, 17 Sep 2025 17:10:13 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <B8941D240B018103+aMp69Tod8hNbLcu_@LT-Guozexi>
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
 <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
 <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
 <A00BFAFA3FC941AF+aMp0kSc6UkR4QUn4@LT-Guozexi>
 <20250917090532-GYA1265528@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917090532-GYA1265528@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OXWhkXa0b/rw7H0DscknNdWijAy3PwQSXjF4D1ea9D2MMtchIq/1VpmU
	5aDPmZQh4TmtPXSNHk6wh/+qhqvW/qAb4jjCw37NAXbhF3Q9je3XYVLHdHO5mFbJcQC+ky3
	VuHx99p/UzwtNvpDHdjSdjRrQl02H398Cl2SOsBvLSY0ySj5cGazgCin/RU+Wqp0CjmiHuv
	WE5qo76uTUej2cuRQkmvv4hviIAxtOqAI76Ijus5rsZoyiJ64j5LhEFuIayQ3wQnc2nqoUE
	IR+vYuMt4VxnbSgMNTgd5wp+LOqKyj3v9ccxsNQPgAtUjYBoprMEYUFWoKGOoX8i8iqDQPp
	TKeQfZtjqLtZ/hNCCUdi24TjP/BcArRWEb7SepOSAMjCr+81WWs+D9zL7OkiMrYmS8OxYI2
	tPeynrwRgo3kMM/XxP7JzxU1NF6UUTgoqj22zsG4vpEzpgiSp7LepZO71XMfnzp3c56CdX/
	94wbtg2gF3nq5ArhTis8nOKXzWbVFVI62jnYEH+0HO9C74oLiVBoiuiA8W33iS/eq7i0fZJ
	Q9r3p72C3dY0e3CViD8mEDRj/W6bzNVh6iB4Op1R62RHKeLljkPE8iDd6pSVzsvvMU/LKrc
	6p/iRxRpZLn7Qytt2rjej0gxpiV5xTjrQibNGy8BSQ+E6RH7vgqgnylREAMV80TGRX/c+tC
	vk3U1zSJxuXYz3aMwhFlWOteDIydmYtay5SR1Sow6TRdacDsShq8LlmcmpqQxWpCINoaXz4
	7XBl01b0vxR/IWDyIdCN3ZnUUO91zIwv+t6Z2OQerx0fARK0GzKLnjRWZAQdvq9hNjjDrmL
	MBo2Db2u9weTWeCXNYzp5RB2BQTwme+zjA9cf/apj+c1+FmfrnrHTOIQs6f+AuREI9SJlJJ
	r38E6qVbriNcQJJKspaAxXcZPkf5ZOSTOHvPxLZkLCG87zAU4LDg9afO/BtC1krVaBCtzo/
	e3yLl76EqTurFJZhn6miLVqoP4ujwgYOb0uWw+2JQ2zgvp9Dx5t4fsvXl0sbsD0hfgfDIJb
	NSjy8Zoqx4VR+pdee9Lgx4FWT+ksiui01/FyG/h3ACgQNGcSjP9kIWo2naA3FCweu3+dhKx
	t94yD2EpH9xzRRlFcnsayku9dVxF1eKlA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_021139_285228_C142F3B8 
X-CRM114-Status: GOOD (  40.10  )
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

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMDU6MDU6MzJQTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gCj4gT24gMTY6NDIgV2VkIDE3IFNlcCAgICAgLCBUcm95IE1pdGNoZWxs
IHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTA6MTc6MTZBTSArMDIwMCwgSGVu
ZHJpayBIYW1lcmxpbmNrIHdyb3RlOgo+ID4gPiBIZWxsbyBUcm95LAo+ID4gPiAKPiA+ID4gVGhh
bmsgeW91IGZvciByZXZpZXdpbmcuCj4gPiA+IAo+ID4gPiBPbiA5LzE3LzI1IDA5OjQ2LCBUcm95
IE1pdGNoZWxsIHdyb3RlOgo+ID4gPiA+IEhpIEhlbmRyaWssIFRoYW5rcyBmb3IgeW91ciBwYXRj
aCEKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgU2VwIDE3LCAyMDI1IGF0IDA4OjU5OjA3QU0gKzAy
MDAsIEhlbmRyaWsgSGFtZXJsaW5jayB3cm90ZToKPiA+ID4gPj4gQWRkIFVBUlQgcGluY3RybCBj
b25maWd1cmF0aW9ucyBiYXNlZCBvbiB0aGUgU29DIGRhdGFzaGVldCBhbmQgdGhlCj4gPiA+ID4+
IGRvd25zdHJlYW0gQmlhbmJ1IExpbnV4IHRyZWUuIFRoZSBkcml2ZSBzdHJlbmd0aCB2YWx1ZXMg
d2VyZSB0YWtlbiBmcm9tCj4gPiA+ID4+IHRoZSBkb3duc3RyZWFtIGltcGxlbWVudGF0aW9uLCB3
aGljaCB1c2VzIG1lZGl1bSBkcml2ZSBzdHJlbmd0aC4KPiA+ID4gPj4gQ1RTL1JUUyBhcmUgbW92
ZWQgdG8gc2VwYXJhdGUgKi1jdHMtcnRzLWNmZyBzdGF0ZXMgc28gYm9hcmRzIGNhbiBlbmFibGUK
PiA+ID4gPj4gaGFyZHdhcmUgZmxvdyBjb250cm9sIGNvbmRpdGlvbmFsbHkuCj4gPiA+ID4+Cj4g
PiA+ID4+IFNpZ25lZC1vZmYtYnk6IEhlbmRyaWsgSGFtZXJsaW5jayA8aGVuZHJpay5oYW1lcmxp
bmNrQGhhbW1lcm5ldC5iZT4KPiA+ID4gPj4gUmV2aWV3ZWQtYnk6IFlpeHVuIExhbiA8ZGxhbkBn
ZW50b28ub3JnPgo+ID4gPiA+PiAtLS0KPiA+ID4gPj4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPj4g
LSBFeHBsaWNpdGx5IHVzZSAwIGFzIGJpYXMtcHVsbC11cCB2YWx1ZQo+ID4gPiA+Pgo+ID4gPiA+
PiBDaGFuZ2VzIGluIHYzOgo+ID4gPiA+PiAtIEFkZGVkIC9vbWl0LWlmLW5vLXJlZi8gdG8gcGlu
Y3RybCBzdGF0ZXMgdG8gcmVkdWNlIERUIHNpemUKPiA+ID4gPj4KPiA+ID4gPj4gQ2hhbmdlcyBp
biB2MjoKPiA+ID4gPj4gLSBTcGxpdCBjdHMvcnRzIGludG8gc2VwYXJhdGUgcGluY3RybCBjb25m
aWdzIGFzIHN1Z2dlc3RlZAo+ID4gPiA+PiAtIFJlbW92ZWQgb3B0aW9ucyBmcm9tIGJvYXJkIERU
UyBmaWxlcyB0byBrZWVwIHRoZW0gY2xlYW5lcgo+ID4gPiA+PiAtLS0KPiA+ID4gPj4gIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpIHwgNDMwICsrKysrKysrKysr
KysrKysrKy0KPiA+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA0MjggaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+ID4gPj4KPiA+ID4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gPj4gKwkvb21pdC1pZi1uby1yZWYvCj4gPiA+ID4+
ICsJdWFydDJfMF9jdHNfcnRzX2NmZzogdWFydDItMC1jdHMtcnRzLWNmZyB7Cj4gPiA+ID4+ICsJ
CXVhcnQyLTAtcGlucyB7Cj4gPiA+ID4+ICsJCQlwaW5tdXggPSA8SzFfUEFEQ09ORigyMywgMSk+
LAkvKiB1YXJ0Ml9jdHMgKi8KPiA+ID4gPj4gKwkJCQkgPEsxX1BBRENPTkYoMjQsIDEpPjsJLyog
dWFydDJfcnRzICovCj4gPiA+ID4+ICsJCQliaWFzLXB1bGwtdXAgPSA8MD47Cj4gPiA+ID4+ICsJ
CQlkcml2ZS1zdHJlbmd0aCA9IDwzMj47Cj4gPiA+ID4+ICsJCX07Cj4gPiA+ID4+ICsJfTsKPiA+
ID4gPiBXZSBhcmUgY3VycmVudGx5IHVzaW5nIHRoZSA4MjUwIFVBUlQgZHJpdmVyLCBidXQgaGFy
ZHdhcmUgZmxvdyBjb250cm9sIGRvZXMgbm90Cj4gPiA+ID4gd29yayBwcm9wZXJseSBvbiBLMS4g
V2UgYXJlIGNvbnNpZGVyaW5nIGZpeGluZyB0aGlzIHdoZW4gdGltZSBwZXJtaXRzLgo+ID4gPiA+
Cj4gPiA+ID4gU2hvdWxkIHdlIGFkZCBhIGNvbW1lbnQgaGVyZSB0byBhdm9pZCBjb25mdXNpbmcg
b3RoZXJzIHdobyBtYXkgcnVuIGludG8gdGhpcz8KPiA+ID4gPiBJZiBzbywgSSB3aWxsIHJlbW92
ZSB0aGUgY29tbWVudCBvbmNlIHRoZSBpc3N1ZSBoYXMgYmVlbiBmaXhlZC4KPiA+ID4gTm90IHN1
cmUgaWYgSeKAmW0gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBoYXJkd2FyZSBmbG93IGNvbnRyb2wg
c2VlbXMgdG8gd29yawo+ID4gPiB3aXRoIHRoZSBgODI1MF9vZmAgZHJpdmVyPwo+ID4gPiAKPiA+
ID4gT24gYm90aCBlbmRzIEkgY29uZmlndXJlZCB0aGUgcG9ydHMgd2l0aDoKPiA+ID4gYHN0dHkg
LUYgL2Rldi90dHlTMSAxMTUyMDAgY3J0c2N0cyAtaXhvbiAtaXhvZmYgcmF3IC1lY2hvYAo+ID4g
PiAKPiA+ID4gV2l0aCB0aGlzIHNldHVwLCBkYXRhIHNlbnQgd2l0aCBlY2hvIG9ubHkgZ29lcyB0
aHJvdWdoIHdoZW4gdGhlIHBlZXIgaXMKPiA+ID4gYWN0dWFsbHkgcmVhZGluZyBvbiB0aGUgb3Ro
ZXIgc2lkZSwgd2hpY2ggbG9va3MgbGlrZSBSVFMvQ1RTIGlzCj4gPiA+IGZ1bmN0aW9uaW5nIGNv
cnJlY3RseS4KPiA+IExldCBtZSBjbGFyaWZ5IG15IGVhcmxpZXIgcmVwbHkoSSBoYXZlIGRvdWJs
ZSBjaGVja2VkKToKPiA+IEl0IGlzIG5vdCB0aGF0IGhhcmR3YXJlIGZsb3cgY29udHJvbCBkb2Vz
IG5vdCB3b3JrIGF0IGFsbCwKPiA+IGJ1dCByYXRoZXIgdGhhdCBpdCBmYWlscyBpbnRlcm1pdHRl
bnRseS4KPiA+IFRoZSBoaWdoZXIgdGhlIGJhdWQgcmF0ZSwgdGhlIHNvb25lciB0aGUgcHJvYmxl
bSB0ZW5kcyB0byBzaG93IHVwLgo+ID4gCj4gPiBGcm9tIHlvdXIgbG9nIEkgbm90aWNlZCB0aGUg
YmF1ZCByYXRlIGlzIDExNTIwMC4KPiA+IEF0IHRoaXMgcmF0ZSwgaXQgbWlnaHQgdGFrZSBhIGZ1
bGwgZGF5IG9mIGNvbnRpbnVvdXMgdGVzdGluZyBiZWZvcmUKPiA+IHRoZSBpc3N1ZSBhcHBlYXJz
ICh0aG91Z2ggb2YgY291cnNlIGl0IGNvdWxkIGFsc28gZmFpbCBtdWNoIHNvb25lciwgc2luY2Ug
aXQgaXMgcHJvYmFiaWxpc3RpYykuCj4gPiAKPiA+IFNvIEkgYW0gd29uZGVyaW5nIHdoZXRoZXIg
d2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQgaGVyZSwKPiA+IG9yIGluc3RlYWQgcHV0IHRoZSBub3Rl
IGluIHRoZSBVQVJUIG5vZGUuCj4gTm8sIHBsZWFzZSBzdGFydCBhbm90aGVyIHRocmVhZCB0byBh
ZGRyZXNzIHRoaXMgaXNzdWUsIGZpbmQgYSBzb2x1dGlvbgo+IGFuZCB0aGVuIGlkZWFsbHkgd29y
ayBvdXQgYSBwYXRjaCBmb3IgaXQsIGFkZGluZyBjb21tZW50IGRvZXNuJ3QgcmVhbGx5IGhlbHAu
Clllcywgd2UgYWxyZWFkeSBoYXZlIGEgc29sdXRpb24uIElmIEkgY2FuIHNwYXJlIHNvbWUgdGlt
ZSBzb29uLApJIHdpbGwgY2xlYW4gaXQgdXAgYW5kIHBvc3QgaXQgQVNBUC4KClRoYW5rcyBmb3Ig
dGhlIHJlbWluZGVyLCBZaXh1bi4gSW5kZWVkLCBhZGRpbmcgYSBjb21tZW50IGRvZXNu4oCZdCBy
ZWFsbHkgaGVscCBoZXJlLgo+IAo+IEJlc2lkZXMsIHdoYXQgSGVuZHJpayBkb2luZyBoZXJlIGlz
IHRvIGNvbXBsZXRlIHRoZSBkZXNjcmlwdGlvbnMgb2YgVUFSVCBwaW5jdHJsCj4gd2hpY2ggaXMg
YSBkaWZmZXJlbnQgdGhpbmcsIGxldCdzIG5vdCBtaXggdGhlbSB0b2dldGhlci4KWWVzLCBteSBy
YiBpcyB2YWxpZC4KCiAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiAtLSAKPiBZaXh1biBMYW4g
KGRsYW4pCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
