Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37628CC6B39
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mny881RXF8eLKCCNGgULGt1lJZX9VZM/CLQOF4TOUqI=; b=Dk1q6i5imISSAl
	jLds1c8c8JBLgm3EZTLTbU4WJR/ydUYqUSijmyB7ItfwpiS1RDCmq4XbX+Lcx5HykUa34ehHC7ykV
	KJjUm+MwzaL7HhBRs5VEkjOAFh5n2GASJy+expC/76zDGXLuvC6QYqJkmWADOsN4qIORTgR/UCzvJ
	iHCCeACG+0JgZfiQQicBBBMhkeovGceIcdD5i7Og6+ZA94x7tBca8HZsJ6nQVrkydtsiIOYAI1Ydk
	+FaX/rF9ukWO1EycrTdv4RTWxmBZeib08uu4x8uSQUsimhoNi6eZtvrCxjNuEnugWaIBppl3XLWKk
	+rZWN2Lpdm6y1XCbYk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPPJ-000000011Qc-0TPK;
	Thu, 15 Oct 2026 17:38:21 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPPG-000000011Pr-2Jwv
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 17:38:20 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-676858d42f8so4959197d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085897; cv=none;
        d=google.com; s=arc-20260327;
        b=nR67ntdwEKI2Hh/FLx2mWZ2nDyLWC53nFAf7Spp7IoV27v/638z7PmbY6j1HQVLS85
         z5IlSmIk/OOufKCHZJ+FU4jhusTV5NSnBV4g6tR2FU5zkCYmPxYB3pPekH1qxOrBY4i8
         1gOMleOgr2JZk1Wtl+XOBm7baKZsHGyA4UlScjnt99G5ZmF3nVE2QKJXMcz+2UoLiaFe
         TirH3eMWXZ5z7HSDhsiMystUsts+6j/l6BOeyVgavKOLVsjTXRkBnNL9TixTwD9LWUSc
         9do42Mdl1JHmHiNnzvRzkPRKZHLCxRxeOXwuDDo+6UEcVo5hf7u5qW3VSS7vcMwzWLdf
         v1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        fh=WQUxl1DKo3b6yTQ/EoNfmsC01PqUmLtvkeyMfZAS2EM=;
        b=ALW5bKL1+Y0aTetFv7qZk9Stz+OjFBHdYko968+4ITEXB0IUDZsx4E7GnW9XMdSC08
         iqIS5d0rQVz9vk5T8p6kQcHJRlQNGJ3q1F5B6FcqbYnjzgWhxN3ix6yHz7m7f2bDCUZI
         Q39Y9DkxWVyrbyyUVAxcYmvDtV3pGZVMWM9PJQoIDaMzXvx5VzDIbOK7TiCiyy4LOnaO
         z0BsDQkXggys6Qp1Zb4VYLUGPyrid/cgxzTK4GOxxQhnBz5GVtwER5kd8P2Vsi3jY1rF
         jWvkIbdP5YgzcvOZhhZCylQ+6hJMnxpRSRhM2YaAPe4Wcj5Ae6s97sTu8hrgXbf9HG9q
         yB3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085897; x=1792690697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=BApgCZ0xm076zWfNvXi3N4iFvHENVPXl4oZaxBjnqhJVlJtyyuyAhZgJowAdlzB3MS
         0WIz36nwkR+bD2IYHgSEnSTnw0aUVRXmk8WI2YUzbztXKw7i4L7STl8MpazYn4tzZRXz
         PENUZX4YGCsl2pXMGsHjKANALEX4GLuQQGFzGWCeo9licHh8b5eXfISAXEU5TXrNTkR/
         MC3MsOj3nFVV6xT26+4N/qEbH/0hNg031xVF3DlUwJjQOXV1TvRoUmd5MxmzXPyvVxV7
         uJZIStSR3PgQK4kILdogaCJ0N2BR7EOoMP1vyJHv+iSzn3aw2wIsjO75QwQCCV2xfIjI
         FwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085897; x=1792690697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=0w+kPLXfYhaMGqUuIEMoq7i6Hx3HKhi2FJuRibOYCqwv3FSsoNiXroSrmNE5ZCqzed
         YzBiC7sLhjYNsyr3Wi1BqvmnvBHkjIRpp2nsJIRRMW/i6BnmbIr/goRdGmpbCrPwjMA9
         vFWCDMtcGlenga1l5OGy3e+Of3GCEShIX/E7+Bk3uTEPJwgffFtOr0e1wVfvpzCSOk6M
         UFBQDwHW42q+Ad5C8/ReCy4vwwJ55NrIkGmIXAiMtNnnbI6y2o/jHeIYsxGzopg505mV
         bcmEK4sghB4XjA1JbsSfb4s6rQhimcYwuHYn7I75ZS8SRCo3N4vJ2M4w1voLuiwbTAEN
         K8bA==
X-Forwarded-Encrypted: i=1; AKwUvBxbOAQhrLHlqmzg9poM3lOxnZ/Bsoh/HPv5Nv4cRSVF+l9SN/re/XAikBkRgsHo8XQoiY7uavZzvP/7lQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJUILFyCZpj9LmyhZ7VA+gEeoRjRKKYfXsVvgNUIubJJYrzx595
	B69VMBIg10isLJzzDVnphFOdMClxLXvwFrHIeWkEG8Jlc/Vb3I0TtH6koBqxAAo9G9shMLz36dt
	1lQCRr6zl3o4X5wbb/lnTmtQJLzD6NPg=
X-Gm-Gg: AYBFou3gpntdv4VXbYHhIhWh4UlhuWHxEq+cC2yzPfMhFqrTWsymtDUKCJ9+PNeShYW
	rrk3yAA5VX6Leqdv618l65hzm2QbAUDugxMLFlZPBJPgDTjdodBQ7KneDKY2hB2JpRfeWJ45Stt
	hglxE9xVcUmaVCUXHwIyY7CwqkWrOplDikm9pKZXP5FmuJqg8rS81kyG5x1UCJ3HNMkS7f6SfJ4
	96OorGsYZgIPteAZxugdcYxW11SAskJy3XartMCCI1xnmg71pORAaHFPCxaELUn4bVxPkVBJSkS
	SCs+TFdue0aPs+FIjXzlSj//HP1Cs7lVo58bxVJ2zxun8fdbwaEvd+UTUaIlD6/msOg=
X-Received: by 2002:a05:690e:1c07:b0:679:aa90:d272 with SMTP id
 956f58d0204a3-679aa90dd58mr432536d50.108.1792085897078; Thu, 15 Oct 2026
 10:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org> <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
In-Reply-To: <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:38:00 +0200
X-Gm-Features: AclHuK-mkmvLNzpAloyGNWEU1xEwlRugYfUHBOpsjJVuzj_o9PRbUr7KYWotes8
Message-ID: <CABdCQ=PAHxwH1+1OkLiW2ad+PTxNY6OmmPwOwAR3EoDe6Mt7Zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_103818_612550_1A31B228 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RWwganVlLCA4IG9jdCAyMDI2IGEgbGFzIDU6NDUsIFlpeHVuIExhbiAoPGRsYW5Aa2VybmVsLm9y
Zz4pIGVzY3JpYmnDszoKPgo+ICAgU3BhY2VtaVQncyBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5p
dCkgY29uc2lzdCBvZiBzZXZlcmFsIHBvd2VyIGRvbWFpbnMKPiB3aGljaCBjYW4gYmUgbWFuYWdl
ZCBpbmRlcGVuZGVudGx5LCBkZXBlbmRpbmcgb24gZGlmZmVyZW50IGFwcGxpY2F0aW9uCj4gc2Nl
bmFyaW8sIGVhY2ggZG9tYWluIGNhbiBiZSBwb3dlcmVkIG9uL29mZiBmb3Igc2F2aW5nIHBvd2Vy
LgoKVGVzdGVkIG9uIGFuIE9yYW5nZVBpIFJWMiB3aXRoIHRoZSBQb3dlclZSIEdQVSBwb3dlciBk
b21haW4uIEEgZmV3CmNvbW1lbnRzIGJlbG93LgoKPiArc3RydWN0IHNwYWNlbWl0X3BtX2RvbWFp
bl9wYXJhbSB7Cj4gKyAgICAgICBpbnQgcmVnX3B3cl9jdHJsOwo+ICsgICAgICAgaW50IGJpdF9o
d19tb2RlOwo+ICsgICAgICAgaW50IGJpdF9zbGVlcDI7Cj4gKyAgICAgICBpbnQgYml0X3NsZWVw
MTsKPiArICAgICAgIGludCBiaXRfaXNvbGF0aW9uOwo+ICsgICAgICAgaW50IGJpdF9hdXRvX3B3
cl9vbjsKPiArICAgICAgIGludCBiaXRfaHdfcHdyX3N0YXQ7Cj4gKyAgICAgICBpbnQgYml0X3B3
cl9zdGF0Owo+ICsgICAgICAgaW50IHVzZV9odzsKCmJpdF8qIGZpZWxkcyBob2xkIHZhbHVlcyAw
LTE1LCB1OCB3b3VsZCBiZSBtb3JlIHByZWNpc2UgdGhhbiBhbiBpbnQuClNpbWlsYXJseSwgcmVn
X3B3cl9jdHJsIGZpdHMgaW4gdTE2IGFuZCB1c2VfaHcgY291bGQgYmUgYm9vbC4KCj4gK3N0YXRp
YyBpbnQgc3BhY2VtaXRfcGRfcG93ZXJfb24oc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpkb21h
aW4pCj4gLi4uCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJmRvbWFpbi0+ZGV2LCAicG93ZXIt
b24gZG9tYWluOiAlZCwgZXJyb3JcbiIsIHNwZC0+cG1faW5kZXgpOwoKWW91IGNvdWxkIGluY2x1
ZGUgdGhlIGRvbWFpbiBuYW1lIGZhaWxpbmcsIHRoYXQgd291bGQgaGVscCBpZGVudGlmeQp3aGF0
J3MgY2F1c2luZyB0aGUgcHJvYmxlbS4gWW91IGFyZSBhbHJlYWR5IGluY2x1ZGluZyB0aGUgbmFt
ZSBpbiB0aGUKInBvd2VyLW9mZiIgZXJyb3IgbWVzc2FnZS4KCj4gK3N0YXRpYyBpbnQgc3BhY2Vt
aXRfcG1fZG9tYWluX3Byb2JlKHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2
aWNlX2lkICppZCkKPiAuLi4KPiArICAgICAgIHBtdS0+Z2VucGRfZGF0YS5kb21haW5zICAgICA9
IChzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKiopcG11LT5kb21haW5zOwoKVGhpcyBjYXN0IHJl
bGllcyBvbiBnZW5wZCBiZWluZyB0aGUgZmlyc3QgbWVtYmVyIG9mIHN0cnVjdApzcGFjZW1pdF9w
bV9kb21haW4uIFJlb3JkZXJpbmcgdGhlIHN0cnVjdCBzaWxlbnRseSBicmVha3MgaXQuIENvbnNp
ZGVyCmFsbG9jYXRpbmcgYSBzZXBhcmF0ZSBzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKiogYXJy
YXkgYW5kIHN0b3JpbmcKJnBkLT5nZW5wZCBleHBsaWNpdGx5CgpUZXN0ZWQtYnk6IElrZXIgUGVk
cm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
