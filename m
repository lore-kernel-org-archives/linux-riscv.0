Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD35C7EE20
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s14BVhOZ/AkbodOwZ0mwitdxsXHi8BCa3F0Xo8BqFQ=; b=OVVNgIeAFwH3Jc
	B52ob+HsGViQkjPOL8v8NSqcO9q6OhCRGU5FiPGdNM/3fOLjn5HIPcBtfBwwjOnQPXG4MRGrVYS/H
	m+dVedDCcWmtot3xYvErPx8gjBU7K/61TsknqLMtV9imZr8WodMix1FVtubPdpLCcFdgUR+MClLVX
	8OjUiWKP1wPFyszKmWnGz5wcRlo1PNvlbwbyNYcVACJC6S5+rG2j+bym7Sv1SMs0cZ1cPPuSWtEf2
	S5wVGymqEsoY5lKJdnCZ+bxY9Sucg4q6aEj+T6CuMP45scYEGBM5m9wDubTOtiDmkTqEO5lwrCUjs
	9Ypwn+VYSFQnVCWio1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1praDy-0038JP-2a;
	Wed, 26 Apr 2023 08:10:02 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1praDv-0038IX-25
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 08:10:00 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id raDnpA1yS5yGNraDnpJfQb; Wed, 26 Apr 2023 10:09:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682496595;
	bh=LAH0ATvyqMIb5cRVxJ4q6wIOaOYd7NEbV2R9rOtQO/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NwYy5HYlxehL5uwgIHgDaEMuDSSsnez3Al6jf9JWsoWmBoISrbZLVpSLfMvBDATqB
	 eVnLakwyQZdTumiRLZWWokP+E9Um4hQ23HzKGC03YM5cCW1Dnga0UK9WrSqMnBXXMP
	 TgOytrWjmUNNXyKR4cTdfo+sE5y40g0v0ixOIWl/Sy+d6orkmto54kOLjip2LvtCzi
	 V2t99F+/tezNTsR/g4r76eboJ2ej7FiknryDPpC4FOQSr4PSvqXHLHpvkfT6ZwJiSj
	 A58XZxkk6uujn9lPs9RwzxxFqD2KyUrDC2i+/3+1FigA8NUWmYMEhyv9vhlX6iV7GK
	 nFMyJGeTs2rPQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 26 Apr 2023 10:09:55 +0200
X-ME-IP: 86.243.2.178
Message-ID: <67846b76-1ade-c253-e50b-1c0a0dd0a84a@wanadoo.fr>
Date: Wed, 26 Apr 2023 10:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 4/4] crypto: starfive - Add hash and HMAC support
Content-Language: fr
To: jiajie.ho@starfivetech.com
Cc: davem@davemloft.net, devicetree@vger.kernel.org,
 herbert@gondor.apana.org.au, kernel@esmil.dk,
 krzysztof.kozlowski+dt@linaro.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, robh+dt@kernel.org
References: <20230426065848.842221-1-jiajie.ho@starfivetech.com>
 <20230426065848.842221-5-jiajie.ho@starfivetech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230426065848.842221-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_010959_842222_6C43CF7E 
X-CRM114-Status: GOOD (  10.78  )
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

TGUgMjYvMDQvMjAyMyDDoCAwODo1OCwgSmlhIEppZSBIbyBhIMOpY3JpdMKgOgo+IEFkZGluZyBo
YXNoL0hNQUMgc3VwcG9ydCBmb3IgU0hBLTIgYW5kIFNNMyB0byBTdGFyRml2ZSBjcnlwdG9ncmFw
aGljCj4gbW9kdWxlLgo+IAo+IENvLWRldmVsb3BlZC1ieTogSHVhbiBGZW5nIDxodWFuLmZlbmct
Yk9Ock00NUtXRk9YbU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IEh1YW4gRmVuZyA8aHVhbi5mZW5nLWJPTnJNNDVLV0ZPWG1NWGpKQnBXcWdAcHVibGljLmdtYW5l
Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaWEgSmllIEhvIDxqaWFqaWUuaG8tYk9Ock00NUtXRk9Y
bU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUub3JnPgo+IC0tLQo+ICAgZHJpdmVycy9jcnlwdG8vc3Rh
cmZpdmUvS2NvbmZpZyAgICAgICB8ICAgNCArCj4gICBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9N
YWtlZmlsZSAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAt
Y3J5cC5jIHwgIDM4ICsrCj4gICBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtY3J5cC5o
IHwgIDcwICstCj4gICBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtaGFzaC5jIHwgODk2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDEwMDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtaGFzaC5jCj4gCgpbLi4uXQoKPiAraW50IHN0YXJmaXZl
X2hhc2hfcmVnaXN0ZXJfYWxncyh2b2lkKQo+ICt7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwly
ZXQgPSBjcnlwdG9fcmVnaXN0ZXJfYWhhc2hlcyhhbGdzX3NoYTJfc20zLCBBUlJBWV9TSVpFKGFs
Z3Nfc2hhMl9zbTMpKTsKPiArCj4gKwlyZXR1cm4gcmV0OwoKTml0OiByZXR1cm4gY3J5cHRvX3Jl
Z2lzdGVyX2FoYXNoZXMoYWxnc19zaGEyX3NtMywgCkFSUkFZX1NJWkUoYWxnc19zaGEyX3NtMykp
OwoKPwoKPiArfQo+ICsKPiArdm9pZCBzdGFyZml2ZV9oYXNoX3VucmVnaXN0ZXJfYWxncyh2b2lk
KQo+ICt7Cj4gKwljcnlwdG9fdW5yZWdpc3Rlcl9haGFzaGVzKGFsZ3Nfc2hhMl9zbTMsIEFSUkFZ
X1NJWkUoYWxnc19zaGEyX3NtMykpOwo+ICt9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
