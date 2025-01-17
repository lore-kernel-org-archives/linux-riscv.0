Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB1C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZdsGS9Cd2D/Dwkq92UDUqJfPeGOZY8yaNn2mDBy5CA=; b=zoJtQecyl5juHx
	k5/MXRLpuQqKv+db5G//MH/gBuiC5roN8nvdm97NG+HS8jf4j83zntOJYC4ixSPTWx8UoLgQbi2Hr
	WedgXDUASRTre7v0laMjALJklIeHY9y8bSHYk0KtX4oXwSH3VTGNxe4NSBUMj/K7S7VwaJwynExNE
	HlXmsU1kG9DpnMYO226Y/K1aBYDUUWSckRuemrpxSXNOcGcZb8nfuPujew+TD+ici6qurlzub5qYX
	r8lcF8Lx1sByFMc+C2n9KCvtAHkwnheYcF8+6DVX0OS7nNvEVEpkJbZhivDoBvgnoZoPWBW/eNMyG
	1FuzJRc8c5pnXxUwT+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYcNV-0000000GsMt-3TVq;
	Fri, 17 Jan 2025 02:46:33 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYcNS-0000000GsMV-41IU
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 02:46:32 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-844dfe4b136so45994839f.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 18:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737081990; x=1737686790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBE352h6xTV11ZbHwFwrhAF11sH/L9EG9p9m7t9k9EA=;
        b=elIjb1CrISpP7VO7ymKwOto/SWLa1TCyA0Mhe/3EvndHV14alshsdTzjBfr3f5QDl8
         1lLWHIJW1Jd95vz0YhSPPjc/+QLHoO1r/vau2QhOVw1/jv0VqFO4yx2aYRY9gV/oGC/l
         vAMIDevDrbw7TGLP6ShfxrZpaSkCwLI7wDdnN/AmYnzxETbiXy/cHma+yX+0asSMB/Uf
         knIFAzheWqALi9CVko1TIbKyqazB3VozLLSwAwsTDqDS7ixHpOZ/IfLBP4lB+UA/AJX8
         jb6jSM8lBPb9GSfmLZOK4UFuZ1UOlxmTPdoZAqBkGp7+p6lj6bVQ3fQd0EUqUF5ezel+
         1Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737081990; x=1737686790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBE352h6xTV11ZbHwFwrhAF11sH/L9EG9p9m7t9k9EA=;
        b=C1ZMRDS2i5JFom0Bj4PP0egbTVArweyeSZOsSKPE923/69V9xNXtRqfXWg4JLM679K
         abqlEkVZRSEwmpmW3bGxAbgYh1louDaYIGCPjB6VDc4zFfj0LwhrZQW57yEZNgKJ8oso
         E4LeIM+s1M/Sj13N9UB9SzF5qL/QMbaZazHUoniUK3ATc/BRIdu2Jc4MU/tCcYZEILTc
         ednbAYXdw+4PucjPAYyuFRdi9nRawT/hFNflE2XbYHt8bnXI21PHkPIhft0okeh91OUG
         OIsIyke4kzTE2eKdLL/GYrN0q3iUNGs4IT8Dq5Kjv0TzUkUvw2K/WHyDZ/+oMMArQhoa
         24PA==
X-Forwarded-Encrypted: i=1; AJvYcCUPal9KUlGD1umR36i7Ub+gT7/jkDDkSLCYsqXTeF3SuYnUy2IVa3OpAi84iSb4N67eGn+cTbcLKqPM/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8CJhTwaAJQC1hxgAWaM/x+9jIkGj5ZcGu6LwO9vchLtnzforM
	0pleeJZlfaJECOU7HfqqRIrJ4nFvWJnuPsig41AYFtEvIgATTiR1rsgjTgK7Yac8DkffpYZ2FXs
	q7x8rhL7e+Nojs4/F2gSq8FSu1/2Eh3I79W3dqA==
X-Gm-Gg: ASbGncsCyVfpEJ7ZOyvB/9W6HEpSV8+ZsSxB6Bo5dJt3kXPELcygcgRezdIZIjudMmf
	f5TonVBCtRJVtokcJ/3GBYUC/itZXOm3cVRGqm+PS
X-Google-Smtp-Source: AGHT+IHCygSg9QotfBTDuFvRaNFXV46S7C6ifwjSRyMAhO+Cv0MABWpr/8EfOwFa+ddOP11+8pIFIUp31Vd6zCzKD10=
X-Received: by 2002:a05:6602:14cc:b0:844:cf31:622f with SMTP id
 ca18e2360f4ac-851b619f802mr56258439f.2.1737081989766; Thu, 16 Jan 2025
 18:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20250115030306.29735-1-zong.li@sifive.com> <20250115030306.29735-3-zong.li@sifive.com>
 <6301d20b-d51d-4f96-94ea-134e065d398e@arm.com>
In-Reply-To: <6301d20b-d51d-4f96-94ea-134e065d398e@arm.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 17 Jan 2025 10:46:18 +0800
X-Gm-Features: AbW1kvYifw2ZNiWhXRw7ovhPDr3eXKvGZSuGineouUgzPowzaGn_tXhdSKAMjE8
Message-ID: <CANXhq0oDv0b_S=6EmETAUkjQxo3Zz5fZ-yeP-9hHSMW9Ak5=sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/riscv: support HPM and interrupt handling
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, tjeznach@rivosinc.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_184631_027866_E8BA4AB6 
X-CRM114-Status: GOOD (  32.52  )
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

T24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgNTo1NuKAr0FNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNS0wMS0xNSAzOjAzIGFtLCBab25nIExpIHdy
b3RlOgo+ID4gSW5pdGlhbGl6ZSB0aGUgUE1VIGFuZCB1bmluaXRpYWxpemUgaXQgd2hlbiBkcml2
ZXIgaXMgcmVtb3ZlZC4KPiA+IEludGVycnVwdCBoYW5kbGluZyBpcyBhbHNvIGltcGxlbWVudGVk
LCBhbmQgdGhlIGhhbmRsZXIgbmVlZHMKPiA+IHRvIGJlIGEgcHJpbWFyeSBoYW5kbGVyIGluc3Rl
YWQgb2YgYSB0aHJlYWRlZCBmdW5jdGlvbiBiZWNhdXNlCj4gPiBwdF9yZWdzIGlzIGVtcHR5IHdo
ZW4gdGhyZWFkaW5nIHRoZSBJUlEuIEhvd2V2ZXIsIHB0X3JlZ3MgaXMKPiA+IHJlcXVpcmVkIGJ5
IHBlcmZfZXZlbnRfb3ZlcmZsb3cuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgo+ID4gVGVzdGVkLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRh
bmNlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCA2NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2NSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gaW5kZXggOGEwNWRl
Zjc3NGJkLi4yMGFlOTA0NzE0ODQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LmMKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gQEAgLTU1
Miw2ICs1NTIsNjIgQEAgc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X2ZsdHFfcHJvY2Vz
cyhpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4g
ICB9Cj4gPgo+ID4gKy8qCj4gPiArICogSU9NTVUgSGFyZHdhcmUgcGVyZm9ybWFuY2UgbW9uaXRv
cgo+ID4gKyAqLwo+ID4gKwo+ID4gKy8qIEhQTSBpbnRlcnJ1cHQgcHJpbWFyeSBoYW5kbGVyICov
Cj4gPiArc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X2hwbV9pcnFfaGFuZGxlcihpbnQg
aXJxLCB2b2lkICpkZXZfaWQpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11X2Rl
dmljZSAqaW9tbXUgPSAoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqKWRldl9pZDsKPiA+ICsK
PiA+ICsgICAgIC8qIENsZWFyIHBlcmZvcm1hbmNlIG1vbml0b3JpbmcgaW50ZXJydXB0IHBlbmRp
bmcgKi8KPiA+ICsgICAgIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVH
X0lQU1IsIFJJU0NWX0lPTU1VX0lQU1JfUE1JUCk7Cj4gPiArCj4gPiArICAgICAvKiBQcm9jZXNz
IHBtdSBpcnEgKi8KPiA+ICsgICAgIHJpc2N2X2lvbW11X3BtdV9oYW5kbGVfaXJxKCZpb21tdS0+
cG11KTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBJUlFfSEFORExFRDsKPiA+ICt9Cj4gPiArCj4g
PiArLyogSFBNIGluaXRpYWxpemF0aW9uICovCj4gPiArc3RhdGljIGludCByaXNjdl9pb21tdV9o
cG1fZW5hYmxlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gK3sKPiA+ICsg
ICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgIGlmICghKGlvbW11LT5jYXBzICYgUklTQ1ZfSU9N
TVVfQ0FQQUJJTElUSUVTX0hQTSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+
ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIHB0X3JlZ3MgaXMgZW1wdHkgd2hlbiB0aHJlYWRpbmcg
dGhlIElSUSwgYnV0IHB0X3JlZ3MgaXMgbmVjZXNzYXJ5Cj4gPiArICAgICAgKiBieSBwZXJmX2V2
ZW50X292ZXJmbG93LiBVc2UgcHJpbWFyeSBoYW5kbGVyIGluc3RlYWQgb2YgdGhyZWFkCj4gPiAr
ICAgICAgKiBmdW5jdGlvbiBmb3IgUE0gSVJRLgo+ID4gKyAgICAgICoKPiA+ICsgICAgICAqIFNl
dCB0aGUgSVJRRl9PTkVTSE9UIGZsYWcgYmVjYXVzZSB0aGlzIElSUSBtaWdodCBiZSBzaGFyZWQg
d2l0aAo+ID4gKyAgICAgICogb3RoZXIgdGhyZWFkZWQgSVJRcyBieSBvdGhlciBxdWV1ZXMuCj4g
PiArICAgICAgKi8KPiA+ICsgICAgIHJjID0gZGV2bV9yZXF1ZXN0X2lycShpb21tdS0+ZGV2LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11LT5pcnFzW3Jpc2N2X2lvbW11X3F1
ZXVlX3ZlYyhpb21tdSwgUklTQ1ZfSU9NTVVfSVBTUl9QTUlQKV0sCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfaHBtX2lycV9oYW5kbGVyLCBJUlFGX09ORVNIT1Qg
fCBJUlFGX1NIQVJFRCwgTlVMTCwgaW9tbXUpOwo+Cj4gSG1tLCBzaGFyZWQgaW50ZXJydXB0cyBh
cmUgdHJpY2t5IGZvciBQTVVzLCBzaW5jZSBwZXJmIHJlcXVpcmVzIGFueSBJUlEKPiBoYW5kbGVy
IHRvdWNoaW5nIGEgUE1VIGlzIHJ1bm5pbmcgb24gcG11LT5jcHUsIHNvIHlvdSBoYXZlIHRvIGJl
IHZlcnkKPiBjYXJlZnVsIGFib3V0IG1haW50YWluaW5nIGFmZmluaXR5IGFuZCBub3QgbGV0dGlu
ZyBhbnlvbmUgZWxzZSBjaGFuZ2UgaXQKPiBiZWhpbmQgeW91ciBiYWNrLgo+Cj4gVGhlIG90aGVy
IHRoaW5nIGlzIHRoYXQgaWYgaXQgcmVhbGx5IGlzIHNoYXJlZCwgYXQgdGhpcyBwb2ludCB5b3Ug
Y291bGQKPiBub3cgYmUgaW4gcmlzY3ZfaW9tbXVfcG11X2hhbmRsZV9pcnEoKSBkZXJlZmVyZW5j
aW5nIE5VTEwuCgpZZXMsIHRoZSBQTVUgSVJRIGxpbmUgY291bGQgYmUgc2hhcmVkIHdpdGggdGhl
IGNvbW1hbmQgcXVldWUsIGZhdWx0CnF1ZXVlLCBhbmQgcGFnZS1yZXF1ZXN0IHF1ZXVlLgpDb3Vs
ZCB5b3UgcGxlYXNlIHByb3ZpZGUgbW9yZSB0aXBzIG9uIHdoYXQgaXMgbWVhbnQgYnkgImRlcmVm
ZXJlbmNpbmcKTlVMTCBpbiByaXNjdl9pb21tdV9wbXVfaGFuZGxlX2lycSgpIj8KSSBkb24ndCBj
b21wbGV0ZSB1bmRlcnN0YW5kIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSB0aGVyZS4KVGhhbmtzCgo+
Cj4gPiArICAgICBpZiAocmMpCj4gPiArICAgICAgICAgICAgIHJldHVybiByYzsKPiA+ICsKPiA+
ICsgICAgIHJldHVybiByaXNjdl9pb21tdV9wbXVfaW5pdCgmaW9tbXUtPnBtdSwgaW9tbXUtPnJl
ZywgZGV2X25hbWUoaW9tbXUtPmRldikpOwo+ID4gK30KPiA+ICsKPiA+ICsvKiBIUE0gdW5pbml0
aWFsaXphdGlvbiAqLwo+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2hwbV9kaXNhYmxlKHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gK3sKPiA+ICsgICAgIGlmICghKGlv
bW11LT5jYXBzICYgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0hQTSkpCj4gPiArICAgICAgICAg
ICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgIGRldm1fZnJlZV9pcnEoaW9tbXUtPmRldiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgaW9tbXUtPmlycXNbcmlzY3ZfaW9tbXVfcXVldWVfdmVjKGlv
bW11LCBSSVNDVl9JT01NVV9JUFNSX1BNSVApXSwKPiA+ICsgICAgICAgICAgICAgICAgICAgaW9t
bXUpOwo+ID4gKwo+ID4gKyAgICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9tbXUtPnBtdSk7
Cj4gPiArfQo+ID4gKwo+ID4gICAvKiBMb29rdXAgYW5kIGluaXRpYWxpemUgZGV2aWNlIGNvbnRl
eHQgaW5mbyBzdHJ1Y3R1cmUuICovCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMg
KnJpc2N2X2lvbW11X2dldF9kYyhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IGRldmlkKQo+ID4gQEAgLTE1OTYsNiArMTY1Miw5IEBAIHZvaWQgcmlzY3ZfaW9tbXVfcmVt
b3ZlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gICAgICAgcmlzY3ZfaW9t
bXVfaW9kaXJfc2V0X21vZGUoaW9tbXUsIFJJU0NWX0lPTU1VX0REVFBfSU9NTVVfTU9ERV9PRkYp
Owo+ID4gICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmNtZHEpOwo+ID4g
ICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmZsdHEpOwo+ID4gKwo+ID4g
KyAgICAgaWYgKGlvbW11LT5jYXBzICYgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0hQTSkKPiA+
ICsgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9tbXUtPnBtdSk7Cj4gPiAg
IH0KPiA+Cj4gPiAgIGludCByaXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZp
Y2UgKmlvbW11KQo+ID4gQEAgLTE2MzUsNiArMTY5NCwxMCBAQCBpbnQgcmlzY3ZfaW9tbXVfaW5p
dChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiA+ICAgICAgIGlmIChyYykKPiA+
ICAgICAgICAgICAgICAgZ290byBlcnJfcXVldWVfZGlzYWJsZTsKPiA+Cj4gPiArICAgICByYyA9
IHJpc2N2X2lvbW11X2hwbV9lbmFibGUoaW9tbXUpOwo+ID4gKyAgICAgaWYgKHJjKQo+ID4gKyAg
ICAgICAgICAgICBnb3RvIGVycl9ocG1fZGlzYWJsZTsKPiA+ICsKPgo+IEkgd291bGQgbGVhdmUg
dGhpcyB1bnRpbCBhZnRlciB0aGUgd2hvbGUgSU9NTVUgc2V0dXAgaGFzIHN1Y2NlZWRlZC4gVGhl
Cj4gUE1VIGlzIG5vdCBjcml0aWNhbCB0byBJT01NVSBvcGVyYXRpb24sIHNvIGF0IHRoYXQgcG9p
bnQgYW4gZXJyb3IgaXMgbm90Cj4gZmF0YWwsIGl0IGp1c3QgbWVhbnMgeW91IGRvbid0IGdldCBh
IFBNVSwgdGh1cyB0aGVyZSBzaG91bGRuJ3QgbmVlZCB0bwo+IGJlIGFueSBjbGVhbnVwIG91dHNp
ZGUgcmlzY3ZfaW9tbXVfaHBtX2VuYWJsZSgpIGl0c2VsZi4KClRoYW5rcyBmb3IgcG9pbnRpbmcg
dGhpcyBvdXQuIFBNVSBmYWlsdXJlIHNob3VsZG4ndCBjYXVzZSB0aGUgZW50aXJlCklPTU1VIHRv
IGZhaWwsIGxldCBtZSBtb2RpZnkgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4KPiBUaGFua3Ms
Cj4gUm9iaW4uCj4KPiA+ICAgICAgIHJjID0gaW9tbXVfZGV2aWNlX3N5c2ZzX2FkZCgmaW9tbXUt
PmlvbW11LCBOVUxMLCBOVUxMLCAicmlzY3YtaW9tbXVAJXMiLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRldl9uYW1lKGlvbW11LT5kZXYpKTsKPiA+ICAgICAgIGlmIChy
Yykgewo+ID4gQEAgLTE2NTMsNiArMTcxNiw4IEBAIGludCByaXNjdl9pb21tdV9pbml0KHN0cnVj
dCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gICBlcnJfcmVtb3ZlX3N5c2ZzOgo+ID4g
ICAgICAgaW9tbXVfZGV2aWNlX3N5c2ZzX3JlbW92ZSgmaW9tbXUtPmlvbW11KTsKPiA+ICAgZXJy
X2lvZGlyX29mZjoKPiA+ICsgICAgIHJpc2N2X2lvbW11X2hwbV9kaXNhYmxlKGlvbW11KTsKPiA+
ICtlcnJfaHBtX2Rpc2FibGU6Cj4gPiAgICAgICByaXNjdl9pb21tdV9pb2Rpcl9zZXRfbW9kZShp
b21tdSwgUklTQ1ZfSU9NTVVfRERUUF9JT01NVV9NT0RFX09GRik7Cj4gPiAgIGVycl9xdWV1ZV9k
aXNhYmxlOgo+ID4gICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmZsdHEp
Owo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
