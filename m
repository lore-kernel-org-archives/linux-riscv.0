Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14C0E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1CML4uOreAHWJd0bPMjG2Vsu67ardDOP8cV5qGG6As=; b=iuhEIf13UmeS3STw6c14jCn0+r
	zWN5R1rQBha9I1vT/yaouocS4wvI40ifJXSfQiP2rDxy+vjhI0ReO9gxajE20jn2szEilgKnLzlFR
	aYpOkyabplgFyXn6sQwTl0HOn9+UKfmeSRGuE3xUMLdhzbe8ZXMS6KPTWWg4ZspdG8De6xBC2MgqI
	aeU+ef9rRWWkjVQnUFh8IgiLIMPFWKemBrAY4aCg9oo4gWAda+qfcyXxp7phPI8t5Auzk5kkrbRoZ
	+oYz1MbwM8naAPVtqflJu7Gac1I0nXLhc2Ozig7hJtgYZyZAe0j3nJh/zp4CIvjINT0pIj4v1lsJ5
	qOQJxj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPf4-0000000FTMR-3S0I;
	Wed, 11 Dec 2024 16:34:06 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPdS-0000000FT6M-3yde
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 16:32:30 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LPdKthWn7o0aXLPdKtCOay; Wed, 11 Dec 2024 17:32:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733934742;
	bh=rFvBug3DUzjLBEcNi9uUdwbjorNapCxRmjkw85Q8Vp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=knBUyeYEBLfdwD5EXmZOH/SlwXvjLefr9EbzDdGg/TwZaTHYMCAsud/eKf6bt1bAz
	 qgwOAAriA+iqqB57DDrw3/jAZIeuN6C9W6XRg/CmX6O6uwt+DieesBbtCmElHdvYwc
	 ddUEYnNx52GQkJmnOl3tT+K89DHY4shp6uoHUfKEGL+4LYOU84w5Kt6KexKqZPqMPs
	 OcfqJ6W/VvLJK6mI8ledpqnag855eJbvc4PVrtmc2sDNn9zL8opFjdUIiUgxy+Kx00
	 CSW4yoksa177OKrVpJim9HdagDfDZTxCvMIl9GCgRh/00TgxSGs8WYsNK41Zmeixat
	 99Prm+U7eXMaw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 11 Dec 2024 17:32:22 +0100
X-ME-IP: 90.11.132.44
Message-ID: <0e50f6e5-2442-40e7-8baa-575f139fad37@wanadoo.fr>
Date: Wed, 11 Dec 2024 17:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_083228_325655_F63F0C0F 
X-CRM114-Status: GOOD (  12.14  )
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

TGUgMDkvMTIvMjAyNCDDoCAwODoxMiwgQ2hlbiBXYW5nIGEgw6ljcml0wqA6Cj4gRnJvbTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gCj4gQWRkIGRyaXZlciBmb3IgU29w
aGdvIFNHMjA0MiBNU0kgaW50ZXJydXB0IGNvbnRyb2xsZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgouLi4KCj4gKyNkZWZpbmUgU0cy
MDQyX1ZFQ1RPUl9NSU4JNjQKPiArI2RlZmluZSBTRzIwNDJfVkVDVE9SX01BWAk5NQoKLi4uCgo+
ICtzdGF0aWMgc3RydWN0IGlycV9jaGlwIHNnMjA0Ml9tc2lfbWlkZGxlX2lycV9jaGlwID0gewoK
Y29uc3Q/Cgo+ICsJLm5hbWUJCQk9ICJTRzIwNDIgTVNJIiwKPiArCS5pcnFfYWNrCQk9IHNnMjA0
Ml9tc2lfaXJxX2FjaywKPiArCS5pcnFfbWFzawkJPSBpcnFfY2hpcF9tYXNrX3BhcmVudCwKPiAr
CS5pcnFfdW5tYXNrCQk9IGlycV9jaGlwX3VubWFza19wYXJlbnQsCj4gKyNpZmRlZiBDT05GSUdf
U01QCj4gKwkuaXJxX3NldF9hZmZpbml0eQk9IGlycV9jaGlwX3NldF9hZmZpbml0eV9wYXJlbnQs
Cj4gKyNlbmRpZgo+ICsJLmlycV9jb21wb3NlX21zaV9tc2cJPSBzZzIwNDJfbXNpX2lycV9jb21w
b3NlX21zaV9tc2csCj4gK307CgouLi4KCj4gK3N0YXRpYyBpbnQgc2cyMDQyX21zaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKwlzdHJ1Y3Qgb2ZfcGhhbmRsZV9h
cmdzIGFyZ3MgPSB7fTsKPiArCXN0cnVjdCBzZzIwNDJfbXNpX2RhdGEgKmRhdGE7Cj4gKwlpbnQg
cmV0Owo+ICsKPiArCWRhdGEgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVj
dCBzZzIwNDJfbXNpX2RhdGEpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghZGF0YSkKPiArCQlyZXR1
cm4gLUVOT01FTTsKPiArCj4gKwlkYXRhLT5yZWdfY2xyID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlX2J5bmFtZShwZGV2LCAiY2xyIik7Cj4gKwlpZiAoSVNfRVJSKGRhdGEtPnJlZ19j
bHIpKSB7Cj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIG1hcCBjbGVhciByZWdp
c3RlclxuIik7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoZGF0YS0+cmVnX2Nscik7Cj4gKwl9Cj4gKwo+
ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTY0KHBkZXYtPmRldi5vZl9ub2RlLCAic29waGdvLG1z
aS1kb29yYmVsbC1hZGRyIiwKPiArCQkJCSAmZGF0YS0+ZG9vcmJlbGxfYWRkcikpIHsKPiArCQlk
ZXZfZXJyKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gcGFyc2UgTVNJIGRvb3JiZWxsIGFkZHJcbiIp
Owo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCXJldCA9IG9mX3BhcnNlX3BoYW5k
bGVfd2l0aF9hcmdzKHBkZXYtPmRldi5vZl9ub2RlLCAibXNpLXJhbmdlcyIsCj4gKwkJCQkJICIj
aW50ZXJydXB0LWNlbGxzIiwgMCwgJmFyZ3MpOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIo
JnBkZXYtPmRldiwgIlVuYWJsZSB0byBwYXJzZSBNU0kgdmVjIGJhc2VcbiIpOwo+ICsJCXJldHVy
biByZXQ7Cj4gKwl9Cj4gKwlkYXRhLT5pcnFfZmlyc3QgPSAodTMyKWFyZ3MuYXJnc1swXTsKPiAr
Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChwZGV2LT5kZXYub2Zfbm9kZSwg
Im1zaS1yYW5nZXMiLAo+ICsJCQkJCSBhcmdzLmFyZ3NfY291bnQgKyAxLCAmZGF0YS0+bnVtX2ly
cXMpOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIlVuYWJsZSB0byBw
YXJzZSBNU0kgdmVjIG51bWJlclxuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlp
ZiAoZGF0YS0+aXJxX2ZpcnN0IDwgU0cyMDQyX1ZFQ1RPUl9NSU4gfHwKPiArCSAgICAoZGF0YS0+
aXJxX2ZpcnN0ICsgZGF0YS0+bnVtX2lycXMgLSAxKSA+IFNHMjA0Ml9WRUNUT1JfTUFYKSB7Cj4g
KwkJZGV2X2VycigmcGRldi0+ZGV2LCAibXNpLXJhbmdlcyBpcyBpbmNvcnJlY3QhXG4iKTsKPiAr
CQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwltdXRleF9pbml0KCZkYXRhLT5tc2lfbWFw
X2xvY2spOwo+ICsKPiArCWRhdGEtPm1zaV9tYXAgPSBiaXRtYXBfemFsbG9jKGRhdGEtPm51bV9p
cnFzLCBHRlBfS0VSTkVMKTsKCklJVUMsIG51bV9pcnFzIGlzIGJldHdlZW4gMCBhbmQgKFNHMjA0
Ml9WRUNUT1JfTUFYIC0gU0cyMDQyX1ZFQ1RPUl9NSU4pIAoobWF5YmUgKyBvciAtMSkuClNvIGFy
b3VuZCAzMi4KCldvdWxkIGl0IG1ha2Ugc2VuY2UgdG8gdXNlIERFQ0xBUkVfQklUTUFQKG1zaV9t
YXAsIDxjb3JyZWN0X3NpemU+KSBpbiAKc2cyMDQyX21zaV9kYXRhIHRvIGF2b2lkIHRoaXMgYWxs
b2NhdGlvbiBhbmQgYW4gaW5kaXJlY3Rpb24gYXQgcnVudGltZT8KCj4gKwlpZiAoIWRhdGEtPm1z
aV9tYXApCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJcmV0ID0gc2cyMDQyX21zaV9pbml0
X2RvbWFpbnMoZGF0YSwgcGRldi0+ZGV2Lm9mX25vZGUpOwo+ICsJaWYgKHJldCkKPiArCQliaXRt
YXBfZnJlZShkYXRhLT5tc2lfbWFwKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9CgouLi4KCkNK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
