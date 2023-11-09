Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC53C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDtTj/a5JYKynuuLdClefZXCLQD7sbC1fksngoV5d1Y=; b=ZFI4os3LU3Ji8v
	2l8wSqpvHLAlraGlAI7mxFc4b6NvJJTR1KXfFAhhiPhblT/GJ4uTZYdUxPL2VMp6EHa2JpHJD8Oz/
	Xqjk9eGdv8HGiNTYZ27cp58kFQrFAxiAq5ryc4P57mSYiwExVaMA0GJShQPCoM1aeDXcD2DyYG+FL
	VfFxL5YjUdD6gG54C28fegj3kR9FpzTPw5Qo9ZW0DZqTTEhFcwkHFYbd1m0iOzL04E9yFBj2SUtnh
	qfL9RODSiKyRS1644lEOvOexYppeg2ggudY7z/A5nqX/rBwnHC4hbMw11oIJDg8Dit+OVau1ckVlQ
	orbNZHGe5bt39jQkplhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12UW-005yMj-0R;
	Thu, 09 Nov 2023 10:42:28 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12UT-005yMJ-1p
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:42:26 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5bacef31aso1736271fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699526544; x=1700131344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/T3nAMPk3GrqIEl5q2gbW7BDPvpAe0liQvy3DzEQmwc=;
        b=lhQuCe0b4GFVMB6fl5UD8DieKhvgFO2FVD8jNjSvOSts3xKCA9u5O+a6NHdw1ESJwD
         tRQqhsfPp/cd0cFS4G9bJTeKqzqqfmdCSPth2XysFog0fJLJ6/3emiMhDTbqEB6uo6k3
         1op4EQOexGfv6YM5VVJCpgTVNX5VGv1CRHg9MnyD1G4AugseZ4LXhpFIqKgHV1J2Orh/
         l4pvOWXe2BFeUyVLWu1UggXni9ErrgGyM4Xejrh/ZxBkuvl6pyUBlh6W3pH516YVD+bX
         26oX9QaSuMggDfzIgQhPdvWhHF4Mtr40BKefRE/0qmOCrDptYRyFV63aLjcX17fdLPd/
         RUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526544; x=1700131344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/T3nAMPk3GrqIEl5q2gbW7BDPvpAe0liQvy3DzEQmwc=;
        b=h6FB70Km1+kjdYy9Hhid5DWwCMBCkkOz+tMdZ3O/rCXiSfSH6hjTfOtN+Modkw8pWQ
         CIvOYqmTQiHkr8tNCXRhvwzGW5LTvvgeoRPJqKcf+eSkJ0FcpRnqXLkLRBUQWAJ36Wqu
         joYEfxNp4i1rTA5vWq4Z5G3P14j01nH+SwNCJ6BjYqQR44YArwjeykvGP4uFuHy0jhQ6
         q7BXe26QZiGevrPuXCCDWBJg6VuRGXRYy4CVCOZUe+rUV1MkxBr+dmrJbAZTW9tfQfai
         Pk1CGaIURyi1YbyFyrO6Mxx8qBbneMkS4OmzHW+mdYf3i7teX/Hsw4o7bWnHdzyMM5x6
         eDkg==
X-Gm-Message-State: AOJu0Yz3XO1/mGTSL2gbTeNfOxyS/7erC+SM9Ran9H3lPaPGWVMCqu+Z
	UD6AST7F3t0K8aVjVsNlFU93Mg==
X-Google-Smtp-Source: AGHT+IHcJMnl4Agc3MEocHCsrLtdMFFEcJLC2XSn3K1KlAQHuyrsJ6xuAtI3wP4NAa7wEFjA1O7D4w==
X-Received: by 2002:a05:6512:3f0d:b0:509:8d70:49e8 with SMTP id y13-20020a0565123f0d00b005098d7049e8mr1595802lfa.6.1699526543435;
        Thu, 09 Nov 2023 02:42:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:87b4:87b9:6476:5df7? ([2a01:e0a:999:a3a0:87b4:87b9:6476:5df7])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b004090ca6d785sm1698384wmq.2.2023.11.09.02.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:42:23 -0800 (PST)
Message-ID: <5cb0a3ae-405c-4b07-adaa-0e3109e76c69@rivosinc.com>
Date: Thu, 9 Nov 2023 11:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension
 description
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-21-cleger@rivosinc.com>
 <20231108-basics-delete-710d0682bf0e@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231108-basics-delete-710d0682bf0e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_024225_603199_FF5F43E6 
X-CRM114-Status: GOOD (  12.75  )
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

CgpPbiAwOC8xMS8yMDIzIDE1OjU5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBOb3Yg
MDcsIDIwMjMgYXQgMTE6NTU6NTZBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBaZmEgSVNBIGV4dGVuc2lvblsxXSB3aGljaCBjYW4gbm93
IGJlCj4+IHJlcG9ydGVkIHRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgo+IAo+
IEZXSVcsIGh3cHJvYmUgaXMgbm90IHJlbGV2YW50IGZvciB0aGUgZHQtYmluZGluZ3MuCj4gCgpP
aywgc2luY2UgSSdsbCByZXNlbmQgYSBWNCwgSSB3aWxsIHJlbW92ZSB0aGlzIG1lbnRpb24gdG9w
IGh3cHJvYmUuCgo+PiBMaW5rOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFWVDZR
SWdncGI1OS04UVJWMjY2ZEVFNFQ4RlpUeEdxNC92aWV3IFsxXQo+PiBTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gCj4gQWNrZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoK
PiAKPiBDaGVlcnMsCj4gQ29ub3IuCj4gCj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDYgKysrKysrCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+PiBpbmRleCA4N2M3
ZTM2MDgyMTcuLmRjYmE1MzgwZjkyMyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+IEBAIC0yMTQs
NiArMjE0LDEyIEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgICAgICBpbnN0cnVjdGlvbnMgYXMg
cmF0aWZpZWQgYXQgY29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzE1OAo+PiAg
ICAgICAgICAgICAgZnJvbSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVuZC1jb25kaXRpb24iKSBv
ZiByaXNjdi1iaXRtYW5pcC4KPj4gIAo+PiArICAgICAgICAtIGNvbnN0OiB6ZmEKPj4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmEgZXh0ZW5z
aW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0aW5nIHBvaW50Cj4+ICsgICAgICAgICAgICBpbnN0cnVj
dGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdCAwNTZiNmZmICgiWmZhIGlzIHJhdGlmaWVkIikg
b2YKPj4gKyAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCj4+ICsKPj4gICAgICAgICAgLSBj
b25zdDogemZoCj4+ICAgICAgICAgICAgZGVzY3JpcHRpb246Cj4+ICAgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWmZoIGV4dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQo+
PiAtLSAKPj4gMi40Mi4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
