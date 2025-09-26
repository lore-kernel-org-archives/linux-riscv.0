Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86EECAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTZNO5+7JiNj8r3NExTVspVbwVhfcd3vYMtiPzsY2MM=; b=FgHotM3kGNp6K/
	OpwlQKyGGlK5J4XB2CiaQxWFBZ+/yCk6EqqEcNfk7DideXwqQsIhpPM7nJu6nYElIAvtCXK2BUmgT
	KY5gQHYMelfalYdV5gKgZuCP3yv0PLhRF0ukEw9a+lBRS9OLeOz63IWwj6ES/Lj1S2JpqbCHMCbLx
	MQxVLYxaU5cDDpxCvuNNZCBhZRwni1DVfhsd3mSmtDCq1sbP0/MjyCMsh2eSPaqfETb3zSdn4TjBT
	kZIx+o0nHt0axw9YrtEGvpZRzyFu0p2mhMr/5Vp11WjXRr/DQbbfQrRIqfsgNO8w+qZpTPIgNGUwJ
	Mu4ZvF1WbwLMZB4dB12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24tw-000000002n0-0k1A;
	Fri, 26 Sep 2025 09:38:04 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24tt-000000002gy-3nAu
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 09:38:02 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-74526ca79c2so872482a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758879475; x=1759484275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5FmCZ7m0CyShB1Ycdtz4U9JEqoB4MdA/m7HVOlr6mo=;
        b=CbYmUsqiqSGNApYLv5o2xTS60ZFmGhh6UZXwXJ+whM284cEljzl/fOGzjHiv2b2MGp
         SELFoxOy0JZ++1CRv6rADjlQl4hgPlLe1sUw5LXfx5EbFHTQ+S6Q7ZUMbWlPneQLtEuq
         4jyXmllX1GkXF6DrzAiZmPz/8kpKtr9qPxpX23QUCHFCCAy5XOl5NOA87cGFfK70/v59
         rrHNvLbwiHVYFrU3CnqWCB6U0nyr5DluQ3IPL0Xv644BtZxzWkwuzuHKoff+89G4eB6d
         Un/9hNhv3qa2GapaKuUO7ReElF6ExZ9l8OuFEttfQPMbjfp1feTag0f4+ppZvbHmSXva
         Tp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879475; x=1759484275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5FmCZ7m0CyShB1Ycdtz4U9JEqoB4MdA/m7HVOlr6mo=;
        b=pRC0/6DmFJPyPv14PsHf1HWacUllUdjPySBNFqRbTcOvO7DsCM2jxz2CDlUF/nK0n8
         Y9ZjbNHe7ujp8llbj5GoXS4XVmhtfSnU4ikiGJ+DTAY76TjxE7GrcJoT9IxryqMjpNft
         O4LHC1KVnY5dCRAuRczNPGiZFX7T5Efhy5VIk1es24pdGWcuXu9Q10TaW1lRqsfYsIbS
         c0G6FAFuuTZT5Ehh+BcOK3POQwN1mIw8BCHGrsz3ngtd0UN7FQEgF7ZZo1rGzXuXwAeV
         hHjnZM4J8hfnsH88uJMXZ78NSeINKRMBrRWJFclB1mCiAw/4vw+0xWWCnqKHCSa0LHtH
         gzdg==
X-Forwarded-Encrypted: i=1; AJvYcCVTqmraLNXoqt1Q5EgnPuw08ZH5WGiVKHNJAwfTPrUX0MjoFzHHAaAwaqeF5ctPGUUGfre5zuFzktCVJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJDoxRaVo25q17sOaDAolduhfpg91wcxAcSZKlTU+dmwR1y8Ac
	W9/QB7QOhjRZPOENnJ2H5iS0jlpi0zRb4ZKPPIhux63l63bQZ8os8EZRPhYHLqHWwLjTjbeNLY8
	LkyU0Xihpvi4z86jnK2pwED3cR+VZUcxwlwGknroSMA==
X-Gm-Gg: ASbGncvbykfvGwGXjw85OZrDNVuoYlTCvM9hGsjtUU6Wdd+8hzQ7SF7uMkR6oSjly3C
	N48ynvLeC8wTSyn3/lDwy2Vg15SSFnRjX80pfg0maT5iVzGqxapB3t3pmoS0/DNy+mjMzfd8uhX
	C++aUOsVz1WFfUNZUSf9vIHBCQcKaBuWJft95sqaj5Mbm2y4MsOwB/oWZVmwjONJK9gx5wMXW8g
	zCImq1mpkvEEGLdlSwVhpsCBNQiLc/nIzJaQA==
X-Google-Smtp-Source: AGHT+IEc3BE14yCdZtCENJr4UXyf6Y8XkhqfpWh+WHahYzWW5GLDg7SSMeNNAS+2Kw/XzX0+d+blEeRda/r+amoNwkc=
X-Received: by 2002:a05:6808:8843:10b0:43f:5218:878a with SMTP id
 5614622812f47-43f52188986mr2126658b6e.22.1758879475127; Fri, 26 Sep 2025
 02:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
In-Reply-To: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 26 Sep 2025 17:37:44 +0800
X-Gm-Features: AS18NWBUD0z6jg0TusFj1nphukSzt5aTNsZRJ0rH-JxFSgQYIIkepAcYdgJLzRk
Message-ID: <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_023801_940949_14814424 
X-CRM114-Status: GOOD (  17.34  )
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

SGkgRG91ZywKCk9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDQ6MDDigK9BTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBUaHUsIFNlcCAy
NSwgMjAyNSBhdCAxOjQ44oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4KPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Nw
dV9wbS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L25taS5oPgo+ID4gICNpbmNsdWRlIDxs
aW51eC9wZXJmL2FybV9wbXUuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC9zY2hlZC9jbG9jay5oPgo+ID4gQEAgLTY5NiwxMCArNjk3LDEyIEBAIHN0
YXRpYyBpbnQgYXJtcG11X2dldF9jcHVfaXJxKHN0cnVjdCBhcm1fcG11ICpwbXUsIGludCBjcHUp
Cj4gPiAgICAgICAgIHJldHVybiBwZXJfY3B1KGh3X2V2ZW50cy0+aXJxLCBjcHUpOwo+ID4gIH0K
PiA+Cj4gPiAtYm9vbCBhcm1fcG11X2lycV9pc19ubWkodm9pZCkKPiA+ICsjaWZkZWYgQ09ORklH
X0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRgo+ID4gK2Jvb2wgYXJjaF9wZXJmX25taV9pc19hdmFp
bGFibGUodm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIHJldHVybiBoYXNfbm1pOwo+ID4gIH0KPiA+
ICsjZW5kaWYKPgo+IFNob3VsZCB0aGUgcHJldmlvdXMgY29tbWVudCBtb3ZlIGhlcmUsIEFLQToK
Pgo+IC8qCj4gICogaGFyZGxvY2t1cF9kZXRlY3Rvcl9wZXJmX2luaXQoKSB3aWxsIHN1Y2Nlc3Mg
ZXZlbiBpZiBQc2V1ZG8tTk1JIHR1cm5zIG9mZiwKCk9rYXksIHdlIGFsc28gbmVlZCB0byBjaGFu
Z2UgaXQgdG8g4oCcd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgp4oCdCgo+ICAqIGhvd2V2ZXIs
IHRoZSBwbXUgaW50ZXJydXB0cyB3aWxsIGFjdCBsaWtlIGEgbm9ybWFsIGludGVycnVwdCBpbnN0
ZWFkIG9mCj4gICogTk1JIGFuZCB0aGUgaGFyZGxvY2t1cCBkZXRlY3RvciB3b3VsZCBiZSBicm9r
ZW4uCj4gKi8KPgo+Cj4gPiArc3RhdGljIGludCBfX2luaXQgaW5pdF93YXRjaGRvZ19mcmVxX25v
dGlmaWVyKHZvaWQpCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9u
b3RpZmllcigmd2F0Y2hkb2dfZnJlcV9ub3RpZmllciwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQ1BVRlJFUV9QT0xJQ1lfTk9USUZJRVIpOwo+Cj4gSSB0aGlu
ayB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgdG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVuaW5n
IG9uIGFueQo+IHBsYXRmb3JtcyB0aGF0IG92ZXJyaWRlIGh3X25taV9nZXRfc2FtcGxlX3Blcmlv
ZCgpLCByaWdodD8gVGhlc2UKPiBjcHVmcmVxIG5vdGlmaWVycyB3aWxsIGJlIHVzZWxlc3MgaW4g
dGhhdCBjYXNlLi4uCgpJIHVuZGVyc3RhbmQgdGhpcyBpcyBub3QgYSBwcm9ibGVtLiB3YXRjaGRv
Z19wZXJmIHVzZXMKUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTLCB3aGljaCBtZWFucyBpdCBpcyBp
bmhlcmVudGx5IGxpbWl0ZWQgYnkgdGhlCkNQVSdzIG1haW4gZnJlcXVlbmN5LiBBZnRlciB3ZSBt
YWtlIHN1Y2ggYSBjaGFuZ2UsIGEgbGFyZ2VyIHZhbHVlIG1heQpiZSB1c2VkIGFzIHRoZSBwZXJp
b2QsIHNvIHRoZSBOTUkgcGVyaW9kIHdpbGwgYmVjb21lIGxvbmdlciwgYnV0IHRoaXMKdmFsdWUg
d2lsbCBub3QgY2hhbmdlIGFmdGVyIHRoZSBzeXN0ZW0gc3RhcnRzLgoKPgo+Cj4gLURvdWcKPgoK
VGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
