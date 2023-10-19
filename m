Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA11CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOkzlz6uXblFYqVCXzpJutm2f7MSqA4BilThL7IF6ZY=; b=nOzjcnyzjANDig
	PmV1xuLaRWSKg2Z7TY5ttpgatqvMzaNX7sU8bg3eVXgsAuK8OHvhAUdgd3eCg6ig/6kAYAkfVH24F
	G3uyh2hUpVBXoNzhHxgRwcDZe6qUp9imBeSVbYVtKNFXdNA/7juNVJsSloRcggd7Xq9WhQxyR+LWP
	VDwfqI+V2fdyS1kN9HNBRrtNy29rmgWhIiv2ISERgR95cV2+ouRBROQB8Knk872wMK918MAexGiGk
	jJyegeQ965rnZ8Z1HysA2NTZ5E2q2dyQv2/NQcuQQ+5xvIlZXagYXhO+3GfJxugBjd1hqPdBrAZjz
	sGVDDP4Cyb6UuQ+sliJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNLQ-00Gb8L-2x;
	Thu, 19 Oct 2023 07:21:24 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNLO-00Gb7s-0F
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:21:23 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6c61dd1c229so1279567a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697700079; x=1698304879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/caEF9HzcleOEHwneLp6tiCcjo0T3AFNH3jEPiF4Apg=;
        b=p/SEavXvStHft7DT5iPsgmogEQi+hRnswGKg8qN1BOd1IA7n5DUlTeLy4D07eC6nHI
         GXlzfgbiLs6WGSgFEDDB5PaJHf9+z739V0rIt3Jg2VtnV8dO3Yby9TvEuHHUPKV5aIUf
         Llb/R8fcrLK8indeCyU4Rs1dOJsheZhPAeu9u58uGd684ZMkc49/Qnp7PKFctbOSGn6P
         LeXL7mNnjQoBDmbvWG5nHPQ/vCkhD4QR5zJhT/Prri59NRU+cW9LNFWLau+eJmZSzPZc
         Zvy1PLLE1G+RUjaAgWNKTFCxvhc8k3nXVRJVIz+rWrjcUZ5AbpZ51gg8Pxiq5zPHypra
         jQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700079; x=1698304879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/caEF9HzcleOEHwneLp6tiCcjo0T3AFNH3jEPiF4Apg=;
        b=mru9LuEPxSUzbjBlPA3Q4V8T0V7iEa80wIV3rIqQJoJQmsmpsAY4Jsj07TFuwVLkUq
         Rj6RnEw/VhxZc1gwiQSNYCJqIkVXecjYtFYCABUmY+JThc+Z5l0EkJwI6Y5bUT+2mEIY
         KmQpXlqsA4/evzsrU/sr/eVuJOWo/7Rn88wAC+YCmLSOSLy2kPePL4PrWLN3Fw/frHUB
         2/6z0AxDKyohRCNHFOcWdi3eY4zFQrmhucLTWfe2bxFB9Lg+J6ZGPLUSQHaDCnz6KNrR
         b8LsCfoJz3njNYo5jcBa8MdgIQqtsst5DgZyKECMF+xBb29nE4S5eDq8EnjfIiw3mb5v
         eqBA==
X-Gm-Message-State: AOJu0Yy6hRJOoDB+rfEkkWBAtp5wUwD6CeQMwOj4ZVhLNeelBL0cKmjp
	s5fXhlPiXA2LY5EpENzrC8nbEA==
X-Google-Smtp-Source: AGHT+IEFXAbxxObWsDg43i5JytX4bz0tF34qGuIzEM5TAcp0MRy/O+CrNP01uiR3b1KPRaXNmbiEQQ==
X-Received: by 2002:a05:6870:b14:b0:1e9:adec:bf5e with SMTP id lh20-20020a0568700b1400b001e9adecbf5emr1951115oab.2.1697700079549;
        Thu, 19 Oct 2023 00:21:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id k4-20020a63ba04000000b0057412d84d25sm2436010pgf.4.2023.10.19.00.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 00:21:18 -0700 (PDT)
Message-ID: <be86086b-7b1e-48b5-98e1-e1cd077cf3bb@rivosinc.com>
Date: Thu, 19 Oct 2023 09:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto
 ISA extensions
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-4-cleger@rivosinc.com>
 <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_002122_370944_7B359170 
X-CRM114-Status: GOOD (  14.27  )
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

CgpPbiAxOC8xMC8yMDIzIDE5OjI0LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE3
LCAyMDIzIGF0IDY6MTXigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBFeHBvcnQgdGhlIGZvbGxvd2luZyBzY2FsYXIgY3J5cHRvIGV4dGVuc2lv
bnMgdGhyb3VnaCBod3Byb2JlOgo+Pgo+PiAtIFpia2IKPj4gLSBaYmtjCj4+IC0gWmJreAo+PiAt
IFprbmQKPj4gLSBaa25lCj4+IC0gWmtuaAo+PiAtIFprc2VkCj4+IC0gWmtzaAo+PiAtIFprdAo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICB8IDMwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCB8IDEwICsrKysrKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2
LmMgICAgICAgICB8IDEwICsrKysrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0
IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+PiBpbmRleCBhNTI5OTZiMjJmNzUu
Ljk2ODg5NTU2MmQ0MiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2Jl
LnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4+IEBAIC03Nyw2
ICs3NywzNiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4+ICAgICogOmM6bWFj
cm86YFJJU0NWX0hXUFJPQkVfRVhUX1pCU2A6IFRoZSBaYnMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCwgYXMgZGVmaW5lZAo+PiAgICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBCaXQtTWFuaXB1
bGF0aW9uIElTQSBleHRlbnNpb25zLgo+Pgo+PiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0VYVF9aQkNgIFRoZSBaYmMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5lZAo+PiAr
ICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25z
Lgo+IAo+IEF0IGxlYXN0IGluIG15IHYxLjAuMSB2ZXJzaW9uIG9mIHRoZSBjcnlwdG8gc2NhbGFy
IHNwZWMsIEkgZG9uJ3Qgc2VlCj4gWmJjLiBUaGF0IHNlZW1zIHRvIGJlIGRlZmluZWQgaW4gdGhl
IGJpdCBtYW5pcHVsYXRpb24gZXh0ZW5zaW9ucy4KClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcywg
dGhpcyBzaG91bGQgYmUgc2FtZSB0aGFuIHRoZSBwcmV2aW91cyBsaW5lLiBJCndpbGwgYWN0dWFs
bHkgbW92ZSB0aGUgWkJDIG9uIGFub3RoZXIgcGF0Y2ggc2luY2UgaXQgaXMgbm90IHNjYWxhciBj
cnlwdG8uCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
