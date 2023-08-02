Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9709CC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gcEDErsi9UGFmLJ8qPOcTnZOgAykexshQZK/dqWfGo=; b=4ohK3uwFHn0lvW
	2Spigl9BOJsav7L5xTjpmWCB7/YTsRLOADBv7IHXZ6B490MIEUX0jwEK8u5G8Xu7/i0tYCY34gK7t
	Y6YX1NbMRCfHIaLafS74MfJJZlIhHL3sygdhedyaYyI+eZYiHJeLI12+ykPNwtCSQ+vq1FyTaI1O+
	uhZXxlxHRDkkj+sm71S6MK0eKc51/H7ZP9tgyHnymNGJY1kvkP3muVERhd8yO1aND+QzSYT3b4dct
	F091yUv7m/ezn/Mn1wWhpU5grA+OqbaOmeKtO26O+q07Glc+SR11QcshExouxJLl+1ZoJzDUEE14Y
	ndSmte1hA5HPcvqJnU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRISx-005pef-38;
	Wed, 02 Aug 2023 20:29:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRISv-005pcx-1N
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:29:06 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68730bafa6bso937837b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691008142; x=1691612942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hqvoTOiyuv4V1kgAdgMNiSxKc6mmFloyOiPHrBE85c=;
        b=OUshjBs3oLkzrOHgBh0MTMLHTYl9xc2uTs/DfoPYFfyAo4mxNCWm8J4c9QM9hSexum
         9HBylmRqvzav1PjL/yeLumKinHJ29RDq5JH0bhVnvEVvlFOG6cE89Nz+C+VZEiXN6GyC
         XE873DFIWrg4Psq8+zzR6SAdu+1WvbZwP9yxUmXFBqXEw525K/0miYFDpnK9xUuLahCN
         MPZl5xGpGevXKZ9VlsrzRHn1HwBtfMSKWM/Rli1NyeCdOiFLEFgDVNLhpZ5wrJtbz85O
         jzJ3956aUY4nykeCy9V7egZ5d1VrdSBrAOieqj/eiWcz0CobtVTQPYEpQAAl1MANoq0M
         homA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691008142; x=1691612942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hqvoTOiyuv4V1kgAdgMNiSxKc6mmFloyOiPHrBE85c=;
        b=ksF/W3AJcYnFKzRLTOf7asZionX+cTnoyZ2twDITDxqVCb3P0LrXD9Pra/xBn79Ky4
         +NUcaW0uaH0Z7WoXETnZXBPA7yV7wz5vgcXXdmaPa0FPhNzOW8oiBQVU3lvY8dh+D7Pi
         bGUQ3FhckJTOJYpXAFy2OvnkyvByS/hSS1H93UboGi5gJuwThi04WSFq7m+p1axauuIa
         3W8mGzSiqlyndepWtbtHdLwVZYfEcH5ahIEzziLlirbi2fgkYUiQ+6xZk6LO/0qO6gvg
         YOSDqEJSZkMBuxt4QQNJhgN7nCOHHBkeV2OuCYstomE44j3R/bBRMpUdgfGnUkz3CJQS
         FyLQ==
X-Gm-Message-State: ABy/qLZGS6yljcVMAWp82Ky3gCe9Eanpqig3xj8bKVrbLdw7KRfdFKwH
	CEJEF0dTwDJTcZnNgNoX0C3xHddx3LEjscO5sifkGA==
X-Google-Smtp-Source: APBJJlGP08btXPIyZdLRW9fI8QltrQJlC7A3Ah3EyOyL7RumMhw8sISeCHdZdoMcG5/SZZ1fgZnxmXXhYem8Rv+0x6w=
X-Received: by 2002:a17:90b:101:b0:268:ad94:3cf5 with SMTP id
 p1-20020a17090b010100b00268ad943cf5mr14387097pjz.8.1691008141832; Wed, 02 Aug
 2023 13:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com>
 <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr> <CANXhq0puxuHA2cEyb2+TobkoFTc=7MQqtv7DYbuZdvf0T8+iUQ@mail.gmail.com>
 <dc3974f0-500c-b7d3-c8ca-df069dbd02a8@ics.forth.gr> <CANXhq0pz5U2i3V7P2qYnhZf5fpcNUrs4J24in2ffMncK7yx6pw@mail.gmail.com>
In-Reply-To: <CANXhq0pz5U2i3V7P2qYnhZf5fpcNUrs4J24in2ffMncK7yx6pw@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 2 Aug 2023 13:28:51 -0700
Message-ID: <CAH2o1u7BodgZO2R03e9gyMGCR+bU58aAq2-uKYUSF4F7=Xiifg@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Zong Li <zong.li@sifive.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_132905_465000_1405E5A1 
X-CRM114-Status: GOOD (  22.40  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNTozOOKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyAxLCAyMDIzIGF0IDc6MzXigK9BTSBOaWNrIEtv
c3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPiA+Cj4gPiBPbiA3LzMxLzIzIDE2
OjE1LCBab25nIExpIHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCA1OjMy4oCv
UE0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4gPiA+Pgo+ID4g
Pj4gT24gNy8yOS8yMyAxNTo1OCwgWm9uZyBMaSB3cm90ZToKPiA+ID4+PiBPbiBUaHUsIEp1bCAy
MCwgMjAyMyBhdCAzOjM04oCvQU0gVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4gPiA+Pj4+ICsgICAgICAgaW9tbXUtPmNhcCA9IHJpc2N2X2lvbW11X3JlYWRx
KGlvbW11LCBSSVNDVl9JT01NVV9SRUdfQ0FQKTsKPiA+ID4+Pj4gKwo+ID4gPj4+PiArICAgICAg
IC8qIEZvciBub3cgd2Ugb25seSBzdXBwb3J0IFdTSXMgdW50aWwgd2UgaGF2ZSBBSUEgc3VwcG9y
dCAqLwo+ID4gPj4+Cj4gPiA+Pj4gSSdtIG5vdCBjb21wbGV0ZWx5IHVuZGVyc3RhbmQgQUlBIHN1
cHBvcnQgaGVyZSwgYmVjYXVzZSBJIHNhdyB0aGUgcGNpCj4gPiA+Pj4gY2FzZSB1c2VzIHRoZSBN
U0ksIGFuZCBrZXJuZWwgc2VlbXMgdG8gaGF2ZSB0aGUgQUlBIGltcGxlbWVudGF0aW9uLgo+ID4g
Pj4+IENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGl0Pwo+ID4gPj4+Cj4gPiA+Pgo+ID4gPj4g
V2hlbiBJIHdyb3RlIHRoaXMgd2UgZGlkbid0IGhhdmUgQUlBIGluIHRoZSBrZXJuZWwsIGFuZCB3
aXRob3V0IElNU0lDIHdlCj4gPiA+PiBjYW4ndCBoYXZlIE1TSXMgaW4gdGhlIGhhcnQgKHdlIGNh
biBzdGlsbCBoYXZlIE1TSXMgaW4gdGhlIFBDSWUgY29udHJvbGxlcikuCj4gPiA+Cj4gPiA+IFRo
YW5rcyBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLCBkbyB3ZSBzdXBwb3J0IHRoZSBNU0kgaW4gbmV4
dCB2ZXJzaW9uPwo+ID4gPgo+ID4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW4gSU9NTVUg
aW1wbGVtZW50YXRpb24gb3V0IHRoZXJlIChlbXVsYXRlZCBvciBpbgo+ID4gaHcpIHRoYXQgY2Fu
IGRvIE1TSXMgYW5kIGlzIG5vdCBhIHBjaWUgZGV2aWNlICh0aGUgUUVNVSBpbXBsZW1lbnRhdGlv
bgo+ID4gaXMgYSBwY2llIGRldmljZSkuIElmIHdlIGhhdmUgc29tZXRoaW5nIHRvIHRlc3QgdGhp
cyBhZ2FpbnN0LCBhbmQgd2UKPiA+IGFsc28gaGF2ZSBhbiBJTVNJQyBldGMsIHdlIGNhbiB3b3Jr
IG9uIHRoYXQuCj4KPiBJIGd1ZXNzIEkgY2FuIGFzc2lzdCB3aXRoIHRoYXQuIFdlIGhhdmUgYW4g
SU9NTVUgaGFyZHdhcmUgKG5vbi1wY2llCj4gZGV2aWNlKSB0aGF0IGhhcyBhbHJlYWR5IGltcGxl
bWVudGVkIHRoZSBNU0kgZnVuY3Rpb25hbGl0eSwgYW5kIEkgaGF2ZQo+IGNvbmR1Y3RlZCB0ZXN0
aW5nIG9uIGl0LiBQZXJoYXBzIGxldCBtZSBhZGQgdGhlIHJlbGF0ZWQgaW1wbGVtZW50YXRpb24K
PiBoZXJlIGFmdGVyIHRoaXMgc2VyaWVzIGlzIG1lcmdlZC4KClRoYW5rcywgZ2V0dGluZyBNU0kg
c3VwcG9ydCBmb3Igbm9uLVBDSWUgSU9NTVUgaGFyZHdhcmUgd291bGQgYmUgZ3JlYXQhCgpiZXN0
LAotIFRvbWFzegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
