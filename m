Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D38FCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g52cGD2mN2yTe4XW1DEaDwqeF0dKBeyYm3bzqBdZfA=; b=aRnnJ2MNC/pyVb
	bn/oBYmbwH4M8ABqh9jKSPL3VLJGo8ajhjUQiEpZutmWTN7L9NtvRJ7/6jfU5qM7berfUsMOPrJGS
	ggq7dqsQ4brPogeDT/NLe0Oo2HaBhwuOfi41ugM8lSqum2Xfxn6o28osznotW0CQ3c2tkBW4yfLkC
	HQFuaLAotuSpClFmyZ/2DNEo/BeQIHTehw8osz1XfOaXWJBdg+1EJmNHHwJ3JLJOiSdu0uo/pLzrH
	yWMu0QRbcvz1L2OsJFkpQYCiCyTXH6MPZW5RPwhyIMiVNkRN3uiweomJGaYcUD7Pk6h1On3DysL7G
	YXytT1M6wOuDkIxquTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqv2L-000zuX-1x;
	Thu, 12 Oct 2023 12:43:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqv2J-000zsL-15
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 12:43:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3232e96deaaso195347f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697114601; x=1697719401; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PTo8D4RniwPWfnLSwST03jUfEH27ZqxImSpo2iKD0U=;
        b=tDeyRkvexEX5VYOtSaBnxiSDnNUvuv/JBD8XGvpMbuY5CkXDp2bYXZeZzqutfYK/oy
         E4B6CGd32bLf1gGwkELdJsRZnJ8Lx4Tj9QP2RgIQQJ/rbc+r41TPgSnWI+N4wpZdgkUq
         oO+/wb6458AzGLQCI1C599Ld4quetUtGgGP6WfUrgMdV2HJgBk79Mq9oaK/wTtvmrESQ
         NaG4GMR+AEi2pTpT82dd5WWKzL1xoTQ2y3qwJsHmSChbbraZOUIQ8939vdTGTRGdP3n6
         BfFvlzI4pwlzCMwlUo3Uvu/rWrpIBea/F7cSsO+kxnzsxKkbPmOWXDbRGrxBQpkJtqLR
         QUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114601; x=1697719401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PTo8D4RniwPWfnLSwST03jUfEH27ZqxImSpo2iKD0U=;
        b=bAUgy4ofS6/lHtcCF+Y8n04mxhkM11J5PFkK/2KHnTm0Y5i1yNe1a0K9XmsQODTfN4
         y8fliOqTnnrKipBKnRMgnFvnse00Z/J4qsLZMsx9aYEZfFm3sMSxFtr48RzerZFtFVf9
         0axu1kyT1gOqa4iLw+03tAXKlrHL7HhflP1s2QrGcbwW6PS9TpNvwZewfJu5AvHJYxHP
         4kC/4HwM28yDxGVfeaW+2pHEZpgWi0m4xDj2uF0+lXN1kJwREldM5aBAd4tq9f1fT9i8
         pbZsCMNCw2yibrxEe0XKGbKfmYzsbPMjNsWgDLMcgTg5wc55xTYGV9xzMU5uP2OWeaBe
         FphA==
X-Gm-Message-State: AOJu0Yzyov4IlXi9iDxnpiwOYFL2qTtXvEz7/QBTlL7s2nAjvBxu3gSO
	QHu2BSwQjwwh8/1iT7kUrWvuGlhbrqIcY4mlXJQkig==
X-Google-Smtp-Source: AGHT+IH68Cupe5msSVy6FrdJwuGjM46iOIqt4/Ht702cWr2lracdmexvQeKL+NR6J36QnG7vRCBFKg==
X-Received: by 2002:adf:cf0a:0:b0:31a:e54e:c790 with SMTP id o10-20020adfcf0a000000b0031ae54ec790mr20264351wrj.6.1697114600879;
        Thu, 12 Oct 2023 05:43:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm18116898wrp.116.2023.10.12.05.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:43:20 -0700 (PDT)
Message-ID: <41b3c8c8-260d-4de1-92a4-245973274a60@rivosinc.com>
Date: Thu, 12 Oct 2023 14:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20231001103433.3187-1-jszhang@kernel.org>
 <20231001103433.3187-2-jszhang@kernel.org>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231001103433.3187-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_054331_399333_C7A62ED8 
X-CRM114-Status: GOOD (  18.85  )
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

CgpPbiAwMS8xMC8yMDIzIDEyOjM0LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IFByZXZpb3VzbHks
IHdlIHVzZSBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gdG8gZHluYW1pY2FsbHkgcGF0Y2gKPiB0aGUg
Q01PIG9wZXJhdGlvbnMgZm9yIFRIRUFEIEM5MDYvQzkxMCBkdXJpbmcgYm9vdCBmb3IgcGVyZm9y
bWFuY2UKPiByZWFzb24uIEJ1dCBhcyBwb2ludGVkIG91dCBieSBBcm5kLCAidGhlcmUgaXMgYWxy
ZWFkeSBhIHNpZ25pZmljYW50Cj4gY29zdCBpbiBhY2Nlc3NpbmcgdGhlIGludmFsaWRhdGVkIGNh
Y2hlIGxpbmVzIGFmdGVyd2FyZHMsIHdoaWNoIGlzCj4gbGlrZWx5IGdvaW5nIHRvIGJlIG11Y2gg
aGlnaGVyIHRoYW4gdGhlIGNvc3Qgb2YgYW4gaW5kaXJlY3QgYnJhbmNoIi4KPiBBbmQgaW5kZWVk
LCB0aGVyZSdzIG5vIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2Ugd2l0aCBHTUFDIGFuZCBFTU1DIHBl
cgo+IG15IHRlc3Qgb24gU2lwZWVkIExpY2hlZSBQaSA0QSBib2FyZC4KPiAKPiBVc2UgcmlzY3Zf
bm9uc3RkX2NhY2hlX29wcyBmb3IgVEhFQUQgQzkwNi9DOTEwIENNTyB0byBzaW1wbGlmeQo+IHRo
ZSBhbHRlcm5hdGl2ZSBjb2RlLCBhbmQgdG8gYWNjaGlldmUgQXJuZCdzIGdvYWwgLS0gIkkgdGhp
bmsKPiBtb3ZpbmcgdGhlIFRIRUFEIG9wcyBhdCB0aGUgc2FtZSBsZXZlbCBhcyBhbGwgbm9uc3Rh
bmRhcmQgb3BlcmF0aW9ucwo+IG1ha2VzIHNlbnNlLCBidXQgSSdkIHN0aWxsIGxlYXZlIENNTyBh
cyBhbiBleHBsaWNpdCBmYXN0IHBhdGggdGhhdAo+IGF2b2lkcyB0aGUgaW5kaXJlY3QgYnJhbmNo
LiBUaGlzIHNlZW1zIGxpa2UgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGJvdGgKPiBmb3IgcmVhZGFi
aWxpdHkgYW5kIGZvciBwbGF0Zm9ybXMgb24gd2hpY2ggdGhlIGluZGlyZWN0IGJyYW5jaCBoYXMg
YQo+IG5vdGljZWFibGUgb3ZlcmhlYWQuIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhh
bmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiBUZXN0ZWQtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5n
IDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L0tjb25maWcuZXJyYXRhICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvZXJyYXRhL3Ro
ZWFkL2VycmF0YS5jICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgNTAgKysrLS0tLS0tLS0tLS0tLS0t
LQo+ICAzIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhIGIvYXJjaC9yaXNjdi9L
Y29uZmlnLmVycmF0YQo+IGluZGV4IDU2NmJjZWZlYWI1MC4uZDc5NzI5MTRmOWRlIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcuZXJyYXRhCj4gQEAgLTc4LDYgKzc4LDcgQEAgY29uZmlnIEVSUkFUQV9USEVBRF9DTU8KPiAg
CWJvb2wgIkFwcGx5IFQtSGVhZCBjYWNoZSBtYW5hZ2VtZW50IGVycmF0YSIKPiAgCWRlcGVuZHMg
b24gRVJSQVRBX1RIRUFEICYmIE1NVQo+ICAJc2VsZWN0IFJJU0NWX0RNQV9OT05DT0hFUkVOVAo+
ICsJc2VsZWN0IFJJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUwo+ICAJZGVmYXVsdCB5Cj4gIAlo
ZWxwCj4gIAkgIFRoaXMgd2lsbCBhcHBseSB0aGUgY2FjaGUgbWFuYWdlbWVudCBlcnJhdGEgdG8g
aGFuZGxlIHRoZQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEu
YyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gaW5kZXggMDU1NGVkNGJmMDg3
Li4zZmVmZWIxYjQ1NmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+IEBAIC0xMiw4
ICsxMiwxMCBAQAo+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gICNpbmNsdWRlIDxh
c20vY2FjaGVmbHVzaC5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPiArI2luY2x1
ZGUgPGFzbS9kbWEtbm9uY29oZXJlbnQuaD4KPiAgI2luY2x1ZGUgPGFzbS9lcnJhdGFfbGlzdC5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiArI2luY2x1ZGUgPGFzbS9pby5oPgo+ICAj
aW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4gICNpbmNsdWRlIDxhc20vdmVuZG9yaWRfbGlzdC5oPgo+
ICAKPiBAQCAtMzMsNiArMzUsNzUgQEAgc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX3BibXQodW5z
aWduZWQgaW50IHN0YWdlLAo+ICAJcmV0dXJuIGZhbHNlOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBk
Y2FjaGUuaXBhIHJzMSAoaW52YWxpZGF0ZSwgcGh5c2ljYWwgYWRkcmVzcykKPiArICogfCAzMSAt
IDI1IHwgMjQgLSAyMCB8IDE5IC0gMTUgfCAxNCAtIDEyIHwgMTEgLSA3IHwgNiAtIDAgfAo+ICsg
KiAgIDAwMDAwMDEgICAgMDEwMTAgICAgICByczEgICAgICAgMDAwICAgICAgMDAwMDAgIDAwMDEw
MTEKPiArICogZGFjaGUuaXZhIHJzMSAoaW52YWxpZGEsIHZpcnR1YWwgYWRkcmVzcykKClNtYWxs
IHR5cG8gaGVyZTogaW52YWxpZGF0ZSBpbnN0ZWFkIG9mIGludmFsaWRhCgpUaGFua3MsCgpDbMOp
bWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
