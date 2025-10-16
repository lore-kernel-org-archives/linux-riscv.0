Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451F0CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVeoDyvq0iMe0XNnIKIi5bvxIdPT5FBJo4o6U7TDZsI=; b=c4rpoPozEYPjI/
	A7u7cHMw3P/ifOtI3C5TwAC7Rw0rQmvvqQXsSEumTr4h35XFYoabyBB6o1yohcR5Iwb0TbKZWsQT1
	csT+3auqbeMOb/ldoIv6a/Qia+BY6c421i+LZp4aeCbJN9MQC6mP0gI+d0tRMwUyQbTWXrnb+A6vB
	z4TCW392fINHBSSpaqRCEWmdZm+WYLcx6IaaLeRL9VfK1SVSJpG5qTVI5g/2VNg4uX+zee5wJ79wQ
	79TYuxc7DFTUPlvNhP4u7TyddphN2+v1DVXNnF1gZCUf0s4Pf8gh3CSG1S9CY+qevBHT/I8VaHJB7
	hC0+qZ3lmgE1KojbieVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qac-00000005NP0-3n7Q;
	Thu, 16 Oct 2025 16:12:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qab-00000005NO6-0R4Z
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 16:12:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760631147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EimfC5YBQZ0kq/Gz52aWdB6vLjbMGcafw2nhUU8MVtE=;
	b=ZRO9mP/8ehCkUpZqmBe1rgk54JZHc29ccwtTz5j954OrVqClG6R+uVRDYkbJp7hC1gdJJZ
	y5PEOhujG1srTiKm+IOooIdhhs0kUZTBg4no06GdwWfYS9c5mWtbD/4Vm5ajrzxPau/bM9
	9V1jlggPXINSOLbxqr8l4O4HJFubXNqMmKD9mxQ4/xIWvOz1XaQ+GtxT9E4rcZGj2ur6Ob
	wSufpZsQHWCSIZlhRNhxoBXc712/TuEeRpyRjjoavVOhCa2rUqh8BW7FCpL+7ZOryAWmxx
	AoFp07wqU0/WHcI9Qum/mmpesYmxTEZ1yG++4KX20YvDIBCM3mP0+nBORDZNSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760631147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EimfC5YBQZ0kq/Gz52aWdB6vLjbMGcafw2nhUU8MVtE=;
	b=f4I884pQCh72NrW5bcmy4HgTPvI5ho0GNW8nxlBno/OTw1sTWSsWqoRojjYlPDOcm2wPbr
	9w2ELHaEq06LBtBw==
To: Charles Mirabile <cmirabil@redhat.com>
Cc: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Zhang
 Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <CABe3_aGj68qM1bNZ3LExbexO=9FO4RzJxhUy2T+HKK1qZfBmtw@mail.gmail.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
 <20251016084301.27670-4-lzampier@redhat.com> <87plan0yvd.ffs@tglx>
 <CABe3_aGj68qM1bNZ3LExbexO=9FO4RzJxhUy2T+HKK1qZfBmtw@mail.gmail.com>
Date: Thu, 16 Oct 2025 18:12:25 +0200
Message-ID: <87ms5q25cm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_091229_285434_EAD9308C 
X-CRM114-Status: GOOD (  34.40  )
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

T24gVGh1LCBPY3QgMTYgMjAyNSBhdCAxMTo1NCwgQ2hhcmxlcyBNaXJhYmlsZSB3cm90ZToKPiBP
biBUaHUsIE9jdCAxNiwgMjAyNSBhdCA5OjE34oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+PiA+ICtzdGF0aWMgaXJxX2h3X251bWJlcl90IGNwMTAwX2dl
dF9od2lycShzdHJ1Y3QgcGxpY19oYW5kbGVyICpoYW5kbGVyLAo+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICpjbGFpbSkKPj4gPiArewo+PiA+
ICsgICAgIGludCBucl9pcnFfZ3JvdXBzID0gRElWX1JPVU5EX1VQKGhhbmRsZXItPnByaXYtPm5y
X2lycXMsIDMyKTsKPj4gPiArICAgICB2b2lkIF9faW9tZW0gKnBlbmRpbmcgPSBoYW5kbGVyLT5w
cml2LT5yZWdzICsgUEVORElOR19CQVNFOwo+PiA+ICsgICAgIHZvaWQgX19pb21lbSAqZW5hYmxl
ID0gaGFuZGxlci0+ZW5hYmxlX2Jhc2U7Cj4+ID4gKyAgICAgaXJxX2h3X251bWJlcl90IGh3aXJx
ID0gMDsKPj4gPiArICAgICBpbnQgaTsKPj4gPiArCj4+ID4gKyAgICAgZ3VhcmQocmF3X3NwaW5s
b2NrKSgmaGFuZGxlci0+ZW5hYmxlX2xvY2spOwo+PiA+ICsKPj4gPiArICAgICAvKiBTYXZlIGN1
cnJlbnQgaW50ZXJydXB0IGVuYWJsZSBzdGF0ZSAqLwo+PiA+ICsgICAgIGZvciAoaSA9IDA7IGkg
PCBucl9pcnFfZ3JvdXBzOyBpKyspCj4+ID4gKyAgICAgICAgICAgICBoYW5kbGVyLT5lbmFibGVf
c2F2ZVtpXSA9IHJlYWRsX3JlbGF4ZWQoZW5hYmxlICsgaSAqIHNpemVvZih1MzIpKTsKPj4KPj4g
VGhpcyBpcyB0cnVseSB0aGUgbW9zdCBpbmVmZmljaWVudCB3YXkgdG8gc29sdmUgdGhhdCBwcm9i
bGVtLiBUaGUgZW5hYmxlCj4+IHJlZ2lzdGVycyBhcmUgbW9kaWZpZWQgd2l0aCBlbmFibGVkX2xv
Y2sgaGVsZCwgc28geW91IGNhbiBqdXN0IGNhY2hlIHRoZQo+PiB2YWx1ZSBpbiBwbGljX2hhbmRs
ZXI6OmVuYWJsZWRfc2F2ZSBhbmQgYXZvaWQgdGhpcyByZWFkIGxvb3AgY29tcGxldGVseS4KPj4g
QWZ0ZXIgY2xhaW1pbmcgdGhlIGludGVycnVwdCB5b3UgcmVzdG9yZSBmcm9tIHRoYXQgY2FjaGUs
IG5vPwo+Cj4gWW91IG1lYW4gdG91Y2ggdGhlIG90aGVyIGZ1bmN0aW9ucyB3aGVyZSB0aGUgZW5h
YmxlIGJpdHMgYXJlIG1vZGlmaWVkCj4gdG8ga2VlcCB0aGUgY2FjaGUgaW4gc3luYyBzbyB0aGF0
IHdlIGRvbid0IG5lZWQgdG8gZG8gdGhpcyByZWFkIGxvb3AKPiBhbmQgY2FuIGhhdmUgYSBwcm9w
ZXIgc2V0IG9mIHZhbHVlcyBjYWNoZWQ/Cj4KPiBNeSBjb25jZXJuIGlzIHRoYXQgdGhpcyBvYnZp
b3VzbHkgaGFzIGFuIGltcGFjdCBvbiBvdGhlciBwbGF0Zm9ybXMKPiB3aGljaCBkbyBub3QgaGF2
ZSB0aGlzIHF1aXJrIHNpbmNlIGtlZXBpbmcgdGhlIGNhY2hlIGluIHN5bmMgd291bGQgZ2V0Cj4g
cHVzaGVkIGFsbCB0aHJvdWdob3V0IHRoZSBkcml2ZXIuCgpUaGUgaXJxX2VuYWJsZSgpL2Rpc2Fi
bGUoKSBjYWxsYmFja3MgYXJlIG5vdCByZWFsbHkgaG90cGF0aCBhbmQgY2FjaGluZwp0aGUgYml0
IGluIHBsaWNfdG9nZ2xlKCkgb3Igc3VjaCBpcyBqdXN0IG5vdCBtZWFzdXJhYmxlIG92ZXJoZWFk
CmNvbXBhcmVkIHRvIHRoZSByZWdpc3RlciBhY2Nlc3MuCgo+PiBOb3cgZm9yIHRoZSBzZWFyY2gg
YW5kIGRpc2FibGUgbWVjaGFuaXNtLiBPZiBjb3Vyc2UgeW91IG5lZWQgdG8gc2VhcmNoCj4+IGZv
ciB0aCBwZW5kaW5nIGludGVycnVwdCBmaXJzdCwgYnV0IHRoZW4geW91IGNhbiBtYWtlIHRoYXQg
bWFza2luZyBsb29wCj4+IHZlcnkgc2ltcGxlIGJ5IGhhdmluZyBhIHBsaWNfaGFuZGxlcjo6ZW5h
YmxlZF9jbGVhcltdIGFycmF5IHdoaWNoIGlzCj4+IHplcm9lZCBvbiBpbml0aWFsaXphdGlvbjoK
Pj4KPj4gICAgICAgICB1bnNpZ25lZCBsb25nIHBlbmRpbmcgPSAwOwo+Pgo+PiAgICAgICAgIGZv
ciAoZ3JvdXAgPSAwOyAhcGVuZGluZyAmJiBncm91cCA8IG5yX2lycV9ncm91cHM7IGdyb3VwKysp
IHsKPj4gICAgICAgICAgICAgICAgIHBlbmRpbmcgPSBoYW5kbGVyLT5lbmFibGVkX3NhdmVbaV07
Cj4+ICAgICAgICAgICAgICAgICBwZW5kaW5nID0mIHJlYWRsX3JlbGF4ZWQocGVuZGluZyArIGdy
b3VwICogc2l6ZW9mKHUzMikpOwo+PiAgICAgICAgIH0KPj4gICAgICAgICBpZiAoIXBlbmRpbmcp
Cj4+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+Cj4+ICAgICAgICAgYml0ID0gZmZz
KHBlbmRpbmcpIC0gMTsKPj4gICAgICAgICBoYW5kbGVyLT5lbmFibGVkX2NsZWFyW2dyb3VwXSB8
PSBCSVQoYml0KTsKPj4gICAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IG5yX2lycV9ncm91cHM7
IGkrKykKPj4gICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKGhhbmRsZXItPmVuYWJsZWRf
Y2xlYXJbaV0sIGVuYWJsZSArIGkgKiBzaXplb2YodTMyKSk7Cj4+ICAgICAgICAgaGFuZGxlci0+
ZW5hYmxlZF9jbGVhcltncm91cF0gPSAwOwo+Pgo+PiBObz8KPgo+IFN1cmUgdGhhdCB3b3VsZCBh
bHNvIHdvcmssIGJ1dCB3aHkgYXJlIHdlIHVzaW5nIGZmcyAoc2xvdykgb25seSB0bwo+IHNoaWZ0
IHRoZSByZXN1bHQgYmFjayB0byBtYWtlIGEgbmV3IG1hc2sgd2hlbiAoeCAmIC14KSBpcyBmYXN0
ZXIgYW5kCj4gc2tpcHMgdGhlIGludGVybWVkaWF0ZSBzdGVwIGRlbGl2ZXJpbmcgaW1tZWRpYXRl
bHkgdGhlIG1hc2sgb2YgdGhlCj4gbG93ZXN0IGJpdC4KCkJlY2F1c2UgSSBkaWQgbm90IHNwZW5k
IHRpbWUgdGhpbmtpbmcgYWJvdXQgaXQuIAoKPiBBcyBmb3IgbWFraW5nIGFub3RoZXIgY2FjaGlu
ZyBhcnJheSwgSSBndWVzcywgYnV0IGFnYWluIHRoYXQgaXMganVzdCBhCj4gdGltZSB2cyBzcGFj
ZSB0cmFkZSBvZmYgd2l0aCBpdHMgb3duIGludmFyaWFudHMgdG8gbWFpbnRhaW4gdGhhdCB3b3Vs
ZAo+IGFsc28gaW1wYWN0IG90aGVyIHBsYXRmb3Jtcy4KCkl0J3MgYSBwb2ludGVyIGluIHN0cnVj
dCBwbGljX2hhbmRsZXIgKG9yIHdoYXRldmVyIGl0J3MgbmFtZWQpIGFuZCB5b3UKY2FuIGFsbG9j
YXRlIGl0IHdoZW4gdGhlIHF1aXJrIGlzIHJlcXVpcmVkLiBUaGUgcG9pbnRlciBpcyBkZWZpbml0
ZWx5Cm5vdCBhIGJ1cmRlbiBmb3IgYW55b25lIGVsc2UuCgo+PiBJcyB0aGUgZGV2aWNlIEIgaW50
ZXJydXB0IHByZXNlcnZlZCBpbiB0aGUgaW50ZXJydXB0IGNoaXAgYW5kIGFjdHVhbGx5Cj4+IHJh
aXNlZCB3aGVuIHRoZSBpbnRlcnJ1cHQgZW5hYmxlIGJpdCBpcyByZXN0b3JlZCBvciBpcyBpdCBs
b3N0Pwo+Cj4gSSBhbSBub3Qgc3VyZSBob3cgdG8gdmVyaWZ5IHRoaXMgb3RoZXIgdGhhbiB0byB0
ZWxsIHlvdSB0aGF0IHdpdGhvdXQKPiB0aGlzIHF1aXJrIChpLmUuIHRyeWluZyB0byB1c2Ugbm9y
bWFsIHBsaWMgYmVoYXZpb3IpIHRoZSBkZXZpY2UgZG9lcwo+IG5vdCB3b3JrLCBidXQgd2l0aCB0
aGlzIHF1aXJrIEkgY2FuIGJvb3QgdG8gYSBkZXNrdG9wIHdpdGggYSBwY2llCj4gZ3JhcGhpY3Mg
Y2FyZCBhbmQgc3RvcmFnZSwgdXNlIG5ldHdvcmtpbmcgZXRjIHRoYXQgYWxsIG9idmlvdXNseQo+
IGRlcGVuZCBvbiB0aGUgY29ycmVjdCBmdW5jdGlvbmluZyBvZiB0aGUgaW50ZXJydXB0IGNvbnRy
b2xsZXIuCj4KPiBNeSByZWFkaW5nIG9mIHRoZSBzcGVjIGZvciBQTElDIGFsc28gc3VnZ2VzdHMg
KGJ1dCBkb2VzIG5vdCBleHBsaWNpdGx5Cj4gY29uZmlybSkgdGhhdCB0aGUgcGVuZGluZyBiaXRz
IGZ1bmN0aW9uIGlycmVzcGVjdGl2ZSBvZiB0aGUgc3RhdGUgb2YKPiB0aGUgY29ycmVzcG9uZGlu
ZyBlbmFibGUgYml0OiAiQSBwZW5kaW5nIGJpdCBpbiB0aGUgUExJQyBjb3JlIGNhbiBiZQo+IGNs
ZWFyZWQgYnkgc2V0dGluZyB0aGUgYXNzb2NpYXRlZCBlbmFibGUgYml0IHRoZW4gcGVyZm9ybWlu
ZyBhIGNsYWltLiIKPiAocGFnZSAxNCBwbGljIHNwZWMgMS4wLjAgWzFdKS4KPgo+IFRoaXMgc2Vu
dGVuY2UgaW1wbGllcyB0byBtZSB0aGF0IGl0IGlzIHBvc3NpYmxlIGZvciBhIHBlbmRpbmcgYml0
IHRvCj4gYmUgc2V0IGV2ZW4gdGhvdWdoIHRoZSBjb3JyZXNwb25kaW5nIGVuYWJsZSBiaXQgaXMg
bm90LCB3aGljaCBsZW5kcwo+IGNyZWRlbmNlIHRvIHRoZSBpZGVhIHRoYXQgdGhlIHBlbmRpbmcg
Yml0cyBvcGVyYXRlIGluZGVwZW5kZW50bHkuCgpMb29rcyBsaWtlIHRoYXQuIFBsZWFzZSBhZGQg
YSBjb21tZW50IHRvIHRoYXQgZWZmZWN0IHRoZW4uCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
