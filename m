Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EAAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+NONKnBpZ9zd2bVokPn5+PphpE9vR2rzYQQRWCN9jQ=; b=ZnECnX+exgUSH1
	L5//v8YWsNjlZEZ6W1E0aj/CoUYZ+ph3c6ae7ifaYU8n6zq4DhMEvrZwLaTV/Amorurz+9zUPRkZF
	W/us7BSJLhTz5X5YfNtKXqd5pHfrOrtPl7DILOWl6oeb6ifYkGY/GKshybtH9KvYUITgU/HOfZIZI
	TNsKbCecN8Obr0u2lmgbuSfa0hvDX4eh18UPu6evBrNCNr5WOAP4TMwixxbGDFPFwEc9WoK32gNOe
	AREAyTkvHnazVns4yzCvZNkHHmRCr6dGuDODxOYLQp9kpD3JzwzM3CGdH31LDEKoVt/kVfeFU9bJH
	YFGpeDYHBuMncXGAev7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPPIT-002rcZ-M8; Wed, 02 Mar 2022 13:45:41 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPPIH-002rVZ-EC; Wed, 02 Mar 2022 13:45:31 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 6DD9192009C; Wed,  2 Mar 2022 14:45:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 6929692009B;
 Wed,  2 Mar 2022 13:45:22 +0000 (GMT)
Date: Wed, 2 Mar 2022 13:45:22 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Icenowy Zheng <icenowy@aosc.io>
cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
In-Reply-To: <8e799cadb1104714f998fe74e40b3cb052c9c1ed.camel@aosc.io>
Message-ID: <alpine.DEB.2.21.2203021337430.58475@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
 <8e799cadb1104714f998fe74e40b3cb052c9c1ed.camel@aosc.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_054529_657306_3F08861F 
X-CRM114-Status: GOOD (  20.30  )
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

T24gV2VkLCAyIE1hciAyMDIyLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgoKPiA+IFRoZSBvbmx5IFBD
SSBwbGF0Zm9ybXMgdGhhdCBhY3R1YWxseSBjYW4ndCBtYWtlIHVzZSBvZiBQQy1zdHlsZQo+ID4g
cGFyYWxsZWwgCj4gPiBwb3J0IGhhcmR3YXJlIGFyZSB0aG9zZSBuZXdlciBQQ0llIHN5c3RlbXMg
dGhhdCBoYXZlIG5vIHN1cHBvcnQgZm9yCj4gPiBJL08gCj4gPiBjeWNsZXMgaW4gdGhlIGhvc3Qg
YnJpZGdlLCByZXF1aXJlZCBieSBzdWNoIHBhcmFsbGVsIHBvcnRzLsKgIE5vdGFibHksCj4gPiB0
aGlzIGluY2x1ZGVzIHRoZSBzMzkwIGFyY2gsIHdoaWNoIGhhcyBwb3J0IEkvTyBhY2Nlc3NvcnMg
dGhhdCBjYXVzZSAKPiA+IGNvbXBpbGF0aW9uIHdhcm5pbmdzIChwcm9tb3RlZCB0byBlcnJvcnMg
d2l0aCBgLVdlcnJvcicpLCBhbmQgdGhlcmUKPiA+IGFyZSAKPiA+IG90aGVyIGNhc2VzIHN1Y2gg
YXMgdGhlIFBPV0VSOSBQSEI0IGRldmljZSwgdGhvdWdoIHRoaXMgb25lIGhhcwo+ID4gdmFyaWFi
bGUgCj4gPiBwb3J0IEkvTyBhY2Nlc3NvcnMgdGhhdCBkZXBlbmQgb24gdGhlIHBhcnRpY3VsYXIg
c3lzdGVtLsKgIEFsc28gaXQgaXMKPiA+IG5vdCAKPiA+IGNsZWFyIHdoZXRoZXIgdGhlIHNlcmlh
bCBwb3J0IHNpZGUgb2YgZGV2aWNlcyBlbmFibGVkIGJ5Cj4gPiBQQVJQT1JUX1NFUklBTCAKPiA+
IHVzZXMgcG9ydCBJL08gb3IgTU1JTy7CoCBGaW5hbGx5IFN1cGVyIEkvTyBzb2x1dGlvbnMgYXJl
IGFsd2F5cyBlaXRoZXIKPiA+IElTQSBvciBwbGF0Zm9ybSBkZXZpY2VzLgo+IAo+IEp1c3Qgc3Bv
dCB0aGlzIHBhdGNoIGluIGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdCwgSSB0aGluayB0aGVyZSdz
IGEKPiBwZW5kaW5nIHBhdGNoc2V0IHRoYXQgdHJpZXMgdG8gYWRkIGEgSEFTX0lPUE9SVCBLY29u
ZmlnIG9wdGlvbiwgd2hpY2gKPiBjYW4gYmUgdXNlZCBpbiB0aGlzIHNpdHVhdGlvbi4KCiBUaGFu
a3MgZm9yIHlvdXIgaW5wdXQuCgogVGhhdCBoYXMgYmVlbiBhY3R1YWxseSBkaXNjdXNzZWQgYWxy
ZWFkeSB3aXRoIGEgY29uY2x1c2lvbiB0aGF0IG1vcmUgd29yayAKaXMgcmVxdWlyZWQgdG8gaGF2
ZSBIQVNfSU9QT1JUIHN1cHBvcnRlZCwgc2VlIHRoZSB0aHJlYWQgc3RhcnRpbmcgZnJvbTogCjxo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBTXVITWRXLXV0Y0Z6Q1pUZ3FPTmp4cz1VNjYy
bkYwPWFCUXU3Wmk3RkJRb3V3aUEzZ0BtYWlsLmdtYWlsLmNvbS8+LiAKKHRoZXJlJ3MgYSByZWZl
cmVuY2UgdG8gdGhlIEhBU19JT1BPUlQgcGF0Y2hzZXQgdGhlcmUgYXMgd2VsbCkuICBPbmNlIHRo
YXQgCmhhcyBiZWVuIHNvcnRlZCBjb25maWd1cmF0aW9uIGNvbmRpdGlvbnMgZm9yIHRoZSBwYXJw
b3J0IGRyaXZlciBjYW4gYmUgCnVwZGF0ZWQgYWNjb3JkaW5nbHkuICBGb3IgdGhlIHRpbWUgYmVp
bmcgdGhlICFTMzkwIHF1YWxpZmljYXRpb24gc2hvdWxkIApkby4KCiAgTWFjaWVqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
