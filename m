Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD06C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IH6UhlnMmXyX8B9EJcEHNngthvkL57MwgsXWDX3fTdM=; b=X8664eCnu2mRcx
	QrPteZp4K9Tm7NGQPvGZbbgT3/MddnSImUYuWwYjtfVnmsQECLmJKSsld0DeyV60dOW6Nk/BwGy9T
	y3Norc9dLavbG68NpcCmZXTDSHJ8pSYtXRbb7NYbsenhFnKUyyv9pdKxAerJ8r+TSIxK0O0JC67Ur
	h/Ed9GaqvqdIPV4w7fYwX6NhmaTS08W/NUV7a2BY2527PWXrSTxCSPJOVn6ZSQNZS1tc55TamXUz5
	uc35ECFvWzi6eVPvhDAPMwTd5LKXmvZ9xxOe6OuZ17nAcNavw3ibpdgWuA6yua52JQ5wiKnbSgNyF
	cWuQ9+J5KP46eYeVBN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qup9J-006ca9-2l;
	Mon, 23 Oct 2023 07:14:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qup9G-006cZQ-1M
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 07:14:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32da02fca9aso603023f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 00:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698045288; x=1698650088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26tPvjduKfKMC5Y+TnU+2kouKBcEVMva4kAveFGyFik=;
        b=uX7dcU024d79xSH1Bl9+SC7mG/QwenyGQTNDlxw7MlPHHkIK7Ozgi3HzjE4M20kT/N
         s+xSi473ay2hwYERRuPB8UT6DkAQegA6UbsRzfjfb/sRCP8z9w5mB3vku+K53GIZBiIc
         Jvjo6M9FCeEGwLI+6AyNa05rpXg4CbSBqVJkjQA3DaLbT4qcjPe3A4HAuyWUYw08RiGN
         ClT4ZIdfm/6/XxdYxN7+5N4VbxCt+X/2DhRVNCUHUeMHx2p0yCBDYCNvg6b3+BQ0CR5C
         x8ItO6HJptanHv27AEFGswAn/EEPYXIvPiVG4X3o7Ldqm4pojW16usT6IC6zCzaNld2Z
         zwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698045288; x=1698650088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26tPvjduKfKMC5Y+TnU+2kouKBcEVMva4kAveFGyFik=;
        b=H5wZXrFnUXQeWyrcr32cvOjgWoTOzRTXrI7p40rM11WgiJflAlc4KRfGIYvvL/CI+n
         dJENk86H7fIkv/RHM1o4HypnELEoDBMMzooHjdtUtAnJrLodb+3ZRrC/Q5vXPFyO7n+Q
         grCRA7rNI9z7ukD85/qhoUF7dCeHu8qe/ia7aJMWkAzmaNXSdHpEmqDaq5lsY83JDNkz
         glSfI4MU517p07OzEUbvip3T5CMYSr+vROTFtI+uU44/Xh7g1CiTovb+64D/1FaQ58zf
         Wou5uf/BDrQtHUBBScRnBgeUIQ4OBFUm8mWn3plb8tPyz+JDab/JzU7bzOqeGYm5yV5F
         +iPg==
X-Gm-Message-State: AOJu0YyaiXqSMxIDis7fje1GBNpgav74Gn7qYVcFtW+vogVCUWF5ZnLF
	5001Mf2joujXcl/dWMWpl623tA==
X-Google-Smtp-Source: AGHT+IH6cqD8gxFinz+iQF08GyX6MMtj6EnWvLXSKTAQz1NuASZ3GUeBRA+mRrbDkbRJAMkzxsQenQ==
X-Received: by 2002:adf:a356:0:b0:32d:c293:1ab4 with SMTP id d22-20020adfa356000000b0032dc2931ab4mr5018430wrb.6.1698045287746;
        Mon, 23 Oct 2023 00:14:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc? ([2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc])
        by smtp.gmail.com with ESMTPSA id r8-20020adff108000000b0032db1d741a6sm7144610wro.99.2023.10.23.00.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 00:14:47 -0700 (PDT)
Message-ID: <c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.com>
Date: Mon, 23 Oct 2023 09:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: 7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
 <E30E7352-1FB0-4DB5-94C3-2C6FC2A6F484@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <E30E7352-1FB0-4DB5-94C3-2C6FC2A6F484@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_001450_682345_80421205 
X-CRM114-Status: GOOD (  14.77  )
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

CgpPbiAyMC8xMC8yMDIzIDA0OjQzLCBKZXJyeSBTaGloIHdyb3RlOgo+IE9uIE9jdCAxOSwgMjAy
MywgYXQgMTc6MzUsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4+IE9uIDE4LzEwLzIwMjMgMTk6MjYsIEV2YW4gR3JlZW4gd3JvdGU6Cj4+PiBPbiBXZWQsIE9j
dCAxOCwgMjAyMyBhdCA1OjUz4oCvQU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIDE4LzEwLzIwMjMgMDM6NDUsIEplcnJ5IFNoaWggd3Jv
dGU6Cj4+Pj4+Cj4+Pj4+IFRoZSBgWnZrYmAgaXMgdGhlIHN1YnNldCBvZiBgWnZiYmBbMV0uIFNv
LCB0aGUgYFp2a2JgIHNob3VsZCBiZSBidW5kbGVkIHdpdGggYFp2YmJgLgo+Pj4+Cj4+Pj4gSGkg
SmVycnksCj4+Pj4KPj4+PiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMsIEkgdGhpbmsgc29tZSBv
dGhlciBleHRlbnNpb25zIHdpbGwgZmFsbCBpbgo+Pj4+IHRoaXMgY2F0ZWdvcnkgYXMgd2VsbCB0
aGVuIChadmtuaGEvWnZrbmhiKS4gSSB3aWxsIHZlcmlmeSB0aGF0Lgo+Pj4KPj4+IFRoZSBidW5k
bGluZyBtZWNoYW5pc20gd29ya3Mgd2VsbCB3aGVuIGFuIGV4dGVuc2lvbiBpcyBhIHB1cmUgbGFz
c28KPj4+IGFyb3VuZCBvdGhlciBleHRlbnNpb25zLiBXZSdkIGhhdmUgdG8gdHdlYWsgdGhhdCBj
b2RlIGlmIHdlIHdhbnRlZCB0bwo+Pj4gc3VwcG9ydCBjYXNlcyBsaWtlIHRoaXMsIHdoZXJlIHRo
ZSBleHRlbnNpb24gaXMgYSBzdXBlcnNldCBvZiBvdGhlcnMsCj4+PiBidXQgYWxzbyBjb250YWlu
cyBsb29zZSBjaGFuZ2Ugbm90IHByZXNlbnQgYW55d2hlcmUgZWxzZSAoYW5kCj4+PiB0aGVyZWZv
cmUgYWxzbyBuZWVkcyB0byBzdGFuZCBhcyBhIHNlcGFyYXRlIGJpdCkuCj4+Cj4+IEZvciBadmJi
IGFuZCBadmtuaGIsIEkgdXNlZCB0aGUgZm9sbG93aW5nIGNvZGU6Cj4+Cj4+IHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9idW5kbGVkX2V4dHNbXSA9IHsKPj4gCVJJU0NWX0lT
QV9FWFRfWlZLQiwKPj4gCVJJU0NWX0lTQV9FWFRfWlZCQgo+PiB9Owo+Pgo+PiBzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25oYl9idW5kbGVkX2V4dHNbXSA9IHsKPj4gCVJJU0NW
X0lTQV9FWFRfWlZLTkhBLAo+PiAJUklTQ1ZfSVNBX0VYVF9aVktOSEIKPj4gfTsKPj4KPj4gV2hp
Y2ggY29ycmVjdGx5IHJlc3VsdHMgaW4gYm90aCBleHRlbnNpb24gKHN1cGVyc2V0ICsgYmFzZSBz
ZXQpIGJlaW5nCj4+IGVuYWJsZWQgd2hlbiBvbmx5IG9uZSBpcyBzZXQuIElzIHRoZXJlIHNvbWV0
aGluZyB0aGF0IEknbSBtaXNzaW5nID8KPiAKPiBXZSBzaG91bGQgbm90IGJ1bmRsZSB6dmtuaGEg
YW5kIHp2a25oYiB0b2dldGhlci4gVGhleSBhcmUgZXhjbHVzaXZlLgoKWWVzLCBidXQgZm9yIGlu
c3RhbmNlLCB3aGF0IGhhcHBlbnMgaWYgdGhlIHVzZXIgcXVlcnkgdGhlIHp2a25oYSAoaWYgaXQK
b25seSBuZWVkcyBTSEEyNTYpIGJ1dCB6dmtuaGIgaXMgcHJlc2VudC4gSWYgd2UgZG9uJ3QgZGVj
bGFyZSB6dmtuaGEsCnRoZW4gaXQgd2lsbCBmYWlsIGJ1dCB0aGUgc3VwcG9ydCB3b3VsZCBhY3R1
YWxseSBiZSBwcmVzZW50IGR1ZSB0bwp6dmtuaGIgYmVpbmcgdGhlcmUuCgpDbMOpbWVudAoKCj4g
UGxlYXNlIGNoZWNrOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1jcnlwdG8vaXNz
dWVzLzM2NCNpc3N1ZWNvbW1lbnQtMTcyNjc4MjA5Ngo+IAo+IC1KZXJyeQo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
