Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D31FE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6zqsC0pEvTfUu/7zqvIeLgHbhIB3XQiwCa1qVGUXCI=; b=aouCiKOi7yA2fz
	rE2Icz6bA7slc6kC8SQdAYLHMzNZS2EKD/VGDurpBdG0F6M9I+3Q8FHe1rQGQM3vJlf6NWTl8vcum
	Sn0tZiS/Q8a9aVY0m9fcot2oJKauLuC1cATR39b6iZn7i5kqroLNWs7Fy1+pVdLhzM4UDFNhJdmhp
	UgjtG1fpjfoYB01SP+RkXTcPPSksgfNFdOKoz3ravarHIDrKLmrgVvnNg0ZSCuWTqhFRd94qqD8RF
	k77ntdmIbpmQTHycu3oLp3KFgA6nYH60iZad/IX2Av7u1FC9ShpmUFbXkx2o1A4POSPkWGCOROUkD
	6AH15QFQG/WCOnwfghQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOW5X-000000042JT-2ipL;
	Fri, 20 Dec 2024 06:02:15 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOW5U-000000042Hs-2PlH
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 06:02:14 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-29ff039dab2so703669fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734674527; x=1735279327; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jegu/XPjEaJZiSCWQaM5VBAcTa9QFBaJlquTQwtRuI=;
        b=EVnk6xliKBc5vFO8GMV0LF0/U05Vh4mNkMxCTUITh23HRI+fZUXOAHrRVz7Dq+/arV
         eZyDDzfgEtrR96tBUE+B0A9Js3gUCeXXqOArVN6RSqNS2ZWpb3DX6YwJ7fhj6g91kBJf
         DJkAjsN3DJq3sUFRDNmljxTJX9TvA2vIIuh0BvvzpJb9sk9WY6q7mTQwkHsedcljIVKB
         cXbvbjb5lO90aw9dgAS0qIrOdSyVugnKsIyRPK+F6RbEUpsI7vArER5dGqnbLAx3dxMZ
         JgFO7gbI2lsWzNiWCY7dQUwAghLlNTRHt7nXF75k2SfEtegWfhw//7a4jeL+xVoyS/I5
         iT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734674527; x=1735279327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jegu/XPjEaJZiSCWQaM5VBAcTa9QFBaJlquTQwtRuI=;
        b=HWOXvwqghszT722ZvvFqGjxuOg3dKhqvj2iEgP8KtqwEIVDU5rCUm1i4xvb4DNsLcp
         JyMNgahRJtKqQhxMOTI+6bKjS6F6ynw3N9b0uMVKQTeOq1V/2XTKfTtwSSxizz2RHfKk
         WtTmGPZSzizcL+uV6pS3MnQjgmoTFRZVQHPWtZjBdTCYDq3bKBXFqzEcowmuPsZxcbCh
         yQVhF+8Pe+MZ7EjIFNgRNYXGfi8DPhaSbv9q30lfPSXBFxB7nL70t23Fal3rwVdGDpWH
         PsP+SigPXN1bpL0qP5LyMqUUpHrYJT7zKaOS/raFzWWxuzTZWX6Hm/BYbGztyIMFtUFG
         fkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64gd0LF7BTMpPg7WpQhoP3lveMIcuF03sVJlox2r4ZBrttPyrgy7jzUz7S1TJuvoq9rmep4vhbcGFrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ3eUpVPMMHHF2TfAAEtTTLdMVwXsMVjdGly2FeYxFeJraVFfO
	6rdDHRx4Vnko+lJJ47i4WtyWe8SZnWQKPjKyY9yyY67i46Mudb7cOgY4wWjwGY2jFXfdRJdj5FR
	adktVI35OPJ2JpAcQd1kj8KqOWaAWurgxoxH3nQ==
X-Gm-Gg: ASbGncsZME/RuSomnjbvfR4XyGvd1jBwb11kK6tFzAnxWpHjdIZaQ1F6lbnjDaixr1k
	xA5Gm4rSFkLJ1qoZiMihRotXF1ZRU354EcaAwLR3y
X-Google-Smtp-Source: AGHT+IEFVx0pQRKTGpQzc97H1Jwo5r8p0f1443xxPLYle57wIiCfN+lt8OLo+V2/fzf8LCRK2ZAuDXHSalq09tAauzE=
X-Received: by 2002:a05:6870:fe8b:b0:29e:3c8d:61a0 with SMTP id
 586e51a60fabf-2a7fafda608mr920068fac.8.1734674527388; Thu, 19 Dec 2024
 22:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20241025091527.57825-1-cuiyunhui@bytedance.com> <20241219-4332cfcb6bd63baf5d0328d7@orel>
In-Reply-To: <20241219-4332cfcb6bd63baf5d0328d7@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 20 Dec 2024 14:01:56 +0800
Message-ID: <CAEEQ3wkVg2vhGz18VM3fdXHB+aLrQBQ1ZnFmxcRpAAugTHm_gw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: Enable Zicbom in usermode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor@kernel.org, cleger@rivosinc.com, 
	charlie@rivosinc.com, evan@rivosinc.com, samuel.holland@sifive.com, 
	andybnac@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_220212_931850_9A88F179 
X-CRM114-Status: GOOD (  18.63  )
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

SGkgZHJld++8jAoKT24gVGh1LCBEZWMgMTksIDIwMjQgYXQgMTA6MTLigK9QTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDI1LCAy
MDI0IGF0IDA1OjE1OjI3UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBMaWtlIFppY2Jv
eiwgYnkgZW5hYmxpbmcgdGhlIGNvcnJlc3BvbmRpbmcgYml0cyBvZiBzZW52Y2ZnLAo+ID4gdGhl
IGluc3RydWN0aW9ucyBjYm8uY2xlYW4sIGNiby5mbHVzaCwgYW5kIGNiby5pbnZhbCBjYW4gYmUK
PiA+IGV4ZWN1dGVkIG5vcm1hbGx5IGluIHVzZXIgbW9kZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
PiBpbmRleCAxOTkyZWE2NDc4NmUuLmJjODUwNTE4YWI0MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiBAQCAtOTI0LDcgKzkyNCw3IEBAIHVuc2lnbmVkIGxvbmcgcmlzY3ZfZ2V0
X2VsZl9od2NhcCh2b2lkKQo+ID4gIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2
b2lkKQo+ID4gIHsKPiA+ICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJ
U0NWX0lTQV9FWFRfWklDQk9aKSkKPiA+IC0gICAgICAgICAgICAgY3VycmVudC0+dGhyZWFkLmVu
dmNmZyB8PSBFTlZDRkdfQ0JaRTsKPiA+ICsgICAgICAgICAgICAgY3VycmVudC0+dGhyZWFkLmVu
dmNmZyB8PSBFTlZDRkdfQ0JJRSB8IEVOVkNGR19DQkNGRSB8IEVOVkNGR19DQlpFOwo+ID4gICAg
ICAgZWxzZSBpZiAoYW55X2NwdV9oYXNfemljYm96KQo+ID4gICAgICAgICAgICAgICBwcl93YXJu
KCJaaWNib3ogZGlzYWJsZWQgYXMgaXQgaXMgdW5hdmFpbGFibGUgb24gc29tZSBoYXJ0c1xuIik7
Cj4gPiAgfQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPgo+IEhpIFl1bmh1aSwKPgo+IERvIHlvdSBw
bGFuIHRvIHNlbmQgYSB2MiBvZiB0aGlzPwo+Cj4gVGhhbmtzLAo+IGRyZXcKCkkgd2lsbCBzZW5k
IHYyIGluIHRoZSBuZXh0IGZldyBkYXlzLiBUaGFua3MgZm9yIHRoZSByZW1pbmRlci4KCgpUaGFu
a3PvvIwKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
