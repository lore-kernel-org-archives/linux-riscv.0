Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B6CCD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5fLYxTkFM5Sol6BosK1FGiqNQfjlyQI+zEmrbawwHc=; b=fMqx+4CFyQDQ2F
	e0segSSZUUfHGuHux4kOQGeEh2S0abmInCHQLJYiqDHcEHZ2pvmSgAKzo74vlB78nuiGlsUfOQM0c
	OGVcHg8+vFo/ekLsjKPu6u592HL1Z1hTJ04nxFZHRh0zFs9d3hKRXC49R7ntlyv5G+sk35qcmkhON
	KIIE8AOf9yR5vmFyFqWFJq3SXozQWhCBZi7tB4i1rhpBMqNZ3SzQyy8c1nSl+rPxOBSGtaW65mo7b
	7lDgfLuP+kebQBRQp9kxeMbjiWZwBrVdgxtULTXGlp+/Y0VRkW418ELVQF1O31ZWKFhHW/J8D6yBX
	7GfQtsmjlZ2Gsupgmlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx5U-0000000FdKh-1mD3;
	Mon, 18 May 2026 12:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx5T-0000000FdKE-19Eb
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 12:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=le3jVWKWFfhs2Bh7uwp2bsCwo6wxH6tqo+u5P3QvLcI=; b=ppP4owzy7uoD2BmQbcUqlwP2QP
	+eQ0AUuIQaPJ7Jt/O/3OOgCRlfysJp7NKGLRTSou8DZF6+/70Gydud1yqsf1tH48cAGFpxeHye9et
	2lr2vemKBpO0UJnSyfRdbbvWqZ4SIwrtxeQBa/RkFOjjFKnlPebAT/mv8PLYESmZQi4vJyH8BjKTY
	GoGwucC2bo2dWbH/Y3GwKNdLWViReJV77Qg8Ooy8FTY9Nmnu2j0ofeEiR4y+sd36y9D4IJ+yHlDKx
	qxO0N/FKrmsnDCz4U78Aqs1OqQqFXLbQG2t5fM4ifsLNbJjjI3oNhy2cQ410Oi0mYHXMjh/S5OZB1
	+BdDm9Iw==;
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx5P-0000000B8G0-2Xv5
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 12:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779107313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SW3avIO7PHhCARW3Jpr8McY4KosYnH/k83cydUhMox6tXHl4rxjLW/TKyWWrWg5IJ+pG4GdSjh4YGwMQzG9k8ZSZ6cqm1sNPUMo2HYKZT0ImZq0l2ZMW+P7AmI//T4syB/Tbi1eQRzde0VZrbm3u+xW/B2Y+wsHF+9fUVaDuxe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779107313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=le3jVWKWFfhs2Bh7uwp2bsCwo6wxH6tqo+u5P3QvLcI=; 
	b=OQKJKZWMGFbb4Cgr3gRGTFvDnCA6YotlSAwhvwVBZ003NSPQqRLokBpOpieLXoDZa+sLMdW5SXnJZPZo98VBpMjREDg2PjeamaIERPCKwSqivXk3beoigCUzgoxzH1EMO9BdS5oqlaGUdvvFQ3uzyh+e0FgksWCt/o+cDu4Gdgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779107313;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=le3jVWKWFfhs2Bh7uwp2bsCwo6wxH6tqo+u5P3QvLcI=;
	b=Iz2B02KmiyGXtpk2uWlB56KwnBOE2SvemmUdDzBQ7zBhSy9HbCTaRVJIc653qXAh
	H/hWun9uZpGhKPOsFScZgyHjYTYDhiWjFIPNbYisMl4X28S7dIz/eRm9Ii1LNWbTFHL
	JrVJYZ8QI3jvjvJSIH9WQtFnfoAKe0MY6IvaJTgo=
Received: by mx.zohomail.com with SMTPS id 1779107311092321.60245224509777;
	Mon, 18 May 2026 05:28:31 -0700 (PDT)
Date: Mon, 18 May 2026 12:28:19 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
Message-ID: <agsF47bixKvB8uUk@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
 <20260517-popper-rage-b675785e4d28@spud>
 <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_132844_344068_649441CC 
X-CRM114-Status: GOOD (  18.34  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMDg6MTI6MTRQTSArMDgwMCwgQ2h1YW5ob25nIEd1byB3
cm90ZToKPiBIaSEKPiAKPiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCA0OjUw4oCvQU0gQ29ub3Ig
RG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKCi4uLgoKPiA+ID4gK2V4YW1wbGVzOgo+
ID4gPiArICAtIHwKPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc2lmbG93
ZXIsc2YyMS10b3Bjcm0uaD4KClRob3VnaCBpdCBpc24ndCBhIGJpZyBwcm9ibGVtLCB0aGUgaW5j
bHVkZSBpcyB1bm5lY2Vzc2FyeSwgZWl0aGVyLCBzaW5jZQp5b3UgZG9uJ3QgbWFrZSB1c2Ugb2Yg
YW55IGNvbnN0YW50cyBmcm9tIHRoZSBiaW5kaW5nIGhlYWRlciBpbiB0aGUKZXhhbXBsZS4KCj4g
PiA+ICsgICAgLyB7Cj4gPgo+ID4gUmVwbGFjZSB0aGlzIC8gd2l0aCAic29jIi4KPiAKPiBXaWxs
IGRvIHNvIGluIHYyLgo+IAo+ID4KPiA+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4gPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gPiArCj4gPiA+ICsgICAgICAg
IHhpbjI1bTogY2xvY2stMjUwMDAwMDAgewo+ID4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmaXhlZC1jbG9jayI7Cj4gPiA+ICsgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4g
PiA+ICsgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ID4gPiArICAg
ICAgICB9Owo+ID4KPiA+IERlbGV0ZSB0aGlzIG5vZGUsIGl0J3Mgbm90IG5lZWRlZCBpbiB0aGUg
ZXhhbXBsZS4gVGhlIHRvb2xpbmcgd2lsbCBmaWxsCj4gPiBpdCBpbi4KPiAKPiBPaCwgSSBkaWRu
J3Qga25vdyB0aGF0LiBJJ2xsIGRyb3AgaXQgaW4gdjIuCj4gCj4gPgo+ID4gQWxzbywgcGxlYXNl
IHRlc3QgeW91ciBiaW5kaW5ncyBzaW5jZSB0aGlzIGRvZXNuJ3QgcGFzcy4KPiA+Cj4gPiBwdy1i
b3Q6IGNoYW5nZXMtcmVxdWVzdGVkCj4gCj4gSXQncyBmYWlsaW5nIG9uIHRoZSBleGFtcGxlIGFz
IHJvb3Qgbm9kZSBtaXNzaW5nICJtb2RlbCIgYW5kICJjb21wYXRpYmxlIi4KPiBhbmQgaXQgd2ls
bCBiZSBmaXhlZCBhZnRlciBjaGFuZ2luZyAiLyIgdG8gInNvYyIuCj4gSSdsbCByZW1lbWJlciB0
byBydW4gdGhlIGZ1bGwgZHQgY2hlY2sgaW5zdGVhZCBvZiB1c2luZyBEVF9TQ0hFTUFfRklMRVMK
PiBmb3IgbXkgc2luZ2xlIGZpbGUgbmV4dCB0aW1lLgoKQWx0ZXJuYXRpdmVseSB5b3UgY291bGQg
Y2hvb3NlIHRvIGRyb3AgdGhlIG91dGVyIG5vZGUgYW5kIGtlZXAgdGhlCmNsb2NrLWNvbnRyb2xs
ZXIgbm9kZSBvbmx5LgoKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IENodWFuaG9uZyBHdW8KCkJlc3Qg
cmVnYXJkcywKWWFvIFppCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
