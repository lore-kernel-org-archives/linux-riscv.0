Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F08606A33E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0umRLBLg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=HXT89uKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JbZwB7XYzoKMfQ83uJi2NXKehvIC5FQl0ScoGA0WDvI=; b=0umRLBLgss4VA7IjDityqPa/MZ
	pbgdMp8GpoZ6MhccIQe3HlUHcihjnyjZmky3IKWAYrfj5PGVElBEBGd6SRCD4RLIYfc2CPkdG5b5R
	2+TIe8AThO2QtCrzeZG55m7FZgpvfUBsBDrgSt17MJAMJwhqjsA6D2h5bOPOeigKNBkfWLM1Vt6Va
	C3qd+arNfc0V/lArFXJxpv4F/F9mp3kWoJpspYgEtXgIFXAY6dFt5fw5Dz77buduAipmccFMdZ5bf
	AHe7WbMHcSWszRfbh3a3jG0+frZX016X0A3TMFlssMKfo/T+QGWcyAEWs6g9mlED7TYaME3zv4WE4
	J4MPLaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV5B-0000000HCLX-0JFW;
	Sun, 15 Nov 2026 07:55:25 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV57-0000000HCL5-2yu0;
	Sun, 15 Nov 2026 07:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794729276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PzpbNvrjLiWmMMQpYIFs6kNtE5aAFPG95KjK5KvlXphkFJSQWxIkxHJ4ewsm4PYP3Mu0PpJusYSynaTno95IPepvJSuojmDTtnqDPrMUmq4G0/DTo6yfAJQOclFVYQvcm8r9jx8WmNHum1iqeQh818u9gkDKzaozdGAAGHtdC0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794729276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uLrkbNalekNKLkCB0XNj+22wcuzKD0fuIFqvheTwm3o=; 
	b=UY3QFzh2y8YKc6dOyLqCWIN0cb0Dg83WZRST7n5TKEVlzHkytkmluI80+r9b3AeVwHbIKNNmnJpUiRGJWOlG6Oq0XE7DX4O/OVg10DOFJm/HQlxdTTmMviT9RldpbxtRZK4bQjwZBY01n70Wg4cSQz26p/LS7DENhlA37eiS7S0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=HXT89uKDo45p/IEIvQZmTbsoA3f6lkwMkgKc83FYWPHSHvSS15qcZRoGwBJLRFlK3r88KFW6epg9hZH4+rukeSGfXRkgyl8GBU8U4o+d67P6qUoaL0v4Yb7iW8sEeP4dCB5mNz08q3mkik23j6b8f3x9/z9Dkdu91sV4nbhUU124g6M50i1ZHcaboD1mp9kVDGqn16XGZ+iuOyT5ZYmtQIVLzVE5ONA+HqL48LJIG0cJqY2hBYAiW7gg5VRq1n3xH9RaU8xdBXCa6d97Jg67wDJu+K4XcnskstUIPVU0vYe8dbOM1UW5DzEoRv1CsSaC6v3iV3GdQZsrqRdYtx57OQ==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=uLrkbNalekNKLkCB0XNj+22wcuzKD0fuIFqvheTwm3o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794728372584790.9071811696919;
	Sat, 14 Nov 2026 23:39:32 -0800 (PST)
Message-ID: <a6b616df57285440326043f5546affe9a64fd1ca.camel@icenowy.me>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861
 SoC
From: Icenowy Zheng <uwu@icenowy.me>
To: Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec@gmail.com>, 
	gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti	
 <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren	
 <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec	
 <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland	 <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, 	linux-csky@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Sun, 15 Nov 2026 15:39:17 +0800
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
	 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
	 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
	 <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_235521_790986_624379B0 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMTXml6XnmoQgMDg6MzIgKzAxMDDvvIxKZXJuZWogxaBrcmFiZWPlhpnpgZPv
vJoKPiBEbmUgbmVkZWxqYSwgMTUuIG5vdmVtYmVyIDIwMjYgb2IgMDY6MTE6MzEgU3JlZG5qZWV2
cm9wc2tpIHN0YW5kYXJkbmkKPiDEjWFzIGplIEljZW5vd3kgWmhlbmcgbmFwaXNhbChhKToKPiA+
IOWcqCAyMDI2LTExLTE05YWt55qEIDA2OjMzICswODAw77yMSGFuIEdhbyB2aWEgQjQgUmVsYXnl
hpnpgZPvvJoKPiA+ID4gRnJvbTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gPiAK
PiA+ID4gQWRkIG15c2VsZiBhcyBtYWludGFpbmVyIGZvciB0aGUgVjg2MSBiaW5kaW5ncywgY2xv
Y2sgYW5kIHBpbgo+ID4gPiBjb250cm9sCj4gPiA+IGRyaXZlcnMgYW5kIGRldmljZSB0cmVlcy4K
PiA+IAo+ID4gSSB0aGluayB0cmFkaXRpb25hbGx5IHN1bnhpIGRvIG5vdCBhZGQgbWFpbnRhaW5l
cnMgZm9yIHNwZWNpZmljCj4gPiBTb0NzLgo+ID4gCj4gPiBNYXliZSB5b3Ugc2hvdWxkIHBhdGNo
IHRoZSByZWdleHAgb2YgIkFSTS9BbGx3aW5uZXIgc3VuWGkgU29DCj4gPiBzdXBwb3J0Igo+ID4g
aXRlbSBpbnN0ZWFkLgo+IAo+IFVzdWFsbHkgbm8gZW50cmllcyBhcmUgYWRkZWQgYXQgYWxsLgo+
IAoKVGhlIE46IGNsYXVzZSBpbiAiQVJNL0FsbHdpbm5lciBzdW5YaSBTb0Mgc3VwcG9ydCIgY3Vy
cmVudGx5IG9ubHkKY29udGFpbnMgYHN1blsyNV0waWAgZm9yIHR3by1kaWdpdCBJRHMsIHNvIEkg
dGhpbmsgc3VuNTVpL3N1bjYwaSBpcwphbHNvIG5vdCBtYXRjaGVkIHlldD8KCkJUVyBhIHJhbmRv
bSB0aG91Z2h0OiBzaG91bGQgc3VuWGl3TiBiZSBhY2NlcHRlZCBuYW1lIG5vdz8gSSBmb3VuZCB0
aGF0CnFjb20gbm93IHNwZWFrcyBTb0MgY29kZW5hbWVzIChlLmcuIG5vcmQsIGtvZGlhaywgZXRj
KSBpbnN0ZWFkIG9mCm1hcmtldCBuYW1lcywgYW5kIHRoaXMgbWlnaHQgaGVscCBwcmUtbGF1bmNo
IG1haW5saW5pbmcgKHdlbGwsIGlmCkFsbHdpbm5lciwgb3IgYXQgbGVhc3Qgc29tZSBjb250cmFj
dG9yLCBpcyBnb2luZyB0byBkbyBpdC4uLikuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEplcm5lago+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBJY2Vub3d5Cj4gPiAKPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiA+
ID4gLS0tCj4gPiA+IMKgTUFJTlRBSU5FUlMgfCAxMiArKysrKysrKysrKysKPiA+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+ID4gaW5kZXggOTNhYmJiMzE1MDY1Li5kZmMzMDBk
YzFlYjIgMTAwNjQ0Cj4gPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiA+ICsrKyBiL01BSU5UQUlO
RVJTCj4gPiA+IEBAIC0yNDAzMSw2ICsyNDAzMSwxOCBAQCBGOglkcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWludGMuYwo+ID4gPiDCoEY6CWluY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1hcGxp
Yy5oCj4gPiA+IMKgRjoJaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+ID4g
wqAKPiA+ID4gK1JJU0MtViBBTExXSU5ORVIgVjg2MSBTb0MgU1VQUE9SVAo+ID4gPiArTToJSGFu
IEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gPiArTDoJbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4gPiArTDoJbGludXgtc3VueGlAbGlzdHMubGludXguZGV2Cj4gPiA+ICtT
OglNYWludGFpbmVkCj4gPiA+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYWxsd2lubmVyLHN1bjI1Mgo+ID4gPiBpLQo+ID4gPiB2ODYxLWNjdS55YW1sCj4gPiA+
ICtGOglhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yNTJpLXY4NjEqCj4gPiA+ICtG
Oglkcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuMjUyaS12ODYxKi5jCj4gPiA+ICtGOglkcml2
ZXJzL3BpbmN0cmwvc3VueGkvcGluY3RybC1zdW4yNTJpLXY4NjEqLmMKPiA+ID4gK0Y6CWluY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svc3VuMjUyaS12ODYxKi5oCj4gPiA+ICtGOglpbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L3N1bjI1Mmktdjg2MSouaAo+ID4gPiArCj4gPiA+IMKgUklTQy1WIEFO
REVTIFNvQyBTdXBwb3J0Cj4gPiA+IMKgTToJQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVz
dGVjaC5jb20+Cj4gPiA+IMKgUzoJTWFpbnRhaW5lZAo+ID4gCj4gPiAKPiAKPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
