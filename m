Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7904C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWT2YrOIoYUVp6qRH9gAJKz6kKSTJpVOo13iOvKKOhU=; b=RJ8+gIOZHaTTfj
	iebszv1Krqvly24AAzQmg7Gm0Zuirj1Ag34V5u1RJGINmC0Gz79bQk6jKzEbGdlCi66isqQ+bvCYz
	Q1D38kHf+e9rKTflOVWqF+lFS72VWj9+wjpx612ZY1E0oFhsj0ly95Rnz523Cuw+YqSQZs9RNXJjr
	FepPjQYHbCNQMF7clqrTXQRS1WMKAkQCyE/GSABg69hbXS8bZxawti5MPi0DwDm/E85FU0suWprXU
	ahD0N74vwNvY5Q4kSI1Iaz//2uiT+3Z7zeTR0e5dI6LfjNo//sHleY6WCMNVm6YfsKOwf+9w9LQOL
	/8mVL+A2zmOTcbXXXi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1praDp-0038Hq-09;
	Wed, 26 Apr 2023 08:09:53 +0000
Received: from smtp-11.smtpout.orange.fr ([80.12.242.11] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1praDl-0038HP-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 08:09:50 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id raDepUY94jKvyraDepZTxa; Wed, 26 Apr 2023 10:09:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682496587;
	bh=3Dnct6syEmfol0OwB5y57UYOe2Ebjv/G1frdM6J2D2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KOsXkypVrNH0KqrELFWbVO44jVwy7NpAA45jduf5vUoI1PnrgF6myXhsk6DPTZg73
	 YMiBSHe+eSenrv2OrpjNWPoxQnJIpDgIIWKtVPaiMQ6WB4C79hG+y8gqBHaNNWHAQd
	 ubu8Tqs0bCpx7/2ZLi5d7xKGby3QoFX8L5WoS4dhfISqWh4nRV2WCfbyx5TqNEYBG8
	 HW6BEpN7h0GwD8b9iGp7c3bvwXIJVnpKjO/+Z6n4jmrOc/RggjhuEX+X3EQLCjGdkx
	 Hbm6G+RxoaytUmrBMV94NApD41jQEPKCOj+fiHlN7//+2IQDV1HcjjhoZ9YEB4iTNK
	 ObHMOr+b0HCyQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 26 Apr 2023 10:09:47 +0200
X-ME-IP: 86.243.2.178
Message-ID: <b06ffea5-d631-dc1a-89af-71e72a4365c5@wanadoo.fr>
Date: Wed, 26 Apr 2023 10:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/4] crypto: starfive - Add crypto engine support
Content-Language: fr
To: jiajie.ho@starfivetech.com
Cc: davem@davemloft.net, devicetree@vger.kernel.org,
 herbert@gondor.apana.org.au, kernel@esmil.dk,
 krzysztof.kozlowski+dt@linaro.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, robh+dt@kernel.org
References: <20230426065848.842221-1-jiajie.ho@starfivetech.com>
 <20230426065848.842221-3-jiajie.ho@starfivetech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230426065848.842221-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_010949_311371_807AA7A0 
X-CRM114-Status: GOOD (  15.81  )
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

TGUgMjYvMDQvMjAyMyDDoCAwODo1OCwgSmlhIEppZSBIbyBhIMOpY3JpdMKgOgo+IEFkZGluZyBk
ZXZpY2UgcHJvYmUgYW5kIERNQSBpbml0IGZvciBTdGFyRml2ZSBjcnlwdG9ncmFwaGljIG1vZHVs
ZS4KPiAKPiBDby1kZXZlbG9wZWQtYnk6IEh1YW4gRmVuZyA8aHVhbi5mZW5nLWJPTnJNNDVLV0ZP
WG1NWGpKQnBXcWdAcHVibGljLmdtYW5lLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuIEZlbmcg
PGh1YW4uZmVuZy1iT05yTTQ1S1dGT1htTVhqSkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogSmlhIEppZSBIbyA8amlhamllLmhvLWJPTnJNNDVLV0ZPWG1NWGpKQnBXcWdA
cHVibGljLmdtYW5lLm9yZz4KPiAtLS0KPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDcgKwo+ICAgZHJpdmVycy9jcnlwdG8vS2NvbmZpZyAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gICBkcml2ZXJzL2NyeXB0by9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAx
ICsKPiAgIGRyaXZlcnMvY3J5cHRvL3N0YXJmaXZlL0tjb25maWcgICAgICAgfCAgMTcgKysrCj4g
ICBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9NYWtlZmlsZSAgICAgIHwgICA0ICsKPiAgIGRyaXZl
cnMvY3J5cHRvL3N0YXJmaXZlL2poNzExMC1jcnlwLmMgfCAxOTkgKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgIGRyaXZlcnMvY3J5cHRvL3N0YXJmaXZlL2poNzExMC1jcnlwLmggfCAgNjMg
KysrKysrKysKPiAgIDcgZmlsZXMgY2hhbmdlZCwgMjkyIGluc2VydGlvbnMoKykKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9LY29uZmlnCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvTWFrZWZpbGUKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtY3J5cC5jCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvamg3MTEwLWNyeXAuaAo+IAo+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggNjUxNDA1MDBk
OWY4Li5hNmY3Njc3ZGI0ZGIgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlO
VEFJTkVSUwo+IEBAIC0xOTYwOSw2ICsxOTYwOSwxMyBAQCBGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svc3RhcmZpdmUqCj4gICBGOglkcml2ZXJzL2Nsay9zdGFyZml2
ZS8KPiAgIEY6CWluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RhcmZpdmUqCj4gICAKPiArU1RB
UkZJVkUgQ1JZUFRPIERSSVZFUgo+ICtNOglKaWEgSmllIEhvIDxqaWFqaWUuaG8tYk9Ock00NUtX
Rk9YbU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUub3JnPgo+ICtNOglXaWxsaWFtIFFpdSA8d2lsbGlh
bS5xaXUtYk9Ock00NUtXRk9YbU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUub3JnPgo+ICtTOglTdXBw
b3J0ZWQKPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NyeXB0by9zdGFy
Zml2ZSoKPiArRjoJZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvCj4gKwo+ICAgU1RBUkZJVkUgUElO
Q1RSTCBEUklWRVIKPiAgIE06CUVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWwtc0twSFpMVFlm
cTBAcHVibGljLmdtYW5lLm9yZz4KPiAgIE06CUppYW5sb25nIEh1YW5nIDxqaWFubG9uZy5odWFu
Zy1iT05yTTQ1S1dGT1htTVhqSkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3J5cHRvL0tjb25maWcgYi9kcml2ZXJzL2NyeXB0by9LY29uZmlnCj4gaW5kZXgg
NTVlNzVmYmI2NThlLi42NGI5NDM3NjYwMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcnlwdG8v
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL0tjb25maWcKPiBAQCAtODE3LDUgKzgxNyw2
IEBAIGNvbmZpZyBDUllQVE9fREVWX1NBMlVMCj4gICAKPiAgIHNvdXJjZSAiZHJpdmVycy9jcnlw
dG8va2VlbWJheS9LY29uZmlnIgo+ICAgc291cmNlICJkcml2ZXJzL2NyeXB0by9hc3BlZWQvS2Nv
bmZpZyIKPiArc291cmNlICJkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9LY29uZmlnIgo+ICAgCj4g
ICBlbmRpZiAjIENSWVBUT19IVwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9NYWtlZmls
ZSBiL2RyaXZlcnMvY3J5cHRvL01ha2VmaWxlCj4gaW5kZXggMTE2ZGUxNzNhNjZjLi4yMTI5MzFj
ODQ0MTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vTWFrZWZpbGUKPiArKysgYi9kcml2
ZXJzL2NyeXB0by9NYWtlZmlsZQo+IEBAIC01MywzICs1Myw0IEBAIG9iai15ICs9IHhpbGlueC8K
PiAgIG9iai15ICs9IGhpc2lsaWNvbi8KPiAgIG9iai0kKENPTkZJR19DUllQVE9fREVWX0FNTE9H
SUNfR1hMKSArPSBhbWxvZ2ljLwo+ICAgb2JqLXkgKz0ga2VlbWJheS8KPiArb2JqLXkgKz0gc3Rh
cmZpdmUvCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3N0YXJmaXZlL0tjb25maWcgYi9k
cml2ZXJzL2NyeXB0by9zdGFyZml2ZS9LY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjczZjM5YjZiYzA5Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9k
cml2ZXJzL2NyeXB0by9zdGFyZml2ZS9LY29uZmlnCj4gQEAgLTAsMCArMSwxNyBAQAo+ICsjCj4g
KyMgU3RhckZpdmUgY3J5cHRvIGRyaXZlcnMgY29uZmlndXJhdGlvbgo+ICsjCj4gKwo+ICtjb25m
aWcgQ1JZUFRPX0RFVl9KSDcxMTAKPiArCXRyaXN0YXRlICJTdGFyRml2ZSBKSDcxMTAgY3J5cHRv
Z3JhcGhpYyBlbmdpbmUgZHJpdmVyIgo+ICsJZGVwZW5kcyBvbiBTT0NfU1RBUkZJVkUKPiArCXNl
bGVjdCBDUllQVE9fRU5HSU5FCj4gKwlzZWxlY3QgQVJNX0FNQkEKPiArCXNlbGVjdCBETUFERVZJ
Q0VTCj4gKwlzZWxlY3QgQU1CQV9QTDA4WAo+ICsJaGVscAo+ICsJICBTdXBwb3J0IGZvciBTdGFy
Rml2ZSBKSDcxMTAgY3J5cHRvIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBlbmdpbmUuCj4gKwkgIFRo
aXMgbW9kdWxlIHByb3ZpZGVzIGFjY2VsZXJhdGlvbiBmb3IgcHVibGljIGtleSBhbGdvLAo+ICsJ
ICBza2NpcGhlcnMsIEFFQUQgYW5kIGhhc2ggZnVuY3Rpb25zLgo+ICsKPiArCSAgSWYgeW91IGNo
b29zZSAnTScgaGVyZSwgdGhpcyBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgc3RhcmZpdmUtY3J5cHRv
LgoKCmpoNzExMC1jcnlwPwoKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3N0YXJmaXZl
L01ha2VmaWxlIGIvZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvTWFrZWZpbGUKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDEyMjFhY2FlZTM5Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL3N0YXJmaXZlL01ha2VmaWxlCj4gQEAgLTAsMCAr
MSw0IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gK29iai0k
KENPTkZJR19DUllQVE9fREVWX0pINzExMCkgKz0gamg3MTEwLWNyeXB0by5vCj4gK2poNzExMC1j
cnlwdG8tb2JqcyA6PSBqaDcxMTAtY3J5cC5vCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
