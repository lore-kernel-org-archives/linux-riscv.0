Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDEC00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0VN7v6+j4Af7/4pB5iksdtnTUYb8cRv8lHGNPZwsEQ=; b=lwWLV9ZVJef99y
	9+LQq5TCE20ueKfLksotHP2xb1mu8rIuyhz7NyVT5SbCSM1xuVGhJN/4kUfSBnZdUdi+qpvq+6GCY
	YzUVsvJD+zNEuLwpS+9TUKT2J28e8VUA93ZIXKVen9u9ucXjvQ//fP8N5jD2sNl98rUtAP/GCqcox
	wDDWaaCV7lN4xgqY51oOdpONNh6V/j1vht0YaYwmVAu5SlHQb+49yrbrBOGqUecFyJW7Vrul14VrX
	b0Lw0Jy7lOXzzXRCwRp8cv+la6j7X4F7reeCnykVUwsjfd9o0hpfjgfwMFwIu2XHYpeWpx1nG0Cqs
	Wsn3Dw+VPVITurc9gorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvBgV-00944P-1U;
	Tue, 24 Oct 2023 07:18:39 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvBgR-00943m-2C
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 07:18:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c519eab81fso8927961fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 00:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698131912; x=1698736712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRIlhtIeb1YFd4JwPYh+w2xPq7Nr26Cx3E5/ZUd7zEA=;
        b=tTdujWs7Yx69FzosIxKoXLVrYk+RPYLWB7sXuerNtXblK5tk/ACoF0RJNQipPNZ8gw
         hpHB8N2askFmeQNvP2IxndaWGOwkDVl4ehQLYKBHIcSldxOyYo6LPK3mfTYGJBbh8onZ
         TicqG4dAQ6hdv2XGTidpvT6WyNz1hI9Ay1i1n9GoRQsWcIizRdbUF5vjfEmBDD6ZrjIL
         kRQs+4tKOZ9/uZn3eAlMknI0EcCl8G7L6Ke1t6FRcTJAwwl+WQmFeozzM71Tnqd4QS2w
         G3kiTRCH/B1D6a444fuj1DSrpvqAU7Gr3PIHxYMTuMj7BIOcuWirH6l9wez8Gvwmo48T
         NfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698131912; x=1698736712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRIlhtIeb1YFd4JwPYh+w2xPq7Nr26Cx3E5/ZUd7zEA=;
        b=eXmvyTNHIkpyYHzjqfOleGDcHs0hpsLDh/qXdOZBBCDXp4MV3/HMbHg0dCtjYCqnjZ
         ihMUoHoM9cMwHOITe9dSs0s7iZow6IfBaj916nXb/ci3Wy7QVHRT/3VruuMVzdaqOPFN
         55anz3s2W+Ow7PZQHbRg/pQ04ws8hMKp1+aUpi4LsZhtwFX1kZOiiRKEd6Wiecn/4Rc9
         YdTYqDEccVkCY5ZvHM6snhD/p6frOmyonOFkqIC4o7FQH3NB26uQ38I98vrmLh4k901e
         r+NoK9WbOCR3DECTjAD7EFyl0sK+4qjKU6RHIk2WSIryobgOU49NTl8HDHfzq7F9aXvP
         t+Gg==
X-Gm-Message-State: AOJu0YxUVtWwkleKh035p8oA0tZKnL46qJ9umVwICzZjiGET1WhsIIc6
	Iq8bvjvZVQYStZ3+2HYku8qNRA==
X-Google-Smtp-Source: AGHT+IFC45ilAg3tRrLMb0mEc7pz2FsUd3r5wo9psNP7TVo1+HLGBSK/Yy4GORF6XAP+cC+mEVQGng==
X-Received: by 2002:a2e:91c1:0:b0:2c5:18a0:6c2e with SMTP id u1-20020a2e91c1000000b002c518a06c2emr8406164ljg.0.1698131912513;
        Tue, 24 Oct 2023 00:18:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4587000000b0032db430fb9bsm9278279wrq.68.2023.10.24.00.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:18:32 -0700 (PDT)
Message-ID: <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
Date: Tue, 24 Oct 2023 09:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar
 crypto
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_001835_957077_6072EB1B 
X-CRM114-Status: GOOD (  11.88  )
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

CgpPbiAyMy8xMC8yMDIzIDE4OjIxLCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE3
LCAyMDIzIGF0IDY6MTXigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBGcm9tOiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPj4KPj4g
VGhlIFNjYWxhciBDcnlwdG8gc3BlY2lmaWNhdGlvbiBkZWZpbmVzIFprIGFzIGEgc2hvcnRoYW5k
IGZvciB0aGUKPj4gWmtuLCBaa3IgYW5kIFprdCBleHRlbnNpb25zLiBUaGUgc2FtZSBmb2xsb3dz
IGZvciBib3RoIFprbiwgWmtzIGFuZCBaYmssCj4+IHdoaWNoIGFyZSBhbGwgc2hvcnRoYW5kcyBm
b3IgdmFyaW91cyBvdGhlciBleHRlbnNpb25zLiBUaGUgZGV0YWlsZWQKPj4gYnJlYWtkb3duIGNh
biBiZSBmb3VuZCBpbiB0aGVpciBkdC1iaW5kaW5nIGVudHJpZXMuCj4+Cj4+IFNpbmNlIFprbiBh
bHNvIGltcGxpZXMgdGhlIFpia2IsIFpia2MgYW5kIFpia3ggZXh0ZW5zaW9ucywgc2ltcGx5IHBh
c3NpbmcKPj4gInprIiB0aHJvdWdoIGEgRFQgc2hvdWxkIGVuYWJsZSBhbGwgb2YgWmJrYiwgWmJr
YywgWmJreCwgWmtuLCBaa3IgYW5kIFprdC4KPj4gRm9yIGV4YW1wbGUsIHNldHRpbmcgdGhlICJy
aXNjdixpc2EiIERUIHByb3BlcnR5IHRvICJydjY0aW1hZmRjX3prIgo+PiBzaG91bGQgZ2VuZXJh
dGUgdGhlIGZvbGxvd2luZyBjcHVpbmZvIG91dHB1dDoKPj4gInJ2NjRpbWFmZGNfemljbnRyX3pp
Y3NyX3ppZmVuY2VpX3ppaHBtX3pia2JfemJrY196Ymt4X3prbmRfemtuZV96a25oX3prcl96a3Qi
Cj4+Cj4+IHJpc2N2X2lzYV9leHRfZGF0YSBncm93cyBhIHBhaXIgb2YgbmV3IG1lbWJlcnMsIHRv
IHBlcm1pdCBzZXR0aW5nIHRoZQo+PiByZWxldmFudCBiaXRzIGZvciAiYnVuZGxlZCIgZXh0ZW5z
aW9ucywgYm90aCB3aGlsZSBwYXJzaW5nIHRoZSBJU0Egc3RyaW5nCj4+IGFuZCB0aGUgbmV3IGRl
ZGljYXRlZCBleHRlbnNpb24gcHJvcGVydGllcwo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gCj4gTXkgdHJlZSBtaWdodCBiZSBvdXQg
b2Ygc3luYywgYnV0IGluIG15IHNlYXJjaCBmb3IgcmlzY3ZfaXNhX2V4dCwgSQo+IGFsc28gZm91
bmQgYSB1c2UgaW4gcHJpbnRfaXNhKCkgKGNwdS5jKSB3aGVyZSB3ZSdyZSByZWFjaGluZyBpbnRv
Cj4gcmlzY3ZfaXNhX2V4dFtdLmlkIGFuZCBhc3N1bWluZyBpdCdzIGFsd2F5cyB2YWxpZC4gSWYg
dGhhdCdzIHN0aWxsIGluCj4gdGhlcmUgd2UnbGwgd2FudCB0byBmaXggdXAgdGhhdCBzcG90IHRv
bywgc2luY2Ugbm93IHdpdGggYnVuZGxlcyAuaWQKPiBtYXkgb3IgbWF5IG5vdCBiZSB2YWxpZC4K
Ck9oIGluZGVlZCwgdGhlIGFycmF5IGlzIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGNvbXBpbGF0
aW9uIHVuaXQgOi8uCkknbGwgY2hlY2sgdGhhdCBiZWZvcmUgc2VuZGluZyBWMy4KCkNsw6ltZW50
Cgo+IAo+IC1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
