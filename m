Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D27C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1CjtE/JwAWqcjJKt9jC2On8yIYt6fYk2oi2cFRuuwg=; b=sPcCCbyCkGEpGR
	HhBhlFPZar/P5/riER9y5MMnkyuwbxxMlGybyAxf0aqpd4AUtsG5h4bNzUWeht7+5kjkeNPX7afXJ
	+6cO2GjZIFGk+nSMUylwgqgGIw1pZ+1VraD9AN9mzh77lM0n8gJDnSb3SZRERUbj66T9YkPcHXIRP
	wKPpoR+PoIOB+UqfKR+m83kVAgx/zp9Ywp+GdZbZ/zCEVEXRl7/Xl3Q8siueJQTaKbfpFIBpu8B1q
	8M6NSx03goHkaJyiLeMn+gOczPNgs3+LwNYPwxPbYFcrcUdcFmn/AZLKKvJTRjNdgvcUHsf3PrSjv
	vychk5OCCrLmJ0qfPDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAT-003TI6-1t;
	Mon, 24 Jul 2023 09:47:53 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAQ-003TF0-0b
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 09:47:52 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-78362f57500so230230039f.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690192068; x=1690796868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8bfGUj6PVSplOllAd2MEpS6lx5ONn993m33c0NCbEw=;
        b=eG+k/0eQ1dVjbqUi+Fgm5PV75urijLYhKsnv1AN21qidWsleaq1GIF1yDsE1SYlpcS
         T1BxyDHhpVghbdpylHZWvEkgNNXNsUhPOhkVR8ztiRuD38F3hfD5yQS0Kq7CCZmCY1wt
         KsRe23hLlzfw1YizGD0LyDsk9NdWHCl6NGAIqVzPI0doFxxf1ycp5HjHdw2u2iKzaIKk
         TiVKYNEmEpfQmhNW9llQU5t5Xriof54H/K3G5MSMVJ9/HCFuo9E32mevzrPPrJJAaXmt
         fOgsXcbEw7RdxuFumYd8xkSO8kzeatorXj3eZK3kKdFo3ZGLz4dbfiLi8cg6wEHOxhYD
         W6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192068; x=1690796868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8bfGUj6PVSplOllAd2MEpS6lx5ONn993m33c0NCbEw=;
        b=Pn+XrhrB17wKl2CnsOM+lFh1FIPnL/c38FL49CA4MWhyPyWNwbuyUD7/GWY/Qzkgwa
         wk4BmL2Qif5QwsSukfunDMbJoGBxNuw9p2Vhf+S72oWzAi13iGmhvvpuxtYcYBh0V1hP
         6dzJziMVzjEu9pmuHTgBz9/hfpcO5PePnjnccmdQiTd+uy6bz+gZjqTDSV+fwwjL2h8m
         qkhs4tM62X5R44MG8PU/2rF6Ueq2Ykt9aIKqvV1aHyVs7RrZ7o7LCL1FRubRQ4w5LTHg
         onKp0dlr5wZP6gRqOW694MsktfOSWkYFeKLErz0U41qczkucAMKRlgDD1msEsZY/tOL6
         4hGQ==
X-Gm-Message-State: ABy/qLbEF50QyrX+IpN4w8G1abTdiJ2d/jHhFsx657hToNnnHeOJcCjK
	briryYrvsO8alh89NN/DVzdddvVQ4gcULljRjid3ig==
X-Google-Smtp-Source: APBJJlGfSvBbIxJHAJLERDdIj18GqzcBJdh2D0XeEHGN9JTosZLxsbRqgvszSigLLVQzezIwjDLaussRKBoZe3KwqTw=
X-Received: by 2002:a5d:81d1:0:b0:783:74c0:54ae with SMTP id
 t17-20020a5d81d1000000b0078374c054aemr6940592iol.21.1690192068270; Mon, 24
 Jul 2023 02:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr> <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
In-Reply-To: <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 24 Jul 2023 17:47:37 +0800
Message-ID: <CANXhq0rz1J+0t9M-e5NY015HhDT1Yy024_-Uan9CSJ4rMqtyng@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024750_273402_16E95D95 
X-CRM114-Status: GOOD (  27.70  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgMjowMOKAr0FNIFRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTksIDIwMjMgYXQgODoxMuKA
r1BNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+ID4KPiA+IEhl
bGxvIFRvbWFzeiwKPiA+Cj4gPiBPbiA3LzE5LzIzIDIyOjMzLCBUb21hc3ogSmV6bmFjaCB3cm90
ZToKPiA+ID4gRW5hYmxlcyBtZXNzYWdlIG9yIHdpcmUgc2lnbmFsIGludGVycnVwdHMgZm9yIFBD
SWUgYW5kIHBsYXRmb3JtcyBkZXZpY2VzLgo+ID4gPgo+ID4KPiA+IFRoZSBkZXNjcmlwdGlvbiBk
b2Vzbid0IG1hdGNoIHRoZSBzdWJqZWN0IG5vciB0aGUgcGF0Y2ggY29udGVudCAod2UKPiA+IGRv
bid0IGp1cyBlbmFibGUgaW50ZXJydXB0cywgd2UgYWxzbyBpbml0IHRoZSBxdWV1ZXMpLgo+ID4K
PiA+ID4gKyAgICAgLyogUGFyc2UgUXVldWUgbGVuZ3RzICovCj4gPiA+ICsgICAgIHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiY21kcV9sZW4iLCAmaW9tbXUt
PmNtZHFfbGVuKTsKPiA+ID4gKyAgICAgaWYgKCFyZXQpCj4gPiA+ICsgICAgICAgICAgICAgZGV2
X2luZm8oZGV2LCAiY29tbWFuZCBxdWV1ZSBsZW5ndGggc2V0IHRvICVpXG4iLCBpb21tdS0+Y21k
cV9sZW4pOwo+ID4gPiArCj4gPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBk
ZXYtPmRldi5vZl9ub2RlLCAiZmx0cV9sZW4iLCAmaW9tbXUtPmZsdHFfbGVuKTsKPiA+ID4gKyAg
ICAgaWYgKCFyZXQpCj4gPiA+ICsgICAgICAgICAgICAgZGV2X2luZm8oZGV2LCAiZmF1bHQvZXZl
bnQgcXVldWUgbGVuZ3RoIHNldCB0byAlaVxuIiwgaW9tbXUtPmZsdHFfbGVuKTsKPiA+ID4gKwo+
ID4gPiArICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwg
InByaXFfbGVuIiwgJmlvbW11LT5wcmlxX2xlbik7Cj4gPiA+ICsgICAgIGlmICghcmV0KQo+ID4g
PiArICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgInBhZ2UgcmVxdWVzdCBxdWV1ZSBsZW5ndGgg
c2V0IHRvICVpXG4iLCBpb21tdS0+cHJpcV9sZW4pOwo+ID4gPiArCj4gPiA+ICAgICAgIGRtYV9z
ZXRfbWFza19hbmRfY29oZXJlbnQoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gPiA+
Cj4gPgo+ID4gV2UgbmVlZCB0byBhZGQgdGhvc2UgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmcg
ZG9jIChvciB0aHJvdyB0aGVtIGF3YXksCj4gPiBJIHRob3VnaHQgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGhhdmUgdGhlbSBhcyBwYXJ0IG9mIHRoZSBkZXZpY2UKPiA+IGRlc2NpcHRpb24gdGhhbiBh
IG1vZHVsZSBwYXJhbWV0ZXIpLgo+ID4KPgo+IFdlIGNhbiBhZGQgdGhlbSBhcyBhbiBvcHRpb25h
bCBmaWVsZHMgdG8gRFQuCj4gQWx0ZXJuYXRpdmVseSwgSSd2ZSBiZWVuIGxvb2tpbmcgaW50byBh
biBvcHRpb24gdG8gYXV0by1zY2FsZSBDUS9QUQo+IGJhc2VkIG9uIG51bWJlciBvZiBhdHRhY2hl
ZCBkZXZpY2VzLCBidXQgdGhpcyBnZXRzIHRyaWNraWVyIGZvcgo+IGhvdC1wbHVnZ2FibGUgc3lz
dGVtcy4gSSd2ZSBhZGRlZCBtb2R1bGUgcGFyYW1ldGVycyBhcyBhIGJhcmUtbWluaW11bSwKPiBi
dXQgc3RpbGwgbG9va2luZyBmb3IgYmV0dGVyIHNvbHV0aW9ucy4KPgo+ID4KPiA+ID4gK3N0YXRp
YyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9wcmlxX2lycV9jaGVjayhpbnQgaXJxLCB2b2lkICpk
YXRhKTsKPiA+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9wcmlxX3Byb2Nlc3Mo
aW50IGlycSwgdm9pZCAqZGF0YSk7Cj4gPiA+ICsKPiA+Cj4gPiA+ICsgICAgIGNhc2UgUklTQ1Zf
SU9NTVVfUEFHRV9SRVFVRVNUX1FVRVVFOgo+ID4gPiArICAgICAgICAgICAgIHEgPSAmaW9tbXUt
PnByaXE7Cj4gPiA+ICsgICAgICAgICAgICAgcS0+bGVuID0gc2l6ZW9mKHN0cnVjdCByaXNjdl9p
b21tdV9wcV9yZWNvcmQpOwo+ID4gPiArICAgICAgICAgICAgIGNvdW50ID0gaW9tbXUtPnByaXFf
bGVuOwo+ID4gPiArICAgICAgICAgICAgIGlycSA9IGlvbW11LT5pcnFfcHJpcTsKPiA+ID4gKyAg
ICAgICAgICAgICBpcnFfY2hlY2sgPSByaXNjdl9pb21tdV9wcmlxX2lycV9jaGVjazsKPiA+ID4g
KyAgICAgICAgICAgICBpcnFfcHJvY2VzcyA9IHJpc2N2X2lvbW11X3ByaXFfcHJvY2VzczsKPiA+
ID4gKyAgICAgICAgICAgICBxLT5xYnIgPSBSSVNDVl9JT01NVV9SRUdfUFFCOwo+ID4gPiArICAg
ICAgICAgICAgIHEtPnFjciA9IFJJU0NWX0lPTU1VX1JFR19QUUNTUjsKPiA+ID4gKyAgICAgICAg
ICAgICBuYW1lID0gInByaXEiOwo+ID4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4KPiA+Cj4g
PiBJdCBtYWtlcyBtb3JlIHNlbnNlIHRvIGFkZCB0aGUgY29kZSBmb3IgdGhlIHBhZ2UgcmVxdWVz
dCBxdWV1ZSBpbiB0aGUKPiA+IHBhdGNoIHRoYXQgYWRkcyBBVFMvUFJJIHN1cHBvcnQgSU1ITy4g
VGhpcyBjb21tZW50IGFsc28gYXBwbGllcyB0byBpdHMKPiA+IGludGVycnVwdCBoYW5kbGVycyBi
ZWxvdy4KPiA+Cj4KPiBhY2suIHdpbGwgZG8uCj4KPiA+Cj4gPiA+ICtzdGF0aWMgaW5saW5lIHZv
aWQgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3NldF9hZGRyKHN0cnVjdCByaXNjdl9pb21tdV9jb21t
YW5kICpjbWQsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU2NCBhZGRyKQo+ID4gPiArewo+ID4gPiArICAgICBjbWQtPmR3b3JkMCB8PSBSSVND
Vl9JT01NVV9DTURfSU9USU5WQUxfQVY7Cj4gPiA+ICsgICAgIGNtZC0+ZHdvcmQxID0gYWRkcjsK
PiA+ID4gK30KPiA+ID4gKwo+ID4KPiA+IFRoaXMgbmVlZHMgdG8gYmUgKGFkZHIgPj4gMikgdG8g
bWF0Y2ggdGhlIHNwZWMsIHNhbWUgYXMgaW4gdGhlIGlvZmVuY2UKPiA+IGNvbW1hbmQuCj4gPgo+
Cj4gb29wcy4gVGhhbmtzIQo+CgpJIHRoaW5rIGl0IHNob3VsZCBiZSAoYWRkciA+PiAxMikgYWNj
b3JkaW5nIHRvIHRoZSBzcGVjLgoKPiA+IFJlZ2FyZHMsCj4gPiBOaWNrCj4gPgo+Cj4gcmVnYXJk
cywKPiAtIFRvbWFzego+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
