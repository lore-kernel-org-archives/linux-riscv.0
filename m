Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D677D35162
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QxCVFHo0D+Xdbnv5SkvwXp1JIAJ6iuip6rn8hyaqDI=; b=RI4Ljpw9UOcDTf
	lClIYVwJHRrVDaP+fAfLBKHjImNoelSi4LBy7HKkO82JFkqeKu4m22+DbygPzcsZbiACYCWmh7Hw5
	YY7HlCU12qsyI0DF5AP7w0A/paE/68tHlu/b/GZGBpAhHV/GMaJ3dpF2akmPAz9FT3YwFQNuf3FZ8
	hmZVDLN5F2SjwoXdgFeA9/STot0SBIotjhekfEVtwdx4emp/lvUzeODn8sFyJ1VyUJ+pWwcIRsofT
	RHedN40loTPWCl83oULr9LqMh6Ntl6mtrXilt56w1YrWdlJcCvV/abARtEmd+2Jf0QF23zuwq+h0S
	vTPbvJMt/kNPNL1sfKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tbk-0000000Ecla-2cuC;
	Wed, 01 Apr 2026 11:19:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tbj-0000000EclL-00Ex
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 11:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 727C260131;
	Wed,  1 Apr 2026 11:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C80C4CEF7;
	Wed,  1 Apr 2026 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042374;
	bh=MUw9F7L0J9ORxUWBcBPbTTFGPGevrUNSWpXB+OHXCuM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IeatE6BhXvOPtlR5BL/B3g8KiwutSpzA+lAIq3i1KJqMCnl6KvqFrrGyqV5TrxFDF
	 HG+F+fp3brjvWi820RtywzsDd6aSNnke0I6q0jEKO67YveDW/w7Zi8crY7j9X+wotL
	 USZylAZr7JE2xB5OE+TKhRyMEL1Ofx+q/Jx20RTkvfWNb1UwmGDm0pYQjH1CdA3XSk
	 SQhrjwH5npoOnGhC4ysABRL1geNFGj5PwDTmBazE41gZLotuYLlKa5wPLrIc2tdySq
	 YL12VJCl9xalT/uGJOFT+kldw3ZcBMOTAR2cs8mShAmpuV58kSERWSsQn35NJkO01u
	 QCwjic5jSh1CA==
Date: Wed, 1 Apr 2026 12:19:28 +0100
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <20260401111928.GM3795166@google.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <20251105100856.GG8064@google.com>
 <20251105101149.GH8064@google.com>
 <acxInP3_rU9H8Q5V@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acxInP3_rU9H8Q5V@aurel32.net>
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

T24gV2VkLCAwMSBBcHIgMjAyNiwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cgo+IEhpIExlZSwKPiAK
PiBPbiAyMDI1LTExLTA1IDEwOjExLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIDA1IE5v
diAyMDI1LCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiAKPiA+ID4gT24gV2VkLCAwNSBOb3YgMjAyNSwg
VHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4gCj4gPiA+ID4gT24gV2VkLCBOb3YgMDUsIDIwMjUg
YXQgMDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCAw
NCBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBP
biBNb24sIE5vdiAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hl
bCB3cm90ZToKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBPbiBNb24sIDAzIE5vdiAyMDI1
IDAwOjAxOjU4ICswMTAwLCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRo
aXMgYWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMg
Y2hpcCwgd2hpY2ggaXMKPiA+ID4gPiA+ID4gPiA+IGNvbW1vbmx5IHBhaXJlZCB3aXRoIHRoZSBT
cGFjZW1pVCBLMSBTb0MuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IE5vdGU6IEZv
ciByZWxpYWJsZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVuZHMgb24gYSB0aGlzIHBhdGNo
IHRoYXQgYWRkcwo+ID4gPiA+ID4gPiA+ID4gYXRvbWljIHRyYW5zZmVyIHN1cHBvcnQgdG8gdGhl
IFNwYWNlbWlUIEkyQyBjb250cm9sbGVyIGRyaXZlcjoKPiA+ID4gPiA+ID4gPiA+ICAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQvMjAyNTEwMDktazEtaTJjLWF0b21pYy12NC0xLWE4
OTM2Nzg3MDI4NkBsaW51eC5zcGFjZW1pdC5jb20vCj4gPiA+ID4gXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiA+ID4gPiBkZXBlbmRl
bmN5IGlzIGhlcmUuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQXBwbGllZCwgdGhhbmtzIQo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IFsxLzJdIGRyaXZlcjogcmVzZXQ6IHNwYWNlbWl0LXAxOiBhZGQgZHJpdmVy
IGZvciBwb3dlcm9mZi9yZWJvb3QKPiA+ID4gPiA+ID4gPiAgICAgICBjb21taXQ6IDI4MTI0Y2Mw
ZmI4YzdkYzAxYTY4MzRkMjI3MzUxZTI1ZDlhOTJjNTgKPiA+ID4gPiA+ID4gU2hvdWxkIHdlIGFw
cGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0
Li4uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdoYXQgaXMgdGhlIGRlcGVuZGVuY3k/Cj4gPiA+ID4g
SSBwb2ludCBpdCBvdXQgYWJvdmUuCj4gPiA+ID4gV2l0aG91dCB0aGlzIHBhdGNoLCByZWJvb3Qg
YW5kIHNodXRkb3duIHdvdWxkIGVuZCB1cCBjYWxsaW5nIHRoZSBub24tYXRvbWljIGkyY190cmFu
c2Zlci4KPiA+ID4gCj4gPiA+IE9rYXksIHRoYW5rcy4gIEkgd2FzIG1vc3RseSBjaGVja2luZyB0
aGF0IHlvdSB3ZXJlbid0IHJlZmVycmluZyB0byB0aGUKPiA+ID4gTUZEIHBhdGNoLCB3aGljaCBk
b2Vzbid0IHJlcHJlc2VudCBhIHRydWUgZGVwZW5kZW5jeS4KPiA+IAo+ID4gVG8gc2F2ZSBTZWJh
c3RpYW4gc29tZSB0cm91YmxlLCBsZXQncyBrZWVwIHRoZSByZWJvb3QgcGF0Y2ggYXBwbGllZC4K
PiA+IAo+ID4gSSdsbCBob2xkIG9mZiBvbiB0aGUgTUZEIG9uZSwgd2hpY2ggd2lsbCBlbnN1cmUg
dGhhdCByZWJvb3QgaXNuJ3QgcHJvYmVkLgo+ID4gCj4gPiBMZXQgbWUga25vdyB3aGVuIHRoZSBk
ZXAgaXMgbWVyZ2VkIGFuZCBJJ2xsIGhvb3ZlciB1cCB0aGUgcmVzdCBvZiB0aGUgc2V0Lgo+IAo+
IFRoZSBkZXBlbmRlbmN5IGlzIHN0aWxsIG5vdCB5ZXQgbWVyZ2VkLCBhbHRob3VnaCBpdCBoYXMg
YmVlbiByZWFkeSBmb3IgCj4gd2Vla3MsIGFuZCBJIGFtIGp1c3QgY3Jvc3NpbmcgZmluZ2VycyB0
aGF0IGl0IHdpbGwgZ2V0IHBpY2tlZC11cCBmb3IKPiBmb3IgNy4xLgo+IAo+IFRoYXQgc2FpZCBp
dCdzIG5vdCBhIGhhcmQgZGVwZW5kZW5jeSwgaW4gbW9zdCBjYXNlcyByZWJvb3Qgd2lsbCB3b3Jr
LCAKPiB3aGljaCBpcyBhbiBpbXByb3ZlbWVudCBvdmVyIG5vIHJlYm9vdCBkcml2ZXIuIFRoZSBt
aXNzaW5nIEkyQyBQSU8gCj4gcGF0Y2hlcyBhcmUganVzdCB0aGVyZSB0byBtYWtlIGl0IHJlbGlh
YmxlLgo+IAo+IFRoZXJlZm9yZSBnaXZlbiB0aGUgNy4xIG1lcmdlIHdpbmRvdyBhcHByb2FjaGlu
ZywgSSBiZWxpZXZlIGl0J3MgYmV0dGVyIAo+IHRvIG1lcmdlIHRoaXMgc2ltcGxlIE1GRCBwYXRj
aCBhbmQgdG8gbm90IHdhaXQgbW9yZS4KCkl0J3MgdG9vIGxhdGUgZm9yIHY3LjEgbm93LgoKSSB0
aGluayB0aGlzIHNldCBoYXMgYmVlbiB3ZWxsIGFuZCB0cnVseSBmb3Jnb3R0ZW4uCgpQbGVhc2Ug
cmViYXNlIGFuZCBzdWJtaXQgYSBbUkVTRU5EXSB3aXRoIHRoZSBpbmZvIGluIHRoZSBjb3ZlciBs
ZXR0ZXIuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
