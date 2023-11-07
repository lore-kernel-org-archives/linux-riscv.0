Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVsQnRm9NVUvSn0oJYD11tdYVv9vyXQ+wST2Do35g5U=; b=o8KuSI+v8DaQ2W
	p5kUVoODURnrrtqwyZY8+SfhEKlGkEUFD7t5BfYgh8OypDsh1BmNelj7qHx+YJWCveQFBZLU7UNHl
	fVtQIfT0+/bdnFH3fEUl0725U6pgyGJHHEMFR7KQz56ODH/xJ6Us7eONeoqJD4inLZwmaDqXq2S/P
	iGPZrtSFM0i3FW65EEN55uLb3fvt0yd4HaJZNnAtSXX7BbYTQ3gGpDX12qQ3o4/7A1QWlk59NXX1u
	Us0PCw//Ai7IHCeREKV46pPif4tRVwSD1+pYHAuIwkcXn8rA9KSSofQ2WwVPm5lgiT3lA1Hb1oStN
	UgZ1CKSyBkDeSXVT8nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Pqj-0024zo-12;
	Tue, 07 Nov 2023 17:26:49 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Pqe-0024yq-2r
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 17:26:47 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so80138411fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 09:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699378000; x=1699982800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZkd52T+YeGKBl1CYuJ00AYOxiV6R4Ssf73ETNqj2ro=;
        b=j8QEIhMnKxFDQoApMGg4YdnEsyxCv1iV4m8b9OYl5UAUSq+XNpMGlx5p+4wBF42+Jw
         Dic/eeWAx+eU+P9pkblTq5u5Hci6H62sX51PyNUXxrJyBxRLnSaTbmyg9ygkmHax2DFB
         qgmwlRZqoSz402DmG+zgAqTjJcdxM002XbZ6O57GNUMjOepw9hLHEPcY6E3kz5taKUMu
         3PDdPK4Sg9SzBbewf9V8DFOp6q580zPCGy+lWCtnHk2b+dQqHNe4rONaDQzPTqkSEDAF
         Lqy0DUoxRQmLcidja5OkItUekjEtB7vJWslpWldJVUNdub9VqQMK//ON806Ygi7s/ZAA
         4fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699378000; x=1699982800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZkd52T+YeGKBl1CYuJ00AYOxiV6R4Ssf73ETNqj2ro=;
        b=DzWVEdWC8MJmS+DsXCbjqZOT/Ky6oyJQHvBi1D3VZ4lB9vmp7JXghu5XY7GTptuWDT
         Kz7aLtoFV0YJDSoB0bOohkCEndyU1szG3J1dR2xR4R7rOpc9eDB2U3J4X34l5RGYhBRe
         krian64t3wEC5mP9y1RlTWoAXBkJ/kdrsWanep5xlmysvRnlRMvLXnpTATvHqpmRYVq0
         j4Fn1wn2hi1MxQxs6Gm5U1V6JSt9jeV0rYpvT9SpGwup2c69Z544UD4GcvVHDda1nFW2
         Hm4j/F4Ha/GDgahNvbSpK3kEd6md6nxpeVkLNmqOUOkizKyojcVVKjoXEfuYHhDQChzP
         bHGA==
X-Gm-Message-State: AOJu0YyG3lONKvXkQxRXnBGwj231gPcXfmDCwJMKvUmwXmK03ZQt+vOZ
	xh8KDdLFdQ10KXjUbA37eoxjw31pLU6uB+gmTYn9mw==
X-Google-Smtp-Source: AGHT+IGl3P2xisn8Pi9jVTal1vZEOJryHpdqi/VfjD1sA5j/mthxIgAxL+CVC4H+Kt5HKX96fyStWaaIsFoUI3IyO/o=
X-Received: by 2002:a2e:5056:0:b0:2c5:1640:3c97 with SMTP id
 v22-20020a2e5056000000b002c516403c97mr27445634ljd.22.1699378000137; Tue, 07
 Nov 2023 09:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20231106225855.3121724-1-evan@rivosinc.com> <20231107083411.J3ga0YmA@linutronix.de>
In-Reply-To: <20231107083411.J3ga0YmA@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 7 Nov 2023 09:26:03 -0800
Message-ID: <CALs-HsvX=zHvSKV5Skuxk=7jWq_mGqhsRSeuefD7OiYOCr3Gkw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Probe misaligned access speed in parallel
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_092645_286219_BFF5EA8E 
X-CRM114-Status: GOOD (  40.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgNywgMjAyMyBhdCAxMjozNOKAr0FNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdp
b3IKPGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDIzLTExLTA2IDE0OjU4
OjU1IFstMDgwMF0sIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiBQcm9iaW5nIGZvciBtaXNhbGlnbmVk
IGFjY2VzcyBzcGVlZCB0YWtlcyBhYm91dCAwLjA2IHNlY29uZHMuIE9uIGEKPiA+IHN5c3RlbSB3
aXRoIDY0IGNvcmVzLCBkb2luZyB0aGlzIGluIHNtcF9jYWxsaW4oKSBtZWFucyBpdCdzIGRvbmUK
PiA+IHNlcmlhbGx5LCBleHRlbmRpbmcgYm9vdCB0aW1lIGJ5IDMuOCBzZWNvbmRzLiBUaGF0J3Mg
YSBsb3Qgb2YgYm9vdCB0aW1lLgo+ID4KPiA+IEluc3RlYWQgb2YgbWVhc3VyaW5nIGVhY2ggQ1BV
IHNlcmlhbGx5LCBsZXQncyBkbyB0aGUgbWVhc3VyZW1lbnRzIG9uCj4gPiBhbGwgQ1BVcyBpbiBw
YXJhbGxlbC4gSWYgd2UgZGlzYWJsZSBwcmVlbXB0aW9uIG9uIGFsbCBDUFVzLCB0aGUKPiA+IGpp
ZmZpZXMgc3RvcCB0aWNraW5nLCBzbyB3ZSBjYW4gZG8gdGhpcyBpbiBzdGFnZXMgb2YgMSkgZXZl
cnlib2R5Cj4gPiBleGNlcHQgY29yZSAwLCB0aGVuIDIpIGNvcmUgMC4gVGhlIGFsbG9jYXRpb25z
IGFyZSBhbGwgZG9uZSBvdXRzaWRlIG9mCj4gPiBvbl9lYWNoX2NwdSgpIHRvIGF2b2lkIGNhbGxp
bmcgYWxsb2NfcGFnZXMoKSB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4gPgo+ID4gRm9yIGhv
dHBsdWdnZWQgQ1BVcyB0aGF0IGNvbWUgaW4gYWZ0ZXIgdGhlIGJvb3QgdGltZSBtZWFzdXJlbWVu
dCwKPiA+IHJlZ2lzdGVyIENQVSBob3RwbHVnIGNhbGxiYWNrcywgYW5kIGRvIHRoZSBtZWFzdXJl
bWVudCB0aGVyZS4gSW50ZXJydXB0cwo+ID4gYXJlIGVuYWJsZWQgaW4gdGhvc2UgY2FsbGJhY2tz
LCBzbyB0aGV5J3JlIGZpbmUgdG8gZG8gYWxsb2NfcGFnZXMoKSBpbi4KPgo+IEkgdGhpbmsgdGhp
cyBpcyBkcmFnZ2VkIG91dCBvZiBwcm9wb3J0aW9uLiBJIHdvdWxkIGRvIHRoaXMgKGlmIG5lZWRl
ZAo+IGNhbiBjYW4ndCBiZSBpZGVudGlmaWVkIGJ5IENQVS1JRCBvciBzbykgb24gYm9vdCBDUFUg
b25seS4gSWYgdGhlcmUgaXMKPiBldmlkZW5jZS8gcHJvb2YvIGJsZXNzaW5nIGZyb20gdGhlIGhp
Z2ggUmlzY1YgY291bmNpbCB0aGF0IGRpZmZlcmVudAo+IHR5cGVzIG9mIENQVSBjb3JlcyBhcmUg
bWl4ZWQgdG9nZXRoZXIgdGhlbiB0aGlzIGNvdWxkIGJlIGV4dGVuZGVkLgo+IFlvdSBicm91Z2h0
IEJpZy1MaXR0bGUgdXAgaW4gdGhlIG90aGVyIHRocmVhZC4gVGhpcyBpcyBhY3R1YWxseSBrbm93
bi4KPiBTYW1lIGFzIHdpdGggaHlwZXItdGhyZWFkcyBvbiB4ODYsIHlvdSBrbm93IHdoaWNoIENQ
VSBpcyB0aGUgY29yZSBhbmQKPiB3aGljaCBoeXBlciB0aHJlYWQgKENQVSkgYmVsb25ncyB0byBp
dC4KPiBTbyBpbiB0ZXJtcyBvZiBCaWdMaXR0bGUgeW91IF9jb3VsZF8gbGltaXQgdGhpcyB0byBv
bmUgQmlnIGFuZCBvbmUKPiBMaXR0bGUgY29yZSBpbnN0ZWFkIHJ1bm5pbmcgaXQgb24gYWxsLgoK
RG9pbmcgaXQgb24gb25lIHBlciBjbHVzdGVyIG1pZ2h0IGFsc28gaGFwcGVuIHRvIHdvcmssIGJ1
dCBJIHN0aWxsIHNlZQpub3RoaW5nIHRoYXQgcHJldmVudHMgdmFyaWV0eSB3aXRoaW4gYSBjbHVz
dGVyLCBzbyBJJ20gbm90IGNvbWZvcnRhYmxlCndpdGggdGhhdCBhc3N1bXB0aW9uLiBJdCBhbHNv
IGRvZXNuJ3QgYnV5IG11Y2guIEknbSBub3Qgc3VyZSB3aGF0IGtpbmQKb2YgZ3VpZGFuY2UgUlZJ
IGlzIHByb3ZpZGluZyBvbiBpbnRlZ3JhdGluZyBtdWx0aXBsZSBDUFVzIGludG8gYQpzeXN0ZW0u
IEkgaGF2ZW4ndCBzZWVuIGFueSBteXNlbGYsIGJ1dCBhbSBoYXBweSB0byByZWFzc2VzcyBpZiB0
aGVyZSdzCmRvY3VtZW50YXRpb24gYmFubmluZyB0aGUgc2NlbmFyaW9zIEknbSBpbWFnaW5pbmcu
Cgo+Cj4gQnV0IHRoaXMgaXMganVzdCBteSBmZXcgb24gdGhpcy4gRnJvbSBQUkVFTVBUX1JUJ3Mg
cG9pbnQgb2YgdmlldywgdGhlCj4gd2F5IHlvdSByZXN0cnVjdHVyZWQgdGhlIG1lbW9yeSBhbGxv
Y2F0aW9uIHNob3VsZCB3b3JrIG5vdy4KClRoYW5rcyEKCj4KPiA+IFJlcG9ydGVkLWJ5OiBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9taG5nLTkzNTk5OTNkLTY4NzItNDEzNC04M2NlLWM5N2RlYmUxY2Y5YUBw
YWxtZXItcmkteDFjOS9ULyNtYWU5YjhmNDAwMTZmOWRmNDI4ODI5ZDMzMzYwMTQ0ZGM1MDI2YmNi
Zgo+ID4gRml4ZXM6IDU4NGVhNjU2NGJjYSAoIlJJU0MtVjogUHJvYmUgZm9yIHVuYWxpZ25lZCBh
Y2Nlc3Mgc3BlZWQiKQo+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2lu
Yy5jb20+Cj4gPgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IDZhMDFkZWQ2
MTVjZC4uZmU1OWUxOGRiZDViIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiDigKYK
PiA+Cj4gPiAtc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19ib290X2Nw
dSh2b2lkKQo+ID4gKy8qIE1lYXN1cmUgdW5hbGlnbmVkIGFjY2VzcyBvbiBhbGwgQ1BVcyBwcmVz
ZW50IGF0IGJvb3QgaW4gcGFyYWxsZWwuICovCj4gPiArc3RhdGljIGludCBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCj4gPiAgewo+ID4gLSAgICAgY2hlY2tfdW5hbGlnbmVk
X2FjY2VzcygwKTsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBjcHU7Cj4gPiArICAgICB1bnNpZ25l
ZCBpbnQgY3B1X2NvdW50ID0gbnVtX3Bvc3NpYmxlX2NwdXMoKTsKPiA+ICsgICAgIHN0cnVjdCBw
YWdlICoqYnVmcyA9IGt6YWxsb2MoY3B1X2NvdW50ICogc2l6ZW9mKHN0cnVjdCBwYWdlICopLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPgo+IGtj
YWxsb2MoKS4gRm9yIGJlYXV0eSByZWFzb25zIHlvdSBjb3VsZCB0cnkgYSByZXZlcnNlIHhtYXMg
dHJlZS4KPgo+ID4gKwo+ID4gKyAgICAgaWYgKCFidWZzKSB7Cj4gPiArICAgICAgICAgICAgIHBy
X3dhcm4oIkFsbG9jYXRpb24gZmFpbHVyZSwgbm90IG1lYXN1cmluZyBtaXNhbGlnbmVkIHBlcmZv
cm1hbmNlXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICB9Cj4gPiAr
Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogQWxsb2NhdGUgc2VwYXJhdGUgYnVmZmVycyBmb3Ig
ZWFjaCBDUFUgc28gdGhlcmUncyBubyBmaWdodGluZyBvdmVyCj4gPiArICAgICAgKiBjYWNoZSBs
aW5lcy4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgZm9yX2VhY2hfY3B1KGNwdSwgY3B1X29ubGlu
ZV9tYXNrKSB7Cj4gPiArICAgICAgICAgICAgIGJ1ZnNbY3B1XSA9IGFsbG9jX3BhZ2VzKEdGUF9L
RVJORUwsIE1JU0FMSUdORURfQlVGRkVSX09SREVSKTsKPiA+ICsgICAgICAgICAgICAgaWYgKCFi
dWZzW2NwdV0pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJBbGxvY2F0aW9u
IGZhaWx1cmUsIG5vdCBtZWFzdXJpbmcgbWlzYWxpZ25lZCBwZXJmb3JtYW5jZVxuIik7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsg
ICAgIH0KPiA+ICsKPiA+ICsgICAgIC8qIENoZWNrIGV2ZXJ5Ym9keSBleGNlcHQgMCwgd2hvIHN0
YXlzIGJlaGluZCB0byB0ZW5kIGppZmZpZXMuICovCj4gPiArICAgICBvbl9lYWNoX2NwdShjaGVj
a191bmFsaWduZWRfYWNjZXNzX25vbmJvb3RfY3B1LCBidWZzLCAxKTsKPgo+IGNvbW1lbnRzISBf
SE9XXyBkbyB5b3UgZW5zdXJlIHRoYXQgQ1BVMCBpcyBsZWZ0IG91dD8gWW91IGRvbid0LiBDUFUw
Cj4gZG9lcyB0aGlzIGFuZCB0aGUgbGVhdmVzIHdoaWNoIGlzIGEgd2FzdGUuIFVzaW5nIG9uX2Vh
Y2hfY3B1X2NvbmQoKQo+IGNvdWxkIGRlYWwgd2l0aCB0aGlzLiBBbmQgeW91IGhhdmUgdGhlIGNo
ZWNrIHdpdGhpbiB0aGUgd3JhcHBlcgo+IChjaGVja191bmFsaWduZWRfYWNjZXNzX25vbmJvb3Rf
Y3B1KCkpIGFueXdheS4KPgo+ID4gKyAgICAgLyogQ2hlY2sgY29yZSAwLiAqLwo+ID4gKyAgICAg
c21wX2NhbGxfb25fY3B1KDAsIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MsIGJ1ZnNbMF0sIHRydWUp
Owo+Cj4gTm93IHRoYXQgY29tbWVudCBpcyBvYnZpb3VzLiBJZiB5b3Ugd2FudCB0byBhZGQgYSBj
b21tZW50LCB3aHkgbm90IHN0YXRlCj4gd2h5IENQVTAgaGFzIHRvIGJlIGRvbmUgbGFzdD8KPgo+
ID4gKwo+ID4gKyAgICAgLyogU2V0dXAgaG90cGx1ZyBjYWxsYmFjayBmb3IgYW55IG5ldyBDUFVz
IHRoYXQgY29tZSBvbmxpbmUuICovCj4gPiArICAgICBjcHVocF9zZXR1cF9zdGF0ZV9ub2NhbGxz
KENQVUhQX0FQX09OTElORV9EWU4sICJyaXNjdjpvbmxpbmUiLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByaXNjdl9vbmxpbmVfY3B1LCBOVUxMKTsKPiBJbnN0ZWFkIHJpc2N2
Om9ubGluZSB5b3UgY291bGQgdXNlIHJpc2N2OnVuYWxpZ2VkX2NoZWNrIG9yIHNvbWV0aGluZwo+
IHRoYXQgcGluIHBvaW50cyB0aGUgY2FsbGJhY2sgdG8gc29tZXRoaW5nIG9idmlvdXMuIFRoaXMg
aXMgZXhwb3J0ZWQgdmlhCj4gc3lzZnMuCj4KPiBBZ2FpbiwgY29tbWVudCBpcyBvYnZpb3VzLiBG
b3IgdGhhdCB0byBtYWtlIHNlbnNlIHdvdWxkIHJlcXVpcmUgUmlzY1YgdG8KPiBzdXBwb3J0IHBo
eXNpY2FsLWhvdHBsdWcuIEZvciBLVk0gbGlrZSBlbnZpcm9ubWVudCAod2hlcmUgeW91IGNhbiBw
bHVnIGluCj4gQ1BVcyBsYXRlcikgdGhpcyBwcm9iYWJseSBkb2Vzbid0IG1ha2Ugc2Vuc2UgYXQg
YWxsLiBXaHkgbm90PyBCZWNhdXNlCj4KPiAtIHdpdGhvdXQgZXhwbGljaXQgQ1BVIHBpbm5pbmcg
eW91ciBzbG93LyBmYXN0IENQVSBtYXBwaW5nIChob3N0IDwtPgo+ICAgZ3Vlc3QpIGNvdWxkIGNo
YW5nZSBpZiB0aGUgc2NoZWR1bGVyIG9uIHRoZSBob3N0IG1vdmVzIHRoZSB0aHJlYWRzCj4gICBh
cm91bmQuCgpUYWtpbmcgYSBzeXN0ZW0gd2l0aCBub24taWRlbnRpY2FsIGNvcmVzIGFuZCBhbGxv
d2luZyB2Y3B1cyB0byBib3VuY2UKYmV0d2VlbiB0aGVtIHNvdW5kcyBsaWtlIGEgaHlwZXJ2aXNv
ciBjb25maWd1cmF0aW9uIGlzc3VlIHRvIG1lLApyZWdhcmRsZXNzIG9mIHRoaXMgcGF0Y2guCgo+
Cj4gLSB3aXRob3V0IGV4cGxpY2l0IHRhc2sgb2ZmbG9hZCBhbmQgcmVzb3VyY2UgcGFydGl0aW9u
aW5nIG9uIHRoZSBob3N0Cj4gICB5b3VyIGd1ZXN0IHRocmVhZCBtaWdodCBnZXQgaW50ZXJydXB0
IGR1cmluZyB0aGUgbWVhc3VyZW1lbnQuIFRoaXMgaXMKPiAgIGRvbmUgZHVyaW5nIGJvb3Qgc28g
Y2hhbmNlcyBhcmUgaGlnaCB0aGF0IGl0IHJ1bnMgMTAwJSBvZiBpdHMgdGltZQo+ICAgc2xpY2Ug
YW5kIHdpbGwgYmUgcHJlZW1wdGVkIG9uY2Ugb3RoZXIgdGFza3Mgb24gdGhlIGhvc3QgYXNrIGZv
ciBDUFUKPiAgIHJ1biB0aW1lLgoKVGhlIG1lYXN1cmVtZW50IHRha2VzIHRoZSBiZXN0IChsb3dl
c3QgdGltZSkgaXRlcmF0aW9uLiBTbyB1bmxlc3MKZXZlcnkgaXRlcmF0aW9uIGdldHMgaW50ZXJy
dXB0ZWQsIEkgc2hvdWxkIGdldCBhIGdvb2QgcmVhZCBpbiB0aGVyZQpzb21ld2hlcmUuCi1FdmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
