Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD66BCF9C69
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygqg28rKvd/VTUPcE0xoWid4i8YpM5S3EHJyzdx3zcY=; b=0lGEwA7h+khM0t
	14wc8HOkxYaOHQ55TfHxDY1WXdTMb7j3T8pgCDwHxB3gxYlvt6aczzjeoGgHJ847v3rQJvoJqnAn+
	eIvpIV6gOpepsPJOrOoiScMPHI4IvSz2iZcJJb1D6HauqqPfOUIYLJnmqZW5d5PEiiNejGHfJVaiP
	3sLrmo0D5rz0aoPCzVFaFI4MGxRPbICMTMzDiTCD5k3Ml1WcDAwsxMIGtcjb4qFU/Cr/V7Lwu6VT3
	nC/Df8VrRdccAr5cw1+lSj+QspXNRDqtMDywBObNpU33MBlE4Ke9lxStlSEf1+hpgR779FtZ0PZJC
	8zyTJ8vV1eXWNYwt4PGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st9ip-00000002z8Z-1sRn;
	Tue, 24 Sep 2024 17:53:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st9im-00000002z7s-17vf
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 17:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00D2FA4357E;
	Tue, 24 Sep 2024 17:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5936C4CEC4;
	Tue, 24 Sep 2024 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727200386;
	bh=POs2HK6kTTolY7xaUcSVPRXzi118N9fp0b/+xerp1wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THPZiS+vIs0qgmO/2MeLNZ/ZqOJxR3RO1/zx4o5GN+BiGNCfStw4/D3dzzFad0qsl
	 up3h2IeWem1sr1TXYZYjtr6TSqUJ7HGqwL0kwMhyMAP8mIzU0i1AUDk4GU/tv81912
	 Wwc5lDCVt0IvXJlYu5chCkXz0/8QRbkfgBVaJAnGhEzOsplbUk/T/8ivAiWX4RVrz1
	 HXWFrVdjsx3Vmyf62S+zhUcESsSDwqUx0zuSaktmISjkCa4xae/aCJAluUfW06ExOk
	 9U7nOj/ufDq1Xy0wqNPqcSKz0iIH6P/MJsDUGMXR4Kohl4JWs0qgnpgoHvm54QKj/o
	 gCLINtAhYGr1w==
Date: Tue, 24 Sep 2024 10:53:04 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Charlie Jenkins <charlie@rivosinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Howard Chu <howardchu95@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf syscalltbl: Add syscalltbl__id_at_idx() with no
 syscall table support
Message-ID: <ZvL8gAy07ekBJZ_H@google.com>
References: <20240830-perf_syscalltbl_fix-v1-1-e2ff61ee5e8e@rivosinc.com>
 <ZvLaGy7jRa9Q/5fQ@ghost>
 <CAP-5=fVWFUA4LpchM1MZdMhDvSFhTUtqdVR-s59WtAcpj1fO=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fVWFUA4LpchM1MZdMhDvSFhTUtqdVR-s59WtAcpj1fO=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_105308_457218_7D6CC0C8 
X-CRM114-Status: GOOD (  35.84  )
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

T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMDk6MTE6NDFBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBUdWUsIFNlcCAyNCwgMjAyNCBhdCA4OjI24oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBBdWcgMzAsIDIwMjQg
YXQgMDk6MzA6NTBQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiBXaGVuIEhB
VkVfU1lTQ0FMTF9UQUJMRV9TVVBQT1JUIGlzIG5vdCBkZWZpbmVkLCBuZWl0aGVyIGlzCj4gPiA+
IHN5c2NhbGx0YmxfX2lkX2F0X2lkeCgpLiBIb3dldmVyLCB0aGlzIGZ1bmN0aW9uIGlzIGV4cGVj
dGVkIHRvIGJlCj4gPiA+IGRlZmluZWQgd2hlbiBIQVZFX0JQRl9TS0VMIGlzIGRlZmluZWQuCj4g
PiA+Cj4gPiA+IFJldHVybiAtMSBmcm9tIHN5c2NhbGx0YmxfX2lkX2F0X2lkeCgpIHRvIG1hdGNo
IHRoZSBvdGhlciBmdW5jdGlvbnMgd2hlbgo+ID4gPiBIQVZFX1NZU0NBTExfVEFCTEVfU1VQUE9S
VCBpcyBub3QgZGVmaW5lZC4KPiA+ID4KPiA+ID4gV2l0aG91dCB0aGlzLCBjb21waWxpbmcgcGVy
ZiBvbiByaXNjdiB3aGVuIGxpYnRyYWNlZXZlbnRzLCBsaWJlbGYsIGFuZAo+ID4gPiBjbGFuZyBh
cmUgYXZhaWxhYmxlIHdpbGwgY2F1c2UgdGhlIGZ1bmN0aW9ucyB0cnlpbmcgdG8gY2FsbAo+ID4g
PiBzeXNjYWxsdGJsX19pZF9hdF9pZHgoKSB0byBiZSBjb21waWxlZC4gVGhpcyByZXN1bHRzIGlu
IHRoZSBmb2xsb3dpbmcKPiA+ID4gZXJyb3I6Cj4gPiA+Cj4gPiA+IC91c3IvYmluL2xkOiBwZXJm
LWluLm86IGluIGZ1bmN0aW9uIGAuTDAgJzoKPiA+ID4gYnVpbHRpbi10cmFjZS5jOigudGV4dCsw
eDYwYjE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc3lzY2FsbHRibF9faWRfYXRfaWR4Jwo+
ID4gPiAvdXNyL2Jpbi9sZDogYnVpbHRpbi10cmFjZS5jOigudGV4dCsweDYwYzZjKTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgc3lzY2FsbHRibF9faWRfYXRfaWR4Jwo+ID4gPiAvdXNyL2Jpbi9s
ZDogcGVyZi1pbi5vOiBpbiBmdW5jdGlvbiBgLkwyNTY0JzoKPiA+ID4gYnVpbHRpbi10cmFjZS5j
OigudGV4dCsweDYwY2I2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc3lzY2FsbHRibF9faWRf
YXRfaWR4Jwo+ID4gPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMK
PiA+ID4gbWFrZVsyXTogKioqIFtNYWtlZmlsZS5wZXJmOjc5MzogcGVyZl0gRXJyb3IgMQo+ID4g
PiBtYWtlWzFdOiAqKiogW01ha2VmaWxlLnBlcmY6MjkwOiBzdWItbWFrZV0gRXJyb3IgMgo+ID4g
PiBtYWtlOiAqKiogW01ha2VmaWxlOjcwOiBhbGxdIEVycm9yIDIKPiA+ID4gbWFrZTogTGVhdmlu
ZyBkaXJlY3RvcnkgJy9zcmMvbGludXgtNi4xMS1yYzUvdG9vbHMvcGVyZicKPiA+ID4KPiA+ID4g
VGhpcyBwYXRjaCByZXNvbHZlcyB0aGlzIGlzc3VlIGZvciBhbGwgYXJjaGl0ZWN0dXJlcyB3aGlj
aCBkbyBub3QgZGVmaW5lCj4gPiA+IEhBVkVfU1lTQ0FMTF9UQUJMRV9TVVBQT1JULgo+ID4gPgo+
ID4gPiAkIC4vcGVyZiB0cmFjZSAtZSBzeXNjYWxsczpzeXNfZW50ZXJfbW1hcCAtLW1heC1ldmVu
dHM9MSBscwo+ID4gPiAwLjAwMCBscy8yODcgc3lzY2FsbHM6c3lzX2VudGVyX21tYXAoX19zeXNj
YWxsX25yOiAyMjIsIGxlbjogOTkzOSwgcHJvdDogUkVBRCwgZmxhZ3M6IFBSSVZBVEUsIGZkOiAz
KQo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgo+ID4gPiBSZXBvcnRlZC1ieTogRGF2aWQgQWJkdXJhY2htYW5vdiA8ZGF2aWRs
dEByaXZvc2luYy5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogRGF2aWQgQWJkdXJhY2htYW5vdiA8
ZGF2aWRsdEByaXZvc2luYy5jb20+Cj4gPiA+IEZpeGVzOiA3YTJmYjU2MTljYzEgKCJwZXJmIHRy
YWNlOiBGaXggaXRlcmF0aW9uIG9mIHN5c2NhbGwgaWRzIGluIHN5c2NhbGx0YmwtPmVudHJpZXMi
KQo+ID4gPiAtLS0KPiA+ID4gIHRvb2xzL3BlcmYvdXRpbC9zeXNjYWxsdGJsLmMgfCA1ICsrKysr
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS90b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jIGIvdG9vbHMvcGVyZi91dGlsL3N5
c2NhbGx0YmwuYwo+ID4gPiBpbmRleCAwZGQyNmI5OTFiM2YuLjEyNjU0NDYwNDI4ZiAxMDA2NDQK
PiA+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL3N5c2NhbGx0YmwuYwo+ID4gPiArKysgYi90b29s
cy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jCj4gPiA+IEBAIC0xODgsNCArMTg4LDkgQEAgaW50IHN5
c2NhbGx0YmxfX3N0cmdsb2JtYXRjaF9maXJzdChzdHJ1Y3Qgc3lzY2FsbHRibCAqdGJsLCBjb25z
dCBjaGFyICpzeXNjYWxsX2cKPiA+ID4gIHsKPiA+ID4gICAgICAgcmV0dXJuIHN5c2NhbGx0Ymxf
X3N0cmdsb2JtYXRjaF9uZXh0KHRibCwgc3lzY2FsbF9nbG9iLCBpZHgpOwo+ID4gPiAgfQo+ID4g
PiArCj4gPiA+ICtpbnQgc3lzY2FsbHRibF9faWRfYXRfaWR4KHN0cnVjdCBzeXNjYWxsdGJsICp0
YmwgX19hbHdheXNfdW51c2VkLCBpbnQgaWR4IF9fYWx3YXlzX3VudXNlZCkKPiA+ID4gK3sKPiA+
ID4gKyAgICAgcmV0dXJuIC0xOwo+ID4gPiArfQo+ID4gPiAgI2VuZGlmIC8qIEhBVkVfU1lTQ0FM
TF9UQUJMRV9TVVBQT1JUICovCj4gPiA+Cj4gPiA+IC0tLQo+ID4gPiBiYXNlLWNvbW1pdDogOTg1
YmY0MGVkZjQzNDNkY2IwNGMzM2Y1OGI0MGI0YTg1YzE3NzZkNAo+ID4gPiBjaGFuZ2UtaWQ6IDIw
MjQwODMwLXBlcmZfc3lzY2FsbHRibF9maXgtNGY1ODYyMjE3OTVlCj4gPiA+IC0tCj4gPiA+IC0g
Q2hhcmxpZQo+ID4gPgo+ID4KPiA+IENhbiB0aGlzIHBsZWFzZSBiZSBwaWNrZWQgdXA/IENvbXBp
bGF0aW9uIG9uIHJpc2N2IChhbG9uZyB3aXRoIGFueSBvZgo+ID4gdGhlIG90aGVyIGFyY2hpdGVj
dHVyZXMgdGhhdCBkb24ndCBoYXZlIHN5c2NhbGwgdGFibGUgc3VwcG9ydCkgaXMKPiA+IGJyb2tl
bi4gVGhlIGxvbmcgdGVybSBzb2x1dGlvbiBpcyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIHN5c2Nh
bGwgdGFibGUKPiA+IG9uIHJpc2N2LiBJIHdpbGwgc2VuZCBvdXQgYSBwYXRjaCBmb3IgdGhhdCwg
YnV0IGluIHRoZSBtZWFudGltZSBpdCB3b3VsZAo+ID4gYmUgZ3JlYXQgdG8gaGF2ZSB0aGlzIGlu
IHRoZSB0cmVlLgo+IAo+IEkgdGhvdWdodCBzb21ldGhpbmcgaGFkIGJlZW4gZG9uZToKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzczOTAwMWE0LTRkZjEtNGRlYy1hMTQxLTkyNmM3OGM1
YzA3ZUBrZXJuZWwub3JnLwo+IE5vdCBzdXJlIHdoYXQncyBoYXBwZW5lZC4KCkhpIEFybmFsZG8s
IGNhbiB5b3UgY2xhcmlmeSB3aGF0J3MgZ29pbmcgb24gaGVyZT8KClRoYW5rcywKTmFtaHl1bmcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
