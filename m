Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1050C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcUcXGV5XCMXvZgPE8G9N+N4oXmY0ooX1hmisyp0RdQ=; b=GRpmLerREQegoM
	thEHsy+jKURHnXcWVzHIOkicWFUDPjHC/ip91/XIQs8Uz1FLyWa8Gg4SDmjCEGNVRKMAENLvsvmer
	UP6FP4+zdyle8E/FH2kCsyqrdX8WENSGt54Wyhlc4VXBUlMcOTgJp7apl1zBaFGA3TljBog8i9vT6
	jhfxvJqLyX6szeab5O+UCNxY92kDpD//lNHGU05vIGiwoddo0/JcrHF6Ncv+/MZ2bN+0BbpJ2x7I+
	BnyAciuDsJNS8QjhpPc15j7/5uDXK14D+UXs4A39sngB8DE9HpcSY3s51f0ymj5YhB+Xm6Vx3o5fW
	NE9sHKT4ClKju5q2/z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmIk-00000006VQR-2ux5;
	Mon, 10 Jun 2024 21:11:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmIh-00000006VPy-3WDZ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 21:11:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2c2d25b5432so332386a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718053894; x=1718658694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atjVVvhqJGVBGQeQC15VPPq3ZmuONR7VOIjSThozUfs=;
        b=tBBLcgNULIvNN+bS83lxnOgQnB/RGdKGR5pnfXC0yEAZM9lJo9Z7qxmUUr+9smUfSe
         IMbuTiKVfduv++jJc+yQQFlS97gNPLVYiyyJrGqNnJII2Rg+P5KtCi4bvp4PzpXPnDuZ
         zHxen4qr8G1xmpVUIHh6v54bzlb5M1HeSDMxdK0Z51XQLUvfChyfdwcvQUeS7JZASE87
         8lkyWNTsR5MH6N3hk0I3PMR9ix2FCfUt9GaIkFofs05QoKTrJfbQIitvoJcludiDM5am
         lFpW611/dhgrnlC6u6h64gHmVU6oH4j5WTwCgkZQe4BBb+GnwBzqdow8ZgMYOdqZwpWa
         iZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718053894; x=1718658694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atjVVvhqJGVBGQeQC15VPPq3ZmuONR7VOIjSThozUfs=;
        b=NeUDIcU5WVB1hCf4YGHTvaJ20w7uDj+ouDDrQJERIcuH+Udk5LoSYcMVFknVogJ8M5
         18KgPElsGe55zmZeOcFxmifoPvSau0W5SeubtOHp5r//bFMP6v4X1KyGOpM5F8trV8eu
         Lr24S5g/kBnNDCLyDXFHCMK5AOY+jHyPtalVJkryAqbUur3G7jBbjZ8UbPZA2BK+DyPj
         IWFDAtNBmVN2hueY3kDl3s0sikZ8+gyUuYoFF8zJJlCyOE176BlOc7+ViXrx6MjREf2V
         nzNVeDK6znfJsK1O3V7UwOsFo3m4TtXZcwVotz4Y1o8/QW9sWiVTsA5hu6ET5x6n1/8c
         MpAA==
X-Forwarded-Encrypted: i=1; AJvYcCWL5t/eiqPFYGeavAOMlvb9GempOzH6bclpuz7UCamojJ3nO1l2IIvsUMDf8sXm+gp8TeQh9KSehlfGlO/FmhWnvaS0d/CA7qQH1uR7eS82
X-Gm-Message-State: AOJu0YyA8su1CADxO2GPIiofSaWHbJ5h/BDLkyOnl9IffQiCa+T/2cCW
	EdTp+IPkngYJoEU34mwEUrFU4kCly4Y1fSdtzwQnT0h+71BgxWG65hdY/ZRW2ce4QZpLO8qoxdc
	QRs7WIXRh4rAZi2LT9uBgOtoaQX6soIQn6+UbHg==
X-Google-Smtp-Source: AGHT+IGchpbaicHoHxCHYTOkBWbMZo1yhnrL8jazakPLDq3AVxHuApmXC5MJskUmy1m+m4dJ2ZJiSm2/UdJlr5SLmnI=
X-Received: by 2002:a17:90a:5785:b0:2c2:9591:342c with SMTP id
 98e67ed59e1d1-2c2bcac2c65mr9210122a91.3.1718053894451; Mon, 10 Jun 2024
 14:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717612298.git.tjeznach@rivosinc.com> <422f66285da1b164466b223f83d7f06564968f09.1717612299.git.tjeznach@rivosinc.com>
 <20240610-3cd1ba07c1b488a451dd7ddd@orel>
In-Reply-To: <20240610-3cd1ba07c1b488a451dd7ddd@orel>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 10 Jun 2024 14:11:23 -0700
Message-ID: <CAH2o1u6Yav1i=EUX-a4XY4OLtU5RvshHU5ffGE99mgSTrqmN2w@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] iommu/riscv: Command and fault queue support
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_141135_974865_D37ED5EA 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgNDowNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMDUsIDIwMjQgYXQgMTI6NTc6
NDhQTSBHTVQsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+IC4uLgo+ID4gK3N0YXRpYyBpbnQgcmlz
Y3ZfaW9tbXVfcXVldWVfYWxsb2Moc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfcXVl
dWUgKnF1ZXVlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGVu
dHJ5X3NpemUpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgaW50IGxvZ3N6Owo+ID4gKyAgICAg
dTY0IHFiLCByYjsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBVc2UgV0FSTCBiYXNl
IHJlZ2lzdGVyIHByb3BlcnR5IHRvIGRpc2NvdmVyIG1heGltdW0gYWxsb3dlZAo+ID4gKyAgICAg
ICogbnVtYmVyIG9mIGVudHJpZXMgYW5kIG9wdGlvbmFsIGZpeGVkIElPIGFkZHJlc3MgZm9yIHF1
ZXVlIGxvY2F0aW9uLgo+ID4gKyAgICAgICovCj4gPiArICAgICByaXNjdl9pb21tdV93cml0ZXEo
aW9tbXUsIHF1ZXVlLT5xYnIsIFJJU0NWX0lPTU1VX1FVRVVFX0xPRzJTWl9GSUVMRCk7Cj4gPiAr
ICAgICBxYiA9IHJpc2N2X2lvbW11X3JlYWRxKGlvbW11LCBxdWV1ZS0+cWJyKTsKPiA+ICsKPiA+
ICsgICAgIC8qCj4gPiArICAgICAgKiBDYWxjdWxhdGUgYW5kIHZlcmlmeSBoYXJkd2FyZSBzdXBw
b3J0ZWQgcXVldWUgbGVuZ3RoLCBhcyByZXBvcnRlZAo+ID4gKyAgICAgICogYnkgdGhlIGZpZWxk
IExPRzJTWiwgd2hlcmUgbWF4IHF1ZXVlIGxlbmd0aCBpcyBlcXVhbCB0byAyXihMT0cyU1ogKyAx
KS4KPiA+ICsgICAgICAqIFVwZGF0ZSBxdWV1ZSBzaXplIGJhc2VkIG9uIGhhcmR3YXJlIHN1cHBv
cnRlZCB2YWx1ZS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgbG9nc3ogPSBpbG9nMihxdWV1ZS0+
bWFzayk7Cj4gPiArICAgICBpZiAobG9nc3ogPiBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfUVVFVUVf
TE9HMlNaX0ZJRUxELCBxYikpCj4gPiArICAgICAgICAgICAgIGxvZ3N6ID0gRklFTERfR0VUKFJJ
U0NWX0lPTU1VX1FVRVVFX0xPRzJTWl9GSUVMRCwgcWIpOwo+ID4gKwo+ID4gKyAgICAgLyoKPiA+
ICsgICAgICAqIFVzZSBXQVJMIGJhc2UgcmVnaXN0ZXIgcHJvcGVydHkgdG8gZGlzY292ZXIgYW4g
b3B0aW9uYWwgZml4ZWQgSU8KPiA+ICsgICAgICAqIGFkZHJlc3MgZm9yIHF1ZXVlIHJpbmcgYnVm
ZmVyIGxvY2F0aW9uLiBPdGhlcndpc2UgYWxsb2NhdGUgY29udGlndW91cwo+ID4gKyAgICAgICog
c3lzdGVtIG1lbW9yeS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgaWYgKEZJRUxEX0dFVChSSVND
Vl9JT01NVV9QUE5fRklFTEQsIHFiKSkgewo+ID4gKyAgICAgICAgICAgICBjb25zdCBzaXplX3Qg
cXVldWVfc2l6ZSA9IGVudHJ5X3NpemUgPDwgKGxvZ3N6ICsgMSk7Cj4gPiArCj4gPiArICAgICAg
ICAgICAgIHF1ZXVlLT5waHlzID0gcHBuX3RvX3BoeXMoRklFTERfR0VUKFJJU0NWX0lPTU1VX1BQ
Tl9GSUVMRCwgcWIpKTsKPgo+IFNob3VsZG4ndCB0aGlzIGJlIHNvbWV0aGluZyBsaWtlCj4KPiAg
IEZJRUxEX0dFVChSSVNDVl9JT01NVV9QUE5fRklFTEQsIHFiKSA8PCBQQUdFX1NISUZUCj4KPiBw
cG5fdG9fcGh5cygpIGFzc3VtZXMgdGhlIHBwbiBpdCdzIGNvbnZlcnRpbmcgdG8gYmUgc2hpZnRl
ZCB1cCBieSAxMCwgYnV0Cj4gRklFTERfR0VUIGhhcyBzaGlmdGVkIGl0IGRvd24gdG8gemVyby4K
PgoKR29vZCBjYXRjaC4gSXQgc2hvdWxkIGJlIHBmbl90b19waHlzKCkuIEZpeGVkICYgdmVyaWZp
ZWQgb24gSU9NTVUgd2l0aApxdWV1ZSByaW5nIGJ1ZmZlcnMgaW4gZml4ZWQgbWVtb3J5IGxvY2F0
aW9uLgoKVGhhbmtzLAotIFRvbWFzegoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
