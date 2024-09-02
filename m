Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B64CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrYzR6iwLBozX2zk6Ye061Y/soSJc5+s0LwrQ0mD+0c=; b=nzMVF8cMAZnCTe
	OMQcuJ7Hsn+zyvU+RHs5vpcsYxUiF/fYfDX9y1obvZwAC3DqHMPp6g4fctPYqwkamo2V72VCSoLJ1
	9DScPWHj1xkQmqOhl5wVmRo+RgFd1nVEMU9K+vzgJQwzvaE31qcAf3AOL84HXAFg/PRaw1/+Vz+b2
	rQ0AUg/v/KL7KRy5SxsOPddc8vFqU2SkUhPIwiRbvTQE2mEwuJyUjUJEo9gDaicHlvY6gcOS7+y1Q
	CXW/XICRm0FlEZGraH8l1S0tUsT/me30TwitBNX7TcVPw7DLWxWn82UvCX1/me9gxsJOwamJwCVSG
	dxLgnFSIABtdGIqz36jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Gv-0000000Eu7h-2SP3;
	Mon, 02 Sep 2024 15:47:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Gs-0000000Eu7G-2pMP
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 15:47:16 +0000
Date: Mon, 2 Sep 2024 15:47:02 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20240902154702-GYA840562@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
 <CACRpkdZLdbKr41yXg6ETM6ANCD+Rbd_tnz0hQ0NyU9oRXR+PnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZLdbKr41yXg6ETM6ANCD+Rbd_tnz0hQ0NyU9oRXR+PnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_084714_760528_A755CF5B 
X-CRM114-Status: GOOD (  29.85  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGludXM6CgpPbiAwOTo1NyBNb24gMDIgU2VwICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gSGkgWWl4dW4sCj4gCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoISBPdmVyYWxsIHRoZSBkcml2
ZXIgbG9va3MgdmVyeSBnb29kLCBpdCdzIHVzaW5nIHRoZQo+IHJpZ2h0IGhlbHBlcnMgYW5kIGFi
c3RyYWN0aW9ucyBldGMuCj4gCj4gVGhlcmUgaXMgdGhpcyB0aGluZyB0aGF0IG5lZWRzIHNvbWUg
ZWxhYm9yYXRpb246Cj4gCj4gT24gV2VkLCBBdWcgMjgsIDIwMjQgYXQgMTozMeKAr1BNIFlpeHVu
IExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiAKPiA+ICsvKiBwaW4gb2Zmc2V0ICovCj4g
PiArI2RlZmluZSBQSU5JRCh4KSAgICAgICAoKHgpICsgMSkKPiA+ICsKPiA+ICsjZGVmaW5lIEdQ
SU9fSU5WQUwgIDAKPiA+ICsjZGVmaW5lIEdQSU9fMDAgICAgIFBJTklEKDApCj4gPiArI2RlZmlu
ZSBHUElPXzAxICAgICBQSU5JRCgxKQo+ICguLi4pCj4gCj4gU28gR1BJTyAwMCBoYXMgcGluIElE
IDEgYWN0dWFsbHkgZXRjLgo+IAp5ZXMsIGluIGN1cnJlbnQgdmVyc2lvbgoKPiBCdXQgd2h5Pwo+
IApnb29kIHF1ZXN0aW9uIQoKZnJvbSBodyBwZXJzcGVjdGl2ZSwgdGhlIEdQSU9fMDAgcGluY3Ry
bCByZWdpc3RlciBzdGFydCBhdCBvZmZzZXQgMHg0LApzZWUgY2hhcCAzLjMuMSBvZiAiUGluIElu
Zm9ybWF0aW9uIiBzZWN0aW9uIGF0IFsxXQoKYW5kIGluIHRoaXMgdmVyc2lvbiBvZiBwYXRjaCwg
d2UgYXJlIGV4dHJhY3RpbmcgcGluaWQgZnJvbSByZWdpc3RlciBvZmZzZXQsCnVzaW5nIHRoZSBh
bGdvcml0aGVtIHBpbmlkID0gKG9mZnNldCA+PiAyKS4gdGhpcyBpZGVhIHdhcyBzb21ldGhpbmcg
SQpib3Jyb3dlZCBmcm9tIHZlbmRvcidzIGRyaXZlciwgYW5kIG5vdyB5b3UgcmVtaW5kIG1lIHRo
aXMgbWlnaHQgYmUgd3JvbmcuLgoKPiBJZiB0aGVyZSBpcyBubyBkYXRhc2hlZXQgb3Igb3RoZXIg
Y29uZmxpY3RpbmcgZG9jdW1lbnRhdGlvbiwganVzdAo+IGJlZ2luIG51bWJlcmluZyB0aGUgR1BJ
T3MgYXQgMSBpbnN0ZWFkIG9mIDAgdG8gbWF0Y2ggdGhlCj4gaGFyZHdhcmU6Cj4gCj4gI2RlZmlu
ZSBHUElPXzAxIDEKPiAjZGVmaW5lIEdQSU9fMDIgMgo+IAoKYXMgY3VycmVudCBwYXRjaCB2ZXJz
aW9uLCB0aGVyZSB3aWxsIGJlIHNvbWUgbm9uLWxpbmVhciBtYXBwaW5nLCBzdWNoIGFzCiNkZWZp
bmUgR1BJT185OCA5MwojZGVmaW5lIEdQSU9fOTkgOTIKLi4KI2RlZmluZSBHUElPXzExMCAxMTYK
Li4uCgpJIHRoaW5rIHdlIGNvdWxkIGZpeCB0aGlzIGJ5IGludHJvZHVjaW5nIGEgcGluaWRfdG9f
cmVnaXN0ZXJfb2Zmc2V0KCkgZnVuY3Rpb24sCndoaWNoIHNob3VsZCBkcm9wIHRoZSBwaW5pZCA9
IChvZmZzZXQgPj4gMikgbWFwcGluZywgYnV0IGluc3RlYWQsIGRvaW5nIGluIHRoZQpyZXZlcnNl
IHdheSwgcmV0cml2ZSByZWdpc3RlciBvZmZzZXQgZnJvbSBwaW5pZCwgc28gaWRlYWx5IHdlIHNo
b3VsZCBnZXQKYSBsaW5lYXIgbWFwcGluZyBvZiBHUElPIHRvIHBpbmlkLCBsaWtlCgojZGVmaW5l
IEdQSU9fMDAgMAojZGVmaW5lIEdQSU9fMDEgMQouLgojZGVmaW5lIEdQSU9fMTI3IDEyNwoKSSB3
aWxsIHdvcmsgdGhpcyBpbiBuZXh0IHBhdGNoIHZlcnNpb24uCgo+IGFuZCBhbGwgaXMgZmluZS4K
PiAKPiBJdCdzIGp1c3QgdmVyeSB1bmluaXR1aXRpdmUgZm9yIGRldmVsb3BlcnMuIEkgZ3Vlc3Mg
dGhhdCB0aGVyZQo+IGlzIGEgcmVhc29uLCBzdWNoIGFzIHRoYXQgdGhlIGRhdGFzaGVldCBoYXMg
c3RhdGVkIHRoYXQgdGhlIHBpbgo+IHdpdGggcGluIElEIDEgaXMgR1BJTyAwMCwgdGhlbiB0aGlz
IG5lZWRzIHRvIGJlIGV4cGxhaW5lZCB3aXRoCj4gYSBjb21tZW50IGluIHRoZSBjb2RlOiAid2Ug
YXJlIGRvaW5nIHRoaXMgYmVjYXVzZSBvdGhlcndpc2UKPiB0aGUgZGV2ZWxvcGVycyB3aWxsIHNl
ZSBhbiBvZmZzZXQgb2YgLTEgYmV0d2VlbiB0aGUgbnVtYmVyIHRoZQo+IHBpbiBoYXMgaW4gdGhl
IGRhdGFzaGVldCBhbmQgdGhlIG51bWJlciB0aGV5IHB1dCBpbnRvIHRoZQo+IGRldmljZSB0cmVl
LCB3aGlsZSB0aGUgaGFyZHdhcmUgc3RhcnRzIHRoZSBudW1iZXJpbmcgYXQgMSwgdGhlCj4gZG9j
dW1lbnRhdGlvbiBzdGFydHMgdGhlIG51bWJlcmluZyBhdCAwIi4KPiAKc2VlIGFib3ZlLCBhIHBv
dGVudGlhbCBzb2x1dGlvbiB0byBmaXggdGhpcwoKPiBJdCBpcyBjb21tb24gdGhhdCBlbmdpbmVl
cnMgZnJvbSBhbmFsb2cgZWxlY3Ryb25pY3MgYmFja2dyb3VuZAo+IHN0YXJ0IG51bWJlcmluZyB0
aGluZ3MgZnJvbSAxIHdoaWxlIGFueSBjb21wdXRlciBzY2llbmNlCj4gZW5naW5lZXIgc3RhcnQg
dGhlIG51bWJlcmluZyBhdCAwLiBTbyB0aGlzIGlzIHdoYXQgeW91IGdldCB3aGVuCj4gYW4gYW5h
bG9nIGVuZ2luZWVyIGRlc2lnbnMgdGhlIGVsZWN0cm9uaWNzIGFuZCBhIGNvbXB1dGVyCj4gc2Np
ZW5jZSBlbmdpbmVlciB3cml0ZXMgdGhhdCBkYXRhc2hlZXQgYW5kIGRlY2lkZXMgdG8gImZpeCIK
PiB0aGUgcHJvYmxlbS4KPiAKdHJ1ZSwgdGhpbmdzIGhhcHBlbnMsIHNvbWV0aW1lcyB0aGVyZSBp
cyBnYXAgaW4gdW5kZXJzdGFuZGluZyBiZXR3ZWVuCmFuYWxvZyBlbmdpbmVlcnMgYW5kIHNvZnR3
YXJlIGRldmVsb3BlcnMuLgoKTGluazogaHR0cHM6Ly9kZXZlbG9wZXIuc3BhY2VtaXQuY29tL2Rv
Y3VtZW50YXRpb24/dG9rZW49QW4xdndUd0thaWdhWFJrWWZ3bWN6blRYbmVkIFsxXQoKLS0gCllp
eHVuIExhbiAoZGxhbikKR2VudG9vIExpbnV4IERldmVsb3BlcgpHUEcgS2V5IElEIEFBQkVGRDU1
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
