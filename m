Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13964E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPu5Z6p3YMULy7PKeVnohtqal5umfx1zmiMVhVVWnWI=; b=yi3ddTeJoLLwTk
	WsTVwHKEjC3zT8X59b765YXLoV0gNcbt8thc1Nl7S95xBmRM8hWJerDLMDGpatLpVVI4jbm+k5AqH
	aIbDMFrFGbl247p9oorSYXOZp2qDX1yimh+nvSCilUeo11I+L+dxSZVpg3dzdbbl0n+pcFc6XXkiG
	aWKOE9m3IgR0xm8Zj+l8C6wFFyLsIAv8p9yQLwT08b692BFVT2Fnp8v8liJEI75E5idUismqmKRpG
	Y0y7aCaOsH2izUQ0peJvkdoi02lKV38Jhr5FhadcSMlAR9Jc1Tpvunt+0ThLR+eppqYbAQv28q1uB
	iHz/XNtaGeeEuIl9RamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppuX-00AkPE-1r;
	Mon, 09 Oct 2023 13:03:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppuU-00AkNL-38
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:03:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso12397815e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696856575; x=1697461375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyEATBYxN/EkL89zxBGiBE8n5rmmGde+J0DkSI2hwB0=;
        b=y0EXcO8zeYcGP17d4rvdYpqpcG7+X8buvJ8n/lh+E7zJ0cUKCAZxNH3dC3Da797O9l
         8dhHFm8z+WqcpWBqYxI737AUpcV0xTITwj2HIrhE+b/SVJ7k/Tp3wjCBF2JHZng6gvif
         pAMXnkAmI4ya0u34O8PIzq3EtkyWRx6CSCM6spEn1NFcYHeDxyV6uuQTWanXstCOxkc7
         mse7c8E8lrIjizjsuVERTmr7Y+kQsfKYsmlxfFVBOFMMfyKzNY/27rqjeCbOqMcEiv01
         zhNbxyAGVGMs0JZPIfDup5MP5sGpg0e7ESHwMd8YgTsczX80aKXtmuTH/kKiQIVjLMMi
         3wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856575; x=1697461375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyEATBYxN/EkL89zxBGiBE8n5rmmGde+J0DkSI2hwB0=;
        b=KbGsyMrW4wx8LnsoGTbdIrXBNk4kvazh+Pat3+vhvhYT2XOM/ovT4d2DH7EDByqvMl
         h34Qlph5aSCD9pt5+LQOeLYKAQ8wdfFnPP+hp1LW6QS/9aLqPZT7v5yBoixbE9eKZf7/
         69bS+1HHM7izfd6Koqxm16oJ85IbODTH5grihdj6Nv5xUAMHnNBOO6tNL7LABMagu72W
         GrRsYZ7qdaBOI9sDbyUEBr4PDGHV68vOyQifP7PW2qi6LovsYKVya4uLDj9M7XmoX5m6
         V931Svzc2DeiPXox430IXOTmGZbs/9Ej/KO2k1eKxS1A6HbLsVc6VrpgMgJImDjL2GdU
         fh8Q==
X-Gm-Message-State: AOJu0YyXZYfRHNNiohH5xghlvsJOXc9F0dCOc3C2dtsrCEZMAvzCwM9H
	Mqc6D3c7kP49gIr2+iCLkH2jdQ==
X-Google-Smtp-Source: AGHT+IGZFkXjSfaTr6s5epagcOuq5I1x+XwJ3YJ+ESkKr9Z5cmbXufBpxZ/oBirro0mpVosmpnhd4Q==
X-Received: by 2002:a05:600c:3ca1:b0:405:3cc1:e115 with SMTP id bg33-20020a05600c3ca100b004053cc1e115mr13919016wmb.3.1696856574428;
        Mon, 09 Oct 2023 06:02:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e? ([2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d4b0f000000b00325aca09ad1sm9678417wrq.24.2023.10.09.06.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:02:54 -0700 (PDT)
Message-ID: <ef02ff0d-10b0-47db-93dc-3cb9f6db140e@rivosinc.com>
Date: Mon, 9 Oct 2023 15:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] riscv: add support for misaligned trap handling in
 S-mode
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski
 <cyrevolt@googlemail.com>, Conor Dooley <conor@kernel.org>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-3-cleger@rivosinc.com>
 <871qeagw69.fsf@all.your.base.are.belong.to.us>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <871qeagw69.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_060259_015107_DB57A73D 
X-CRM114-Status: GOOD (  20.45  )
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

CgpPbiAwNC8xMC8yMDIzIDE5OjAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+IAo+PiBNaXNhbGlnbm1lbnQgdHJh
cCBoYW5kbGluZyBpcyBvbmx5IHN1cHBvcnRlZCBmb3IgTS1tb2RlIGFuZCB1c2VzIGRpcmVjdAo+
PiBhY2Nlc3NlcyB0byB1c2VyIG1lbW9yeS4gSW4gUy1tb2RlLCB3aGVuIGhhbmRsaW5nIHVzZXJt
b2RlIGZhdWx0LCB0aGlzCj4+IHJlcXVpcmVzIHRvIHVzZSB0aGUgZ2V0X3VzZXIoKS9wdXRfdXNl
cigpIGFjY2Vzc29ycy4gSW1wbGVtZW50Cj4+IGxvYWRfdTgoKSwgc3RvcmVfdTgoKSBhbmQgZ2V0
X2luc24oKSB1c2luZyB0aGVzZSBhY2Nlc3NvcnMgZm9yCj4+IHVzZXJzcGFjZSBhbmQgZGlyZWN0
IHRleHQgYWNjZXNzIGZvciBrZXJuZWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgIHwgICA4ICsrCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vu
dHJ5LWNvbW1vbi5oIHwgIDE0ICsrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAg
ICAgICAgICB8ICAgMiArLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAg
ICB8ICAgOSAtLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jICB8IDEx
OSArKysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgNSBmaWxlcyBjaGFuZ2VkLCAxMjkgaW5z
ZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggZDYwN2FiMGY3YzZkLi42ZTE2
NzM1OGE4OTcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gQEAgLTYzNiw2ICs2MzYsMTQgQEAgY29uZmlnIFRIUkVBRF9TSVpF
X09SREVSCj4+ICAJICBTcGVjaWZ5IHRoZSBQYWdlcyBvZiB0aHJlYWQgc3RhY2sgc2l6ZSAoZnJv
bSA0S0IgdG8gNjRLQiksIHdoaWNoIGFsc28KPj4gIAkgIGFmZmVjdHMgaXJxIHN0YWNrIHNpemUs
IHdoaWNoIGlzIGVxdWFsIHRvIHRocmVhZCBzdGFjayBzaXplLgo+PiAgCj4+ICtjb25maWcgUklT
Q1ZfTUlTQUxJR05FRAo+PiArCWJvb2wgIlN1cHBvcnQgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIHRy
YXBzIGZvciBrZXJuZWwgYW5kIHVzZXJzcGFjZSIKPj4gKwlkZWZhdWx0IHkKPj4gKwloZWxwCj4+
ICsJICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRoZSBrZXJuZWwgdG8gZW1iZWQgc3VwcG9ydCBm
b3IgbWlzYWxpZ25lZAo+PiArCSAgbG9hZC9zdG9yZSBmb3IgYm90aCBrZXJuZWwgYW5kIHVzZXJz
cGFjZS4gV2hlbiBkaXNhYmxlLCBtaXNhbGlnbmVkCj4+ICsJICBhY2Nlc3NlcyB3aWxsIGdlbmVy
YXRlIFNJR0JVUyBpbiB1c2Vyc3BhY2UgYW5kIHBhbmljIGluIGtlcm5lbC4KPj4gKwo+PiAgZW5k
bWVudSAjICJQbGF0Zm9ybSB0eXBlIgo+PiAgCj4+ICBtZW51ICJLZXJuZWwgZmVhdHVyZXMiCj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+PiBpbmRleCA2ZTRkZWU0OWQ4NGIu
LjdhYjVlMzQzMThjOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRy
eS1jb21tb24uaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5o
Cj4+IEBAIC04LDQgKzgsMTggQEAKPj4gIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpOwo+PiAgdm9pZCBoYW5kbGVfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Owo+PiAgCj4+ICsjaWZkZWYgQ09ORklHX1JJU0NWX01JU0FMSUdORUQKPj4gK2ludCBoYW5kbGVf
bWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPj4gK2ludCBoYW5kbGVfbWlz
YWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4+ICsjZWxzZQo+PiArc3RhdGlj
IGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
Pj4gK3sKPj4gKwlyZXR1cm4gLTE7Cj4+ICt9Cj4+ICtzdGF0aWMgaW5saW5lIGludCBoYW5kbGVf
bWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gK3sKPj4gKwlyZXR1cm4g
LTE7Cj4+ICt9Cj4+ICsjZW5kaWYKPj4gKwo+PiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfRU5UUllf
Q09NTU9OX0ggKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIv
YXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPj4gaW5kZXggOTVjZjI1ZDQ4NDA1Li4wZDg3NGZi
MjRiNTEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4+IEBAIC01OSw3ICs1OSw3IEBAIG9iai15CSs9
IHBhdGNoLm8KPj4gIG9iai15CSs9IHByb2Jlcy8KPj4gIG9iai0kKENPTkZJR19NTVUpICs9IHZk
c28ubyB2ZHNvLwo+PiAgCj4+IC1vYmotJChDT05GSUdfUklTQ1ZfTV9NT0RFKQkrPSB0cmFwc19t
aXNhbGlnbmVkLm8KPj4gK29iai0kKENPTkZJR19SSVNDVl9NSVNBTElHTkVEKQkrPSB0cmFwc19t
aXNhbGlnbmVkLm8KPj4gIG9iai0kKENPTkZJR19GUFUpCQkrPSBmcHUubwo+PiAgb2JqLSQoQ09O
RklHX1JJU0NWX0lTQV9WKQkrPSB2ZWN0b3Iubwo+PiAgb2JqLSQoQ09ORklHX1NNUCkJCSs9IHNt
cGJvb3Qubwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gaW5kZXggMTk4MDdjNGQzODA1Li5kNjk3NzllNGI5Njcg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYwo+PiBAQCAtMTc5LDE0ICsxNzksNiBAQCBhc21saW5rYWdlIF9f
dmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfaW5zbl9pbGxlZ2FsKHN0cnVjdCBw
dF9yZWdzICpyZQo+PiAgCj4+ICBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwKPj4g
IAlTSUdTRUdWLCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7Cj4+IC0jaWZuZGVm
IENPTkZJR19SSVNDVl9NX01PREUKPj4gLURPX0VSUk9SX0lORk8oZG9fdHJhcF9sb2FkX21pc2Fs
aWduZWQsCj4+IC0JU0lHQlVTLCBCVVNfQURSQUxOLCAiT29wcyAtIGxvYWQgYWRkcmVzcyBtaXNh
bGlnbmVkIik7Cj4+IC1ET19FUlJPUl9JTkZPKGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZCwKPj4g
LQlTSUdCVVMsIEJVU19BRFJBTE4sICJPb3BzIC0gc3RvcmUgKG9yIEFNTykgYWRkcmVzcyBtaXNh
bGlnbmVkIik7Cj4+IC0jZWxzZQo+PiAtaW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpOwo+PiAtaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBw
dF9yZWdzICpyZWdzKTsKPj4gIAo+PiAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2xvYWRfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4g
IHsKPj4gQEAgLTIyOSw3ICsyMjEsNiBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2Vj
dGlvbiB2b2lkIGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncwo+PiAgCQlp
cnFlbnRyeV9ubWlfZXhpdChyZWdzLCBzdGF0ZSk7Cj4+ICAJfQo+PiAgfQo+PiAtI2VuZGlmCj4+
ICBET19FUlJPUl9JTkZPKGRvX3RyYXBfc3RvcmVfZmF1bHQsCj4+ICAJU0lHU0VHViwgU0VHVl9B
Q0NFUlIsICJzdG9yZSAob3IgQU1PKSBhY2Nlc3MgZmF1bHQiKTsKPj4gIERPX0VSUk9SX0lORk8o
ZG9fdHJhcF9lY2FsbF9zLAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IGlu
ZGV4IGU3YmZiMzMwODljMS4uOWRhZWQ3ZDc1NmFlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jCj4+IEBAIC0xMiw2ICsxMiw3IEBACj4+ICAjaW5jbHVkZSA8YXNtL3By
b2Nlc3Nvci5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPj4gICNpbmNsdWRlIDxhc20v
Y3NyLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgo+PiAgCj4+ICAjZGVmaW5l
IElOU05fTUFUQ0hfTEIJCQkweDMKPj4gICNkZWZpbmUgSU5TTl9NQVNLX0xCCQkJMHg3MDdmCj4+
IEBAIC0xNTEsMjEgKzE1MiwyNSBAQAo+PiAgI2RlZmluZSBQUkVDSVNJT05fUyAwCj4+ICAjZGVm
aW5lIFBSRUNJU0lPTl9EIDEKPj4gIAo+PiAtc3RhdGljIGlubGluZSB1OCBsb2FkX3U4KGNvbnN0
IHU4ICphZGRyKQo+PiArI2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKPj4gK3N0YXRpYyBpbmxp
bmUgaW50IGxvYWRfdTgoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGNvbnN0IHU4ICphZGRyLCB1OCAq
cl92YWwpCj4+ICB7Cj4+ICAJdTggdmFsOwo+PiAgCj4+ICAJYXNtIHZvbGF0aWxlKCJsYnUgJTAs
ICUxIiA6ICI9JnIiICh2YWwpIDogIm0iICgqYWRkcikpOwo+PiArCSpyX3ZhbCA9IHZhbDsKPj4g
IAo+PiAtCXJldHVybiB2YWw7Cj4+ICsJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCBzdG9yZV91OCh1OCAqYWRkciwgdTggdmFsKQo+PiArc3RhdGljIGlubGluZSBp
bnQgc3RvcmVfdTgoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHU4ICphZGRyLCB1OCB2YWwpCj4+ICB7
Cj4+ICAJYXNtIHZvbGF0aWxlICgic2IgJTAsICUxXG4iIDogOiAiciIgKHZhbCksICJtIiAoKmFk
ZHIpKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgaW5saW5lIHVs
b25nIGdldF9pbnNuKHVsb25nIG1lcGMpCj4+ICtzdGF0aWMgaW5saW5lIGludCBnZXRfaW5zbihz
dHJ1Y3QgcHRfcmVncyAqcmVncywgdWxvbmcgbWVwYywgdWxvbmcgKnJfaW5zbikKPj4gIHsKPj4g
IAlyZWdpc3RlciB1bG9uZyBfX21lcGMgYXNtICgiYTIiKSA9IG1lcGM7Cj4+ICAJdWxvbmcgdmFs
LCBydmNfbWFzayA9IDMsIHRtcDsKPj4gQEAgLTE5NCw5ICsxOTksODcgQEAgc3RhdGljIGlubGlu
ZSB1bG9uZyBnZXRfaW5zbih1bG9uZyBtZXBjKQo+PiAgCTogW2FkZHJdICJyIiAoX19tZXBjKSwg
W3J2Y19tYXNrXSAiciIgKHJ2Y19tYXNrKSwKPj4gIAkgIFt4bGVuX21pbnVzXzE2XSAiaSIgKFhM
RU5fTUlOVVNfMTYpKTsKPj4gIAo+PiAtCXJldHVybiB2YWw7Cj4+ICsJKnJfaW5zbiA9IHZhbDsK
Pj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArI2Vsc2UKPj4gK3N0YXRpYyBpbmxpbmUgaW50
IGxvYWRfdTgoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGNvbnN0IHU4ICphZGRyLCB1OCAqcl92YWwp
Cj4+ICt7Cj4+ICsJaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+PiArCQlyZXR1cm4gX19nZXRfdXNl
cigqcl92YWwsIGFkZHIpOwo+PiArCX0gZWxzZSB7Cj4+ICsJCSpyX3ZhbCA9ICphZGRyOwo+PiAr
CQlyZXR1cm4gMDsKPj4gKwl9Cj4gCj4gT25lIG5pdCAoLi4ud2VsbCB0d28pIDstKQo+IAo+IElm
IHlvdSdyZSByZXNwaW5uaW5nIEknZCBnZXQgcmlkIG9mIHRoZSAiaW5saW5lcyIsYW5kIHBlcnNv
bmFsbHkgSQo+IHRoaW5rIGVhcmx5IGV4aXQgaXMgZWFzaWVyIHRvIHJlYWQuIEFwcGxpZXMgdG8g
dGhlIHdob2xlIHBhdGNoLgoKTm90ZWQsIEknbGwgZml4IHRoYXQgKGNoZWNrcGF0Y2ggc3VnZ2Vz
dGVkIGl0IHNvIHRoYXQgbWFrZXMgc2Vuc2UpLgoKQ2zDqW1lbnQKCj4gCj4gICB8IHsKPiAgIHwg
CWlmICh1c2VyX21vZGUocmVncykpCj4gICB8IAkJcmV0dXJuIF9fZ2V0X3VzZXIoKnJfdmFsLCBh
ZGRyKTsKPiAgIHwgCj4gICB8ICAgICAgICAgKnJfdmFsID0gKmFkZHI7Cj4gICB8IAlyZXR1cm4g
MDsKPiAgIHwgfQo+IAo+IAo+IFJlZ2FyZGxlc3MgaWYgeW91IGNoYW5nZSBvciBub3QsCj4gCj4g
UmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
