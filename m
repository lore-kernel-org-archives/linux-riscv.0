Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A02EC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dyuRP1WcATigai8BeeuIwHBAm3p/QbDiw50tVR/TP9Y=; b=yzvpZyGZjloJJn9+QDuq6po3XY
	+LajkLlYU3smsPcURJVlRGrXZpUjt2e+5SH/uEBlV9X2MOhafew+/pQCARWRxnXVc9hCJmpAp4KNK
	PrI3WH83sfK4CPSdtdo77XmTe3wSjEpsVMo+mNJeqHqn49KUsW4Y81dVIwRWE2Y4CAea55R4SwWBt
	5E+CmbEzrGbVMU1fVR10eoGY4CLM9+tliZma41MfsHX1ueLiKC4u1q8gkTQKCncbMp3iASFBkM567
	5IjgskyGLc+/ieju8VeeNr028PwVUzTrKw01Fqp9wH9xhM6Ws8PMuTp4L3SM0eXdcu6siW1fj/gco
	+eHeu/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Yo-00BTDe-S7; Tue, 29 Nov 2022 21:54:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Yl-00BTCS-1U
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:54:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y17so6881749plp.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zk+0tbGfmoiCSaofifFX6pDAw37Jyz4cQY2f4TVskAA=;
        b=ScMqOfm3s0FF0STYA5N7DrA1KsOXZvde2x7b/F7HKRbPEk/y0hvEy1OPZtjItMUkuE
         IaSISdDDlDgV7apFNTrK8KOATCsQF1xE4Ddc1dmazOdco+qObt6zRBs9io93y+E4NqIj
         gRD2TidNcNzz1eE2ODQUpwLKuEVhNnFYnr2U41Qmp2Gor3KCFnorM13rAGXSCl/35p4V
         EMo3c5T0E16Zxf+qF/ZnHXbyMTAdBTojnJZchXhUQDt8+kW1rDvaAn59fr6H6KFcnidL
         RlEC0LJGgI8EFjVLsHPXQ4Kx/ij+4D1ARGVglWf6bkj/Bt0kZxx7X/0YLZUKIh0ccwCP
         BTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk+0tbGfmoiCSaofifFX6pDAw37Jyz4cQY2f4TVskAA=;
        b=mnWuk9zsWuxIAIKNAP7E78af3gvrRHObeZbsU+MYjZbyWizKhCo8S1vURyM1xFs2H5
         IfV2D3gA+oUBKWr5ADgBaXF+4/PN5ibc/2y04M38viWpa7jB/kyrAoMOldOWBXduiEls
         JGdetu1JTLO+vHGBT0KC9ism/Fkr2ab9VdyB7Pv/9GNDEZcvlLCf4FYtZIqlcQ0jU5+E
         S8Rj5RUvOhZrxYHG53MBx40+AzMPCBcS9VUbhpHGZiJNN40IDo9CVlpAP+6cxskPE+zz
         DgJQlfEpu999yLx9OsZi9882+IQ9r/ROmoaNq2e8xxWt96vnjnDDQnc8KQzAE1S/xT0V
         w+ig==
X-Gm-Message-State: ANoB5pml+sbdXSVw+d3OOuNudJgn5D+hJiTDM5eMPz6XtpK91+pqLIZ0
	SdaktQuOnxpusm23o45X/W3ksQ==
X-Google-Smtp-Source: AA0mqf4lCaKdmc69045C86I6CBYjvewj1apTF5Ewzu5/1LrFT6JD4julSMYrwa7aVKQBq5Hp49O6iA==
X-Received: by 2002:a17:902:6b8c:b0:189:8134:1fd with SMTP id p12-20020a1709026b8c00b00189813401fdmr14570723plk.174.1669758872492;
        Tue, 29 Nov 2022 13:54:32 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b00187033cac81sm11338262plz.145.2022.11.29.13.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 13:54:32 -0800 (PST)
Date: Tue, 29 Nov 2022 13:54:32 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 13:54:17 PST (-0800)
Subject: Re: [QUERY]: Adding support for a platform
In-Reply-To: <CA+V-a8tQD8gHA9Q2oBNYTAZTMwEik-gGVraEWP47FyFNE+E+9A@mail.gmail.com>
CC: Andrew Waterman <andrew@sifive.com>, jrtc27@jrtc27.com, binutils@sourceware.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.csengg@gmail.com
Message-ID: <mhng-78fcd2c1-3309-4aed-9c2e-6023506de6aa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_135435_113219_CFD37C4F 
X-CRM114-Status: GOOD (  47.55  )
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

T24gVHVlLCAyOSBOb3YgMjAyMiAxMzo0MDo1MyBQU1QgKC0wODAwKSwgcHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLAo+Cj4gT24gVHVlLCBOb3YgMjksIDIwMjIg
YXQgODo1NyBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4K
Pj4gT24gVHVlLCAyOSBOb3YgMjAyMiAxMjoyMTozMSBQU1QgKC0wODAwKSwgQW5kcmV3IFdhdGVy
bWFuIHdyb3RlOgo+PiA+IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDEyOjEyIFBNIEplc3NpY2Eg
Q2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IE9uIDI5IE5vdiAy
MDIyLCBhdCAxOToyOCwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29t
PiB3cm90ZToKPj4gPj4gPgo+PiA+PiA+IEhpIFBhbG1lciwKPj4gPj4gPgo+PiA+PiA+IE9vcHMg
SSBzaG91bGQgaGF2ZSBpbmNsdWRlZCBsaW51eC1yaXNjdiB0byB0aGUgQ0MgbGlzdCBoZXJlIChk
b2luZyBpdCBub3cpCj4+ID4+ID4KPj4gPj4gPiBPbiBUdWUsIE5vdiAyOSwgMjAyMiBhdCA3OjIw
IFBNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+PiA+PiA+Pgo+
PiA+PiA+PiBPbiBUdWUsIDI5IE5vdiAyMDIyIDExOjE2OjI5IFBTVCAoLTA4MDApLCBiaW51dGls
c0Bzb3VyY2V3YXJlLm9yZyB3cm90ZToKPj4gPj4gPj4+IEhpIEFsbCwKPj4gPj4gPj4+Cj4+ID4+
ID4+PiBJZiB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UgdG8gYXNrIHRoaXMgcXVlc3Rpb24g
cGxlYXNlIGxldCBtZSBrbm93Lgo+PiA+PiA+Pj4KPj4gPj4gPj4+IFNvIHdlIGhhdmUgYSBSSVND
ViBwbGF0Zm9ybSAoUmVuZXNhcyBSWi9GaXZlKSBmb3Igd2hpY2ggd2UgbmVlZCB0bwo+PiA+PiA+
Pj4gYWRqdXN0IHRoZSBURVhUX1NUQVJUX0FERFIuIFNvIGJlbG93IGFyZSBteSBxdWVyaWVzOgo+
PiA+PiA+Pj4gKiBXaGF0IGlzIHRoZSBwcm9jZWR1cmUgZm9yIHVwc3RyZWFtaW5nPwo+PiA+PiA+
Pj4gKiBBcmUgcGF0Y2hlcyBhY2NlcHRlZCBmb3IgaW5kaXZpZHVhbCBwbGF0Zm9ybXMgKGZvciBh
ZGp1c3RpbmcgVEVYVF9TVEFSVF9BRERSKT8KPj4gPj4gPj4KPj4gPj4gPj4gSXMgdGhpcyBzdGls
bCByZWxhdGVkIHRvIHRoYXQgYnVnIHdpdGggdGhlIHN0YXRpYyBiaW5hcmllcyB5b3UnZAo+PiA+
PiA+PiBtZW50aW9uZWQgYmVmb3JlPyAgSSB0aGluayB3ZSdkIHJlYWxseSBuZWVkIHRvIGZpZ3Vy
ZSBvdXQgdGhlIHJvb3QgY2F1c2UKPj4gPj4gPj4gYmVmb3JlIHdlIGNhbiBtYWtlIGEgcmVhc29u
ZWQgZGVjaXNpb24gaGVyZSwgbXkgZ3Vlc3Mgd291bGQgYmUgdGhhdAo+PiA+PiA+PiBjaGFuZ2lu
ZyBURVhUX1NUQVJUX0FERFIganVzdCB3b3JrcyBhcm91bmQgdGhlIHJlYWwgYnVnLgo+PiA+PiA+
Pgo+PiA+PiA+IEJlbG93IGlzIHRoZSByb290IGNhdXNlIGFuZCB0aGUgc29sdXRpb246Cj4+ID4+
ID4KPj4gPj4gPiBURVhUX1NUQVJUX0FERFIgaXMgdGhlIHN0YXJ0IG9mIHRoZSB0ZXh0IHNlZ21l
bnQgb2YgYW4gYXBwbGljYXRpb24uCj4+ID4+ID4gVGhpcyBpcyBiZWluZyBzZXQgdG8gMHgxMDAw
MCBmb3IgUklTQ1YgcGxhdGZvcm1zLgo+PiA+PiA+Cj4+ID4+ID4gU28gd2hlbiBhbiBhcHBsaWNh
dGlvbiBpcyBjb21waWxlZCB3aXRoIHRoZSBzdGF0aWMgZmxhZyB0aGUgbG9hZCB3b3VsZAo+PiA+
PiA+IHN0YXJ0IGZyb20gMHgxMDAwMCAtIHh5eiAoZGVwZW5kaW5nIG9uIHNpemUgb2YgdGhlIGFw
cGxpY2F0aW9uKQo+PiA+PiA+Cj4+ID4+ID4gRW50cnkgcG9pbnQgMHgxMDFjMAo+PiA+PiA+IFRo
ZXJlIGFyZSA1IHByb2dyYW0gaGVhZGVycywgc3RhcnRpbmcgYXQgb2Zmc2V0IDY0UHJvZ3JhbSBI
ZWFkZXJzOgo+PiA+PiA+ICBUeXBlICAgICAgICAgICBPZmZzZXQgICAgICAgICAgICAgVmlydEFk
ZHIgICAgICAgICAgIFBoeXNBZGRyCj4+ID4+ID4gICAgICAgICAgICAgICAgIEZpbGVTaXogICAg
ICAgICAgICBNZW1TaXogICAgICAgICAgICAgIEZsYWdzICBBbGlnbgo+PiA+PiA+ICBMT0FEICAg
ICAgICAgICAweDAwMDAwMDAwMDAwMDAwMDAgMHgwMDAwMDAwMDAwMDEwMDAwIDB4MDAwMDAwMDAw
MDAxMDAwMAo+PiA+PiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwNTliNDggMHgwMDAw
MDAwMDAwMDU5YjQ4ICBSIEUgICAgMHgxMDAwCj4+ID4+ID4gIExPQUQgICAgICAgICAgIDB4MDAw
MDAwMDAwMDA1OWI2MCAweDAwMDAwMDAwMDAwNmFiNjAgMHgwMDAwMDAwMDAwMDZhYjYwCj4+ID4+
ID4gICAgICAgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMWY2OCAweDAwMDAwMDAwMDAwMDM1Mjgg
IFJXICAgICAweDEwMDAKPj4gPj4gPgo+PiA+PiA+IFNvIGZvciB0aGUgYWJvdmUgYXBwbGljYXRp
b24gd2hpY2ggaXMgY29tcGlsZWQgc3RhdGljYWxseSB3ZSBjYW4gc2VlCj4+ID4+ID4gdGhlIGVu
dHJ5IHBvaW50IGlzIDB4MTAxYzAgYW5kIGxvYWQgMHgwMDAwMDAwMDAwMDEwMDAwLgo+PiA+PiA+
Cj4+ID4+ID4gQW5kZXMgQVg0NU1QIGNvcmVzIGhhdmUgbG9jYWwgbWVtb3J5IElMTSBhbmQgRExN
IHRoYXQgYXJlIG1hcHBlZCBpbgo+PiA+PiA+IHRoZSByZWdpb24gSOKAmTBfMDAwM18wMDAwIC0g
SOKAmTBfMDAwNF9GRkZGIG9uIHRoZSBSWi9GaXZlIFNvQy4gV2hlbiB0aGUKPj4gPj4gPiB2aXJ0
dWFsIGFkZHJlc3MgZmFsbHMgaW4gdGhpcyByYW5nZSB0aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBh
IHBhZ2UKPj4gPj4gPiBmYXVsdCBhbmQgYXNzdW1lcyB0aGUgdmlydHVhbCBhZGRyZXNzIGFzIHBo
eXNpY2FsIGFkZHJlc3MgYW5kIGhlbmNlCj4+ID4+ID4gdGhlIGFwcGxpY2F0aW9uIGZhaWxzIHRv
IHJ1biAocGFuaWNzIHNvbWV3aGVyZSkuCj4+ID4+ID4KPj4gPj4gPiBTbyB0byBhdm9pZCB0aGlz
IGlzc3VlIHdlIHNldCB0aGUgVEVYVF9TVEFSVF9BRERSIHRvIDB4NTAwMDAgc28gdGhhdAo+PiA+
PiA+IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgYW55IHN0YXRpY2FsbHkgY29tcGlsZWQgYXBwbGlj
YXRpb24gZG9lcyBub3QKPj4gPj4gPiBmYWxsIGluIHRoZSByYW5nZSBvZiBI4oCZMF8wMDAzXzAw
MDAgLSBI4oCZMF8wMDA0X0ZGRkYuCj4+ID4+ID4KPj4gPj4gPiBFbGYgZmlsZSB0eXBlIGlzIEVY
RUMgKEV4ZWN1dGFibGUgZmlsZSkKPj4gPj4gPiBFbnRyeSBwb2ludCAweDUwNGU0Cj4+ID4+ID4g
VGhlcmUgYXJlIDUgcHJvZ3JhbSBoZWFkZXJzLCBzdGFydGluZyBhdCBvZmZzZXQgNjQKPj4gPj4g
Pgo+PiA+PiA+IFByb2dyYW0gSGVhZGVyczoKPj4gPj4gPiAgVHlwZSAgICAgICAgICAgT2Zmc2V0
ICAgICAgICAgICAgIFZpcnRBZGRyICAgICAgICAgICBQaHlzQWRkcgo+PiA+PiA+ICAgICAgICAg
ICAgICAgICBGaWxlU2l6ICAgICAgICAgICAgTWVtU2l6ICAgICAgICAgICAgICBGbGFncyAgQWxp
Z24KPj4gPj4gPiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAwMDAwMDAw
MDA1MDAwMCAweDAwMDAwMDAwMDAwNTAwMDAKPj4gPj4gPiAgICAgICAgICAgICAgICAgMHgwMDAw
MDAwMDAwMDU3ZGM4IDB4MDAwMDAwMDAwMDA1N2RjOCAgUiBFICAgIDB4MTAwMAo+PiA+PiA+ICBM
T0FEICAgICAgICAgICAweDAwMDAwMDAwMDAwNTg1YjggMHgwMDAwMDAwMDAwMGE5NWI4IDB4MDAw
MDAwMDAwMDBhOTViOAo+PiA+PiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDRlZTAg
MHgwMDAwMDAwMDAwMDA2NGIwICBSVyAgICAgMHgxMDAwCj4+ID4+ID4gIE5PVEUgICAgICAgICAg
IDB4MDAwMDAwMDAwMDAwMDE1OCAweDAwMDAwMDAwMDAwNTAxNTggMHgwMDAwMDAwMDAwMDUwMTU4
Cj4+ID4+ID4gICAgICAgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDA0NCAweDAwMDAwMDAwMDAw
MDAwNDQgIFIgICAgICAweDQKPj4gPj4gPgo+PiA+PiA+IFNvIG5vdyB3aXRoIHRoZSBmaXggZm9y
IHN0YXRpY2FsbHkgY29tcGlsZWQgYXBwbGljYXRpb25zIHdlIGNhbiBzZWUKPj4gPj4gPiBpdHMg
b2Zmc2V0dGVkIGFuZCBlbnRyeSBwb2ludCBpcyAweDUwNGU0IGFuZCBsb2FkIGlzIGF0Cj4+ID4+
ID4gMHgwMDAwMDAwMDAwMDUwMDAwLiBTbyB3aXRoIHRoaXMgd2UgYXJlIGZvciBzdXJlIHRoZSBN
TVUgd2lsbCBhbHdheXMKPj4gPj4gPiB0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KPj4gPj4KPj4gPj4g
V2VsbCB0aGF04oCZcyBqdXN0IGEgYmxhdGFudCB2aW9sYXRpb24gb2YgdGhlIHNwZWMuCj4+ID4K
Pj4gPiBSaWdodCAtIHRoaXMgaXNuJ3QgYSBwbGF0Zm9ybSBxdWlyazsgaXQncyBhIHZpb2xhdGlv
biBvZiB0aGUgSVNBLgo+PiA+IFVubGVzcyB0aGlzIGJlaGF2aW9yIGlzIGVuZ2FnZWQgYnkgYSBj
dXN0b20gbW9kZSBiaXQsIHRoYXQgaXMsIGluCj4+ID4gd2hpY2ggY2FzZSwgaXQgc2hvdWxkIGp1
c3QgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgbm9uZSBvZiB0aGlzCj4+ID4gd291bGQgYmUg
YSBwcm9ibGVtLiAgSWYgdGhlIGJlaGF2aW9yIGlzIHVuY29uZGl0aW9uYWxseSBlbmFibGVkLCB0
aGlzCj4+ID4gc2hvdWxkIGJlIHRyZWF0ZWQgYXMgYW4gZXJyYXR1bS4KPj4KPj4gSSBkb24ndCBz
ZWUgdGhpcyBhcyBhbnkgZGlmZmVyZW50IHRoYW4gdGhlIFQtSGVhZCBwYWdlIHRhYmxlIGF0dHJp
YnV0ZXMsCj4+IHdoZXJlIGl0IHdhcyBtYWRlIGFidW5kYW50bHkgY2xlYXIgdGhhdCB2ZW5kb3Jz
IHNlbGYtY2VydGlmeSB0aGVpcgo+PiBpbXBsZW1lbnRhdGlvbnMgYW5kIHRodXMgYW55dGhpbmcg
Z29lcy4gIEl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciBpZiB3ZQo+PiBjYWxsZWQgaXQgYW4gZXJy
YXRhLCBidWcsIHN1cnByaXNlIGZlYXR1cmUsIHZlbmRvciBleHRlbnNpb24sIHdoYXRldmVyOwo+
PiBpdCdzIFJJU0MtViBzbyB3ZSd2ZSBnb3QgdG8gbGl2ZSB3aXRoIGl0Lgo+Pgo+IHBoZXcgdGhh
dCdzIGEgcmVsaWVmLgo+Cj4+ID4+IFdoYXQgaGFwcGVucyBpZiBhCj4+ID4+IG1hbGljaW91cyAo
b3IgYnVnZ3kpIHVzZXJzcGFjZSBiaW5hcnkgZ29lcyBhbmQgYWNjZXNzZXMgdW5tYXBwZWQgbWVt
b3J5Cj4+ID4+IGluIHRoYXQgcmFuZ2U/IERvZXMgaXQgYWN0dWFsbHkgZ2V0IGFjY2VzcyB0byB0
aGlzIElMTS9ETE0/IElmIHNvCj4+ID4+IHRoYXTigJlzIGEgZ2FwaW5nIHNpZGUgY2hhbm5lbC4K
Pj4KPj4gSUlVQyB0aGF0J3MgdGhlIGNhc2UsIGJ1dCB0aGF0J3MganVzdCBmcm9tIHJlYWRpbmcg
dGhpcyBwb3N0Lgo+Pgo+PiBUaGVyZSdzIG5vdGhpbmcgd2UgY2FuIGRvIHRvIHByZXZlbnQgdmVu
ZG9ycyBmcm9tIGJ1aWxkaW5nIGhhcmR3YXJlIHdpdGgKPj4gc2lkZSBjaGFubmVscy4gIEluIHRo
aXMgY2FzZSBJIHN1cHBvc2Ugd2UgY291bGQgc3dhcCBvdXQgdGhlIG1lbW9yeQo+PiByZWdpb24g
b24gY29udGV4dCBzd2l0Y2hlcywgZnJvbSBhIHF1aWNrIGxvb2sgYXQgdGhlIGRhdGFzaGVldCB0
aGVzZSBhcmUKPj4gc2luZ2xlLWNvcmUgc28gdGhhdCdkIGJlIHNhZmUuICBNeSBndWVzcyBpcyBp
dCdkIGJlIHRvbyBzbG93IGZvciB1c2Vycwo+PiB0byB3YW50IHRoYXQgb24gYnkgZGVmYXVsdCwg
YnV0IEkgZG9uJ3QgaGF2ZSBhbnkgdXNlIGNhc2UgZm9yIHRoaXMgSFcgc28KPj4gSSdtIG5vdCBz
dXJlLgo+Pgo+IEVuYWJsaW5nIHRoZSBsb2NhbCBtZW1vcnkgKElMTS9ETE0pIG9uIHRoZSBjb3Jl
IGlzIGEgc3BlY2lmaWNhdGlvbgo+IG9wdGlvbiBhbmQgaXMgZW5hYmxlZCBvbiBSWi9GaXZlIFNv
Qy4gSSdtIGNoZWNraW5nIHdpdGggQW5kZXMgaWYgdGhpcwo+IGNhbiBiZSBmb3JjZWZ1bGx5IGRp
c2FibGVkLgo+IFRoZSBvbmx5IHVzZSBjYXNlIHdvdWxkIGJlIHRvIHNwZWVkIHVwIHRoaW5ncyBm
b3Igc29tZSBzbG93ZXIgYmxvY2sKPiAoYnV0IHNhaWQgdGhhdCBpdHMgdXNlciBhcHBsaWNhdGlv
biBzcGVjaWZpYykKCklmIGl0J3MgcG9zc2libGUgdG8gZGlzYWJsZSB0aGlzIHNvbWVob3cgdGhh
dCdkIGJlIGdyZWF0LCBidXQgYWZ0ZXIgCndyaXRpbmcgdXAgdGhlICJtYXliZSB3ZSBjYW4gY29u
dGV4dCBzd2l0Y2ggdGhpcyIgYml0IEkgdGhpbmsgd2UgY291bGQgCnByb2JhYmx5IGdldCBhd2F5
IHdpdGggc29tZSBzb3J0IG9mIGNvbXBhdGliaWxpdHkgbW9kZSBoZXJlLiAgCkVzc2VudGlhbGx5
OiBEb24ndCBhbGxvY2F0ZSBvdXQgb2YgdGhpcyByZWdpb24gYnkgZGVmYXVsdCwgYnV0IGlmIAp1
c2Vyc3BhY2UgZXhwbGljaXRseSBtYXBzIHRoaXMgcmVnaW9uIChhcyBoYXBwZW5zIHdpdGggc3Rh
dGljIGJpbmFyaWVzKSAKdGhlbiBhbGxvdyBpdCwgYnV0IHRyYWNrIHRob3NlIGFsbG9jYXRpb25z
IGFuZCBiZWdpbiBzd2FwcGluZyBpdCBvbiAKY29udGV4dCBzd2l0Y2hlcy4KClRoYXQgbWlnaHQg
YmUgYSBsb3Qgb2Ygd29yayBhbmQgd291bGQgZGVmaW5pdGVseSBiZSBzbG93LCBidXQgYXMgbG9u
ZyBhcyAKb3RoZXIgVkFzIGNhbiBtYXAgdG8gdGhlc2UgUEFzIHRoZW4gSSB0aGluayB3ZSdkIGJl
IHByZXR0eSBtdWNoIHNhZmUgLS0gCndlJ2QgbG9zZSByZWFkLW9ubHkgYW5kIGV4ZWN1dGUtb25s
eSBwZXJtaXNzaW9uIHRyYWNraW5nLCBidXQgZXhpc3RpbmcgCmJpbmFyaWVzIHdvdWxkIHN0aWxs
IHJ1bi4gIFRoYXQgd291bGQgYWxsb3cgdGhpcyBURVhUX1NUQVJUX0FERFIgY2hhbmdlIAp0byBi
ZSBqdXN0IGEgcGVyZm9ybWFuY2UgdGhpbmcsIGFuZCB3ZSBtaWdodCB3YW50IHRoYXQgYXMgYSB0
dW5hYmxlIGZvciAKZGlzdHJvcyBhbnl3YXkgKGZvciBodWdlIHBhZ2UgYWxpZ25tZW50LCBmb3Ig
ZXhhbXBsZSkuCgpBIGxvdCBvZiB0aGF0IHdvdWxkIGRlcGVuZCBvbiBleGFjdGx5IGhvdyB0aGUg
aGFyZHdhcmUgdHJlYXRzIHRoZXNlIApzcGVjaWFsIFZBcywgdGhvdWdoLiAgUHJvYmFibHkgYmVz
dCBpZiB5b3UganVzdCBkaWcgdGhyb3VnaCB0aGUgZG9jcywgCnNlZSBob3cgdGhpcyBhbGwgd29y
a3MsIGFuZCB0aGVuIHByb3Bvc2Ugc29tZSByb3VnaCBwYXRjaGVzPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
