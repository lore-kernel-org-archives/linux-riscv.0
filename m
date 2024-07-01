Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B96C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kty4FAWloudrFhcPkdDrGdPZxXQ9vaStTwFJAocSLY=; b=OYkpkTRPNHaHSn
	JFeeStUX1Z89I5jrAQ08ooML2uvkDGLzlGI1g8JfwcRr/P+Tka3ZzdspMlWy1//3orj/3ZXJ62FZ6
	5DruK4RharVWBmN+QS9/AponPnzn7yjPD+0NSzpNzx2haVC01SmEmAc9QS/oyH1YFqCswnOvLP0iY
	HCwMGtzp+zu/2o0j+kPs3CU5lI2cOlWesRhUTG4CwwrgDqsnMSjpwcgDXTJJjxxwktaDEnFE5SYWT
	YZY72HIl0ehchDwrN4Yd0X5JKacEE/Ye7Q6+kRvmSQsbxTe6UXNvze880oOVbu/+q5ZxFXU/1lwKv
	BHMarzuExRw8FrpcKLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFgG-00000002zQk-3kLD;
	Mon, 01 Jul 2024 11:58:48 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFgA-00000002zNO-0cpm
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 11:58:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a7245453319so459879466b.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 04:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719835119; x=1720439919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IksdoqfXXoNA3l1EF7/U4rm+eTkM++3OsdHeCQcdlog=;
        b=kNA/tWvfFTuQpy6xwwkchSxQMbfKhoXGaMABBqBSNRZGPjQr0oTchzzYuTIpRKwDCd
         +JNbw6qpG/oAGOZDFPR3J0FJ6sQuLmuuXs3rbV9S+51hnV92sQVpJH6B2xi711GXrcas
         QI1q66RMi9kaJkbZNclhxON8XA3BjRyT+T8IZhDoH6EvCrUp+/jXqhyYyR5sahhp1YSH
         nbcogeBjM7NuoasQy2zE0UukAfSaEAmcWIcXYV32gHPK0Xeuf9bImrVhkO6e4vQDL2dv
         nnYazk/6lfg/FHo/+aEX4ueBdIb1HykfIAe20NmNS62hx+rDsWYdP+R0Zdz/xqyDGDN7
         oRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719835119; x=1720439919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IksdoqfXXoNA3l1EF7/U4rm+eTkM++3OsdHeCQcdlog=;
        b=CPAfbexuZXJTtwPeCGd6kniIA1GEaibtv6ItROAd0xyBEyUpAdc4z++16M2R7j/GrN
         8H5oMQVWUdKPfd9qd7fspfenqA6WZz+NcF+zq8Ir7Bwb1ZpBuJr5aq6/M8gCXUyaPCXo
         hGDZNNMHFZ4d+EQ61usGV+cVPkMQ1jGHAJSkQnivAaZZ3TU601Q/Tdnb9jxXbYwDaWkg
         lyDZbVf28pCrAkeBsjUYZP5CijU5XMsqCp81/G+0A9bwj7cQQAS693Uvub3RflJvDY/4
         3XTxlHkB50DLJ+/0KWkqloip+wyiCvw1QuuQFcO2fg8b8FORSeqL2QWVLh0QCIgobi8H
         KY9w==
X-Forwarded-Encrypted: i=1; AJvYcCU5UUxnYf20HmrAhMe0TA4OuCKiEahzFU2psbz2IcAzUnIsY+nSE/9cfkzbCbyUazYWwREcROK8/HLLaJCt/eSBh2rBR7Jd2F+ovP6tjZUK
X-Gm-Message-State: AOJu0YwlIu0d4KvsrQDYc2wt6XG+M3tBQRJsGBNtRvc7FYfvJwQ1LM2X
	jEfVOsvROVX01C4NSwnJlJ5Zcp8RzzGtzf/dWVK3CkrW0wC/HlvuG227epdLFE8L9AmAlD2q4Px
	nVxEaV7WRYPpByYwhXrhmTMbof9y9zvjAGOcb7w==
X-Google-Smtp-Source: AGHT+IF2OBW7kIrXE1UpSv50tCGPZtC+ETK4mqONVGqJACOHcLEzbhk5UFyau/lwX9nOtB0IRaHq1FCgCFisjtf323o=
X-Received: by 2002:a17:907:9712:b0:a75:7a8:d70c with SMTP id
 a640c23a62f3a-a751386eca4mr578971166b.4.1719835119427; Mon, 01 Jul 2024
 04:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240630110550.1731929-1-stuart.menefy@codasip.com>
In-Reply-To: <20240630110550.1731929-1-stuart.menefy@codasip.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 1 Jul 2024 13:58:27 +0200
Message-ID: <CAHVXubg+aXS7-smmWS9LwUbAkpfGvet9Zk0UJs_AZhxV2vx6UQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Extend sv39 linear mapping max size to 128G
To: Stuart Menefy <stuart.menefy@codasip.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_045842_359583_85535376 
X-CRM114-Status: GOOD (  23.11  )
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

SGkgU3R1YXJ0LAoKT24gU3VuLCBKdW4gMzAsIDIwMjQgYXQgMTowNuKAr1BNIFN0dWFydCBNZW5l
ZnkgPHN0dWFydC5tZW5lZnlAY29kYXNpcC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBoYXJtb25pemVz
IGFsbCB2aXJ0dWFsIGFkZHJlc3NpbmcgbW9kZXMgd2hpY2ggY2FuIG5vdyBhbGwgbWFwCj4gKFBH
RElSX1NJWkUgKiBQVFJTX1BFUl9QR0QpIC8gNCBvZiBwaHlzaWNhbCBtZW1vcnkuCj4KPiBUaGUg
UklTQ1YgaW1wbGVtZW50YXRpb24gb2YgS0FTQU4gcmVxdWlyZXMgdGhhdCB0aGUgYm91bmRhcnkg
YmV0d2Vlbgo+IHNoYWxsb3cgbWFwcGluZ3MgYXJlIGFsaWduZWQgb24gYW4gOEcgYm91bmRhcnku
IEluIHRoaXMgY2FzZSB3ZSBuZWVkCj4gVk1BTExPQ19TVEFSVCB0byBiZSA4RyBhbGlnbmVkLiBT
byBhbHRob3VnaCB3ZSBvbmx5IG5lZWQgdG8gbW92ZSB0aGUKPiBzdGFydCBvZiB0aGUgbGluZWFy
IG1hcHBpbmcgZG93biBieSA0R2lCIHRvIGFsbG93IDEyOEdpQiB0byBiZSBtYXBwZWQsCj4gd2Ug
YWN0dWFsbHkgbW92ZSBpdCBkb3duIGJ5IDhHaUIgKGNyZWF0aW5nIGEgNEdpQiBob2xlIGJldHdl
ZW4gdGhlCj4gbGluZWFyIG1hcHBpbmcgYW5kIEtBU0FOIHNoYWRvdyBzcGFjZSkgdG8gbWFpbnRh
aW4gdGhlIGFsaWdubWVudAo+IHJlcXVpcmVtZW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0
IE1lbmVmeSA8c3R1YXJ0Lm1lbmVmeUBjb2Rhc2lwLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgc2lu
Y2UgVjE6Cj4gVGhpcyBpcyBhIG1vZGlmaWVkIHZlcnNpb24gb2YgdGhlIHBhdGNoIHBvc3RlZCBi
eSBBbGV4YW5kcmUgR2hpdGkKPiA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gWzFdLiBUaGF0IHZl
cnNpb24gbW92ZWQgdGhlIHN0YXJ0IG9mIHRoZQo+IGxpbmVyIG1hcHBpbmcgYnkgNEdpQiwgYnV0
IHdhcyBzdWJzZXF1ZW50bHkgZm91bmQgdG8gdHJpZ2dlciBhIHByb2JsZW0KPiBpbiB0aGUgS0FT
QU4gY29kZSBbMl0uIEJ5IG1vdmluZyB0aGUgc3RhcnQgYWRkcmVzcyBieSA4R2lCIGFsaWdubWVu
dAo+IHJlcXVpcmVtZW5lbnRzIGFyZSBtYWludGFpbmVkLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNTE0MTMzNjE0Ljg3ODEzLTEtYWxleGdoaXRpQHJp
dm9zaW5jLmNvbS8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvNDAx
MWIzNGEtMWI4Ni00MmM3LWFhZjYtM2JkMjk3MTQ5ZjA2QGdoaXRpLmZyLwo+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IHwgMTEgKysrKysrLS0tLS0KPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggICAgICAgICAgfCAgMiArLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdCBiL0RvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi92bS1sYXlvdXQucnN0Cj4gaW5kZXggZTQ3NmI0Mzg2YmQ5Li4wNzdiOTY4ZGNj
ODEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdAo+IEBAIC00Nywx
MSArNDcsMTIgQEAgUklTQy1WIExpbnV4IEtlcm5lbCBTVjM5Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBLZXJuZWwtc3Bh
Y2UgdmlydHVhbCBtZW1vcnksIHNoYXJlZCBiZXR3ZWVuIGFsbCBwcm9jZXNzZXM6Cj4gICAgX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
fF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgfAo+IC0gICBmZmZmZmZjNmZlYTAwMDAwIHwgLTIyOCAgICBHQiB8IGZmZmZm
ZmM2ZmVmZmZmZmYgfCAgICA2IE1CIHwgZml4bWFwCj4gLSAgIGZmZmZmZmM2ZmYwMDAwMDAgfCAt
MjI4ICAgIEdCIHwgZmZmZmZmYzZmZmZmZmZmZiB8ICAgMTYgTUIgfCBQQ0kgaW8KPiAtICAgZmZm
ZmZmYzcwMDAwMDAwMCB8IC0yMjggICAgR0IgfCBmZmZmZmZjN2ZmZmZmZmZmIHwgICAgNCBHQiB8
IHZtZW1tYXAKPiAtICAgZmZmZmZmYzgwMDAwMDAwMCB8IC0yMjQgICAgR0IgfCBmZmZmZmZkN2Zm
ZmZmZmZmIHwgICA2NCBHQiB8IHZtYWxsb2MvaW9yZW1hcCBzcGFjZQo+IC0gICBmZmZmZmZkODAw
MDAwMDAwIHwgLTE2MCAgICBHQiB8IGZmZmZmZmY2ZmZmZmZmZmYgfCAgMTI0IEdCIHwgZGlyZWN0
IG1hcHBpbmcgb2YgYWxsIHBoeXNpY2FsIG1lbW9yeQo+ICsgICBmZmZmZmZjNGZlYTAwMDAwIHwg
LTIzNiAgICBHQiB8IGZmZmZmZmM0ZmVmZmZmZmYgfCAgICA2IE1CIHwgZml4bWFwCj4gKyAgIGZm
ZmZmZmM0ZmYwMDAwMDAgfCAtMjM2ICAgIEdCIHwgZmZmZmZmYzRmZmZmZmZmZiB8ICAgMTYgTUIg
fCBQQ0kgaW8KPiArICAgZmZmZmZmYzUwMDAwMDAwMCB8IC0yMzYgICAgR0IgfCBmZmZmZmZjNWZm
ZmZmZmZmIHwgICAgNCBHQiB8IHZtZW1tYXAKPiArICAgZmZmZmZmYzYwMDAwMDAwMCB8IC0yMzIg
ICAgR0IgfCBmZmZmZmZkNWZmZmZmZmZmIHwgICA2NCBHQiB8IHZtYWxsb2MvaW9yZW1hcCBzcGFj
ZQo+ICsgICBmZmZmZmZkNjAwMDAwMDAwIHwgLTE2OCAgICBHQiB8IGZmZmZmZmY1ZmZmZmZmZmYg
fCAgMTI4IEdCIHwgZGlyZWN0IG1hcHBpbmcgb2YgYWxsIHBoeXNpY2FsIG1lbW9yeQo+ICsgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfCAgICAgICAg
IHwKPiAgICAgZmZmZmZmZjcwMDAwMDAwMCB8ICAtMzYgICAgR0IgfCBmZmZmZmZmZWZmZmZmZmZm
IHwgICAzMiBHQiB8IGthc2FuCj4gICAgX19fX19fX19fX19fX19fX19ffF9fX19fX19fX19fX3xf
X19fX19fX19fX19fX19fX198X19fX19fX19ffF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bh
Z2UuaAo+IGluZGV4IDExNWFjOThiOGQ3Mi4uODFkNDdmYmJkOTI3IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wYWdlLmgKPiBAQCAtMzcsNyArMzcsNyBAQAo+ICAgKiBkZWZpbmUgdGhlIFBBR0VfT0ZGU0VU
IHZhbHVlIGZvciBTVjQ4IGFuZCBTVjM5Lgo+ICAgKi8KPiAgI2RlZmluZSBQQUdFX09GRlNFVF9M
NCAgICAgICAgIF9BQygweGZmZmZhZjgwMDAwMDAwMDAsIFVMKQo+IC0jZGVmaW5lIFBBR0VfT0ZG
U0VUX0wzICAgICAgICAgX0FDKDB4ZmZmZmZmZDgwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgUEFH
RV9PRkZTRVRfTDMgICAgICAgICBfQUMoMHhmZmZmZmZkNjAwMDAwMDAwLCBVTCkKPiAgI2Vsc2UK
PiAgI2RlZmluZSBQQUdFX09GRlNFVCAgICAgICAgICAgIF9BQyhDT05GSUdfUEFHRV9PRkZTRVQs
IFVMKQo+ICAjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4gLS0KPiAyLjQzLjAKPgoKU28gdGhl
IGlzc3VlIHdhcyB3aXRoIG15IHBhdGNoLCBzb3JyeSEgWW91ciBmaXggbWFrZXMgc2Vuc2Ugc28g
eW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
