Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA1EEE3F3F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koU0QlHwWC6xRcrFi+WhRF8crpkHhG7K7NjktXNFzbw=; b=Yx0RYkUk6dW8NH
	5lLP93CIzVhssJKiQk0NpFe8veBt8PJn59k8ABjaLLR7M1d96g98d0PWMN1hx/gNvXB53wWY7czr/
	9BVsUjgI9kJeHMot8CClhzvRoMTK5BFYIhyCqQKYZXsNHkpyIoEyNmNIKCHLBboq+22QRjx1OmqdO
	KT6tJPA1indCD6a0yhlHrz6XA0+WFkIcUJAIT8KOjBJL95EsYva88boRWJr4Ov7aW+72BFAjNtl/Q
	wYDgSFuzbY8LhNLW9I8pEAAWcCJ2JiHGuLaV9ipw7ZpgUrlxC64583rjeEO5fC86CkVVpyFTKsjXQ
	MG4/dNQhrOzWDM3Cxuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCN8-004Eo5-09;
	Tue, 12 Sep 2023 23:00:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCN5-004En9-1k
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 23:00:40 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41513d2cca7so130011cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694559637; x=1695164437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyJmDwSUEBAT5TkJCd5pReZaLPzxfz30Afne5dFuwCE=;
        b=foL0F/57w9vnfcXKE0el4YhvnoL6jRLxvAFmXrq45Piq3V8bIuGv4N9dAFG46uYULn
         zNTMs7RRDa8R9VuQjC5NLk9/SJaenTjn1cQDyFzAa9XJSQTskGg+lcSTCk4oYWx2RLrF
         bJZAaSG1qOicGpmAGVG1n6HHcSIdjNLKxj2hw/1g0uVKo58mFcG9MqbjJGZ1FpvjAIic
         VYsWUtBDg6rini2cmoubUYdQd+L2lFH/yhA43XGjKGZR7/WImSQNaPkHfsWo5kr8OYOB
         0eCjpqxS7kNB7QJZSODJHCuypLuttin1YwKj0WZSO/9kffnNzZivgtp60sTvKyV44K5v
         hvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694559637; x=1695164437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyJmDwSUEBAT5TkJCd5pReZaLPzxfz30Afne5dFuwCE=;
        b=l9O8hcsqKBIW2t9GT+KIRpLfPoPgvKkBA3Y8g9qK9VsuMKVfh0uPigIMijta1UQUQf
         xrn8edSxs+BRqAYomc6cYTv/l3dGLxP1rhcruWgJYZMIMmzLfeyyHNj+JXmB3KPWTimI
         t+nD0H+5kV2+DgD4UW2lDqhP8+wKO8y6cZvocWo34tG7mQ8v0pguh4nP3GDEJ7Whj7TF
         FZ7B2+ygDkJNWwpu1z3MWoQKLasGiPuNZOoFDlfarKe7iKzH39nB2+8T8vt4qRPdZ0UV
         zk7/8GsYmgmxL8C5Xc2qeaBxATq/kMy7hzo4GfxVFbV0TO2+cjSUbuJAuALMvi9A5DFz
         dnYg==
X-Gm-Message-State: AOJu0Ywr/3KJ46MPcyyP1nyBAYQYKmiNlryVwnkAKz80lKhgyvnfxAXy
	S5J2m7+wYmJwXpS4xbceWvrJZWKfwKR9LrcBMgIKfA==
X-Google-Smtp-Source: AGHT+IG3EcPXprLCAz21KTVrZkubgDDyvYv8YnsUJ3H3R/WudOZ5LBCK6NOqf5lVyujbVWA/U47VjCUJj4AsCKvlQJo=
X-Received: by 2002:ac8:58d0:0:b0:410:88a5:92f with SMTP id
 u16-20020ac858d0000000b0041088a5092fmr116138qta.0.1694559637027; Tue, 12 Sep
 2023 16:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230912174928.528414-1-apatel@ventanamicro.com> <20230912174928.528414-4-apatel@ventanamicro.com>
In-Reply-To: <20230912174928.528414-4-apatel@ventanamicro.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 12 Sep 2023 16:00:00 -0700
Message-ID: <CAGETcx8vXifmS2U5PTtmBySA=dih3GUOQ93A_qA5nm3faQqcGg@mail.gmail.com>
Subject: Re: [PATCH v8 03/16] of: property: Add fw_devlink support for msi-parent
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_160039_578293_36226D91 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTA6NTDigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGFsbG93cyBmd19kZXZsaW5rIHRvIGNyZWF0
ZSBkZXZpY2UgbGlua3MgYmV0d2VlbiBjb25zdW1lcnMgb2YKPiBhIE1TSSBhbmQgdGhlIHN1cHBs
aWVyIG9mIHRoZSBNU0kuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwgMiArKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9v
Zi9wcm9wZXJ0eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gaW5kZXggY2Y4ZGFjZjNlM2I4
Li43NThlYTgyMmU0NmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gKysr
IGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gQEAgLTEyNjcsNiArMTI2Nyw3IEBAIERFRklORV9T
SU1QTEVfUFJPUChyZXNldHMsICJyZXNldHMiLCAiI3Jlc2V0LWNlbGxzIikKPiAgREVGSU5FX1NJ
TVBMRV9QUk9QKGxlZHMsICJsZWRzIiwgTlVMTCkKPiAgREVGSU5FX1NJTVBMRV9QUk9QKGJhY2ts
aWdodCwgImJhY2tsaWdodCIsIE5VTEwpCj4gIERFRklORV9TSU1QTEVfUFJPUChwYW5lbCwgInBh
bmVsIiwgTlVMTCkKPiArREVGSU5FX1NJTVBMRV9QUk9QKG1zaV9wYXJlbnQsICJtc2ktcGFyZW50
IiwgIiNtc2ktY2VsbHMiKQo+ICBERUZJTkVfU1VGRklYX1BST1AocmVndWxhdG9ycywgIi1zdXBw
bHkiLCBOVUxMKQo+ICBERUZJTkVfU1VGRklYX1BST1AoZ3BpbywgIi1ncGlvIiwgIiNncGlvLWNl
bGxzIikKPgo+IEBAIC0xMzYxLDYgKzEzNjIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1cHBs
aWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gICAgICAgICB7IC5wYXJz
ZV9wcm9wID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPiAgICAgICAgIHsgLnBhcnNlX3Byb3AgPSBw
YXJzZV9ncGlvLCB9LAo+ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW9zLCB9LAo+
ICsgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX21zaV9wYXJlbnQsIH0sCgpQbGVhc2UgZm9s
bG93IHRoZSBzYW1lIG9yZGVyaW5nIGhlcmUgYXMgdGhlIERFRklORV9TSU1QTEVfUFJPUCBtYWNy
b3MuClNvLCB0aGlzIHNob3VsZCBjb21lIGFmdGVyIHRoZSBwYW5lbCBvbmUuCgotU2FyYXZhbmEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
