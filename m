Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01909CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cypXCx04YCfhu6Wc/kwLMvS8GGhHzFhwikFmbgYjbcU=; b=IbXa2PRKdB+dF5
	tTm0qsgKGK0EskkTPsyI2C9njiaRrYBEMMJv5cw5+5LGFLOKwJHiWaRg5yVAxofHvEPPce3DG2wis
	osHDD/ZlObUusdBm7HAAjPY1Gy5VTlxu+yLiTHCSrMEuxgMSxbACQFAFHL4F68O3X7PdbGimIYENn
	jos58yV8H59n6SUIuEO9+6VdSv3Uc5dd4m+xek2Ng4dopTnwb9Dsu5vpbe2eQpc+0sk5CfB43Y+Ut
	/9ZAt7FVqhVV7u/tN2NBnf6jrX0i38xWw/CfVdnE/bY8psaiAgop/ZhMclMqOt2gC5Ws4QoqKmHRg
	N/43Tb2Wmj8Dko4QFgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzsV-001Ywp-1c;
	Thu, 12 Oct 2023 17:53:43 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzsO-001Yuj-20
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 17:53:40 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id qzs9qaBPZq3uXqzs9qb9YD; Thu, 12 Oct 2023 19:53:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1697133209;
	bh=tYjDKJtATrFkZwN78NGoARA2kvP+9YmLK58WWl0eTY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jF5MfRztGNJ0gx25YJXDRvUKliknjhzKVUg+osO3fgTjr/e4ICXz6xMeIqlgBFY8/
	 x3fB5VO5MgQ7QApc3X5Vi4UZW1jda2iRoWBJYh1ZkgvB3yC5P7j5vaVBbsj50lZkAn
	 T0CHtik0yN9PNLdqP3FUDIm1Br9qGO8tp/DJZjQAY1uogX3yPKnpSMsxzkmeLV8E0p
	 hX6g8seA4ThVE50PWYfxKv4pVqmQ/1xXj3D5KVQb3ssTnt1iS25pJ7zPH+V1xKOR/L
	 jXIpn3BZcutLEXO+YJXyzznXlbG5Q7SF+dTxc+bUW2gcNVn1ey3YFDuD47LDcbtniz
	 pxOh5NqRFhtUg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 12 Oct 2023 19:53:29 +0200
X-ME-IP: 86.243.2.178
Message-ID: <338544e7-0be8-47c1-a7d7-89990da305d3@wanadoo.fr>
Date: Thu, 12 Oct 2023 19:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clocksource: Add JH7110 timer driver
To: xingyu.wu@starfivetech.com
Cc: aou@eecs.berkeley.edu, conor@kernel.org, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, samin.guo@starfivetech.com,
 tglx@linutronix.de, walker.chen@starfivetech.com
References: <20231012081015.33121-1-xingyu.wu@starfivetech.com>
 <20231012081015.33121-3-xingyu.wu@starfivetech.com>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231012081015.33121-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_105337_250574_FB334DD2 
X-CRM114-Status: GOOD (  15.51  )
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

TGUgMTIvMTAvMjAyMyDDoCAxMDoxMCwgWGluZ3l1IFd1IGEgw6ljcml0wqA6Cj4gQWRkIHRpbWVy
IGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTog
WGluZ3l1IFd1IDx4aW5neXUud3UtYk9Ock00NUtXRk9YbU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUu
b3JnPgoKLi4uCgo+ICtzdGF0aWMgaW50IGpoNzExMF90aW1lcl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKwlzdHJ1Y3Qgamg3MTEwX2Nsa2V2dCAqY2xrZXZ0W0pI
NzExMF9USU1FUl9DSF9NQVhdOwo+ICsJY2hhciBuYW1lWzRdOwo+ICsJc3RydWN0IGNsayAqcGNs
azsKPiArCXN0cnVjdCByZXNldF9jb250cm9sICpyc3Q7Cj4gKwlpbnQgY2g7Cj4gKwlpbnQgcmV0
Owo+ICsJdm9pZCBfX2lvbWVtICpiYXNlOwo+ICsKPiArCWJhc2UgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gKwlpZiAoSVNfRVJSKGJhc2UpKQo+ICsJCXJldHVy
biBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIoYmFzZSksCj4gKwkJCQkgICAgICJm
YWlsZWQgdG8gbWFwIHJlZ2lzdGVyc1xuIik7Cj4gKwo+ICsJcnN0ID0gZGV2bV9yZXNldF9jb250
cm9sX2dldF9leGNsdXNpdmUoJnBkZXYtPmRldiwgImFwYiIpOwo+ICsJaWYgKElTX0VSUihyc3Qp
KQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocnN0KSwgImZh
aWxlZCB0byBnZXQgYXBiIHJlc2V0XG4iKTsKPiArCj4gKwlwY2xrID0gZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoJnBkZXYtPmRldiwgImFwYiIpOwo+ICsJaWYgKElTX0VSUihwY2xrKSkKPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHBjbGspLAo+ICsJCQkJICAgICAi
ZmFpbGVkIHRvIGdldCAmIGVuYWJsZSBhcGIgY2xvY2tcbiIpOwo+ICsKPiArCXJldCA9IHJlc2V0
X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiZmFpbGVkIHRvIGRlYXNzZXJ0IGFwYiByZXNldFxuIik7
CgpIaSwKCkknbSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSByZXNldF9jb250cm9sX1tkZV1h
c3NlcnQoKSBmdW5jdGlvbnMsIGJ1dCAKc2hvdWxkbid0IHRoaXMgYmUgdW5kb25lIGJ5IGEgcmVz
ZXRfY29udHJvbF9hc3NlcnQoKSBjYWxsIGlmIGFuIGVycm9yIApvY2N1cnMgbGF0ZXI/Cgo+ICsK
PiArCWZvciAoY2ggPSAwOyBjaCA8IEpINzExMF9USU1FUl9DSF9NQVg7IGNoKyspIHsKPiArCQlj
bGtldnRbY2hdID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqY2xrZXZ0W2NoXSks
IEdGUF9LRVJORUwpOwo+ICsJCWlmICghY2xrZXZ0W2NoXSkKPiArCQkJcmV0dXJuIC1FTk9NRU07
Cj4gKwo+ICsJCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgImNoJWQiLCBjaCk7Cj4gKwo+
ICsJCWNsa2V2dFtjaF0tPmJhc2UgPSBiYXNlICsgSkg3MTEwX1RJTUVSX0NIX0JBU0UoY2gpOwo+
ICsJCS8qIEVuc3VyZSB0aW1lciBpcyBkaXNhYmxlZCAqLwo+ICsJCWpoNzExMF90aW1lcl9kaXNh
YmxlKGNsa2V2dFtjaF0pOwo+ICsKPiArCQlyc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4
Y2x1c2l2ZSgmcGRldi0+ZGV2LCBuYW1lKTsKPiArCQlpZiAoSVNfRVJSKHJzdCkpCj4gKwkJCXJl
dHVybiBQVFJfRVJSKHJzdCk7Cj4gKwo+ICsJCWNsa2V2dFtjaF0tPmNsayA9IGRldm1fY2xrX2dl
dF9lbmFibGVkKCZwZGV2LT5kZXYsIG5hbWUpOwo+ICsJCWlmIChJU19FUlIoY2xrZXZ0W2NoXS0+
Y2xrKSkKPiArCQkJcmV0dXJuIFBUUl9FUlIoY2xrZXZ0W2NoXS0+Y2xrKTsKPiArCj4gKwkJcmV0
ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChyc3QpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVy
biByZXQ7CgpTYW1lIGhlcmUuCgo+ICsKPiArCQljbGtldnRbY2hdLT5ldnQuaXJxID0gcGxhdGZv
cm1fZ2V0X2lycShwZGV2LCBjaCk7Cj4gKwkJaWYgKGNsa2V2dFtjaF0tPmV2dC5pcnEgPCAwKQo+
ICsJCQlyZXR1cm4gY2xrZXZ0W2NoXS0+ZXZ0LmlycTsKPiArCj4gKwkJc25wcmludGYoY2xrZXZ0
W2NoXS0+bmFtZSwgc2l6ZW9mKGNsa2V2dFtjaF0tPm5hbWUpLCAiJXMuY2glZCIsIHBkZXYtPm5h
bWUsIGNoKTsKPiArCQlqaDcxMTBfY2xvY2tldmVudHNfcmVnaXN0ZXIoY2xrZXZ0W2NoXSk7Cj4g
Kwo+ICsJCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgY2xrZXZ0W2NoXS0+ZXZ0
LmlycSwgamg3MTEwX3RpbWVyX2ludGVycnVwdCwKPiArCQkJCSAgICAgICBJUlFGX1RJTUVSIHwg
SVJRRl9JUlFQT0xMLAo+ICsJCQkJICAgICAgIGNsa2V2dFtjaF0tPm5hbWUsICZjbGtldnRbY2hd
LT5ldnQpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwo+ICsJCXJldCA9IGpo
NzExMF9jbG9ja3NvdXJjZV9pbml0KGNsa2V2dFtjaF0pOwoKRG9lcyBzb21ldGhpbmcgc2hvdWxk
IGJlIGRvbmUgaWYgdGhpcyBmYWlscz8KCkNKCgo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiBy
ZXQ7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGpoNzExMF90aW1lcl9tYXRjaFtdID0gewo+ICsJeyAuY29tcGF0aWJs
ZSA9ICJzdGFyZml2ZSxqaDcxMTAtdGltZXIiLCB9LAo+ICsJeyAvKiBzZW50aW5lbCAqLyB9Cj4g
K307Cj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGpoNzExMF90aW1lcl9tYXRjaCk7Cj4gKwo+
ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBqaDcxMTBfdGltZXJfZHJpdmVyID0gewo+
ICsJLnByb2JlID0gamg3MTEwX3RpbWVyX3Byb2JlLAo+ICsJLmRyaXZlciA9IHsKPiArCQkubmFt
ZSA9ICJqaDcxMTAtdGltZXIiLAo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGpoNzExMF90aW1lcl9t
YXRjaCwKPiArCX0sCj4gK307Cj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoamg3MTEwX3RpbWVy
X2RyaXZlcik7Cj4gKwo+ICtNT0RVTEVfQVVUSE9SKCJYaW5neXUgV3UgPHhpbmd5dS53dS1iT05y
TTQ1S1dGT1htTVhqSkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Iik7Cj4gK01PRFVMRV9ERVNDUklQ
VElPTigiU3RhckZpdmUgSkg3MTEwIHRpbWVyIGRyaXZlciIpOwo+ICtNT0RVTEVfTElDRU5TRSgi
R1BMIik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
