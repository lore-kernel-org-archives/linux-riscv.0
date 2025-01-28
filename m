Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD86C0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cjy5FV3Xvq1kqkMtfREoMG/lISDmDm3TRWFpOec1wjE=; b=RpKQBXQxcnLuek
	x8OrmhpxCXFShweo4BviVTdoRz2AD2zNbZ+r2BmjWDfZzTVSI+Q10K1a2ds8w5dpedYwbA6mUE3FF
	8bqfJ4dk/5pT0nCHQOAVaVbH80FmuIsKxFEuwJDChe5UI9JljbMqgs6SD6Mrx1aaKczUayeLJWeup
	hyzLRNVxje2s+HT4tn29BRaLO4ZizggFuA7Y2SO/H88O3eMdyVau9JYJjEU2+0fK+Rc/CEfn6d78i
	T2PDCVpZFnNEtv37VXmvSK5HGvkqmOdsDML96+39cf8izkhBtwTj0SCp/uVgxA1EH1Tdwsmb/sfzo
	IMbsOmBTrGCsEJBlnrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnt9-00000005DDK-3Oc5;
	Tue, 28 Jan 2025 15:52:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnoI-00000005C3I-3G9n
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:32 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30761be8fa7so58193051fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738079249; x=1738684049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORpfm8gqz7BJwSi63RXYjOXHuDS2RzlvCyhJKnf9cco=;
        b=c3N4Li1dPRAWfqqbiEmEu3+GYdfmF5WldcgD9lCpnSGAz8Mw73SehmPgJkM3v9wHQm
         FJic+UAb6xkxe3kSscrwIV9exjJm5o1UsWVhqqmfs1lpvCF/NkO4K3n8sZiYcp3Q8AHC
         /w/antu8nsPDD83QiFKG6zOEsZo/E49L2RNFHzYBDHUk9QahHEihctZhdBaXoC5fEStQ
         aWRXl6lOC9WtQUerXObq/BK5RG0KzwoLE8EQdzzjbRd9ZaQDel4hH0KOBeqtW29yMMMe
         zhDavPhJS8be0tWUqbG2CCo2S1+C/nFg+RwtAQ5wEg/2LoolGxYvzbVG5eGPWgEhGzHI
         OtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079249; x=1738684049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORpfm8gqz7BJwSi63RXYjOXHuDS2RzlvCyhJKnf9cco=;
        b=O1ggT4ovvAtQtrYu1YcoF5IV+jooFb1QJxBIc0bnHb4t9oMFGqAwUppPddFXQHEJ6A
         UPSpinthF9vgdkKzsY/m+PC0PSX+bDT+To47OzoPWamjo8I4duGnwb8SJbV18uPBpc7o
         f+EWcUZpnFbjgwkDpZrUrQ1x8+NMjtrTqThDtkhO/sksVF3SV24/O2XAmvWDwxxQgtDo
         hWMu741cXwHI4w1LVdDzo2t2NfFcPN1xe59paCXntUrMYitaMwnZimOM0Dltlr9uXy/X
         K0oD9XCwI1jdcanyBwHifRSFpFmDPeZIW7IIqr/J7Lh/dMOUHzqL4YsSiQN+uXZSNfiq
         24OA==
X-Forwarded-Encrypted: i=1; AJvYcCVzOIDMv7XaWOrPQpCIeeqRIDS4E1d/7b559uwDQXlQ0rZnaJPo4gnB5MlGIgkAwtyBwjgPNQvec3fC0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCDGBETaWIpJTvJYB467vTIleFp3WtDNs9tgGrLxNIbu6dVU7C
	+4Ngg0rDUSgeqCT/4HnxKIAg+hZZxraYXOws9REzZSVh6ucIYSIcO/1zS9oGq2vKOZMKW1q6oSL
	3nRyr+hHmRsi6ZvwuLDN49YpJYTIU0H5XALccTA==
X-Gm-Gg: ASbGncsdUHHl6Rcvjj17JYrgTouLEvQj/53ImyYJy9ZQ5F3h3KEfIOrXsOaZxHNRm44
	dRfUU9Q3A+lgCpvWJBu5VFzoD7RohDKw3f/9hqikAwbsIeCw5AuHqOTLO5Y/sx3YC65OHcUQ=
X-Google-Smtp-Source: AGHT+IFzJzZ2trars/DKC2OeK820bAEA4OESZ8xv0fZ7CNGPrWwWN85tqO2dBttYZ+HZbEEhgHIzk9XO6G2yur8X4WM=
X-Received: by 2002:a2e:be27:0:b0:302:4132:499 with SMTP id
 38308e7fff4ca-3072cb22561mr176573531fa.25.1738079248573; Tue, 28 Jan 2025
 07:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net> <20250127181726.GA538260-robh@kernel.org>
In-Reply-To: <20250127181726.GA538260-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2025 16:47:17 +0100
X-Gm-Features: AWEUYZnoc3lmDNNFG2cVuqRGGhatacTuYZ1Uow9WWWXEfz68QbxO7Kxh6hOpHpw
Message-ID: <CACRpkdaj+cJFsYqJF5OY0v=Och6nxnBKV0C9aWb6-aLZhZobdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074730_824182_B97E15B7 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgNzoxN+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFtPbG9mXQo+ID4gSXQgc2VlbXMgd29yc2UgdG8gbWUgdG8gbWlzZGVz
Y3JpYmUgdGhlIGhhcmR3YXJlIGFzIHNlcGFyYXRlIGJsb2Nrcwo+ID4gd2l0aCBhIGRldmljZS10
cmVlIGJpbmRpbmcgdGhhdCBubyBsb25nZXIgZGVzY3JpYmVzIHRoZSBhY3R1YWwgaGFyZHdhcmUs
Cj4gPiBidXQgaXQncyBub3QgdXAgdG8gbWUuCj4KPiBJIGFncmVlLiBJdCdzIGNsZWFybHkgMSBi
bG9jayBnaXZlbiB0aGUgZmlyc3QgMyBiYW5rcyBhcmUgaW50ZXJsZWF2ZWQuCj4KPiBJZiBMaW51
eCBjYW4ndCBoYW5kbGUgMSBub2RlIGZvciBOIGdwaW9fY2hpcCdzLCB0aGVuIHRoYXQncyBhIExp
bnV4Cj4gcHJvYmxlbS4gTWF5YmUgaXQgY2FuLCBJREsuIFRoZSBsb29rdXAgZnJvbSBhIERUIG5v
ZGUgdG8gZ3Bpb19jaGlwIGp1c3QKPiBuZWVkcyB0byBtYXRjaCBvbiBtb3JlIHRoYW4ganVzdCBE
VCBub2RlIHBvaW50ZXIsIGJ1dCBsb29rIGF0IHRoZSBub2RlCj4gcHRyIGFuZCBhcmcgY2VsbHMu
CgpBbnkgb3BlcmF0aW5nIHN5c3RlbSBiZW5lZml0cyBmcm9tIG1vZGVsaW5nIHRoZSBHUElPcyBz
dWNoIHRoYXQKb25lIHNldCBvZiAzMmJpdCByZWdpc3RlcnMgW3IwLCByMSAuLiBybl0gYmVjb21l
cyBhIGRpc2NyZXRlIGVudGl0eSBmb3IKdGhlIE9TLgoKUmVhc29uaW5nOiBhbnkgT1Mgd2lsbCB3
YW50IHRvIGJlIGFibGUgdG8gY29udHJvbCBzZXZlcmFsIGxpbmVzIGluCmEgc2luZ2xlIGhhcmR3
YXJlIG9wZXJhdGlvbiwgc3VjaCBhcyBhIHJlZ2lzdGVyIHdyaXRlLCBmb3IgZXhhbXBsZQp0byBz
aGFrZSBhIGNsb2NrIGFuZCBkYXRhIGxpbmUgd2l0aCBhIHNpbmdsZSB3cml0ZV90b19yZWdpc3Rl
cigpCm9wZXJhdGlvbi4gSWYgdGhlIGhhcmR3YXJlIGlzIGRlc2NyaWJlZCBpbiBjaHVua3Mgb2Yg
MzIgYml0IHJlZ2lzdGVycywKdGhpcyBpcyBlYXN5IC0gRGF0YSBPdXQgUmVnaXN0ZXIsIERhdGEg
SW4gUmVnaXN0ZXIsIERpcmVjdGlvbgpSZWdpc3RlciBuIGJpdHMsIGlmIGFuIG11bHRpcGxlLXdy
aXRlL3JlYWQgb3BlcmF0aW9uIGhpdHMgdGhpcyBlbnRpdHksIHdlCmtub3cgaXQgY2FuIGJlIGhh
bmRsZWQgd2l0aCBhIHNpbmdsZSByZWdpc3RlciB3cml0ZSBvciByZWFkLgoKWWVzLCB0aGUgc2Ft
ZSBjYW4gYmUgYWNoaWV2ZWQgYnkgaGFyZGNvZGluZyB0aGlzIHNwbGl0IGludG8gdGhlCmRyaXZl
ci4gQnV0IGhhdmluZyB0aGUgYmluZGluZyBsaWtlIHN1Y2ggZW5jb3VyYWdlcyBpdC4KCmZvby1n
cGlvcyA9IDwmZ3BpbzIgMD4sIDwmZ3BpbzIgNz47Cgpib3RoIG5lZWQgdG8gYmUgc2V0IGhpZ2gg
YXQgb3V0c2V0LCB3ZWxsIHRoZXkgYXJlIGluIHRoZSBzYW1lCmVudGl0eSBhbmQgY29udHJvbGxl
ZCBieSBhIHNpbmdsZSByZWdpc3Rlciwgc28gKCsvLSBvdmVyaGVhZCk6Cgpmb29yZWcgPSBmb29y
ZWcgfCAoMSA8PCAwKSB8ICgxIDw8IDcpOwoKSSBhZ3JlZSB0aGlzIGhhcmR3YXJlIGlzIGhhcmRl
ciB0byBjbGFzc2lmeSBhcyBzdWNoIHNpbmNlIHRoZSBibG9ja3MKc2hhcmUgYSBzaW5nbGUgSVJR
IGxpbmUgLSBpZiB0aGV5IGhhZCBpbmRpdmlkdWFsIElSUSBsaW5lcyBpdCB3b3VsZCBiZQphIGRv
bmUgZGVhbCwgdGhleSBhcmUgc3ViYmxvY2tzIC0geWV0IHNoYXJlZCBJUlEgbGluZXMgYXJlIG5v
dCAqdGhhdCoKdW5jb21tb24uCgpEb2VzIHRoaXMgbW9kZWxpbmcgcmVmbGVjdCBob3cgdGhlIGhh
cmR3YXJlIGFjdHVhbGx5IGxvb2tzPyBMaWtlbHkuCgpUaGUgd2F5IEdQSU9zIGFyZSBidWlsdCB1
cCBmcm9tIHNpbGljb24gaW8tY2VsbHMgYXJlIG5vdCB0aGF0IGNvbXBsZXguCkFsbCB0aGUgMzIg
Yml0cyBmcm9tIHRoZSBzZXQgb2YgcmVnaXN0ZXJzIHdpbGwgYmUgcm91dGVkIHRvIGNvbnNlY3V0
aXZlCnBpbnMsIGxvb2tpbmcgYXQgdGhlIHBpbiBsYXlvdXQgb2YgdGhlIFNvQyB3b3VsZCBjb25m
aXJtIGlmIHN1YnNlcXVlbnQKYml0cyBtYXAgdG8gc3Vic2VxdWVudCBwaW5zLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
