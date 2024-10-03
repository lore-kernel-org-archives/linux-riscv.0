Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF869CF8565
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1fzaL6mOOewfEPM36EtIC1XbJz5kRiBsj/qBwrhzNQ=; b=hU+GubJPBeYsyO
	xQmVIpYTPqj9J7A1bTRLVgjuTzM0RrFGcmGqAjmoRK/FEBOLCLO/dJTJM7AHU97q7dd80qW06q2KJ
	e8K5QTX4qSr9CTrsYsF/xvmbYUZQTrVSkaHlrAfnYgdnY+ZyyWtPniEF/YvrxBAjwPPMX7MaGi2TT
	pxLSBjfoQRxukYDZFMfNSinG0/ObQvA5MmBv9arBgXapK55nyn3bLS12F+o3r+KeO4210wbZkeK07
	HJ4pjkI85idE0duj6I6wBECwCx/xGLFJJpDix/EhfSsDPLqByc5rHkyBbTA0Eu/CMZUNO7P/M/z4k
	W7NwqqtlJPWcZ7cA6u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGkT-00000008TZ6-3uzY;
	Thu, 03 Oct 2024 07:59:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGkO-00000008TW3-4AeZ
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 07:59:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37ccd50faafso520779f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727942379; x=1728547179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wZTumvS1FX7esdrpRKhVgflOZWM/kXat3TeZ3vkWLk=;
        b=VTpipu5h3dBfs3WnCggsaRljRt4MGDSXDvS9Hh/WttNkMxhUEs17A9OM5V2zr3Ru4e
         ZhT7PKqeI8ae1XlhYSh+Dw58QUqWhj7zHs/Z+CWmVLR8J+UKv2fRSg/2xr7pPiGOiVxz
         uulaqRrTSuZysgZIU/JBssXOl+buINvJzhBpXmR6xxMA9tVobs1ec8lOEycACPcpJehT
         kbgaWeLW4JZC0j84gIzRV/hQCFb/cMpIK7VFzoXFYLM0hbTTQoe6nbBbncSaei8tVj74
         7RhuVNtxCB3q7vARDKX1helCY9tg98/ZuIKFn1nBraUJ3kQPfksKYfOvHx0rZoRo9t9E
         hLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727942379; x=1728547179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wZTumvS1FX7esdrpRKhVgflOZWM/kXat3TeZ3vkWLk=;
        b=Xp/zLEx5XK8J4REvrGK40VaFwGweqMh6pIkMDNBnSifDuzP6XNuPO4Lnpalm1ifywE
         RZwDXV88wewnsRuVPeXEpWK6u62E9hkjpCWugH+3DCgY3WXGV+G783nMjB5lOvjHt/87
         PdhDjwzX5U8HLm5AiDxITz2v/+oYIkZAs10wHqDKFqbFt9+04uhh6hHSMQs0KQ5v/rfY
         kwv3QG3ceUXY7Q26RyLZSTU1qeBRSS/kmYA1hY9whIv7eiqPhwztFKmELa06VghH7T1r
         oKO5duThE3sSI61pvC5UftNzjbugbMw33r7gWAcIOigb0o0GgoqHBO1q/c/yqkpvXz1J
         MUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxYOrdqvqOO91I2JqWteA4m7G2kZyr2JztXMzKdkv3cBIRQ7BVGxX6SChFfl4Jij7Mt7im1G25SAJ8nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQAtiLYF92ZrBwdiH85IkBpNWxyMy/YrboB1voKxJu/z4szhF
	dboopVNToYKIDIoqIeZ4zc6QdMbBEfEFdop+Hk6ZhNULIN6y5RiYBRObXoZLgoY=
X-Google-Smtp-Source: AGHT+IEsSdfcRZjKJ41FslpC8TPMBC/B2mp/qcKIEx519I9XW873b+QBemVm6u81uqeEgDbbK7zeeQ==
X-Received: by 2002:a05:6000:1547:b0:374:c075:ff34 with SMTP id ffacd0b85a97d-37cfba04c19mr4773570f8f.38.1727942379165;
        Thu, 03 Oct 2024 00:59:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d94f1sm669315f8f.110.2024.10.03.00.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:59:38 -0700 (PDT)
Message-ID: <0fa7461f-5c7c-4f18-ac02-66d37e2c559c@rivosinc.com>
Date: Thu, 3 Oct 2024 09:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/5] dt-bindings: riscv: document vector crypto
 requirements
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-sincerity-urgent-acdb0e8d8a66@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241002-sincerity-urgent-acdb0e8d8a66@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_005941_211890_E4495282 
X-CRM114-Status: GOOD (  13.74  )
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

CgpPbiAwMi8xMC8yMDI0IDE4OjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBTZWN0aW9uIDM1LjIuIEV4
dGVuc2lvbnMgT3ZlcnZpZXcgb2YgWzFdIHNheXM6Cj4gfCBUaGUgWnZrbmhiIGFuZCBadmJjIFZl
Y3RvciBDcnlwdG8gRXh0ZW5zaW9ucyAtLWFuZCBhY2NvcmRpbmdseSB0aGUgY29tcG9zaXRlIGV4
dGVuc2lvbnMgWnZrbiBhbmQKPiB8IFp2a3MtLSAoc2ljKSByZXF1aXJlIGEgWnZlNjR4IGJhc2Us
IG9yIGFwcGxpY2F0aW9uICgiViIpIGJhc2UgVmVjdG9yIEV4dGVuc2lvbi4KPiB8IEFsbCBvZiB0
aGUgb3RoZXIgVmVjdG9yIENyeXB0byBFeHRlbnNpb25zIGNhbiBiZSBidWlsdCBvbiBhbnkgZW1i
ZWRkZWQgKFp2ZSopIG9yIGFwcGxpY2F0aW9uICgiViIpIGJhc2UKPiB8IFZlY3RvciBFeHRlbnNp
b24KPiAKPiBBcHBseSB0aGVzZSBydWxlcyBpbiB0aGUgYmluZGluZywgc28gdGhhdCBpbnZhbGlk
IGNvbWJpbmF0aW9ucyBjYW4gYmUKPiBhdm9pZGVkLgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL3JlbGVhc2VzL3RhZy9yaXNjdi1pc2EtcmVsZWFz
ZS02OThlNjRhLTIwMjQtMDktMDkgWzFdCj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMzIgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+IGluZGV4IGFi
ZjI1NzkxNzFjNWIuLjAyYjgyMmJiZjM0MWQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiBAQCAtNjUx
LDYgKzY1MSwzOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICAg
ICAgICAgICAgICAgICAgY29uc3Q6IHp2ZTY0Zgo+ICAKPiArICAgICAgLSBpZjoKPiArICAgICAg
ICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBhbnlPZjoKPiArICAgICAgICAgICAgICAtIGNv
bnN0OiB6dmJjCj4gKyAgICAgICAgICAgICAgLSBjb25zdDogenZrbgo+ICsgICAgICAgICAgICAg
IC0gY29uc3Q6IHp2a25oYgo+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IHp2a3MKCkhleSBDb25v
ciwKClNob3VsZG4ndCB6dmtzZWQgYW5kIHp2a3NoIGJlIHBhcnQgb2RmIHRoaXMgbGlzdCA/IE15
IHVuZGVyc3RhbmRpbmcgb2YKdGhlIHNwZWMgbWlnaHQgYmUgd3JvbmcgYnV0ICJadmtzLS0iIHNl
ZW1zIGxpa2UgYSBwb29yLW1hbidzIHdpbGRjYXJkCmZvciBadmtzKiBleHRlbnNpb25zID8KClRo
YW5rcywKCkNsw6ltZW50Cgo+ICsgICAgICAgIHRoZW46Cj4gKyAgICAgICAgICBjb250YWluczoK
PiArICAgICAgICAgICAgYW55T2Y6Cj4gKyAgICAgICAgICAgICAgLSBjb25zdDogdgo+ICsgICAg
ICAgICAgICAgIC0gY29uc3Q6IHp2ZTY0eAo+ICsKPiArICAgICAgLSBpZjoKPiArICAgICAgICAg
IGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBhbnlPZjoKPiArICAgICAgICAgICAgICAtIGNvbnN0
OiB6dmJiCj4gKyAgICAgICAgICAgICAgLSBjb25zdDogenZrYgo+ICsgICAgICAgICAgICAgIC0g
Y29uc3Q6IHp2a2cKPiArICAgICAgICAgICAgICAtIGNvbnN0OiB6dmtuZWQKPiArICAgICAgICAg
ICAgICAtIGNvbnN0OiB6dmtuaGEKPiArICAgICAgICAgICAgICAtIGNvbnN0OiB6dmtzZWQKPiAr
ICAgICAgICAgICAgICAtIGNvbnN0OiB6dmtzaAo+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IHp2
a25jCj4gKyAgICAgICAgICAgICAgLSBjb25zdDogenZrbmcKPiArICAgICAgICAgICAgICAtIGNv
bnN0OiB6dmt0Cj4gKyAgICAgICAgdGhlbjoKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAg
ICAgICAgICBhbnlPZjoKPiArICAgICAgICAgICAgICAtIGNvbnN0OiB2Cj4gKyAgICAgICAgICAg
ICAgLSBjb25zdDogenZlMzJ4Cj4gKwo+ICBhbGxPZjoKPiAgICAjIFpjZiBleHRlbnNpb24gZG9l
cyBub3QgZXhpc3Qgb24gcnY2NAo+ICAgIC0gaWY6CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
