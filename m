Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D2CCD1A2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 01:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UyV+fJxtvIb4YkSrE/zw0aFwORVIP4iHQ4R3Ojmd8M=; b=nvui9n2hZzT+q6
	35obi4GaJZ+cPHmfLnjeKAGZvo7N9z6P48HQNOSAa6KF1BTDuUg4rBJCfUMtr1in6C8i+BEo3vmGm
	SjPsGcoUB9GENukSnWuD1C5Te/vfyDIpMyXB/LN37FYB6Qss6ocf22KQK9c0ppnv0BHApf+uctJBH
	8v1QXlc5+Ms9ipPtKuQeEiOaZgOYSUWLd/wsSv5jJhNmEU/l2CX4vlXamkbOJHuFTfvl/6ZjiBRZ6
	ezG6bSe5hD+5wAAYLq7Flr7xk1xSrEWX/VYeM5VVZ6d0K49mo2Mba6sA0g/ud0ZJd8fy8U7i/LtSd
	ssqSQ3owyxCarm0HmJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0xS-0000000FRKm-009R;
	Tue, 21 Oct 2025 01:14:38 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0xP-0000000FRK3-0ACF
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 01:14:36 +0000
Date: Tue, 21 Oct 2025 09:14:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761009269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNqPFAFWjOS8rFTBULhpUJlwsnHqnNO3gS5VK6HeogQ=;
	b=aN4tkXaXqI/EoT3MGjlUvVhfrN1KQDzuJZRYn4OwWcklpziN+f3Qz6bl7ui9E0kghQNgTc
	VjK7/0Erq2hakeKEBU1yDyAFrTniDIf4eQQh0rAVL6gwxEVRyD8bmwIeOiHWE/7hBR5Jt1
	xISKq+nLInnGbTKGBul1shtfi5z/H44=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip/sifive-plic: use hartid as context_id in OF to
 fix AMP conflicts
Message-ID: <aPbeb1SEZr7CG2eN@kernel.org>
References: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
 <87bjm1zcvc.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bjm1zcvc.ffs@tglx>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_181435_216901_0A6D676F 
X-CRM114-Status: GOOD (  21.79  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMDc6NDQ6NTVQTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDIwIDIwMjUgYXQgMTE6NDksIFRyb3kgTWl0Y2hlbGwgd3Jv
dGU6Cj4gPiBJbiBhc3ltbWV0cmljIG11bHRpLXByb2Nlc3NpbmcgKEFNUCkgc2NlbmFyaW9zLCB0
aGUgb3JpZ2luYWwgUExJQwo+ID4gZHJpdmVyIHVzZWQgdGhlIGNvbnRleHQgbG9vcCBpbmRleCAn
aScgYXMgY29udGV4dF9pZCBmb3IgT0YgKGRldmljZQo+IAo+IFdoaWNoIG9yaWdpbmFsIGRyaXZl
ciBhbmQgd2hlbiBkaWQgaXQgc3RvcCB0byB1c2UgdGhlIGNvbnRleHQgbG9vcCBpbmRleD8KPiAK
PiA+IHRyZWUpIHBsYXRmb3Jtcy4gVGhpcyBjYXVzZWQgbXVsdGlwbGUgY29udGV4dHMgZnJvbSBk
aWZmZXJlbnQgaGFydHMKPiA+IChlLmcuLCBjb3JlMCBhbmQgY29yZTQpIHRvIHNoYXJlIHRoZSBz
YW1lIGVuYWJsZV9iYXNlLCBsZWFkaW5nIHRvCj4gPiBjb25mbGljdHMgd2hlbiBpbml0aWFsaXpp
bmcgdGhlIFBMSUMuCj4gCj4gV2hlbiBkaWQgaXQgc3RvcCB0byBjYXVzZSB0aGUgaXNzdWVzPyBB
bmQgaWYgdGhlIGlzc3VlcyBoYXZlIGJlZW4KPiBhbHJlYWR5IHJlc29sdmVkLCB3aGF0IGlzIHRo
aXMgcGF0Y2ggYWJvdXQ/ClRoZSBpc3N1ZSBzdGlsbCBleGlzdHMgaW4gdGhlIGN1cnJlbnQgZHJp
dmVyLgpUaGUgUExJQyBkcml2ZXIgZm9yIE9GLWJhc2VkIHBsYXRmb3JtcyBhc3NpZ25zIGNvbnRl
eHRfaWQgPSBpIGluc2lkZQp0aGUgY29udGV4dCBsb29wLCB3aGljaCBhc3N1bWVzIHRoYXQgYWxs
IGhhcnRzIGFyZSBudW1iZXJlZCBjb250aWd1b3VzbHkKc3RhcnRpbmcgZnJvbSAwLgoKSW4gQU1Q
IHN5c3RlbXMgKGUuZy4sIHdoZW4gTGludXggYm9vdHMgZnJvbSBoYXJ0NCB3aGlsZSBoYXJ0MCBy
dW5zIGFub3RoZXIgT1MpLAp0aGlzIGFzc3VtcHRpb24gYnJlYWtzIOKAlCBtdWx0aXBsZSBjb250
ZXh0cyBmcm9tIGRpZmZlcmVudCBjbHVzdGVycyBzaGFyZSB0aGUgc2FtZQplbmFibGVfYmFzZShl
LmcuLCBjb3JlNCdzIGVuYWJsZV9iYXNlID0gY29yZTAncyBlbmFibGVfYmFzZSksIGNhdXNpbmcg
Y29uZmxpY3RzLgoKVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieSBhc3NpZ25pbmcgY29u
dGV4dF9pZCBiYXNlZCBvbiB0aGUgYWN0dWFsIGhhcnRpZCwKZW5zdXJpbmcgdGhhdCBlYWNoIGhh
cnQgY29udGV4dCBtYXBzIHRvIGEgdW5pcXVlIGVuYWJsZSByZWdpb24sCndoaWxlIHByZXNlcnZp
bmcgYmVoYXZpb3Igb24gU01QIGFuZCBVUCBzeXN0ZW1zLgoKRG9lcyBpdCBtYWtlIHNlbnNlPyBJ
J2xsIHVwZGF0ZSBteSBjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+ID4g
VGhpcyBwYXRjaCByZXNvbHZlcyBlbmFibGVfYmFzZSBjb25mbGljdHMgb24gQU1QIHBsYXRmb3Jt
cyB3aGlsZQo+IAo+ICMgZ2l0IGdyZXAgJ1RoaXMgcGF0Y2gnIERvY3VtZW50YXRpb24vcHJvY2Vz
cy8KPiAKPiA+IG1haW50YWluaW5nIFNNUC9VUCBiZWhhdmlvci4KPiAKPiBUaGVyZSBpcyB6ZXJv
IGV4cGxhbmF0aW9uIHdoYXQgdGhpcyBwYXRjaCBkb2VzIHRvIHJlc29sdmUgdGhlIGlzc3VlLgo+
IAo+IFNlZSBhbHNvOgo+IAo+ICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvcHJvY2Vzcy9tYWludGFpbmVyLXRpcC5odG1sI2NoYW5nZWxvZwpUaGFua3MgZm9yIHlvdXIg
bGluayEKPiAKPiA+ICAKPiA+ICAJCWlmIChpc19vZl9ub2RlKGZ3bm9kZSkpIHsKPiA+IC0JCQlj
b250ZXh0X2lkID0gaTsKPiA+ICsJCQljb250ZXh0X2lkID0gaGFydGlkICogMiArIGkgJSAyOwo+
IAo+IFRoaXMgaXMgaW5jb21wcmVoZW5zaWJsZSBhbmQgd2lsbCBjYXVzZSBoZWFkIHNjcmF0Y2hp
bmcgNiB3ZWVrcyBkb3duIHRoZQo+IHJvYWQuIFRoaXMgbmVlZHMgYSBwcm9wZXIgY29tbWVudCB3
aXRoIGFuIGV4cGxhbmF0aW9uIHdoYXQgdGhpcyBpcwo+IGFib3V0IGFuZCB3aHkgaXQgaXMgY29y
cmVjdCB1bmRlciBhbGwgY2lyY3Vtc3RhbmNlcy4KSSB3aWxsIGFkZCBjb21tZW50cyBoZXJlLiBU
aGFua3MhCgogICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiBUaGFua3MsCj4gCj4g
ICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
