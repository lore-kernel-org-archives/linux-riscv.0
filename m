Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251B8C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0GWMzG0iBTejale0S0ygoiJLyMUc2I8iIehpaat2e8=; b=fG5o0iBO1PsqaT
	UBc+9BJEmuRw4uwfXahN2Fls/YFbHmu09oFY+AUZvPCM2k5tk8WZ8jMZ3CP0iCxN5SffolyXQwSiW
	KzhCEr4946Bgg5NAeVqMvlb6A4KmLhLB9QzgEnjC/U70ghfxLqvNH9sUjFywLoytmNCuvt8gJSyDy
	ecr+IvaC6PnHpQkskHQAqbGTI1PgeQNW6LWpXFXyl28vlvR7Pc/F+ZJzMZ24GyNuB8KXLhY/mgtxF
	7qqTKGFxyNRexMm5YAN5qA/VDJNmORUO5NT8jV6TVYlIugBdHCyBY+sBuUvqj43ZCDcyS1tJZmj2v
	QcKZOA5iRH0R06k9Zm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqUk-00COty-7J; Fri, 17 Feb 2023 02:29:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqUh-00COsx-EB
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 02:29:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53A7DB82AF6
	for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 02:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D4C433A1
	for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 02:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676600939;
	bh=Ra2Kc03LZoibfd4WyHiHEUN5GcCOOJLNJsxaG6GQ8mE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TUScOgEXjlXbt2ARWyJA/mh1j775DvdVW1NJdvruQlphXipRbG3E8kgqgo4nagXsf
	 3ndO2INDD4Zz22/K6qR/GoXJ64iEcVQsbZdlFFjZ8S/hpGDd/GlMvcbpSGSibCwk0u
	 RqmAQrIUns6AmlNlExiTBdWPoMYdNoNbEthj+d4tQxJMV3txf7dwQIMd5mZ1GsU/SL
	 E8+09KsQAo5tsxH0NUq8IVsl72fYs05iK9QPHK4D3m1FpA8mgFlLU9qQGExT5kRJYh
	 r7JJ6gY4GdceAbvtYLYdELyzmFChDU1IixiMANDE0Mem5lNjdu/+2DgEug603XEEBO
	 OSaP7pjiwwQYg==
Received: by mail-ed1-f46.google.com with SMTP id ee31so563732edb.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 18:28:59 -0800 (PST)
X-Gm-Message-State: AO0yUKW9lbJeLfCt/y/ZEDgiUyjGV9Z97eewk+vul6zbkibWR7X8POnr
	Z79uryWfBg/yuj2A5Mm7sc5qWf0P1sRPD/FPvmg=
X-Google-Smtp-Source: AK7set9dHgzJsIxZkFtFpNM0y0jTcrTO/PULnhjZIThysYzt75rjc9hkBF9wYjkdmvrhADwLvqw7MHzMcFSAYcEFXys=
X-Received: by 2002:a17:906:eb9a:b0:87b:fa21:7953 with SMTP id
 mh26-20020a170906eb9a00b0087bfa217953mr3794180ejb.8.1676600937720; Thu, 16
 Feb 2023 18:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <87ilgntdef.fsf@all.your.base.are.belong.to.us> <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
 <Y9jz+zUDebQ4VLlF@andrea> <CAJF2gTQsRcUpMk8nvFkEsz_fpVV+v6tpUDcPzaNjqfj+i_VvXA@mail.gmail.com>
 <878rgy3v0e.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rgy3v0e.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 17 Feb 2023 10:28:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTacQXg7e3s9s3dALCnPjstGGMPtk5L5SsN_MWKEov+pQ@mail.gmail.com>
Message-ID: <CAJF2gTTacQXg7e3s9s3dALCnPjstGGMPtk5L5SsN_MWKEov+pQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>, "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com, 
	penberg@kernel.org, mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, 
	Changbin Du <changbin.du@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_182903_816808_3FACE4B0 
X-CRM114-Status: GOOD (  30.85  )
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

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMzo1NCBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4K
PiA+IE9uIFR1ZSwgSmFuIDMxLCAyMDIzIGF0IDY6NTcgUE0gQW5kcmVhIFBhcnJpIDxwYXJyaS5h
bmRyZWFAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+ID4gPiBJdCdzIHRoZSBjb25jdXJyZW50
IG1vZGlmaWNhdGlvbiB0aGF0IEkgd2FzIHJlZmVycmluZyB0byAocmVtb3ZpbmcKPiA+PiA+ID4g
c3RvcF9tYWNoaW5lKCkpLiBZb3UncmUgc2F5aW5nICJpdCdsbCBhbHdheXMgd29yayIsIEknbSBz
YXlpbmcgIkknbSBub3QKPiA+PiA+ID4gc28gc3VyZSIuIDotKSBFLmcuLCB3cml0aW5nIGMuZWJy
ZWFrIG9uIGFuIDMyYiBpbnNuLiBDYW4geW91IHNheSB0aGF0Cj4gPj4gPiBTb2Z0d2FyZSBtdXN0
IGVuc3VyZSB3cml0ZSBjLmVicmVhayBvbiB0aGUgaGVhZCBvZiBhbiAzMmIgaW5zbi4KPiA+PiA+
Cj4gPj4gPiBUaGF0IG1lYW5zIElGVSBvbmx5IHNlZToKPiA+PiA+ICAtIGMuZWJyZWFrICsgYnJv
a2VuL2lsbGVnYWwgaW5zbi4KPiA+PiA+IG9yCj4gPj4gPiAgLSBvcmlnaW4gaW5zbgo+ID4+ID4K
PiA+PiA+IEV2ZW4gaW4gdGhlIHdvcnN0IGNhc2UsIHN1Y2ggYXMgSUZVIGZldGNoZXMgaW5zdHJ1
Y3Rpb25zIG9uZSBieSBvbmU6Cj4gPj4gPiBJZiB0aGUgSUZVIGdldHMgdGhlIG9yaWdpbiBpbnNu
LCBpdCB3aWxsIHNraXAgdGhlIGJyb2tlbi9pbGxlZ2FsIGluc24uCj4gPj4gPiBJZiB0aGUgSUZV
IGdldHMgdGhlIGMuZWJyZWFrICsgYnJva2VuL2lsbGVnYWwgaW5zbiwgdGhlbiBhbiBlYnJlYWsK
PiA+PiA+IGV4Y2VwdGlvbiBpcyByYWlzZWQuCj4gPj4gPgo+ID4+ID4gQmVjYXVzZSBjLmVicmVh
ayB3b3VsZCByYWlzZSBhbiBleGNlcHRpb24sIEkgZG9uJ3Qgc2VlIGFueSBwcm9ibGVtLgo+ID4+
Cj4gPj4gVGhhdCdzIHRoZSBwcm9ibGVtLCB0aGlzIGRpc2N1c3Npb24gaXM6Cj4gPj4KPiA+PiBS
ZXZpZXdlcjogIkknbSBub3Qgc3VyZSwgdGhhdCdzIG5vdCB3cml0dGVuIGluIG91ciBzcGVjIgo+
ID4+IFN1Ym1pdHRlcjogIkkgc2FpZCBpdCwgaXQncyBjYWxsZWQgLWFjY3VyYXRlIGF0b21pY2l0
eS0iCj4gPiBJIHJlYWxseSBkb24ndCBzZWUgYW55IGhhcmR3YXJlIHRoYXQgY291bGQgYnJlYWsg
dGhlIGF0b21pY2l0eSBvZiB0aGlzCj4gPiBjLmVicmVhayBzY2VuYXJpbzoKPiA+ICAtIGMuZWJy
ZWFrIG9uIHRoZSBoZWFkIG9mIDMyYiBpbnNuCj4gPiAgLSBlYnJlYWsgb24gYW4gYWxpZ25lZCAz
MmIgaW5zbgo+ID4KPiA+IElmIElGVSBmZXRjaGVzIHdpdGggY2FjaGVsaW5lLCBhbGwgaXMgYXRv
bWljaXR5Lgo+ID4gSWYgSUZVIGZldGNoZXMgd2l0aCAxNmJpdCBvbmUgYnkgb25lLCB0aGUgZmly
c3QgYy5lYnJlYWsgd291bGQgcmFpc2UKPiA+IGFuIGV4Y2VwdGlvbiBhbmQgc2tpcCB0aGUgbmV4
dCBicm9rZS9pbGxlZ2FsIGluc3RydWN0aW9uLgo+ID4gRXZlbiBpZiBJRlUgZmV0Y2hlcyB3aXRo
b3V0IGFueSBzZXF1ZW5jZSwgdGhlIElEVSBtdXN0IGRlY29kZSBvbmUgYnkKPiA+IG9uZSwgcmln
aHQ/IFRoZSBmaXJzdCBoYWxmIGMuZWJyZWFrIHdvdWxkIHByb3RlY3QgYW5kIHByZXZlbnQgdGhl
IG5leHQKPiA+IGJyb2tlL2lsbGVnYWwgaW5zdHJ1Y3Rpb24uIFNwZWN1bGF0aXZlIGV4ZWN1dGlv
biBvbiBicm9rZS9pbGxlZ2FsCj4gPiBpbnN0cnVjdGlvbiB3b24ndCBjYXVzZSBhbnkgZXhjZXB0
aW9ucy4KPiA+Cj4gPiBJdCdzIGEgY29tbW9uIGlzc3VlLCBub3QgYSBzcGVjaWZpYyBJU0EgaXNz
dWUuCj4gPiAzMmIgaW5zdHJ1Y3Rpb24gQSAtPiAxNmIgZWJyZWFrICsgMTZiIGJyb2tlbi9pbGxl
Z2FsIC0+IDMyYgo+ID4gaW5zdHJ1Y3Rpb24gQS4gSXQncyBzYWZlIHRvIHRyYW5zZm9ybS4KPgo+
IFdha2luZyB1cCB0aGlzIHRocmVhZCBhZ2Fpbiwgbm93IHRoYXQgQ2hhbmdiaW4gaGFzIHNob3dl
ZCBzb21lIGludGVyZXN0Cj4gZnJvbSBhbm90aGVyIHRocmVhZCBbMV0uCj4KPiBHdW8sIHdlIGNh
bid0IHJlYWxseSBhZGQgeW91ciBwYXRjaGVzLCBhbmQgY2xhaW0gdGhhdCB0aGV5J3JlIGdlbmVy
aWMsCj4gIndvcmtzIG9uIGFsbCIgUklTQy1WIHN5c3RlbXMuIFdoaWxlIGl0IG1pZ2h0IHdvcmsg
Zm9yIHlvdXIgSS9EIGNvaGVyZW50Cj4gc3lzdGVtLCB0aGF0IGRvZXMgbm90IGltcGx5IHRoYXQg
aXQnbGwgd29yayBvbiBhbGwgcGxhdGZvcm1zLiBSSVNDLVYKPiBhbGxvd3MgZm9yIGltcGxlbWVu
dGF0aW9ucyB0aGF0IGFyZSBJL0QgaW5jb2hlcmVudCwgYW5kIGhlcmUgeW91cgo+IElGVS1pbXBs
ZW1lbnRhdGlvbnMgYXJndW1lbnRzIGRvIG5vdCBob2xkLiBJJ2QgcmVhbGx5IHJlY29tbWVuZCB0
bwo+IHJlYWR1cCBvbiBbMl0uClNvcnJ5LCBbMl0gaXNuJ3QgcmVsYXRlZCB0byB0aGlzIHBhdGNo
LgoKVGhpcyBwYXRjaCBkaWRuJ3QgaGF2ZSBJL0QgaW5jb2hlcmVudCBwcm9ibGVtIGJlY2F1c2Ug
d2UgYnJvYWRjYXN0IHRoZQpJUEkgZmVuY2UuaSBpbiBwYXRjaF90ZXh0X25vc3luYy4KCkNvbXBh
cmVkIHRvIHRoZSBzdG9wX21hY2hpbmUgdmVyc2lvbiwgdGhlcmUgaXMgYSBjcmF6eSBuZXN0ZWQg
SVBJCmJyb2FkY2FzdCBjb3N0LgpzdG9wX21hY2hpbmUgLT4gcGF0Y2hfdGV4dF9ub3N5bmMgLT4g
Zmx1c2hfaWNhY2hlX2FsbAp2b2lkIGZsdXNoX2ljYWNoZV9hbGwodm9pZCkKewogICAgICAgIGxv
Y2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKCiAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJ
U0NWX1NCSSkpCiAgICAgICAgICAgICAgICBzYmlfcmVtb3RlX2ZlbmNlX2koTlVMTCk7CiAgICAg
ICAgZWxzZQogICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBO
VUxMLCAxKTsKfQpFWFBPUlRfU1lNQk9MKGZsdXNoX2ljYWNoZV9hbGwpOwoKCj4KPiBOb3cgaG93
IGNvdWxkIHdlIG1vdmUgb24gd2l0aCB5b3VyIHBhdGNoZXM/IEdldCBpdCBpbiBhIHNwZWMsIG9y
IGZvbGQKPiB0aGUgcGF0Y2hlcyBpbiBhcyBhIEtjb25maWcuc29jcy10aGluZyBmb3IgdGhlIHBs
YXRmb3JtcyB3aGVyZSB0aGlzIGlzCj4gT0suIFdoYXQgYXJlIHlvdSB0aG91Z2h0cyBvbiB0aGUg
bGF0dGVyPwoKSSBkaWRuJ3QgdGFsayBhYm91dCBJL0QgaW5jb2hlcmVudC9jb2hlcmVudDsgd2hh
dCBJIHNheSBpcyB0aGUgYmFzaWMKc2l6ZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gZWxlbWVudC4KSW4g
YW4gSS9EIGNhY2hlIHN5c3RlbSwgd2h5IGNvdWxkbid0IExTVSBzdG9yZS1oYWxmIGd1YXJhbnRl
ZQphdG9taWNpdHkgZm9yIEktY2FjaGUgZmV0Y2g/IEhvdyBJLWNhY2hlIGNvdWxkIGZldGNoIG9u
bHkgb25lIGJ5dGUgb2YKdGhhdCBTdG9yZS1oYWxmIHZhbHVlPwpXZSd2ZSBhc3N1bWVkIHRoaXMg
Z3VhcmFudGVlIGluIHRoZSByaXNjdiBqdW1wX2xhYmVsIGltcGxlbWVudGF0aW9uLApzbyB3aHkg
bm90IHRoaXMgcGF0Y2ggY291bGRuJ3Q/Cgo+Cj4KPiBCasO2cm4KPgo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDIxNTAzNDUzMi54czcyNmw3bXA2eGxua2Rm
QE05MTB0Lwo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24v
YmxvYi9tYXN0ZXIvaWQtY29uc2lzdGVuY3ktcHJvcG9zYWwucGRmCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
