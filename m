Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D019C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3ojDKwnzPvh69SVLe0yt2/nEx6FEwd2G9oPxytUWts=; b=FCnfW9bXMu9Qsu
	2LNOt+ZRHfhXqOaqCGWgrNQqMOtMjrt6b2u0Jd/5sDLRaj1qn9ERPg5u34KURRPU/4S2yKd2TrFDi
	sH0k61wVYjG3STTF6NTVq617YUZWKBR5uOhon658kuXk3YfDlN7nlXIUdA00+uIBJt6CrVeINXj+D
	eRYR/kReFRFbXfbUyeSM4pxm6X0qNHjN4CGVZupkD0s8DO813tkJpbaA1w8k2jaBF02PzqO4/5iW6
	b+Yrayk1SuYmdi9k7ipY2NmimroADSRpkXxohf4hfPof6Ida440vySD+nA7IZulwvmOR7hVIDdRdT
	q3rOycud/ofuztS0Nz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwXv-003TLz-Ow; Fri, 19 Aug 2022 07:35:59 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwXr-003TKr-R9
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 07:35:57 +0000
Received: by mail-qk1-f172.google.com with SMTP id j6so2757017qkl.10
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 00:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=XRbV7J+2A2p1Es19V1DJXlJ5MTO6MnMsKMF62Ysfi58=;
        b=lmhbsyJZBOMqV9gu5HS4JwRXwAFbMCH6pA1SkjOu4gFDH7kD/5qZM529nP4waqirpX
         w/sp3sXSXeuHBw6kLdCfP8Xc6xc0nWkWjNNPKEl/g5Q8gcnt1SHsx6HLXGunqiVCKpK7
         SBebvvirnZ+mpp/EAoYpkgDDHoBgzXv4/wrcxP7/zzT7Vkx3PGKtHSASI5l+qltg+/7E
         y9rkq0kX4YB7shJH0REq+7gelXRpeUEMUBN6LTJtrgfzvb6TWERYxXkCJzWRYsSOxycb
         Yyp9vam9BYjt9CUq7bm1z+ZeiD2yzIzF7LnShW1KCPYTwOg166oeYxJauCr5prjRT2wq
         u9VQ==
X-Gm-Message-State: ACgBeo2K5mRyjAKikiZYSWaM3mLEw3Kw/enVwAdDF84Dty54koQNPKPV
	zP42J41szhVoEnJlMqtPEvM6WvVFwarDog==
X-Google-Smtp-Source: AA6agR5vDnYC8xxIy4f59F0UvfyuR/AvUc+nkIJ8dO9LX7xQ3cbz1Nr15oJxiIGqOPYemGx/FcUHZQ==
X-Received: by 2002:a05:620a:45a4:b0:6bb:5c02:3d16 with SMTP id bp36-20020a05620a45a400b006bb5c023d16mr4406325qkb.198.1660894553666;
        Fri, 19 Aug 2022 00:35:53 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a0c4e00b006bb568016easm3092691qki.116.2022.08.19.00.35.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 00:35:53 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-324ec5a9e97so100799437b3.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 00:35:52 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr6552996ybr.202.1660894552417; Fri, 19
 Aug 2022 00:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW29Q40hypWZ05KRj5cc=DY8XjnDwOPVw3kJPNUrnL0fA@mail.gmail.com>
 <CA+V-a8sVpEx==R6QXF8qxhVSsv2mVnZ_R3N2wTt+JPcQWNqCWQ@mail.gmail.com> <eeadea8e-a6bc-0965-1246-82b0042838e4@microchip.com>
In-Reply-To: <eeadea8e-a6bc-0965-1246-82b0042838e4@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 09:35:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPzukO8Cqk86NbPU-ytidr--Qumg6KzVcUqE4GWmumaQ@mail.gmail.com>
Message-ID: <CAMuHMdUPzukO8Cqk86NbPU-ytidr--Qumg6KzVcUqE4GWmumaQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_003555_925287_3E5C7B1F 
X-CRM114-Status: GOOD (  44.56  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIEF1ZyAxOCwgMjAyMiBhdCA4OjU0IFBNIDxDb25vci5Eb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gT24gMTgvMDgvMjAyMiAxOToxOSwgTGFkLCBQcmFiaGFr
YXIgd3JvdGU6Cj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiA+IE9uIFRo
dSwgQXVnIDE4LCAyMDIyIGF0IDQ6MTYgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPj4gT24gTW9uLCBBdWcgMTUsIDIwMjIgYXQgNToxNiBQTSBM
YWQgUHJhYmhha2FyCj4gPj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6Cj4gPj4+IEludHJvZHVjZSBTT0NfUkVORVNBU19SWkZJVkUgY29uZmlnIG9wdGlv
biB0byBlbmFibGUgUmVuZXNhcyBSWi9GaXZlCj4gPj4+IChSOUEwN0cwNDMpIFNvQywgYWxvbmcg
c2lkZSBhbHNvIGFkZCBBUkNIX1JFTkVTQVMgY29uZmlnIG9wdGlvbiBhcyBtb3N0Cj4gPj4+IG9m
IHRoZSBSZW5lc2FzIGRyaXZlcnMgZGVwZW5kIG9uIHRoaXMgY29uZmlnIG9wdGlvbi4KPiA+Pj4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+ID4+
Cj4gPj4gVGhlIHRlY2huaWNhbCBwYXJ0IExHVE0sIHNvCj4gPj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPj4KPiA+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNv
Y3MKPiA+Pj4gQEAgLTgwLDQgKzgwLDE4IEBAIGNvbmZpZyBTT0NfQ0FOQUFOX0syMTBfRFRCX1NP
VVJDRQo+ID4+Pgo+ID4+PiAgZW5kaWYgIyBTT0NfQ0FOQUFOCj4gPj4+Cj4gPj4+ICtjb25maWcg
QVJDSF9SRU5FU0FTCj4gPj4KPiA+PiBXZSBkZWZpbml0ZWx5IHdhbnQgQVJDSF9SRU5FU0FTLCBh
cyBpdCBzZXJ2ZXMgYXMgYSBnYXRla2VlcGVyIGZvcgo+ID4+IEtjb25maWcgb3B0aW9ucyBmb3Ig
SVAgY29yZXMgZm91bmQgb24gUmVuZXNhcyBBUk0gYW5kIFJJU0MtViBTb0NzLgo+ID4+Cj4gPiBB
Z3JlZWQsIG9yIGVsc2Ugd2Ugd2lsbCBlbmQgdXAgdG91Y2hpbmcgdG9vIG1hbnkgS2NvbmZpZyBm
aWxlcy4KPiA+Cj4gPj4+ICsgICAgICAgYm9vbAo+ID4+PiArICAgICAgIHNlbGVjdCBHUElPTElC
Cj4gPj4+ICsgICAgICAgc2VsZWN0IFBJTkNUUkwKPiA+Pj4gKyAgICAgICBzZWxlY3QgU09DX0JV
Uwo+ID4+PiArCj4gPj4+ICtjb25maWcgU09DX1JFTkVTQVNfUlpGSVZFCj4gPj4KPiA+PiBEbyB3
ZSBuZWVkIHRoaXMgc3ltYm9sPyBZb3UgY291bGQgYXMgd2VsbCBtYWtlIEFSQ0hfUkVORVNBUyBh
Ym92ZQo+ID4+IHZpc2libGUsIGFuZCBkZWZlciB0aGUgYWN0dWFsIFNvQyBzZWxlY3Rpb24gdG8g
QVJDSF9SOUEwN0cwNDMgaW4KPiA+PiBkcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWdbMV0uCj4g
Pj4KPiA+IEkgdGhpbmsgd2UgY291bGQgZHJvcCBpdCBhbmQganVzdCBkZWZlciB0aGUgYWN0dWFs
IFNvQyBzZWxlY3Rpb24gdG8KPiA+IEFSQ0hfUjlBMDdHMDQzIGFzIHlvdSBzYWlkLgo+ID4KPiA+
PiBJIGRvbid0IGtub3cgd2hhdCBpcyB0aGUgcG9saWN5IG9uIFJJU0MtVi4gQVJNNjQgaGFzIGEg
InNpbmdsZS1zeW1ib2wKPiA+PiBpbiBhcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIi1wb2xp
Y3ksIHNvIHdlIGhhbmRsZSBTb0Mgc2VsZWN0aW9uCj4gPj4gaW4gZHJpdmVycy9zb2MvcmVuZXNh
cy9LY29uZmlnLCBhbmQgdGhhdCBpcyBmaW5lLCBhcyBpdCBhdm9pZHMgbWVyZ2UKPiA+PiBjb25m
bGljdHMuCj4gPj4KPiA+IEFncmVlZC4KPiA+Cj4gPiBAQ29ub3IgLSBEb2VzIHRoZSBhYm92ZSBz
b3VuZCBPSz8KPgo+IEl0J3Mgbm90IG15IGRlY2lzaW9uIHRvIGJlIGhvbmVzdCAtIFBhbG1lcidz
IHRoZSBib3NzIDopCj4KPiBJIHdvdWxkIHJhdGhlciBoYXZlIGEgc2luZ2xlIHN5bWJvbCAmIGEg
c2luZ2xlIGFwcHJvYWNoIHNvIHRoYXQgd2UgYXJlCj4gYWxsIGRvaW5nIHRoZSBzYW1lIHRoaW5n
IGhlcmUuIEFzIG9mIG5vdywgd2UgaGF2ZSBhbGwgYmFzaWNhbGx5IGRvbmUKPiBkaWZmZXJlbnQg
dGhpbmdzIGZvciBlYWNoIFNPQyB0aGF0IHdhcyBhZGRlZCAtIHRoZXJlJ3MgU09DX1NJRklWRSAm
Cj4gU09DX01JQ1JPQ0hJUF9QT0xBUkZJUkUgd2hpY2ggYXJlIG9idmlvdXNseSBub3QgZG9pbmcg
dGhlIHNhbWUgdGhpbmcKPiBmb3Igc3RhcnRlcnMgJiB0aGVuIGhvdyB0aGUgc3ltYm9sIGlzIHVz
ZWQ6IHNlbGVjdHMgdnMgZGVwZW5kcyArIGRlZmF1bHQKPiBhbGwgdmFyaWVzIGJldHdlZW4gdGhl
IHN5bWJvbHMuCj4KPiBJIHRyaWVkIHRvIG1ha2Ugc29tZSBjaGFuZ2VzIHRvIHRoZSBQb2xhckZp
cmUgb25lIGEgZmV3IG1vbnRocyBhZ28gdG8KPiBhZGQgc29tZSBwZXJpcGhlcmFscyBidXQgUGFs
bWVyIHdhcyBub3QgdG9vIGtlZW4gb24gdGhlIGNoYW5nZXMuIFdlIGhhZAo+IGEgY29udmVyc2F0
aW9uIG9uIElSQywgdGhlIHVwc2hvdCBvZiB3aGljaCB3YXMgZGVjaWRpbmcgdG8gdGFsayBhYm91
dCBpdAo+IGF0IFBsdW1iZXJzICh3aGljaCBpcyBpbiAzIHdlZWtzKSBhcyBub25lIG9mIHRoZW0g
Zm9sbG93IGhpcyBvcmlnaW5hbAo+IGludGVudDoKPiA8cXVvdGU+Cj4gdGhlIG9yaWdpbmFsIGlk
ZWEgYmVoaW5kIEtjb25maWcuc29jcyB3YXMgdG8gcHJvdmlkZSBhbiBlYXN5IHBsYWNlIGZvcgo+
IHVzZXJzIHRvIHNheSAiSSB3YW50IGFsbCB0aGUgc3VwcG9ydCBmb3IgU09DIFgiLCBhbmQgdGhl
biBqdXN0IGhhdmUgb25lCj4gS2NvbmZpZyB0byB0dXJuIHRoYXQgb24KPiA8XHF1b3RlPgoKRm9y
IHdoYXRldmVyIGRlZmluaXRpb24gb2YgImFsbCI/IERvZXMgdGhpcyBpbmNsdWRlIGUuZy4gYWxs
Cm11bHRpLW1lZGlhIHN0dWZmPwoKRm9yIFJlbmVzYXMgQVJNIFNvQ3MsIHdlIG1ha2Ugc3VyZSB0
byBzZWxlY3QgdGhlIGNyaXRpY2FsIGNvcmUgcGFydHMsCmNmci4gdGhlIHNlbGVjdHMgYWJvdmUs
IGFuZCBpbiBkcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcuClRoZXNlIHNlbGVjdHMgZG8gbm90
IGluY2x1ZGUgb3B0aW9uYWwgZHJpdmVycywgaW5jbHVkaW5nIHRoZSBzZXJpYWwKcG9ydCAoY2Zy
LiB5b3VyIGNvbmZ1c2lvbiBhYm91dCBhZGRpbmcgQ09ORklHX1NFUklBTF9TSF9TQ0k9eQp0byB0
aGUgZGVmY29uZmlnKS4KQWxsIHRoZSByZXN0IGlzIGhhbmRsZWQgYnkgdGhlIGRlZmNvbmZpZ3Mg
KHNobW9iaWxlX2RlZmNvbmZpZyBvbgphcm0zMiwgc2luZ2xlIGRlZmNvbmZpZyBvbiBhcm02NCwg
YW5kIG91dC1vZi10cmVlIHJlbmVzYXNfZGVmY29uZmlnCmluIG15IHJlbmVzYXMtZGV2ZWwgdHJl
ZSkuCgo+IEluIHRoZW9yeSwgdGhhdCdzIGxvdmVseSBidXQgbm90IHJlYWxseSBtYWludGFpbmFi
bGUgJiBub25lIG9mIHVzIHdlcmUKPiBkb2luZyBpdCBhbnl3YXkuIEhvcGVmdWxseSB3ZSBjYW4g
Y29tZSB1cCB3aXRoIGEgcGxhbiBhdCBQbHVtYmVycyAtIHNvCj4gZmVlbCBmcmVlIHRvIGNoaW1l
IGluIChvciBtYXliZSBpdCBnZXRzIHNvcnRlZCBvdXQgaGVyZSBhbmQgSSBkb24ndAo+IGhhdmUg
dG8gZG8gYW55IHB1YmxpYyBzcGVha2luZyDwn5iNKS4KCkFoLCB0aGVyZSBpcyBteSBnb29kIHJl
YXNvbiBmb3IgcmVnaXN0ZXJpbmcgZm9yIExQQyA7LSkKCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
