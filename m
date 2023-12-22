Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136DC46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIVsGfVIFMa9OVDxubZQSSfsQunB5Ur3rTAdb8+5xcE=; b=QobW/K54QLz04t
	pt39cb6KJO271F09HP6SZZ61g0BFJ61TefieIaW7JTBujz5+UQF8rtT6nSG6QOEwSrDXAkz/tCDu2
	YjnkfKjt+ujApt0+yjK70/S99NOiKg2ZR43Jm+ovIrB/JZyF1h3MF81hgN/eR6BHUrU0cI6C6AK8u
	x3OofbEaHigIxeKsofmNrMEWAcp6vfr8XEElpHOr43IyCXz20Q0QSN6B4T2TdCcjHqHMZdW1NAHSn
	oNDTrIjPvzzsYweGLAuSVM+DOrDNDjFu597WnfjKpQ8rAf/Ys6pJA+BrP/CVIDEjxgDSpXteufvqa
	RHd7H4VP746lFjF3YouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXDv-004qBv-1h;
	Fri, 22 Dec 2023 04:33:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXDs-004qB3-04
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703219595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dnfBu/fEgkmN9hsRGrX3Qh2OWxZhe8THfvYViPvNZA=;
	b=VNCGXFZFyZe3dz2Yzh3CYpBFLT+PTfzlgaW8f+PJ+kCqE5f8QtEYMVk09wfjcukL34wtsM
	LY72RkgqH6ln6Tdf9B2w2M5ePwna6t+Ht3E+KqAyfQ8cB9taKbxRU/5hmxNhCIxnPuj7IQ
	BJE7pKHaAxBaTB3c5ildvNxB90EnkVE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-ReV5unLyPWiVFAL9ntaxiA-1; Thu, 21 Dec 2023 23:33:13 -0500
X-MC-Unique: ReV5unLyPWiVFAL9ntaxiA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d33751a322so8513445ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703219592; x=1703824392;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dnfBu/fEgkmN9hsRGrX3Qh2OWxZhe8THfvYViPvNZA=;
        b=hM0drgEzVmjyBlDbBxv3Kv0rz+8gFYZBRW/ACLlXbZN47dXjm1hVJy5A7dWmvYXqLH
         InU27OXn4VeUWlkmLAcW3has4W3bMC0sdkEk5FLrIwoff6DbMeUwDX2tOYCLpWTh0K6D
         L4dT4XQ1wCMdlLnE/Cn7g1/oGxSQzEoZE0/jiV7RoOpVGDrpwAHd3oE4aBGKVMHIQAy/
         i9AKL2P+HH4Q/8ku8iYJ6ldVZ4Rsf86pBiMlAnka1MWdYGcnOHVZjdp+fgSB3/UTO3lN
         6OF/iFbgPP/zG9t4HQzVwKtmFo+i+WbDIdSUCBFFfpbM4/3O1XP0VcRkGVJAtoWynilN
         LosA==
X-Gm-Message-State: AOJu0YxC84b2prXJnD89cBNhJyz1xMFAQnlQKWxrP5iRvKItrtq5Q9Fj
	JkMrHcNwa5U8SYHey0mBvinR6URLryxTNAynAHXuYOIOPa5I3xmRtECBp2J6SD7FJHskCWf1F+J
	C4PuAr1NEgrrgHtnEkdIjnHmhGpATMCEB/2Kt
X-Received: by 2002:a17:903:2602:b0:1d3:e573:20ec with SMTP id jd2-20020a170903260200b001d3e57320ecmr390688plb.90.1703219592219;
        Thu, 21 Dec 2023 20:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDVSGCaLDAAox1pQj6Gf9KxzIRJQl9Z4MY1pWe1L18FSa4/g4aAgyj/u/pm0pPnmWI+7vOLQ==
X-Received: by 2002:a17:903:2602:b0:1d3:e573:20ec with SMTP id jd2-20020a170903260200b001d3e57320ecmr390684plb.90.1703219591881;
        Thu, 21 Dec 2023 20:33:11 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001d3f79f61fdsm2445115pld.211.2023.12.21.20.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 20:33:11 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
Date: Fri, 22 Dec 2023 01:32:56 -0300
Message-ID: <ZYUReEZWcZVv1kxP@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZYUHg3kIMYdNSOSr@ghost>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-2-guoren@kernel.org> <ZYTriK9hjOFQou9Z@LeoBras> <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com> <ZYUHg3kIMYdNSOSr@ghost>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_203320_129494_CBAD7145 
X-CRM114-Status: GOOD (  40.11  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDc6NTA6MjdQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDEwOjU3OjE2QU0gKzA4MDAsIEd1byBS
ZW4gd3JvdGU6Cj4gPiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCA5OjUx4oCvQU0gTGVvbmFyZG8g
QnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGVsbG8gR3VvIFJl
biwKPiA+ID4KPiA+ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDY6NThBTSAtMDUwMCwg
Z3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4gPiA+ID4gSW4gQ09NUEFUIG1vZGUsIHRoZSBTVEFD
S19UT1AgaXMgMHg4MDAwMDAwMCwgYnV0IHRoZSBUQVNLX1NJWkUgaXMKPiA+ID4gPiAweDdmZmYw
MDAuIFdoZW4gdGhlIHVzZXIgc3RhY2sgaXMgdXBvbiAweDdmZmYwMDAsIGl0IHdpbGwgY2F1c2Ug
YSB1c2VyCj4gPiA+ID4gc2VnbWVudCBmYXVsdC4gU29tZXRpbWVzLCBpdCB3b3VsZCBjYXVzZSBi
b290IGZhaWx1cmUgd2hlbiB0aGUgd2hvbGUKPiA+ID4gPiByb290ZnMgaXMgcnYzMi4KPiA+ID4K
PiA+ID4gQ2hlY2tpbmcgaWYgSSBnZXQgdGhlIHNjZW5hcmlvOgo+ID4gPgo+ID4gPiBJbiBwZ3Rh
YmxlLmg6Cj4gPiA+ICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ID4gI2RlZmluZSBUQVNLX1NJWkVf
NjQgICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ID4gPiAjZGVmaW5lIFRBU0tf
U0laRV9NSU4gICAoUEdESVJfU0laRV9MMyAqIFBUUlNfUEVSX1BHRCAvIDIpCj4gPiA+Cj4gPiA+
ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+ICNkZWZpbmUgVEFTS19TSVpFXzMyICAgIChfQUMo
MHg4MDAwMDAwMCwgVUwpIC0gUEFHRV9TSVpFKQo+ID4gPiAjZGVmaW5lIFRBU0tfU0laRSAgICAg
ICAodGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ID4gPiAjZWxzZQo+ID4gPiBb
Li4uXQo+ID4gPgo+ID4gPiBNZWFuaW5nIENPTkZJR19DT01QQVQgaXMgb25seSBhdmFpbGFibGUg
aW4gQ09ORklHXzY0QklULCBhbmQgVEFTS19TSVpFIGluCj4gPiA+IGNvbXBhdCBtb2RlIGlzIGVp
dGhlciBUQVNLX1NJWkVfMzIgb3IgVEFTS19TSVpFXzY0IGRlcGVuZGluZyBvbiB0aGUgdGhyZWFk
X2ZsYWcuCj4gPiA+Cj4gPiA+IGZyb20gcHJvY2Vzc29yLmg6Cj4gPiA+ICNpZmRlZiBDT05GSUdf
NjRCSVQKPiA+ID4gI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAgICAoVUwoMSkgPDwgKE1N
QVBfVkFfQklUUyAtIDEpKQo+ID4gPiAjZGVmaW5lIFNUQUNLX1RPUF9NQVggICAgICAgICAgIFRB
U0tfU0laRV82NAo+ID4gPiBbLi4uXQo+ID4gPiAjZGVmaW5lIFNUQUNLX1RPUCAgICAgICAgICAg
ICAgIERFRkFVTFRfTUFQX1dJTkRPVwo+ID4gPgo+ID4gPgo+ID4gPiB3aGVyZToKPiA+ID4gI2Rl
ZmluZSBNTUFQX1ZBX0JJVFMgKGlzX2NvbXBhdF90YXNrKCkgPyBWQV9CSVRTX1NWMzIgOiBNTUFQ
X1ZBX0JJVFNfNjQpCj4gPiA+IHdpdGggTU1BUF9WQV9CSVRTXzY0IGJlaW5nIGVpdGhlciA0OCBv
ciAzNy4KPiA+ID4KPiA+ID4gSW4gY29tcGF0IG1vZGUsCj4gPiA+IFNUQUNLX1RPUCA9IDEgPDwg
KDMyIC0gMSkgICAgICAgLT4gMHg4MDAwMDAwMAo+ID4gPiBUQVNLX1NJWkUgPSAweDgwMDAwMDAg
LSA0ayAgICAgIC0+IDB4N2ZmZmYwMDAKPiA+ID4KPiA+ID4gSUlVQywgeW91ciBzdWdnZXN0aW9u
IGlzIHRvIG1ha2UgVEFTS19TSVpFID0gU1RBQ0tfVE9QIGluIGNvbXBhdCBtb2RlIG9ubHkuCj4g
PiBZZXMsIGl0IGNhdXNlcyB0aGUgcHJvYmxlbSwgd2hpY2ggY2F1c2VzIHRoZSBib290IHRvIGZh
aWwuCj4gCj4gSSB0aGluayB3aGF0IExlb25hcmRvIGlzIGdldHRpbmcgYXQgaXMgdGhhdCBpdCBp
cyBvZGQgdGhhdCBpdCB3b3VsZAo+IGNhdXNlIGJvb3QgaXNzdWVzIGlmIFRBU0tfU0laRSBpcyBu
b3QgZXF1YWwgU1RBQ0tfVE9QLiBUaGlzIHNlZW1zCj4gaW5kaWNhdGl2ZSBvZiBhIGRpZmZlcmVu
dCBwcm9ibGVtLiBXaGlsZSB0aGlzIG1heSBmaXggdGhlIGlzc3VlLCBpdAo+IHNob3VsZCBiZSB2
YWxpZCBmb3IgVEFTS19TSVpFIHRvIGJlIGxlc3MgdGhhbiBTVEFDS19UT1AuCj4gCj4gLSBDaGFy
bGllCj4gCgpUaGF0IGlzIGFsc28gYSBnb29kIHBvaW50LCBidXQgSSBhbSBub3QgdGhhdCBhY3F1
YWludGVkIHRvIHRoaXMgdG8gCmFjdHVhbGx5IHByb3Bvc2UgdGhpcy4gCgpJIHdhcyB0aGlua2lu
ZyBtb3JlIG9uIHRoZXNlIHF1ZXN0aW9uczoKSXMgVEFTS19TSVpFIGFuZCBTVEFDS19UT1AgcmVs
YXRlZCBzb21laG93PwpJZiBzbywgd291bGQgbm90IGJlIGJldHRlciB0byBkZXNjcmliZSBvbmUg
aW4gdGVybXMgb2YgdGhlIG90aGVyLCBsaWtlCiNkZWZpbmUgVEFTS19TSVpFIChTVEFDS19UT1Ag
LSBQQUdFX1NJWkUpCgpPciB0aGUgb3RoZXIgd2F5IGFyb3VuZC4KCkkgbWVhbiwgaWYgdGhleSBo
YXZlIGFueSByZWxhdGlvbiBpdCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byByZXByZXNlbnQgdGhl
bSAKdGhhdCB3YXksIGFuZCBpdCB3b3VsZCBhdm9pZCBoYXZpbmcgdHdvIG1hZ2ljYWwgbnVtYmVy
cy4KClRoYW5rcyEKTGVvCgo+ID4gCj4gPiA+Cj4gPiA+IFRoZW4gd2h5IG5vdDoKPiA+ID4gI2lm
ZGVmIENPTkZJR19DT01QQVQKPiA+ID4gI2RlZmluZSBUQVNLX1NJWkVfMzIgICAgU1RBQ0tfVE9Q
Cj4gPiBZZXMsIGl0J3MgdGhlIHNvbHV0aW9uIHRoYXQgSSB0aGluayBhdCBmaXJzdC4gQnV0IEkg
ZGlkbid0IGZpbmQgYW55Cj4gPiBwcm9ibGVtIHdpdGggMHg3ZmZmZjAwMCB+IDB4ODAwMDAwMDAs
IGFuZCB0aGVuIEkgcmVtb3ZlZCB0aGlzIGdhcCB0bwo+ID4gdW5pZnkgaXQgd2l0aCBTdjM5IGFu
ZCBTdjQ4Lgo+ID4gCj4gPiA+Cj4gPiA+IFdpdGggc29tZSBjb21tZW50cyBleHBsYWluaW5nIHdo
eSB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc2VydmUgYSBQQUdFX1NJWkUKPiA+ID4gaW4gdGhlIFRB
U0tfU0laRV8zMi4KPiA+IEF0IGZpcnN0LCBJIHdhbnRlZCB0byBwdXQgYSBpbnZhbGlkIHBhZ2Ug
YmV0d2VlbiB0aGUgdXNlciAmIGtlcm5lbAo+ID4gc3BhY2UsIGJ1dCBpdCBzZWVtcyB1c2VsZXNz
Lgo+ID4gCj4gPiA+Cj4gPiA+IERvZXMgdGhhdCBtYWtlIHNlbnNlPwo+ID4gPgo+ID4gPiBUaGFu
a3MhCj4gPiA+IExlbwo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gRnJlZWluZyB1bnVzZWQga2VybmVs
IGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDIyMzZLCj4gPiA+ID4gUnVuIC9zYmluL2luaXQgYXMg
aW5pdCBwcm9jZXNzCj4gPiA+ID4gU3RhcnRpbmcgaW5pdDogL3NiaW4vaW5pdCBleGlzdHMgYnV0
IGNvdWxkbid0IGV4ZWN1dGUgaXQgKGVycm9yIC0xNCkKPiA+ID4gPiBSdW4gL2V0Yy9pbml0IGFz
IGluaXQgcHJvY2Vzcwo+ID4gPiA+IC4uLgo+ID4gPiA+Cj4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+ID4gPiBGaXhlczogYWRkMmNjNmI2NTE1ICgiUklTQy1WOiBtbTogUmVz
dHJpY3QgYWRkcmVzcyBzcGFjZSBmb3Igc3YzOSxzdjQ4LHN2NTciKQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAyICstCj4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gPiBpbmRleCBhYjAwMjM1YjAxOGYuLjc0ZmZiMjE3
OGY1NCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ID4g
QEAgLTg4MSw3ICs4ODEsNyBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9zd3BfY2xlYXJfZXhj
bHVzaXZlKHB0ZV90IHB0ZSkKPiA+ID4gPiAgI2RlZmluZSBUQVNLX1NJWkVfTUlOICAgICAgICAo
UEdESVJfU0laRV9MMyAqIFBUUlNfUEVSX1BHRCAvIDIpCj4gPiA+ID4KPiA+ID4gPiAgI2lmZGVm
IENPTkZJR19DT01QQVQKPiA+ID4gPiAtI2RlZmluZSBUQVNLX1NJWkVfMzIgKF9BQygweDgwMDAw
MDAwLCBVTCkgLSBQQUdFX1NJWkUpCj4gPiA+ID4gKyNkZWZpbmUgVEFTS19TSVpFXzMyIChfQUMo
MHg4MDAwMDAwMCwgVUwpKQo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiA+ICAjZGVmaW5l
IFRBU0tfU0laRSAgICAodGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ID4gPiA+
ICAjZWxzZQo+ID4gPiA+IC0tCj4gPiA+ID4gMi40MC4xCj4gPiA+ID4KPiA+ID4KPiA+IAo+ID4g
Cj4gPiAtLSAKPiA+IEJlc3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
