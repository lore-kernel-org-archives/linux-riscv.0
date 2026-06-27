Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C40AC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AriAiAlwI6CKDwQfwlKOevg+ViKXop6UwNfnXSYMCuk=; b=iVvvkJ5J/J17vM
	oNkyY+PyUfy1kDX6z46ROWEF8MshfF6nh89XCU2ke53xPkn23m9js6vWVEvIGXpU3ML+qwoT8Dnfe
	5zGsFkyH6Z0aEp6kgYkjTV2iLnIY6gjSFJeWTGD60tUhEDqkzg/UvkrCSfvzTpK823GaEyLl/CjRx
	YXooEKUC+gfRS2tOYwGyUxtXw6p7+hAga7CNXGDKLjP8ukDoI7i0ZfAkZ1lgozzPXOJjK9aTPMuTF
	p15YNtG1Lye0g9ClHfsW+LOFzP+Cm4NOnjlBJEHcj3Uyl8TUOJUgBZ8K4VpJQPFHu+GJufg7Gdkah
	L5RTCLlzRyYbEq79qZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaTU-0000000ClpG-0iFu;
	Sat, 27 Jun 2026 21:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaTS-0000000Clp8-3Kzu
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 21:22:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C166008A;
	Sat, 27 Jun 2026 21:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C3C1F000E9;
	Sat, 27 Jun 2026 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782595320;
	bh=Bcf86Hzsw/x7zxg/mG4FuMFcMosZF81My9ebts7C9Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CTcZyUvM1WqqdEtdr8HrkviG3NtbpPcdxP47O3QVTacavefegL7LP8NkHspwoFLfL
	 T8a4v2JX7sIJn4HOPhOZASVjttgmPzFsahuUoF86QaYBWsEk1sSo4fJ/SG2dIpYd6p
	 +pz2SmAI2INhq96GbGD7lJUah2mxAVBEZpSAYNPMOJ7fb8Q2SeeA4xf1H3vypuYk1Z
	 SYBbVPQQ1IfbyMoUo6X+QmblfYx8X9AVqsFVZLUGlajPhmRbxFSE62cfdMcdKMxNeF
	 /tK6duY4N5hrKCjUZlBDr6Y7cameZE9PSYnvNwn48iqGWSxxARkVHsqqsfOWARFZd2
	 bB3qj15cXuR3Q==
Date: Sat, 27 Jun 2026 14:21:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v2 3/8] riscv: Add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <akA+95cvpOPc2XOG@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
 <CAEEQ3w=ZLnW-Wz_=PcUQTN8q0wxUq1_epCs0B+v=sSug+OHD=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=ZLnW-Wz_=PcUQTN8q0wxUq1_epCs0B+v=sSug+OHD=Q@mail.gmail.com>
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

T24gU2F0LCBKdW4gMjcsIDIwMjYgYXQgMDU6MTE6MTFQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAoKSGksIHRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgo+IAo+IE9uIFRodSwg
SnVuIDI1LCAyMDI2IGF0IDk6NDDigK9BTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBzcm1jZmcgQ1NSIGRlZmluZWQg
aW4gdGhlIFNzcW9zaWQgSVNBIGV4dGVuc2lvbi4KPiA+IFRoZSBDU1IgY29udGFpbnMgdHdvIGZp
ZWxkczoKPiA+Cj4gPiAgIC0gUmVzb3VyY2UgQ29udHJvbCBJRCAoUkNJRCkgZm9yIHJlc291cmNl
IGFsbG9jYXRpb24KPiA+ICAgLSBNb25pdG9yaW5nIENvdW50ZXIgSUQgKE1DSUQpIGZvciB0cmFj
a2luZyByZXNvdXJjZSB1c2FnZQo+ID4KPiA+IFJlcXVlc3RzIGZyb20gYSBoYXJ0IHRvIHNoYXJl
ZCByZXNvdXJjZXMgYXJlIHRhZ2dlZCB3aXRoIHRoZXNlIElEcywKPiA+IGFsbG93aW5nIHJlc291
cmNlIHVzYWdlIHRvIGJlIGFzc29jaWF0ZWQgd2l0aCB0aGUgcnVubmluZyB0YXNrLgo+ID4KPiA+
IEFkZCBhIHNybWNmZyBmaWVsZCB0byB0aHJlYWRfc3RydWN0IHdpdGggdGhlIHNhbWUgZm9ybWF0
IGFzIHRoZSBDU1Igc28KPiA+IHRoZSBzY2hlZHVsZXIgY2FuIHNldCB0aGUgUkNJRCBhbmQgTUNJ
RCBmb3IgZWFjaCB0YXNrIG9uIGNvbnRleHQKPiA+IHN3aXRjaC4gQSBwZXItY3B1IGNwdV9zcm1j
ZmcgdmFyaWFibGUgbWlycm9ycyB0aGUgQ1NSIHN0YXRlIHRvIGF2b2lkCj4gPiByZWR1bmRhbnQg
d3JpdGVzLiBMMUQtaG90IG1lbW9yeSBhY2Nlc3MgaXMgZmFzdGVyIHRoYW4gYSBDU1IgcmVhZCBh
bmQKPiA+IGF2b2lkcyB0cmFwcyB1bmRlciB2aXJ0dWFsaXphdGlvbi4KPiA+Cj4gPiBBIHBlci1j
cHUgY3B1X3NybWNmZ19kZWZhdWx0IGhvbGRzIHRoZSBkZWZhdWx0IHNybWNmZyBmb3IgZWFjaCBD
UFUgYXMKPiA+IHNldCBieSByZXNjdHJsIENQVSBncm91cCBhc3NpZ25tZW50LiBPbiBjb250ZXh0
IHN3aXRjaCwgUkNJRCBhbmQgTUNJRAo+ID4gaW5oZXJpdCBmcm9tIHRoZSBDUFUgZGVmYXVsdCBp
bmRlcGVuZGVudGx5OiBhIHRhc2sgd2hvc2UgdGhyZWFkIFJDSUQKPiA+IGZpZWxkIGlzIHplcm8g
dGFrZXMgdGhlIENQVSBkZWZhdWx0J3MgUkNJRCwgYW5kIGxpa2V3aXNlIGZvciBNQ0lELgo+ID4K
PiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zc3Fvc2lkL3JlbGVhc2Vz
L3RhZy92MS4wCj4gPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNwo+ID4gQ28t
ZGV2ZWxvcGVkLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IEtvcm5lbCBEdWzEmWJhIDxtaW5kYWxAc2VtaWhhbGYuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+ClsuLl0KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fvcy5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9xb3MuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmU5ZTFkNjlmMzc5N2JlNWY4OTc4NWE5
YjNhYTdkOWQ1MWM0NzZhOGEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcW9zLmgKWy4uXQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3N3aXRjaF90
b19zcm1jZmcoc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQo+ID4gK3sKWy4uXQo+ID4gKyAgICAg
ICBpZiAodGhyZWFkX3NybWNmZyAhPSBfX3RoaXNfY3B1X3JlYWQoY3B1X3NybWNmZykpIHsKPiA+
ICsgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAqIERyYWluIHN0b3JlcyBm
cm9tIHRoZSBvdXRnb2luZyB0YXNrIGJlZm9yZSB0aGUgQ1NSIHdyaXRlCj4gPiArICAgICAgICAg
ICAgICAgICogc28gdGhleSByZXRhaW4gdGhlIHByZXZpb3VzIFJDSUQvTUNJRCB0YWcgYXQgdGhl
IGNhY2hlCj4gPiArICAgICAgICAgICAgICAgICogaW50ZXJjb25uZWN0Lgo+ID4gKyAgICAgICAg
ICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgIFJJU0NWX0ZFTkNFKHJ3LCBvKTsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICBfX3RoaXNfY3B1X3dyaXRlKGNwdV9zcm1jZmcsIHRocmVhZF9z
cm1jZmcpOwo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1JNQ0ZHLCB0aHJlYWRf
c3JtY2ZnKTsKPiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAqIE9y
ZGVyIHRoZSBjc3J3IGJlZm9yZSB0aGUgbmV3IHRhc2sncyBsb2Fkcy9zdG9yZXMgc28gdGhleQo+
ID4gKyAgICAgICAgICAgICAgICAqIHBpY2sgdXAgdGhlIG5ldyB0YWcuIFppY3NyIDYuMS4xIG1h
a2VzIENTUiB3cml0ZXMgd2Vha2x5Cj4gPiArICAgICAgICAgICAgICAgICogb3JkZXJlZCAoZGV2
aWNlLW91dHB1dCkgdnMgbWVtb3J5IG9wcy4gU3Nxb3NpZCB2MS4wIGlzCj4gPiArICAgICAgICAg
ICAgICAgICogc2lsZW50IHNvIGhvbm9yIHRoZSBnZW5lcmFsIENTUiBydWxlLgo+ID4gKyAgICAg
ICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgIFJJU0NWX0ZFTkNFKG8sIHJ3KTsKPiAK
PiBUaGlzIGlzIGluIHRoZSBjb250ZXh0LXN3aXRjaCBwYXRoIGFuZCBtYXkgYmUgZXhwZW5zaXZl
IGluIHByYWN0aWNlLiBFdmVuIGlmCj4gdGhlIHRhcmdldCB3b3JrbG9hZCBpcyBwaW5uZWQgYW5k
IGdyb3VwZWQsIHVucGlubmVkL2RlZmF1bHQtZ3JvdXAgdGFza3Mgb3IKPiBrd29ya2VycyBtYXkg
c3RpbGwgcnVuIG9uIHRob3NlIENQVXMsIGNhdXNpbmcgZnJlcXVlbnQgU1JNQ0ZHIHRyYW5zaXRp
b25zIGFuZAo+IHBheWluZyB0d28gZmVuY2VzIGVhY2ggdGltZS4KPiAKPiBJcyB0aGlzIHN0cmlj
dCBvcmRlcmluZyByZXF1aXJlZCBieSB0aGUgU3Nxb3NpZCBzcGVjIG9yIGtub3duIGhhcmR3YXJl
PyBJZgo+IG5vdCwgY2FuIHdlIG1ha2UgdGhpcyBhIHRyYWRlLW9mZiBhbmQgYXZvaWQgdGhlIGZl
bmNlcyBieSBkZWZhdWx0LCBhY2NlcHRpbmcgYQo+IHNtYWxsIFFvUy10YWdnaW5nIGluYWNjdXJh
Y3kgYXJvdW5kIHRoZSBjb250ZXh0LXN3aXRjaCBib3VuZGFyeT8KClRoZXNlIGZlbmNlcyB3ZXJl
IGludHJvZHVjZWQgYmFzZWQgb24gU2FzaGlrbyBmZWVkYmFjayBvbiB0aGUgUkZDCnNlcmllcy4g
WW91IG1ha2UgYSBnb29kIHBvaW50IHRoYXQgdGhpcyBtYXkgYmUgdG9vIGNvbnNlcnZhdGl2ZSBh
bmQgc29tZQppbmFjY3VyYWN5IHByb2JhYmx5IHdvdWxkIGJlIGFjY2VwdGFibGUuIEkgd291bGQg
YmUgb2theSB3aXRoIGRyb3BwaW5nCnRoZW0sIGFuZCB3ZSBjYW4gcmVldmFsdWF0ZSBvbmNlIG1v
cmUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zIHdpdGgKU3Nxb3NpZCBiZWNvbWUgcHVibGljLgoK
VGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
