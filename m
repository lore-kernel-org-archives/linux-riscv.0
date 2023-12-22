Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA94BC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YetF+wuoZvrGZY/pZfBLSEZR1jDjogogOmNxaWB11s=; b=kcgjp4D6SdMLam
	eWVtzHyFwesvxnz+r+3I5FkzHKT0lmYTkQU3vn21AiM6vglQEENf19cshhIL/35ljtqWqe0ddiUYa
	r2FTXYuOz5DMTZxvlp5O/2NL4+OQZ/zPCG6CeVa/IJeJBU81YtqC0M5FYoSqvsW5DFMR5za/8olMf
	dz2+iKLeqpFxpT2fJzuT96mvQ2RuktT2Ot3I4rjhQYx6z59t4gGHK22J5FrJZLnDhxsaJO68E5hwd
	s/zvMsx0ZIKV65sdnTSHk6BTR1dN1uALfLv8433kVx+xLYN8FnK9Qj1jVdmqGEQAXaDVI2WxJTgwy
	hOaJsIBsvb/VN4wrfRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbBW-005LcV-1F;
	Fri, 22 Dec 2023 08:47:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGa2o-005B2A-0B
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Dec 2023 07:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2cOUZiHn3Mt/7vHQdUnyaUNPb2ohe9aXNXk1XgseWjw=; b=CLl/lC5OEm75BpRLTGPY5dVa9r
	g9whWVyu6yOEIlImo19q0db9eQLAb4uJp7ALsKpm+3kkRs13NQTAWlZ8tGvPMFTPUIaxNTLwXZDac
	AL49C/BkQFRHdPR9n/aqO2JZzMsQybQMpqDGRFbYi4f+0vEw6i/sgWhL6wqAzjQrihfLcukgDcpw0
	+eyzkQGndf8J6nmPbbNbGEdGrLN08qtdx7cKYIbnzE75fdPaBteN1JSqbwGskePWdHW2dUNnV+BSu
	Df42GvBJ2bYPnepLWMPHvqs07HJp+GakJJo91Hn6IxlN7dvIRECjKojz3pW1ab/FLNUPrK2Xl5jwI
	aDj6Y23A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGa2f-00FAwi-39
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6401061B6B
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 07:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1724DC433CA
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703230431;
	bh=Js9mFxTjdS4RHFZpNBXtXK6UQmUyniFDMRqPYxNV2eg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RNctBg06iYouMH4L4/MssBF3378c6afk5bZldsSRRoGlhTLtifHs32uP1W+jh5hqp
	 PHpNMllnYSSRYxfQteW3ai3iZFEseY5ykq8srZcdMbQPVNtrJZ/xRRHfFBbZ095lFb
	 JmABN870GsH9dg0bomEMIiOH/G5rDevKUnQClH5jH2T8refPqxiLBUpMoqtS3EY4tV
	 QWEyROR86b8FIFZOuiYKCCCo6o637d9YNLsn2sskt8PRPABS4sLPD7JdeZBia8M6Ks
	 GeeA88ntPVZvPAhq/E0PVeFDgyv/Gb7LGDRgSTcKhkDJmTmg90r55yeebiQhkwDqgr
	 ntE1rSaaMNcYA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5534abbc637so1816247a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:33:51 -0800 (PST)
X-Gm-Message-State: AOJu0YyyTTqEcVFpCpO35ZeV68SBGlgMOWZTHEjI0Ag5N95cnstszWYU
	urIh0T1O4z2E1W7Vu2amRd7MorB5dhxQS9s4UWY=
X-Google-Smtp-Source: AGHT+IE2yNM9a0cZI0Nm4o6zCMPlXO4o3RDUDZJLeKMQNH/z94tua866L0WRp1To+KH5fA5/N9922XwtnwbyxYIZYCo=
X-Received: by 2002:a17:906:b3a4:b0:a1d:7792:cdbe with SMTP id
 uh36-20020a170906b3a400b00a1d7792cdbemr438891ejc.146.1703230429499; Thu, 21
 Dec 2023 23:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-2-guoren@kernel.org>
 <ZYTriK9hjOFQou9Z@LeoBras> <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
 <ZYUHg3kIMYdNSOSr@ghost> <ZYUReEZWcZVv1kxP@LeoBras>
In-Reply-To: <ZYUReEZWcZVv1kxP@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 15:33:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS6MntY1sa+VqQ-hXbrGRaXOKqSY86xwe1-G1fVZHn7gQ@mail.gmail.com>
Message-ID: <CAJF2gTS6MntY1sa+VqQ-hXbrGRaXOKqSY86xwe1-G1fVZHn7gQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
To: Leonardo Bras <leobras@redhat.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com, 
	xiao.w.wang@intel.com, david@redhat.com, panqinglin2020@iscas.ac.cn, 
	rick.p.edgecombe@intel.com, willy@infradead.org, bjorn@rivosinc.com, 
	conor.dooley@microchip.com, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_073358_414565_4FCD1881 
X-CRM114-Status: GOOD (  41.67  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MzPigK9QTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDc6NTA6MjdQ
TSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMg
YXQgMTA6NTc6MTZBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+ID4gT24gRnJpLCBEZWMgMjIs
IDIwMjMgYXQgOTo1MeKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBIZWxsbyBHdW8gUmVuLAo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1
LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDY6NThBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gSW4gQ09NUEFUIG1vZGUsIHRoZSBTVEFDS19UT1AgaXMgMHg4MDAw
MDAwMCwgYnV0IHRoZSBUQVNLX1NJWkUgaXMKPiA+ID4gPiA+IDB4N2ZmZjAwMC4gV2hlbiB0aGUg
dXNlciBzdGFjayBpcyB1cG9uIDB4N2ZmZjAwMCwgaXQgd2lsbCBjYXVzZSBhIHVzZXIKPiA+ID4g
PiA+IHNlZ21lbnQgZmF1bHQuIFNvbWV0aW1lcywgaXQgd291bGQgY2F1c2UgYm9vdCBmYWlsdXJl
IHdoZW4gdGhlIHdob2xlCj4gPiA+ID4gPiByb290ZnMgaXMgcnYzMi4KPiA+ID4gPgo+ID4gPiA+
IENoZWNraW5nIGlmIEkgZ2V0IHRoZSBzY2VuYXJpbzoKPiA+ID4gPgo+ID4gPiA+IEluIHBndGFi
bGUuaDoKPiA+ID4gPiAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ID4gI2RlZmluZSBUQVNLX1NJ
WkVfNjQgICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ID4gPiA+ICNkZWZpbmUg
VEFTS19TSVpFX01JTiAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4g
Pgo+ID4gPiA+ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+ID4gI2RlZmluZSBUQVNLX1NJWkVf
MzIgICAgKF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCj4gPiA+ID4gI2RlZmluZSBU
QVNLX1NJWkUgICAgICAgKHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ID4g
PiA+ICNlbHNlCj4gPiA+ID4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+IE1lYW5pbmcgQ09ORklHX0NP
TVBBVCBpcyBvbmx5IGF2YWlsYWJsZSBpbiBDT05GSUdfNjRCSVQsIGFuZCBUQVNLX1NJWkUgaW4K
PiA+ID4gPiBjb21wYXQgbW9kZSBpcyBlaXRoZXIgVEFTS19TSVpFXzMyIG9yIFRBU0tfU0laRV82
NCBkZXBlbmRpbmcgb24gdGhlIHRocmVhZF9mbGFnLgo+ID4gPiA+Cj4gPiA+ID4gZnJvbSBwcm9j
ZXNzb3IuaDoKPiA+ID4gPiAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ID4gI2RlZmluZSBERUZB
VUxUX01BUF9XSU5ET1cgICAgICAoVUwoMSkgPDwgKE1NQVBfVkFfQklUUyAtIDEpKQo+ID4gPiA+
ICNkZWZpbmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICAgVEFTS19TSVpFXzY0Cj4gPiA+ID4gWy4u
Ll0KPiA+ID4gPiAjZGVmaW5lIFNUQUNLX1RPUCAgICAgICAgICAgICAgIERFRkFVTFRfTUFQX1dJ
TkRPVwo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiB3aGVyZToKPiA+ID4gPiAjZGVmaW5lIE1NQVBf
VkFfQklUUyAoaXNfY29tcGF0X3Rhc2soKSA/IFZBX0JJVFNfU1YzMiA6IE1NQVBfVkFfQklUU182
NCkKPiA+ID4gPiB3aXRoIE1NQVBfVkFfQklUU182NCBiZWluZyBlaXRoZXIgNDggb3IgMzcuCj4g
PiA+ID4KPiA+ID4gPiBJbiBjb21wYXQgbW9kZSwKPiA+ID4gPiBTVEFDS19UT1AgPSAxIDw8ICgz
MiAtIDEpICAgICAgIC0+IDB4ODAwMDAwMDAKPiA+ID4gPiBUQVNLX1NJWkUgPSAweDgwMDAwMDAg
LSA0ayAgICAgIC0+IDB4N2ZmZmYwMDAKPiA+ID4gPgo+ID4gPiA+IElJVUMsIHlvdXIgc3VnZ2Vz
dGlvbiBpcyB0byBtYWtlIFRBU0tfU0laRSA9IFNUQUNLX1RPUCBpbiBjb21wYXQgbW9kZSBvbmx5
Lgo+ID4gPiBZZXMsIGl0IGNhdXNlcyB0aGUgcHJvYmxlbSwgd2hpY2ggY2F1c2VzIHRoZSBib290
IHRvIGZhaWwuCj4gPgo+ID4gSSB0aGluayB3aGF0IExlb25hcmRvIGlzIGdldHRpbmcgYXQgaXMg
dGhhdCBpdCBpcyBvZGQgdGhhdCBpdCB3b3VsZAo+ID4gY2F1c2UgYm9vdCBpc3N1ZXMgaWYgVEFT
S19TSVpFIGlzIG5vdCBlcXVhbCBTVEFDS19UT1AuIFRoaXMgc2VlbXMKPiA+IGluZGljYXRpdmUg
b2YgYSBkaWZmZXJlbnQgcHJvYmxlbS4gV2hpbGUgdGhpcyBtYXkgZml4IHRoZSBpc3N1ZSwgaXQK
PiA+IHNob3VsZCBiZSB2YWxpZCBmb3IgVEFTS19TSVpFIHRvIGJlIGxlc3MgdGhhbiBTVEFDS19U
T1AuCj4gPgo+ID4gLSBDaGFybGllCj4gPgo+Cj4gVGhhdCBpcyBhbHNvIGEgZ29vZCBwb2ludCwg
YnV0IEkgYW0gbm90IHRoYXQgYWNxdWFpbnRlZCB0byB0aGlzIHRvCj4gYWN0dWFsbHkgcHJvcG9z
ZSB0aGlzLgo+Cj4gSSB3YXMgdGhpbmtpbmcgbW9yZSBvbiB0aGVzZSBxdWVzdGlvbnM6Cj4gSXMg
VEFTS19TSVpFIGFuZCBTVEFDS19UT1AgcmVsYXRlZCBzb21laG93Pwo+IElmIHNvLCB3b3VsZCBu
b3QgYmUgYmV0dGVyIHRvIGRlc2NyaWJlIG9uZSBpbiB0ZXJtcyBvZiB0aGUgb3RoZXIsIGxpa2UK
PiAjZGVmaW5lIFRBU0tfU0laRSAoU1RBQ0tfVE9QIC0gUEFHRV9TSVpFKQpUQVNLX1NJWkUgbWVh
bnMgdGhlIG1heGltdW0gdXNlciBhZGRyZXNzIHNwYWNlLCBzbyBpdCdzIHRoZSBsaW1pdGF0aW9u
CnRvIGFueSBraW5kIG9mIG1tYXAgb3Igc3RhY2sgLi4uClNvIFNUQUNLX1RPUCA8PSBUQVNLX1NJ
WkUKCkZvbGxvdyB5b3VyIGlkZWEuIFRoZSBxdWVzdGlvbiBpczoKI2RlZmluZSBUQVNLX1NJWkUg
KChVTCgxKSA8PCAoVkFfQklUUyAtIDEpKSAtIFBBR0VfU0laRSkKCkRvIHdlIG5lZWQgdG8gcmVz
ZXJ2ZSBvbmUgcGFnZSBiZXR3ZWVuIHVzZXJzcGFjZSAmIGtlcm5lbD8KCgo+Cj4gT3IgdGhlIG90
aGVyIHdheSBhcm91bmQuCj4KPiBJIG1lYW4sIGlmIHRoZXkgaGF2ZSBhbnkgcmVsYXRpb24gaXQg
d291bGQgYmUgbXVjaCBlYXNpZXIgdG8gcmVwcmVzZW50IHRoZW0KPiB0aGF0IHdheSwgYW5kIGl0
IHdvdWxkIGF2b2lkIGhhdmluZyB0d28gbWFnaWNhbCBudW1iZXJzLgo+Cj4gVGhhbmtzIQo+IExl
bwo+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGVuIHdoeSBub3Q6Cj4gPiA+ID4gI2lmZGVmIENP
TkZJR19DT01QQVQKPiA+ID4gPiAjZGVmaW5lIFRBU0tfU0laRV8zMiAgICBTVEFDS19UT1AKPiA+
ID4gWWVzLCBpdCdzIHRoZSBzb2x1dGlvbiB0aGF0IEkgdGhpbmsgYXQgZmlyc3QuIEJ1dCBJIGRp
ZG4ndCBmaW5kIGFueQo+ID4gPiBwcm9ibGVtIHdpdGggMHg3ZmZmZjAwMCB+IDB4ODAwMDAwMDAs
IGFuZCB0aGVuIEkgcmVtb3ZlZCB0aGlzIGdhcCB0bwo+ID4gPiB1bmlmeSBpdCB3aXRoIFN2Mzkg
YW5kIFN2NDguCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBXaXRoIHNvbWUgY29tbWVudHMgZXhwbGFp
bmluZyB3aHkgdGhlcmUgaXMgbm8gbmVlZCB0byByZXNlcnZlIGEgUEFHRV9TSVpFCj4gPiA+ID4g
aW4gdGhlIFRBU0tfU0laRV8zMi4KPiA+ID4gQXQgZmlyc3QsIEkgd2FudGVkIHRvIHB1dCBhIGlu
dmFsaWQgcGFnZSBiZXR3ZWVuIHRoZSB1c2VyICYga2VybmVsCj4gPiA+IHNwYWNlLCBidXQgaXQg
c2VlbXMgdXNlbGVzcy4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IERvZXMgdGhhdCBtYWtlIHNlbnNl
Pwo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+IExlbwo+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDIy
MzZLCj4gPiA+ID4gPiBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+ID4gPiA+IFN0
YXJ0aW5nIGluaXQ6IC9zYmluL2luaXQgZXhpc3RzIGJ1dCBjb3VsZG4ndCBleGVjdXRlIGl0IChl
cnJvciAtMTQpCj4gPiA+ID4gPiBSdW4gL2V0Yy9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4gPiA+
ID4gLi4uCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+
ID4gPiA+IEZpeGVzOiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmljdCBhZGRyZXNz
IHNwYWNlIGZvciBzdjM5LHN2NDgsc3Y1NyIpCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMiArLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ID4gPiBpbmRleCBhYjAwMjM1YjAxOGYuLjc0ZmZi
MjE3OGY1NCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ID4gPiA+ID4gQEAgLTg4MSw3ICs4ODEsNyBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9zd3Bf
Y2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKPiA+ID4gPiA+ICAjZGVmaW5lIFRBU0tfU0laRV9N
SU4gICAgICAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4gPiA+Cj4g
PiA+ID4gPiAgI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ID4gPiA+IC0jZGVmaW5lIFRBU0tfU0la
RV8zMiAoX0FDKDB4ODAwMDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKPiA+ID4gPiA+ICsjZGVmaW5l
IFRBU0tfU0laRV8zMiAoX0FDKDB4ODAwMDAwMDAsIFVMKSkKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+ID4gICNkZWZpbmUgVEFTS19TSVpFICAgICh0ZXN0X3RocmVhZF9m
bGFnKFRJRl8zMkJJVCkgPyBcCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIFRBU0tf
U0laRV8zMiA6IFRBU0tfU0laRV82NCkKPiA+ID4gPiA+ICAjZWxzZQo+ID4gPiA+ID4gLS0KPiA+
ID4gPiA+IDIuNDAuMQo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiAtLQo+ID4g
PiBCZXN0IFJlZ2FyZHMKPiA+ID4gIEd1byBSZW4KPiA+Cj4KCgotLQpCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
