Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79128C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XesN2cdkTLpHUDSSj9VXQUw8kDLjRkAp+yLoAneJIbg=; b=ZKB/SUfEK8Qiql
	x528FeRALCfh2dNwZNngh16lrGwkV4jxoIBeq2SnoWl4zN1zjwPTCofrBj5ikIoh+Rzh138bMeDzN
	+IVEIE3lKj+/tWSQaFnzQ6pXC6BJF+4wTCvsY/ICEhXQgWdsuRdti4VSraefTfKTGXME61NdfATMA
	KQUemUUKEtRa6f3vQJ3XebD+UdR60rWW6FcKqUENoaTjYYb1v4uQntcu+DjSh5R6IAaODM11YMaFW
	gCL/vdMIBHBCJ+nkbnjQuDNbm6x1SNGuWFfVx01IrLqGBfsLON1uUizH+Nl0ctyBwsOxzHrLAAQT2
	6SoHD6traSizlAAHuCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx6EL-001nX3-2F;
	Sun, 29 Oct 2023 13:53:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx6EJ-001nWO-20
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 13:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FF7460C75
	for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 13:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFEDC433CD
	for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698587604;
	bh=zJ9rQygoM8kC84lZz3ZFZdyHYWBgZmA0dEGRK0EIVB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcPhryle1nPZKm9ciRqCL7ztYiThrcZ85tDntmRb1Ki8h2ks6+iv2e7xO3mum4Z8M
	 6WIJ3gv+TgptBi81x3/8YHZpW92HOll2gAa6WsyGNSfPX0NmmOHA2t+aysaTb9HRaN
	 YrfkEhB9fFWe3PzSvS0qpCNIgE5BuW6AB8eBOqt2OdLSKJkzAjTJ6luA938r1Zn20U
	 xqoXNvcdvL3z7mqGwltA7dCWs+ixAU8qDaetbSaj46VeHwonFbgHtEw/RQZTZMAN2Y
	 ls9xQGZEGahipcUXzAJe0buCpsVgQiy+oQTLCJOGjUqvlDHy5PbMhlkvW9ijw+czc7
	 CGTcUpXGTKf4g==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9d2d8343dc4so70487266b.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 06:53:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YwTARzlcBsXaq0sgCTGOJMPXJZBKRJc5VzP9R4lKcDUl6PSrKtR
	wQL0jdj4jtbWBM0jEeUxTTkXWa8cmCAtddhROuM=
X-Google-Smtp-Source: AGHT+IGej6UNZ6b071bPq8fbKcWondhTjBHUkCO2wPSFUOTrVzzPU4mggOSj4V78PBrCkSeH1UMe0be/YfRYQAEFOTA=
X-Received: by 2002:a17:907:7ea0:b0:9cf:18ce:95e6 with SMTP id
 qb32-20020a1709077ea000b009cf18ce95e6mr5811045ejc.62.1698587602824; Sun, 29
 Oct 2023 06:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
 <CAJF2gTRHbvwyZR_qUNsc3E9X=Y1H7yTcZo3NLgXQ45=jm1jbTg@mail.gmail.com> <A1D410BE9DD1128F+45f92224-dc0f-0bfd-d122-fbbcac48eaf3@tinylab.org>
In-Reply-To: <A1D410BE9DD1128F+45f92224-dc0f-0bfd-d122-fbbcac48eaf3@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 29 Oct 2023 21:53:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjChyoGHo9uumyAGEs--KW6=OqV9SjRp=4XBY4R7nVNg@mail.gmail.com>
Message-ID: <CAJF2gTQjChyoGHo9uumyAGEs--KW6=OqV9SjRp=4XBY4R7nVNg@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com, alexghiti@rivosinc.com, anup@brainfault.org, 
	samuel@sholland.org, rppt@kernel.org, suagrfillet@gmail.com, 
	panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_065327_768326_4C2E9ECD 
X-CRM114-Status: GOOD (  24.80  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMjo1MuKAr1BNIFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNo
dWFpQHRpbnlsYWIub3JnPiB3cm90ZToKPgo+Cj4KPiDlnKggMjAyMy85LzE0IDEyOjU5LCBHdW8g
UmVuIOWGmemBkzoKPiA+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgMTE6MTHigK9BTSBTb25nIFNo
dWFpIDxzb25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBGcm9tOiBT
b25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPj4KPiA+PiBTaW5jZSB0aGUgY29t
bWl0IDAxMWYwOWQxMjA1MiBzZXQgc3Y1NyBhcyBkZWZhdWx0IGZvciBDT05GSUdfNjRCSVQsCj4g
Pj4gdGhlIGNvbW1lbnQgb2YgQ09ORklHX1BBR0VfT0ZGU0VUIHNob3VsZCBiZSB1cGRhdGVkIHRv
by4KPiA+Pgo+ID4+IEZpeGVzOiAwMTFmMDlkMTIwNTIgKCJyaXNjdjogbW06IFNldCBzdjU3IG9u
IGRlZmF1bHRseSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRA
Z21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgg
fCA0ICsrLS0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+ID4+IGluZGV4IGI1NWJhMjA5MDNl
Yy4uNTNjMDAxNjRjMDQyIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGFnZS5oCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+PiBAQCAt
MzMsOCArMzMsOCBAQAo+ID4+ICAgI2RlZmluZSBQQUdFX09GRlNFVCAgICAgICAgICAgIF9BQyhD
T05GSUdfUEFHRV9PRkZTRVQsIFVMKQo+ID4gV2h5IG5vdCByZW1vdmUgQ09ORklHX1BBR0VfT0ZG
U0VUIGFuZCBkZWZpbmUgUEFHRV9PRkZTRVRfTDIgPwo+ID4KPiBDT05GSUdfUEFHRV9PRkZTRVQg
aG9sZHMgdGhlIGZpcnN0IG1lbW9yeSBhZGRyZXNzIHJlZ2FyZGluZyB0aGUKPiBkaWZmZXJlbnQg
Q09ORklHcyAoTU1VLDMyQklULDY0QklUKS4KPgo+IEFzIGZvciA2NEJJVCwgaXQgYWN0dWFsbHkg
cmVwcmVzZW50cyAiUEFHRV9PRkZTRVRfTDUiIGZvciBTdjU3IHBhZ2UgbW9kZQo+IGRlZmF1bHRs
eS4gQW5kIHRoZSByZWFsIHBhZ2UgbW9kZSBtYXkgYmUgZG93bmdyYWRlZCBmcm9tIGtlcm5lbCBj
bWRsaW5lCj4gb3IgcmVzdHJpY3RlZCBieSB0aGUgaGFyZHdhcmUsIHNvIHRoZSBQQUdFX09GRlNF
VF9MMy9MNCB3YXMgZGVmaW5lZCB0bwo+IHNldCB0aGUgcmVhbCBQQUdFX09GRlNFVC4KPgo+IElJ
VUMsIHRoZSAiUEFHRV9PRkZTRVRfTDIiIHlvdSBzcGVjaWZpZWQgbWlnaHQgYmUgdGhlICJQQUdF
X09GRlNFVF9MNSIgSQo+IHByZXZpb3VzbHkgbWVudGlvbmVkLAo+IElmIG5vdCwgdGhlIFBBR0Vf
T0ZGU0VUX0wyIHNlbWFudGljYWxseSBtZWFucyB0aGUgcGFnZSBvZmZzZXQgZm9yCj4gMzJCSVQn
cyBkZWZhdWx0IFN2MzIgcGFnZSBtb2RlLGFuZCBpdCBoYXMgYWxyZWFkeSBiZWVuIGhlbGQgaW4K
PiBDT05GSUdfUEFHRV9PRkZTRVQgdG9vLgo+Cj4gU28gSU1PIHRoZXJlIGlzIG5vIG5lZWQgdG8g
dG91Y2ggQ09ORklHX1BBR0VfT0ZGU0VUIGluIHRoaXMgY29udGV4dC4KCkkgbWVhbjoKCiNkZWZp
bmUgUEFHRV9PRkZTRVRfTDUgICAgICAgICBfQUMoMHhmZjYwMDAwMDAwMDAwMDAwLCBVTCkKI2Rl
ZmluZSBQQUdFX09GRlNFVF9MNCAgICAgICAgIF9BQygweGZmZmZhZjgwMDAwMDAwMDAsIFVMKQoj
ZGVmaW5lIFBBR0VfT0ZGU0VUX0wzICAgICAgICAgX0FDKDB4ZmZmZmZmZDgwMDAwMDAwMCwgVUwp
CiNkZWZpbmUgUEFHRV9PRkZTRVRfTDIgICAgICAgICBfQUMoMHhDMDAwMDAwMCkKCiNpZmRlZiBD
T05GSUdfTU1VCiNpZmRlZiBDT05GSUdfNjRCSVQKI2RlZmluZSBQQUdFX09GRlNFVCAgICAgICAg
ICAgICBrZXJuZWxfbWFwLnBhZ2Vfb2Zmc2V0CiNlbHNlIC8qIENPTkZJR182NEJJVCAqLwojZGVm
aW5lIFBBR0VfT0ZGU0VUICAgICAgICAgICAgIFBBR0VfT0ZGU0VUX0wyCiNlbmRpZiAvKiBDT05G
SUdfNjRCSVQgKi8KI2Vsc2UgLyogQ09ORklHX01NVSAqLwojZGVmaW5lIFBBR0VfT0ZGU0VUICAg
ICAgICAgICAgIDB4ODAwMDAwMDAKI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KCmtlcm5lbF9tYXAu
cGFnZV9vZmZzZXQgPSBfQUMoUEFHRV9PRkZTRVRfTDUsIFVMKTsKClRoZSBrZXJuZWxfbWFwLnBh
Z2Vfb2Zmc2V0IGlzIG5vIHVzZSB0byBDT05GSUdfMzJCSVQuCgpSZW1vdmUgdGhlIENPTkZJR19Q
QUdFX09GRlNFVCwgYW5kIHB1dCBhbGwgUEFHRV9PRkZTRVQqIHRvZ2V0aGVyIHRvCmVhc2UgbWFp
bnRlbmFuY2UgYW5kIHJlYWRpbmcuCgoKCj4KPiBQbGVhc2UgY29ycmVjdCBtZSBJZiBJJ20gd3Jv
bmcuCj4gPj4gICAjZW5kaWYKPiA+PiAgIC8qCj4gPj4gLSAqIEJ5IGRlZmF1bHQsIENPTkZJR19Q
QUdFX09GRlNFVCB2YWx1ZSBjb3JyZXNwb25kcyB0byBTVjQ4IGFkZHJlc3Mgc3BhY2Ugc28KPiA+
PiAtICogZGVmaW5lIHRoZSBQQUdFX09GRlNFVCB2YWx1ZSBmb3IgU1YzOS4KPiA+PiArICogQnkg
ZGVmYXVsdCwgQ09ORklHX1BBR0VfT0ZGU0VUIHZhbHVlIGNvcnJlc3BvbmRzIHRvIFNWNTcgYWRk
cmVzcyBzcGFjZSBzbwo+ID4+ICsgKiBkZWZpbmUgdGhlIFBBR0VfT0ZGU0VUIHZhbHVlIGZvciBT
VjQ4IGFuZCBTVjM5Lgo+ID4+ICAgICovCj4gPj4gICAjZGVmaW5lIFBBR0VfT0ZGU0VUX0w0ICAg
ICAgICAgX0FDKDB4ZmZmZmFmODAwMDAwMDAwMCwgVUwpCj4gPj4gICAjZGVmaW5lIFBBR0VfT0ZG
U0VUX0wzICAgICAgICAgX0FDKDB4ZmZmZmZmZDgwMDAwMDAwMCwgVUwpCj4gPj4gLS0KPiA+PiAy
LjIwLjEKPiA+Pgo+ID4KPiA+Cj4KPiAtLQo+IFRoYW5rcwo+IFNvbmcgU2h1YWkKPgoKCi0tIApC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
