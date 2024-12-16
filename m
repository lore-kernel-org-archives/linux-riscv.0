Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0823E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiUMoXfMuM2p3MN+tjKpvouxnATx8tAJYuV+Em2nusY=; b=NPzPpvTDFluWBz
	Ni/zD1YRoTgEnEKC8iTd1CNFtUM+zUFtzaJhzUjEeZb+TWYcYJRO8Mb0MZHs4rBsBzpHIlmVt0oSz
	51eMEXP36XUOshEN8U9ialoKqve+hkXRB1/gzIRb0WsmDTIZ92W/1RZmdiukY/+srJCWU+iwHihz8
	mLd391AqDkgb7pS1M7YFIHhvtC135s4K2HjFGdEsOQM3rHNkArGD6J+r+jdFJ3h76DNwzeH6uleMZ
	BP2Z8T9PKnPKRiRsGQh7EzRNyskVTX2ZEsIob70MvkUGevqHETSFchJQMBtgU2CxGzbRGFibLpnqH
	tREACnv4rZ4TwP5F8Q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDWZ-0000000AV1e-1Wy7;
	Mon, 16 Dec 2024 16:00:47 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDWW-0000000AV0c-1wa2
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 16:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1734364833; bh=yqsCxIHbjWGKkcn2WT4vA7e1SHVnhVYbcDANJ3Bx5XM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R4c+bI+5WzrXj7yNnGNFxycLsZjFCF1hMw2AvXMnxc1YYhJGCR/5/HLsxU0YZtDAp
	 LxBojxXmkBKIJE2EYleNcKUIEd6xRzaRiNsAuSR9fY+KsmblUAaietX+qCsL2tZhV4
	 JxHa1DUOQxrNQBJsv0A67AOCuZSRtaKixSjYo3Kw=
Received: from [IPV6:2408:8207:18a1:fd20:b8c3:9ed2:6671:4e49] ([2408:8207:18a1:fd20:b8c3:9ed2:6671:4e49])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 1806C3E; Tue, 17 Dec 2024 00:00:24 +0800
X-QQ-mid: xmsmtpt1734364824txr9h1ljv
Message-ID: <tencent_8F35B6F07D09566A873982E0E2C76085280A@qq.com>
X-QQ-XMAILINFO: Nr4sKL92GIu+ail8wIV4AJS6zsf5ZE8QPqWHcOkkko+6R74TiLehhg8KsJC771
	 mL1hZqM/nj0N69IfGvCEh8MuzFlLf7erlLtkrF4QP8qZkH9R46rJC3zvksFOo3obkRV0+aKu4SHn
	 upyCVd26TXjBxuoB9jpavw9ICCES77vHfPzlK79FLfZuxy8JNgqtal0+9OTmJogTMRdPb5a9nNAi
	 xm9z/bMHICi1CrOJIkjYihMJD8pEoW2z0hEgNSy4KdH03//bvlgspkYI2RdRI1igqxS3BPQYnoUm
	 tR8F+1M96o5b/8cq+zmKcxcRc13+BXKZ7da4CApR4NJKEPTEhWWoc/gF4Tf5gA8FTxx9PX2tlQyW
	 yJveZCleg1c03XKnG4nueB9UCCcgyk+cfy0bGfikU40oDIr2xeXP1+CSslYWCpf+1sE6mktkkNc8
	 BLWDM1wEVmn2mbepHJousbgdqh08TaMEbkgz9kekID9R6OciOr5XnOIEk1+oQMn4SMNNiirXzbOZ
	 Aoy9QhLRs5Dus79pfMf1Xn2IUBPqD7Jd+zrnrNIPzqLEGxXYnd+dpA94aWVy14sqyXhEhqzeeeP2
	 KrL9/qjZgreO/GmAqfzClJMdAwVx7fD7MNVHJqt+1pv7Zlsqwq7LW6NIOxKRSQ1p0Y/2K6xuSvRX
	 1ukgs86sREVWLwsuNqWBx9MfVt3S0/FNbwTM741VbUnOBy+s4v04V43ZfVjVs6GPJneE8jyk2rlm
	 Fd6RHcRXIccFOIGJRaJuEtVznba00a7plXP1g5xtyYMuXEmw6ymXSdpEgfq/mLKN2wQI3R8i1d8s
	 voy1HIED5xdEtvU68yVARCgsyb4Yurpb0Q5Y2lEeXZ7V8PZdXtEyOTq7HvbKJPKHNLqJ1m3WAICp
	 l+XKCaAEVadEBuVLDImcoihRv21U/CuiEL/r1Y8vxiWL08fFGm6/RuEfb5x/R94G+hqevZgM9FYn
	 zHzMNJbTlsEp6Ca7lFQw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <3c33d4d7-b11e-4f54-9b6b-767bf0495afd@cyyself.name>
Date: Tue, 17 Dec 2024 00:00:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: hwprobe: export bfloat16 ISA extension
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang
 <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-4-inochiama@gmail.com>
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20241206055829.1059293-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_080045_041001_BAB543EA 
X-CRM114-Status: GOOD (  13.95  )
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

UG9zc2libGUgY29uZmxpY3Qgd2l0aDogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQxMTExLXY1X3VzZXJfY2ZpX3Nlcmllcy12OC0yMi1kY2UxNGFhMzAyMDdAcml2b3Np
bmMuY29tLwoKT24gMTIvNi8yNCAxMzo1OCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBFeHBvcnQg
WmZibWluLCBadmZiZm1pbiwgWnZmYmZ3bWEgSVNBIGV4dGVuc2lvbiB0aHJvdWdoIGh3cHJvYmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4K
PiBSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IC0t
LQo+ICAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDEyICsrKysrKysr
KysrKwo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8ICAzICsrKwo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICAzICsrKwo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+IGluZGV4IDk1NWZiY2QxOWNlOS4uYTljYjQwZTQwN2E0IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IEBAIC0yNDIsNiArMjQyLDE4IEBAIFRoZSBm
b2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfU1VQTWA6IFRoZSBTdXBtIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKPiAgICAgICAg
ICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgUG9pbnRlciBNYXNraW5nIGV4
dGVuc2lvbnMuCj4gICAKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aRkJGTUlO
YDogVGhlIFpmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcwo+ICsgICAgICAgZGVmaW5l
ZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgNGRjMjNkNjIy
OWRlCj4gKyAgICAgICAoIkFkZGVkIENoYXB0ZXIgdGl0bGUgdG8gQkYxNiIpLgo+ICsKPiArICAq
IDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkZCRk1JTmA6IFRoZSBadmZiZm1pbiBleHRl
bnNpb24gaXMgc3VwcG9ydGVkIGFzCj4gKyAgICAgICBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNB
IG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA0ZGMyM2Q2MjI5ZGUKPiArICAgICAgICgiQWRk
ZWQgQ2hhcHRlciB0aXRsZSB0byBCRjE2IikuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pWRkJGV01BYDogVGhlIFp2ZmJmd21hIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQg
YXMKPiArICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZy
b20gY29tbWl0IDRkYzIzZDYyMjlkZQo+ICsgICAgICAgKCJBZGRlZCBDaGFwdGVyIHRpdGxlIHRv
IEJGMTYiKS4KPiArCj4gICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBg
OiBEZXByZWNhdGVkLiAgUmV0dXJucyBzaW1pbGFyIHZhbHVlcyB0bwo+ICAgICAgICA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9LRVlfTUlTQUxJR05FRF9TQ0FMQVJfUEVSRmAsIGJ1dCB0aGUga2V5
IHdhcwo+ICAgICAgICBtaXN0YWtlbmx5IGNsYXNzaWZpZWQgYXMgYSBiaXRtYXNrIHJhdGhlciB0
aGFuIGEgdmFsdWUuCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gaW5kZXgg
M2FmMTQyYjk5Zjc3Li5hZWNjMWM4MDBkNTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmgKPiBAQCAtNzMsNiArNzMsOSBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4g
ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJKDFVTEwgPDwgNDcpCj4gICAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQVdSUwkJKDFVTEwgPDwgNDgpCj4gICAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9TVVBNCQkoMVVMTCA8PCA0OSkKPiArI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkZCRk1JTgkoMVVMTCA8PCA1MCkKPiArI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlZGQkZNSU4JKDFVTEwgPDwgNTEpCj4gKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pW
RkJGV01BCSgxVUxMIDw8IDUyKQo+ICAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJG
XzAJNQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwg
MCkKPiAgICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAw
KQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IGluZGV4IGNiOTNhZGZmZmM0OC4uYmQyMTVmNThi
ZDFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gQEAgLTEzMSw2ICsxMzEsOCBAQCBz
dGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+
ICAgCQkJRVhUX0tFWShaVkU2NEQpOwo+ICAgCQkJRVhUX0tFWShaVkU2NEYpOwo+ICAgCQkJRVhU
X0tFWShaVkU2NFgpOwo+ICsJCQlFWFRfS0VZKFpWRkJGTUlOKTsKPiArCQkJRVhUX0tFWShaVkZC
RldNQSk7Cj4gICAJCQlFWFRfS0VZKFpWRkgpOwo+ICAgCQkJRVhUX0tFWShaVkZITUlOKTsKPiAg
IAkJCUVYVF9LRVkoWlZLQik7Cj4gQEAgLTE0Nyw2ICsxNDksNyBAQCBzdGF0aWMgdm9pZCBod3By
b2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAgCQkJRVhUX0tFWSha
Q0QpOwo+ICAgCQkJRVhUX0tFWShaQ0YpOwo+ICAgCQkJRVhUX0tFWShaRkEpOwo+ICsJCQlFWFRf
S0VZKFpGQkZNSU4pOwo+ICAgCQkJRVhUX0tFWShaRkgpOwo+ICAgCQkJRVhUX0tFWShaRkhNSU4p
Owo+ICAgCQl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
