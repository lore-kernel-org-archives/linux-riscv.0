Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32860C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcfsnSDHY3WLcLxJUpsKIJk7c6fYSSJcGyg22Zd3TWw=; b=m7+U89jL4p8r04
	pxZm8qJJJLHRFYID4fLV6yB35z+6bTDPGQiyzNV9VnFqqPj2LwXUC+i0tPWFY3GN8LP625RGCEB0c
	pPhhbegAYtQsULAPvgIvVoAp62dpfqmkg4Ik4GVFdslMzdkSRQQFIdtQiEAt9s5RioEHGbRpC9L/9
	GQslFM0HgqLauPVQhiZ45RNdc2Xzc7S8fnzY1/+lA0sBrII0OJC0Hryd5W/XMztGnBJ9D3BXqgwFo
	B1bpQlRTOXiIQck5+81i/8+kGzje7b9X7iFbO4mnbO2qQXaYeYfmJijOREez/lKgwhuESyzBTTaYa
	9cQlmvssSEwvlI0Yq/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtrK-00CBrt-0a;
	Mon, 22 Jan 2024 12:57:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtrG-00CBqr-26
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:57:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e9d288f45so37431395e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705928215; x=1706533015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihKeGnpC90MvY5sKmPc9CdNDaRZxILAyOx5j+zn8IjQ=;
        b=qhxhc7wWBoExtnC+f0IRucgnxqMH5GFS5VzFylVHP/xhy0oGF056Oy8WdhdwA1JXFL
         SfMtwOmQybYFPgnYaFhz9Incp9ti4VK5i08e1k5owawC0stGJ8lRMqRsFXPsrgFLNwfW
         /Y5oUBFSsg7TqnG5HFnwgksE7UWESyPWPJPRlceXbXK695g9p8vPYe8KzkK6zSGkNWCd
         fiPXfb+sdLGNSOgKnsoJ0E5hG0jXUWuk4l4sIm4KDdL6d3WS2yIyKEpvOSrxAm0WivAH
         w5v811uTzDz+6RvqOjY30HEP21PctV5tcZ18EtThya1QqGHG/cq9H51VUCOVOyFvXV7f
         Gkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928215; x=1706533015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihKeGnpC90MvY5sKmPc9CdNDaRZxILAyOx5j+zn8IjQ=;
        b=P6GHdLgm+CPAb8gOkjJl4SGj/1nrDFFlRw2X0QrC/lf83Hhk1R0ijb+Phm8vOSUw46
         53mruAI6nhs8pG7eoj2V441yX/XOqoQwsyKnKmwrX9rm12fbBf3asPfS9TwAYpvyQ3dI
         /mSfinpHV9UelIKHYvX0JSefHvPFETdDamSo04a33eUJNQetbR3+HS7SHShCbTlLMFpX
         aVumdv9t2gxjgbCF4LseFD1CzAnrD7Q33adm64kGS/mhfckt19O1cABUPeSHsSodsq0+
         d/13D1mwVPcriUMunaGN+XzxPVUPiFwYMC+FcxOGggiydSo3xJfrT6rcgohDFs4q+3gw
         ld7A==
X-Gm-Message-State: AOJu0YzPE/EPFohMUfyMnYkeXfLc5wFI3UtthJWDSzOPcGBOYBpvZ0wu
	iMi0Glpio/WlBe5eopemscZDAW8CxJeLoaKIAzY67X4+gFlPKcj43z1CssjBjHk=
X-Google-Smtp-Source: AGHT+IEzCfGBrUXua9u+W8n3UjUn/hXCIVAZeFTB8AqYsN7xWeNVTmRrpd8Rjd5nRs+yUifIshxJ5w==
X-Received: by 2002:a05:600c:4fc5:b0:40e:9d77:ae00 with SMTP id o5-20020a05600c4fc500b0040e9d77ae00mr1679900wmq.254.1705928214891;
        Mon, 22 Jan 2024 04:56:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b0040e3733a32bsm42573762wmb.41.2024.01.22.04.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 04:56:54 -0800 (PST)
Message-ID: <7d87c455-7af5-4339-9088-6015d5847e88@linaro.org>
Date: Mon, 22 Jan 2024 13:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
 control module
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <c9feb32f-1efb-4613-94c9-9d6bb0f45366@linaro.org>
 <MA0P287MB2822BCB4E43BCB495FCF9069FE752@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB2822BCB4E43BCB495FCF9069FE752@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_045658_692912_B842F176 
X-CRM114-Status: GOOD (  14.90  )
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

T24gMjIvMDEvMjAyNCAxMToxMSwgQ2hlbiBXYW5nIHdyb3RlOgo+Pj4+Pj4gK8KgwqDCoCAkcmVm
OiAvc2NoZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXN5c2Nsay55YW1sIwo+Pj4+Pj4gK8KgwqDC
oCB0eXBlOiBvYmplY3QKPj4+Pj4gV2h5IGlzbid0IHRoaXMgbWVyZ2VkIGhlcmU/IFlvdSBkbyBu
b3QgbmVlZCB0aGUgY2hpbGQgbm9kZSByZWFsbHkuLi4KPj4+Pj4gdW5sZXNzIHRoZSBjbG9jayBp
bnB1dHMgYXJlIHNwZWNpZmljIHRvIHRoYXQgY2xvY2sgY29udHJvbGxlciBhbmQgeW91Cj4+Pj4+
IHdpbGwgaGF2ZSBoZXJlIG1vcmUgZGV2aWNlcz8gQnV0IHdoZXJlIGFyZSB0aGV5IGluIHN1Y2gg
Y2FzZT8KPj4+PiBJIGRvbid0IHNlZSBtb3JlIGRldmljZXMgd2lsbCBiZSBpbmNsdWRlZCBsYXRl
ci4gSXQgc2hvdWxkIGJlIG9rIHRvCj4+Pj4gbWVyZ2UgdGhlbSBpbnRvIG9uZS4KPj4+IGhpLCBL
cnp5c3p0b2YsCj4+Pgo+Pj4gQWZ0ZXIgc29tZSBkb3VibGUgY2hlY2ssIEkgZmluZCB3ZSB3aWxs
IGhhdmUgbW9yZSBkZXZpY2VzIGluCj4+PiBzeXN0ZW0tY29udHJvbC4gRm9yIGV4YW1wbGUsIGlu
IHRoZSBTWVNfQ1RSTCBhcmVhLCB0aGVyZSBpcyBhbHNvIGEKPj4+IHNlY3Rpb24gb2YgcmVnaXN0
ZXJzIHVzZWQgdG8gY29udHJvbCB0aGUgIkdlbmVyYWwgUHVycG9zZSBJbnRlcnJ1cHQiLgo+Pj4g
VGhlIHBjaWUgY29udHJvbGxlciBvZiBzZzIwNDIgd2lsbCB1c2UgdGhpcyBpbnRlcnJ1cHQgY29u
dHJvbGxlciB3aGljaAo+Pj4gaXMgZGVmaW5lZCBpbiBTWVNfQ1RSTCwgd2Ugd2lsbCBhZGQgaXQg
aW4gbGF0ZXIgd29yay4KPj4+Cj4+IEkgZXhwZWN0IHRoZW4gYWxsIGRldmljZXMgdG8gYmUgZG9j
dW1lbnRlZC4KPiAKPiBoaSwgS3J6eXN6dG9mLgo+IAo+IEZpcnN0LCBJJ20gdmVyeSBzb3JyeSBm
b3IgaGF2aW5nIGRvdWJsZS1jaGVja2VkIHdpdGggeW91IGZvciB0aGlzIHN5c3RlbSAKPiBjb250
cm9sbGVyIGFuZCBjaGlsZCBub2RlIGlzc3VlLCBidXQgdGhpcyB0aW1lIEknbSBzdXJlIHRoZXJl
IHNob3VsZCBiZSAKPiBubyBtb3JlIGNoaWxkIG5vZGVzIGV4Y2VwdCB0aGUgY2xvY2sgYW5kIGlu
dGVycnVwdCBjb250cm9sbGVycywgdGhvdWdoIAo+IHRoZXJlIGFyZSBzb21lIG90aGVyIHJlZ2lz
dGVycyBpbiBTWVNfQ1RSTCBzZWN0aW9uLCBidXQgd2Ugd2lsbCBub3QgdXNlIAo+IHRoZW0gdGls
bCBub3cuCj4gCj4gT25lIHF1ZXN0aW9uLCB3aGVuIHlvdSBzYXkgInRvIGJlIGRvY3VtZW50ZWQi
LCBkbyB5b3UgbWVhbiBJIG5lZWQgd3JpdGUgCj4gYmluZGluZy95YW1sIGZpbGVzIGZvciBvdGhl
ciBjaGlsZCBub2RlPyBCdXQgdGhleSBleGNlZWQgdGhlIHNjb3BlIG9mIAo+IHRoaXMgcGF0Y2hz
ZXQgKHRoaXMgcGF0Y2hzZXQgaXMgZm9yIGNsb2NrIHN1cHBvcnQgb25seSkuIFRoYXQncyB3aHkg
SSAKClRoYXQncyBub3QgdHJ1ZS4gVGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gYWRkIERU
IGJpbmRpbmcKZGVzY3JpcHRpb24gZm9yIHlvdXIgZGV2aWNlLiBJZiB5b3UgY2hvb3NlIGFueSBv
dGhlciBzY29wZSwgSSBkb24ndAphZ3JlZSBhbmQgSSBhbSBub3QgZ29pbmcgdG8gcHJvdmlkZSBw
b3NpdGl2ZSByZXZpZXcuCgo+IHN1Z2dlc3QganVzdCBhZGQgY2xvY2stY29udHJvbGxlciBpbiB0
aGlzIHBhdGNoc2V0IGFuZCB0byBhZGQgdGhlIAo+IGludGVycnVwdCBjb250cm9sbGVyIGluIGFu
b3RoZXIgcGF0Y2hzZXQgZm9yIHBjaWUgc3VwcG9ydC4gVGhpcyAKPiBtZWNoYW5pc20gc2hvdWxk
IGJlIHN1aXRhYmxlIGZvciBvdXIgZXhwYW5zaW9uLgoKSG93IHRoZW4gYXJlIHlvdSBnb2luZyB0
byBzb2x2ZSB0aGUgcmVxdWlyZW1lbnQ6ICJETyBhdHRlbXB0IHRvIG1ha2UKYmluZGluZ3MgY29t
cGxldGUgZXZlbiI/CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xLXJjMS9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctYmluZGluZ3Mu
cnN0I0wxNwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
