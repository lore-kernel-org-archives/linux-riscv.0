Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C1CCD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nwpa4tOzfcVM9/a48bNlxL5TS1X4vgy+M2gB0R24zxw=; b=eu4wzYG9JAeKQ6
	pzBCNMyCLH8VCrTMvmHtR/TL/RSPXirJyzAQav9dUw6IBDHPppqijfhKCcC1byf5c96gqCHLinU67
	BvPrIRCZeUtu7Gry8DSp/CNDX8gV3JVcp2klRgc8Rrr9jR0DrFUCFk3MvPjXQSoj9jCGvEslR6cX/
	IuVpnpkahPANCCP3064rxnnt7mtqgb/h0NCQZnEF3ezt/0DqqIuBWPJS2bnWZZwGixGlyCr5o2xXY
	cS4k7SbX6FrATZxXNZthiGu7MeSScwgQ/s38++CSCAl6JRH0iD9ekVHiYtG+kzcZzzugCcn6JXVPM
	3L6pjR0jPPN4pH2/KG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoo6-0000000Ap8t-3why;
	Thu, 11 Apr 2024 07:25:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoo3-0000000Ap7L-1VRp
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:25:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-343cb97e7f5so1440007f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712820308; x=1713425108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrjK0EsdKVt9QT2OnXkSvn4/gsAT0jsR16VIcuO+mkY=;
        b=ut7qD29AArBdG2XIR4KFAHxE4hR+GbUak8Ko76PsE1XwFqlKmtAqNIgUlwi6vzFAiq
         bTpCJGqm8j8CqfhLg5I6hHALG4v/oQQt95yArVG84yXT45gzHMvVq/uVDuEUoKEXjOjw
         3Q2HQRyiLvlG/hopIXIWidntu+UfgPMS/eu8P71+vCfIlxFNogZnjW/CnUZSozgKAsKK
         weJD1NWnNa1weCKvhL0xe5MzO3b2HXcnMArOEyNJry+dm/DtDNFFlBWemD2Vv4JUT4bG
         D9g2tOg3QmMdnIM+zbR2qgbZc1smFuHG2aGXIOydnVfIndBcOBH5JI9BrgRJMBS2yqUR
         7vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712820308; x=1713425108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrjK0EsdKVt9QT2OnXkSvn4/gsAT0jsR16VIcuO+mkY=;
        b=Bi5h3XgctoEuUxhlchoVNP/vnTZiskjtyUYxuzeGIJjuuaD0gUv5CkWiwLQQDcoiUk
         keSmQ49KMkMcIc6j54cqIjnWlX5KrCPFO4aG1F7wgT5oAmRyWUyNr/h+zYxjtBGlH72s
         pt7L0bVxjgO/3a0EEKWaXNXeItqNkH9K8m+7A7C6Lg1PTonQIkUXqodOVJ0oVh+IC1xG
         1WWm5HBzqaRs8ciYwKiBDclPNy/5vX0IyTjit9Ohi2YOwNi/rmFDzlRq8yI2KLuqtsBo
         wxv6jpsARNyHO8GCH/CyPdbQ8jGOhbYhsOz1GaszoTckEMXIIECeV2iiwCaF7BtasiOc
         uAJw==
X-Forwarded-Encrypted: i=1; AJvYcCWr9C4LyMNKmm07PJXSuM0PNLAyJAkXvW+e17VibavcYp8zu8JrdI/i5CK/snhvwf7GFRQDUZhp2zprkLnIoLWVlr7CtAcUoWZy22WiIsss
X-Gm-Message-State: AOJu0Yws2PRiH9QJ5Ts7HjmpLZX5wZofU6ZzlyNRtNmB0NnNXOWmWYXo
	OuDbZU9T9rEtHID0JvUbRNJaOYUcn6nNTDAwOV6CSAmLIWMDYMiWmptHLEcySUE=
X-Google-Smtp-Source: AGHT+IH7bDLPf+9sHTexaPC0l7JskFDeRSsnaH3OC8OfIIJJ6Vv6zjsrHnmGf08EGNEGbKXzsGI5Kw==
X-Received: by 2002:a5d:4150:0:b0:346:4945:8851 with SMTP id c16-20020a5d4150000000b0034649458851mr3608971wrq.0.1712820307707;
        Thu, 11 Apr 2024 00:25:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3624:d9b3:4998:d76b? ([2a01:e0a:999:a3a0:3624:d9b3:4998:d76b])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00341b7d5054bsm1083326wrf.72.2024.04.11.00.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 00:25:07 -0700 (PDT)
Message-ID: <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
Date: Thu, 11 Apr 2024 09:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_002511_551851_C24F18B1 
X-CRM114-Status: GOOD (  20.71  )
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

CgpPbiAxMS8wNC8yMDI0IDAwOjMyLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gV2VkLCBBcHIg
MTAsIDIwMjQgYXQgMTE6Mjc6MTZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiBX
ZWQsIEFwciAxMCwgMjAyNCBhdCAxMToxNjoxMVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6
Cj4+PiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwMjozMjo0MVBNIC0wNzAwLCBEZWVwYWsgR3Vw
dGEgd3JvdGU6Cj4+PiA+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDExOjExOjAwQU0gKzAyMDAs
IENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+ID4gPiBBZGQgcGFyc2luZyBmb3IgWmNtb3AgSVNB
IGV4dGVuc2lvbiB3aGljaCB3YXMgcmF0aWZpZWQgaW4gY29tbWl0Cj4+PiA+ID4gYjg1NGE3MDlj
MDAgKCJaY21vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KPj4+
ID4gPgo+Pj4gPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KPj4+ID4gPiAtLS0KPj4+ID4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggfCAxICsKPj4+ID4gPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKPj4+
ID4gPiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4gPiA+Cj4+PiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+Pj4gYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+ID4gPiBpbmRleCBiNzU1MWJhZDM0MWIuLmNmZjc2NjBk
ZTI2OCAxMDA2NDQKPj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
Pj4+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+ID4gPiBAQCAt
ODYsNiArODYsNyBAQAo+Pj4gPiA+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0LCoMKgwqDCoMKg
wqDCoCA3Nwo+Pj4gPiA+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0TCoMKgwqDCoMKgwqDCoCA3
OAo+Pj4gPiA+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0bCoMKgwqDCoMKgwqDCoCA3OQo+Pj4g
PiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNNT1DCoMKgwqDCoMKgwqDCoCA4MAo+Pj4gPiA+
Cj4+PiA+ID4gI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGR8KgwqDCoCAxMjcKPj4+
ID4gPgo+Pj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
Pj4+IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+PiA+ID4gaW5kZXggMDlkZWUw
NzEyNzRkLi5mMTQ1MGNkNzIzMWUgMTAwNjQ0Cj4+PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCj4+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4+PiA+ID4gQEAgLTI2NSw2ICsyNjUsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhCj4+PiByaXNjdl9pc2FfZXh0W10gPSB7Cj4+PiA+ID7CoMKgwqDCoCBfX1JJU0NWX0lT
QV9FWFRfREFUQSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNCKSwKPj4+ID4gPsKgwqDCoMKgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHpjZCwgUklTQ1ZfSVNBX0VYVF9aQ0QpLAo+Pj4gPiA+wqDCoMKgwqAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoemNmLCBSSVNDVl9JU0FfRVhUX1pDRiksCj4+PiA+ID4gK8Kg
wqDCoCBfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y21vcCwgUklTQ1ZfSVNBX0VYVF9aQ01PUCksCj4+
PiA+Cj4+PiA+IEFzIHBlciBzcGVjIHpjbW9wIGlzIGRlcGVuZGVudCBvbiB6Y2EuIFNvIHBlcmhh
cHMgYmVsb3cgPwo+Pj4gPgo+Pj4gPiBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoemljYm96LCBS
SVNDVl9JU0FfRVhUX1pDTU9QLAo+Pj4gUklTQ1ZfSVNBX0VYVF9aQ0EpCj4+Pgo+Pj4gV2hhdCdz
IHppY2JveiBnb3QgdG8gZG8gd2l0aCBpdCwgY29weS1wYXN0byBJIGd1ZXNzPwo+IAo+IFllcywg
Y29weS1wYXN0YSA6LSkKPiAKPj4+IElmIHdlJ3JlIGdvbm5hIGltcGx5IHN0dWZmIGxpa2UgdGhp
cyB0aG91Z2ggSSB0aGluayB3ZSBuZWVkIHNvbWUKPj4+IGNvbW1lbnRzIGV4cGxhaW5pbmcgd2h5
IGl0J3Mgb2theS4KPj4KPj4gQWxzbywgSSdtIGluY2xpbmVkIHRvIGNhbGwgdGhhdCBvdXQgc3Bl
Y2lmaWNhbGx5IGluIHRoZSBiaW5kaW5nLCBJJ3ZlCj4+IG5vdCB5ZXQgY2hlY2tlZCBpZiBkZXBl
bmRlbmNpZXMgYWN0dWFsbHkgd29yayBmb3IgZWxlbWVudHMgb2YgYSBzdHJpbmcKPj4gYXJyYXkg
bGlrZSB0aGUgZG8gZm9yIGluZGl2aWR1YWwgcHJvcGVydGllcy4gSSdsbCB0b2RvIGxpc3QgdGhh
dC4uCj4gCj4gRWFybGllciBleGFtcGxlcyBvZiBzcGVjaWZ5aW5nIGRlcGVuZGVuY3kgb24gZW52
Y2ZnIGFjdHVhbGx5IGhhZCBmdW5jdGlvbmFsCj4gdXNlIGNhc2UuCj4gU28geW91IGFyZSByaWdo
dCwgSSBhbSBub3Qgc3VyZSBpZiBpdHMgYWN0dWFsbHkgbmVlZGVkIGluIHRoaXMKPiBwYXJ0aWN1
bGFyIGNhc2UuCgpJIGFjdHVhbGx5IHNhdyB0aGF0IGFuZCB0aGluayBhYm91dCBhZGRyZXNzaW5n
IGl0IGJ1dCBBRkFJQ1QsIHRoaXMKc2hvdWxkIGJlIGhhbmRsZWQgYnkgdGhlIG1hY2hpbmUgZmly
bXdhcmUgcGFzc2luZyB0aGUgaXNhIHN0cmluZyB0byB0aGUKa2VybmVsIChpZSwgaXQgc2hvdWxk
IGJlIHZhbGlkKS4gSW4gdGhlIGNhc2Ugb2YgUUVNVSwgaXQgdGFrZXMgY2FyZSBvZgpzZXR0aW5n
IHRoZSBleHRlbnNpb24gdGhhdCBhcmUgcmVxdWlyZWQgYnkgdGhpcyBleHRlbnNpb24gaXRzZWxm
LgoKSWYgd2UgY29uc2lkZXIgdG8gaGF2ZSBwb3RlbnRpYWxseSBicm9rZW4gaXNhIHN0cmluZyAo
aWUgZXh0ZW5zaW9ucwpkZXBlbmRlbmNpZXMgbm90IGNvcnJlY3RseSBoYW5kbGVkKSwgdGhlbiB3
ZSdsbCBuZWVkIHNvbWUgd2F5IHRvCnZhbGlkYXRlIHRoaXMgd2l0aGluIHRoZSBrZXJuZWwuCgpD
bMOpbWVudAoKPiAKPiBBbmQgeWVzIGRlZmluaXRsZXksIGRlcGVuZGVuY3kgc2hvdWxkIGJlIG1l
bnRpb25lZCBpbiBiaW5kaW5nLgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
