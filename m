Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8173BC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0ipfB4eMmJMyT8Spb1VT2Amberb4auApoSZUJhsDMc=; b=V1iZj52dLKXdVu
	hma3Hdp2y1DIc3+fNaY1g34YRTzh13Y8BUeSBykHEdCduwIhDqpoSj+WaCsqPAqwAZ+T6y4O+5uo/
	j9M7pOYck0efhqM+Vnv+iHMyw0+BLnT/MRz0dcFBIs0Hv3QB4mtKGCz/3r/f+gjE6LA8yVTEn/qs3
	O4gmpzduQfTlXmS22gW+kxOzcKav25MRg32sGneixlrRO3SFfZRdZvk+bGD2QeiwNvfuWfyrBtPGr
	+CmvlsVwA0cVI+iYWVa7+H4GfnIY5VQ2FFtQ9Ms/8LbwoRCfcZkywjFf8rhUqKcBk4oLTqKGsRMyy
	pWC+XvvOD1yywgZzCCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08FI-00BP7C-OT; Tue, 29 Nov 2022 21:34:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08FG-00BP64-2R
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:34:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ml11so12053066ejb.6
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raxsiOTJycWUQMgi+7NyFe4tBvg9owbpLglKenp5iLs=;
        b=gu68Dlmxv+6CrUzWo6Ne5JDly3z0O5Kp5y58oUKFCSJ7u4Fj5bE/OnAY25uFDWjXd1
         Dq7dDr+IQZ4wsjAedWVCyq+yXqjwq2PM85GzzL8ZQc6tFEcz3pPjLfK98eLv3WFhnzyZ
         tDQuvhFL1gLnsQysU6LpqzZOU8O/MmJUydLLN97n3OdUdagwAD/wueqc1G6Am0iCSnqb
         jmbpRQDvRM3V6nktqcBXuY+MuFaoiwWDcvm2M3u7zlrFLuBnttpvvpEcVS/pwPxn0gXZ
         iN/DmuEq3r0jCmR/pobKxhtXRvrSDyF7AXrQJGGNa7EQ2L886PIdMVbAQglR5E5iTlSl
         ypYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raxsiOTJycWUQMgi+7NyFe4tBvg9owbpLglKenp5iLs=;
        b=GyU0CMHIYRXz0mAiATtflH5W1Nn+aRyylGK8Gr3GjcNI9ztYmrOA534GSsCgsphbKY
         dXq3tTXy3faN/wKbVEeV6LGhig3NAiQuJc16YDpIStpOra/BtVvQm/EUKnm28pvfVvSc
         RFEcReAA//ElgABm3zHRTIxTYxs+hkSltNizfhcIjVjczTicGz+O3S3riVDAl4CC9sXF
         NwW8V2OFQ+LGvAXmWTJAmi9hZXBJ6/4flpkMC4POQkJGLkakFJtEssYs7fWlyTet8mKL
         ythf/XxoQd29F/JNBSNe80DtHR0+OYu6xowYWoPy4ou0h3GwUFpW1tMXSe2juz5XgfZe
         nKVQ==
X-Gm-Message-State: ANoB5pmZqWVAXtwzwVJK37xKkkgADdGKbz+23918vyTnvfkHtGueY76s
	mJqVGcd0jv5UBwYcjXb6laC/9gQ/FeCTLxpgmxc=
X-Google-Smtp-Source: AA0mqf7Yy2q+g1+sVprQFzrzAXUGK2m5V7Iyl6GHrP2GApdErE+G5Mh2eX/ZfwAyDKTBxkvwIwG2/LWwbuBcFQnqzPE=
X-Received: by 2002:a17:906:3e41:b0:78d:bc9f:33da with SMTP id
 t1-20020a1709063e4100b0078dbc9f33damr48432104eji.80.1669757660776; Tue, 29
 Nov 2022 13:34:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com>
 <mhng-17a43ac8-4700-48e4-9660-6f967328e8ab@palmer-ri-x1c9a>
In-Reply-To: <mhng-17a43ac8-4700-48e4-9660-6f967328e8ab@palmer-ri-x1c9a>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Nov 2022 21:33:54 +0000
Message-ID: <CA+V-a8vKStFdBwqjo+n-iVREtd3g1r_HFPABoijhrc9GVw3i6A@mail.gmail.com>
Subject: Re: [QUERY]: Adding support for a platform
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: binutils@sourceware.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_133426_143634_CCCA4045 
X-CRM114-Status: GOOD (  41.60  )
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

SGkgUGFsbWVyLAoKT24gVHVlLCBOb3YgMjksIDIwMjIgYXQgNzozNSBQTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjkgTm92IDIwMjIgMTE6
Mjg6MTEgUFNUICgtMDgwMCksIHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tIHdyb3RlOgo+ID4g
SGkgUGFsbWVyLAo+ID4KPiA+IE9vcHMgSSBzaG91bGQgaGF2ZSBpbmNsdWRlZCBsaW51eC1yaXNj
diB0byB0aGUgQ0MgbGlzdCBoZXJlIChkb2luZyBpdCBub3cpCj4gPgo+ID4gT24gVHVlLCBOb3Yg
MjksIDIwMjIgYXQgNzoyMCBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIFR1ZSwgMjkgTm92IDIwMjIgMTE6MTY6MjkgUFNUICgtMDgwMCks
IGJpbnV0aWxzQHNvdXJjZXdhcmUub3JnIHdyb3RlOgo+ID4+ID4gSGkgQWxsLAo+ID4+ID4KPiA+
PiA+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFjZSB0byBhc2sgdGhpcyBxdWVzdGlvbiBw
bGVhc2UgbGV0IG1lIGtub3cuCj4gPj4gPgo+ID4+ID4gU28gd2UgaGF2ZSBhIFJJU0NWIHBsYXRm
b3JtIChSZW5lc2FzIFJaL0ZpdmUpIGZvciB3aGljaCB3ZSBuZWVkIHRvCj4gPj4gPiBhZGp1c3Qg
dGhlIFRFWFRfU1RBUlRfQUREUi4gU28gYmVsb3cgYXJlIG15IHF1ZXJpZXM6Cj4gPj4gPiAqIFdo
YXQgaXMgdGhlIHByb2NlZHVyZSBmb3IgdXBzdHJlYW1pbmc/Cj4gPj4gPiAqIEFyZSBwYXRjaGVz
IGFjY2VwdGVkIGZvciBpbmRpdmlkdWFsIHBsYXRmb3JtcyAoZm9yIGFkanVzdGluZyBURVhUX1NU
QVJUX0FERFIpPwo+ID4+Cj4gPj4gSXMgdGhpcyBzdGlsbCByZWxhdGVkIHRvIHRoYXQgYnVnIHdp
dGggdGhlIHN0YXRpYyBiaW5hcmllcyB5b3UnZAo+ID4+IG1lbnRpb25lZCBiZWZvcmU/ICBJIHRo
aW5rIHdlJ2QgcmVhbGx5IG5lZWQgdG8gZmlndXJlIG91dCB0aGUgcm9vdCBjYXVzZQo+ID4+IGJl
Zm9yZSB3ZSBjYW4gbWFrZSBhIHJlYXNvbmVkIGRlY2lzaW9uIGhlcmUsIG15IGd1ZXNzIHdvdWxk
IGJlIHRoYXQKPiA+PiBjaGFuZ2luZyBURVhUX1NUQVJUX0FERFIganVzdCB3b3JrcyBhcm91bmQg
dGhlIHJlYWwgYnVnLgo+ID4+Cj4gPiBCZWxvdyBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgdGhlIHNv
bHV0aW9uOgo+ID4KPiA+IFRFWFRfU1RBUlRfQUREUiBpcyB0aGUgc3RhcnQgb2YgdGhlIHRleHQg
c2VnbWVudCBvZiBhbiBhcHBsaWNhdGlvbi4KPiA+IFRoaXMgaXMgYmVpbmcgc2V0IHRvIDB4MTAw
MDAgZm9yIFJJU0NWIHBsYXRmb3Jtcy4KPiA+Cj4gPiBTbyB3aGVuIGFuIGFwcGxpY2F0aW9uIGlz
IGNvbXBpbGVkIHdpdGggdGhlIHN0YXRpYyBmbGFnIHRoZSBsb2FkIHdvdWxkCj4gPiBzdGFydCBm
cm9tIDB4MTAwMDAgLSB4eXogKGRlcGVuZGluZyBvbiBzaXplIG9mIHRoZSBhcHBsaWNhdGlvbikK
PiA+Cj4gPiBFbnRyeSBwb2ludCAweDEwMWMwCj4gPiBUaGVyZSBhcmUgNSBwcm9ncmFtIGhlYWRl
cnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NFByb2dyYW0gSGVhZGVyczoKPiA+ICAgVHlwZSAgICAg
ICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAgICAgICAgICBQaHlzQWRkcgo+ID4g
ICAgICAgICAgICAgICAgICBGaWxlU2l6ICAgICAgICAgICAgTWVtU2l6ICAgICAgICAgICAgICBG
bGFncyAgQWxpZ24KPiA+ICAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAw
MDAwMDAwMDAxMDAwMCAweDAwMDAwMDAwMDAwMTAwMDAKPiA+ICAgICAgICAgICAgICAgICAgMHgw
MDAwMDAwMDAwMDU5YjQ4IDB4MDAwMDAwMDAwMDA1OWI0OCAgUiBFICAgIDB4MTAwMAo+ID4gICBM
T0FEICAgICAgICAgICAweDAwMDAwMDAwMDAwNTliNjAgMHgwMDAwMDAwMDAwMDZhYjYwIDB4MDAw
MDAwMDAwMDA2YWI2MAo+ID4gICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDFmNjggMHgw
MDAwMDAwMDAwMDAzNTI4ICBSVyAgICAgMHgxMDAwCj4gPgo+ID4gU28gZm9yIHRoZSBhYm92ZSBh
cHBsaWNhdGlvbiB3aGljaCBpcyBjb21waWxlZCBzdGF0aWNhbGx5IHdlIGNhbiBzZWUKPiA+IHRo
ZSBlbnRyeSBwb2ludCBpcyAweDEwMWMwIGFuZCBsb2FkIDB4MDAwMDAwMDAwMDAxMDAwMC4KPiA+
Cj4gPiBBbmRlcyBBWDQ1TVAgY29yZXMgaGF2ZSBsb2NhbCBtZW1vcnkgSUxNIGFuZCBETE0gdGhh
dCBhcmUgbWFwcGVkIGluCj4gPiB0aGUgcmVnaW9uIEjigJkwXzAwMDNfMDAwMCAtIEjigJkwXzAw
MDRfRkZGRiBvbiB0aGUgUlovRml2ZSBTb0MuIFdoZW4gdGhlCj4gPiB2aXJ0dWFsIGFkZHJlc3Mg
ZmFsbHMgaW4gdGhpcyByYW5nZSB0aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBhIHBhZ2UKPiA+IGZh
dWx0IGFuZCBhc3N1bWVzIHRoZSB2aXJ0dWFsIGFkZHJlc3MgYXMgcGh5c2ljYWwgYWRkcmVzcyBh
bmQgaGVuY2UKPiA+IHRoZSBhcHBsaWNhdGlvbiBmYWlscyB0byBydW4gKHBhbmljcyBzb21ld2hl
cmUpLgo+ID4KPiA+IFNvIHRvIGF2b2lkIHRoaXMgaXNzdWUgd2Ugc2V0IHRoZSBURVhUX1NUQVJU
X0FERFIgdG8gMHg1MDAwMCBzbyB0aGF0Cj4gPiB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGFueSBz
dGF0aWNhbGx5IGNvbXBpbGVkIGFwcGxpY2F0aW9uIGRvZXMgbm90Cj4gPiBmYWxsIGluIHRoZSBy
YW5nZSBvZiBI4oCZMF8wMDAzXzAwMDAgLSBI4oCZMF8wMDA0X0ZGRkYuCj4gPgo+ID4gRWxmIGZp
bGUgdHlwZSBpcyBFWEVDIChFeGVjdXRhYmxlIGZpbGUpCj4gPiBFbnRyeSBwb2ludCAweDUwNGU0
Cj4gPiBUaGVyZSBhcmUgNSBwcm9ncmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NAo+
ID4KPiA+IFByb2dyYW0gSGVhZGVyczoKPiA+ICAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAg
ICAgICAgIFZpcnRBZGRyICAgICAgICAgICBQaHlzQWRkcgo+ID4gICAgICAgICAgICAgICAgICBG
aWxlU2l6ICAgICAgICAgICAgTWVtU2l6ICAgICAgICAgICAgICBGbGFncyAgQWxpZ24KPiA+ICAg
TE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAwMDAwMDAwMDA1MDAwMCAweDAw
MDAwMDAwMDAwNTAwMDAKPiA+ICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDU3ZGM4IDB4
MDAwMDAwMDAwMDA1N2RjOCAgUiBFICAgIDB4MTAwMAo+ID4gICBMT0FEICAgICAgICAgICAweDAw
MDAwMDAwMDAwNTg1YjggMHgwMDAwMDAwMDAwMGE5NWI4IDB4MDAwMDAwMDAwMDBhOTViOAo+ID4g
ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDRlZTAgMHgwMDAwMDAwMDAwMDA2NGIwICBS
VyAgICAgMHgxMDAwCj4gPiAgIE5PVEUgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDE1OCAweDAw
MDAwMDAwMDAwNTAxNTggMHgwMDAwMDAwMDAwMDUwMTU4Cj4gPiAgICAgICAgICAgICAgICAgIDB4
MDAwMDAwMDAwMDAwMDA0NCAweDAwMDAwMDAwMDAwMDAwNDQgIFIgICAgICAweDQKPiA+Cj4gPiBT
byBub3cgd2l0aCB0aGUgZml4IGZvciBzdGF0aWNhbGx5IGNvbXBpbGVkIGFwcGxpY2F0aW9ucyB3
ZSBjYW4gc2VlCj4gPiBpdHMgb2Zmc2V0dGVkIGFuZCBlbnRyeSBwb2ludCBpcyAweDUwNGU0IGFu
ZCBsb2FkIGlzIGF0Cj4gPiAweDAwMDAwMDAwMDAwNTAwMDAuIFNvIHdpdGggdGhpcyB3ZSBhcmUg
Zm9yIHN1cmUgdGhlIE1NVSB3aWxsIGFsd2F5cwo+ID4gdHJpZ2dlciBhIHBhZ2UgZmF1bHQuCj4K
PiBPSywgY29vbCwgdGhhdCBleHBsYWlucyBpdC4KPgo+IFNvIEkgdGhpbmsgd2UgbmVlZCB0byB0
ZWFjaCBMaW51eCBhYm91dCB0aGlzIHBsYXRmb3JtLXNwZWNpZmljIGJlaGF2aW9yCj4gc28gd2Ug
Y2FuIHByZXZlbnQgYW55IGFkZHJlc3NlcyBpbiB0aGUgb2ZmZW5kaW5nIFZBIHJhbmdlIGZyb20g
YmVpbmcKPiBhbGxvY2F0ZWQuCkFncmVlZCwgYW55IHBvaW50ZXJzIG9uIGRvaW5nIHRoaXM/Cgo+
IFRoZW4gaXQnbGwgYmUgdXAgdG8gdXNlcnNwYWNlIHRvIGRlYWwgd2l0aCB0aGUgZmFsbG91dCwg
aWYKPiB0aGF0IG1lYW5zIGNoYW5naW5nIFRFWFRfU1RBUlRfQUREUkVTUyBpdCBzZWVtcyBmaW5l
IHRvIG1lLiAgSSdtIG5vdAo+IHN1cmUgaWYgdGhlcmUncyBhbHJlYWR5IHNvbWUgc29ydCBvZiBh
dXRvY29uZi10eXBlIHRoaW5nIHRvIGNoYW5nZSB0aGUKPiBkZWZhdWx0IGluIGJpbnV0aWxzLCBp
ZiBub3QgdGhlbiBhZGRpbmcgb25lIHNlZW1zIGxpa2UgdGhlIHdheSB0byBnby4KPgpUQkggSSBo
YXZlbid0IGV4cGxvcmVkIHRoZSBjb2RlIHlldCBpZiBpdCB3YXMgY29uZmlndXJhYmxlIHVzaW5n
CmF1dG9jb25mLiBJJ2xsIGhhdmUgdG8gZG8gc29tZSBkaWdnaW5nLgoKPiBUaGVuIGl0J3MgdXAg
dG8gZGlzdHJvcyB0aGF0IHdhbnQgdG8gcnVuIG9uIHRoZSBpbXBhY3RlZCBoYXJkd2FyZSB0bwo+
IG1ha2Ugc3VyZSB0aGV5IHJlYnVpbGQgYWxsIHRoZSBpbXBhY3RlZCBiaW5hcmllcy4gIEkgZG9u
J3QgdGhpbmsgdGhlcmUncwo+IGFueSB3YXkgYXJvdW5kIHRoYXQgZm9yIHVzZXJzcGFjZS12aXNp
YmxlIGVycmF0YSwgYW5kIGl0IHRoaXMgY2FzZSB0aGUKPiBjaGVjayBmb3IgaW1wYWN0ZWQgYmlu
YXJpZXMgc2VlbXMgcHJldHR5IG1hbmFnZWFibGUgdG8gd3JpdGUgZG93biAoc29tZQo+IHNvcnQg
b2YgYGZpbmQgfCBvYmpkdW1wIHwgZ3JlcGAgdGhpbmcgd291bGQgcHJvYmFibHkgZG8gaXQpLgo+
CkFncmVlZC4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
