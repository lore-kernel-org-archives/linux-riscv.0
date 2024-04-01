Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B03CD1288
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaheRjTPc+5sRv4YBeRQfmYxDk0e9XI8w3f31fDu7xs=; b=DlI2/Byi0ZGLsz
	9FYgFljhjRsBViKVu8P0IkaBn6/gNrPsLlPuemWhtzS4o5YzCpCsCO0Nxj5eKOY5o8rqo2qEDMZid
	J0UvirthqqQ2IlxDrnnWgb/OBaWHmM0Zk2RxQ0SjpvLRjBhuKv4N89qYTpnhjhJQaCtEVuFoRENnM
	mBUP3C9uw9l5SipznOtxYUlioEtZ4CmxeBHuumYj1lezH/GdVaYyT30BuV0OXfDf17czWkKBBKZO5
	2FGfFqTf/sd2Xav6/tX2Fw1zp1ahjaW6nVgpzcDcfzO91WSVK0QSFYRSkx8ticZSJ+s/VO7ga4dCb
	i+x7NA6Iu/uEFil1wKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ76-000000087GS-0Dpw;
	Mon, 01 Apr 2024 14:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ70-000000087Fd-0wPH
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Apr 2024 14:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tb+J/p22HHmda+9PsXu/dUF9BBeNTs210ZQ8zgjImRY=; b=mNUw2Bywhkhb2WkCZn4z2mG0E3
	q2gOQok71Z9XUdvw1yrRJuBodAyenlBMVkEHlGgQSQN2RpKQ5hmK1oNyuUyMFdo1gKEFfhF1JCjdk
	X8NZAw8bboWwfAAOU+G/gcN3ifBgLALlUFBy+S/jRQwPt2BUjs9blGsPL/7ySV/IAu1+GVo7nkesw
	Odf6PPzn4HNhirfl6TZDr/8IF9j4lcjS5aPS2K8+kgjRjCHCDBdC7v76dq0ifkdx8cA6qadJWfCKQ
	/fsbpIy1uspIcjMhbrhYxo7Llrv5LC/LW+kUIZ8qsH+dl+bPA1VeMtNQhnCYw03VYDKUslvhbvq89
	jaYzpdbw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ6w-000000037Zf-0iID
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 14:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92DB0CE0FAE;
	Mon,  1 Apr 2024 14:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE9BC433F1;
	Mon,  1 Apr 2024 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711983483;
	bh=iWSrCQXopNpyy4/bhpMbaoyNqlqfJOPFVLa5+tSkyqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgku0LzNBC8durv7D8xHkaXYp4wdGd4dhls8VVLmTtkd5dKHoogKH4J1Ir3H/EZsx
	 S8lNRaxuCy/1Oiw1B24dKVERxJ8+sd0y2DXKBtjkDvG7ntv/Mw/EjB/Pv5P2rXx9Cq
	 OZdeZF0sbMbbKBEYlekhhvF2OwDNS96Tp0a7rXdChjJrvtcU4JEwCgEH723S5gh2VN
	 5gbdC+JOKycuXUtRN0FY6jVYN0CRok4lFqxgJf2QCS+xLZpopgM/VLIzozsRDbmx2R
	 ori3cTjlfK5Lx5IvSsFj2PJkbs9clGhajS64fLcuyOHhPe5zjAy2fitEEaPRNTW5BT
	 wcBbBJ0uyjdQg==
Date: Mon, 1 Apr 2024 22:44:44 +0800
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
Message-ID: <ZgrIXHNRTB_NeDeF@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
 <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
 <ZgYn9t4akccWuHyf@xhacker>
 <013f6d51-7f78-4de0-945d-8902f32c850a@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <013f6d51-7f78-4de0-945d-8902f32c850a@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_155810_886059_5B9D2931 
X-CRM114-Status: GOOD (  40.47  )
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

T24gTW9uLCBBcHIgMDEsIDIwMjQgYXQgMDM6Mjg6MzNQTSArMDIwMCwgSGVpbnJpY2ggU2NodWNo
YXJkdCB3cm90ZToKPiBPbiAzLzI5LzI0IDAzOjMxLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4g
T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTA6Mjg6MjhQTSArMDEwMCwgSGVpbnJpY2ggU2NodWNo
YXJkdCB3cm90ZToKPiA+ID4gT24gMi82LzI0IDIwOjEzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
PiA+ID4gT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgMDk6MjY6MDBQTSArMDgwMCwgSmlzaGVuZyBa
aGFuZyB3cm90ZToKPiA+ID4gPiA+IFRoZSBNaWxrdiBNYXJzIGlzIGEgZGV2ZWxvcG1lbnQgYm9h
cmQgYmFzZWQgb24gdGhlIFN0YXJmaXZlIEpINzExMCBTb0MuCj4gPiA+ID4gPiBUaGUgYm9hcmQg
ZmVhdHVyZXM6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IC0gSkg3MTEwIFNvQwo+ID4gPiA+ID4gLSAx
LzIvNC84IEdpQiBMUEREUjQgRFJBTQo+ID4gPiA+ID4gLSBBWFAxNTA2MCBQTUlDCj4gPiA+ID4g
PiAtIDQwIHBpbiBHUElPIGhlYWRlcgo+ID4gPiA+ID4gLSAzeCBVU0IgMy4wIGhvc3QgcG9ydAo+
ID4gPiA+ID4gLSAxeCBVU0IgMi4wIGhvc3QgcG9ydAo+ID4gPiA+ID4gLSAxeCBNLjIgRS1LZXkK
PiA+ID4gPiA+IC0gMXggZU1NQyBzbG90Cj4gPiA+ID4gPiAtIDF4IE1pY3JvU0Qgc2xvdAo+ID4g
PiA+ID4gLSAxeCBRU1BJIEZsYXNoCj4gPiA+ID4gPiAtIDF4IDFHYnBzIEV0aGVybmV0IHBvcnQK
PiA+ID4gPiA+IC0gMXggSERNSSBwb3J0Cj4gPiA+ID4gPiAtIDF4IDItbGFuZSBEU0kgYW5kIDF4
IDQtbGFuZSBEU0kKPiA+ID4gPiA+IC0gMXggMi1sYW5lIENTSQo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBBZGQgdGhlIGRldmljZXRyZWUgZmlsZSBkZXNjcmliaW5nIHRoZSBjdXJyZW50bHkgc3VwcG9y
dGVkIGZlYXR1cmVzLAo+ID4gPiA+ID4gbmFtZWx5IFBNSUMsIFVBUlQsIEkyQywgR1BJTywgU0Qg
Y2FyZCwgUVNQSSBGbGFzaCwgZU1NQyBhbmQgRXRoZXJuZXQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4g
PiAKPiA+ID4gPiBHb3QgYSBkdGJzX2NoZWNrIGlzc3VlIGluIHRoZSBwYXRjaHdvcmsgQ0k6Cj4g
PiA+ID4gCj4gPiA+ID4gICAgICthcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1t
aWxrdi1tYXJzLmR0YjogZ21hYzEtcmdtaWktcnhpbi1jbG9jazogJ2Nsb2NrLWZyZXF1ZW5jeScg
aXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+ID4gPiA+ICAgICArCWZyb20gc2NoZW1hICRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svZml4ZWQtY2xvY2sueWFtbCMKPiA+ID4g
PiAgICAgK2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRi
OiBnbWFjMS1ybWlpLXJlZmluLWNsb2NrOiAnY2xvY2stZnJlcXVlbmN5JyBpcyBhIHJlcXVpcmVk
IHByb3BlcnR5Cj4gPiA+ID4gICAgICsJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9jbG9jay9maXhlZC1jbG9jay55YW1sIwo+ID4gPiA+IAo+ID4gPiA+IENh
biB5b3UgZml4IHRoYXQgcGxlYXNlPyBBbHNvLCBJIGFwcGxpZWQgc29tZSBwYXRjaGVzIHRoZSBv
dGhlciBkYXkgdGhhdAo+ID4gPiA+IHNlZW0gdG8gY29uZmxpY3QgcXVpdGUgYSBiaXQgd2l0aCB0
aGUgY29tbW9uIGJvYXJkIGR0cyBwYXRjaC4gV291bGQgeW91Cj4gPiA+ID4gcGxlYXNlIGRvIGEg
cmViYXNlIG9uIHRvcCBvZiB0aGF0IHBsZWFzZT8KPiA+ID4gPiAKPiA+ID4gPiBDaGVlcnMsCj4g
PiA+ID4gQ29ub3IuCj4gPiA+ID4gCj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc3RhcmZpdmUvTWFrZWZpbGUgICAgICAgICB8ICAxICsKPiA+ID4gPiA+ICAg
IC4uLi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgICB8IDM1ICsrKysr
KysrKysrKysrKysrKysKPiA+ID4gPiA+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKQo+ID4gPiA+ID4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZQo+ID4gPiA+ID4gaW5kZXggMDE0MTUwNGMwZjVj
Li4yZmEwY2Q3ZjMxYzMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL01ha2VmaWxlCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL01ha2VmaWxlCj4gPiA+ID4gPiBAQCAtOCw1ICs4LDYgQEAgRFRDX0ZMQUdTX2poNzEx
MC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuM2IgOj0gLUAKPiA+ID4gPiA+ICAgIGR0Yi0kKENP
TkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMDAtYmVhZ2xldi1zdGFybGlnaHQuZHRiCj4gPiA+
ID4gPiAgICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTAwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtdjEuZHRiCj4gPiA+ID4gPiArZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9
IGpoNzExMC1taWxrdi1tYXJzLmR0Ygo+ID4gPiA+ID4gICAgZHRiLSQoQ09ORklHX0FSQ0hfU1RB
UkZJVkUpICs9IGpoNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuMmEuZHRiCj4gPiA+ID4g
PiAgICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJmaXZlLXZpc2lv
bmZpdmUtMi12MS4zYi5kdGIKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZTYwMGU3OTllN2QKPiA+ID4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZp
dmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4gPiA+ID4gPiBAQCAtMCwwICsxLDM1IEBACj4gPiA+
ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCj4gPiA+ID4g
PiArLyoKPiA+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlzaGVuZyBaaGFuZyA8anN6
aGFuZ0BrZXJuZWwub3JnPgo+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKy9k
dHMtdjEvOwo+ID4gPiA+ID4gKyNpbmNsdWRlICJqaDcxMTAtdmlzaW9uZml2ZTItbWFycy1jb21t
b24uZHRzaSIKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvIHsKPiA+ID4gPiA+ICsJbW9kZWwgPSAi
TWlsay1WIE1hcnMiOwo+ID4gPiA+ID4gKwljb21wYXRpYmxlID0gIm1pbGt2LG1hcnMiLCAic3Rh
cmZpdmUsamg3MTEwIjsKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyZnbWFj
MCB7Cj4gPiA+ID4gPiArCXN0YXJmaXZlLHR4LXVzZS1yZ21paS1jbGs7Cj4gPiA+ID4gPiArCWFz
c2lnbmVkLWNsb2NrcyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBfVFg+Owo+ID4gPiA+
ID4gKwlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZhb25jcmcgSkg3MTEwX0FPTkNMS19HTUFD
MF9STUlJX1JUWD47Cj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsmcGh5MCB7Cj4gPiA+ID4gPiArCW1vdG9yY29tbSx0eC1jbGstYWRqLWVuYWJsZWQ7Cj4g
PiA+ID4gPiArCW1vdG9yY29tbSx0eC1jbGstMTAtaW52ZXJ0ZWQ7Cj4gPiA+ID4gPiArCW1vdG9y
Y29tbSx0eC1jbGstMTAwLWludmVydGVkOwo+ID4gPiA+ID4gKwltb3RvcmNvbW0sdHgtY2xrLTEw
MDAtaW52ZXJ0ZWQ7Cj4gPiA+ID4gPiArCW1vdG9yY29tbSxyeC1jbGstZHJ2LW1pY3JvYW1wID0g
PDM5NzA+Owo+ID4gPiA+ID4gKwltb3RvcmNvbW0scngtZGF0YS1kcnYtbWljcm9hbXAgPSA8Mjkx
MD47Cj4gPiA+ID4gPiArCXJ4LWludGVybmFsLWRlbGF5LXBzID0gPDE1MDA+Owo+ID4gPiA+ID4g
Kwl0eC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxNTAwPjsKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyZtbWMxIHsKPiA+ID4gPiA+ICsJZGlzYWJsZS13cDsKPiA+ID4gCj4gPiA+
IER1ZSB0byB3aGljaCBkaWZmZXJlbmNlIGlzICdkaXNhYmxlLXdwJyBuZWNlc3NhcnkgZm9yIHRo
ZSBNYXJzIGJvYXJkIGFuZCBub3QKPiA+ID4gbmVjZXNzYXJ5IGZvciB0aGUgVmlzaW9uRml2ZSAy
IGJvYXJkPwo+ID4gCj4gPiBNYXJzIGRvZXNuJ3QgaGF2ZSB3cCBwaW4sIGJ1dCBkdW5ubyB2ZjIg
Y2FzZSBzaW5jZSBJIGRvbid0IGhhdmUgYSBWRjIKPiA+IGJvYXJkIDspCj4gCj4gSWYgdGhlIE1p
bGstViBNYXJzIGRvZXMgbm90IGhhdmUgYSBXUCBHUElPLCB3ZSBzaG91bGQgYmUgYWJsZSB0byBk
cm9wIHRoaXMKPiBwcm9wZXJ0eS4gVGhlIFZpc2lvbkZpdmUgMiBkb2VzIG5vdCBuZWVkIGl0IGVp
dGhlci4KCk5vcGUsIGRyb3BwaW5nIHRoaXMgcHJvcGVydHkgd291bGQgcmVzdWx0IGluIFJPIHNk
Y2FyZCBvbiB2ZjIuCj4gCj4gPiA+IAo+ID4gPiA+ID4gKwljZC1ncGlvcyA9IDwmc3lzZ3BpbyA0
MSBHUElPX0FDVElWRV9MT1c+Owo+ID4gPiAKPiA+ID4gT24gbXkgVmlzaW9uRml2ZSAyIDEuMkIs
IGFuZCAxLjNBIGJvYXJkcyBHUElPIDQxIHJlZmxlY3RzIGlmIGFuIFNELWNhcmQgaXMKPiA+ID4g
aW5zZXJ0ZWQgKGFzIHNob3duIGluIFUtQm9vdCBieSBncGlvIHN0YXR1cyAtYSkuIFNvIHNob3Vs
ZG4ndCB0aGlzIHZhbHVlIGJlCj4gPiA+IG1vdmVkIHRvIHRoZSBjb21tb24gaW5jbHVkZSAiamg3
MTEwLXZpc2lvbmZpdmUyLW1hcnMtY29tbW9uLmR0c2kiIGFuZAo+ID4gPiBicm9rZW4tY2QgcmVt
b3ZlZCBmcm9tIHRoZSBWaXNpb25GaXZlMiBib2FyZD8KPiA+IAo+ID4gSSB0ZXN0ZWQgdGhlIENE
IHBpbiBhbmQgY2FuIGNvbmZpcm0gaXQgd29ya3Mgb24gTWFycywgYnV0IEkgZHVubm8gd2hldGhl
cgo+ID4gdGhpcyB3b3JrcyBvbiBWRjIgc2luY2UgSSBoYXZlIG5vIFZGMiBib2FyZC4KPiA+IENv
dWxkIHlvdSBwbGVhc2UgY2hlY2sgd2hldGhlciBpdCB3b3JrcyBvciBub3Qgb24gVkYyPwo+IAo+
IEFzIG1lbnRpb25lZCBpbiBteSBwcmlvciBtYWlsIHRoZSBjYXJkIGRldGVjdCBHUElPIGlzIHdv
cmtpbmcgb24gdGhlCj4gVmlzaW9uRml2ZSAyLiBTdGFyRml2ZSBhY2tub3dsZWRnZWQgbXkgVS1C
b290IHBhdGNoOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC9TSFhQUjAxTUIw
ODYzMTRDNDdDMjgxQjNERERGN0JBRTlFNjNBQUBTSFhQUjAxTUIwODYzLkNITlBSMDEucHJvZC5w
YXJ0bmVyLm91dGxvb2suY24vCgpUaGFua3MgZm9yIGNvbmZpcm1hdGlvbi4KCj4gCj4gQmVzdCBy
ZWdhcmRzCj4gCj4gSGVpbnJpY2gKPiAKPiA+IAo+ID4gPiAKPiA+ID4gaHR0cHM6Ly9kb2MtZW4u
cnZzcGFjZS5vcmcvVmlzaW9uRml2ZTIvUERGL1NDSF9SVjAwMl9WMS4yQV8yMDIyMTIxNi5wZGYK
PiA+ID4gaGFzIGEgbGluZQo+ID4gPiAKPiA+ID4gICAgICBHUElPNDEgfCBTRF9TRElPMF9DRF9H
UElPNDEgfCBNaWNybyBTRO+8mkoxMAo+ID4gPiAKPiA+ID4gQmVzdCByZWdhcmRzCj4gPiA+IAo+
ID4gPiBIZWlucmljaAo+ID4gPiAKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4gLS0gCj4gPiA+ID4g
PiAyLjQzLjAKPiA+ID4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
