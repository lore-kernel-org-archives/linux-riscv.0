Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12971D2127D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pK1LmX9YfXCqlNXFOP7RTPR+5e+1l6MYZUVDs86X31Q=; b=s0p7lKKhQqxsJpqWyw9cMt20Ab
	uBQ1FXAnfn/f3ZMAkiPkg9qNFO7vKy3KRzzkHD97Ms7j9rGC57SM0jXd16dMtRZUyO20DaOZ85RdD
	bT5+qVl3n1xEHUqrAIyO/QT178pFcETY162kfllqM+7Y9kVtwKrrcfmE2n2c1haoBemtIErfPLVdS
	FO5g2wLXNBK/N/+CCKLNOFoltL0+afI477RPzOfri2ayY4AAs7ambGtDqe54ZsRMn0rCBDGex2KQp
	ZmXfvTxLJYyKBAXCRD2EYZ6bhGDfdD7WcKLVQrn9M9yUUYa96qwR1hoDsBysqhwweg+RG8UjoHBMq
	ThWGO2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Oa8-0000000Ed1P-35v3;
	Thu, 17 Oct 2024 11:22:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OYY-0000000EcrA-2zty
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 11:20:49 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4D3973F28D
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729164036;
	bh=M4YjcEVV7tGGHQM4SLZ+Rw0/aoFPAr1zOE/e6IcC6g4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CQAHaUw0GdSeLkCoARag73bfg/PDgMJWIiJzUvisFthX810nNEHwtSRiZzN3Omwsb
	 00He6eUXtQ5cacv6sw2t31mcO8Hxi1CL/ppYFPWCfuUybZgKvhzUDNf9+zHWbCav7N
	 VDOi5ucSD2aq8v2K8zgOMOVTGxeSYiL7BsHCHc1E6cuct3avoffexJAJuDl4ZtvXgz
	 cAQkdjifAiH6OnevNVv2j4CkyKSWVqWr510tXmcDBliqhAcct8Z6cq693GCjnCay0N
	 Q6NsakbSNzAEyVHFz8yeeUyGuZqbg4fupZtQLYwmz2gtLbQvutl2INIeRxk/iU5rr9
	 jWhUzkOsl5MrA==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-288c53ab7abso670260fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 04:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164035; x=1729768835;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4YjcEVV7tGGHQM4SLZ+Rw0/aoFPAr1zOE/e6IcC6g4=;
        b=AJU0pcWjqyDY2r0jRODFArMKLAyJDZBCdmuLSPItyiWqMlvIp2oqEdP4j41uHrF2Zz
         DJtOhqFUDBaSpMg4/c++cKAu0XmVf3hbVWIWHTBem99/wIGuyttHV4t7ziXFSwkx34hD
         JcebGOr3RwEhqIU5HftN9y8wx3cyKTV8IxRkCKgDiMjbuD+bvuxcOVy056wDNfcRxYum
         5jy+3I3LNPKnVW7pTh5nEQK9DECDQpJQLtEUI1Iffxe+S01y7ZCeH64DkY/WTDtS9xDO
         dYf1Z5tGaMrmUwHUgi2UnQqBBwAQbXr5Sr5/IguEIULSSRLGQLTSZ4xcS3dG/Irnnvay
         nGuQ==
X-Gm-Message-State: AOJu0Yzcx3lsI2egw+mYWgLLJGPlhHPXyeVvmScXjDROO4koJ99ZOf75
	JQW70llJ1p9fmpd2pYrhBO2Nl4fgt9/sCCRH70tiOSN1t7AGvwqxdqk1p+PqJ16Ops04ufwtj8B
	Z9tRBGib2SOT6JxuRm29qFYN3TqM1DWCT5uS2Z3v7XWiuYFKbiFvrrgPQThDsS7HHxCjTpMvCiJ
	NSXHKlXFDCIvOmEg38iz0cBXo30jG/qVXojBk9ZsTJVri70cTVhd1agiP5
X-Received: by 2002:a05:6871:b0c:b0:277:fbac:1f71 with SMTP id 586e51a60fabf-288eddb2c9bmr5430265fac.3.1729164034981;
        Thu, 17 Oct 2024 04:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfU2Lplv8hxPRM8N7voJy7lh3n9cW1UVrwgOb9RsD0H7yH3H0NpoWnlE93REmfGdPNvgkvNlDe3u07LYOkoSo=
X-Received: by 2002:a05:6871:b0c:b0:277:fbac:1f71 with SMTP id
 586e51a60fabf-288eddb2c9bmr5430251fac.3.1729164034683; Thu, 17 Oct 2024
 04:20:34 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Oct 2024 04:20:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <4825037e-08e6-4946-9aee-a19512fb2346@samsung.com>
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
 <CGME20241014123412eucas1p2144768f373a2e2de7f6d00e7b67f9328@eucas1p2.samsung.com>
 <20241014123314.1231517-4-m.wilczynski@samsung.com> <CAJM55Z-bzivMZWUsHiii+2tw2-kdRe7kqtVa+MvPEAVTmOvChg@mail.gmail.com>
 <4825037e-08e6-4946-9aee-a19512fb2346@samsung.com>
Mime-Version: 1.0
Date: Thu, 17 Oct 2024 04:20:34 -0700
Message-ID: <CAJM55Z913WhGUVHR8e2GhS=x56hqrAMzGmRgLLNMFEWTguxgYA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: thead: Add mailbox node
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_042039_103598_53F5DB58 
X-CRM114-Status: GOOD (  25.53  )
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

TWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4KPgo+IE9uIDEwLzE0LzI0IDE2OjU3LCBFbWlsIFJl
bm5lciBCZXJ0aGluZyB3cm90ZToKPiA+IE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+ID4+IEFk
ZCBtYWlsYm94IGRldmljZSB0cmVlIG5vZGUuIFRoaXMgd29yayBpcyBiYXNlZCBvbiB0aGUgdmVu
ZG9yIGtlcm5lbCBbMV0uCj4gPj4KPiA+PiBMaW5rOiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUu
Y29tL3YxL3VybD9rPTBiYzk1ZjI1LTU0NTI2N2Q4LTBiYzhkNDZhLTAwMGJhYmZmMzE3Yi04NWE1
MmVhYjIxZGI5ZDIyJnE9MSZlPTYzYTQ5YWNkLWUzNDMtNDNkMi1hNTdkLWI0ZjZmY2QyM2I2MSZ1
PWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRnJldnlvcyUyRnRoZWFkLWtlcm5lbC5naXQgWzFd
Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tp
QHNhbXN1bmcuY29tPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3Ro
MTUyMC5kdHNpIHwgMTIgKysrKysrKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVh
ZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiA+
PiBpbmRleCA2OTkyMDYwZTZhNTQuLjQzNWYwYWIwMTc0ZCAxMDA2NDQKPiA+PiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ID4+IEBAIC01NTUsNSArNTU1LDE3IEBAIHBvcnRm
OiBncGlvLWNvbnRyb2xsZXJAMCB7Cj4gPj4gIAkJCQlpbnRlcnJ1cHRzID0gPDU1IElSUV9UWVBF
X0xFVkVMX0hJR0g+Owo+ID4+ICAJCQl9Owo+ID4+ICAJCX07Cj4gPj4gKwo+ID4+ICsJCW1ib3hf
OTEwdDogbWFpbGJveEBmZmZmYzM4MDAwIHsKPiA+Cj4gPiBIaSBNaWNoYWwsCj4gPgo+ID4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoISBQbGVhc2Ugc29ydCB0aGlzIGJ5IGFkZHJlc3Mgc2ltaWxhciB0
byB0aGUgb3RoZXIgbm9kZXMuCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LiBXaWxsIGRv
LgoKVGhhbmtzIQoKPiA+Cj4gPj4gKwkJICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIw
LW1ib3giOwo+ID4+ICsJCSAgICAgICByZWcgPSA8MHhmZiAweGZmYzM4MDAwIDB4MCAweDQwMDA+
LAo+ID4KPiA+IFRoZSBkb2N1bWVudGF0aW9uWzFdIGNhbGxzIHRoaXMgYXJlYSBNQk9YMF9ULCBi
dXQgaXQgc2F5cyBpdCdzIDI0a0IgbG9uZy4KPiA+Cj4gPiBbMV06IGh0dHBzOi8vcHJvdGVjdDIu
ZmlyZWV5ZS5jb20vdjEvdXJsP2s9MTgyYjY4ZDYtNDdiMDUwMmItMTgyYWUzOTktMDAwYmFiZmYz
MTdiLWQyYjA1Zjk3Yjg1YTA5ZmYmcT0xJmU9NjNhNDlhY2QtZTM0My00M2QyLWE1N2QtYjRmNmZj
ZDIzYjYxJnU9aHR0cHMlM0ElMkYlMkZnaXQuYmVhZ2xlYm9hcmQub3JnJTJGYmVhZ2xldi1haGVh
ZCUyRmJlYWdsZXYtYWhlYWQlMkYtJTJGYmxvYiUyRm1haW4lMkZkb2NzJTJGVEgxNTIwJTI1MjBT
eXN0ZW0lMjUyMFVzZXIlMjUyME1hbnVhbC5wZGYKPiA+Cj4gPj4gKwkJCSAgICAgPDB4ZmYgMHhm
ZmM0NDAwMCAweDAgMHgxMDAwPiwKPiA+Cj4gPiBBY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRp
b24gdGhpcyBpcyBpbnNpZGUgdGhlIDI0a0IgTUJPWDFfVCBhcmVhLgo+ID4KPiA+PiArCQkJICAg
ICA8MHhmZiAweGZmYzRjMDAwIDB4MCAweDEwMDA+LAo+ID4KPiA+IFRoaXMgaXMgY2FsbG9kIE1C
T1gyX1QsIGJ1dCBpcyA4a0IgbG9uZy4KPiA+Cj4gPj4gKwkJCSAgICAgPDB4ZmYgMHhmZmM1NDAw
MCAweDAgMHgxMDAwPjsKPiA+Cj4gPiBUaGlzIGlzIGNhbGxvZCBNQk9YM19ULCBidXQgaXMgOGtC
IGxvbmcuCj4gPgo+ID4+ICsJCSAgICAgICByZWctbmFtZXMgPSAibG9jYWwiLCAicmVtb3RlLWlj
dTAiLCAicmVtb3RlLWljdTEiLCAicmVtb3RlLWljdTIiOwo+ID4KPiA+IE1heWJlIHRoZXNlIHNo
b3VsZCBtYXRjaCB0aGUgTUJPWG5fVCBuYW1lcyBpbiB0aGUgZG9jdW1lbnRhdGlvbj8KPgo+IElu
ZGVlZCwgdGhvc2UgYXJlIGV4Y2VsbGVudCBwb2ludHMuIEkgd29uZGVyZWQgYWJvdXQgdGhpcyB0
b2RheSwgdHJ5aW5nCj4gdG8gdW5kZXJzdGFuZCB3aHkgdGhlIG1hcHBpbmcgd2FzIGRvbmUgdGhp
cyB3YXkuCj4KPiBGb3IgdGhlIE1CT1gwX1QgbWFwcGluZywgdGhlIG1haWxib3ggZHJpdmVyIG5l
ZWRzIHRvIG1hcCB0aGUgTTBfKgo+IHJlZ2lzdGVycywgaW5jbHVkaW5nIHRoZSBNMF9DbiByZWdp
c3RlcnMsIHdoZXJlIG90aGVyIGNvcmVzIHdyaXRlIHRoZWlyCj4gbWVzc2FnZXMuIFRoaXMgc2V0
dXAgcmVxdWlyZXMgYSB0b3RhbCBvZiAxNktCLCB3aXRoIGFuIGFkZGl0aW9uYWwgOEtCCj4gdGhh
dCByZW1haW5zIHVudXNlZC4KPgo+IFJlZ2FyZGluZyBNQk9YMV9ULCBNQk9YMl9ULCBhbmQgTUJP
WDNfVCwgb25seSBvbmUgc2V0IG9mIHJlZ2lzdGVycyBpcwo+IG5lY2Vzc2FyeSAtIHNwZWNpZmlj
YWxseSwgTW5fQzAgc2luY2UgdGhlIGtlcm5lbCBhbHdheXMgc2VuZHMgbWVzc2FnZXMKPiBmcm9t
IHRoZSA5MTB0IGNvcmUgd2l0aCBDUFVfSURYPTAuCj4KPiBUaGUgTUJPWDFfVCBtYXBwaW5nIGlz
IHBhcnRpY3VsYXJseSBjb25mdXNpbmcsIGFzIHRoZSByZWxldmFudAo+IHJlZ2lzdGVycywgTTFf
QzAqLCBzdGFydCB3aXRoIGFuIG9mZnNldCBvZiAweDQwMDAgcmVsYXRpdmUgdG8gdGhlCj4gYmVn
aW5uaW5nIG9mIHRoZSBtYXBwaW5nLgo+Cj4gRm9yIE1CT1gyX1QgYW5kIE1CT1gzX1QsIHRoZSBu
ZWNlc3NhcnkgcmVnaXN0ZXIgc2V0cywgTTJfQzAgYW5kIE0zX0MwLAo+IGVhY2ggb2NjdXB5IDRL
QiBvZiBhZGRyZXNzIHNwYWNlLCBsZWF2aW5nIGV4dHJhIDRrQiB1bnVzZWQuCj4KPiBJIGFzc3Vt
ZSB0aGUgaGFyZHdhcmUgZGVzaWduZXJzIGZvdW5kIHRoZXNlIG1hcHBpbmdzIG1vcmUKPiBzdHJh
aWdodGZvcndhcmQgdG8gaW1wbGVtZW50IHRoaXMgd2F5LiBJ4oCZbSBmYWlybHkgY29uZmlkZW50
IHRoYXQgdGhlc2UKPiBudW1iZXJzIGFyZSBhY2N1cmF0ZSwgYXMgSSBoYXZlIHRlc3RlZCB0aGVt
IGFuZCBjb25maXJtZWQgdGhleSB3b3JrLgoKSSBkb24ndCBkb3VidCB0aGVzZSBtYXBwaW5ncyB3
b3JrLCBidXQgdXN1YWxseSB0aGUgZGV2aWNlIHRyZWUgc2hvdWxkIGRlc2NyaWJlCnRoZSBoYXJk
d2FyZSBhbmQgbm90IHRoZSBkcml2ZXIuIFNvIHVubGVzcyB5b3UgdGhpbmsgdGhlIGRvY3VtZW50
YXRpb24gaXMKd3JvbmcsIEknZCBzdGlsbCBzdWdnZXN0IHlvdSBkbyB0aGUgYmluZGluZ3MgYW5k
IGRldmljZSB0cmVlIHNvIHRoZXkgZGVzY3JpYmUKdGhlIGhhcmR3YXJlLCBhbmQgdGhlbiBsZXQg
dGhlIGRyaXZlciBoYW5kbGUgdGhlIGlycmVndWxhciByZWdpc3RlciBvZmZzZXRzLgoKL0VtaWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
