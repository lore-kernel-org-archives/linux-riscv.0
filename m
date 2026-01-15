Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CCDD3CCB2
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfQbrcNNvlVttBSVLlXyUQeGU8aeLB+ZWRnFwFrn9tU=; b=fQvq1kPihyzuj8
	cUxpnk0Dl7aX0eR2Nq0HhWslDsLL0gWl27i0q0Zdu/sOTl2Pq3hu47xJ6GtNaN5pyAwa5VPtmTxcS
	rKW1Xc4IPgFJNr/cWe7X2QSBSpQXem5qcBnHPDZsR5kH5QzR7bBMyl9sGUmmhZdPSnhf2/zizTDHe
	gz9hQEauTxd1tuuaWe4EBnzC5x2rRQ5JIc/T5+UadzwQD+T15BWc0LWkTmfptduq+bj6uZ+4W3dyc
	Gk0KXMMRIKHAcbntFR+4u8HKL3OXU+8m2LYpF2smgoP/3T2hmUbBj/JqDzOUjN5HTec2o18SHBYss
	AV2T531FkQjLi2r/joRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHCH-0000000Bsqh-1B17;
	Thu, 15 Jan 2026 06:51:09 +0000
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHCB-0000000Bsot-21kY
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:51:08 +0000
X-UUID: 8317f14cf1de11f0a38c85956e01ac42-20260115
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:486b875c-b8e9-4501-afd8-875aa0dacc1a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c90fa56c603edfa88239f368fa568c00,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8317f14cf1de11f0a38c85956e01ac42-20260115
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 69164715; Thu, 15 Jan 2026 14:50:43 +0800
Message-ID: <19a5a6bd-2645-4be6-9e21-c78e820886c5@kylinos.cn>
Date: Thu, 15 Jan 2026 14:50:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
To: David Laight <david.laight.linux@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org,
 martin.petersen@oracle.com, ardb@kernel.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-2-jiangfeng@kylinos.cn> <20260114000151.GB2178@quark>
 <20260114101034.7961852a@pumpkin>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260114101034.7961852a@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225103_830934_A2068530 
X-CRM114-Status: GOOD (  16.77  )
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

T24gMjAyNi8xLzE0IDE4OjEwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gT24gVHVlLCAxMyBKYW4g
MjAyNiAxNjowMTo1MSAtMDgwMAo+IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gLi4KPj4gQSBzaW1pbGFyIHByb2JsZW0gZXhpc3RzIHdpdGggdGhlIGFyY2hp
dGVjdHVyZS1vcHRpbWl6ZWQgQ1JDIGFuZCBjcnlwdG8KPj4gZnVuY3Rpb25zLiAgSGlzdG9yaWNh
bGx5LCB0aGVzZSBzdWJzeXN0ZW1zIGV4cG9ydGVkIGJvdGggZ2VuZXJpYyBhbmQKPj4gYXJjaGl0
ZWN0dXJlLW9wdGltaXplZCBmdW5jdGlvbnMuCj4+Cj4+IFdlJ3ZlIGFjdHVhbGx5IGJlZW4gbW92
aW5nIGF3YXkgZnJvbSB0aGF0IGRlc2lnbiB0byBzaW1wbGlmeSB0aGluZ3MuCj4+IEZvciBleGFt
cGxlLCBmb3IgQ1JDLTMyQyB0aGVyZSdzIG5vdyBqdXN0IHRoZSBjcmMzMmMoKSBmdW5jdGlvbiB3
aGljaAo+PiBkZWxlZ2F0ZXMgdG8gdGhlICJiZXN0IiBDUkMtMzJDIGltcGxlbWVudGF0aW9uLCB3
aXRoIG5vIGRpcmVjdCBhY2Nlc3MgdG8KPj4gdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2Yg
Q1JDLTMyQy4KPj4KPj4gY3JjX2t1bml0IHRoZW4ganVzdCB0ZXN0cyBhbmQgYmVuY2htYXJrcyBj
cmMzMmMoKS4gIFRvIGNoZWNrIGhvdyB0aGUKPj4gcGVyZm9ybWFuY2Ugb2YgY3JjMzJjKCkgY2hh
bmdlcyB3aGVuIGl0cyBpbXBsZW1lbnRhdGlvbiBjaGFuZ2VzICh3aGV0aGVyCj4+IHRoZSBjaGFu
Z2UgaXMgdGhlIGFkZGl0aW9uIG9mIGFuIGFyY2gtb3B0aW1pemVkIGltcGxlbWVudGF0aW9uIG9y
IGEKPj4gY2hhbmdlIGluIGFuIGV4aXN0aW5nIGFyY2gtb3B0aW1pemVkIGltcGxlbWVudGF0aW9u
KSwgdGhlIGRldmVsb3BlciBqdXN0Cj4+IG5lZWRzIHRvIHJ1biBjcmNfa3VuaXQgd2l0aCB0d28g
a2VybmVscywgYmVmb3JlIGFuZCBhZnRlci4KPiAKPiBGb3IgdGhlIG11bF9kaXYgdGVzdHMgSSBh
cnJhbmdlZCB0aGF0IHRoZSB0ZXN0IGNvZGUgY291bGQgI2luY2x1ZGUgdGhlCj4gc291cmNlIGZv
ciB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBzbyBpdCBjb3VsZCBydW4gdGhhdCBhcyB3ZWxs
IGFzCj4gdGhlIHZlcnNpb24gY29tcGlsZWQgaW50byB0aGUgbWFpbiBrZXJuZWwuCj4gCj4gVGhp
cyBpbnZvbHZlZCB3cmFwcGluZyB0aGUgZnVuY3Rpb24gaW46Cj4gI2lmICFkZWZpbmVkKGZ1bmN0
aW9uKSB8fCBkZWZpbmVkKHRlc3RfZnVuY3Rpb24pCj4gdHlwZSBmdW5jdGlvbihhcmdzKQo+IC4u
Lgo+IH0KPiAjaWYgIWRlZmluZWQoZnVuY3Rpb24pCj4gRVhQT1JUX1NZTUJPTChmdW5jdGlvbikK
PiAjZW5kaWYKPiAjZW5kaWYKPiAKPiBTbyB0aGUgdGVzdCBjb2RlIGNhbiB1c2U6Cj4gI2RlZmlu
ZSBmdW5jdGlvbiBnZW5lcmljX2Z1bmN0aW9uCj4gI2RlZmluZSB0ZXN0X2Z1bmN0aW9uCj4gI2lu
Y2x1ZGUgImZ1bmN0aW9uLmMiCj4gCj4gdG8gZ2V0IGEgcHJpdmF0ZSBjb3B5IG9mIHRoZSBnZW5l
cmljIGNvZGUuCgpUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uISBUaGF0IHRlY2huaXF1ZSBp
cyB2ZXJ5IGNsZXZlciBhbmQgaW50ZXJlc3RpbmfigJQKSSd2ZSBkZWZpbml0ZWx5IGxlYXJuZWQg
c29tZXRoaW5nIG5ldyBhbmQgd2lsbCBrZWVwIGl0IGluIG1pbmQgZm9yIHRoZSBmdXR1cmUuCgpI
b3dldmVyLCBzaW5jZSBsaWIvc3RyaW5nLmMgaXMgc3VjaCBhIGZvdW5kYXRpb25hbCBhbmQgbG93
LWxldmVsIGxpYnJhcnksIEknbQpoZXNpdGFudCB0byBhZGQgbWFjcm8gd3JhcHBlcnMgb3IgY29u
ZGl0aW9uYWwgYmxvY2tzIGZvciBLVW5pdC4gR2l2ZW4gaXRzCmltcG9ydGFuY2UsIEkgZmVlbCB0
aGF0IGluY3JlYXNpbmcgaXRzIGNvbXBsZXhpdHkgZm9yIHNpZGUtYnktc2lkZSB0ZXN0aW5nCmlz
bid0IHF1aXRlIHdvcnRoIGl0LiBJJ2QgcHJlZmVyIHRvIGtlZXAgdGhlIGNvcmUgY29kZSBjbGVh
biBhbmQgZm9sbG93IEVyaWMncwptaW5pbWFsaXN0IGFwcHJvYWNoIG9mIGJlbmNobWFya2luZyBh
Y3Jvc3MgZGlmZmVyZW50IGtlcm5lbCBjb25maWd1cmF0aW9ucy4KCkkgcmVhbGx5IGFwcHJlY2lh
dGUgdGhlIGd1aWRhbmNlIQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
