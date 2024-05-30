Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D52C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6CtewSqGTaAd/lti9p2PtYrUgPLQuiVN2sCXsqJI9g=; b=Vf7JnvB8y/EHfM
	Panupe4H+LGZv0eURdgKrCxXVhNRjUJEFWY5xbXSdtdOJdueGh2O/N5knPh6WixLOQe45/Ot8KDWg
	9zszHy3gTsRB76Yj7pVRG/6i3uhtvA59Hxzj9JrZX9VPn0hiQ3lfAlAxe14GTedl8H8vgiQzUDYGj
	aYf2gq1VODvTkoDmqVO/s7bkKYVBR8ilzU1rd88miv9nlDl84QgXEt7iIPjYCWYRPgGtXOgzfT1j3
	9pJ1Es/16TfMic/KdOmjUQaPq4/HU8pC1mLO5hHsAv/faSLQGohT1pv3GlThVJjG0rBVIOWfIIP4V
	bx1F141ovNoRA1n6omtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgvO-00000007ZY4-3ZpE;
	Thu, 30 May 2024 14:38:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgvM-00000007ZVm-0zpG
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:38:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-421140314e1so1199975e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717079913; x=1717684713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCqk0Wbl0C/qkffAR5D1GSnGrOBHuEfWLT6qcnFKC74=;
        b=lRkQuBLj7LihsiZeuLxeZqGt743g17Fge/QY7uaq7n2k8GePOOdaj1PXlxubaPBdRh
         JgmEFQxtdOY7OEIboaYlU/HHh2vQYSnTNpClB7y0U2LtmgH5Heq+PDwPNq84CZnrxJPp
         rjHzoC3yxIYKSdoE8fVUBl/TdtAGAUlEZCd07igVDdTiJ6DHdc78IzdQWVHeyWCtTMLJ
         hkUyqv8vZ6CcdvWnZqeAOcSS9J0yyiiJyPVVQZeT+Qe2Ofniez95yMjbOjsPrbQvNuFC
         z5om1LbjJm8J8nzh9y7xw/LfbfUtoLYXnc28lVsgPKdEzt0mtALpQ5GipQEwW1Pp6vAs
         hMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079913; x=1717684713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCqk0Wbl0C/qkffAR5D1GSnGrOBHuEfWLT6qcnFKC74=;
        b=KR9BQZ9OdbGGrZA4ZsHU0R5g+Muul90vl94BfgtG1tt9LUY/8enUKWHsXb7iKZk5dO
         vfe3ccCU7oLsO1aokvu6RQkvKoQ4YKXY0Cdq2koPMAzbAIL4wFZY1LcHmHU+LXVSQxkF
         wW3sbwQvPZZ5z5oDytJM28w5g2M1KYbofWEVxsRslFjC6jKTqxq0AallpBvXJ8nEJ1l1
         rWtYthJ8YSxL9qZeQ38JIKu2pGnsYh5U4IeSzPaJCdC+4F+X7iopz3mX9NgbZBfVJvOJ
         UAw19WsOwOvYWXt2NRc6rwOgGA4a3Nr8QT/W5J4/gfu3Gw9Nz/A1CmWRnJ5e6581MOXn
         5ldw==
X-Forwarded-Encrypted: i=1; AJvYcCXFegqkd/If8hFWqjMCk2T5dDUTKDczVTy2kw50NwXMqXZXswBY8g+DdW7c9GA/qH7bx0st+NK3CsOFfzMiiQlLdJfStTUki1ei5QNLFR6b
X-Gm-Message-State: AOJu0YwS+GJ8Dpyr0RP+u2CNptvHHXSIZVyRGqRMwaHVp+ByTt/NcMTO
	KIshkDqpsnTFT0S7PsyL/zAUQ+FOfDNYmBudAWV34MU0tzY2i/Kr1LTpc6NuGzg=
X-Google-Smtp-Source: AGHT+IFlbatkP5YNI0+cCdIM7/+OIHMvdLvagld1bA6xjJeK+Uh1NabWQhxIBQr5mw7eUxpTgrJABw==
X-Received: by 2002:a05:600c:3b99:b0:418:1303:c3d1 with SMTP id 5b1f17b1804b1-4212793612bmr20925615e9.3.1717079913490;
        Thu, 30 May 2024 07:38:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:1c45:973a:b74b:ef3c? ([2a01:e0a:999:a3a0:1c45:973a:b74b:ef3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706ea02sm27143985e9.30.2024.05.30.07.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:38:33 -0700 (PDT)
Message-ID: <920cc061-f5bf-4eae-88b9-7b7c2b32ed53@rivosinc.com>
Date: Thu, 30 May 2024 16:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com> <ZlenZ+NvXxOxvqEO@ghost>
 <ZleqVUhDW+xgiTwu@ghost> <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>
 <ZliPL4yXBAir5pr2@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZliPL4yXBAir5pr2@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_073836_287884_4D53EE2E 
X-CRM114-Status: GOOD (  18.12  )
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

CgpPbiAzMC8wNS8yMDI0IDE2OjM3LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gVGh1LCBN
YXkgMzAsIDIwMjQgYXQgMTA6MTI6MzlBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pgo+Pgo+PiBPbiAzMC8wNS8yMDI0IDAwOjIxLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBP
biBXZWQsIE1heSAyOSwgMjAyNCBhdCAwMzowODozOVBNIC0wNzAwLCBDaGFybGllIEplbmtpbnMg
d3JvdGU6Cj4+Pj4gT24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDQ6NTI6NDJQTSArMDIwMCwgQ2zD
qW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4+PiBBZGQgcGFyc2luZyBmb3IgWmltb3AgSVNBIGV4dGVu
c2lvbiB3aGljaCB3YXMgcmF0aWZpZWQgaW4gY29tbWl0Cj4+Pj4+IDU4MjIwNjE0YTVmIG9mIHRo
ZSByaXNjdi1pc2EtbWFudWFsLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oIHwgMSArCj4+Pj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgfCAxICsKPj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4gaW5kZXggMWYyZDI1OTljNjU1Li5iMTg5
NmRhZGU3NGMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aAo+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4gQEAgLTgw
LDYgKzgwLDcgQEAKPj4+Pj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEJCTcxCj4+Pj4+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKPj4+Pj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aQUNBUwkJNzMKPj4+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSU1PUAkJNzQKPj4+Pgo+
Pj4+IFNpbmNlIG15IGNoYW5nZXMgZm9yIHJlbW92aW5nIHhhbmRlc3BtdSBoYXZlbid0IGxhbmRl
ZCBoZXJlIHlldCBJIHRoaW5rCj4+Pj4geW91IHNob3VsZCBrZWVwIFJJU0NWX0lTQV9FWFRfWEFO
REVTUE1VIGluIHRoZSBkaWZmIGhlcmUgYW5kIG1ha2UKPj4+PiBSSVNDVl9JU0FfRVhUX1pJTU9Q
IGhhdmUgYSBrZXkgb2YgNzUuIFBhbG1lciBjYW4gcHJvYmFibHkgcmVzb2x2ZSB0aGUKPj4+PiBj
b25mbGljdGluZyBrZXlzIHdoZW4gdGhlc2UgdHdvIHNlcmllcyBhcmUgbWVyZ2VkLgo+Pj4+Cj4+
Pj4gLSBDaGFybGllCj4+Pgo+Pj4gSSBtaXNzZWQgdGhhdCBvdGhlciBwYXRjaGVzIGluIHRoaXMg
c2VyaWVzIHdlcmUgYmFzZWQgb2ZmIG15Cj4+PiB4dGhlYWR2ZWN0b3IgY2hhbmdlcy4gSXQncyBu
b3QgaW4gdGhlIGNvdmVyIGxldHRlciB0aGF0IHRoZXJlIGlzIGEKPj4+IGRlcGVuZGVuY3kgdGhv
dWdoLiBXaGF0IGRvIHlvdSBuZWVkIGZyb20gdGhhdCBzZXJpZXMgZm9yIHRoaXMgc2VyaWVzIHRv
Cj4+PiB3b3JrPwo+Pgo+PiBIZXkgQ2hhcmxpZSwgSSdtIG5vdCBiYXNlZCBkaXJlY3RseSBvbiBh
bnkgb2YgeW91ciBzZXJpZXMsIGJ1dCBvbgo+PiByaXNjdi9mb3ItbmV4dCB3aGljaCBwcm9iYWJs
eSBhbHJlYWR5IGNvbnRhaW5zIHlvdXIgcGF0Y2hlcy4KPj4KPj4gQ2zDqW1lbnQKPiAKPiBUaGVy
ZSB3YXMgc29tZSBjaHVybiBoZXJlIHNvIEkgZGlkbid0IGV4cGVjdCB0aG9zZSB0byBiZSBtZXJn
ZWQsIGl0Cj4gbG9va3MgbGlrZSBhIHN1YnNldCBvZiB0aGUgcGF0Y2hlcyB3ZXJlIGFkZGVkIHRv
IHJpc2N2L2Zvci1uZXh0LCBzb3JyeQo+IGZvciB0aGUgY29uZnVzaW9uIQoKTm8gd29ycmllcywg
aXQgc2VlbXMgc3RyYW5nZSBpbmRlZWQgdGhhdCBzb21lIG9mIHRoZW0gd2VyZSBtZXJnZWQgYnV0
Cm5vdCB0aGUgb3RoZXIgOi8KCj4gCj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hh
cmxpZUByaXZvc2luYy5jb20+CgpUaGFua3MgIQoKPiAKPj4KPj4+Cj4+PiAtIENoYXJsaWUKPj4+
Cj4+Pj4KPj4+Pj4gIAo+Pj4+PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkx
MjcKPj4+Pj4gIAo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+Pj4+IGluZGV4IDI5OTMzMThi
OGVhMi4uNDFmOGFlMjJlN2EwIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKPj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+
Pj4+IEBAIC0yNDEsNiArMjQxLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBy
aXNjdl9pc2FfZXh0W10gPSB7Cj4+Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50bnRs
LCBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTCksCj4+Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAo+Pj4+PiAgCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHppaHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKPj4+Pj4gKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6aW1vcCwgUklTQ1ZfSVNBX0VYVF9aSU1PUCksCj4+Pj4+ICAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9FWFRfWkFDQVMpLAo+Pj4+PiAgCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAo+Pj4+PiAgCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAo+Pj4+PiAtLSAKPj4+Pj4gMi40
My4wCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+Pj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
