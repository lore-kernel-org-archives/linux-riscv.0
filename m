Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE6BC98338
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWvVvoxAJpUIr3oX89D0wiNd9c0DqNdq3XMcfmdqerE=; b=F8yJY6TIzMOgky
	r6YWaGZAwOOAxBsXaxBFcIdvFIxX2pBtYlhSYQkUzqPWa3XiYUnHWDgdVPCDx57rFz5B3lRq1fu+C
	P/h7p7ZTPR1p68R6Rxps8yyy1UWEsJzV539sdctGfzDYmq4Nu7Hrjvc8OaoeSRuqMpjCZP5NgWd/5
	SzI2SVhG13seW/IsooSPeY1RzUDOxfz3aFIYi2Zd7IVNDK+awJFyULGtMgd14YjO/Z0oRIt8vv+uF
	xveY4w5AMF8c9lZs4Ktdr2va7Bj0PeBLyu8G7glojcDb0At5gGYdyRbLfVBjnwwF5bdfyGX4/J9cB
	JkvBI1sIaoEPsdLp3bSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwGQ-0000000GsnQ-3CKF;
	Sun, 27 Sep 2026 21:18:26 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwGO-0000000Gsmy-0rSW
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 21:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=33MsHDwPKKkx+NSkez8Et2HM/X24ivhJAbyLs8SiZQw=; b=Si+XEBRscLmCml1/lRIrfwcH5M
	MI5OhSA8PoN9qtCZVS0OgnoqsdinGm8UdpAQNxfzwsjI4EfN9YT0h+y17f0At4B/LNVR9LKnEBSA6
	LcQeQHdxqns41n5OIv3N6Trf3N746CDPoRex/acXy7we9vM5BT4z6g8+PZzlVsnI+TXNT1JpgOtM2
	dA7pJbAweyePTZAp3mffCHHkpcItFPZo+Lc76jVbO0giudX8S8Oc/0KKeuphZ56sv9zyyFZOXLHTo
	3g8x9N22+VhD2ICCCFy20VaJMi4mO0Kdm4w8SYMvHuOpdPR6bbkB+fu2qAWuKd8X+cSn4InqCbxr6
	GviGGnfg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xAwGC-0000000DQ9b-0cFC;
	Sun, 27 Sep 2026 23:18:12 +0200
Date: Sun, 27 Sep 2026 23:18:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <armIExWjR43ar50t@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
 <20260831044540.3304350-2-aurelien@aurel32.net>
 <20260831045448.58B591F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831045448.58B591F000E9@smtp.kernel.org>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141824_249196_43790A95 
X-CRM114-Status: GOOD (  14.97  )
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

SGksCgpPbiAyMDI2LTA4LTMxIDA0OjU0LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOgo+
IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0xvd10gUmVtb3ZpbmcgJ3Bo
eXMnIGFuZCAncGh5LW5hbWVzJyBmcm9tIHRoZSBiYXNlIGszLmR0c2kgYnJlYWtzIERUIHNjaGVt
YSB2YWxpZGF0aW9uIChkdGJzX2NoZWNrKSBmb3IgZGlzYWJsZWQgbm9kZXMgYW5kIGltcHJvcGVy
bHkgZGVsZWdhdGVzIGZpeGVkIFNvQyByb3V0aW5nIHRvIGJvYXJkIGZpbGVzLgo+IC0tCj4gCj4g
Y29tbWl0IGU5ZGM3YWQ5MmQ1ZjRhODA1Y2YzNjJmZGQ1MWM2YWUxNjBkYTE5MzQKPiBBdXRob3I6
IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiAKPiByaXNjdjogZHRzOiBz
cGFjZW1pdDogazM6IG1vdmUgVVNCMyBwaHkgdG8gYm9hcmQgbGV2ZWwKPiAKPiBUaGlzIGNvbW1p
dCBtb3ZlcyB0aGUgVVNCMyBwaHkgZGVmaW5pdGlvbnMgZnJvbSB0aGUgU29DIGR0c2kgdG8gdGhl
IGJvYXJkCj4gbGV2ZWwgZHRzIGZpbGVzIGZvciB0aGUgU3BhY2VtaVQgSzMgU29DLiBJdCBhaW1z
IHRvIHByZXZlbnQgUEhZIG1vZGUKPiBjb25maWd1cmF0aW9uIGVycm9ycyB3aGVuIHRoZSBjb21i
byBQSFkgbGluZXMgYXJlIHVzZWQgZm9yIFBDSWUgcmF0aGVyIHRoYW4KPiBVU0IzLgo+IAo+IFsg
Li4uIF0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kKPiA+IGluZGV4IGMzZjJk
Y2UwOTY5YzAuLjZmOGQ1NWVhZTZmNmIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2szLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazMuZHRzaQo+ID4gQEAgLTQ1Miw5ICs0NTIsNiBAQCB1c2IzZDogdXNiQDgxYTAwMDAwIHsK
PiA+ICAJCQkJIDwmc3lzY29uX2FwbXUgUkVTRVRfQVBNVV9VU0IzX0RfVkNDPiwKPiA+ICAJCQkJ
IDwmc3lzY29uX2FwbXUgUkVTRVRfQVBNVV9VU0IzX0RfUEhZPjsKPiA+ICAJCQlyZXNldC1uYW1l
cyA9ICJhaGIiLCAidmNjIiwgInBoeSI7Cj4gPiAtCQkJcGh5cyA9IDwmdXNiM2RfdTJwaHk+LAo+
ID4gLQkJCSAgICAgICA8JmNvbWJvcGh5IDQgUEhZX1RZUEVfVVNCMz47Cj4gPiAtCQkJcGh5LW5h
bWVzID0gInVzYjItcGh5IiwgInVzYjMtcGh5IjsKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBEb2Vz
IHJlbW92aW5nIHBoeXMgYW5kIHBoeS1uYW1lcyBmcm9tIHRoZSBiYXNlIGszLmR0c2kgYnJlYWsg
RFQgc2NoZW1hCj4gdmFsaWRhdGlvbiAoZHRic19jaGVjaykgZm9yIGRpc2FibGVkIG5vZGVzPwoK
Tm8gaXQgZG9lc24ndC4gZHRic19jaGVjayBzZWVtcyB0byBpZ25vcmUgZGlzYWJsZWQgbm9kZXMu
Cgo+IFRvIHNhdGlzZnkgdGhlIHNjaGVtYSdzIG1pbkl0ZW1zOiAxIHJlcXVpcmVtZW50IHdoaWxl
IHN1cHBvcnRpbmcgYm9hcmQtbGV2ZWwKPiBjb21ibyBQSFkgY29uZmlndXJhdGlvbiwgc2hvdWxk
IHRoZSBkZWRpY2F0ZWQgaW50ZXJuYWwgU29DIFBIWSAodXNiM2RfdTJwaHkpCj4gaGF2ZSBiZWVu
IHJldGFpbmVkIGluIHRoZSBiYXNlIGZpbGU/Cj4gCj4gVGhlIGR0YnNfY2hlY2sgdmFsaWRhdGlv
biB3aWxsIGZhaWwgZm9yIGFueSBib2FyZCBEVCB0aGF0IGluY2x1ZGVzIGszLmR0c2kKPiBidXQg
ZG9lcyBub3Qgb3ZlcnJpZGUgdGhlIHVzYjNkIG5vZGUgdG8gcHJvdmlkZSB0aGUgcGh5cyBhbmQg
cGh5LW5hbWVzCj4gcHJvcGVydGllcyAoZS5nLiwgazMtY29tMjYwLWlmeC5kdHMgYW5kIGszLWRl
ZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzKS4KCkkgaGF2ZSBqdXN0IHRyaWVkLCBpbiBwcmFjdGlj
ZSBpdCBkb2Vzbid0LiBJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiAKbWVudGlvbmluZyB0aGF0LgoK
PiBUaGlzIGhhcHBlbnMgYmVjYXVzZSB0aGUgc2NoZW1hIHNwYWNlbWl0LGsxLWR3YzMueWFtbCB1
bmNvbmRpdGlvbmFsbHkKPiByZXF1aXJlcyB0aGVzZSBwcm9wZXJ0aWVzLCBhbmQgZHQtc2NoZW1h
IGV2YWx1YXRlcyBhbGwgbm9kZXMsIGV2ZW4gZGlzYWJsZWQKPiBvbmVzLgo+IAo+ID4gIAkJCXBo
eV90eXBlID0gInV0bWkiOwo+ID4gIAkJCXNucHMsZGlzX2VuYmxzbHBtX3F1aXJrOwo+ID4gIAkJ
CXNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsKPiAKPiAtLSAKPiBTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MzEwNDQ1NDAuMzMwNDM1MC0x
LWF1cmVsaWVuQGF1cmVsMzIubmV0P3BhcnQ9MQo+IAoKLS0gCkF1cmVsaWVuIEphcm5vICAgICAg
ICAgICAgICAgICAgICAgICAgICBHUEc6IDQwOTZSLzFEREQ4QzlCCmF1cmVsaWVuQGF1cmVsMzIu
bmV0ICAgICAgICAgICAgICAgICAgICAgaHR0cDovL2F1cmVsMzIubmV0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
