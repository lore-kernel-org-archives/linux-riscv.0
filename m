Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C0DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=V9T0YwQwOGRMaK0Bjk839tlBGUNp2alJaJDg/cnpebo=; b=HGG3IwKTP2Rcqx5VtybBteeAhy
	H/5/d/5eDzB0X8JyrZjmp9lr2B85pFcd8s0X/IMQI8v9IKp2Ayyt2gD2MZJCgMZKyyY8KFKXEsw/a
	dJJ5F1DQ3UCl0mpPr5FYPSsnj0ulDgvSIQE3U5q/Rq/0hT90wWZBIxh+5vlLC1KmtrwNEKLgLi3qX
	ZkfD6oJQljkbWul7o7+Rh9ZGA09rgP3g0gKicogAtw8nU45dUCecMKRL3KMKo++IXyzMXjI8isUxm
	+jgjcvcaNwqgohxA9Ued6jUuSDRx7vDjW2oQbxnZFTONJjG/PFu+mHqXFp/UdC5LWS5+AuQmwEczd
	ilTQ6skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07fi-00BKC7-EZ; Tue, 29 Nov 2022 20:57:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07fe-00BKBc-Fk
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 20:57:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id j12so14635457plj.5
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRtcrHHNnNN0w78uJ+qmyIuHUrQjfcC88OV8Ch/cjVQ=;
        b=Z130HJcyc2G+oDYMw0hxnGT72HdqVTbQtMLkYry6eo8nVr/vczzvwXIva26poWb7c0
         qW1ktZvgWdt2IfyCQH5xz9ZGWw95+WwbXf24cokBtfbWuVqiSR7rft+OExS4eCayT1sT
         bnQ6pSRBWQqcOZxlFfFoikKAHXsg2me0UVd2CKZe0kcP2wxjDL3EaO2CpOSvrwrmvAXt
         HgGvgdvfWhjgjdoIcMwYhTwaciahUEVg72X1VEN0nHCERfQadcgqbKo8yNP7Q9YDtHci
         NHX1SOh91LaXQQYTICBARNDzIftdHz88b6dPp08qVFdaP9pCYKvlemrd5fLALPer+9Y/
         nEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRtcrHHNnNN0w78uJ+qmyIuHUrQjfcC88OV8Ch/cjVQ=;
        b=6SsaucnN6yrz5fNDa5B2H52eiY/mp1hxg25sV+vrefKLBPU5H6Rj6LplStTl0kEtCN
         AkzXItboegZQe0QwHq9v1Ni+SgLd13zWCkKxwzvpFM9mBx7fWAULysXq3EclqRYUN8Q7
         Xz210eCt8PKG3lC/mVgPb9BLwMBmTB6v6umnql9+yUQB0gz2CruC0WY9rLCIGOkihkjo
         quriZG4NIqH+tl0RPhxn+B4PjYOpMfKca+SQH1k1onl4pG2F7T2eVl40ZiHdVfOqdaWZ
         jUWuykrHgH2UvJ8AuNAimhtazHI8l6nLyZCz1BXLzQotAlZirVMyRPmpHpJgbPp+1eri
         70Tw==
X-Gm-Message-State: ANoB5pmeHCjo2d+jI5lkY3HKBnpqgBXxUDWQSmVODAhva18XRm1kuhst
	U1mwkMeY3FHn17ocq6h0Rkfo6g==
X-Google-Smtp-Source: AA0mqf7Lurhfu4bNyQK73I3+Ix+BXMszv8DaaeS6B31oXE8HT1Ofy8J3TdMPeotlZH724Ws4oc/N5Q==
X-Received: by 2002:a17:903:300c:b0:186:9ef5:4d59 with SMTP id o12-20020a170903300c00b001869ef54d59mr51556723pla.89.1669755454986;
        Tue, 29 Nov 2022 12:57:34 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b00188c5f0f9e9sm11332038plg.199.2022.11.29.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 12:57:34 -0800 (PST)
Date: Tue, 29 Nov 2022 12:57:34 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 12:57:26 PST (-0800)
Subject: Re: [QUERY]: Adding support for a platform
In-Reply-To: <CA++6G0Do001Bo+kxhUNz5T937TYU-K5Y43MH+X=Q2TgFCaxcfQ@mail.gmail.com>
CC: jrtc27@jrtc27.com, prabhakar.csengg@gmail.com, binutils@sourceware.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Andrew Waterman <andrew@sifive.com>
Message-ID: <mhng-69edea29-43f4-4ef9-9cfe-7108938247fa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_125738_764317_910CF3B4 
X-CRM114-Status: GOOD (  41.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOSBOb3YgMjAyMiAxMjoyMTozMSBQU1QgKC0wODAwKSwgQW5kcmV3IFdhdGVybWFu
IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDEyOjEyIFBNIEplc3NpY2EgQ2xhcmtl
IDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDI5IE5vdiAyMDIyLCBhdCAxOToy
OCwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPj4g
Pgo+PiA+IEhpIFBhbG1lciwKPj4gPgo+PiA+IE9vcHMgSSBzaG91bGQgaGF2ZSBpbmNsdWRlZCBs
aW51eC1yaXNjdiB0byB0aGUgQ0MgbGlzdCBoZXJlIChkb2luZyBpdCBub3cpCj4+ID4KPj4gPiBP
biBUdWUsIE5vdiAyOSwgMjAyMiBhdCA3OjIwIFBNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFi
YmVsdC5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiBPbiBUdWUsIDI5IE5vdiAyMDIyIDExOjE2OjI5
IFBTVCAoLTA4MDApLCBiaW51dGlsc0Bzb3VyY2V3YXJlLm9yZyB3cm90ZToKPj4gPj4+IEhpIEFs
bCwKPj4gPj4+Cj4+ID4+PiBJZiB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UgdG8gYXNrIHRo
aXMgcXVlc3Rpb24gcGxlYXNlIGxldCBtZSBrbm93Lgo+PiA+Pj4KPj4gPj4+IFNvIHdlIGhhdmUg
YSBSSVNDViBwbGF0Zm9ybSAoUmVuZXNhcyBSWi9GaXZlKSBmb3Igd2hpY2ggd2UgbmVlZCB0bwo+
PiA+Pj4gYWRqdXN0IHRoZSBURVhUX1NUQVJUX0FERFIuIFNvIGJlbG93IGFyZSBteSBxdWVyaWVz
Ogo+PiA+Pj4gKiBXaGF0IGlzIHRoZSBwcm9jZWR1cmUgZm9yIHVwc3RyZWFtaW5nPwo+PiA+Pj4g
KiBBcmUgcGF0Y2hlcyBhY2NlcHRlZCBmb3IgaW5kaXZpZHVhbCBwbGF0Zm9ybXMgKGZvciBhZGp1
c3RpbmcgVEVYVF9TVEFSVF9BRERSKT8KPj4gPj4KPj4gPj4gSXMgdGhpcyBzdGlsbCByZWxhdGVk
IHRvIHRoYXQgYnVnIHdpdGggdGhlIHN0YXRpYyBiaW5hcmllcyB5b3UnZAo+PiA+PiBtZW50aW9u
ZWQgYmVmb3JlPyAgSSB0aGluayB3ZSdkIHJlYWxseSBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhlIHJv
b3QgY2F1c2UKPj4gPj4gYmVmb3JlIHdlIGNhbiBtYWtlIGEgcmVhc29uZWQgZGVjaXNpb24gaGVy
ZSwgbXkgZ3Vlc3Mgd291bGQgYmUgdGhhdAo+PiA+PiBjaGFuZ2luZyBURVhUX1NUQVJUX0FERFIg
anVzdCB3b3JrcyBhcm91bmQgdGhlIHJlYWwgYnVnLgo+PiA+Pgo+PiA+IEJlbG93IGlzIHRoZSBy
b290IGNhdXNlIGFuZCB0aGUgc29sdXRpb246Cj4+ID4KPj4gPiBURVhUX1NUQVJUX0FERFIgaXMg
dGhlIHN0YXJ0IG9mIHRoZSB0ZXh0IHNlZ21lbnQgb2YgYW4gYXBwbGljYXRpb24uCj4+ID4gVGhp
cyBpcyBiZWluZyBzZXQgdG8gMHgxMDAwMCBmb3IgUklTQ1YgcGxhdGZvcm1zLgo+PiA+Cj4+ID4g
U28gd2hlbiBhbiBhcHBsaWNhdGlvbiBpcyBjb21waWxlZCB3aXRoIHRoZSBzdGF0aWMgZmxhZyB0
aGUgbG9hZCB3b3VsZAo+PiA+IHN0YXJ0IGZyb20gMHgxMDAwMCAtIHh5eiAoZGVwZW5kaW5nIG9u
IHNpemUgb2YgdGhlIGFwcGxpY2F0aW9uKQo+PiA+Cj4+ID4gRW50cnkgcG9pbnQgMHgxMDFjMAo+
PiA+IFRoZXJlIGFyZSA1IHByb2dyYW0gaGVhZGVycywgc3RhcnRpbmcgYXQgb2Zmc2V0IDY0UHJv
Z3JhbSBIZWFkZXJzOgo+PiA+ICBUeXBlICAgICAgICAgICBPZmZzZXQgICAgICAgICAgICAgVmly
dEFkZHIgICAgICAgICAgIFBoeXNBZGRyCj4+ID4gICAgICAgICAgICAgICAgIEZpbGVTaXogICAg
ICAgICAgICBNZW1TaXogICAgICAgICAgICAgIEZsYWdzICBBbGlnbgo+PiA+ICBMT0FEICAgICAg
ICAgICAweDAwMDAwMDAwMDAwMDAwMDAgMHgwMDAwMDAwMDAwMDEwMDAwIDB4MDAwMDAwMDAwMDAx
MDAwMAo+PiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwNTliNDggMHgwMDAwMDAwMDAw
MDU5YjQ4ICBSIEUgICAgMHgxMDAwCj4+ID4gIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDA1
OWI2MCAweDAwMDAwMDAwMDAwNmFiNjAgMHgwMDAwMDAwMDAwMDZhYjYwCj4+ID4gICAgICAgICAg
ICAgICAgIDB4MDAwMDAwMDAwMDAwMWY2OCAweDAwMDAwMDAwMDAwMDM1MjggIFJXICAgICAweDEw
MDAKPj4gPgo+PiA+IFNvIGZvciB0aGUgYWJvdmUgYXBwbGljYXRpb24gd2hpY2ggaXMgY29tcGls
ZWQgc3RhdGljYWxseSB3ZSBjYW4gc2VlCj4+ID4gdGhlIGVudHJ5IHBvaW50IGlzIDB4MTAxYzAg
YW5kIGxvYWQgMHgwMDAwMDAwMDAwMDEwMDAwLgo+PiA+Cj4+ID4gQW5kZXMgQVg0NU1QIGNvcmVz
IGhhdmUgbG9jYWwgbWVtb3J5IElMTSBhbmQgRExNIHRoYXQgYXJlIG1hcHBlZCBpbgo+PiA+IHRo
ZSByZWdpb24gSOKAmTBfMDAwM18wMDAwIC0gSOKAmTBfMDAwNF9GRkZGIG9uIHRoZSBSWi9GaXZl
IFNvQy4gV2hlbiB0aGUKPj4gPiB2aXJ0dWFsIGFkZHJlc3MgZmFsbHMgaW4gdGhpcyByYW5nZSB0
aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBhIHBhZ2UKPj4gPiBmYXVsdCBhbmQgYXNzdW1lcyB0aGUg
dmlydHVhbCBhZGRyZXNzIGFzIHBoeXNpY2FsIGFkZHJlc3MgYW5kIGhlbmNlCj4+ID4gdGhlIGFw
cGxpY2F0aW9uIGZhaWxzIHRvIHJ1biAocGFuaWNzIHNvbWV3aGVyZSkuCj4+ID4KPj4gPiBTbyB0
byBhdm9pZCB0aGlzIGlzc3VlIHdlIHNldCB0aGUgVEVYVF9TVEFSVF9BRERSIHRvIDB4NTAwMDAg
c28gdGhhdAo+PiA+IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgYW55IHN0YXRpY2FsbHkgY29tcGls
ZWQgYXBwbGljYXRpb24gZG9lcyBub3QKPj4gPiBmYWxsIGluIHRoZSByYW5nZSBvZiBI4oCZMF8w
MDAzXzAwMDAgLSBI4oCZMF8wMDA0X0ZGRkYuCj4+ID4KPj4gPiBFbGYgZmlsZSB0eXBlIGlzIEVY
RUMgKEV4ZWN1dGFibGUgZmlsZSkKPj4gPiBFbnRyeSBwb2ludCAweDUwNGU0Cj4+ID4gVGhlcmUg
YXJlIDUgcHJvZ3JhbSBoZWFkZXJzLCBzdGFydGluZyBhdCBvZmZzZXQgNjQKPj4gPgo+PiA+IFBy
b2dyYW0gSGVhZGVyczoKPj4gPiAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZp
cnRBZGRyICAgICAgICAgICBQaHlzQWRkcgo+PiA+ICAgICAgICAgICAgICAgICBGaWxlU2l6ICAg
ICAgICAgICAgTWVtU2l6ICAgICAgICAgICAgICBGbGFncyAgQWxpZ24KPj4gPiAgTE9BRCAgICAg
ICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAwMDAwMDAwMDA1MDAwMCAweDAwMDAwMDAwMDAw
NTAwMDAKPj4gPiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDU3ZGM4IDB4MDAwMDAwMDAw
MDA1N2RjOCAgUiBFICAgIDB4MTAwMAo+PiA+ICBMT0FEICAgICAgICAgICAweDAwMDAwMDAwMDAw
NTg1YjggMHgwMDAwMDAwMDAwMGE5NWI4IDB4MDAwMDAwMDAwMDBhOTViOAo+PiA+ICAgICAgICAg
ICAgICAgICAweDAwMDAwMDAwMDAwMDRlZTAgMHgwMDAwMDAwMDAwMDA2NGIwICBSVyAgICAgMHgx
MDAwCj4+ID4gIE5PVEUgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDE1OCAweDAwMDAwMDAwMDAw
NTAxNTggMHgwMDAwMDAwMDAwMDUwMTU4Cj4+ID4gICAgICAgICAgICAgICAgIDB4MDAwMDAwMDAw
MDAwMDA0NCAweDAwMDAwMDAwMDAwMDAwNDQgIFIgICAgICAweDQKPj4gPgo+PiA+IFNvIG5vdyB3
aXRoIHRoZSBmaXggZm9yIHN0YXRpY2FsbHkgY29tcGlsZWQgYXBwbGljYXRpb25zIHdlIGNhbiBz
ZWUKPj4gPiBpdHMgb2Zmc2V0dGVkIGFuZCBlbnRyeSBwb2ludCBpcyAweDUwNGU0IGFuZCBsb2Fk
IGlzIGF0Cj4+ID4gMHgwMDAwMDAwMDAwMDUwMDAwLiBTbyB3aXRoIHRoaXMgd2UgYXJlIGZvciBz
dXJlIHRoZSBNTVUgd2lsbCBhbHdheXMKPj4gPiB0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KPj4KPj4g
V2VsbCB0aGF04oCZcyBqdXN0IGEgYmxhdGFudCB2aW9sYXRpb24gb2YgdGhlIHNwZWMuCj4KPiBS
aWdodCAtIHRoaXMgaXNuJ3QgYSBwbGF0Zm9ybSBxdWlyazsgaXQncyBhIHZpb2xhdGlvbiBvZiB0
aGUgSVNBLgo+IFVubGVzcyB0aGlzIGJlaGF2aW9yIGlzIGVuZ2FnZWQgYnkgYSBjdXN0b20gbW9k
ZSBiaXQsIHRoYXQgaXMsIGluCj4gd2hpY2ggY2FzZSwgaXQgc2hvdWxkIGp1c3QgYmUgZGlzYWJs
ZWQgYnkgZGVmYXVsdCBhbmQgbm9uZSBvZiB0aGlzCj4gd291bGQgYmUgYSBwcm9ibGVtLiAgSWYg
dGhlIGJlaGF2aW9yIGlzIHVuY29uZGl0aW9uYWxseSBlbmFibGVkLCB0aGlzCj4gc2hvdWxkIGJl
IHRyZWF0ZWQgYXMgYW4gZXJyYXR1bS4KCkkgZG9uJ3Qgc2VlIHRoaXMgYXMgYW55IGRpZmZlcmVu
dCB0aGFuIHRoZSBULUhlYWQgcGFnZSB0YWJsZSBhdHRyaWJ1dGVzLCAKd2hlcmUgaXQgd2FzIG1h
ZGUgYWJ1bmRhbnRseSBjbGVhciB0aGF0IHZlbmRvcnMgc2VsZi1jZXJ0aWZ5IHRoZWlyIAppbXBs
ZW1lbnRhdGlvbnMgYW5kIHRodXMgYW55dGhpbmcgZ29lcy4gIEl0IGRvZXNuJ3QgcmVhbGx5IG1h
dHRlciBpZiB3ZSAKY2FsbGVkIGl0IGFuIGVycmF0YSwgYnVnLCBzdXJwcmlzZSBmZWF0dXJlLCB2
ZW5kb3IgZXh0ZW5zaW9uLCB3aGF0ZXZlcjsgCml0J3MgUklTQy1WIHNvIHdlJ3ZlIGdvdCB0byBs
aXZlIHdpdGggaXQuCgo+PiBXaGF0IGhhcHBlbnMgaWYgYQo+PiBtYWxpY2lvdXMgKG9yIGJ1Z2d5
KSB1c2Vyc3BhY2UgYmluYXJ5IGdvZXMgYW5kIGFjY2Vzc2VzIHVubWFwcGVkIG1lbW9yeQo+PiBp
biB0aGF0IHJhbmdlPyBEb2VzIGl0IGFjdHVhbGx5IGdldCBhY2Nlc3MgdG8gdGhpcyBJTE0vRExN
PyBJZiBzbwo+PiB0aGF04oCZcyBhIGdhcGluZyBzaWRlIGNoYW5uZWwuCgpJSVVDIHRoYXQncyB0
aGUgY2FzZSwgYnV0IHRoYXQncyBqdXN0IGZyb20gcmVhZGluZyB0aGlzIHBvc3QuCgpUaGVyZSdz
IG5vdGhpbmcgd2UgY2FuIGRvIHRvIHByZXZlbnQgdmVuZG9ycyBmcm9tIGJ1aWxkaW5nIGhhcmR3
YXJlIHdpdGggCnNpZGUgY2hhbm5lbHMuICBJbiB0aGlzIGNhc2UgSSBzdXBwb3NlIHdlIGNvdWxk
IHN3YXAgb3V0IHRoZSBtZW1vcnkgCnJlZ2lvbiBvbiBjb250ZXh0IHN3aXRjaGVzLCBmcm9tIGEg
cXVpY2sgbG9vayBhdCB0aGUgZGF0YXNoZWV0IHRoZXNlIGFyZSAKc2luZ2xlLWNvcmUgc28gdGhh
dCdkIGJlIHNhZmUuICBNeSBndWVzcyBpcyBpdCdkIGJlIHRvbyBzbG93IGZvciB1c2VycyAKdG8g
d2FudCB0aGF0IG9uIGJ5IGRlZmF1bHQsIGJ1dCBJIGRvbid0IGhhdmUgYW55IHVzZSBjYXNlIGZv
ciB0aGlzIEhXIHNvIApJJ20gbm90IHN1cmUuCgo+Pgo+PiBKZXNzCj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
