Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AEDCFB440
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzyxEADectuX2zEt/hIdnoDdp+2DDx31r9d/PTBO1dg=; b=IKsW2xZ5A4gpOO
	3QAyFsuJvFO7g+PiOfQ0cHmAJ0DZzzgpIOGCh80BjFvbq7nD9eq1dvL31RorktWRX/ak82D89n/52
	FALzkrxayGxrRWt1QsIGjm2sTHIkIrOyuaKk/UdPouwGWIl6DWOyRLHQe/RLZSdt/2Ykg9kuVHQNl
	Pww/129t6ZVFyI2aRegS5NUp+LpWeV+btwaL3nYUAvMnqiPQLmQtR3pugdMyPQMRy9NO7w5Hskbci
	6qdf8mSI8JV0bc0dy9OJ0SHugpt7gwUTQs6KEdnBpF0WtB2d1sY2JRlqvrnwOaW9+89cDmEU8a3JJ
	8dmn7e+fSDzTAFmN0gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmUA-00000002GEf-3I1o;
	Mon, 07 Oct 2024 12:05:10 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmU6-00000002GCS-3zYi
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 12:05:09 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbc9a60480so35280907b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 05:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302705; x=1728907505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXmKVzAQZn86c7HUK/8juEU7RqfMz4EookfMfTEtDus=;
        b=Vdh8kR/Q9vz5hqhqWN6ELG5O1fi3afMujOQvet+NIa7V2eXqmsybUG0vGUSDo5dDNq
         AwhDSs0nWH0f9iocHm/MJS6bj0Dfxle9r1XvBkPUG2SM2fSLMbXIk5r+tEamt7fDQR0a
         LV4936D++FsDIvWoyuKZoT1QNg1CUoI/pDB81MjKOFyJgz8F1XovxQqqyEBGxGDXwrzn
         DRot3DAv26QaHeTAemPMYd7GZgPzaagQZay+Hpt1Le3/EFoN2UPeJMzZtZqC9786HkSf
         PLbzmX/s41Mbr3+uwcTMpQyFeJ7iLTpOHO7noKmvnmn1A06j3KV2aqQRX9OkRsktE0JL
         vMug==
X-Forwarded-Encrypted: i=1; AJvYcCX1rM0cOutXg+XjNGE5Byna4IW8PoFidxIgYRBz0jo5rg+18trr9BXBs+IPtWj2quU9rKciYiax7uAtZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEj9pMjG5CCTc4QFIvzTz1cnJmSGTriost13+qrpV9EC6s3heW
	MAdwZyYpaPfj6FDn+00lRuahT+5NylXyCgRaGjWdHZlnSr1nBm4HFPN2bcS2
X-Google-Smtp-Source: AGHT+IH0LnVMGehdcD5Kmrh3wcVqgy92m0AwkNnoJQxO7odBGRx9jG6tcQZWCmit7JwqIr7NAr2/zw==
X-Received: by 2002:a05:690c:744a:b0:6e2:413:f19 with SMTP id 00721157ae682-6e2c72412a5mr92450147b3.27.1728302705316;
        Mon, 07 Oct 2024 05:05:05 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d927f569sm10007817b3.50.2024.10.07.05.05.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:05:05 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2346f164cso37840097b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 05:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNtg6FeHDBkOtozkz5lrl+6MQ1+zBNh0YM7cgR4OxojFECY8Arx3hsEeZowlYmLC44iYAOeiAop4gJ7w==@lists.infradead.org
X-Received: by 2002:a05:690c:f8e:b0:6db:31f6:a812 with SMTP id
 00721157ae682-6e2c6fcba10mr104259927b3.4.1728302704891; Mon, 07 Oct 2024
 05:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com> <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:04:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrun9=Oz6eD95wMQ=8Hb7JO5xgrNsZuxPWDrCrx3Q1_g@mail.gmail.com>
Message-ID: <CAMuHMdWrun9=Oz6eD95wMQ=8Hb7JO5xgrNsZuxPWDrCrx3Q1_g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som:
 Update partition table for spi-nor flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_050507_151387_E00C1627 
X-CRM114-Status: GOOD (  14.41  )
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

T24gRnJpLCBPY3QgNCwgMjAyNCBhdCA3OjMy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToKPiBVcGRhdGUgcGFydGl0aW9uIHRhYmxlIGZvciBzcGktbm9y
IGZsYXNoLCBzbyB0aGF0IHdlIGNhbiBmbGFzaCBib290bG9hZGVycwo+IGluIExpbnV4IGJ5IGV4
ZWN1dGluZyB0aGUgYmVsb3cgY29tbWFuZHM6Cj4gZmxhc2hfZXJhc2UgL2Rldi9tdGQwICAwIDAK
PiBmbGFzaF9lcmFzZSAvZGV2L210ZDEgIDAgMAo+IG10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZDAg
MCAke0JMMl9GSUxFX1NJWkV9ICR7QkwyX0lNQUdFfQo+IG10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210
ZDEgNTEyICR7RklQX0ZJTEVfU0laRX0gJHtGSVBfSU1BR0V9Cj4KPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gdjQtPnY1Ogo+ICAq
IFVwZGF0ZWQgYmwyIHNpemUgdG8gMHgxZDAwMAoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2Fz
LWRldmVsIGZvciB2Ni4xMy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
