Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB8EC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NcXa1iUNWL51Nutvp0bFCIMNXCowzzzlPaVXzCugSE=; b=dbpPUNBvJRljap
	3OEV+EwOJ8omnj9O4xw9gKA1nuYdmJvwZfWiLs6kN5bTZ3ttSFaNyFdtl7zWFb/yg8c+rxITapNHs
	R4T7KX/decnGO9pADGv0lxNsNsBX0VFECtvgzkowoGJX+41eqLUaqAIfX+O79b6+WHbxadFmffWRa
	IunOibJ0G/6qSmHNilIO0+wEJVcZtpgXFbhUeVeqeuPksxA//f7YdCVFQJtIHvKWMs95fctYcLYpt
	6GDfLE8tfsZjs0xjMxpRhal98Vlcr/rj7RKJ181feMFBiFffc2kWg42dQ0q34EQcN/tXOAGzxZdNR
	mQ8Jsju8CNKAolXxpI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQmju-00000003cAP-3HfD;
	Mon, 08 Jul 2024 11:41:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQmjr-00000003c8m-3gjf
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 11:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 245F460B8E;
	Mon,  8 Jul 2024 11:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ABAC116B1;
	Mon,  8 Jul 2024 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720438856;
	bh=ggdsiSvYIt3dO3QAER9JNCQH3Vfx9KGbwlDnZxd431k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsrnwnoVctpTMcIY7idaSAVCnh0RRgWjZgFkRd0ljN8qqc+nP+bfdD738bYDh2SZV
	 4RM4lgElz1IbThXf+cfAryxDJHT5mN5vyFNapcYQbIyFMOVGMbTnbfU442LzybJth9
	 bJBqer8uTFRwtPXqJ55nyr7jKsw4Yvm71B6/i4ZfN2ZdfFLYcSzkLK3lAYCbJ723jv
	 s8VqjDxpo3hM5i7743U6OJrpOafLwp/CMWdAXBOVRg/rMFqXTPFkdTUMQK81GtlYuK
	 89KKKaC/dF/CcD1Jan8txNKmNwcEJ7N7kA6r4M45obUwGHPFEQGXBwWiP6bVXlcVPM
	 hLKZWJ0vsFsPg==
Date: Mon, 8 Jul 2024 19:26:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: select ARCH_USE_SYM_ANNOTATIONS
Message-ID: <ZovM9YYql8ui9Tp_@xhacker>
References: <20240705132308.1469-1-jszhang@kernel.org>
 <beb8a766-8143-40ad-912b-b04f7937d4a4@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <beb8a766-8143-40ad-912b-b04f7937d4a4@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_044100_062822_DC923A82 
X-CRM114-Status: GOOD (  18.35  )
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

T24gTW9uLCBKdWwgMDgsIDIwMjQgYXQgMTE6MjA6NTZBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDA1LzA3LzIwMjQgMTU6MjMsIEppc2hlbmcgWmhhbmcgd3JvdGU6
Cj4gPiBBZnRlciBjb21taXQgNzYzMjljNjkzOTI0ICgicmlzY3Y6IFVzZSBTWU1fKigpIGFzc2Vt
Ymx5IG1hY3JvcyBpbnN0ZWFkCj4gPiBvZiBkZXByZWNhdGVkIG9uZXMiKSwgcmlzY3YgaGFzIGJl
ZW4gdG8gdGhlIG5ldyBzdHlsZSBTWU1fIGFzc2VtYmxlcgo+ID4gYW5ub3RhdGlvbnMuIFNvIHNl
bGVjdCBBUkNIX1VTRV9TWU1fQU5OT1RBVElPTlMgdG8gZW5zdXJlIHRoZQo+ID4gZGVwcmVjYXRl
ZCBtYWNyb3Mgc3VjaCBhcyBFTlRSWSgpLCBFTkQoKSwgV0VBSygpIGFuZCBzbyBvbiBhcmUgbm90
Cj4gPiBhdmFpbGFibGUgYW5kIHdlIGRvbid0IHJlZ3Jlc3MuCj4gCj4gSGkgSmlzaGVuZywKCkhp
IENsw6ltZW50LAoKPiAKPiBPbiB3aGljaCBicmFuY2gvc2VyaWVzIGlzIGl0IGJhc2VkID8gSSB0
cmllZCBpdCBhbmQgaXQgZmFpbHMgb24KPiBlcnJhdGFfY2lwLTQzNS5zIHdoaWNoIHN0aWxsIGNv
bnRhaW5zIHNvbWUgdXNlcyBvZiBFTlRSWSgpOgo+IAo+IEVOVFJZKHNpZml2ZV9jaXBfNDUzX3Bh
Z2VfZmF1bHRfdHJwKQoKYWhhLCBJIHNlZSB3aGF0IGhhcHBlbmVkLiBJIGRpZCBzb21lIGFzbSAt
PiBjIGNvbnZlc2lvbiBbMV0KdHdvIHdlZWtzIGFnby4gSSBhbHNvIGNvbnZlcnRlZCB0aGUgc2lm
aXZlX2NpcF80NTNfcGFnZV9mYXVsdF90cnAgZXRjLgp0byBjIGFzIHdlbGwsIGJ1dCBJIGRlY2lk
ZWQgdG8gbm90IGJyaW5nIHRvbyBtYW55IGNoYW5nZXMKaW4gdGhlIGxhc3QgbWludXRlLCBzbyB0
aGUgbGFzdCBwYXRjaCB3YXNuJ3Qgc2VudCBvdXQsIGJ1dAppdCdzIGluIG15IHJlcG8gOykKCkkg
d2lsbCBzZW5kIG91dCB2MiBzb29uLiBUaGFuayB5b3Ugc28gbXVjaCEKCkxpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNjE2MTcwNTUzLjI4MzItMS1qc3poYW5n
QGtlcm5lbC5vcmcvIFsxXQoKPiAKPiBUaGFua3MsCj4gCj4gQ2zDqW1lbnQKPiAKPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IDA1MjVlZTJkNjNjNy4uYzUxYjMyYThkZGZmIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+IEBAIC02Miw2ICs2Miw3IEBAIGNvbmZpZyBSSVNDVgo+ID4gIAlzZWxlY3QgQVJDSF9V
U0VfQ01QWENIR19MT0NLUkVGIGlmIDY0QklUCj4gPiAgCXNlbGVjdCBBUkNIX1VTRV9NRU1URVNU
Cj4gPiAgCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUwo+ID4gKwlzZWxlY3QgQVJDSF9V
U0VfU1lNX0FOTk9UQVRJT05TCj4gPiAgCXNlbGVjdCBBUkNIX1VTRVNfQ0ZJX1RSQVBTIGlmIENG
SV9DTEFORwo+ID4gIAlzZWxlY3QgQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIIGlm
IE1NVQo+ID4gIAlzZWxlY3QgQVJDSF9XQU5UX0RFRkFVTFRfVE9QRE9XTl9NTUFQX0xBWU9VVCBp
ZiBNTVUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
