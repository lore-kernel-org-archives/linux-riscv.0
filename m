Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBFEC54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CU1riqGkSNPztYeuvE86Ot4csrUz3jZB19yvieiyu9U=; b=hvf24CTjTNm53c
	6RvFZtpcsXc0SCQI0kUKuKcjuhxqMtGZnHPou++CG4xuAmxQzfLbsYQ00yu7Fvk3rDTxiajQIyfRL
	eulx37znULHvIgITgd2he9xty1mjy8omBEefAL/jt7C8au8hECT131d9lyoWLAcsOupdLDey4nXYN
	mSD/0E2SJPoBFQvooMT8UOM54JknYMLXSlHyNfJjauGNZjxZ3QhKQZvdzEMIRYYqOk4XDsjV7FoId
	4wq818c74FYEudz9AkIId0clTA+SEkDqv+X8XSi42rG1snkdIY5Ea9xm8wkFIzIlTcTtg19tViL3r
	r5RTCTsWf0y7irB4UlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIP2t-00000003UO8-2XSo;
	Fri, 23 May 2025 09:50:31 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOzW-00000003Trb-478h
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 09:47:04 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4dfa0f38fcdso3010055137.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993621; x=1748598421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG/X9C8yLKGrCYYF7Sr7M9bc4WrV25ayjzMFPl4s38o=;
        b=dU6n5fcJm5x23dvIveTzazw993VxR/6d5seHwOky4ZN1NY6kvd6h6e9LOY2rWpKLKf
         2HROQX7lCUqRwYHGvxYPb4XZYqneRGc7gqi89LdOTsSWtf20FXIwDM3vCcfZf+con/2U
         V9ZjWoiHc+NUsYFYMJVmXnj6aoJm7OqK9qFqs2hExD/FMwHSolT2xKIujorKTfB3fI2x
         vUDmehNlAsPDqrLQuuaiVNWeSmNzcGMmbAtCZ8xkAVq2ssap4EPCpTa8bIPeCk6l7OX0
         dA7yizsuk4llgieQnyqIsFpOFJ8BPVp6RdWvSTFFmSEvBAs9qnqa7v8R8+p0Bu+SNnZc
         oViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993621; x=1748598421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG/X9C8yLKGrCYYF7Sr7M9bc4WrV25ayjzMFPl4s38o=;
        b=n+Jr/GooP91PAPVC9Blzx2+pJxosLKB/uoJ9syEgDhQ9vvYa2eu/2qsVw69om4DlQn
         A1P7AbcgjzoXcmzcDCRTYoH534NADV6blAX2bxKi6NbxyGOyp5tAv2K3Vu2QyWw19/vD
         qjaQXhPs633IafkYLpylD6oVIV1u4MWU2lh+N7T3L4gg7TC5VoUB2bHrWYHL4LGkd1tv
         6HNEfsnT8y1Y/krBvvmdiGb51HZlG9HuYMva3QLQSMxB16Waauve1ZGIh/GvC/2RImsf
         3+8oE/JcjTspb+ktVSSPI0RoAFWzYbSFmjZLw5Rs4HoaiucNmX8mkxxfcvi3dEukvl+M
         8vXA==
X-Gm-Message-State: AOJu0Yyy337Q72KC5VugPbHz/8ScJHK1yJKDz4KVfc880KrogoiVLfu1
	aB7bbC+t6lNhgnHhE2zeb9hwEQiijkIyqxSdsMmZE5WGSDFSwgUNXcS9jgbzzH6DWs+cziPLvkM
	AGK5oZmww99SGQ+IqoJU72qeGsVqHbzzp13MHhBsgfPGj
X-Gm-Gg: ASbGncva4vICA3fjEYvR3g3ZVCMYGX8HmU5mP4/yatRRovUzkeDMIOQclaD/XBWRHUQ
	dLjb3AXrn3m0P+0+CK7kZknjPB7uBUpIgG7aC95Ycdn9Q+vp821DPlvW1hFCpR5gbQMR1m/OtWL
	VoQsrt9Ud+T7vpYBLn7mFYtg/xgnRSMreLzQ==
X-Google-Smtp-Source: AGHT+IHAYdMEYRC8z0rbKLDfqHoHryyGMy92RPuCzpxv8FFDn4mHzgqK5lJyEjBbQ67ikR/UAYHuhSL5IbJNpdX2yIo=
X-Received: by 2002:a05:6102:8005:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4e049d57331mr26626257137.7.1747993621363; Fri, 23 May 2025
 02:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
 <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
In-Reply-To: <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
From: Han Gao <rabenda.cn@gmail.com>
Date: Fri, 23 May 2025 17:46:50 +0800
X-Gm-Features: AX0GCFtrmKXe53zw37RzsAhs7ISafqXR93CpDlieunRkAwGVKhVAexNUbzdpcBw
Message-ID: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_024703_020530_5A7A6CD3 
X-CRM114-Status: GOOD (  15.32  )
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

SSB3aWxsIHJlbGVhc2UgdjIgbGF0ZXIgdG8gYWRkIGV4cGxhbmF0aW9uIGFuZCBhZGQgZml4IHRh
ZwoKVGhhbmtzLAoKSGFuCgpPbiBGcmksIE1heSAyMywgMjAyNSBhdCA0OjU04oCvUE0gQWxleGFu
ZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPgo+IEhpIEhhbiwKPgo+IE9uIDUvMjIv
MjUgMTk6MjcsIEhhbiBHYW8gd3JvdGU6Cj4gPiBGaXggWzFdIHNhdmUvcmVzdG9yZSB2ZWN0b3Ig
cmVnaXN0ZXIgZXJyb3IKPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNDExMTMteHRoZWFkdmVjdG9yLXYxMS05LTIzNmMyMjc5MWVmOUByaXZvc2luYy5jb20vIFsx
XQo+Cj4KPiBXb3VsZCB5b3UgbWluZCByZXBocmFzaW5nIHRoZSBsb2c/IEl0IHNob3VsZCBleHBs
YWluIHdoYXQgd2FzIHdyb25nIGFuZAo+IGhvdyB5b3UgZml4ZWQgaXQuCj4KPiBUaGFua3MsCj4K
PiBBbGV4Cj4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPHJhYmVuZGEuY25AZ21h
aWwuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAx
MiArKysrKystLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+IGluZGV4IGU4YTgz
ZjU1YmUyYi4uN2RmNjM1NTAyM2EzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZWN0b3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+
ID4gQEAgLTIwMCwxMSArMjAwLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0
YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnNhdmVfdG8sCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgVEhFQURfVlNFVFZMSV9UNFgwRThNOEQxCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgVEhFQURfVlNCX1ZfVjBUMAo+ID4gICAgICAgICAgICAgICAgICAgICAgICJhZGQg
ICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIKPiA+IC0gICAgICAgICAgICAgICAgICAgICBUSEVB
RF9WU0JfVl9WMFQwCj4gPiArICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjhUMAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICJhZGQgICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIK
PiA+IC0gICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9WMFQwCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjE2VDAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAi
YWRkICAgICAgICAgICAgdDAsIHQwLCB0NFxuXHQiCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
VEhFQURfVlNCX1ZfVjBUMAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZTQl9WX1Yy
NFQwCj4gPiAgICAgICAgICAgICAgICAgICAgICAgOiA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIs
ICJ0MCIsICJ0NCIpOwo+ID4gICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgYXNtIHZv
bGF0aWxlICgKPiA+IEBAIC0yMzYsMTEgKzIzNiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19y
aXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3Jl
Xwo+ID4gICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZTRVRWTElfVDRYMEU4TThEMQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YwVDAKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAiYWRkICAgICAgICAgICAgdDAsIHQwLCB0NFxuXHQiCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgVEhFQURfVkxCX1ZfVjBUMAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIFRIRUFE
X1ZMQl9WX1Y4VDAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAiYWRkICAgICAgICAgICAgdDAs
IHQwLCB0NFxuXHQiCj4gPiAtICAgICAgICAgICAgICAgICAgICAgVEhFQURfVkxCX1ZfVjBUMAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YxNlQwCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0Igo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YwVDAKPiA+ICsgICAgICAgICAgICAgICAgICAgICBU
SEVBRF9WTEJfVl9WMjRUMAo+ID4gICAgICAgICAgICAgICAgICAgICAgIDogOiAiciIgKGRhdGFw
KSA6ICJtZW1vcnkiLCAidDAiLCAidDQiKTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAg
ICAgICAgIGFzbSB2b2xhdGlsZSAoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
