Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94267C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofewPGy5ay85hAVPeurKTeEEDO7czGj9ouY99wkc++0=; b=O0DhJw/e3HK6eK
	3/4fILDB+xuaIjq9fwFuMl/nELJBgBwpsyRbocZOziZxl6+/mSjWqw+73av5vZb4V4JQ9O9hayXjZ
	fm+57ja5uabE2VDcBWvS5SXxWjzD98WAR6T1NRLyPuP/gryy6vPrge6HkScEgk/srqzvl12vtN7jv
	KeMDoTMWvNqHYWdrURNgbDClVY6N/lFwO/cL2xrijdNiHmiNSiC3u8NKOvfa0kSeKLc82hSpyfqfF
	xSf+rJhmJAGIBE55VuwIpOF7PGGY8C5N3xsXeH5/d7cPjTtttbbREeqBEeFwXQ9Gp9Aoczf2NcG7q
	Ej6iGsyWWtj2Vxs6CBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVjG-004iG9-0f;
	Fri, 22 Dec 2023 02:57:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVjC-004iEn-1A
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 02:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49E9ACE20F7
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 02:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA773C43397
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 02:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703213849;
	bh=B7WoB0gREyq2eeosBDTUvV5rdLVfhJVD/gu6y94sIZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TU5kvvyY9FjchZxkY2Up3GEEdfwcnibMZQYJjo1X/r0stFqxzMjMypKJkGZtZwNwI
	 SPEWkk6GfFcQZ/HWjmGdBIo2WmVuAujlmtr+R47w/zBXGTehIF3vOXPB0JUNi/GFvu
	 pOTyJqU8/S6JmiufabOiPHux09JctA0Lhe5X9wUMON8NL0916TSmeTX38VySlIyh+V
	 /pABlywq41C/J4uJvgIlcUFvgWAYdeHHfpIZAfEfYDf3nObym4Bposr0tOEq07v/1L
	 0ROPnXnaqmlr+J1nIvkEqUdLyq0+7SuMw/7J+n/uGuMa933m2fnSc3wcFhjO0jxGGI
	 IRUMPugAABjlg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a236d77dceeso174044566b.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 18:57:29 -0800 (PST)
X-Gm-Message-State: AOJu0YyaULyyUEMUza+0hO5J+NfGfUL0Ves2w4L7s68CExk7VZOYMmSv
	upQOAhRzsPsByMrhUNM7mIMSFfwOSFKxmlzUEb0=
X-Google-Smtp-Source: AGHT+IEtKuQYt0eKcYcGXNsbYd6L6zfQChg70xnlZIIepptITPMCZeUaD/4I8okkksMp3jbxyzTgLyGXO2AURgMebyg=
X-Received: by 2002:a17:906:af93:b0:a26:86d8:ff54 with SMTP id
 mj19-20020a170906af9300b00a2686d8ff54mr275692ejb.5.1703213848210; Thu, 21 Dec
 2023 18:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-2-guoren@kernel.org>
 <ZYTriK9hjOFQou9Z@LeoBras>
In-Reply-To: <ZYTriK9hjOFQou9Z@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 10:57:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
Message-ID: <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	david@redhat.com, panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, 
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_185734_860491_7D719C79 
X-CRM114-Status: GOOD (  27.38  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgOTo1MeKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBHdW8gUmVuLAo+Cj4gT24gVGh1LCBEZWMgMjEs
IDIwMjMgYXQgMTA6NDY6NThBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBG
cm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gSW4gQ09NUEFU
IG1vZGUsIHRoZSBTVEFDS19UT1AgaXMgMHg4MDAwMDAwMCwgYnV0IHRoZSBUQVNLX1NJWkUgaXMK
PiA+IDB4N2ZmZjAwMC4gV2hlbiB0aGUgdXNlciBzdGFjayBpcyB1cG9uIDB4N2ZmZjAwMCwgaXQg
d2lsbCBjYXVzZSBhIHVzZXIKPiA+IHNlZ21lbnQgZmF1bHQuIFNvbWV0aW1lcywgaXQgd291bGQg
Y2F1c2UgYm9vdCBmYWlsdXJlIHdoZW4gdGhlIHdob2xlCj4gPiByb290ZnMgaXMgcnYzMi4KPgo+
IENoZWNraW5nIGlmIEkgZ2V0IHRoZSBzY2VuYXJpbzoKPgo+IEluIHBndGFibGUuaDoKPiAjaWZk
ZWYgQ09ORklHXzY0QklUCj4gI2RlZmluZSBUQVNLX1NJWkVfNjQgICAgKFBHRElSX1NJWkUgKiBQ
VFJTX1BFUl9QR0QgLyAyKQo+ICNkZWZpbmUgVEFTS19TSVpFX01JTiAgIChQR0RJUl9TSVpFX0wz
ICogUFRSU19QRVJfUEdEIC8gMikKPgo+ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gI2RlZmluZSBU
QVNLX1NJWkVfMzIgICAgKF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCj4gI2RlZmlu
ZSBUQVNLX1NJWkUgICAgICAgKHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ICNlbHNl
Cj4gWy4uLl0KPgo+IE1lYW5pbmcgQ09ORklHX0NPTVBBVCBpcyBvbmx5IGF2YWlsYWJsZSBpbiBD
T05GSUdfNjRCSVQsIGFuZCBUQVNLX1NJWkUgaW4KPiBjb21wYXQgbW9kZSBpcyBlaXRoZXIgVEFT
S19TSVpFXzMyIG9yIFRBU0tfU0laRV82NCBkZXBlbmRpbmcgb24gdGhlIHRocmVhZF9mbGFnLgo+
Cj4gZnJvbSBwcm9jZXNzb3IuaDoKPiAjaWZkZWYgQ09ORklHXzY0QklUCj4gI2RlZmluZSBERUZB
VUxUX01BUF9XSU5ET1cgICAgICAoVUwoMSkgPDwgKE1NQVBfVkFfQklUUyAtIDEpKQo+ICNkZWZp
bmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICAgVEFTS19TSVpFXzY0Cj4gWy4uLl0KPiAjZGVmaW5l
IFNUQUNLX1RPUCAgICAgICAgICAgICAgIERFRkFVTFRfTUFQX1dJTkRPVwo+Cj4KPiB3aGVyZToK
PiAjZGVmaW5lIE1NQVBfVkFfQklUUyAoaXNfY29tcGF0X3Rhc2soKSA/IFZBX0JJVFNfU1YzMiA6
IE1NQVBfVkFfQklUU182NCkKPiB3aXRoIE1NQVBfVkFfQklUU182NCBiZWluZyBlaXRoZXIgNDgg
b3IgMzcuCj4KPiBJbiBjb21wYXQgbW9kZSwKPiBTVEFDS19UT1AgPSAxIDw8ICgzMiAtIDEpICAg
ICAgIC0+IDB4ODAwMDAwMDAKPiBUQVNLX1NJWkUgPSAweDgwMDAwMDAgLSA0ayAgICAgIC0+IDB4
N2ZmZmYwMDAKPgo+IElJVUMsIHlvdXIgc3VnZ2VzdGlvbiBpcyB0byBtYWtlIFRBU0tfU0laRSA9
IFNUQUNLX1RPUCBpbiBjb21wYXQgbW9kZSBvbmx5LgpZZXMsIGl0IGNhdXNlcyB0aGUgcHJvYmxl
bSwgd2hpY2ggY2F1c2VzIHRoZSBib290IHRvIGZhaWwuCgo+Cj4gVGhlbiB3aHkgbm90Ogo+ICNp
ZmRlZiBDT05GSUdfQ09NUEFUCj4gI2RlZmluZSBUQVNLX1NJWkVfMzIgICAgU1RBQ0tfVE9QClll
cywgaXQncyB0aGUgc29sdXRpb24gdGhhdCBJIHRoaW5rIGF0IGZpcnN0LiBCdXQgSSBkaWRuJ3Qg
ZmluZCBhbnkKcHJvYmxlbSB3aXRoIDB4N2ZmZmYwMDAgfiAweDgwMDAwMDAwLCBhbmQgdGhlbiBJ
IHJlbW92ZWQgdGhpcyBnYXAgdG8KdW5pZnkgaXQgd2l0aCBTdjM5IGFuZCBTdjQ4LgoKPgo+IFdp
dGggc29tZSBjb21tZW50cyBleHBsYWluaW5nIHdoeSB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc2Vy
dmUgYSBQQUdFX1NJWkUKPiBpbiB0aGUgVEFTS19TSVpFXzMyLgpBdCBmaXJzdCwgSSB3YW50ZWQg
dG8gcHV0IGEgaW52YWxpZCBwYWdlIGJldHdlZW4gdGhlIHVzZXIgJiBrZXJuZWwKc3BhY2UsIGJ1
dCBpdCBzZWVtcyB1c2VsZXNzLgoKPgo+IERvZXMgdGhhdCBtYWtlIHNlbnNlPwo+Cj4gVGhhbmtz
IQo+IExlbwo+Cj4gPgo+ID4gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdlIChpbml0bWVtKSBt
ZW1vcnk6IDIyMzZLCj4gPiBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+IFN0YXJ0
aW5nIGluaXQ6IC9zYmluL2luaXQgZXhpc3RzIGJ1dCBjb3VsZG4ndCBleGVjdXRlIGl0IChlcnJv
ciAtMTQpCj4gPiBSdW4gL2V0Yy9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4gLi4uCj4gPgo+ID4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IEZpeGVzOiBhZGQyY2M2YjY1MTUgKCJSSVND
LVY6IG1tOiBSZXN0cmljdCBhZGRyZXNzIHNwYWNlIGZvciBzdjM5LHN2NDgsc3Y1NyIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4gPiBpbmRleCBhYjAwMjM1YjAxOGYuLjc0ZmZiMjE3OGY1NCAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gQEAgLTg4MSw3ICs4ODEsNyBAQCBzdGF0aWMgaW5saW5l
IHB0ZV90IHB0ZV9zd3BfY2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKPiA+ICAjZGVmaW5lIFRB
U0tfU0laRV9NSU4gICAgICAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+
Cj4gPiAgI2lmZGVmIENPTkZJR19DT01QQVQKPiA+IC0jZGVmaW5lIFRBU0tfU0laRV8zMiAoX0FD
KDB4ODAwMDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKPiA+ICsjZGVmaW5lIFRBU0tfU0laRV8zMiAo
X0FDKDB4ODAwMDAwMDAsIFVMKSkKPgo+Cj4KPgo+ID4gICNkZWZpbmUgVEFTS19TSVpFICAgICh0
ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgPyBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
IFRBU0tfU0laRV8zMiA6IFRBU0tfU0laRV82NCkKPiA+ICAjZWxzZQo+ID4gLS0KPiA+IDIuNDAu
MQo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
