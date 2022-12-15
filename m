Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB20EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcvVIqi0jxKSH/XwWmqzZN26W3t//SWzsgdf4WCJAqs=; b=0YwLA1asyfe9Qz
	WubO05MQIwZAxf8gBJ+NgZPUZPH3R6Zvwj0sKKsSrht2TU2E3IV0VhLk5i0gbYISKfTA+dMCaNnd+
	afVqcVx05IXoiwr0fCBywPz6ehy/h49P5pDRKI2oD0ovcp1lw/50pe5aOi8kL6dfdaKGqSWJKYjDA
	9hHiHx4lA0MgbCw/q/o3mnloz/Kmpyv8KIDbsahRHCT5bHCd2RALYDCrKDsk6bncn0ulqpsqdpZu9
	Ih31kVYfTyr0qt7O73gSVQgcQw9JQa8PaPd0XlCRZdEul+4iff1OJJdtvMh3JnrK6Bcu4UjhuRnbf
	dB4VR1+AZcZ5Efc+GoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tPz-00AvfO-DY; Thu, 15 Dec 2022 18:57:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tPv-00AvbJ-5H
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 18:57:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so53993pjm.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+47s1xAdNyBz4g1fVdzMecYrKvurW3RHPdAWqvqDsI=;
        b=jD+1Cj5gJs2Uf4HQEw1HYFmywinfjK/+FWmh1ciGaQZOyOKJ/Kg5SMANR0RiVLBVUD
         8RyUkf7pA+EUgU24as+SiX3bnUopfZg+G2Ix4/3ZgoChLbG5uT7LnQFDX8Ra6tZIdUv1
         nVkhiZ+Y1dN3PnvlSqB2XSsYfUbdbXlTv/VBF8vxdNoiEsGKTnAA2unN6J16A5eKkqB5
         DHuriSz24tabClN3QcjAHV6H5CJOJtffCAXR+dZmmG8XR6HrD3rMkwwfpkOkMVUhp5tr
         nK79TnDfdbX8WoUoX/uvzaExU7Aq9PoP0F3n8zJngj6jXEP6Bpnz45W/Yfjn+Hfv/OwK
         Xiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+47s1xAdNyBz4g1fVdzMecYrKvurW3RHPdAWqvqDsI=;
        b=iqYQS7gLYOeOhU0/Wxld31HUrA3D+L0oiapnB3gBfQW3vDaz4s8EnYDZ0KUPWBhmvl
         E6tImZh6fs7pWK9H47polI2GIX27pRdAd8DhVUdFCMhj8Rt04XQWG9rJhO0BPG1KyA4q
         YV4whR+QzkvpJTopycZ49WvEBRWwcFwA4M09vB/iOaZUbDG1suOX4VVBhhSppFV3rePj
         0B8kNK1KnACglAboKgSYaYgmqajJKK6kS49yFgCeaoQEBejd/8zeFbsgBMD1Ll63i4j6
         +XtTh79sKSmo5xJLUxryxfRyc7llvO94pTyX2vjWTCT44CwzVHjiT4imQNy1a+F2VbpM
         j17w==
X-Gm-Message-State: ANoB5pmZ8fEaRdv/RiZMQPoOnwnjAedDJfhJzy6uO80lRMxwgyDYnUXw
	vFig1udWiMhuORqBTtQ7V53ieA==
X-Google-Smtp-Source: AA0mqf6ELJjqFjBDGa6oMZGkw0/s5xWSyTm6RxKD01xa2PL7NTHARAmItfZLAU8xB3HuHPlat+DsUA==
X-Received: by 2002:a17:902:7e47:b0:18f:5bc0:5893 with SMTP id a7-20020a1709027e4700b0018f5bc05893mr22939101pln.0.1671130627861;
        Thu, 15 Dec 2022 10:57:07 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0016d773aae60sm9595pll.19.2022.12.15.10.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 10:57:07 -0800 (PST)
Message-ID: <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
Date: Thu, 15 Dec 2022 10:57:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Florian Weimer <fweimer@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Darius Rad <darius@bluespec.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
 atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
 <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
 <Y5qByfCtpV0uNID3@bruce.bluespec.com>
 <877cysx4yf.fsf@all.your.base.are.belong.to.us>
 <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
 <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_105715_230078_26B181B2 
X-CRM114-Status: GOOD (  17.74  )
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

CgpPbiAxMi8xNS8yMiAwNzozMywgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4gT24gMTIvMTUv
MjIgMDQ6MjgsIEZsb3JpYW4gV2VpbWVyIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+PiAqIEJqw7Zy
biBUw7ZwZWw6Cj4+Cj4+Pj4gRm9yIFNWRSwgaXQgaXMgaW4gZmFjdCBkaXNhYmxlZCBieSBkZWZh
dWx0IGluIHRoZSBrZXJuZWwuwqAgV2hlbiBhIAo+Pj4+IHRocmVhZAo+Pj4+IGV4ZWN1dGVzIHRo
ZSBmaXJzdCBTVkUgaW5zdHJ1Y3Rpb24sIGl0IHdpbGwgY2F1c2UgYW4gZXhjZXB0aW9uLCB0aGUg
Cj4+Pj4ga2VybmVsCj4+Pj4gd2lsbCBhbGxvY2F0ZSBtZW1vcnkgZm9yIFNWRSBzdGF0ZSBhbmQg
ZW5hYmxlIFRJRl9TVkUuIEZ1cnRoZXIgdXNlIAo+Pj4+IG9mIFNWRQo+Pj4+IGluc3RydWN0aW9u
cyB3aWxsIHByb2NlZWQgd2l0aG91dCBleGNlcHRpb25zLsKgIEFsdGhvdWdoIFNWRSBpcyAKPj4+
PiBkaXNhYmxlZCBieQo+Pj4+IGRlZmF1bHQsIGl0IGlzIGVuYWJsZWQgYXV0b21hdGljYWxseS7C
oCBTaW5jZSB0aGlzIGlzIGRvbmUgCj4+Pj4gYXV0b21hdGljYWxseQo+Pj4+IGR1cmluZyBhbiBl
eGNlcHRpb24gaGFuZGxlciwgdGhlcmUgaXMgbm8gb3Bwb3J0dW5pdHkgZm9yIG1lbW9yeSAKPj4+
PiBhbGxvY2F0aW9uCj4+Pj4gZXJyb3JzIHRvIGJlIHJlcG9ydGVkLCBhcyB0aGVyZSBhcmUgaW4g
dGhlIEFNWCBjYXNlLgo+Pj4KPj4+IEdsaWJjIGhhcyBhbiBTVkUgb3B0aW1pemVkIG1lbWNweSwg
cmlnaHQ/IERvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgcHJldHR5Cj4+PiBtdWNoIGFsbCBwcm9jZXNz
ZXMgb24gYW4gU1ZFIGNhcGFibGUgc3lzdGVtIHdpbGwgZW5hYmxlIFNWRSAKPj4+IChsYXppbHkp
PyBJZgo+Pj4gc28sIHRoYXQncyBjbG9zZSB0byAiZW5hYmxlZCBieSBkZWZhdWx0IiAodW5sZXNz
IFNWRSBpcyBkaXNhYmxlZCBzeXN0ZW0KPj4+IHdpZGUpLgo+Pgo+PiBZZXMsIHNlZSBzeXNkZXBz
L2FhcmNoNjQvbXVsdGlhcmNoL21lbWNweS5jOgo+Pgo+PiDCoMKgIHN0YXRpYyBpbmxpbmUgX190
eXBlb2YgKF9fcmVkaXJlY3RfbWVtY3B5KSAqCj4+IMKgwqAgc2VsZWN0X21lbWNweV9pZnVuYyAo
dm9pZCkKPj4gwqDCoCB7Cj4+IMKgwqDCoMKgIElOSVRfQVJDSCAoKTsKPj4gwqDCoCDCoMKgwqDC
oCBpZiAoc3ZlICYmIEhBVkVfQUFSQ0g2NF9TVkVfQVNNKQo+PiDCoMKgwqDCoMKgwqAgewo+PiDC
oMKgwqDCoMKgwqDCoMKgIGlmIChJU19BNjRGWCAobWlkcikpCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBfX21lbWNweV9hNjRmeDsKPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gX19t
ZW1jcHlfc3ZlOwo+PiDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgIMKgwqDCoMKgIGlmIChJU19USFVO
REVSWCAobWlkcikpCj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gX19tZW1jcHlfdGh1bmRlcng7Cj4+
IMKgwqAgwqDCoMKgwqAgaWYgKElTX1RIVU5ERVJYMiAobWlkcikgfHwgSVNfVEhVTkRFUlgyUEEg
KG1pZHIpKQo+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIF9fbWVtY3B5X3RodW5kZXJ4MjsKPj4gwqDC
oCDCoMKgwqDCoCBpZiAoSVNfRkFMS09SIChtaWRyKSB8fCBJU19QSEVDREEgKG1pZHIpKQo+PiDC
oMKgwqDCoMKgwqAgcmV0dXJuIF9fbWVtY3B5X2ZhbGtvcjsKPj4gwqDCoCDCoMKgwqDCoCByZXR1
cm4gX19tZW1jcHlfZ2VuZXJpYzsKPj4gwqDCoCB9Cj4+IMKgwqAgQW5kIHRoZSBfX21lbWNweV9z
dmUgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNlcyBTVkUuCj4+Cj4+IElmIHRoZXJlIHdlcmUg
YSBwcmN0bCB0byBzZWxlY3QgdGhlIHZlY3RvciB3aWR0aCBhbmQgZW5hYmxlIHRoZSB2ZWN0b3IK
Pj4gZXh0ZW5zaW9uLCB3ZSdkIGhhdmUgdG8gcGljayBhIHdpZHRoIGluIGdsaWJjIGFueXdheS4K
Pgo+IFRoZXJlICppcyogYSBwcmN0bCB0byBhZGp1c3QgdGhlIFNWRSB2ZWN0b3Igd2lkdGgsIGJ1
dCBnbGliYyBkb2VzIG5vdCAKPiBuZWVkIHRvIHNlbGVjdCBiZWNhdXNlIFNWRSBkeW5hbWljYWxs
eSBhZGp1c3RzIHRvIHRoZSBjdXJyZW50bHkgCj4gZW5hYmxlZCB3aWR0aC7CoCBUaGUga2VybmVs
IHNlbGVjdHMgYSBkZWZhdWx0IHdpZHRoIHRoYXQgZml0cyB3aXRoaW4gCj4gdGhlIGRlZmF1bHQg
c2lnbmFsIGZyYW1lIHNpemUuCj4KPiBUaGUgb3RoZXIgdGhpbmcgb2Ygbm90ZSBmb3IgU1ZFIGlz
IHRoYXQsIHdpdGggdGhlIGRlZmF1bHQgZnVuY3Rpb24gQUJJIAo+IGFsbCBvZiB0aGUgU1ZFIHN0
YXRlIGlzIGNhbGwtY2xvYmJlcmVkLCB3aGljaCBhbGxvd3MgdGhlIGtlcm5lbCB0byAKPiBkcm9w
IGluc3RlYWQgb2Ygc2F2ZSBzdGF0ZSBhY3Jvc3Mgc3lzdGVtIGNhbGxzLsKgIChUaGVyZSBpcyBh
IHNlcGFyYXRlIAo+IHZlY3RvciBmdW5jdGlvbiBjYWxsIEFCSSB3aGVuIFNWRSB0eXBlcyBhcmUg
dXNlZC4pCgpGb3IgdGhlIFJWIHBzQUJJLCBpdCBpcyBzaW1pbGFyIC0gYWxsIFYgcmVncyBhcmUg
CmNhbGxlci1zYXZlZC9jYWxsLWNsb2JiZXJlZCBbMV0gYW5kIHN5c2NhbGxzIGFyZSBub3QgcmVx
dWlyZWQgdG8gCnByZXNlcnZlIFYgcmVncyBbMl0KSG93ZXZlciBsYXN0IEkgY2hlY2tlZCBBUk0g
ZG9jdW1lbnRhdGlvbiB0aGUgQUJJIGRvYyBzZWVtZWQgdG8gc3VnZ2VzdCAKdGhhdCBzb21lIChw
YXJ0cykgb2YgdGhlIFNWRSByZWdzIGFyZSBjYWxsZWUtc2F2ZWQgWzNdCgo+Cj4gU28gd2hpbGUg
c3RyY3B5IG1heSBlbmFibGUgU1ZFIGZvciB0aGUgdGhyZWFkLCB0aGUgbmV4dCBzeXNjYWxsIG1h
eSAKPiBkaXNhYmxlIGl0IGFnYWluLgoKTmV4dCBzeXNjYWxsIGNvdWxkIHRyYXNoIHRoZW0sIGJ1
dCB3aWxsIGl0IGRpc2FibGUgU1ZFID8gRGVzcGl0ZSAKc3lzY2FsbC9mdW5jdGlvbi1jYWxsIGNs
b2JiZXJzLCB1c2luZyBWIGluIHRpZ2h0IGxvb3BzIHN1Y2ggYXMgbWVtKi9zdHIqIApzdGlsbCBp
cyBhIHdpbi4KCgpbMV0gCmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWVs
Zi1wc2FiaS1kb2MvYmxvYi9tYXN0ZXIvcmlzY3YtY2MuYWRvYwpbMl0gCmh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi12LXNwZWMvYmxvYi9tYXN0ZXIvY2FsbGluZy1jb252ZW50aW9uLmFk
b2MKWzNdIApodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2FiaS1hYS9ibG9iLzI5ODJh
OWYzYjUxMmE1YmZkYzllM2ZlYTVkM2IyOThmOTE2NWMzNmIvYWFwY3M2NC9hYXBjczY0LnJzdCN0
aGUtYmFzZS1wcm9jZWR1cmUtY2FsbC1zdGFuZGFyZApTZWMgNi4xLjMgIi4uLi4gSW4gb3RoZXIg
Y2FzZXMgaXQgbmVlZCBvbmx5IHByZXNlcnZlIHRoZSBsb3cgNjQgYml0cyBvZiAKejgtejE1IgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
