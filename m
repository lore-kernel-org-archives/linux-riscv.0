Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594F7C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El1gHQRtDui6g/vwgq/jLQ0tNVfNN/ep1XC0tjly2s8=; b=Npoms2yQUQdGNG
	aO5NM6upXQi7bTEi6dp3LbPgDCBB2yphorWpLTjhyi5lqjT9Eilo8B9ptA32R48BknfCXi5MpY/97
	eyuNpjbg78s3DwYS9kq83B94zBvyqQJyLZ058n9VvAreApT+Cc56c8f6+9ckcwq+Yns7oRHSp7zAP
	M8ydyUe7VkGoW6akG2wNHk9QdO6Gjz8xjBmSAIZo2oRekyBWPYs7R1hG+uEkxP5Np4NtJ50/RQ3Gm
	I6BcffPj6TBgDl0FkxTEUQg4K8aUDW2JOt1AfnPRkC74s3QwS0HKK6DKm9Vd/rmhh1FhUN3uZxIPh
	8ou9KxNaGmw7l6sh3TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU8m-00000003oPh-2BKB;
	Thu, 31 Jul 2025 14:20:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTXg-00000003j3f-0HVA
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64AA544EBE;
	Thu, 31 Jul 2025 13:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC91C4CEEF;
	Thu, 31 Jul 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969315;
	bh=trI9eEiA5VY8YQDC03bJMw+fv5vHkRIbkQ2JDxq1II0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij8PkJShew8pu4ZGzkFdAFzoVmlvHFirzjpMKDqKVC1ruFUCkYgsklBDSvJx8UlNV
	 VzfYdfROTIRh9IoGe6I/K3Cv9LHmsrwvdubM2KBTPFwDNPxbfMlxw3e5wRBDrBkxvc
	 d4eag+/alBpnnjHKYGC4teXTPtpVmlq4liGjAc4nxSFyswJyKrCN9DiNANNqxYKvqX
	 SX4yiyee514bkcfPBjYqArFvOhJF9uI5HsZHB+wGzsEpYM2oGCew42tDcc5zXstyS5
	 OcFeAX7DAWPvAU5szCjEqxo+aoDnEbxFdOu8b0yzxYLaZ6GeHmJ3+APnola/gK6kVq
	 X/qF5OfxxpAzw==
Date: Thu, 31 Jul 2025 14:41:48 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250731134148.GI1049189@google.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
 <20250731131827.GG1049189@google.com>
 <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_064156_128128_CEDE2712 
X-CRM114-Status: GOOD (  23.03  )
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

T24gVGh1LCAzMSBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gT24gNy8zMS8yNSA4OjE4
IEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBTYXQsIDI2IEp1bCAyMDI1LCBBbGV4IEVsZGVy
IHdyb3RlOgo+ID4gCj4gPiA+IEFsbCBkZXZpY2VzIHN1cHBvcnRlZCBieSBzaW1wbGUgTUZEIHVz
ZSB0aGUgc2FtZSA4LWJpdCByZWdpc3RlciA4LWJpdAo+ID4gPiB2YWx1ZSByZWdtYXAgY29uZmln
dXJhdGlvbi4gIFRoZXJlIGlzIGFuIG9wdGlvbiBhdmFpbGFibGUgZm9yIGEgZGV2aWNlCj4gPiA+
IHRvIHNwZWNpZnkgYSBjdXN0b20gY29uZmlndXJhdGlvbiwgYnV0IG5vIGV4aXN0aW5nIGRldmlj
ZSB1c2VzIGl0Lgo+ID4gPiAKPiA+ID4gUmF0aGVyIHRoYW4gcmVxdWlyaW5nIGEgImZ1bGwiIHJl
Z21hcCBjb25maWd1cmF0aW9uIHRvIGJlIHByb3ZpZGVkIHRvCj4gPiA+IGNoYW5nZSBvbmx5IHRo
ZSBtYXhfcmVnaXN0ZXIgdmFsdWUsIExlZSBKb25lcyBzdWdnZXN0ZWQgYWxsb3dpbmcKPiA+ID4g
bWF4X3JlZ2lzdGVyIHRvIGJlIHNwZWNpZmllZCBpbiB0aGUgc2ltcGxlX21mZF9kYXRhIHN0cnVj
dHVyZS4gIFRoZQo+ID4gPiA4LWJpdCByZWdpc3RlciA4LWJpdCBjb25maWd1cmF0aW9uIGlzIHN0
aWxsIHVzZWQgYnkgZGVmYXVsdCwgYnV0Cj4gPiA+IG1heF9yZWdpc3RlciBpcyBhbHNvIGFwcGxp
ZWQgaWYgaXQgaXMgbm9uLXplcm8uCj4gPiA+IAo+ID4gPiBJZiBib3RoIHJlZ21hcF9jb25maWcg
YW5kIG1heF9yZWdpc3RlciBhcmUgcHJvdmlkZWQsIHRoZSBtYXhfcmVnaXN0ZXIKPiA+ID4gZmll
bGQgaW4gdGhlIHJlZ21hcF9jb25maWcgc3RydWN0dXJlIGlzIGlnbm9yZWQuCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4gPiA+IFN1
Z2dlc3RlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+IHYx
MDogLSBSZW5hbWUgc2ltcGxlX3JlZ21hcF9jb25maWcoKSAtPiBzaW1wbGVfcmVnbWFwX2NvbmZp
Z19nZXQoKQo+ID4gPiAgICAgICAtIEludHJvZHVjZSBzaW1wbGVfcmVnbWFwX2NvbmZpZ19wdXQo
KSB0byBmcmVlIHJlZ21hcF9jb25maWcKPiA+ID4gCj4gPiA+ICAgZHJpdmVycy9tZmQvc2ltcGxl
LW1mZC1pMmMuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ID4g
PiAgIGRyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmggfCAgNSArLS0tCj4gPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBUaGlz
IGhhcyBnb25lIGZyb20gYW4gaW4tZnVuY3Rpb24gMTEgbGluZSBjaGFuZ2UgdG8gNTAgbGluZXMg
YW5kIHRoZQo+ID4gaW5jbHVzaW9uIG9mIDIgbmV3IGZ1bmN0aW9ucy4gIEFzIG11Y2ggYXMgSSBf
cmVhbGx5XyBhcHByZWNpYXRlIHRoZSB0aW1lCj4gPiBhbmQgZWZmb3J0IHlvdSBoYXZlIHB1dCBp
bnRvIHRoaXMgWzBdLCB0aGUgYWRkZWQgY29tcGxleGl0eSBiZWluZyBhZGRlZAo+ID4gaGVyZSBk
b2Vzbid0IHNpdCByaWdodCB3aXRoIG1lLiAgSG93IHdvdWxkIHlvdSBsaWtlIHRvIGdvIGJhY2sg
dG8geW91cgo+ID4gdjQgaWRlYSBvZiBwcm92aWRpbmcgYSBiZXNwb2tlIHJlZ21hcF9jb25maWcg
Zm9yIGZvciBkZXZpY2U/Cj4gCj4gSSBMT1ZFIHRoaXMgc3VnZ2VzdGlvbi4gIEkgd2lsbCBzZW5k
IHYxMSBzaG9ydGx5IGFuZCBpdCB3aWxsCj4gYmUgdmVyeSBtdWNoIGxpa2UgdjYgKG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQpLgo+IAo+ID4gWzBdIEJlZXJzIG9uIG1lIGZvciBzZW5kaW5nIHlvdSBk
b3duIHRoaXMgcGF0aCEKPiAKPiBJJ20gbG9va2luZyBmb3J3YXJkIHRvIHNlZWluZyB5b3UgYWdh
aW4sIGJlZXIgb3Igbm90LgoKTGlrZXdpc2UhICA9Oi0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
