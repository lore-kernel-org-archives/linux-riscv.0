Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC28C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a83ppaLIt45bhmIMdTLIQOE3YBk4wcCsMh5SmV9i9pM=; b=ilH7xdT1zkK0r+
	BRFPFWsoUna1rDzLnnup9whyOp+dOTzmI0U+4YxQl1LZ+OoxeVZnoxsluBw5+oGCTSe89DVDIurL1
	k0GajFp58ihmeaJDAOImDNr/AaBFlXVaeJgEDd4Rxcg/aJO9jDBEgu2M79hKlJknrFH2P4BeLFGkG
	ATPqjMd1QD+u+Tq3XoupF+lOY7UWNLUuR4KsmNBkvZnw/ZP4TJJ145jre7F/KQhxChyjSJJhNJlMr
	GVRh4VJFQ2Rqn16CC4FP+PT+DjQHhwVEMRtXOK7e3uiptnjyJlOA+rfvLvrcqO6M2PGL8dDrGL5i3
	L1yjFOQephXe8v+RSj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOwW-006V4u-HY; Tue, 22 Nov 2022 08:47:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOwU-006Uwq-5Z
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:47:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id s24so17131028ljs.11
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVyULofyXcnVVQ29vB0Fko3SwHgoM4faRFcX0yYLiSg=;
        b=LLjsjh325lx3Ti3P8ylbumojC9SaeLhxq9yEV0Q0SYfFQK5mGtZk+nObijV1kB+VVw
         3bXGTyizOVpbY4Bd1q0DMHkF5f8iB9R07KTEkpBUWl4BcgWCSTHc/O0mVCs+qCQLWIA8
         HgwdruD1rJo8CnOjo6Kv5cxkt1inlFBsl0+Ck/yd3F9Y5JbEq7Iwj160Jf+O5OyXzEKx
         J+gMFN1dnt/nI/XKsgJvJNn7Dzu9+NXYMsjK9uLw8EA9H5wz7tiUQpI1FTwF3rU9xctL
         VLa6UElvOQK1EwiaJji5baNFknS9WtFELui4kkgJNnqEp+v6u8Ss1MfaixIfyrqt7x7I
         CKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVyULofyXcnVVQ29vB0Fko3SwHgoM4faRFcX0yYLiSg=;
        b=dS0R4FOynrPvv3rtkEUwaOoRrPHoawaKkCYSFxtg8BU4AYiWqCIZVmX8b5dcCoTwHx
         /YYKMETV4pAJ0L82tdCrDLc+4mzDGW2QNwk6jEY8vsqAL9PimFQfpTnhoMhjpvfRnU5h
         ovhaVevtKXTomBGJael2zlmwOFjn70igIFssa+VGwdQEj5+vBMTkljIbITV9vqqpfmnc
         sIiLpVofE8TYfvkSJ3P/CmkwH+KmKr8zWDV4hC/A3xdPRboX0RZCpH6OSHQ2ErbWQR05
         9YAWPYchvy4o0hLDzlbfncV+tqHsf1F0eJpfx+d6s3N68KaD+s/96oocYyIuViSyu31K
         zPhw==
X-Gm-Message-State: ANoB5pmkllhNTIG6euGoKG5JXzA9isbYMCqejWwGNvhgAUz6ovxc0U6E
	ajQ+o+yuyw8mWJLXhTgI2jHtrg==
X-Google-Smtp-Source: AA0mqf7k5iwY141yncd+8E0m1ND/kel/yIq78tBa2St5zPKWuRN693lQjtLUesOm2KUbPH4OKCzj3w==
X-Received: by 2002:a2e:a4b4:0:b0:26c:5cf3:cc89 with SMTP id g20-20020a2ea4b4000000b0026c5cf3cc89mr7258771ljm.483.1669106863018;
        Tue, 22 Nov 2022 00:47:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e7007000000b0027776efa48csm1784076ljc.91.2022.11.22.00.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:47:42 -0800 (PST)
Message-ID: <46ce4cdd-45c4-3470-d89c-b58219d90838@linaro.org>
Date: Tue, 22 Nov 2022 09:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004746_288429_C0BE640D 
X-CRM114-Status: GOOD (  16.00  )
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

T24gMjIvMTEvMjAyMiAwODo0MSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiAKPiAKPiDkuo4gMjAy
MuW5tDEx5pyIMjLml6UgR01UKzA4OjAwIOS4i+WNiDM6MzU6NDgsIEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4g5YaZ5YiwOgo+PiBPbiAyMi8xMS8y
MDIyIDA4OjE4LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4g5ZyoIDIwMjItMTEtMjHmmJ/mnJ/k
uIDnmoQgMTE6MDYgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ6YGT77yaCj4+Pj4gT24g
MjEvMTEvMjAyMiAwNToxNywgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+Pj4gVC1IZWFkIE9wZW5D
OTA2IGlzIGEgb3Blbi1zb3VyY2UtbGljZW5zZWQgZml4ZWQtY29uZmlndXJhdGlvbiBvZgo+Pj4+
PiBDOTA2LAo+Pj4+PiB3aGljaCBpcyBub3cgcHVibGljIGFuZCBhYmxlIHRvIGJlIGludGVncmF0
ZWQuCj4+Pj4+Cj4+Pj4+IEFkZCBhIGNvbXBhdGlibGUgZm9yIHRoZSBDTElOVCBzaGlwcGVkIGFz
IHBhcnQgb2YgT3BlbkM5MDYsIHdoaWNoCj4+Pj4+IHNob3VsZAo+Pj4+PiBqdXN0IGJlIG9yZGlu
YXJ5IEM5eHggQ0xJTlQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcg
PHV3dUBpY2Vub3d5Lm1lPgo+Pj4+PiAtLS0KPj4+Pj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCAxICsKPj4+Pj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdAo+Pj4+PiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+
Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xp
bnQueWFtbAo+Pj4+PiBpbmRleCBhYWRhNjk1NzIxNmMuLjg2NzAzZTk5NWUzMSAxMDA2NDQKPj4+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxj
bGludC55YW1sCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+Pj4+PiBAQCAtMzUsNiArMzUsNyBAQCBwcm9wZXJ0aWVz
Ogo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzaWZpdmUsY2xpbnQwCj4+Pj4+
IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHRoZWFkLG9wZW5jOTA2LWNsaW50
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3VuMjBpLWQx
LWNsaW50Cj4+Pj4KPj4+PiBBZGQgZW50cmllcyBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkuIFRoaXMg
c2hvdWxkIGJlIHNxdWFzaGVkIHdpdGgKPj4+PiBwcmV2aW91cwo+Pj4+IHBhdGNoLgo+Pj4KPj4+
IEkgbWFrZSBpdCBhIHNlcGVyYXRlZCBwYXRjaCBiZWNhdXNlIEkgdGhpbmsgaXQncyBhIHF1ZXN0
aW9uYWJsZQo+Pj4gYXBwcm9hY2guCj4+Pgo+Pj4gSWYgeW91IHRoaW5rIGl0J3Mgb2theSwgSSB3
aWxsIGp1c3Qgc3F1YXNoIGl0IGFuZCBwdXQgaXQgYXMgdGhlIHNlY29uZAo+Pj4gcGF0Y2ggaW4g
dGhlIG5leHQgaXRlcmF0aW9uLCB3aXRoIGFkZGluZyBvcGVuYzkwNi1wbGljIGFzIHRoZSBmaXJz
dAo+Pj4gb25lLgo+Pgo+PiBXaGF0IGlzIGEgcXVlc3Rpb25hYmxlIGFwcHJvYWNoPyBXaHkgY29t
bWl0IG1zZyBpcyBub3Qgc2F5aW5nIHRoaXM/Cj4gCj4gQWggSSBtZW50aW9uZWQgaXQgaW4gdGhl
IGNvdmVyIGxldHRlci4gVGhlIHByb2JsZW0gaXMganVzdCBJIGRvdWJ0IHdoZXRoZXIKPiBiaW5k
aW5nIHN0cmluZ3MgZm9yIHNpbmdsZSBTb0NzIGFyZSBuZWNlc3NhcnkuCj4gCgpUaGVyZSBpcyBu
byBxdWVzdGlvbiBpbiBjb3ZlciBsZXR0ZXIuIEp1c3Qgc29tZSBtaW5vciByZW1hcmsgKmF0IHRo
ZQplbmQqIG9mIGl0Li4uCgpJZiB5b3UgaGF2ZSBxdWVzdGlvbnMsIGJlIGV4cGxpY2l0LCBub3Qg
Zm9yY2UgcGVvcGxlIHRvIGdyZXAgdGhyb3VnaApzZXZlcmFsIHBhcmFncmFwaHMgYW5kIGZpZ3Vy
ZSBvdXQgeW91ciBjb25jZXJucy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
