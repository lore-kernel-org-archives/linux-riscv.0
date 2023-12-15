Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A71C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wa4MuD+IPEy6xrFE/dptr8wQaZBKh0MatvrVli4eUPs=; b=XnMWOOnZQJ/2M5
	a7lR0EGPl5zjv5hq0Syge5LXb++60Tudeudrf8sPfxrr/q5ukQAPpOMO8mIoP3ThliJitwq2HnqVV
	8GQEE+2v1nUxwOjF+pTJDfQb1tTbZgYj+QTMEr04OwqCyNFrgTbglOsje6kYVcBp6mXJwYoq/IYoI
	7nRwwnbdC0uKs/zjXFYauVhfvGX96vz3OjBdwIs4W76C4LcJ9ion5KF3YfS+tuXTuWJsoLHa3GwyQ
	oey/69NwoPGEPaM9/HYcNcSF6wYOOAeHAwDE0CwX/f237ECniBvvU7J9SwMWG5rkPjhw9X+Z3dG/U
	OdszuZEyqqoytYFQI8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3X5-002TAF-1h;
	Fri, 15 Dec 2023 08:26:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3X2-002T8u-2j
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 08:26:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c362efc2dso1131685e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702628809; x=1703233609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVk+8aqoSd3lz+vVyrX3uxR+N2mjEYA2Pp2SvzfvFgc=;
        b=URgnUT2Ab2AFY15Ssl4XDlw4P2eub9CfmRCPp9HIiqvlE6NLrwh19gVwDhoCMhEMoi
         6aubdhA9tIs0L+GjcFIgM/V1GYuQAsgGGixurQKfMokFanhfxLA3CnxmCh/5nzZaQ8BR
         TlZk6gRxLBRHEF+lJjWSouhT1kWxGT6hy5WYF4R4zCqV4ck3CBEhnpAu7khCllipO8kB
         9Gp+W/+070pbEYrXUQCQ6SbSi249GnC6FMP4A+ASeTKzmO5u7bjFsuWZEY/rvQp2aZIA
         mvWO4gEDa1fAtQiACxS43h50JDEFS2Y39VOOLVDkyeLOoGFYqYEWKAt8mWH+6BWUpgIK
         vIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628809; x=1703233609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVk+8aqoSd3lz+vVyrX3uxR+N2mjEYA2Pp2SvzfvFgc=;
        b=r7TfwtsEoGx8QP1Xvz9lq3K7MFuHrkuMBRVwa+Cwv2qlKii9htHVA96DODbRXBZICX
         8yM3w+ttL8qeHBoMXeDmJ42agqrRkoOOSXiXhOB4bZuuIKUdbkWBKHwzW3TyOkReo/Z3
         0vKEp0aExoUEPEPzp8ezgNLteTQOlkNoZ6LKSxkxhKaY4ySSM5IWtSVy+5EaLhHKx/+z
         hcxyYy0UDuIkWEcjxqIJVKX79Nf87nRVBHszN90dExOQsVoZTK4BXMxUxMdB4TYUB7Ee
         NDcq9OR3yszfy8W+Q1PywsrKzrnI/31cLZUMIEs+tdoOhFqHiDX1vU+fMBPXA8rmYQ/C
         izJw==
X-Gm-Message-State: AOJu0YzXuR4Qp3KnRCv/gKuGh4QIvLny2v5NUtg+FDUpKCSVFKESPQuw
	bplaG4qRbk4q7CmclReVaQwnFviTeGUBqj4SwV4=
X-Google-Smtp-Source: AGHT+IEocrxdnOGtGy1ng5ykof0pE95Pwp2U/gLHbFTnYy319/r9xmobjdGCTwnBo/H5vvI4WvpUfg==
X-Received: by 2002:a05:600c:1c9d:b0:408:3836:525f with SMTP id k29-20020a05600c1c9d00b004083836525fmr13489076wms.1.1702628809197;
        Fri, 15 Dec 2023 00:26:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:96c0:67fa:945c:6200? ([2a01:e0a:999:a3a0:96c0:67fa:945c:6200])
        by smtp.gmail.com with ESMTPSA id q7-20020a7bce87000000b0040b2ab2b352sm390486wmj.1.2023.12.15.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:26:48 -0800 (PST)
Message-ID: <2412b8e4-ad26-46de-af45-ad9f37a1ea7f@rivosinc.com>
Date: Fri, 15 Dec 2023 09:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robbin Ehn <rehn@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-4-cleger@rivosinc.com>
 <20231214-headed-credible-f94ffb712e91@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231214-headed-credible-f94ffb712e91@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002653_074942_60D5F0B3 
X-CRM114-Status: GOOD (  15.81  )
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

CgpPbiAxNC8xMi8yMDIzIDE1OjExLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTMsIDIwMjMgYXQgMTI6MzI6NTlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBaYW0gSVNBIGV4dGVuc2lvbi4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA1
ICsrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAo+PiBpbmRleCAzNTc0YTBiNzBiZTQuLjkxMmNjNmE0MmViNCAxMDA2NDQKPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9u
cy55YW1sCj4+IEBAIC0xNzEsNiArMTcxLDExIEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgICAg
ICBtZW1vcnkgdHlwZXMgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMTkxMjEzIHZlcnNpb24gb2YgdGhl
IHByaXZpbGVnZWQKPj4gICAgICAgICAgICAgIElTQSBzcGVjaWZpY2F0aW9uLgo+PiAgCj4+ICsg
ICAgICAgIC0gY29uc3Q6IHphbQo+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgWmFtIGV4dGVuc2lvbiBmb3IgbWlzYWxpZ25lZCBhdG9taWNz
IGlzIHN1cHBvcnRlZCBhcwo+PiArICAgICAgICAgICAgcmF0aWZpZWQgaW4gdmVyc2lvbiAyMDE5
MTIxMyBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KPiAKPiBJcyAiMjAxOTEyMTMiIGFuIGFjdHVh
bCB0YWcgaW4gdGhhdCByZXBvPyBMb29raW5nIGF0IHRoYXQgdmVyc2lvbiBvZiB0aGUKPiBzcGVj
IChiZWNhdXNlIGl0IGlzIGEgc3BlYyB2ZXJzaW9uLCBidXQgSSBkb24ndCB0aGluayBpdCBpcyBh
IHZhbGlkCj4gcmVmZXJlbmNlIHRvIHRoYXQgcmVwbykgWmFtIGlzIGxpc3RlZCBhcyBEcmFmdC4g
SW4gZmFjdCwgaW4gdGhlIG1vc3QKPiByZWNlbnQgdGhpbmcgSSBjb3VsZCBmaW5kLCBaYW0gd2Fz
IHN0aWxsIGxpc3RlZCBhcyBkcmFmdC4KCldob29wcywgbXkgYmFkLCBJIGFzc3VtZWQgdGhhdCB0
aGUgY2hhcHRlciBiZWluZyBwcmVzZW50IGluIHRoZSBzcGVjCm1lYW50IGl0IHdhcyByYXRpZmll
ZCBhbmQgSSBkaWQgbm90IGNoZWNrZWQgdGhlIGxpc3Rpbmcgc3RhdGluZyBpdCBpcwpzdGlsbCBp
biBkcmFmdC4KCldpbGwgcmVtb3ZlIHRoYXQgZnJvbSB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtz
LAoKQ2zDqW1lbnQKCj4gCj4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgcmF0aWZpZWQ/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
