Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2BD3E195
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HTOMxHbMNQPcoKneLNNs5GbZjNiYjTNnaASXwixo5c=; b=bPKgy+oTSZx2FZ
	URgSMdZI6nWLAPioJDv+tpE6qLyeTc6qZscEFdNSttvB8PyXD0TW135F69pG0dNjYpatloYSSXeIH
	r+NQ4ypBMsNJ7j/f4JO9KkNqMGKriCe4AqdfcnYtteVxSk2gfrtddabxxldCMpH8UaLe5sQKdthqS
	/9Ta+2avYSL0hd10t/xHRfbpjPav6keJ8pkQHsrIk9SOH7pUeUiz5abAgGMjy55Rp5g77fI9YPg7N
	OrVBlmIKQ4wCGyFmSA6e/PqquanCesNpb6OxKlXvhmhIfZFXf0u8DlfJzvzl++btOLShAlwIrJ/PP
	jePRaVWrD3ZeXvpGS+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1wfw-00000002HaY-2StT;
	Fri, 18 Oct 2024 23:46:32 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1wft-00000002Ha8-0rnX
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 23:46:31 +0000
Date: Sat, 19 Oct 2024 07:46:15 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20241018234615-GYA2124001@gentoo>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
 <mhng-5bc45db9-5deb-4db6-8733-561768b2968c@palmer-ri-x1c9>
 <20240917-spoilage-nimble-a8303fd04482@squawk>
 <20241018-drapery-stable-cc31a97cda90@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018-drapery-stable-cc31a97cda90@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_164629_298397_7BD41E16 
X-CRM114-Status: GOOD (  23.52  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org, Troy Mitchell <troymitchell988@gmail.com>, anup@brainfault.org, matthias.bgg@kernel.org, kevin.z.m@hotmail.com, linux-kernel@vger.kernel.org, Jesse T <mr.bossman075@gmail.com>, samuel.holland@sifive.com, cyy@cyyself.name, Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, inochiama@outlook.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, zhangmeng.kevin@spacemit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3I6CgpPbiAxODoyNCBGcmkgMTggT2N0ICAgICAsIENvbm9yIERvb2xleSB3cm90ZToK
PiBPbiBUdWUsIFNlcCAxNywgMjAyNCBhdCAxMDowODowM1BNICswMTAwLCBDb25vciBEb29sZXkg
d3JvdGU6Cj4gPiBJbiBvdGhlciBuZXdzLCBub2JvZHkgaGFzIHJlYWxseSBtYWRlIGFuICJvZmZp
Y2lhbCIgc3RhdGVtZW50IGFib3V0IHdobwo+ID4gaXMgZ29pbmcgdG8gbWFpbnRhaW4gdGhpcyBw
YXJ0aWN1bGFyIHBsYXRmb3JtLiBQZW9wbGUgaGF2ZSBleHByZXNzZWQKPiA+IGludGVyZXN0IChp
bmNsdWRpbmcgdGhlIHN1Ym1pdHRlciBvZiB0aGUgc2VyaWVzLCBJSVJDKSBidXQgdGhlcmUncyBu
bwo+ID4gTUFJTlRBSU5FUlMgZW50cnkgYWRkZWQgaGVyZSBBRkFJQ1QuIEkgdXNlZCB0byBoYXZl
IGFuIGVudHJ5IHRoYXQKPiA+IGNvdmVyZWQgYXJjaC9yaXNjdi9ib290L2R0cy8qLCB3aXRoIGV4
Y2x1c2lvbnMgZm9yIHN1bnhpIGFuZCByZW5lc2FzLAo+ID4gYnV0IHdpdGggRHJldyB0YWtpbmcg
b24gdGhlYWQgYW5kIHNvcGhnbyBiZWluZyB0aGUgcmVz44G9b25zaWJpbGl0eSBvZgo+ID4gQ2hl
biBXYW5nIGFuZCBJbm9jaGksIEkgbm8gbG9uZ2VyIGhhdmUgdGhhdCB3aWxkY2FyZC4KPiA+IAo+
ID4gSSdtIGhhcHB5IHRvIGFwcGx5IHBhdGNoZXMgZm9yIHRoZSBwbGF0Zm9ybSBpZiBub29uZSBl
bHNlIGlzIGludGVyZXN0ZWQKPiA+IGluIHRoYXQgc2lkZSBvZiB0aGluZ3MsIHByb3ZpZGVkIHRo
ZXJlIGFyZSB3aWxsaW5nIHJldmlld2VycywgYnV0IEkKPiA+IHdvdWxkIG11Y2ggcmF0aGVyIHRo
YXQgc29tZW9uZSBlbHNlIHRvb2sgdXAgdGhlIHJlc3BvbnNpYmlsaXR5IG9mCj4gPiBhcHBseWlu
ZyBwYXRjaGVzIGFuZCBzZW5kaW5nIFBScyAtIGFuZCBvZiBjb3Vyc2UgSSBhbSBoYXBweSB0byBo
ZWxwCj4gPiB3aG9ldmVyIHRoYXQgaXMgd2l0aCB0aGUgcHJvY2Vzcy4KPiAKPiBPbiBzZWNvbmQg
dGhvdWdodHMgKGFuZCBvbiBhIHNlY29uZCBvcGluaW9uKSBJIGFtIG5vdCBhY3R1YWxseSB3aWxs
aW5nCj4gdG8gYXBwbHkgcGF0Y2hlcyBmb3IgdGhpcyBwbGF0Zm9ybSwgc2luY2UgaXQgaXNuJ3Qg
c3VzdGFpbmFibGUgdG8gdGFrZQo+IG9uIGVhY2ggYW5kIGV2ZXJ5IHBsYXRmb3JtIHRoYXQgdGhl
cmUncyBubyBtYWludGFpbmVyIGZvci4KPiAKT2ssIEkgZnVsbHkgdW5kZXJzdGFuZCB5b3VyIGNv
bmNlcm4uLgoKPiArQ0MgYSBmZXcgbW9yZSBwZW9wbGUgdGhhdCBoYXZlIGJlZW4gaW52b2x2ZWQg
aW4gdGhlIHBsYXRmb3JtLgo+IAo+IFlpeHVuIExhbiwgeW91J3JlIGtpbmRhIHRoZSAicHJpbWUi
IHBlcnNvbiB0byBtYWludGFpbiB0aGUgcGxhdGZvcm0KPiBzaW5jZSB5b3UncmUgdGhlIG9uZSB3
aG8gdG9vayB1cCB0aGUgY29yZSBzdXBwb3J0IHdvcmsgZXRjLiBJcwo+IG1haW50YWluaW5nIHRo
ZSBwbGF0Zm9ybSwgbWF5YmUgd2l0aCB0aGUgaGVscCBvZiBvbmUgb2YgdGhlIG90aGVyIGZvbGtz
Cj4gd29ya2luZyBvbiBpdCBzb21ldGhpbmcgeW91IGNhbiBkbz8KPiAKVGhhdCB3b3VsZCBiZSBz
d2VldCwgeWVzLCBJIGNhbiB0YWtlIHRoZSBtYWludGFpbmVyIHJlc3BvbnNpYml0bHkgZm9yIG5v
dwpidXQsIEknbSBvcGVuIGlmIHNvbWVvbmUgZWxzZSB3aWxsaW5nIHRvIGhlbHAgYW5kIGNvLW1h
aW50YWluLi4KCj4gTW9zdGx5IHRoZSByZXNwb25zaWJpbGl0aWVzIGFyZSBqdXN0IGFwcGx5aW5n
IHBhdGNoZXMgZm9yIGZpeGVzL25ldwo+IGNvbnRlbnQgYW5kIHNlbmRpbmcgUFJzIHRvIHRoZSBz
b2MgbWFpbnRhaW5lcnMgLSBidXQga25vd2luZyB3aGF0J3MKPiByaWdodCBvciBub3Qgb2J2aW91
c2x5IHJlcXVpcmVzIGZhbWlsaWFyaXR5IHdpdGggdGhlIHBsYXRmb3JtIHdoaWNoCj4gcGVvcGxl
IHRoYXQgd29yayBvbiBpdCBhcmUgYmVzdCBwbGFjZWQgdG8gZG8uIE15c2VsZiBhbmQgdGhlIHNv
Ywo+IG1haW50YWluZXJzIHdpbGwgaGVscCBpZiB3aG9ldmVyIGRvZXMgdGhpcyBydW5zIGludG8g
YW55IHRyb3VibGUuCj4gVGhlcmUgaXMgc29tZSBkb2N1bWVudGF0aW9uIGhlcmUgaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9tYWludGFpbmVyLXNvYy5odG1sCj4gdGhhdCB3aWxsIGFz
c2lzdCBzb21ld2hhdCB3aXRoIGdldHRpbmcgdXAgdG8gc3BlZWQgd2l0aCB0aGUgcHJvY2Vzcwo+
IGFsc28uCj4gCkdyZWF0LCB0aGFua3MgZm9yIHRoZSBpbmZvCj4gQ2hlZXJzLAo+IENvbm9yLgoK
bGFzdCwgb25lIHF1ZXN0aW9uIEknZCByYWlzZToKCmZvciB0aGlzIHBhcnRpY3VsYXIgcGF0Y2gg
c2VyaWVzLCBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIGFub3RoZXIgdmVyc2lvbiB2Ngp3aGljaCBj
YW4gdXBkYXRlIHRoZSBNQUlOVEFJTkVSUyBmaWxlIChub3RoaW5nIGNoYW5nZWQgd2l0aCB0aGUg
Y29kZSkKCi0tIApZaXh1biBMYW4gKGRsYW4pCkdlbnRvbyBMaW51eCBEZXZlbG9wZXIKR1BHIEtl
eSBJRCBBQUJFRkQ1NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
