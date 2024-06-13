Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194F9C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSG209f1v7FSwLbqaDsFbS0nIXTo6Qgm1sDJYsMeaDw=; b=WBJrys2JoF6GgC
	tzRfINYv/OQa4zPV1IUiDGeYcZ/aBAWIEU7QgKpVWzp40JkTAsC7ko6JN3OQ8KIP7A2tLnefZHyoI
	IxzGJ5m/JvK1vHInsOXUlUlDuoS0fAo/2azbcTFk2gUShLCKELIDRidVtToY7ag1aFuBp4zr8o18W
	Cc2e1VgztBOeXRqO0zUeTm9qVjwTDIVaRiFdpIgKU2CrislvcvVLDsdItosOMayqRTZ6NVRI/1O9y
	35UYwouGQQyg75WmCNWke4FIRNLNttXyE5KECfQgT8W/1VQf3vy5/bQReWt1Cd/X8qxFioVT8hcxC
	Wg8WYS/kG+NxVGBsmLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnnw-0000000HRTm-2rUA;
	Thu, 13 Jun 2024 17:00:04 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnns-0000000HRRO-463b
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:00:02 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7e21b6e98bdso45954739f.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 09:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718297997; x=1718902797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCGT1G5c+EZwzbvL6QH+mOF0nck68vF2oKoSs0AcMhs=;
        b=aS6k/0yP4fW46569pogF8PEnEyZ3ONuRIgNR3RVA3GFt+9xjVbQ6wYayO9NTg1PP1v
         smTyktZTgOC4xeR5t50uLjYMTbKIjh4uaZPZUtcasw8lTu3SycjHXpbaL0pG1U5KG2od
         16EJHPOj/8HkDQNbMmg6zmJW7b06gF7qcjUzw2dkyf8UWZ/JyizRawTAIFwIS9SOGpJd
         D3vqYAaImSJLZsX6SkHURkLC960/0NJ/kB1cz2oyvl6TxkSbaYO5Xcn9wIwt6c7ZCy3p
         67PUUMfVpjPRsgiXeKMvtmxkWHMnFwcZnMVyfVlrG60Cm3r69GChxyptOhGJA2p0Z22g
         TtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297997; x=1718902797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCGT1G5c+EZwzbvL6QH+mOF0nck68vF2oKoSs0AcMhs=;
        b=X8WtQTTjNUhTOUyHTiRlmYuKswwLDP0VADI5SS2WVLMGkiD1Z9225i7CM0OZMKS870
         C4aVKF5/Jhq0M33qwQzXzx3zOR28Akrm7A/RrVM262H/tz7n15lrpRSzVor7TW0UKujP
         4ozj3scO1lhjJQFkGLwvoIR1tbO+Vu2mKnjHCGE9vUsidoF3qESpKrY3E85H618iNwYf
         vppYTRI7MfehK06VWNDNqFUmCeAF18HPf4TPUwL73gRNLLL/lLVh0oi++/2zakUfX7UH
         QxaiffTOt4mDo1afPamoC07tzvLth9m45A6XDOgI/8toswxbZ+bAQEVWRsxSoLCrGllA
         O7zw==
X-Gm-Message-State: AOJu0Yz5xPnexJ6kgA0kHPpfQOyQAmvp/gRHpPF/J+1Cl/ekhQbWIGN6
	r0iTVo6MMJL+PaaU/JpS6Zm4sq3gu0INSLCmPpdQFccNfYmfUYyxeoAfVBXy5+Q=
X-Google-Smtp-Source: AGHT+IFpgRITYAvTReAUcbPjuR+2tcKYTAy7JUib7uknhSLvituuWoFpdavFlwghfs5OiLKEcbfCqw==
X-Received: by 2002:a05:6602:2dd1:b0:7eb:7f2e:5b33 with SMTP id ca18e2360f4ac-7ebeb4977c1mr9767039f.4.1718297997328;
        Thu, 13 Jun 2024 09:59:57 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9568dfb15sm452953173.18.2024.06.13.09.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 09:59:56 -0700 (PDT)
Message-ID: <d8575593-588d-406e-bcd3-eaec93e43e2c@sifive.com>
Date: Thu, 13 Jun 2024 11:59:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: Add support for per-thread envcfg CSR values
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <20240605205658.184399-3-samuel.holland@sifive.com>
 <ZmOCpF5ACdQiSfcm@debug.ba.rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZmOCpF5ACdQiSfcm@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_100001_204841_A5523BDF 
X-CRM114-Status: GOOD (  21.53  )
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

SGkgRGVlcGFrLAoKT24gMjAyNC0wNi0wNyA0OjU5IFBNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4g
T24gV2VkLCBKdW4gMDUsIDIwMjQgYXQgMDE6NTY6NDZQTSAtMDcwMCwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6Cj4+IFNvbWUgYml0cyBpbiB0aGUgW21zXWVudmNmZyBDU1IsIHN1Y2ggYXMgdGhlIENG
SSBzdGF0ZSBhbmQgcG9pbnRlcgo+PiBtYXNraW5nIG1vZGUsIG5lZWQgdG8gYmUgY29udHJvbGxl
ZCBvbiBhIHBlci10aHJlYWQgYmFzaXMuIFN1cHBvcnQgdGhpcwo+PiBieSBrZWVwaW5nIGEgY29w
eSBvZiB0aGUgQ1NSIHZhbHVlIGluIHN0cnVjdCB0aHJlYWRfc3RydWN0IGFuZCB3cml0aW5nCj4+
IGl0IGR1cmluZyBjb250ZXh0IHN3aXRjaGVzLiBJdCBpcyBzYWZlIHRvIGRpc2NhcmQgdGhlIG9s
ZCBDU1IgdmFsdWUKPj4gZHVyaW5nIHRoZSBjb250ZXh0IHN3aXRjaCBiZWNhdXNlIHRoZSBDU1Ig
aXMgbW9kaWZpZWQgb25seSBieSBzb2Z0d2FyZSwKPj4gc28gdGhlIENTUiB3aWxsIHJlbWFpbiBp
biBzeW5jIHdpdGggdGhlIGNvcHkgaW4gdGhyZWFkX3N0cnVjdC4KPj4KPj4gVXNlIEFMVEVSTkFU
SVZFIGRpcmVjdGx5IGluc3RlYWQgb2YgcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseSgpIHRv
Cj4+IG1pbmltaXplIGJyYW5jaGluZXNzIGluIHRoZSBjb250ZXh0IHN3aXRjaGluZyBjb2RlLgo+
Pgo+PiBTaW5jZSB0aHJlYWRfc3RydWN0IGlzIGNvcGllZCBkdXJpbmcgZm9yaygpLCBzZXR0aW5n
IHRoZSB2YWx1ZSBmb3IgdGhlCj4+IGluaXQgdGFzayBzZXRzIHRoZSBkZWZhdWx0IHZhbHVlIGZv
ciBhbGwgb3RoZXIgdGhyZWFkcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+IC0tLQo+Pgo+PiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgMSArCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNo
X3RvLmggfCA4ICsrKysrKysrCj4+IGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuY8KgwqDC
oMKgIHwgMiArLQo+PiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmgKPj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4+IGluZGV4IDY4YzM0
MzJkYzZlYS4uMDgzODkyMmJkMWM4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmgKPj4gQEAgLTExOCw2ICsxMTgsNyBAQCBzdHJ1Y3QgdGhyZWFkX3N0cnVjdCB7Cj4+IMKgwqDC
oMKgdW5zaWduZWQgbG9uZyBzWzEyXTvCoMKgwqAgLyogc1swXTogZnJhbWUgcG9pbnRlciAqLwo+
PiDCoMKgwqDCoHN0cnVjdCBfX3Jpc2N2X2RfZXh0X3N0YXRlIGZzdGF0ZTsKPj4gwqDCoMKgwqB1
bnNpZ25lZCBsb25nIGJhZF9jYXVzZTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGVudmNmZzsK
Pj4gwqDCoMKgwqB1MzIgcmlzY3Zfdl9mbGFnczsKPj4gwqDCoMKgwqB1MzIgdnN0YXRlX2N0cmw7
Cj4+IMKgwqDCoMKgc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgdnN0YXRlOwo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+PiBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPj4gaW5kZXggNzU5NGRmMzdjYzlmLi45Njg1Y2Q4NWU1
N2MgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+PiBAQCAtNzAsNiArNzAs
MTMgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc19mcHUodm9pZCkgeyByZXR1cm4g
ZmFsc2U7IH0KPj4gI2RlZmluZSBfX3N3aXRjaF90b19mcHUoX19wcmV2LCBfX25leHQpIGRvIHsg
fSB3aGlsZSAoMCkKPj4gI2VuZGlmCj4+Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hf
dG9fZW52Y2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPj4gK3sKPj4gK8KgwqDCoCBhc20g
dm9sYXRpbGUgKEFMVEVSTkFUSVZFKCJub3AiLCAiY3NydyAiIF9fc3RyaW5naWZ5KENTUl9FTlZD
RkcpICIsICUwIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgUklT
Q1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcsIDEpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDo6
ICJyIiAobmV4dC0+dGhyZWFkLmVudmNmZykgOiAibWVtb3J5Iik7Cj4+ICt9Cj4+ICsKPj4gZXh0
ZXJuIHN0cnVjdCB0YXNrX3N0cnVjdCAqX19zd2l0Y2hfdG8oc3RydWN0IHRhc2tfc3RydWN0ICos
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0
YXNrX3N0cnVjdCAqKTsKPj4KPj4gQEAgLTEwMyw2ICsxMTAsNyBAQCBkbyB7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDC
oMKgwqAgX19zd2l0Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19uZXh0KTvCoMKgwqAgXAo+PiDCoMKg
wqDCoGlmIChzd2l0Y2hfdG9fc2hvdWxkX2ZsdXNoX2ljYWNoZShfX25leHQpKcKgwqDCoCBcCj4+
IMKgwqDCoMKgwqDCoMKgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTvCoMKgwqDCoMKgwqDCoCBc
Cj4+ICvCoMKgwqAgX19zd2l0Y2hfdG9fZW52Y2ZnKF9fbmV4dCk7wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4+IMKgwqDCoMKgKChsYXN0KSA9IF9fc3dpdGNoX3RvKF9fcHJldiwgX19uZXh0KSk7
wqDCoMKgwqDCoMKgwqAgXAo+PiB9IHdoaWxlICgwKQo+IAo+IFN1Z2dlc3Rpb246Cj4gUHJvYmFi
bHkgbWFrZSB0aGlzIHBhdGNoIDEKPiAKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiBpbmRl
eCAyODc5ZTI2ZGJjZDguLjExNTNiOTYzNDZhZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+PiBAQCAtNzI4LDcgKzcyOCw3IEBAIHVuc2lnbmVkIGxvbmcgcmlzY3ZfZ2V0X2VsZl9od2Nh
cCh2b2lkKQo+PiB2b2lkIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKQo+PiB7Cj4+IMKgwqDC
oMKgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNCT1op
KQo+PiAtwqDCoMKgwqDCoMKgwqAgY3NyX3NldChDU1JfRU5WQ0ZHLCBFTlZDRkdfQ0JaRSk7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBjdXJyZW50LT50aHJlYWQuZW52Y2ZnIHw9IEVOVkNGR19DQlpFOwo+
IAo+IFN1Z2dlc3Rpb246Cj4gU3F1YXNoIHRoaXMgd2l0aCBjdXJyZW50IHBhdGNoIDEgYW5kIGNh
bGwgaXQgcGF0Y2ggMi4KClRoaXMgcmVvcmdhbml6YXRpb24gZG9lc24ndCB3b3JrLiBJZiBJIGFk
ZCBfX3N3aXRjaF90b19lbnZjZmcoKSBmaXJzdCB3aXRob3V0CnRoaXMgY2hhbmdlLCB0aGVuIHRo
ZSBDU1Igd291bGQgZ2V0IHplcm9lZCBvdXQgZHVyaW5nIHRoZSBmaXJzdCBjb250ZXh0IHN3aXRj
aCwKc28gdXNlcnNwYWNlIGNiby56ZXJvIHdvdWxkIGJlIGJyb2tlbiBhZnRlciB0aGUgZmlyc3Qg
cGF0Y2guCgpSZWdhcmRzLApTYW11ZWwKCj4+IMKgwqDCoMKgZWxzZSBpZiAoYW55X2NwdV9oYXNf
emljYm96KQo+PiDCoMKgwqDCoMKgwqDCoCBwcl93YXJuX29uY2UoIlppY2JveiBkaXNhYmxlZCBh
cyBpdCBpcyB1bmF2YWlsYWJsZSBvbiBzb21lIGhhcnRzXG4iKTsKPj4gfQo+PiAtLcKgCj4+IDIu
NDQuMQo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
