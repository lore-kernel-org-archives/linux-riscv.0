Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B17CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWdQaBqTf7ZiyEa/ul4yCiXrwmE5vZi4XKsbOJ9cv3w=; b=HoYv+3FEeMaP3e
	TsvJR9NluHDtYLxLWbZXC0SItYhs0huMP6bP8IqskmNdgimF28CKuTBwqAbbimBYe3R/gcalTKSG+
	SQgSnVeRKxBSpOJKvyx/FV7Fh9y/foVt8cHkL/0SV+DR0EBXc8XmT8gNOxlLHFGygB9YPXOUGNODQ
	3rk8NwwRwpIqbj/z3DkjePLCIPFt5pBuhH2ltJHk5U5SWnivBFQOhQATdPqon6YbTDIhi3S1JEszl
	klD1mhpkValwKGXCcDNk4yufLPAgBUJIzwDdocXURK6OFbk7w0MJn7sU3TtPhoYPoh7/RHtvnxqvy
	RyER79DC6KMVGK0Sx1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSA5-00HKa9-39;
	Thu, 19 Oct 2023 12:30:01 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSA2-00HKVb-0w
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 12:30:00 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c52289e900so9406441fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697718594; x=1698323394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPQidXa+OYvo5Cuog4USzNI+/Xa6NAbmqLzTVYeaaGI=;
        b=kQOlCw8Uxil7Ge1u3XHb5//pT0V9CFPiCuC2qojZIVpdTK/4K70fQSDVbf53jZDFy8
         TBfKiFQxWICYMS36RL2Aht1JCqKGdmWBhuyl70RIYdevrKDJb05KrqlQUj8Q5wQRCC4q
         vlc0hFxkxyO0eZTFlKWfFCxpVngHWkCv5qKQFZyQZShB93v5MTu2o6eyWCnnznUhkMUn
         Sy1e8fb6Yn018t2zqtkQgLAAtLPK7O/1aZuioDA1V00aZRqerdTIKQ4vpngBCCEEivY0
         BFrN00DNfbMwDjGXmckq1XqnhZFft6JVQCqIYSGUTmh0YY5LPzJDJ/4eC3NOd79/Lj6j
         Jl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697718594; x=1698323394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPQidXa+OYvo5Cuog4USzNI+/Xa6NAbmqLzTVYeaaGI=;
        b=iRQZLCDxIJq6aoHSS/ZOjcTEqDOfK2j0Njq8Z8NeLVRg8piUjWYo+eiWRyjCpSqbKT
         ZFDMDqAYcBCQM1vileONZJxMsyZ4UFFWdiNMBIbeRcwfo6JsEcbkdkXA+tg2JKeIJS0D
         MRaBfWZcanMrtoOV8N/kLWGaduGyK3hdXv7oC6FEnMevYmGelH8fUi85nD5PHL/2JhBx
         /CjBiMdsLwcElOrYSRo0QrZEtyoFVzAHTgessAz68PEjg15Z6UIuA7JKHux1BIRTyTJ2
         AmfaKaWHOz9vClSOz0hq8eTj+cVy6z581Jb0U/Dcp1ZvdAPfeC1TSh6vHcr8zOpCEUQW
         a5jw==
X-Gm-Message-State: AOJu0Yydfo1WRLuyyg677yYIMZlyzqEIM9M04J2WfkACMtsGg9o5MmI2
	WKxR3sKvz1xdIFcGxOK4nFDFlQ==
X-Google-Smtp-Source: AGHT+IHg7eVr9Vk42wp0GedexaXWPTTyyGtHpNE6XUvTGWZvO8GRkwynRbYeb/jJvG9OO4I66LWpjA==
X-Received: by 2002:a2e:870a:0:b0:2c5:6ab:b817 with SMTP id m10-20020a2e870a000000b002c506abb817mr1417727lji.5.1697718593993;
        Thu, 19 Oct 2023 05:29:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id l10-20020a1c790a000000b004063cced50bsm4266895wme.23.2023.10.19.05.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 05:29:53 -0700 (PDT)
Message-ID: <acd4c737-49ee-4038-890b-b2eba29f6460@rivosinc.com>
Date: Thu, 19 Oct 2023 14:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
 <20231019-flatten-showbiz-127b2e917a7a@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231019-flatten-showbiz-127b2e917a7a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_052958_554713_54091F1E 
X-CRM114-Status: GOOD (  26.49  )
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

CgpPbiAxOS8xMC8yMDIzIDEyOjIyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MTksIDIwMjMgYXQgMDk6MjY6MzFBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxOC8xMC8yMDIzIDE5OjM2LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBXZWQs
IE9jdCAxOCwgMjAyMyBhdCAwNjozMzozNFBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+
Pj4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMTA6MjQ6MTVBTSAtMDcwMCwgRXZhbiBHcmVlbiB3
cm90ZToKPj4+Pj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gRmFjdG9yaXpl
IElTQSBleHRlbnNpb24gcmVwb3J0aW5nIGJ5IHVzaW5nIGEgbWFjcm8gcmF0aGVyIHRoYW4KPj4+
Pj4+IGNvcHkvcGFzdGluZyBleHRlbnNpb24gbmFtZXMuIFRoaXMgd2lsbCBhbGxvdyBhZGRpbmcg
bmV3IGV4dGVuc2lvbnMgbW9yZQo+Pj4+Pj4gZWFzaWx5Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4+Pj4+IC0tLQo+
Pj4+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIHwgMzIgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPj4+Pj4+
IGluZGV4IDQ3MzE1OWI1ZjMwMy4uZTIwNzg3NGU2ODZlIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19yaXNjdi5jCj4+Pj4+PiBAQCAtMTQ1LDIwICsxNDUsMjQgQEAgc3RhdGljIHZvaWQgaHdw
cm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPj4+Pj4+ICAgICAgICAg
Zm9yX2VhY2hfY3B1KGNwdSwgY3B1cykgewo+Pj4+Pj4gICAgICAgICAgICAgICAgIHN0cnVjdCBy
aXNjdl9pc2FpbmZvICppc2FpbmZvID0gJmhhcnRfaXNhW2NwdV07Cj4+Pj4+Pgo+Pj4+Pj4gLSAg
ICAgICAgICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5p
c2EsIFpCQSkpCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBS
SVNDVl9IV1BST0JFX0VYVF9aQkE7Cj4+Pj4+PiAtICAgICAgICAgICAgICAgZWxzZQo+Pj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkE7
Cj4+Pj4+PiAtCj4+Pj4+PiAtICAgICAgICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgWkJCKSkKPj4+Pj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHBhaXItPnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pCQjsKPj4+Pj4+IC0gICAgICAg
ICAgICAgICBlbHNlCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJ
U0NWX0hXUFJPQkVfRVhUX1pCQjsKPj4+Pj4+IC0KPj4+Pj4+IC0gICAgICAgICAgICAgICBpZiAo
cmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhaW5mby0+aXNhLCBaQlMpKQo+Pj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9FWFRf
WkJTOwo+Pj4+Pj4gLSAgICAgICAgICAgICAgIGVsc2UKPj4+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJTOwo+Pj4+Pj4gKyNkZWZpbmUg
Q0hFQ0tfSVNBX0VYVChfX2V4dCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+Pj4+PiArICAgICAgICAgICAgICAgZG8geyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShp
c2FpbmZvLT5pc2EsIF9fZXh0KSkgXAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAgICBcCj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAgICAg
ICAgXAo+Pj4+Pj4gKyAgICAgICAgICAgICAgIH0gd2hpbGUgKGZhbHNlKQo+Pj4+Pj4gKwo+Pj4+
Pj4gKyAgICAgICAgICAgICAgIC8qCj4+Pj4+PiArICAgICAgICAgICAgICAgICogT25seSB1c2Ug
Q0hFQ0tfSVNBX0VYVCgpIGZvciBleHRlbnNpb25zIHdoaWNoIGNhbiBiZSBleHBvc2VkCj4+Pj4+
PiArICAgICAgICAgICAgICAgICogdG8gdXNlcnNwYWNlLCByZWdhcmRsZXNzIG9mIHRoZSBrZXJu
ZWwncyBjb25maWd1cmF0aW9uLCBhcyBubwo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAqIG90aGVy
IGNoZWNrcywgYmVzaWRlcyBwcmVzZW5jZSBpbiB0aGUgaGFydF9pc2EgYml0bWFwLCBhcmUKPj4+
Pj4+ICsgICAgICAgICAgICAgICAgKiBtYWRlLgo+Pj4+Pgo+Pj4+PiBUaGlzIGNvbW1lbnQgYWxs
dWRlcyB0byBhIGRhbmdlcm91cyB0cmFwLCBidXQgSSdtIGhhdmluZyB0cm91YmxlCj4+Pj4+IHVu
ZGVyc3RhbmRpbmcgd2hhdCBpdCBpcy4KPj4+Pgo+Pj4+IFlvdSBjYW5ub3QsIGZvciBleGFtcGxl
LCB1c2UgdGhpcyBmb3IgY29tbXVuaWNhdGluZyB0aGUgcHJlc2VuY2Ugb2YgRiBvcgo+Pj4+IEQs
IHNpbmNlIHRoZXkgcmVxdWlyZSBhIGNvbmZpZyBvcHRpb24gdG8gYmUgc2V0IGJlZm9yZSB0aGVp
ciB1c2UgaXMKPj4+PiBzYWZlLgo+Pj4KPj4+IEZ1bm5pbHkgZW5vdWdoLCB0aGlzIGNvbW1lbnQg
aXMgaW1tZWRpYXRlbHkgY29udHJhZGljdGVkIGJ5IHRoZSB2ZWN0b3IKPj4+IHN1YnNldCBleHRl
bnNpb25zLCB3aGVyZSB0aGVzZSBDSEVDS19JU0FfRVhUKCkgbWFjcm9zIGFyZSB1c2VkIHdyYXBw
ZWQKPj4+IGluIGhhc192ZWN0b3IoKS4gVGhlIGNvZGUgbG9va3MgdmFsaWQgdG8gbWUsIHNpbmNl
IGhhc192ZWN0b3IoKSBjb250YWlucwo+Pj4gdGhlIEtjb25maWcgY2hlY2ssIGJ1dCBkb2VzIGZs
eSBpbiB0aGUgZmFjZSBvZiB0aGlzIGNvbW1lbnQuCj4gCj4+IFllcywgdGhlIEtDb25maWcgY2hl
Y2tzIGFyZSBhbHJlYWR5IGRvbmUgYnkgdGhlIGhlYWRlcnMsIGFkZGluZyAjaWZkZWYKPj4gd291
bGQgYmUgcmVkdW5kYW50IGV2ZW4gaWYgbW9yZSBjb2hlcmVudCB3aXRoIHRoZSBjb21tZW50Cj4g
Cj4gSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB3aGF0IHRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMg
bWVhbnMsIG9yIHdoeSB1c2luZwo+IGF2b2lkYWJsZSBpZmRlZmZlcnkgaGVyZSB3b3VsZCBiZSBk
ZXNpcmFibGUuCgpTb3JyeSwgSSB3YXMgbm90IGNsZWFyIGVub3VnaC4gV2hhdCBJIG1lYW50IGlz
IHRoYXQgdGhlIGhhc19mcHUoKSBhbmQKaGFzX3ZlY3RvcigpIGZ1bmN0aW9ucyBhcmUgYWxyZWFk
eSBpZmRlZidkIGluIGhlYWRlcnMgYmFzZWQgb24gdGhlCktDb25maWcgb3B0aW9ucyBmb3IgdGhl
aXIgc3VwcG9ydCAoQ09ORklHX0ZQVS9DT05GSUdfUklTQ1ZfSVNBX1YpIFNvIGluCnRoZSBlbmQs
IHVzaW5nIGlmZGVmIGhlcmUgaW4gaHdwcm9iZV9pc2FfZXh0MCgpIHdvdWxkIGJlIHJlZHVuZGFu
dC4KCj4gCj4+IEJUVywgd291bGRuJ3QKPj4gaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGdldCByaWQg
b3V0IG9mIHRoZSB1bnN1cHBvcnRlZCBleHRlbnNpb25zIGRpcmVjdGx5Cj4+IGF0IElTQSBzdHJp
bmcgcGFyc2luZyA/IGllLCBpZiBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aG91dCBWIHN1cHBvcnQs
Cj4+IHRoZW4gZG8gbm90IHNldCB0aGUgYml0cyBjb3JyZXNwb25kaW5nIHRvIHRoZXNlIGluIHRo
ZSByaXNjdl9pc2FfZXh0W10KPj4gYXJyYXkgPyBCdXQgdGhlIGluaXRpYWwgaW50ZW50IHdhcyBw
cm9iYWJseSB0byBiZSBhYmxlIHRvIHJlcG9ydCB0aGUKPj4gZnVsbCBzdHJpbmcgdGhyb3VnaCBj
cHVpbmZvLgo+IAo+IFllYWgsIGh5c3RlcmljYWwgcmFpc2lucyBJIGd1ZXNzLCBpdCdzIGFsd2F5
cyBiZWVuIHRoYXQgd2F5LiBJIGRvbid0Cj4gdGhpbmsgYW55b25lIG9yaWdpbmFsbHkgdGhvdWdo
dCBhYm91dCBzdWNoIGNvbmZpZ3VyYXRpb25zIGFuZCB0aGF0IGlzCj4gaG93IHRoZSBjcHVpbmZv
IHN0dWZmIGJlaGF2ZXMuIEkgc3Ryb25nbHkgZGlzbGlrZSB0aGUKPiByaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZSgpIGludGVyZmFjZSwgYnV0IG9uZSBvZiBEcmV3J3MgcGF0Y2hlcwo+IGRv
ZXMgYXQgbGVhc3QgaW1wcm92ZSB0aGluZ3MgYSBiaXQuIEtpbmRhIHdhaXRpbmcgZm9yIHNvbWUg
b2YgdGhlCj4gcGF0Y2hlcyBpbiBmbGlnaHQgdG8gc2V0dGxlIGRvd24gYmVmb3JlIGRlY2lkaW5n
IGlmIEkgd2FudCB0byByZWZhY3Rvcgo+IHN0dWZmIHRvIGJlIGxlc3Mgb2YgYSBwb3RlbnRpYWwg
Zm9yIHNob290aW5nIG9uZXNlbGYgaW4gdGhlIGZvb3QuCgpNYWtlIHNlbnNlLgoKQ2zDqW1lbnQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
