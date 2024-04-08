Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B59CC67861
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cSTKTxc25+3dE8jqxWwtckusMK8vCTFZJtvr/UK334=; b=EgOvdCPIlxyV22
	DFNSP0i8gXkAH1pPgSacKbNLpeXAazaVnAovChTT++cbrsdXzoM5ItRkY1q3vagizApYO184ZjxG+
	BpqtexNBl5UlNi/QzPMA9VgHCGQxtv+zhfAQtT1YmYNP8fovYpst8fDF+KzPMjl68PBwzgHOUmheR
	Ie0FRsflZkEnrLoMO/PKdKv7iNfZnrc1kOMCUffGyOxbQ/zAXkxtE82cziw1640AMJdZMQv/2miOH
	oJE9l8uR12D1T+HRq1Td2yCMLwljb3fjoWOBhZ5/MErE4HWUw/BboNHXbPHHqmcpbOjVuxevR0eew
	NYWd4ETyugcO1Z5vgXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjwR-0000000EoON-1Z0T;
	Mon, 08 Apr 2024 08:01:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjwL-0000000EoMg-0Ygp
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 08:01:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-416463e82fbso1612575e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712563275; x=1713168075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEXus2Ynno1AeuPQLNpTk8iPF9Mbvy8RxA45xKLQHC0=;
        b=VWpt4laVeNMV4RmlJ1DDcKK165jqp0GFlV2kRJJPRE1nIxf1p1oFLkHu/DoGLRTJB5
         HC800MHL4v14sWbQbJUYBFSANZPDG2TJEvi6oUSqGSEcZSGfAv1CVIT3nUfKvWi5cxNz
         nbep+hg0rWiCigWnIl5jZVJ+CmTOw1zTtRRwx2mAe70qB+G7ROKOhNOUtfaeA/CKkJzb
         qenkMHArhpX/avpsj3PZ7AtuLHhYlgJS1OKVJqyQtxvDutcsEGFXfHjjuJt7NPdshkaS
         A4el407ucHJfYg7fvc3khD6ewSE7t1fRz92RjMJtIB377PxuV9b22JSf/wlIIDU2NmIS
         V3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563275; x=1713168075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEXus2Ynno1AeuPQLNpTk8iPF9Mbvy8RxA45xKLQHC0=;
        b=JFIxf84/jhtcAq3xI1VcEnTcp7fhLYs3yRZgR64bWFN7KLdp//50Pn56KoNbRWpyq1
         aNDk0c+75vtbfS/duuuAMcFMmQu4Li4oR6LuUsIk9jyO9wlo4B8UUGOaYsoFaoOmjpeg
         3m6SSuZO3fKCBypjdfShGUgFzajGCVRsmRag0e2T5KkYb3N6eSKswqcWFGTFP/U/F+8k
         0/etGLc+FkUbxz5ORknrRjun0gLR/59JRn0HKSO4EhrpgWkFP9LwaQtqW1MR+KPOYZSw
         JOb1G1b9LPTsqnc2+pyUUNZ+bMxnltBCBVmfZE4Lxo1KlL0XDVwsD6Wq4eMC+XxcGh9t
         FRlg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5neeCTLuroUeArbAQO86qXMePBKwg/bfVQeJDlgUbSwRFL2DCNSe5DakWFggANfXd/9bfHoWeSogf9amFNpAYgfGLR7fRCA3bXM9qhTd
X-Gm-Message-State: AOJu0YyR+lJWdAgEuvReoipe3QqoE0nIOKZqa9B8VSFUPLHSeHS4W71X
	C+dP43XMm5G9KRyV1vwhr/DvFF8JPT5miaj9Xi4P66gHuJck6bw/jcoTzQqPrk0=
X-Google-Smtp-Source: AGHT+IEQUCd5IWDe0mYq0rDe9VUQhrgm0s8IGNzOcuAIRUoN4LcKFabia6A+gxLsv3jGCmScuNsjTA==
X-Received: by 2002:a05:600c:3b96:b0:416:7b2c:df09 with SMTP id n22-20020a05600c3b9600b004167b2cdf09mr834824wms.1.1712563274884;
        Mon, 08 Apr 2024 01:01:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6327:edd6:6580:3ead? ([2a01:e0a:999:a3a0:6327:edd6:6580:3ead])
        by smtp.gmail.com with ESMTPSA id n32-20020a05600c3ba000b00415612e29a1sm12515475wms.30.2024.04.08.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:01:13 -0700 (PDT)
Message-ID: <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
Date: Mon, 8 Apr 2024 10:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
To: Deepak Gupta <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
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
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_010117_332818_BFF1D435 
X-CRM114-Status: GOOD (  21.06  )
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

CgpPbiAwNS8wNC8yMDI0IDE5OjMzLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gRnJpLCBBcHIg
NSwgMjAyNCBhdCA4OjI24oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgQXByIDA0LCAyMDI0IGF0IDEyOjMyOjQ2UE0gKzAyMDAs
IENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+IFRoZSBaaW1vcCBJU0EgZXh0ZW5zaW9uIHdhcyBy
YXRpZmllZCByZWNlbnRseS4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0Cj4+PiBmb3IgcGFyc2lu
ZyBpdCBmcm9tIHJpc2N2LGlzYSwgaHdwcm9iZSBleHBvcnQgYW5kIGt2bSBzdXBwb3J0IGZvcgo+
Pj4gR3Vlc3QvVk0uCj4+Cj4+IEknbSBub3Qgc3VyZSB3ZSBuZWVkIHRoaXMuIFppbW9wIGJ5IGl0
c2VsZiBpc24ndCB1c2VmdWwsIHNvIEkgZG9uJ3Qga25vdwo+PiBpZiB3ZSBuZWVkIHRvIGFkdmVy
dGlzZSBpdCBhdCBhbGwuIFdoZW4gYW4gZXh0ZW5zaW9uIGNvbWVzIGFsb25nIHRoYXQKPj4gcmVk
ZWZpbmVzIHNvbWUgTU9QcywgdGhlbiB3ZSdsbCBhZHZlcnRpc2UgdGhhdCBleHRlbnNpb24sIGJ1
dCB0aGUgZmFjdAo+PiBaaW1vcCBpcyB1c2VkIGZvciB0aGF0IGV4dGVuc2lvbiBpcyByZWFsbHkg
anVzdCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuCj4gCj4gT25seSBzaXR1YXRpb24gSSBzZWUg
dGhpcyBjYW4gYmUgdXNlZnVsIGlzIHRoaXM6LS0KPiAKPiBBbiBpbXBsZW1lbnRlciwgaW1wbGVt
ZW50ZWQgWmltb3BzIGluIENQVSBzb2xlbHkgZm9yIHRoZSBwdXJwb3NlIHRoYXQgdGhleSBjYW4K
PiBydW4gbWFpbmxpbmUgZGlzdHJvICYgcGFja2FnZXMgb24gdGhlaXIgaGFyZHdhcmUgYW5kIGRv
bid0IHdhbnQgdG8gbGV2ZXJhZ2UgYW55Cj4gZmVhdHVyZSB3aGljaCBhcmUgYnVpbHQgb24gdG9w
IG9mIFppbW9wLgoKWWVzLCB0aGUgcmF0aW9uYWxlIHdhcyB0aGF0IHNvbWUgYmluYXJpZXMgdXNp
bmcgZXh0ZW5zaW9ucyB0aGF0IG92ZXJsb2FkCk1PUHMgY291bGQgc3RpbGwgYmUgcnVuLiBXaXRo
IFppbW9wIGV4cG9zZWQsIHRoZSBsb2FkZXIgY291bGQgZGV0ZXJtaW5lCmlmIHRoZSBiaW5hcnkg
Y2FuIGJlIGV4ZWN1dGVkIHdpdGhvdXQgcG90ZW50aWFsbHkgY3Jhc2hpbmcuIFdlIGNvdWxkCmFs
c28gbGV0IHRoZSBwcm9ncmFtIHJ1biBhbnl3YXkgYnV0IHRoZSBleGVjdXRpb24gY291bGQgcG90
ZW50aWFsbHkKY3Jhc2ggdW5leHBlY3RlZGx5LCB3aGljaCBJTUhPIGlzIG5vdCByZWFsbHkgZ29v
ZCBmb3IgdGhlIHVzZXIKZXhwZXJpZW5jZSBub3IgZm9yIGRlYnVnZ2luZy4gSSBhbHJlYWR5IHRo
aW5rIHRoYXQgdGhlIHNlZ2ZhdWx0cyB3aGljaApoYXBwZW5zIHdoZW4gZXhlY3V0aW5nIGJpbmFy
aWVzIHRoYXQgbmVlZCBzb21lIG1pc3NpbmcgZXh0ZW5zaW9uIGFyZSBub3QKc28gZWFzeSB0byBk
ZWJ1Zywgc28gYmV0dGVyIGFkZCBtb3JlIGd1YXJkcy4KCj4gCj4gQXMgYW4gZXhhbXBsZSB6aWNm
aWxwIGFuZCB6aWNmaXNzIGFyZSBkZXBlbmRlbnQgb24gemltb3BzLiBnbGliYyBjYW4KPiBkbyBm
b2xsb3dpbmcKPiAKPiAxKSBjaGVjayBlbGYgaGVhZGVyIGlmIGJpbmFyeSB3YXMgY29tcGlsZWQg
d2l0aCB6aWNmaXNzIGFuZCB6aWNmaWxwLAo+IGlmIHllcyBnb3RvIHN0ZXAgMiwgZWxzZSBnb3Rv
IHN0ZXAgNi4KPiAyKSBjaGVjayBpZiB6aWNmaXNzL3ppY2ZpbHAgaXMgYXZhaWxhYmxlIGluIGh3
IHZpYSBod3Byb2JlLCBpZiB5ZXMKPiBnb3RvIHN0ZXAgNS4gZWxzZSBnb3RvIHN0ZXAgMwo+IDMp
IGNoZWNrIGlmIHppbW9wIGlzIGF2YWlsYWJsZSB2aWEgaHdwcm9iZSwgaWYgeWVzIGdvdG8gc3Rl
cCA2LCBlbHNlIGdvdG8gc3RlcCA0CgpJIHRoaW5rIHlvdSBtZWFudCBzdGVwIDUgcmF0aGVyIHRo
YW4gc3RlcCA2LgoKQ2zDqW1lbnQKCj4gNCkgVGhpcyBiaW5hcnkgd29uJ3QgYmUgYWJsZSB0byBy
dW4gc3VjY2Vzc2Z1bGx5IG9uIHRoaXMgcGxhdGZvcm0sCj4gaXNzdWUgZXhpdCBzeXNjYWxsLiA8
LS0gdGVybWluYXRpb24KPiA1KSBpc3N1ZSBwcmN0bCB0byBlbmFibGUgc2hhZG93IHN0YWNrIGFu
ZCBsYW5kaW5nIHBhZCBmb3IgY3VycmVudCB0YXNrCj4gPC0tIGVuYWJsZSBmZWF0dXJlCj4gNikg
bGV0IHRoZSBiaW5hcnkgcnVuIDwtLSBsZXQgdGhlIGJpbmFyeSBydW4gYmVjYXVzZSBubyBoYXJt
IGNhbiBiZSBkb25lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
