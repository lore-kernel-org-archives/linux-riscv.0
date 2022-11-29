Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4F4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyyBcHQEk7ixCIcVG9+csVMvMtkIxNS2mcGRcWZEFxk=; b=wAhunLLzDymewW
	YKdRkmipP3eQFcgmuLEVdTPyRiyBsfYu9A8HnumWNorcORUm6uM4v6RUEM0sAwI3QWnmRMunolo+a
	5H5tP2tRHrTck4cC/PAH/BSTFQZgjVLnFXKV/uuFiVQ5Ma7A3LxMknSTRNaAhc21vV00NSMqPAV8K
	0eSLOUie72K0mZnYn4hFfv2822vLxAm4VC/EZX1FO5ucZIocx9hI71+lkLHWudjnNcoMbwKuPDVip
	226cej3IOD7oEXV2u8BSWJIErIQleHTT1aJwweX8zUcmvcdf4hgpr9KhtoiSwVgjdRVN6aDV8OXbz
	sCbKLStwgFV+yYu3r1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p076y-00BGmK-E9; Tue, 29 Nov 2022 20:21:48 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p076v-00BGlv-Rw
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 20:21:47 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id q10so10530254qvt.10
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvAzS5kGyrLnX6q1e6NL6cWbiqmxki0GQLIwJ0tBpRg=;
        b=dVw0ilbD5v9MyHU6G8wsmG4e7bS0H/eR0BTSODqkGlVqnAu5jAG9YkQ4bn5dQC7oSt
         Rdf/66YxC5yAqmDzQXmx9uKLKE6qLwm+GDcvPWaimTYwmLa2Y8jspaIaKSECPA28petC
         PoG5NnRnYDKK3AuPuzwce+4iKa61Uf0SF0V/Q3PdtGhscPCpz402GIMxNPMFfK3Tisth
         k9dAQVypUmOWezsZcQB/OiayAQT4clOvOCttowowVqBPih6q0B5JZj3kcYmKcbRs3O4F
         Jmakq3/J3MxfS06B1F3OW6d68zgjAiFnklJSm3480PHN67zKuoamTsv24ZADx9a5fW2y
         4fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvAzS5kGyrLnX6q1e6NL6cWbiqmxki0GQLIwJ0tBpRg=;
        b=ZRxYGoie/ZkS/HPNj0/sCbTJD7BfaG4g+kMgBzVrYZx8cXrkeS5IYHTE1GAFJRmo2c
         t9ei56vdo36aBrPARFxN0z9+HuMhjNPQwdYCl4GgPhY2Ve4BokQjstGcVHmUad+ZmD70
         nCONADdZFZ8c3MvZj0ARsRnbq4QzJCZ85XKn7WTo8QONG8Qk4mWuhjXasdAF5IITDqhM
         kxyGnQ81QSE08i6pnWeIwAMzB1gC0im0Ob0OsUWcwS2p31EhhUeixLYekkImsAReavwL
         n+GMqJH/plMF2oBtapQIWALw+0cT5rccep6bwwrSRDjBc4e+lIdJ06C7ghB4AX7gZSZM
         DfJw==
X-Gm-Message-State: ANoB5plJJwx7EKrAyBkOi5MWWpN1IGpfuZ2QC9/ma5WO6g3dsMbWPUph
	k6scX6RoS7CuFxXL80WwMiwnXWx3OHrYuMLdR9oVoT6FFLmG1F0fHDJbYXawiGMC2g4WyI2vBBs
	rh6bdM9DHkqbgSkIxD2QymJR4HuO6XK5ze6Pfve/hJ3EU29fLOGFBfApsea+5EM/umS18z7YEjr
	17rMo=
X-Google-Smtp-Source: AA0mqf51Xb39fU4d5HlAWipfQug9Fv1pjxZ6Q1enBqoI9HSPyj+C8bddylMi4x5ncpKKMTQZ0EiLKg==
X-Received: by 2002:a0c:90f1:0:b0:4c6:8f2e:9a2 with SMTP id p104-20020a0c90f1000000b004c68f2e09a2mr52778874qvp.100.1669753303226;
        Tue, 29 Nov 2022 12:21:43 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id w30-20020a05620a0e9e00b006faaf6dc55asm10989274qkm.22.2022.11.29.12.21.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 12:21:42 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3c21d6e2f3aso90260997b3.10
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 12:21:42 -0800 (PST)
X-Received: by 2002:a81:5592:0:b0:3ce:b4a4:8804 with SMTP id
 j140-20020a815592000000b003ceb4a48804mr5914553ywb.85.1669753302053; Tue, 29
 Nov 2022 12:21:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8uTdiWJSCdbukA1sndHxDXE_VV0Qzara_AQw2s2n6s6Lg@mail.gmail.com>
 <mhng-c2b3d5ca-288f-45b3-97f5-7c532db2e59f@palmer-ri-x1c9a>
 <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com> <4386F399-2862-4161-B303-8080EBEEA374@jrtc27.com>
In-Reply-To: <4386F399-2862-4161-B303-8080EBEEA374@jrtc27.com>
From: Andrew Waterman <andrew@sifive.com>
Date: Tue, 29 Nov 2022 12:21:31 -0800
X-Gmail-Original-Message-ID: <CA++6G0Do001Bo+kxhUNz5T937TYU-K5Y43MH+X=Q2TgFCaxcfQ@mail.gmail.com>
Message-ID: <CA++6G0Do001Bo+kxhUNz5T937TYU-K5Y43MH+X=Q2TgFCaxcfQ@mail.gmail.com>
Subject: Re: [QUERY]: Adding support for a platform
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	binutils@sourceware.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_122145_967697_6379F2D5 
X-CRM114-Status: GOOD (  35.39  )
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

T24gVHVlLCBOb3YgMjksIDIwMjIgYXQgMTI6MTIgUE0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0Bq
cnRjMjcuY29tPiB3cm90ZToKPgo+IE9uIDI5IE5vdiAyMDIyLCBhdCAxOToyOCwgTGFkLCBQcmFi
aGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBQYWxt
ZXIsCj4gPgo+ID4gT29wcyBJIHNob3VsZCBoYXZlIGluY2x1ZGVkIGxpbnV4LXJpc2N2IHRvIHRo
ZSBDQyBsaXN0IGhlcmUgKGRvaW5nIGl0IG5vdykKPiA+Cj4gPiBPbiBUdWUsIE5vdiAyOSwgMjAy
MiBhdCA3OjIwIFBNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4gT24gVHVlLCAyOSBOb3YgMjAyMiAxMToxNjoyOSBQU1QgKC0wODAwKSwgYmludXRp
bHNAc291cmNld2FyZS5vcmcgd3JvdGU6Cj4gPj4+IEhpIEFsbCwKPiA+Pj4KPiA+Pj4gSWYgdGhp
cyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlIHRvIGFzayB0aGlzIHF1ZXN0aW9uIHBsZWFzZSBsZXQg
bWUga25vdy4KPiA+Pj4KPiA+Pj4gU28gd2UgaGF2ZSBhIFJJU0NWIHBsYXRmb3JtIChSZW5lc2Fz
IFJaL0ZpdmUpIGZvciB3aGljaCB3ZSBuZWVkIHRvCj4gPj4+IGFkanVzdCB0aGUgVEVYVF9TVEFS
VF9BRERSLiBTbyBiZWxvdyBhcmUgbXkgcXVlcmllczoKPiA+Pj4gKiBXaGF0IGlzIHRoZSBwcm9j
ZWR1cmUgZm9yIHVwc3RyZWFtaW5nPwo+ID4+PiAqIEFyZSBwYXRjaGVzIGFjY2VwdGVkIGZvciBp
bmRpdmlkdWFsIHBsYXRmb3JtcyAoZm9yIGFkanVzdGluZyBURVhUX1NUQVJUX0FERFIpPwo+ID4+
Cj4gPj4gSXMgdGhpcyBzdGlsbCByZWxhdGVkIHRvIHRoYXQgYnVnIHdpdGggdGhlIHN0YXRpYyBi
aW5hcmllcyB5b3UnZAo+ID4+IG1lbnRpb25lZCBiZWZvcmU/ICBJIHRoaW5rIHdlJ2QgcmVhbGx5
IG5lZWQgdG8gZmlndXJlIG91dCB0aGUgcm9vdCBjYXVzZQo+ID4+IGJlZm9yZSB3ZSBjYW4gbWFr
ZSBhIHJlYXNvbmVkIGRlY2lzaW9uIGhlcmUsIG15IGd1ZXNzIHdvdWxkIGJlIHRoYXQKPiA+PiBj
aGFuZ2luZyBURVhUX1NUQVJUX0FERFIganVzdCB3b3JrcyBhcm91bmQgdGhlIHJlYWwgYnVnLgo+
ID4+Cj4gPiBCZWxvdyBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgdGhlIHNvbHV0aW9uOgo+ID4KPiA+
IFRFWFRfU1RBUlRfQUREUiBpcyB0aGUgc3RhcnQgb2YgdGhlIHRleHQgc2VnbWVudCBvZiBhbiBh
cHBsaWNhdGlvbi4KPiA+IFRoaXMgaXMgYmVpbmcgc2V0IHRvIDB4MTAwMDAgZm9yIFJJU0NWIHBs
YXRmb3Jtcy4KPiA+Cj4gPiBTbyB3aGVuIGFuIGFwcGxpY2F0aW9uIGlzIGNvbXBpbGVkIHdpdGgg
dGhlIHN0YXRpYyBmbGFnIHRoZSBsb2FkIHdvdWxkCj4gPiBzdGFydCBmcm9tIDB4MTAwMDAgLSB4
eXogKGRlcGVuZGluZyBvbiBzaXplIG9mIHRoZSBhcHBsaWNhdGlvbikKPiA+Cj4gPiBFbnRyeSBw
b2ludCAweDEwMWMwCj4gPiBUaGVyZSBhcmUgNSBwcm9ncmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0
IG9mZnNldCA2NFByb2dyYW0gSGVhZGVyczoKPiA+ICBUeXBlICAgICAgICAgICBPZmZzZXQgICAg
ICAgICAgICAgVmlydEFkZHIgICAgICAgICAgIFBoeXNBZGRyCj4gPiAgICAgICAgICAgICAgICAg
RmlsZVNpeiAgICAgICAgICAgIE1lbVNpeiAgICAgICAgICAgICAgRmxhZ3MgIEFsaWduCj4gPiAg
TE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAwMDAwMDAwMDAxMDAwMCAweDAw
MDAwMDAwMDAwMTAwMDAKPiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwNTliNDggMHgw
MDAwMDAwMDAwMDU5YjQ4ICBSIEUgICAgMHgxMDAwCj4gPiAgTE9BRCAgICAgICAgICAgMHgwMDAw
MDAwMDAwMDU5YjYwIDB4MDAwMDAwMDAwMDA2YWI2MCAweDAwMDAwMDAwMDAwNmFiNjAKPiA+ICAg
ICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDFmNjggMHgwMDAwMDAwMDAwMDAzNTI4ICBSVyAg
ICAgMHgxMDAwCj4gPgo+ID4gU28gZm9yIHRoZSBhYm92ZSBhcHBsaWNhdGlvbiB3aGljaCBpcyBj
b21waWxlZCBzdGF0aWNhbGx5IHdlIGNhbiBzZWUKPiA+IHRoZSBlbnRyeSBwb2ludCBpcyAweDEw
MWMwIGFuZCBsb2FkIDB4MDAwMDAwMDAwMDAxMDAwMC4KPiA+Cj4gPiBBbmRlcyBBWDQ1TVAgY29y
ZXMgaGF2ZSBsb2NhbCBtZW1vcnkgSUxNIGFuZCBETE0gdGhhdCBhcmUgbWFwcGVkIGluCj4gPiB0
aGUgcmVnaW9uIEjigJkwXzAwMDNfMDAwMCAtIEjigJkwXzAwMDRfRkZGRiBvbiB0aGUgUlovRml2
ZSBTb0MuIFdoZW4gdGhlCj4gPiB2aXJ0dWFsIGFkZHJlc3MgZmFsbHMgaW4gdGhpcyByYW5nZSB0
aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBhIHBhZ2UKPiA+IGZhdWx0IGFuZCBhc3N1bWVzIHRoZSB2
aXJ0dWFsIGFkZHJlc3MgYXMgcGh5c2ljYWwgYWRkcmVzcyBhbmQgaGVuY2UKPiA+IHRoZSBhcHBs
aWNhdGlvbiBmYWlscyB0byBydW4gKHBhbmljcyBzb21ld2hlcmUpLgo+ID4KPiA+IFNvIHRvIGF2
b2lkIHRoaXMgaXNzdWUgd2Ugc2V0IHRoZSBURVhUX1NUQVJUX0FERFIgdG8gMHg1MDAwMCBzbyB0
aGF0Cj4gPiB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGFueSBzdGF0aWNhbGx5IGNvbXBpbGVkIGFw
cGxpY2F0aW9uIGRvZXMgbm90Cj4gPiBmYWxsIGluIHRoZSByYW5nZSBvZiBI4oCZMF8wMDAzXzAw
MDAgLSBI4oCZMF8wMDA0X0ZGRkYuCj4gPgo+ID4gRWxmIGZpbGUgdHlwZSBpcyBFWEVDIChFeGVj
dXRhYmxlIGZpbGUpCj4gPiBFbnRyeSBwb2ludCAweDUwNGU0Cj4gPiBUaGVyZSBhcmUgNSBwcm9n
cmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NAo+ID4KPiA+IFByb2dyYW0gSGVhZGVy
czoKPiA+ICBUeXBlICAgICAgICAgICBPZmZzZXQgICAgICAgICAgICAgVmlydEFkZHIgICAgICAg
ICAgIFBoeXNBZGRyCj4gPiAgICAgICAgICAgICAgICAgRmlsZVNpeiAgICAgICAgICAgIE1lbVNp
eiAgICAgICAgICAgICAgRmxhZ3MgIEFsaWduCj4gPiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAw
MDAwMDAwMDAwIDB4MDAwMDAwMDAwMDA1MDAwMCAweDAwMDAwMDAwMDAwNTAwMDAKPiA+ICAgICAg
ICAgICAgICAgICAweDAwMDAwMDAwMDAwNTdkYzggMHgwMDAwMDAwMDAwMDU3ZGM4ICBSIEUgICAg
MHgxMDAwCj4gPiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDU4NWI4IDB4MDAwMDAwMDAw
MDBhOTViOCAweDAwMDAwMDAwMDAwYTk1YjgKPiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAw
MDAwMDRlZTAgMHgwMDAwMDAwMDAwMDA2NGIwICBSVyAgICAgMHgxMDAwCj4gPiAgTk9URSAgICAg
ICAgICAgMHgwMDAwMDAwMDAwMDAwMTU4IDB4MDAwMDAwMDAwMDA1MDE1OCAweDAwMDAwMDAwMDAw
NTAxNTgKPiA+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDAwNDQgMHgwMDAwMDAwMDAw
MDAwMDQ0ICBSICAgICAgMHg0Cj4gPgo+ID4gU28gbm93IHdpdGggdGhlIGZpeCBmb3Igc3RhdGlj
YWxseSBjb21waWxlZCBhcHBsaWNhdGlvbnMgd2UgY2FuIHNlZQo+ID4gaXRzIG9mZnNldHRlZCBh
bmQgZW50cnkgcG9pbnQgaXMgMHg1MDRlNCBhbmQgbG9hZCBpcyBhdAo+ID4gMHgwMDAwMDAwMDAw
MDUwMDAwLiBTbyB3aXRoIHRoaXMgd2UgYXJlIGZvciBzdXJlIHRoZSBNTVUgd2lsbCBhbHdheXMK
PiA+IHRyaWdnZXIgYSBwYWdlIGZhdWx0Lgo+Cj4gV2VsbCB0aGF04oCZcyBqdXN0IGEgYmxhdGFu
dCB2aW9sYXRpb24gb2YgdGhlIHNwZWMuCgpSaWdodCAtIHRoaXMgaXNuJ3QgYSBwbGF0Zm9ybSBx
dWlyazsgaXQncyBhIHZpb2xhdGlvbiBvZiB0aGUgSVNBLgpVbmxlc3MgdGhpcyBiZWhhdmlvciBp
cyBlbmdhZ2VkIGJ5IGEgY3VzdG9tIG1vZGUgYml0LCB0aGF0IGlzLCBpbgp3aGljaCBjYXNlLCBp
dCBzaG91bGQganVzdCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IGFuZCBub25lIG9mIHRoaXMKd291
bGQgYmUgYSBwcm9ibGVtLiAgSWYgdGhlIGJlaGF2aW9yIGlzIHVuY29uZGl0aW9uYWxseSBlbmFi
bGVkLCB0aGlzCnNob3VsZCBiZSB0cmVhdGVkIGFzIGFuIGVycmF0dW0uCgo+IFdoYXQgaGFwcGVu
cyBpZiBhCj4gbWFsaWNpb3VzIChvciBidWdneSkgdXNlcnNwYWNlIGJpbmFyeSBnb2VzIGFuZCBh
Y2Nlc3NlcyB1bm1hcHBlZCBtZW1vcnkKPiBpbiB0aGF0IHJhbmdlPyBEb2VzIGl0IGFjdHVhbGx5
IGdldCBhY2Nlc3MgdG8gdGhpcyBJTE0vRExNPyBJZiBzbwo+IHRoYXTigJlzIGEgZ2FwaW5nIHNp
ZGUgY2hhbm5lbC4KPgo+IEplc3MKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
