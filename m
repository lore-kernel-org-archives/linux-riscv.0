Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC9C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:23:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C446117A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C446117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o5y/DUO03WzRls987eREZPF6GG5xK2MR+2B3CnE8u3w=; b=BP5Y5o5q/1/tGrkfdUI9XFHEH
	niSYT3iCj7iWZgw644Q9NcTW+igeoLeovVBRPIBPRnCFoubRCzU87xUA8aaEPtAKFpfDcWL11GKgB
	TH4uJknKYzjysSZM99ttVwqXymGek/3jmdkj1idEdOjX1dHTNjmisrrmlrZLvhPttSqc1AdUaaeTQ
	Kd3aAbuH0QYoLfNZ2YPvzf6adbpXTCNjWNfI3i00Y+Bv1Mcpo96248W4rEUy7SlILxxr7YXH3DrPM
	B5jMgkmSj5txEqEfPGu0xwppkxmLXcYmHR1s9RABfVM6oa9/ouIVjTv1kS/qN52V/GyS7X2tUExbw
	uxsplMZVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTgz0-001qzt-Mf; Tue, 06 Apr 2021 08:22:46 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTgyr-001qyW-K2
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:22:39 +0000
Received: by mail-vk1-f177.google.com with SMTP id h136so3004603vka.7
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 01:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Az9dSdeZDXjGuSIhOGjrTFbuKwYYbifVIyBF0wPvnYY=;
 b=Z+EX6NbT8QDYzYiG5A+ZDkC23PMBb/0ATguH7EqLdcDfcB1s+eK9JPmDq+xQeMCjtD
 tJ5jWKvkBneDJBey0H4yELKk58NOqzfxcknK4tfkEO1tXM5dpe6ZiMpThV3x4KQI6TLj
 wf+DqMdl+iYBhW7ByqQZSygw8WmaGiyzV24DiyXdmI2KmAs7iZ1vc46uksoC5KYLQ03k
 wJSH9yNID2vj5KvGiOkKOyU1FdjcQcDp1fI3S0zIH+jTBdyluGWfmw/c6etqsP8tJnr6
 jpGqbZUSDDqE8eApJRkBgA2MPX3QzfIBuOGCbwmJXlvK2/Pj9cOSa69nWRV2wApsPHqu
 RYSA==
X-Gm-Message-State: AOAM5308i2neu2Ry7xlU1t8L2c81ijrlVS0u+Z0uALcqcg4EUqGlaheq
 9pbyN2vQLvC8DbwLONFaj8miXEd51XCuMDEDXu4=
X-Google-Smtp-Source: ABdhPJwInFUg0m12roEg3q500Awfy5x1BUAIQ5ytLX95F4UD20kjXf8E8UTOC6DOaP6o5rKGvUMbHiVNmrl577DGpks=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr16284892vkl.5.1617697355921;
 Tue, 06 Apr 2021 01:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-4-mick@ics.forth.gr>
 <CAMuHMdWi+wo0+PCR6B1wyXVesG-kL9NQt8XFBuWhZ3SdVUaLZg@mail.gmail.com>
 <5a09d1f0ded4581c9e7458f546db9329@mailhost.ics.forth.gr>
In-Reply-To: <5a09d1f0ded4581c9e7458f546db9329@mailhost.ics.forth.gr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Apr 2021 10:22:24 +0200
Message-ID: <CAMuHMdWnRFuzSzSMCgBtNwxtq+itQ+iuX+i7nu5RD1E1W1FW-g@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Improve init_resources
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_092237_740120_1B9EE819 
X-CRM114-Status: GOOD (  33.19  )
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

SGkgTmljaywKCk9uIFR1ZSwgQXByIDYsIDIwMjEgYXQgMTA6MTEgQU0gTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4gSGVsbG8gR2VlcnQsCj4gzqPPhM65z4IgMjAy
MS0wNC0wNiAxMDoxOSwgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jOtToKPiA+IE9uIE1v
biwgQXByIDUsIDIwMjEgYXQgMTA6NTcgQU0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0
aC5ncj4KPiA+IHdyb3RlOgo+ID4+ICogS2VybmVsIHJlZ2lvbiBpcyBhbHdheXMgcHJlc2VudCBh
bmQgd2Uga25vdyB3aGVyZSBpdCBpcywgbm8KPiA+PiBuZWVkIHRvIGxvb2sgZm9yIGl0IGluc2lk
ZSB0aGUgbG9vcCwganVzdCBpZ25vcmUgaXQgbGlrZSB0aGUKPiA+PiByZXN0IG9mIHRoZSByZXNl
cnZlZCByZWdpb25zIHdpdGhpbiBzeXN0ZW0ncyBtZW1vcnkuCj4gPj4KPiA+PiAqIERvbid0IGNh
bGwgbWVtYmxvY2tfZnJlZSBpbnNpZGUgdGhlIGxvb3AsIGlmIGNhbGxlZCBpdCdsbCBzcGxpdAo+
ID4+IHRoZSByZWdpb24gb2YgcHJlLWFsbG9jYXRlZCByZXNvdXJjZXMgaW4gdHdvIHBhcnRzLCBt
ZXNzaW5nIHRoaW5ncwo+ID4+IHVwLCBqdXN0IHJlLXVzZSB0aGUgcHJldmlvdXMgcHJlLWFsbG9j
YXRlZCByZXNvdXJjZSBhbmQgZnJlZSBhbnkKPiA+PiB1bnVzZWQgcmVzb3VyY2VzIGFmdGVyIGJv
dGggbG9vcHMgZmluaXNoLgo+ID4+Cj4gPj4gKiBtZW1ibG9ja19hbGxvYyBtYXkgYWRkIGEgcmVn
aW9uIHdoZW4gY2FsbGVkLCBzbyBpbmNyZWFzZSB0aGUKPiA+PiBudW1iZXIgb2YgcHJlLWFsbG9j
YXRlZCByZWdpb25zIGJ5IG9uZSB0byBiZSBvbiB0aGUgc2FmZSBzaWRlCj4gPj4gKHJlcG9ydGVk
IGFuZCBwYXRjaGVkIGJ5IEdlZXJ0IFV5dHRlcmhvZXZlbikKPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gPgo+ID4gV2hl
cmUgZG9lcyB0aGlzIFNvQiBjb21lIGZyb20/Cj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
S29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4gPgo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPgo+
ID4+IEBAIC0xMjksNTMgKzEzOSw0MiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJj
ZXModm9pZCkKPiA+PiAgICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzID0gTlVMTDsKPiA+PiAg
ICAgICAgIHN0cnVjdCByZXNvdXJjZSAqbWVtX3JlcyA9IE5VTEw7Cj4gPj4gICAgICAgICBzaXpl
X3QgbWVtX3Jlc19zeiA9IDA7Cj4gPj4gLSAgICAgICBpbnQgcmV0ID0gMCwgaSA9IDA7Cj4gPj4g
LQo+ID4+IC0gICAgICAgY29kZV9yZXMuc3RhcnQgPSBfX3BhX3N5bWJvbChfdGV4dCk7Cj4gPj4g
LSAgICAgICBjb2RlX3Jlcy5lbmQgPSBfX3BhX3N5bWJvbChfZXRleHQpIC0gMTsKPiA+PiAtICAg
ICAgIGNvZGVfcmVzLmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1fUkFNIHwgSU9SRVNPVVJDRV9C
VVNZOwo+ID4+IC0KPiA+PiAtICAgICAgIHJvZGF0YV9yZXMuc3RhcnQgPSBfX3BhX3N5bWJvbChf
X3N0YXJ0X3JvZGF0YSk7Cj4gPj4gLSAgICAgICByb2RhdGFfcmVzLmVuZCA9IF9fcGFfc3ltYm9s
KF9fZW5kX3JvZGF0YSkgLSAxOwo+ID4+IC0gICAgICAgcm9kYXRhX3Jlcy5mbGFncyA9IElPUkVT
T1VSQ0VfU1lTVEVNX1JBTSB8IElPUkVTT1VSQ0VfQlVTWTsKPiA+PiAtCj4gPj4gLSAgICAgICBk
YXRhX3Jlcy5zdGFydCA9IF9fcGFfc3ltYm9sKF9kYXRhKTsKPiA+PiAtICAgICAgIGRhdGFfcmVz
LmVuZCA9IF9fcGFfc3ltYm9sKF9lZGF0YSkgLSAxOwo+ID4+IC0gICAgICAgZGF0YV9yZXMuZmxh
Z3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4gPj4gKyAgICAg
ICBpbnQgbnVtX3Jlc291cmNlcyA9IDAsIHJlc19pZHggPSAwOwo+ID4+ICsgICAgICAgaW50IHJl
dCA9IDA7Cj4gPj4KPiA+PiAtICAgICAgIGJzc19yZXMuc3RhcnQgPSBfX3BhX3N5bWJvbChfX2Jz
c19zdGFydCk7Cj4gPj4gLSAgICAgICBic3NfcmVzLmVuZCA9IF9fcGFfc3ltYm9sKF9fYnNzX3N0
b3ApIC0gMTsKPiA+PiAtICAgICAgIGJzc19yZXMuZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9S
QU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4gPj4gKyAgICAgICAvKiArIDEgYXMgbWVtYmxvY2tfYWxs
b2MoKSBtaWdodCBpbmNyZWFzZQo+ID4+IG1lbWJsb2NrLnJlc2VydmVkLmNudCAqLwo+ID4+ICsg
ICAgICAgbnVtX3Jlc291cmNlcyA9IG1lbWJsb2NrLm1lbW9yeS5jbnQgKyBtZW1ibG9jay5yZXNl
cnZlZC5jbnQgKwo+ID4+IDE7Cj4gPj4gKyAgICAgICByZXNfaWR4ID0gbnVtX3Jlc291cmNlcyAt
IDE7Cj4gPj4KPiA+PiAtICAgICAgIG1lbV9yZXNfc3ogPSAobWVtYmxvY2subWVtb3J5LmNudCAr
IG1lbWJsb2NrLnJlc2VydmVkLmNudCkgKgo+ID4+IHNpemVvZigqbWVtX3Jlcyk7Cj4gPgo+ID4g
T2gsIHlvdSBpbmNvcnBvcmF0ZWQgbXkgY29tbWl0IGNlOTg5ZjE0NzJhZTM1MGUgKCJSSVNDLVY6
IEZpeAo+ID4gb3V0LW9mLWJvdW5kcwo+ID4gYWNjZXNzZXMgaW4gaW5pdF9yZXNvdXJjZXMoKSIp
IChmcm9tIHY1LjEyLXJjNCkgaW50byB5b3VyIHBhdGNoLgo+ID4gV2h5PyBUaGlzIG1lYW5zIHlv
dXIgcGF0Y2ggZG9lcyBub3QgYXBwbHkgYWdhaW5zdCB1cHN0cmVhbS4KPiA+Cj4KPiBTb3JyeSBp
ZiB0aGlzIGxvb2tzIGF3a3dhcmQsIEknbSB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IG5ldyBm
ZWF0dXJlcwo+IGdvIG9uIGZvci1uZXh0IGluc3RlYWQgb2YgZml4ZXMgYW5kIHlvdXIgcGF0Y2gg
aGFzbid0IGJlZW4gbWVyZ2VkIG9uCj4gZm9yLW5leHQgeWV0LiBJIHRob3VnaHQgaXQgd291bGQg
YmUgY2xlYW5lciB0byBoYXZlIG9uZSBwYXRjaCB0byBtZXJnZQo+IGZvciBpbml0X3Jlc291cmNl
cyBpbnN0ZWFkIG9mIHR3bywgYW5kIHNpbXBsZXIgZm9yIHBlb3BsZSB0byB0ZXN0IHRoZQo+IHNl
cmllcy4gSSBjYW4gcmViYXNlIHRoaXMgb24gdG9wIG9mIGZpeGVzIGlmIHRoYXQgd29ya3MgYmV0
dGVyIGZvciB5b3UKPiBvciBQYWxtZXIuCgpJZGVhbGx5IHRoZSBmaXhlcyBicmFuY2ggaXMgcGFy
dCBvZiB0aGUgbmV4dCBicmFuY2guICBUaGF0IGFsc28gaGVscHMKdG8gYXZvaWQgb3RoZXIgcGVv
cGxlIGhhdmluZyB0byBmaXggY29uZmxpY3RzIHdoZW4gbWVyZ2luZyBib3RoLgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
