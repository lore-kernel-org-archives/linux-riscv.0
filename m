Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E87CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77bqKJkOKstOssJ1bcA/VCIBORKbei/zO5Z4QKhB6NA=; b=IBLvxc+oC/rMNE
	DV4ptfz5JdK6713aBaeHKILqMU39M7SYoaO80zVeZyXVGBqTQmo6dGa5bogbKqLjUnrlXcbXH4gGq
	e0k1iCsMijEpluF9of6eWJZe/G6n7xc32iYWdikM9lKN4vsDMzCCFGznOcXcs/u2yH9fQcbvvp9vI
	puzQRWixa+bZm1Ew4FQkCiAbMIOXZklwns2IFir6GET9R5VEGSzWLRrTOCGj3GIuzFc4jFMyaxDTM
	lCUet8TLHbgpmDSzanolrQ6gAvmcZdLfGHmeSXL2qntyzCQYkxbIH5zPvVdtQtaK7IvfTZ00c99ts
	4q9qigYRKGgqW1Xp7g3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNQe-00GbXA-19;
	Thu, 19 Oct 2023 07:26:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNQb-00GbWh-0T
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:26:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6bbfb8f7ac4so1075528b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697700404; x=1698305204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgTcFnd2WuQ3b93x6mtXxA5MmL51CRaK2ux9aDnBicU=;
        b=Xp+K8UQqNHvvqKMXzKvnZDYvk7HonC1/8NVrDzeuqek2bSZgFrkX9CaCNtyP7Z7Z1W
         dfQRRLKYtuKtpqSf5SRMTfm69UFpTvqgnPCrN7qjTz6SOYhsrArhSBKK7FBqpGV421nX
         BYyWKFfx3DT/GhibH4zfG6W3Ni1pX+SIq0jb860ER0swMdExcaKklh+2HCJb1Zb6wZLx
         3amHz2Qoa76JFdnDU2/nlHdqK8dQEsMvwnUZomLYGMDPiX5W/89EwLpgxw8HrhViSW5e
         s8VJ6574wGn04oVj0B2hJhmCmaUvz/c1Jf+zUkSfFFj+xAjShJwLoUYTDcDUCVKKWzEk
         +39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700404; x=1698305204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgTcFnd2WuQ3b93x6mtXxA5MmL51CRaK2ux9aDnBicU=;
        b=Z84wD0BNWAs2xXthOkLj0znjtT6AgcWtQXnUEPJB0Yh3cKDdgm81aFD1OUgnzlqqk5
         iqg1LQDOPukB3xJNXkfTDJ7luT6UQlZrhkw7Qrz5ZEzTjrIPgsHiTeXQFZjFNmg1jJN+
         DJtljyQLTXr9aEI3+Tg8FrAPZk3OXJNJdEtzb8SRvg0zG4Jb90IjgvvXlByBO/m4dNi5
         ebDmKDMIkwdxFsVMsLwv0YXWMYAJk0Npb0b2hxABLCAyg8rwBe4tzVkCrw0ZCsBpMy2B
         y5zSxSwjbKZjKi5CmgUR/HeBlO9IYQudQanK6BNz+45DtemwqmS0Qfxfj5cduQ9v4aA8
         JZGg==
X-Gm-Message-State: AOJu0YxN/jXS4r9ferlnSJaFTxtJ4XUaTLVbFKmb5K7ac+D+MiALqohS
	dzXxY9VAndRQuj1nkC2JB6cLSw==
X-Google-Smtp-Source: AGHT+IHBolW3gGracNxmsGlk+qzVRPdVEtKUfRfRdsaXZ4nG07zJsUHKMW68cjsZuxWvQXGUOxGzrQ==
X-Received: by 2002:a62:b613:0:b0:6bc:67ca:671d with SMTP id j19-20020a62b613000000b006bc67ca671dmr1233298pff.1.1697700403743;
        Thu, 19 Oct 2023 00:26:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id g7-20020aa79f07000000b00693411c6c3csm4455829pfr.39.2023.10.19.00.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 00:26:43 -0700 (PDT)
Message-ID: <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
Date: Thu, 19 Oct 2023 09:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231018-flagpole-footpad-07a6228485f3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_002645_210338_E378BB07 
X-CRM114-Status: GOOD (  19.33  )
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

CgpPbiAxOC8xMC8yMDIzIDE5OjM2LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBPY3Qg
MTgsIDIwMjMgYXQgMDY6MzM6MzRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiBX
ZWQsIE9jdCAxOCwgMjAyMyBhdCAxMDoyNDoxNUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+
Pj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBGYWN0b3JpemUgSVNBIGV4dGVuc2lv
biByZXBvcnRpbmcgYnkgdXNpbmcgYSBtYWNybyByYXRoZXIgdGhhbgo+Pj4+IGNvcHkvcGFzdGlu
ZyBleHRlbnNpb24gbmFtZXMuIFRoaXMgd2lsbCBhbGxvdyBhZGRpbmcgbmV3IGV4dGVuc2lvbnMg
bW9yZQo+Pj4+IGVhc2lseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4+PiAtLS0KPj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMgfCAzMiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfcmlzY3YuYwo+Pj4+IGluZGV4IDQ3MzE1OWI1ZjMwMy4uZTIwNzg3NGU2ODZl
IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4+Pj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPj4+PiBAQCAtMTQ1LDIwICsxNDUsMjQg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKPj4+PiAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUsIGNwdXMpIHsKPj4+PiAgICAgICAgICAg
ICAgICAgc3RydWN0IHJpc2N2X2lzYWluZm8gKmlzYWluZm8gPSAmaGFydF9pc2FbY3B1XTsKPj4+
Pgo+Pj4+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
aXNhaW5mby0+aXNhLCBaQkEpKQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZh
bHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pCQTsKPj4+PiAtICAgICAgICAgICAgICAgZWxzZQo+
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRf
WkJBOwo+Pj4+IC0KPj4+PiAtICAgICAgICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgWkJCKSkKPj4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkI7Cj4+Pj4gLSAgICAgICAgICAg
ICAgIGVsc2UKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NWX0hX
UFJPQkVfRVhUX1pCQjsKPj4+PiAtCj4+Pj4gLSAgICAgICAgICAgICAgIGlmIChyaXNjdl9pc2Ff
ZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCUykpCj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJTOwo+Pj4+IC0g
ICAgICAgICAgICAgICBlbHNlCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWlzc2luZyB8
PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Cj4+Pj4gKyNkZWZpbmUgQ0hFQ0tfSVNBX0VYVChfX2V4
dCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
Pj4gKyAgICAgICAgICAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgX19leHQpKSBc
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVND
Vl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NW
X0hXUFJPQkVfRVhUXyMjX19leHQ7ICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAgIH0g
d2hpbGUgKGZhbHNlKQo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgICAgLyoKPj4+PiArICAgICAg
ICAgICAgICAgICogT25seSB1c2UgQ0hFQ0tfSVNBX0VYVCgpIGZvciBleHRlbnNpb25zIHdoaWNo
IGNhbiBiZSBleHBvc2VkCj4+Pj4gKyAgICAgICAgICAgICAgICAqIHRvIHVzZXJzcGFjZSwgcmVn
YXJkbGVzcyBvZiB0aGUga2VybmVsJ3MgY29uZmlndXJhdGlvbiwgYXMgbm8KPj4+PiArICAgICAg
ICAgICAgICAgICogb3RoZXIgY2hlY2tzLCBiZXNpZGVzIHByZXNlbmNlIGluIHRoZSBoYXJ0X2lz
YSBiaXRtYXAsIGFyZQo+Pj4+ICsgICAgICAgICAgICAgICAgKiBtYWRlLgo+Pj4KPj4+IFRoaXMg
Y29tbWVudCBhbGx1ZGVzIHRvIGEgZGFuZ2Vyb3VzIHRyYXAsIGJ1dCBJJ20gaGF2aW5nIHRyb3Vi
bGUKPj4+IHVuZGVyc3RhbmRpbmcgd2hhdCBpdCBpcy4KPj4KPj4gWW91IGNhbm5vdCwgZm9yIGV4
YW1wbGUsIHVzZSB0aGlzIGZvciBjb21tdW5pY2F0aW5nIHRoZSBwcmVzZW5jZSBvZiBGIG9yCj4+
IEQsIHNpbmNlIHRoZXkgcmVxdWlyZSBhIGNvbmZpZyBvcHRpb24gdG8gYmUgc2V0IGJlZm9yZSB0
aGVpciB1c2UgaXMKPj4gc2FmZS4KPiAKPiBGdW5uaWx5IGVub3VnaCwgdGhpcyBjb21tZW50IGlz
IGltbWVkaWF0ZWx5IGNvbnRyYWRpY3RlZCBieSB0aGUgdmVjdG9yCj4gc3Vic2V0IGV4dGVuc2lv
bnMsIHdoZXJlIHRoZXNlIENIRUNLX0lTQV9FWFQoKSBtYWNyb3MgYXJlIHVzZWQgd3JhcHBlZAo+
IGluIGhhc192ZWN0b3IoKS4gVGhlIGNvZGUgbG9va3MgdmFsaWQgdG8gbWUsIHNpbmNlIGhhc192
ZWN0b3IoKSBjb250YWlucwo+IHRoZSBLY29uZmlnIGNoZWNrLCBidXQgZG9lcyBmbHkgaW4gdGhl
IGZhY2Ugb2YgdGhpcyBjb21tZW50LgoKWWVzLCB0aGUgS0NvbmZpZyBjaGVja3MgYXJlIGFscmVh
ZHkgZG9uZSBieSB0aGUgaGVhZGVycywgYWRkaW5nICNpZmRlZgp3b3VsZCBiZSByZWR1bmRhbnQg
ZXZlbiBpZiBtb3JlIGNvaGVyZW50IHdpdGggdGhlIGNvbW1lbnQuIEJUVywgd291bGRuJ3QKaXQg
bWFrZSBtb3JlIHNlbnNlIHRvIGdldCByaWQgb3V0IG9mIHRoZSB1bnN1cHBvcnRlZCBleHRlbnNp
b25zIGRpcmVjdGx5CmF0IElTQSBzdHJpbmcgcGFyc2luZyA/IGllLCBpZiBrZXJuZWwgaXMgY29t
cGlsZWQgd2l0aG91dCBWIHN1cHBvcnQsCnRoZW4gZG8gbm90IHNldCB0aGUgYml0cyBjb3JyZXNw
b25kaW5nIHRvIHRoZXNlIGluIHRoZSByaXNjdl9pc2FfZXh0W10KYXJyYXkgPyBCdXQgdGhlIGlu
aXRpYWwgaW50ZW50IHdhcyBwcm9iYWJseSB0byBiZSBhYmxlIHRvIHJlcG9ydCB0aGUKZnVsbCBz
dHJpbmcgdGhyb3VnaCBjcHVpbmZvLgoKQ2zDqW1lbnQKCj4gCj4+Cj4+PiBQZXJoYXBzIHNvbWUg
cmV3b3JkaW5nIHRvIG1vcmUgZXhwbGljaXRseQo+Pj4gc3RhdGUgdGhlIGRhbmdlciB3b3VsZCBi
ZSBhcHByb3ByaWF0ZS4gT3RoZXIgdGhhbiB0aGF0Ogo+Pj4KPj4+IFJldmlld2VkLWJ5OiBFdmFu
IEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
