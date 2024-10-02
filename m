Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97588CF6D3C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7iLfTuiQcDAK5uZcSH8Mb+xDD0KpFTTMV72koTs8o0=; b=bokk2xe6L5HZKX
	fZ1qNJHUI8FEyvx/xhp1Cxvtbqeo1xPab5hW6XhkMaTCX7S/sI6DJIaKjpchB9UMQPpTFjdKw9DmN
	PsO/kHq1/+hJZoPDjkI2vP8Zq6hKQrSsY835RRgYMRmUEJT4FTrZmIkigBgZmVyCNb37pDAJ2+j17
	BqqXsGuQZ/ULV6M8ykoFzBIR0DloB9+4G0McEC50icm4zeIEewVpX1Lzyk0N0ikt8ty1xCZlec500
	JczjRlbeSgbaLg/JxiYHCS7FSSFiaxA7u3ZYx3CudlK/YhYZA14w0SXhsEDYwiWDnglc/gi+f8qni
	fY7we/AflRSrQg9ZYEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1rO-00000006qYP-2YlN;
	Wed, 02 Oct 2024 16:05:54 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1rK-00000006qWI-3q3b
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:05:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e25d164854dso5918207276.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727885149; x=1728489949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N4+gqSeb1KPAY46BU6QRBcQA4A0mtfnF/DfhNnvaYg=;
        b=hwGSo40812UwhGYuFDUzsQChIP9nEezcHBTGCBs5pmwr8uEekJZbxXCKgOfLaG9JoQ
         eNBMxf0N+YPza76NxighYQLsTzTaaUgKQuRdVUjEAbQXEyVL+xzl8bxIsvfjWeEyzOjm
         ea/EDooVtdYdCaLvdohzJWaeVIdOVEqucm2xJTiY7SUI0sjPW4+ky98dCu23ZTQGXmwU
         xgsAXm396mghYNZRghEM6J4zhEdO4Y2vv2TYC5/PCQI6mIbyV5+e0Fp428xNytKalicB
         Jr8B7fL620KVUmkQt5d/AxgoyASVKj31Wi/pLr8zYih0QPriTYI8jRFt5TsJOKSzPHHh
         fSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727885149; x=1728489949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N4+gqSeb1KPAY46BU6QRBcQA4A0mtfnF/DfhNnvaYg=;
        b=nsIB5Ndhg/th3roTTt43sIE8YMpMk3KqQfceAyJPtZQQGefiQFxr02H4zoPB76NKlT
         x28O4Uj4n88phrHqzzfSJ8ogUONeyCjKAPvy/kiD+XlEENfWlb0TJKJ8mUtbESQAHx2/
         SIsds2BRuJxHSGXpwCsyupK0rtKd86HuZ99Gz7yq6ChKtIEhV5/IT/tNcfOHNMUMIxN3
         vOBR7Tbnx8HMDkWO25JO6AL7zA1en7brM+kAfpnYchFjGsicFn/uYJLhvw5OvNHy9301
         ufkMcH0eHPuJNC+sf9/xrB9HbzjSK/8cV1mBKpm9n3MVIf+VdaxmkDCte5aUJBPdd1ME
         G6gg==
X-Forwarded-Encrypted: i=1; AJvYcCUPh50/ayrzUvq3UoIa0uvUMlSoFF4cdSPiIr/GvpBaQ5ABN3QfHR9Vn8o+BdtS0Wr8/CkoOmVi2iQrVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCiB8TarDyuQnznfk9ATmByEC6s3PgAx/kdKHdBOJK3OIjhQ4+
	+wEcCxYKSdrgerMQPmBju/W3grZOQ0d+uuXoUzZrNLPgnRNrYOjff0AjyLUpAVcQq8NYJTkSpoO
	OEWElbnKmI/+70eChNc84JXOBPNw=
X-Google-Smtp-Source: AGHT+IFUlmzbLTsFGYihjtzA3b4/xF4lQlYRCLWv50QanOiiRb9UJNd04Ll1C8wrxpzQb0JBZR9YOz+0MxaVbPy8aQQ=
X-Received: by 2002:a05:690c:6d09:b0:627:778f:b0a8 with SMTP id
 00721157ae682-6e2a2e37b2bmr40441297b3.42.1727885149175; Wed, 02 Oct 2024
 09:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-2-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-2-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 3 Oct 2024 00:05:37 +0800
Message-ID: <CAFTtA3NwGFioVAeipkA6aCUfRY12jKFJiR7MaCpCYNjdsT7TMQ@mail.gmail.com>
Subject: Re: [PATCH v10 02/14] dt-bindings: cpus: add a thead vlen register
 length property
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_090550_975926_66FDA17D 
X-CRM114-Status: GOOD (  19.10  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4g5pa8IDIwMjTlubQ55pyIMTLm
l6Ug6YCx5ZubIOS4i+WNiDE6NTflr6vpgZPvvJoKPgo+IEFkZCBhIHByb3BlcnR5IGFuYWxvZ291
cyB0byB0aGUgdmxlbmIgQ1NSIHNvIHRoYXQgc29mdHdhcmUgY2FuIGRldGVjdAo+IHRoZSB2ZWN0
b3IgbGVuZ3RoIG9mIGVhY2ggQ1BVIHByaW9yIHRvIGl0IGJlaW5nIGJyb3VnaHQgb25saW5lLgo+
IEN1cnJlbnRseSBzb2Z0d2FyZSBoYXMgdG8gYXNzdW1lIHRoYXQgdGhlIHZlY3RvciBsZW5ndGgg
cmVhZCBmcm9tIHRoZQo+IGJvb3QgQ1BVIGFwcGxpZXMgdG8gYWxsIHBvc3NpYmxlIENQVXMuIE9u
IFQtSGVhZCBDUFVzIGltcGxlbWVudGluZwo+IHByZS1yYXRpZmljYXRpb24gdmVjdG9yLCByZWFk
aW5nIHRoZSB0aC52bGVuYiBDU1IgbWF5IHByb2R1Y2UgYW4gaWxsZWdhbAo+IGluc3RydWN0aW9u
IHRyYXAsIHNvIHRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgb24gc3VjaCBzeXN0ZW1zLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJl
dmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4KCj4gLS0tCj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCAxOSArKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBp
bmRleCA4ZWRjODI2MTI0MWEuLmMwY2Y2Y2Y1Njc0OSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC0yNiw2ICsyNiwx
OCBAQCBkZXNjcmlwdGlvbjogfAo+ICBhbGxPZjoKPiAgICAtICRyZWY6IC9zY2hlbWFzL2NwdS55
YW1sIwo+ICAgIC0gJHJlZjogZXh0ZW5zaW9ucy55YW1sCj4gKyAgLSBpZjoKPiArICAgICAgbm90
Ogo+ICsgICAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAg
ICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAg
ICAgLSB0aGVhZCxjOTA2Cj4gKyAgICAgICAgICAgICAgICAtIHRoZWFkLGM5MTAKPiArICAgICAg
ICAgICAgICAgIC0gdGhlYWQsYzkyMAo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoK
PiArICAgICAgICB0aGVhZCx2bGVuYjogZmFsc2UKPgo+ICBwcm9wZXJ0aWVzOgo+ICAgIGNvbXBh
dGlibGU6Cj4gQEAgLTk1LDYgKzEwNywxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgZGVzY3JpcHRp
b246Cj4gICAgICAgIFRoZSBibG9ja3NpemUgaW4gYnl0ZXMgZm9yIHRoZSBaaWNib3ogY2FjaGUg
b3BlcmF0aW9ucy4KPgo+ICsgIHRoZWFkLHZsZW5iOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAg
VkxFTi84LCB0aGUgdmVjdG9yIHJlZ2lzdGVyIGxlbmd0aCBpbiBieXRlcy4gVGhpcyBwcm9wZXJ0
eSBpcyByZXF1aXJlZCBvbgo+ICsgICAgICB0aGVhZCBzeXN0ZW1zIHdoZXJlIHRoZSB2ZWN0b3Ig
cmVnaXN0ZXIgbGVuZ3RoIGlzIG5vdCBpZGVudGljYWwgb24gYWxsIGhhcnRzLCBvcgo+ICsgICAg
ICB0aGUgdmxlbmIgQ1NSIGlzIG5vdCBhdmFpbGFibGUuCj4gKwo+ICAgICMgUklTQy1WIGhhcyBt
dWx0aXBsZSBwcm9wZXJ0aWVzIGZvciBjYWNoZSBvcCBibG9jayBzaXplcyBhcyB0aGUgc2l6ZXMK
PiAgICAjIGRpZmZlciBiZXR3ZWVuIGluZGl2aWR1YWwgQ0JPIGV4dGVuc2lvbnMKPiAgICBjYWNo
ZS1vcC1ibG9jay1zaXplOiBmYWxzZQo+Cj4gLS0KPiAyLjQ1LjAKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
