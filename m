Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491ECCCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+neD/luY+Cp+vtUJlSn7BLZHQNcOvoO0GgFMFATnsU=; b=4/V0uZPqrGkH8M
	07TYDutgm6M8DoqmAjBUUA0UuNhfBnxVKUOGlHNaDClWIwP6IVKKBVj4nSgybs6MuNUEaWpo7wzAS
	rArWtxJmS6HvrlGEaEHAeFpsGLZVJSXcQKKtZhmAORWaX14cSzPtqaAdxo6moTEzBFlBV7H9yfkvJ
	xLOO64WQIHTdbOs0ZNLtx7dvD28IeX+IsxiUbn0Ig0ib8AVFsEOJ3AyCmBJVhES4y5ogAXvoqTusO
	x/tRmrRSVgT0q6J5w4n49RPnPl+VrKEwbCzTrRhM5yf7d260QK1M8LsetHfPX01GIuPPOvvIW2x3J
	aFfpbA0/fHsNsnleuZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8js-00000008Ad1-1tMn;
	Fri, 24 Oct 2025 03:45:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8jp-00000008Acd-1R3N
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:45:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso1274405a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761277512; x=1761882312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HiRwwiYIxph3y0nSVQ/xh58uObGDxvKUt3Iz5/AtRps=;
        b=A1j7ZdIoSO7ehyLuKw/ygyUtMWw7KMN1pIsFYJkxbQlqzNNEPJmxcRwsZOD6gNGnjP
         ouPqIMLZkqnnMEtIfDJiMk3r34xnT4Jd8zKwJMy29KGVDgdFo8xcY9eW9cPFoGtg9mt/
         jTAhAbq2DiWEjqnVNC9vBhkCJqlg3bu6OqoXaQWKSbJfuK/uxyovB+bhfjtsQDzqItlr
         tqio09C4IHXUKGPYIA1S9Xoszflq8Mp7cxgAShYDFs0e5w94+bSRX5Bi0rq3qTzAWgDe
         gMu6oUitn+9h/EfWr9boIB6NTPyC3Zerq7Wno3vyVpgmJZKxArBew3C37PgmUjWQpIx+
         wxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761277512; x=1761882312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiRwwiYIxph3y0nSVQ/xh58uObGDxvKUt3Iz5/AtRps=;
        b=vQUnhhRapuADsuo1XB6gu7mJfbU88uHgkkHxma0P5anJu01RWYAUXsQGsfBZao5M9j
         B7GA18XBnGDZz5WGhSFWBkK/Z90Qhf46mOUAn7kOIZNrl7l0hQMe3c8YHTWWTeHSHm1v
         6tvh+RcXufUaGDijG4NlL5hr/CqEOck05dYbW2BRdVyIP6ZEBXsU6/y6aAnQTt0Db9h9
         cXDo27z7xW39mb2zqxPXIAudz8r3dg/C/CYd7c/DX6UhD7HGrjolv0d3gLkwxnc/ywxJ
         2ycnHHaxpTP3vL949ENo3Rs2VwQWSn7Q5vYyYk+2RLKFbywK74Q47xNWAZjRdP+g6B+V
         U4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVUingp9rHFFC7ujb/CwOAX7962TaePfuIWebpBoxiwczyWLIVInDznCh66v19qpkcwtxyGK4OKKO7F4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDgddovyaYFc3KivYkQ40oRpWT2qhkK9r3m9GmnA2of+NCwUS
	7VTM+w9eJVosA0lSvTW0Bocpc9pCD9SJgEX/HgRy/zcDgfyOMmeYOWf2
X-Gm-Gg: ASbGncszND7JQkqIqorvCrOj+d9meFhcmcgXCiVAsmWkByOcsLFts03Mqf/K/DlW73i
	Tyi1NgV3HgrvoUpIyOldxgabThcURV/ZkPZMPd8H4yyLIkMA01BrBSl7zBPq9IzGdet0G0+8meb
	HIcB7N4cSJY6HNVPr+5gQO7zVNMUYohNnLyYH439H6kuB0HoTLzg6ep1VYaN792Lrq5zmMydXXP
	uN7g2pCZwRCoXeFR6G+tSS8z25iCEYtZ9AbwGWerzW88S5mB7iGfpeAai6a1agbJ21kRPWFaZIy
	9RrT62pg9OsflHGl2IxKX20cwtISRZZ72StUIujWAinvAbj65U2OhadOxhH66VIAezKQjnO80bx
	Ce6N8uRlEPl5tWbUtz5+0YNXYBJQGSrMUYMsF2Le/3vQWbhyurit7L174tgkE1BVudGuTJdqoXj
	6wQHnTNHSNw7r5yT+ku9zlt7eNkhQY9+t2zKVFUE6vCHBi8TJkMk9jnLqTUqY=
X-Google-Smtp-Source: AGHT+IHgxSHpOe7uFxBKNhzcrTuSEIHcTnYzhOUyJ6pcWKCFvMZJgvU04s6f6H/EDLJjMSUEjPtNeQ==
X-Received: by 2002:a17:90b:5688:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33fd65fe286mr1049116a91.14.1761277512531;
        Thu, 23 Oct 2025 20:45:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0172476sm4156381a91.13.2025.10.23.20.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 20:45:11 -0700 (PDT)
Message-ID: <673f8cfa-e541-4f17-bc1f-dc0c429d72b7@roeck-us.net>
Date: Thu, 23 Oct 2025 20:45:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
To: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Han Gao <rabenda.cn@gmail.com>
References: <20251023160415.705294-1-linux@roeck-us.net>
 <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org>
 <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_204513_405953_83C4C9A9 
X-CRM114-Status: GOOD (  11.57  )
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

T24gMTAvMjMvMjUgMTg6MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgT2N0IDIzLCAy
MDI1IGF0IDExOjQ44oCvQU0gUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pgo+PiBPbiBUaHUsIDIzIE9jdCAyMDI1LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pgo+Pj4gU3Rh
cnRpbmcgd2l0aCBjb21taXQgNjlhOGI2MmE3YWExICgicmlzY3Y6IGFjcGk6IGF2b2lkIGVycm9y
cyBjYXVzZWQgYnkKPj4+IHByb2JpbmcgRFQgZGV2aWNlcyB3aGVuIEFDUEkgaXMgdXNlZCIpLCBy
aXNjdiBpbWFnZXMgbm8gbG9uZ2VyIHBvcHVsYXRlCj4+PiBkZXZpY2V0cmVlIGlmIEFDUEkgaXMg
ZW5hYmxlZC4gVGhpcyBjYXVzZXMgdW5pdCB0ZXN0cyB0byBmYWlsIHdoaWNoIHJlcXVpcmUKPj4+
IHRoZSByb290IG5vZGUgdG8gYmUgc2V0Lgo+Pj4KPj4+ICAgICMgU3VidGVzdDogb2ZfZHRiCj4+
PiAgICAjIG1vZHVsZTogb2ZfdGVzdAo+Pj4gICAgMS4uMgo+Pj4gICAgIyBvZl9kdGJfcm9vdF9u
b2RlX2ZvdW5kX2J5X3BhdGg6IEVYUEVDVEFUSU9OIEZBSUxFRCBhdCBkcml2ZXJzL29mL29mX3Rl
c3QuYzoyMQo+Pj4gICAgRXhwZWN0ZWQgbnAgaXMgbm90IG51bGwsIGJ1dCBpcwo+Pj4gICAgIyBv
Zl9kdGJfcm9vdF9ub2RlX2ZvdW5kX2J5X3BhdGg6IHBhc3M6MCBmYWlsOjEgc2tpcDowIHRvdGFs
OjEKPj4+ICAgIG5vdCBvayAxIG9mX2R0Yl9yb290X25vZGVfZm91bmRfYnlfcGF0aAo+Pj4gICAg
IyBvZl9kdGJfcm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290OiBFWFBFQ1RBVElPTiBGQUlMRUQg
YXQgZHJpdmVycy9vZi9vZl90ZXN0LmM6MzEKPj4+ICAgIEV4cGVjdGVkIG9mX3Jvb3QgaXMgbm90
IG51bGwsIGJ1dCBpcwo+Pj4gICAgIyBvZl9kdGJfcm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290
OiBwYXNzOjAgZmFpbDoxIHNraXA6MCB0b3RhbDoxCj4+PiAgICBub3Qgb2sgMiBvZl9kdGJfcm9v
dF9ub2RlX3BvcHVsYXRlc19vZl9yb290Cj4+Pgo+Pj4gU2tpcCB0aG9zZSB0ZXN0cyBmb3IgUklT
Q1YgaWYgdGhlIHJvb3Qgbm9kZSBpcyBub3QgcG9wdWxhdGVkLgo+Pj4KPj4+IEZpeGVzOiA2OWE4
YjYyYTdhYTEgKCJyaXNjdjogYWNwaTogYXZvaWQgZXJyb3JzIGNhdXNlZCBieSBwcm9iaW5nIERU
IGRldmljZXMgd2hlbiBBQ1BJIGlzIHVzZWQiKQo+Pj4gQ2M6IEhhbiBHYW8gPHJhYmVuZGEuY25A
Z21haWwuY29tPgo+Pj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+Pj4gU2ln
bmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+Pgo+PiBSZXZp
ZXdlZC1ieTogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+ICAjIGFyY2gvcmlzY3YKPiAK
PiBGV0lXLCB0aGUgZml4ZWQgY29tbWl0IHdpbGwgYWxzbyBwcmV2ZW50IGVuYWJsaW5nIGZlYXR1
cmVzIGxpa2UgdGhpcwo+IHNlcmllc1sxXSBlbmFibGVzLiBBcm02NCBpcyBzdGlsbCBkaXNhYmxl
ZCBBVE0gYmVjYXVzZSBvZiBkaXNhZ3JlZW1lbnQKPiB3aXRoIHRoZSBhcm02NCBtYWludGFpbmVy
cywgc28gdGhhdCBjYW4gd2FzIGtpY2tlZCBkb3duIHRoZSByb2FkLiBJdAo+IHdvdWxkIGJlIGJl
dHRlciB0byBub3QgZGlzYWJsZSB0aGlzIGFuZCBhZGRyZXNzIHRoZSBpc3N1ZXMgYXMgdGhleQo+
IGhhcHBlbiByYXRoZXIgdGhhbiBicmVha2luZyBwZW9wbGUgZG93biB0aGUgcm9hZC4KPiAKCkkg
Z3Vlc3MgdGhhdCBtZWFucyB0aGF0IEknbGwgaGF2ZSB0byBkaXNhYmxlIGRldmljZXRyZWUgdW5p
dCB0ZXN0cyBmb3IKcmlzY3YgdGFyZ2V0cy4gTlA7IHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93
LgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
