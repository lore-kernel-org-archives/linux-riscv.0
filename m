Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE88BC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 03:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEZvSYgf4uFCOBlv4B9gf7+rI53gMGmuy8CNeTHqgc4=; b=rDWoaIgSGzhweg
	CXOlCGSldSwPYtv+vnBc81jU+ch45SKHz9CqpB+KBjvfCvr7EGJCEcroqVZJqPFjYbhd3/FGDuAVO
	GD64t5L/neR2XZXr7mZGvmDB2ZoJzDw8am+EqDiFfBCPIxWrJn76ubLsKx/POy4rvyFG1AuxqI0zW
	gHKvxioYY9wpwY4wHVppAyZhVuh4mQsyJFocg8ceBCCMc8h4w4sBYe6yIv5v3HBDsRkn/t210s6OS
	fxvd+TpUKLDGAXm7H2AEi6yRxEprv9oUfZAd5E3dkIK9MfOG+isMclvbuYncKSpxDidbPfCbl9GX6
	YKgFsNPgtsgljRPdSDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWYZ-004nBl-1O;
	Fri, 22 Dec 2023 03:50:39 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWYW-004nB9-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 03:50:38 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1f066fc2a2aso672031fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 19:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703217031; x=1703821831; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYYQ0eaJfGl5fZFAc7fvgOmI29R64LQaVNr4Dz/XHbI=;
        b=ITu9/vk3kXm11CSrgpbxKWEUN6mp2m5JrlJVfV9wM5LSAjqEkYMmK/XGjFWB2Ug2EL
         Q3nB/Zs5++QMf27q1UhacWTAdfsLbiF5YJI0H/yGM1dlEWOSgbfi1siIXI50lMfL5dy6
         exsvDAyjeWPI982IM6Pi9bLhwVc2hX80MVwa8sau/QePFMg/DSM7xwOP+KddEY2i1PMd
         eSVMzKLzbbyxRPX4p+1dmh5/0QXlKAyCy3KOermi/1Ndkt3UKxvnMWXzP4FEdVb1VdOl
         qo1lLF9jDusuZF8x5+3QhcV4MlXxCKuT9q+lPOsoy+tGcjJZw339419e0SiRQMKzHF/o
         CNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703217031; x=1703821831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYYQ0eaJfGl5fZFAc7fvgOmI29R64LQaVNr4Dz/XHbI=;
        b=maP7zeOLH3sBnAEo+pHjAHV3LmnQbBNyDRuG3Y+2eFNNsSoyD0Utk7TAo70r8fXNie
         eFZKrL4fSJy3LuzhpqPm6etvwxHGBt4YU2uPklfjqIDTmrUK0b8KqUD2S9jh2cchFdqZ
         nLh5VZDTscg+T9wVRAtPOvjcE8FRpkykciWrMpwznEgNZWouD8VbG9ZuESOBSIwI9xTa
         nfUzTyg/2G2WpXbMtYz1ZuIredDfiyg2clNneh/GlyRGfzNKzJYVjm2TeRUQjiYI5Yjy
         BXWCCjGkkmAfH5KFty16Bvdf21oN4eCvtIQtztPE2N7YsCphEMsrxNIlyXHiU7HKVoq0
         GRfQ==
X-Gm-Message-State: AOJu0YxtsQaK8NsSxmJGGE5h8TAaqisr6uP+p8HDmi5n81gPLSR1sdVj
	ZaEvCB1fmupIg6z9/H9Te8r68xtWVTv/Sg==
X-Google-Smtp-Source: AGHT+IFt6GCsozB3jubH8uMt2MuLURJ3WSZcuhVSkJZ1iUth4pRyozMtRy8W9XYff73N9paT7hdKcQ==
X-Received: by 2002:a4a:98c4:0:b0:594:1bb4:93e9 with SMTP id b4-20020a4a98c4000000b005941bb493e9mr353161ooj.5.1703217031371;
        Thu, 21 Dec 2023 19:50:31 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:9585:2e30:5aba:e80c])
        by smtp.gmail.com with ESMTPSA id d9-20020a4aaa89000000b005912a3b64adsm602152oon.43.2023.12.21.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 19:50:30 -0800 (PST)
Date: Thu, 21 Dec 2023 19:50:27 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com,
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
Message-ID: <ZYUHg3kIMYdNSOSr@ghost>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-2-guoren@kernel.org>
 <ZYTriK9hjOFQou9Z@LeoBras>
 <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_195036_730009_FFB3FB25 
X-CRM114-Status: GOOD (  33.14  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTA6NTc6MTZBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCA5OjUx4oCvQU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBIZWxsbyBHdW8gUmVuLAo+ID4KPiA+IE9uIFRo
dSwgRGVjIDIxLCAyMDIzIGF0IDEwOjQ2OjU4QU0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdy
b3RlOgo+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+
Cj4gPiA+IEluIENPTVBBVCBtb2RlLCB0aGUgU1RBQ0tfVE9QIGlzIDB4ODAwMDAwMDAsIGJ1dCB0
aGUgVEFTS19TSVpFIGlzCj4gPiA+IDB4N2ZmZjAwMC4gV2hlbiB0aGUgdXNlciBzdGFjayBpcyB1
cG9uIDB4N2ZmZjAwMCwgaXQgd2lsbCBjYXVzZSBhIHVzZXIKPiA+ID4gc2VnbWVudCBmYXVsdC4g
U29tZXRpbWVzLCBpdCB3b3VsZCBjYXVzZSBib290IGZhaWx1cmUgd2hlbiB0aGUgd2hvbGUKPiA+
ID4gcm9vdGZzIGlzIHJ2MzIuCj4gPgo+ID4gQ2hlY2tpbmcgaWYgSSBnZXQgdGhlIHNjZW5hcmlv
Ogo+ID4KPiA+IEluIHBndGFibGUuaDoKPiA+ICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ICNkZWZp
bmUgVEFTS19TSVpFXzY0ICAgIChQR0RJUl9TSVpFICogUFRSU19QRVJfUEdEIC8gMikKPiA+ICNk
ZWZpbmUgVEFTS19TSVpFX01JTiAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikK
PiA+Cj4gPiAjaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4gI2RlZmluZSBUQVNLX1NJWkVfMzIgICAg
KF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCj4gPiAjZGVmaW5lIFRBU0tfU0laRSAg
ICAgICAodGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgIFRBU0tfU0laRV8zMiA6IFRBU0tfU0laRV82NCkKPiA+ICNlbHNlCj4gPiBbLi4u
XQo+ID4KPiA+IE1lYW5pbmcgQ09ORklHX0NPTVBBVCBpcyBvbmx5IGF2YWlsYWJsZSBpbiBDT05G
SUdfNjRCSVQsIGFuZCBUQVNLX1NJWkUgaW4KPiA+IGNvbXBhdCBtb2RlIGlzIGVpdGhlciBUQVNL
X1NJWkVfMzIgb3IgVEFTS19TSVpFXzY0IGRlcGVuZGluZyBvbiB0aGUgdGhyZWFkX2ZsYWcuCj4g
Pgo+ID4gZnJvbSBwcm9jZXNzb3IuaDoKPiA+ICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ICNkZWZp
bmUgREVGQVVMVF9NQVBfV0lORE9XICAgICAgKFVMKDEpIDw8IChNTUFQX1ZBX0JJVFMgLSAxKSkK
PiA+ICNkZWZpbmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICAgVEFTS19TSVpFXzY0Cj4gPiBbLi4u
XQo+ID4gI2RlZmluZSBTVEFDS19UT1AgICAgICAgICAgICAgICBERUZBVUxUX01BUF9XSU5ET1cK
PiA+Cj4gPgo+ID4gd2hlcmU6Cj4gPiAjZGVmaW5lIE1NQVBfVkFfQklUUyAoaXNfY29tcGF0X3Rh
c2soKSA/IFZBX0JJVFNfU1YzMiA6IE1NQVBfVkFfQklUU182NCkKPiA+IHdpdGggTU1BUF9WQV9C
SVRTXzY0IGJlaW5nIGVpdGhlciA0OCBvciAzNy4KPiA+Cj4gPiBJbiBjb21wYXQgbW9kZSwKPiA+
IFNUQUNLX1RPUCA9IDEgPDwgKDMyIC0gMSkgICAgICAgLT4gMHg4MDAwMDAwMAo+ID4gVEFTS19T
SVpFID0gMHg4MDAwMDAwIC0gNGsgICAgICAtPiAweDdmZmZmMDAwCj4gPgo+ID4gSUlVQywgeW91
ciBzdWdnZXN0aW9uIGlzIHRvIG1ha2UgVEFTS19TSVpFID0gU1RBQ0tfVE9QIGluIGNvbXBhdCBt
b2RlIG9ubHkuCj4gWWVzLCBpdCBjYXVzZXMgdGhlIHByb2JsZW0sIHdoaWNoIGNhdXNlcyB0aGUg
Ym9vdCB0byBmYWlsLgoKSSB0aGluayB3aGF0IExlb25hcmRvIGlzIGdldHRpbmcgYXQgaXMgdGhh
dCBpdCBpcyBvZGQgdGhhdCBpdCB3b3VsZApjYXVzZSBib290IGlzc3VlcyBpZiBUQVNLX1NJWkUg
aXMgbm90IGVxdWFsIFNUQUNLX1RPUC4gVGhpcyBzZWVtcwppbmRpY2F0aXZlIG9mIGEgZGlmZmVy
ZW50IHByb2JsZW0uIFdoaWxlIHRoaXMgbWF5IGZpeCB0aGUgaXNzdWUsIGl0CnNob3VsZCBiZSB2
YWxpZCBmb3IgVEFTS19TSVpFIHRvIGJlIGxlc3MgdGhhbiBTVEFDS19UT1AuCgotIENoYXJsaWUK
Cj4gCj4gPgo+ID4gVGhlbiB3aHkgbm90Ogo+ID4gI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ICNk
ZWZpbmUgVEFTS19TSVpFXzMyICAgIFNUQUNLX1RPUAo+IFllcywgaXQncyB0aGUgc29sdXRpb24g
dGhhdCBJIHRoaW5rIGF0IGZpcnN0LiBCdXQgSSBkaWRuJ3QgZmluZCBhbnkKPiBwcm9ibGVtIHdp
dGggMHg3ZmZmZjAwMCB+IDB4ODAwMDAwMDAsIGFuZCB0aGVuIEkgcmVtb3ZlZCB0aGlzIGdhcCB0
bwo+IHVuaWZ5IGl0IHdpdGggU3YzOSBhbmQgU3Y0OC4KPiAKPiA+Cj4gPiBXaXRoIHNvbWUgY29t
bWVudHMgZXhwbGFpbmluZyB3aHkgdGhlcmUgaXMgbm8gbmVlZCB0byByZXNlcnZlIGEgUEFHRV9T
SVpFCj4gPiBpbiB0aGUgVEFTS19TSVpFXzMyLgo+IEF0IGZpcnN0LCBJIHdhbnRlZCB0byBwdXQg
YSBpbnZhbGlkIHBhZ2UgYmV0d2VlbiB0aGUgdXNlciAmIGtlcm5lbAo+IHNwYWNlLCBidXQgaXQg
c2VlbXMgdXNlbGVzcy4KPiAKPiA+Cj4gPiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KPiA+Cj4gPiBU
aGFua3MhCj4gPiBMZW8KPiA+Cj4gPiA+Cj4gPiA+IEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFn
ZSAoaW5pdG1lbSkgbWVtb3J5OiAyMjM2Swo+ID4gPiBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHBy
b2Nlc3MKPiA+ID4gU3RhcnRpbmcgaW5pdDogL3NiaW4vaW5pdCBleGlzdHMgYnV0IGNvdWxkbid0
IGV4ZWN1dGUgaXQgKGVycm9yIC0xNCkKPiA+ID4gUnVuIC9ldGMvaW5pdCBhcyBpbml0IHByb2Nl
c3MKPiA+ID4gLi4uCj4gPiA+Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+
IEZpeGVzOiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmljdCBhZGRyZXNzIHNwYWNl
IGZvciBzdjM5LHN2NDgsc3Y1NyIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gaW5kZXgg
YWIwMDIzNWIwMThmLi43NGZmYjIxNzhmNTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gPiA+IEBAIC04ODEsNyArODgxLDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBw
dGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gPiA+ICAjZGVmaW5lIFRBU0tfU0la
RV9NSU4gICAgICAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4KPiA+
ID4gICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+IC0jZGVmaW5lIFRBU0tfU0laRV8zMiAoX0FD
KDB4ODAwMDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKPiA+ID4gKyNkZWZpbmUgVEFTS19TSVpFXzMy
IChfQUMoMHg4MDAwMDAwMCwgVUwpKQo+ID4KPiA+Cj4gPgo+ID4KPiA+ID4gICNkZWZpbmUgVEFT
S19TSVpFICAgICh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgPyBcCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ID4gPiAgI2Vsc2UK
PiA+ID4gLS0KPiA+ID4gMi40MC4xCj4gPiA+Cj4gPgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJk
cwo+ICBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
