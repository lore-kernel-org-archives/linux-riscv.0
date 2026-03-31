Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0146210F9302
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ileegZdeO90t2fSLZv+BFgRJDwExKLsZTnaT4ZBMrw=; b=s2zscOaMQ7FDUy
	+K7wg+y86Q5E0GtjgV/Ty5bdKzLPp4A7LD7Vl1mGNW6hEokUTBQNMU2gwzxOL45750RJricPB9Fxe
	Ool/Ppa/+EiaXqqKEG3BP2SsvOelb0pnsZ2ieWmaVFCGLvVSaNQpSaBQngamnFtWNKqdp2YtYSyUN
	n7WsmzHw2Wi0dZYnxBjr7yuYIhCpUrcpJMtpV9nNcTfJnxxYVDQZOozedqEeHOmNV9Aw1hJGRHq/O
	em1ls25i/DgUHUWps8ukdE2MXIvAcZ44QfxFjQy3BGpZvNghODmXNzDCMaSxGMDp69HagrcICPkSt
	r695m2E3jnJf9i/I5AOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hRq-0000000Dd01-2Osh;
	Tue, 31 Mar 2026 22:20:34 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hRn-0000000DczW-3n8X
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 22:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=8QrORnPZaSGq5GzeR6qKATdKLTvS76Qgu9+YPtMIjC8=; b=o4pE/6btLzmop8vRahnPZ56JUj
	g7qOZUw0bka/N9w+c19mYpJANyH6R3uZ3+xlgS1ViFpgwyPwSA/cf/D609vGluyL1pQiticJYQtS3
	Oa4c+Ucr8yNN4lrLvZbsYHD2oy3eQE7PV09D/EEdf/TGEWgoUwXCut/gpqUn7w0EmTSF/2r/OxzCm
	Rr9mqtU7yahwvDtLim/9FhG5nDIaQGceB5Z7+Jms1k4nvWLSxS57xZELhiS9Y52kKnhvNj09dDxeF
	9aKfuepw71XHJsriFvnBRdDo1M6BETlu7TW5qb1Rl/9P6yepiwuJbXbqKIdx3q6B1i3uAs+CVOFbr
	L4SX8f/g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w7hRV-00000005Pud-1BAP;
	Wed, 01 Apr 2026 00:20:13 +0200
Date: Wed, 1 Apr 2026 00:20:12 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Lee Jones <lee@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <acxInP3_rU9H8Q5V@aurel32.net>
Mail-Followup-To: Lee Jones <lee@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <20251105100856.GG8064@google.com>
 <20251105101149.GH8064@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105101149.GH8064@google.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_152031_974707_F03B24C2 
X-CRM114-Status: GOOD (  22.73  )
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

SGkgTGVlLAoKT24gMjAyNS0xMS0wNSAxMDoxMSwgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFdlZCwg
MDUgTm92IDIwMjUsIExlZSBKb25lcyB3cm90ZToKPiAKPiA+IE9uIFdlZCwgMDUgTm92IDIwMjUs
IFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiAKPiA+ID4gT24gV2VkLCBOb3YgMDUsIDIwMjUgYXQg
MDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgMDQgTm92
IDIwMjUsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiBPbiBNb24sIE5v
diAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAx
MDAsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+ID4gPiA+IFRoaXMgYWRkcyBwb3dlcm9m
Zi9yZWJvb3Qgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hpcCwgd2hpY2ggaXMK
PiA+ID4gPiA+ID4gPiBjb21tb25seSBwYWlyZWQgd2l0aCB0aGUgU3BhY2VtaVQgSzEgU29DLgo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE5vdGU6IEZvciByZWxpYWJsZSBvcGVyYXRpb24s
IHRoaXMgZHJpdmVyIGRlcGVuZHMgb24gYSB0aGlzIHBhdGNoIHRoYXQgYWRkcwo+ID4gPiA+ID4g
PiA+IGF0b21pYyB0cmFuc2ZlciBzdXBwb3J0IHRvIHRoZSBTcGFjZW1pVCBJMkMgY29udHJvbGxl
ciBkcml2ZXI6Cj4gPiA+ID4gPiA+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1p
dC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0
LmNvbS8KPiA+ID4gXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl4KPiA+ID4gZGVwZW5kZW5jeSBpcyBoZXJlLgo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBcHBsaWVkLCB0aGFu
a3MhCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBbMS8yXSBkcml2ZXI6IHJlc2V0OiBzcGFjZW1p
dC1wMTogYWRkIGRyaXZlciBmb3IgcG93ZXJvZmYvcmVib290Cj4gPiA+ID4gPiA+ICAgICAgIGNv
bW1pdDogMjgxMjRjYzBmYjhjN2RjMDFhNjgzNGQyMjczNTFlMjVkOWE5MmM1OAo+ID4gPiA+ID4g
U2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKAmXQgYmVl
biBtZXJnZWQgeWV0Li4uCj4gPiA+ID4gCj4gPiA+ID4gV2hhdCBpcyB0aGUgZGVwZW5kZW5jeT8K
PiA+ID4gSSBwb2ludCBpdCBvdXQgYWJvdmUuCj4gPiA+IFdpdGhvdXQgdGhpcyBwYXRjaCwgcmVi
b290IGFuZCBzaHV0ZG93biB3b3VsZCBlbmQgdXAgY2FsbGluZyB0aGUgbm9uLWF0b21pYyBpMmNf
dHJhbnNmZXIuCj4gPiAKPiA+IE9rYXksIHRoYW5rcy4gIEkgd2FzIG1vc3RseSBjaGVja2luZyB0
aGF0IHlvdSB3ZXJlbid0IHJlZmVycmluZyB0byB0aGUKPiA+IE1GRCBwYXRjaCwgd2hpY2ggZG9l
c24ndCByZXByZXNlbnQgYSB0cnVlIGRlcGVuZGVuY3kuCj4gCj4gVG8gc2F2ZSBTZWJhc3RpYW4g
c29tZSB0cm91YmxlLCBsZXQncyBrZWVwIHRoZSByZWJvb3QgcGF0Y2ggYXBwbGllZC4KPiAKPiBJ
J2xsIGhvbGQgb2ZmIG9uIHRoZSBNRkQgb25lLCB3aGljaCB3aWxsIGVuc3VyZSB0aGF0IHJlYm9v
dCBpc24ndCBwcm9iZWQuCj4gCj4gTGV0IG1lIGtub3cgd2hlbiB0aGUgZGVwIGlzIG1lcmdlZCBh
bmQgSSdsbCBob292ZXIgdXAgdGhlIHJlc3Qgb2YgdGhlIHNldC4KClRoZSBkZXBlbmRlbmN5IGlz
IHN0aWxsIG5vdCB5ZXQgbWVyZ2VkLCBhbHRob3VnaCBpdCBoYXMgYmVlbiByZWFkeSBmb3IgCndl
ZWtzLCBhbmQgSSBhbSBqdXN0IGNyb3NzaW5nIGZpbmdlcnMgdGhhdCBpdCB3aWxsIGdldCBwaWNr
ZWQtdXAgZm9yCmZvciA3LjEuCgpUaGF0IHNhaWQgaXQncyBub3QgYSBoYXJkIGRlcGVuZGVuY3ks
IGluIG1vc3QgY2FzZXMgcmVib290IHdpbGwgd29yaywgCndoaWNoIGlzIGFuIGltcHJvdmVtZW50
IG92ZXIgbm8gcmVib290IGRyaXZlci4gVGhlIG1pc3NpbmcgSTJDIFBJTyAKcGF0Y2hlcyBhcmUg
anVzdCB0aGVyZSB0byBtYWtlIGl0IHJlbGlhYmxlLgoKVGhlcmVmb3JlIGdpdmVuIHRoZSA3LjEg
bWVyZ2Ugd2luZG93IGFwcHJvYWNoaW5nLCBJIGJlbGlldmUgaXQncyBiZXR0ZXIgCnRvIG1lcmdl
IHRoaXMgc2ltcGxlIE1GRCBwYXRjaCBhbmQgdG8gbm90IHdhaXQgbW9yZS4KClRoYW5rcwpBdXJl
bGllbgoKLS0gCkF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAgICAgICAgICBHUEc6IDQw
OTZSLzFEREQ4QzlCCmF1cmVsaWVuQGF1cmVsMzIubmV0ICAgICAgICAgICAgICAgICAgICAgaHR0
cDovL2F1cmVsMzIubmV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
