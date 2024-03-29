Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5286ECD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 02:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJZX7uTxi5a0SVTeQGL2ZWU1QC4b+yjoauI3NQchQjU=; b=p1Tw8nQh9EnPfz
	B16tPG/4+bzfnh1eXdK0vcoaEiGPqr5RruvhnEqaQzNpxXAFLXL4N7yrvQ+035FgfVq4rX8dwYn6D
	cQLgU671ADgjhDO4P/gDJQcbFdIxyUQFpWqpgBvnfBeRusk/iLiUMdXhYxBGKvZs++ziMQhaFsUkr
	r3c1q7DeARERakw9NrRfxykuFHfsfhSW86P312KH7GpsMG2t5eW0j+NaO8pnKAzO1IC7oyUQhRxfN
	SGp398n19xpQds8O129VPeodLA9NAWCjWwpu8j5Xmpe6JompwCnaBOLK26DheR7QZfR4gXA1LGUtw
	39T9g8wLawK/UnEs0NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2Ed-0000000GZkN-3xKq;
	Fri, 29 Mar 2024 02:44:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2Ea-0000000GZjm-3n9Z
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 02:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2B55618A9;
	Fri, 29 Mar 2024 02:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86224C433C7;
	Fri, 29 Mar 2024 02:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711680287;
	bh=NsaG2fTktCpn6iX0GuW5RaElcG6IHu4jh7ScjLVF8VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAqOeYygA1B/WtOa6YPHZmLZAELGFuT1VJVR4kGLsOUHTnf7b6kCc05+fZJKOMQ18
	 FcgiCYmR82kP/dxuek6elAIa+OKD+wOkrMpXpQMhlyMVxVH3nT7jH4nsyhQa80aT1C
	 6Bnf73TWFDwyniCvJj7Po15caL0RgCUAIFZDWtaJQJqOqT+D+emfysUts+hSDqX34e
	 iFP7/F5P/5UZ5dZrvMewadj2MTMNZKyXlYhQFBLIFnJAaYPKErbozqy6YlXDp+BFFT
	 v9whr3xEV2wNFCwJAjSF7oYjYw9dQHIuYIxFPvyRkb5xUPF7dMosBVV92GVJAy7PiV
	 rSwSzlCYIJH7Q==
Date: Fri, 29 Mar 2024 10:31:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
Message-ID: <ZgYn9t4akccWuHyf@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
 <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_194449_168301_D1D87802 
X-CRM114-Status: GOOD (  31.37  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTA6Mjg6MjhQTSArMDEwMCwgSGVpbnJpY2ggU2NodWNo
YXJkdCB3cm90ZToKPiBPbiAyLzYvMjQgMjA6MTMsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDMxLCAyMDI0IGF0IDA5OjI2OjAwUE0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3Jv
dGU6Cj4gPiA+IFRoZSBNaWxrdiBNYXJzIGlzIGEgZGV2ZWxvcG1lbnQgYm9hcmQgYmFzZWQgb24g
dGhlIFN0YXJmaXZlIEpINzExMCBTb0MuCj4gPiA+IFRoZSBib2FyZCBmZWF0dXJlczoKPiA+ID4g
Cj4gPiA+IC0gSkg3MTEwIFNvQwo+ID4gPiAtIDEvMi80LzggR2lCIExQRERSNCBEUkFNCj4gPiA+
IC0gQVhQMTUwNjAgUE1JQwo+ID4gPiAtIDQwIHBpbiBHUElPIGhlYWRlcgo+ID4gPiAtIDN4IFVT
QiAzLjAgaG9zdCBwb3J0Cj4gPiA+IC0gMXggVVNCIDIuMCBob3N0IHBvcnQKPiA+ID4gLSAxeCBN
LjIgRS1LZXkKPiA+ID4gLSAxeCBlTU1DIHNsb3QKPiA+ID4gLSAxeCBNaWNyb1NEIHNsb3QKPiA+
ID4gLSAxeCBRU1BJIEZsYXNoCj4gPiA+IC0gMXggMUdicHMgRXRoZXJuZXQgcG9ydAo+ID4gPiAt
IDF4IEhETUkgcG9ydAo+ID4gPiAtIDF4IDItbGFuZSBEU0kgYW5kIDF4IDQtbGFuZSBEU0kKPiA+
ID4gLSAxeCAyLWxhbmUgQ1NJCj4gPiA+IAo+ID4gPiBBZGQgdGhlIGRldmljZXRyZWUgZmlsZSBk
ZXNjcmliaW5nIHRoZSBjdXJyZW50bHkgc3VwcG9ydGVkIGZlYXR1cmVzLAo+ID4gPiBuYW1lbHkg
UE1JQywgVUFSVCwgSTJDLCBHUElPLCBTRCBjYXJkLCBRU1BJIEZsYXNoLCBlTU1DIGFuZCBFdGhl
cm5ldC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4KPiA+IAo+ID4gR290IGEgZHRic19jaGVjayBpc3N1ZSBpbiB0aGUgcGF0Y2h3
b3JrIENJOgo+ID4gCj4gPiAgICArYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAt
bWlsa3YtbWFycy5kdGI6IGdtYWMxLXJnbWlpLXJ4aW4tY2xvY2s6ICdjbG9jay1mcmVxdWVuY3kn
IGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ICAgICsJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9maXhlZC1jbG9jay55YW1sIwo+ID4gICAgK2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRiOiBnbWFjMS1y
bWlpLXJlZmluLWNsb2NrOiAnY2xvY2stZnJlcXVlbmN5JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5
Cj4gPiAgICArCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
Y2xvY2svZml4ZWQtY2xvY2sueWFtbCMKPiA+IAo+ID4gQ2FuIHlvdSBmaXggdGhhdCBwbGVhc2U/
IEFsc28sIEkgYXBwbGllZCBzb21lIHBhdGNoZXMgdGhlIG90aGVyIGRheSB0aGF0Cj4gPiBzZWVt
IHRvIGNvbmZsaWN0IHF1aXRlIGEgYml0IHdpdGggdGhlIGNvbW1vbiBib2FyZCBkdHMgcGF0Y2gu
IFdvdWxkIHlvdQo+ID4gcGxlYXNlIGRvIGEgcmViYXNlIG9uIHRvcCBvZiB0aGF0IHBsZWFzZT8K
PiA+IAo+ID4gQ2hlZXJzLAo+ID4gQ29ub3IuCj4gPiAKPiA+ID4gLS0tCj4gPiA+ICAgYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZSAgICAgICAgIHwgIDEgKwo+ID4gPiAgIC4u
Li9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgICB8IDM1ICsrKysrKysr
KysrKysrKysrKysKPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKPiA+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcx
MTAtbWlsa3YtbWFycy5kdHMKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9N
YWtlZmlsZQo+ID4gPiBpbmRleCAwMTQxNTA0YzBmNWMuLjJmYTBjZDdmMzFjMyAxMDA2NDQKPiA+
ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZQo+ID4gPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlCj4gPiA+IEBAIC04LDUgKzgs
NiBAQCBEVENfRkxBR1Nfamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4zYiA6PSAtQAo+
ID4gPiAgIGR0Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMDAtYmVhZ2xldi1zdGFy
bGlnaHQuZHRiCj4gPiA+ICAgZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IGpoNzEwMC1z
dGFyZml2ZS12aXNpb25maXZlLXYxLmR0Ygo+ID4gPiArZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJ
VkUpICs9IGpoNzExMC1taWxrdi1tYXJzLmR0Ygo+ID4gPiAgIGR0Yi0kKENPTkZJR19BUkNIX1NU
QVJGSVZFKSArPSBqaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjJhLmR0Ygo+ID4gPiAg
IGR0Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2
ZS0yLXYxLjNiLmR0Ygo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1taWxrdi1tYXJzLmR0cwo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmRlNjAwZTc5OWU3ZAo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRz
Cj4gPiA+IEBAIC0wLDAgKzEsMzUgQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wIE9SIE1JVAo+ID4gPiArLyoKPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiA+ICsgKi8KPiA+ID4gKwo+ID4g
PiArL2R0cy12MS87Cj4gPiA+ICsjaW5jbHVkZSAiamg3MTEwLXZpc2lvbmZpdmUyLW1hcnMtY29t
bW9uLmR0c2kiCj4gPiA+ICsKPiA+ID4gKy8gewo+ID4gPiArCW1vZGVsID0gIk1pbGstViBNYXJz
IjsKPiA+ID4gKwljb21wYXRpYmxlID0gIm1pbGt2LG1hcnMiLCAic3RhcmZpdmUsamg3MTEwIjsK
PiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKyZnbWFjMCB7Cj4gPiA+ICsJc3RhcmZpdmUsdHgtdXNl
LXJnbWlpLWNsazsKPiA+ID4gKwlhc3NpZ25lZC1jbG9ja3MgPSA8JmFvbmNyZyBKSDcxMTBfQU9O
Q0xLX0dNQUMwX1RYPjsKPiA+ID4gKwlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZhb25jcmcg
Skg3MTEwX0FPTkNMS19HTUFDMF9STUlJX1JUWD47Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICsK
PiA+ID4gKyZwaHkwIHsKPiA+ID4gKwltb3RvcmNvbW0sdHgtY2xrLWFkai1lbmFibGVkOwo+ID4g
PiArCW1vdG9yY29tbSx0eC1jbGstMTAtaW52ZXJ0ZWQ7Cj4gPiA+ICsJbW90b3Jjb21tLHR4LWNs
ay0xMDAtaW52ZXJ0ZWQ7Cj4gPiA+ICsJbW90b3Jjb21tLHR4LWNsay0xMDAwLWludmVydGVkOwo+
ID4gPiArCW1vdG9yY29tbSxyeC1jbGstZHJ2LW1pY3JvYW1wID0gPDM5NzA+Owo+ID4gPiArCW1v
dG9yY29tbSxyeC1kYXRhLWRydi1taWNyb2FtcCA9IDwyOTEwPjsKPiA+ID4gKwlyeC1pbnRlcm5h
bC1kZWxheS1wcyA9IDwxNTAwPjsKPiA+ID4gKwl0eC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxNTAw
PjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKyZtbWMxIHsKPiA+ID4gKwlkaXNhYmxlLXdwOwo+
IAo+IER1ZSB0byB3aGljaCBkaWZmZXJlbmNlIGlzICdkaXNhYmxlLXdwJyBuZWNlc3NhcnkgZm9y
IHRoZSBNYXJzIGJvYXJkIGFuZCBub3QKPiBuZWNlc3NhcnkgZm9yIHRoZSBWaXNpb25GaXZlIDIg
Ym9hcmQ/CgpNYXJzIGRvZXNuJ3QgaGF2ZSB3cCBwaW4sIGJ1dCBkdW5ubyB2ZjIgY2FzZSBzaW5j
ZSBJIGRvbid0IGhhdmUgYSBWRjIKYm9hcmQgOykKPiAKPiA+ID4gKwljZC1ncGlvcyA9IDwmc3lz
Z3BpbyA0MSBHUElPX0FDVElWRV9MT1c+Owo+IAo+IE9uIG15IFZpc2lvbkZpdmUgMiAxLjJCLCBh
bmQgMS4zQSBib2FyZHMgR1BJTyA0MSByZWZsZWN0cyBpZiBhbiBTRC1jYXJkIGlzCj4gaW5zZXJ0
ZWQgKGFzIHNob3duIGluIFUtQm9vdCBieSBncGlvIHN0YXR1cyAtYSkuIFNvIHNob3VsZG4ndCB0
aGlzIHZhbHVlIGJlCj4gbW92ZWQgdG8gdGhlIGNvbW1vbiBpbmNsdWRlICJqaDcxMTAtdmlzaW9u
Zml2ZTItbWFycy1jb21tb24uZHRzaSIgYW5kCj4gYnJva2VuLWNkIHJlbW92ZWQgZnJvbSB0aGUg
VmlzaW9uRml2ZTIgYm9hcmQ/CgpJIHRlc3RlZCB0aGUgQ0QgcGluIGFuZCBjYW4gY29uZmlybSBp
dCB3b3JrcyBvbiBNYXJzLCBidXQgSSBkdW5ubyB3aGV0aGVyCnRoaXMgd29ya3Mgb24gVkYyIHNp
bmNlIEkgaGF2ZSBubyBWRjIgYm9hcmQuCkNvdWxkIHlvdSBwbGVhc2UgY2hlY2sgd2hldGhlciBp
dCB3b3JrcyBvciBub3Qgb24gVkYyPwoKPiAKPiBodHRwczovL2RvYy1lbi5ydnNwYWNlLm9yZy9W
aXNpb25GaXZlMi9QREYvU0NIX1JWMDAyX1YxLjJBXzIwMjIxMjE2LnBkZgo+IGhhcyBhIGxpbmUK
PiAKPiAgICAgR1BJTzQxIHwgU0RfU0RJTzBfQ0RfR1BJTzQxIHwgTWljcm8gU0TvvJpKMTAKPiAK
PiBCZXN0IHJlZ2FyZHMKPiAKPiBIZWlucmljaAo+IAo+ID4gPiArfTsKPiA+ID4gLS0gCj4gPiA+
IDIuNDMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
