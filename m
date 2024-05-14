Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB067C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hv7kToYBw9/tgMiQZ/mhk8JyvpV3MJQWi0zDQWN3fcE=; b=jNI4nfajjyHkUj
	XSG0KvZHfOmeQzRS3b1/bfXRcKHd9i7Msbkq6TR4FJeqeOYJsLCnWZx2B3HzBbJBJB8whcD2DLwkq
	mE/863Q/gc4Njuagmvdd1CTLKwuVGzru4OVox5OWH3BOFfKEiDfbkuyL8Dp83l5obAXZDCAA9R8W+
	SzPyn7E6p9xy3xxIZPPqAxeBqC8GeumwvO+ryn++6cDlIQOlCZc8cu2TgijvjECyxc/F8+qVgRWd2
	gqi1QgqZTAqX1V2aBbJytAd2L1AuUhz33tsu4DPmCezrpvsmoNRMGmxDq0XVx0KOxE+e15+yB18z5
	16z5HBkr6dxpmhrfkTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ogy-0000000FUdN-0OL3;
	Tue, 14 May 2024 09:43:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ogv-0000000FUbX-0zvu
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 09:43:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34cba0d9a3eso479367f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715679796; x=1716284596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEietWmYD6kKU/pV6wujRo1uhNo/bfHaQjmoZVTM8+A=;
        b=FTQetxR2FijLhkDiU3koEbTFXzwCRstLUsMz0iaY16ptnjCM1dx56iwrb3OSwXRCo3
         rxVPkUIH9eGFdeWpZ77aUU62ls7/8kYrg5e16Z6F/FoXhWgmQ3g60ME5CetcStr0k3fZ
         tRhd36oOB/2vQI7185Kq4dP2GyuEMaAxt8l+dOyYSfIbYwpJi3FUmLzKBwCUgyfE4LNU
         cvPkfHfAq/porib6VgkFDMK18mWx08gxVDNT2CzHRWvx6/cjzLTQkT1bp13Y2dRjTkgz
         RRIH7KToswGV/MJn+9WPrCHDYB2lKoXZ7te+4EIhA6FHVhwGOLKKVUrD94R3foiaRWit
         DxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679796; x=1716284596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEietWmYD6kKU/pV6wujRo1uhNo/bfHaQjmoZVTM8+A=;
        b=RTOz5soU73D6IkhJhkbzmMkob8ctByGnyOq6t5QbX/2YihXvwvYj6trVPk9US1W0aD
         tShsjoPZxzalN3S+NyvhoHapMPLolknetQr+Ev3GIAt/ih34XkBC2nDBsGnO+S8s4wJ2
         oCQamAoekItEjBi1zIxp6OfS1F4Cj5WTdCchF6FEty8tQhZ9ZTYcqNJSAjWL/wp/Cb2o
         q5ta7i1g1ZJa18ndu46X4Gmw1sazkaWIu2ixSi0F8lpyBlxDiLWlU5M34MY/xJRusAka
         LcusftevGyk6ghgVku7rD5J1wwDZGSJepNVCrYJgLhZsiAZNQDULMrStxjW2TiusZxq8
         iinQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8wsEBaRwPMwAsJHTRo2bQbq8HWAOSxpI81o/dAcphHfI/MZkEC1CmET4tTb40WaMpUzbrNkVEoab74vCukyVrYbbzKnqobS2CJ+58G9U
X-Gm-Message-State: AOJu0YxZgUGgt8d/9LiPlauRJdbgFXlWgo8d6jQqfnhD6WBS5oGlAPHR
	8sD1zTNnfU5FMPACbUHhRqLsoWXZ+OA+qpDD9XmRYQOY78bqfdckRk9YyUbUTH0=
X-Google-Smtp-Source: AGHT+IHsscONJjXt03GkOV8zZbc6kOxoRUClFHpAMSKc94NJeP6QWGgAaazEO2tWqCS4ba0q1uyBGQ==
X-Received: by 2002:a05:600c:1c11:b0:41f:9c43:574f with SMTP id 5b1f17b1804b1-41feac59cffmr88723965e9.3.1715679796443;
        Tue, 14 May 2024 02:43:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9? ([2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41faedf5dcesm76566455e9.0.2024.05.14.02.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 02:43:15 -0700 (PDT)
Message-ID: <c8e4c44d-8125-417e-8c61-a1f6d438815e@rivosinc.com>
Date: Tue, 14 May 2024 11:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] riscv: kvm: add SBI FWFT support for
 SBI_FWFT_DOUBLE_TRAP_ENABLE
To: Deepak Gupta <debug@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-7-cleger@rivosinc.com>
 <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_024325_443294_688A51B7 
X-CRM114-Status: GOOD (  27.14  )
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

CgpPbiAyNy8wNC8yMDI0IDAzOjE3LCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6NDVQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgc3VwcG9ydCBpbiBLVk0gU0JJIEZXRlQgZXh0ZW5zaW9uIHRvIGFsbG93IFZTLW1vZGUgdG8g
cmVxdWVzdCBkb3VibGUKPj4gdHJhcCBlbmFibGluZy4gRG91YmxlIHRyYXBzIGNhbiB0aGVuIGJl
IGdlbmVyYXRlZCBieSBWUy1tb2RlLCBhbGxvd2luZwo+PiBNLW1vZGUgdG8gcmVkaXJlY3QgdGhl
bSB0byBTLW1vZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmlfZndmdC5oIHzCoCAyICstCj4+IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2Z3ZnQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysKPj4gMyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaAo+PiBpbmRleCA5MDVjZGY4OTRhNTcuLmVlMWI3MzY1NWJlYyAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+PiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4+IEBAIC0xOTYsNiArMTk2LDcgQEAKPj4gLyogeEVO
VkNGRyBmbGFncyAqLwo+PiAjZGVmaW5lIEVOVkNGR19TVENFwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAoX0FDKDEsIFVMTCkgPDwgNjMpCj4+ICNkZWZpbmUgRU5WQ0ZHX1BCTVRFwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoX0FDKDEsIFVMTCkgPDwgNjIpCj4+ICsjZGVmaW5lIEVOVkNGR19EVEXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIChfQUMoMSwgVUxMKSA8PCA1OSkKPj4gI2RlZmluZSBFTlZDRkdf
Q0JaRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKF9BQygxLCBVTCkgPDwgNykKPj4gI2RlZmluZSBF
TlZDRkdfQ0JDRkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChfQUMoMSwgVUwpIDw8IDYpCj4+ICNk
ZWZpbmUgRU5WQ0ZHX0NCSUVfU0hJRlTCoMKgwqDCoMKgwqDCoCA0Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKPj4gYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKPj4gaW5kZXggN2RjMWI4MGM3ZTZjLi5h
OWUyMGQ2NTUxMjYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3Zj
cHVfc2JpX2Z3ZnQuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aV9md2Z0LmgKPj4gQEAgLTExLDcgKzExLDcgQEAKPj4KPj4gI2luY2x1ZGUgPGFzbS9zYmkuaD4K
Pj4KPj4gLSNkZWZpbmUgS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlTCoMKgwqAgMQo+PiArI2Rl
ZmluZSBLVk1fU0JJX0ZXRlRfRkVBVFVSRV9DT1VOVMKgwqDCoCAyCj4+Cj4+IHN0cnVjdCBrdm1f
c2JpX2Z3ZnRfY29uZmlnOwo+PiBzdHJ1Y3Qga3ZtX3ZjcHU7Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPj4gYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPj4gaW5kZXggYjliN2Y4ZmE2ZDIyLi45ZThlMzk3ZWIwMmYgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9md2Z0LmMKPj4gQEAgLTksMTAgKzksMTkgQEAKPj4gI2luY2x1ZGUgPGxpbnV4L2Vy
cm5vLmg+Cj4+ICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2t2bV9o
b3N0Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcmlzY3ZfZGJsdHJwLmg+Cj4+ICNpbmNsdWRlIDxh
c20vc2JpLmg+Cj4+ICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4+ICNpbmNsdWRlIDxh
c20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaD4KPj4KPj4gKyNpZmRlZiBDT05GSUdfMzJCSVQKPj4gKyMg
ZGVmaW5lIENTUl9IRU5WQ0ZHX0RCTFRSUMKgwqDCoCBDU1JfSEVOVkNGR0gKPj4gKyMgZGVmaW5l
IERCTFRSUF9EVEXCoMKgwqAgKEVOVkNGR19EVEUgPj4gMzIpCj4+ICsjZWxzZQo+PiArIyBkZWZp
bmUgQ1NSX0hFTlZDRkdfREJMVFJQwqDCoMKgIENTUl9IRU5WQ0ZHCj4+ICsjIGRlZmluZSBEQkxU
UlBfRFRFwqDCoMKgIEVOVkNGR19EVEUKPj4gKyNlbmRpZgo+PiArCj4+ICNkZWZpbmUgTUlTX0RF
TEVHICgxVUwgPDwgRVhDX0xPQURfTUlTQUxJR05FRCB8IDFVTCA8PAo+PiBFWENfU1RPUkVfTUlT
QUxJR05FRCkKPj4KPj4gc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVs
ZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+IEBAIC0zNiw2ICs0NSwzMyBAQCBzdGF0
aWMgaW50Cj4+IGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPj4gwqDCoMKgwqByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+IH0KPj4KPj4g
K3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X3NldF9kb3VibGVfdHJhcChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
a3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4+ICt7Cj4+ICvCoMKgwqAgaWYgKCFy
aXNjdl9kb3VibGVfdHJhcF9lbmFibGVkKCkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gU0JJ
X0VSUl9OT1RfU1VQUE9SVEVEOwo+IAo+IFdoeSBpdHMgcmVxdWlyZWQgdG8gY2hlY2sgd2hldGhl
ciBob3N0IGhhcyBlbmFibGVkIGRvdWJsZSB0cmFwIGZvciBpdHNlbGYgPwo+IEl0J3Mgb3J0aG9n
b25hbCB0byBndWVzdCBhc2tpbmcgaHlwZXJ2aXNvciB0byBlbmFibGUgZG91YmxlIHRyYXAuCgpI
aSBEZWVwYWssCgpJbmRlZWQsIGFzIHlvdSBzYXcsIGhlbnZjZmcuRFRFIG5lZWRzIG1lbnZjZmcu
RFRFIHRvIGJlIGVuYWJsZWQgaW4gb3JkZXIKdG8gYmUgdXNhYmxlLgoKPiAKPiBQcm9iYWJseSB5
b3UgbmVlZCBhIGNoZWNrIGhlcmUgd2hldGhlciB1bmRlcmx5aW5nIEZXIHN1cHBvcnRzIGhhbmRs
aW5nCj4gZG91YmxlCj4gdHJhcC4KPiAKPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/Cj4g
Cj4+ICsKPj4gK8KgwqDCoCBpZiAodmFsdWUpCj4+ICvCoMKgwqDCoMKgwqDCoCBjc3Jfc2V0KENT
Ul9IRU5WQ0ZHX0RCTFRSUCwgREJMVFJQX0RURSk7Cj4+ICvCoMKgwqAgZWxzZQo+PiArwqDCoMKg
wqDCoMKgwqAgY3NyX2NsZWFyKENTUl9IRU5WQ0ZHX0RCTFRSUCwgREJMVFJQX0RURSk7Cj4gCj4g
SSB0aGluayB2Y3B1LT5hcmNoLmNmZyBoYXMgYGhlbnZjZmdgIGZpZWxkLiBDYW4gd2UgcmVmbGVj
dCBpdCB0aGVyZSBhcwo+IHdlbGwgc28gdGhhdCBjdXJyZW50Cj4gYGhlbnZjZmdgIGNvcHkgaW4g
dmNwdSBhcmNoIHNwZWNpZmNpIGNvbmZpZyBpcyBjb25zaXN0ZW50PyBPdGhlcndpc2UKPiBpdCds
bCBiZSBsb3N0IHdoZW4gdkNQVQo+IGlzIHNjaGVkdWxlZCBvdXQgYW5kIGxhdGVyIHNjaGVkdWxl
ZCBiYWNrIGluIChvbiB2Y3B1IGxvYWQpCgpoZW52Y2ZnIGlzIHJlc3RvcmVkIHdoZW4gbG9hZGlu
ZyB0aGUgdnBjdSAoa3ZtX2FyY2hfdmNwdV9sb2FkKCkpIGFuZApzYXZlZCB3aGVuIHRoZSBDUFUg
aXMgcHV0IChrdm1fYXJjaF92Y3B1X3B1dCgpKS4gQnV0IEkganVzdCBzYXcgdGhhdAp0aGlzIGNo
YW5nZSBpcyBpbmNsdWRlZCBpbiB0aGUgbmV4dCBwYXRjaC4gU2hvdWxkIGhhdmUgYmVlbiB0aGlz
IG9uZSAsCkknbGwgZml4IHRoYXQuCgoKPiAKPiBGdXJ0aGVybW9yZSwgbGV0cyBub3QgZG8gZmVh
dHVyZSBzcGVjaWZpYyBhbGlhcyBuYW1lcyBmb3IgQ1NSLgo+IAo+IEluc3RlYWQgbGV0J3Mga2Vl
cCBjb25zaXN0ZW50IDY0Yml0IGltYWdlIG9mIGhlbnZjZmcgaW4gdmNwdS0+YXJjaC5jZmcuCj4g
Cj4gQW5kIHdoZW5ldmVyIGl0J3MgdGltZSB0byBwaWNrIHVwIHRoZSBzZXR0aW5nLCBwaWNrIHVw
IGxvZ2ljIGVpdGhlcgo+IHBlcmZvcm0gdGhlIHdyaXRlcyBpbgo+IGhlbnZjZmcuIEFuZCBpZiBy
ZXF1aXJlZCBpdCdsbCBwZXJmb3JtIGhlbnZjZmdoIHRvbyAoYXMKPiBga3ZtX2FyY2hfdmNwdV9s
b2FkYCBhbHJlYWR5IGRvZXMpCgpJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGF0
IHBvaW50IHNvIGlmIHlvdSB0aGluayBpdCByZWFsbHkgaXMKYmV0dGVyLCBJJ2xsIHN3aXRjaCB0
byB0aGF0LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gU0JJ
X1NVQ0NFU1M7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X2dldF9kb3Vi
bGVfdHJhcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKnZhbHVl
KQo+PiArewo+PiArwqDCoMKgIGlmICghcmlzY3ZfZG91YmxlX3RyYXBfZW5hYmxlZCgpKQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKPj4gKwo+PiArwqDC
oMKgICp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVOVkNGR19EQkxUUlApICYgREJMVFJQX0RURSkg
IT0gMDsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBTQklfU1VDQ0VTUzsKPj4gK30KPj4gKwo+PiBz
dGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgo+PiBrdm1fc2JpX2Z3ZnRfZ2V0X2Nv
bmZpZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90Cj4+IGZl
YXR1cmUpCj4+IHsKPj4gQEAgLTExMSw2ICsxNDcsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBr
dm1fc2JpX2Z3ZnRfZmVhdHVyZQo+PiBmZWF0dXJlc1tdID0gewo+PiDCoMKgwqDCoMKgwqDCoCAu
aWQgPSBTQklfRldGVF9NSVNBTElHTkVEX0RFTEVHLAo+PiDCoMKgwqDCoMKgwqDCoCAuc2V0ID0g
a3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4+IMKgwqDCoMKgwqDCoMKg
IC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gK8KgwqDC
oCB9LAo+PiArwqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5pZCA9IFNCSV9GV0ZUX0RPVUJM
RV9UUkFQX0VOQUJMRSwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0
X2RvdWJsZV90cmFwLAo+PiArwqDCoMKgwqDCoMKgwqAgLmdldCA9IGt2bV9zYmlfZndmdF9nZXRf
ZG91YmxlX3RyYXAsCj4+IMKgwqDCoMKgfQo+PiB9Owo+Pgo+PiAtLcKgCj4+IDIuNDMuMAo+Pgo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
