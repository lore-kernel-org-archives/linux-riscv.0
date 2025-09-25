Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957F3CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 03:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geob5CIGq2ktzrD3yp3dMijeJJxgc4oA7owzWSpms5w=; b=he2K8wuJriO2TX
	tUm0nJb7wDplhtE0fWHnXyLvmqQ5dAZNKLvvSraDk+Qc/+aFwJb3qmYUeDtP2z7TZv62hqJ/9bMKG
	tNpj6lM7B0gzW35fu+xXF6xj2cFTkCDCv8HPEi3xecJTvY/+io7WtOVJes8+cDwubnYCimostOByT
	1ufjusrvXDjybQq7MsFAlF3LSSkKzryzK4BSEcBQydlCdRXZPgZdeA9Icxc0TJECrXS/mjjRf/PU+
	QQQRc6q8nadrI1D1/WAdDnpNXwAg2mTL/WiAXAxVsjpjzAo/Mb1ILUGGScNOVt/9OgG/2BOjbuF8q
	QtKWxC1yNJft5Cpe5U1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1czD-00000005Qe0-3R6L;
	Thu, 25 Sep 2025 03:49:39 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1czA-00000005QbI-2bhA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 03:49:38 +0000
Date: Thu, 25 Sep 2025 11:49:12 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758772161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBiu5fon2usO9/brRov2NJKkMhUctrYhM9cA/eD6UYU=;
	b=YI2vyybWXXnWShRtOGUMhbQc06uRwjbaXBGYbocLvsJKOUc+Tx/kTr8lF92hISbAzAnNlW
	JbJ16hU/82Rs8z396bh8Q1AZHlBgbrmKO/D9Npbg87ISGN6ttp/0zIzIUjGL4EIA87IDsq
	BOHWHDhOwHwr1J1CcUyLVr1+b4Tn8UI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: "fushan.zeng" <fushan.zeng@anlogic.com>, junhui.liu@pigmoral.tech
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, conor@kernel.org, daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	palmer@dabbelt.com, palmer@sifive.com, paul.walmsley@sifive.com,
	robh@kernel.org, samuel.holland@sifive.com, tglx@linutronix.de,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Message-ID: <aNS7uMHC4iTDHel4@LT-Guozexi>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250925030650.35694-1-fushan.zeng@anlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925030650.35694-1-fushan.zeng@anlogic.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_204937_102204_F6B2A0E2 
X-CRM114-Status: GOOD (  22.72  )
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgMTE6MDY6NTBBTSArMDgwMCwgZnVzaGFuLnplbmcgd3Jv
dGU6Cj4gT24gTW9uLCAyMiBTZXAgMjAyNSAyMDo0NjozMCArMDgwMCwgSnVuaHVpIExpdSB3cm90
ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgaW5pdGlhbCBzdXBwb3J0IGZvciB0
aGUgQW5sb2dpYyBEUjFWOTAgU29DCj4gPiBbMV0gYW5kIHRoZSBNaWxpYW5rZSBNTEtQQUktRlMw
MSBbMl0gYm9hcmQuCj4gPiAKPiA+IFRoZSBEUjFWOTAgaXMgYSBSSVNDLVYgYmFzZWQgRlBTb0Mg
ZnJvbSBBbmxvZ2ljLCBmZWF0dXJpbmcgYSBOdWNsZWkKPiA+IFVYOTAwIFszXSBjb3JlIGFzIGl0
cyBwcm9jZXNzaW5nIHN5c3RlbSAoUFMpIGFuZCA5NCw0NjQgTFVUcyBpbiB0aGUKPiA+IHByb2dy
YW1tYWJsZSBsb2dpYyAoUEwpIHBhcnQuIFRoZSBNaWxpYW5rZSBNTEtQQUktRlMwMSBib2FyZCBp
cyBvbmUgb2YKPiA+IHRoZSBmaXJzdCBwbGF0Zm9ybXMgYmFzZWQgb24gdGhpcyBTb0MsIHdpdGgg
VUFSVDEgcm91dGVkIHRvIGEgVHlwZS1DCj4gPiBpbnRlcmZhY2UgZm9yIGNvbnNvbGUgYWNjZXNz
Lgo+ID4gCj4gPiBUZXN0ZWQgb24gdGhlIE1pbGlhbmtlIE1MS1BBSS1GUzAxIGJvYXJkIHdpdGgg
Ym90aCB0aGUgdmVuZG9yJ3MgT3BlblNCSQo+ID4gYW5kIHRoZSBub3QteWV0LXVwc3RyZWFtZWQg
bWFpbmxpbmUgT3BlblNCSSBbNF0sIGFzIHdlbGwgYXMgdGhlIHZlbmRvcuKAmXMKPiA+IFUtQm9v
dC4gQmVjYXVzZSB0aGUgdmVuZG9y4oCZcyBPcGVuU0JJIGlzIGxvYWRlZCBhdCAweDFmMzAwMDAw
LCB3ZSBoYXZlCj4gPiB0byBhZGRpdGlvbmFsbHkgcmVzZXJ2ZSB0aGUgRFJBTSByZWdpb24gMHgx
ZmUwMDAwMOKAkzB4MWZmZmZmZmYgdG8gcHJldmVudAo+ID4gb3ZlcmxhcCBpZiB1c2luZyB2ZW5k
b3IncyBPcGVuU0JJLgo+ID4gCj4gPiBOb3RpY2U6IEEgIm5vNGx2bCIgYm9vdGFyZyBvciBkZXBl
bmRlbmN5IHBhdGNoIFs1XSBpcyBjdXJyZW50bHkgcmVxdWlyZWQKPiA+IGZvciBzdWNjZXNzZnVs
IGJvb3Qgb24gdGhlIERSMVY5MCBwbGF0Zm9ybSwgc2luY2UgdGhlIFNvQyBoYW5ncyBpZiB0aGUK
PiA+IGtlcm5lbCBhdHRlbXB0cyB0byB1c2UgdW5zdXBwb3J0ZWQgNC1sZXZlbCBvciA1LWxldmVs
IHBhZ2luZyBtb2Rlcy4KPiAKPiBUaGFua3MgZmlyc3QuCj4gQW5sb2lnYyBhbHJlYWR5IGhhcyB0
aGUgb3BlbiBzb3VyY2UgU0RLIGF0IGh0dHBzOi8vZ2l0ZWUuY29tL2FubG9naWMvc2RrLApJIHRo
aW5rIHZlcnkgZmV3IHBlb3BsZSBhY3R1YWxseSB1c2UgR2l0ZWUgYXJvdW5kIGhlcmUuCgo+IGFu
ZCB3aWxsIHN1Ym1pdCBpdCB0byBtYWlubGluZSBhdCBzdWl0YWJsZSB0aW1lLgo+IEl0IGlzIGJl
dHRlciB0aGF0IGFubG9naWMgU09DcyBhcmUgbG9uZyB0ZXJtIG1haW50YWluZWQgYW5kIHN1cHBv
cnRlZAo+IGJ5IEFubG9naWMgb2ZmaWNpYWxseSBpbiBtYWlubGluZSBhbmQgZm9yIGN1c3RvbWVy
cy4KPiBUaGUgY29kZSBzaG91bGQgYmUgYSBmdWxsIGZlYXR1cmUgdmVyc2lvbiBhZnRlciBsb3Rz
IG9mIHRlc3RzLCBub3QgdGhlCj4gbW9kaWZpZWQgYW5kIHNpbXBsaWZpZWQgdmVyc2lvbiBmcm9t
IEFubG9naWMgb3BlbiBzb3VyY2UuCkkgdW5kZXJzdGFuZCBob3cgeW91IGZlZWw6CllvdSB3YW50
IHRvIGJlIHJlc3BvbnNpYmxlIGZvciBib3RoIHRoZSBjb2RlIGFuZCB0aGUgY3VzdG9tZXJzLgoK
PiBBbmQgd2UgaG9wZSB0aGF0IHRoZXJlIHdvbid0IGJlIHR3byBkaWZmZXJlbnQgdmVyc2lvbnMg
Y29kZSBvZiBhbmxvZ2ljIFNPQ3MsCj4gaXQgbWF5IGNvbmZ1c2UgY3VzdG9tZXJzLgpUaGlzIGlz
IGFsbW9zdCBpbXBvc3NpYmxlLgpNYWlubGluZSBtZWFucyBzaW1wbGUsIGNsZWFyLCBjb21wbGlh
bnQsIGZ1bGx5IG9wZW4gc291cmNlLgpTb21lIGZlYXR1cmVzLCBsaWtlIEdQVSwgYXJlIG5lYXJs
eSBpbXBvc3NpYmxlIHRvIGZ1bGx5IHVwc3RyZWFtLgpWZW5kb3IgdmVyc2lvbnMgYXJlIGNvbXBs
ZXggYW5kIGltcGxlbWVudCBmdWxsIGhhcmR3YXJlIGZlYXR1cmVzLgpJdCBhbHNvIHNlZW1zIHlv
dSBleHBlY3Qgb25seSBvZmZpY2lhbCBmb2xrcyB0byBoYW5kbGUgdGhpcywKd2hpY2ggd291bGQg
dGFrZSBzaWduaWZpY2FudCBlZmZvcnQgdG8gbWFpbnRhaW4sCnBlcmhhcHMgZXZlbiByZXF1aXJp
bmcgZGVkaWNhdGVkIHBlcnNvbm5lbC4KCiAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
