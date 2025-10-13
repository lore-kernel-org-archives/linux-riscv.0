Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F257ACCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JEMtBNFHGraSlRsWa/gLoZgW+Zx34XXWisVPPANLksY=; b=RzJtgpNrdy+Vp5
	dfZbZmQ/bYJd/9CgC7erjLvNz42h/vb6sVfODHBC537LKy/f1enf7Xu+VDWJvKtOaXR7Z4HbqiTDK
	FDV9UmU/qFcvxLF9o1XH7NUEldessD47YPlAufnbwQMdJLGQsII90Mlwy36qP2AsFOPqikwKzSy8a
	0py7z7S+Ao19eZTCEX+3tbEmnTB8seyZ55htoTc0ew5j0D2ZGSQzfO3hu8gqU+H2PAIjpG6u5Jh69
	hD/EaLagGOJ1l8W+BNxGkM7AYDUdIkuOfpJUPcnAc1nYfspgYYOAwWzJtNpvWNVcMzFM8QfqSqyMY
	UBhqhINWlYD99kRwlRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Q5M-0000000EY7T-2XTR;
	Mon, 13 Oct 2025 21:28:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Q5L-0000000EY6D-10K7
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DBE561EEE;
	Mon, 13 Oct 2025 21:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E310C4CEE7;
	Mon, 13 Oct 2025 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760390882;
	bh=/vCGp4dN24zHOrwDoNn2Y3f2GKlV2uG2TwuEjOBom6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZIJFx1Tri7fL9usBTJ8do1OAIl55dlPPxgGzv8879OtuSZXEQocmMJuhBTt9ZnmJZ
	 7rr/Osh9CVL5KjyPVXe30y6i8jHTMrOZzM/6dicRhIGgNCo6fucDxBBo4A7WA3ize6
	 KszucXDO3LlfB8d1tgRwVI/S/YkQ2nbOaD0FlrvHBk/sq9P7rv4UbAgrXVfB34G2vm
	 OnHj3EaySJoEa2UEd6xvQk5WH8lRK/a2n3r1CBwvYomRmoqEzvgo598OEDlDfXs0EU
	 3So5a6C258p/jGkNHSJ+oct9LfP6UAAVuhCt+7ayu4rwvYXh7e72AEbvrAjeX/Yj4A
	 J8+UxKF35KepA==
Date: Mon, 13 Oct 2025 16:28:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ron Economos <re@w6rz.net>
Cc: bhelgaas@google.com, rishna.chundru@oss.qualcomm.com, mani@kernel.org,
	helgaas@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>, regressions@lists.linux.dev
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
Message-ID: <20251013212801.GA865570@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eac81c57-1164-4d74-a1b4-6f353c577731@w6rz.net>
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

WytjYyBGVTc0MCBkcml2ZXIgZm9sa3MsIENvbm9yLCByZWdyZXNzaW9uc10KCk9uIE1vbiwgT2N0
IDEzLCAyMDI1IGF0IDEyOjE0OjU0QU0gLTA3MDAsIFJvbiBFY29ub21vcyB3cm90ZToKPiBUaGUg
U2lGaXZlIEZVNzQwIFBDSSBkcml2ZXIgZmFpbHMgb24gdGhlIEhpRml2ZSBVbm1hdGNoZWQgYm9h
cmQgd2l0aCBMaW51eAo+IDYuMTgtcmMxLiBUaGUgZXJyb3IgbWVzc2FnZSBpczoKPiAKPiBbwqDC
oMKgIDMuMTY2NjI0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBob3N0IGJyaWRnZSAvc29j
L3BjaWVAZTAwMDAwMDAwCj4gcmFuZ2VzOgo+IFvCoMKgwqAgMy4xNjY3MDZdIGZ1NzQwLXBjaWUg
ZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoMKgIElPCj4gMHgwMDYwMDgwMDAwLi4weDAwNjAwOGZm
ZmYgLT4gMHgwMDYwMDgwMDAwCj4gW8KgwqDCoCAzLjE2Njc2N10gZnU3NDAtcGNpZSBlMDAwMDAw
MDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+IDB4MDA2MDA5MDAwMC4uMHgwMDdmZmZmZmZmIC0+IDB4
MDA2MDA5MDAwMAo+IFvCoMKgwqAgMy4xNjY4MDVdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6
wqDCoMKgwqDCoCBNRU0KPiAweDIwMDAwMDAwMDAuLjB4M2ZmZmZmZmZmZiAtPiAweDIwMDAwMDAw
MDAKPiBbwqDCoMKgIDMuMTY2OTUwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBFQ0FNIGF0
IFttZW0KPiAweGRmMDAwMDAwMC0weGRmZmZmZmZmZl0gZm9yIFtidXMgMDAtZmZdCj4gW8KgwqDC
oCAzLjU3OTUwMF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogTm8gaUFUVSByZWdpb25zIGZv
dW5kCj4gW8KgwqDCoCAzLjU3OTU1Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRmFpbGVk
IHRvIGNvbmZpZ3VyZSBpQVRVIGluIEVDQU0KPiBtb2RlCj4gW8KgwqDCoCAzLjU3OTY1NV0gZnU3
NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogcHJvYmUgd2l0aCBkcml2ZXIgZnU3NDAtcGNpZQo+IGZh
aWxlZCB3aXRoIGVycm9yIC0yMgo+IAo+IFRoZSBub3JtYWwgbWVzc2FnZSAob24gTGludXggNi4x
Ny4yKSBpczoKPiAKPiBbwqDCoMKgIDMuMzgxNDg3XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2ll
OiBob3N0IGJyaWRnZSAvc29jL3BjaWVAZTAwMDAwMDAwCj4gcmFuZ2VzOgo+IFvCoMKgwqAgMy4z
ODE1ODRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoMKgIElPCj4gMHgwMDYw
MDgwMDAwLi4weDAwNjAwOGZmZmYgLT4gMHgwMDYwMDgwMDAwCj4gW8KgwqDCoCAzLjM4MTY4Ml0g
ZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+IDB4MDA2MDA5MDAwMC4u
MHgwMDdmZmZmZmZmIC0+IDB4MDA2MDA5MDAwMAo+IFvCoMKgwqAgMy4zODE3MjRdIGZ1NzQwLXBj
aWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0KPiAweDIwMDAwMDAwMDAuLjB4M2ZmZmZm
ZmZmZiAtPiAweDIwMDAwMDAwMDAKPiBbwqDCoMKgIDMuNDg0ODA5XSBmdTc0MC1wY2llIGUwMDAw
MDAwMC5wY2llOiBpQVRVOiB1bnJvbGwgVCwgOCBvYiwgOCBpYiwgYWxpZ24KPiA0SywgbGltaXQg
NDA5NkcKPiBbwqDCoMKgIDMuNjgzNjc4XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0ll
IEdlbi4xIHg4IGxpbmsgdXAKPiBbwqDCoMKgIDMuODgzNjc0XSBmdTc0MC1wY2llIGUwMDAwMDAw
MC5wY2llOiBQQ0llIEdlbi4zIHg4IGxpbmsgdXAKPiBbwqDCoMKgIDMuOTg3Njc4XSBmdTc0MC1w
Y2llIGUwMDAwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHg4IGxpbmsgdXAKPiBbwqDCoMKgIDMuOTg4
MTY0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAw
MDA6MDAKPiAKPiBSZXZlcnRpbmcgdGhlIGZvbGxvd2luZyBjb21taXRzIHNvbHZlcyB0aGUgaXNz
dWUuCj4gCj4gMGRhNDhjNWIyZmE3MzFiMjFiYzUyM2M4MmQ5MjczOTlhMWU1MDhiMCBQQ0k6IGR3
YzogU3VwcG9ydCBFQ0FNIG1lY2hhbmlzbSBieQo+IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBG
ZWF0dXJlJwo+IAo+IDQ2NjBlNTBjZjgxODAwZjgyZWVlY2Y3NDNhZDFlM2U5N2FiNzIxOTAgUENJ
OiBxY29tOiBQcmVwYXJlIGZvciB0aGUgRFdDIEVDQU0KPiBlbmFibGVtZW50Cj4gCj4gZjZmZDM1
N2Y3YWZiZWIzNGE2MzNlNTY4OGEyM2I5ZDdlYjQ5ZDU1OCBQQ0k6IGR3YzogUHJlcGFyZSB0aGUg
ZHJpdmVyIGZvcgo+IGVuYWJsaW5nIEVDQU0gbWVjaGFuaXNtIHVzaW5nIGlBVFUgJ0NGRyBTaGlm
dCBGZWF0dXJlJwoKQXMgQ29ub3IgcG9pbnRlZCBvdXQsIHdlIGNhbid0IGZpeCBhIGNvZGUgcmVn
cmVzc2lvbiB3aXRoIGEgRFQgY2hhbmdlLgoKI3JlZ3pib3QgaW50cm9kdWNlZDogZjZmZDM1N2Y3
YWZiICgiUENJOiBkd2M6IFByZXBhcmUgdGhlIGRyaXZlciBmb3IgZW5hYmxpbmcgRUNBTSBtZWNo
YW5pc20gdXNpbmcgaUFUVSAnQ0ZHIFNoaWZ0IEZlYXR1cmUnIikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
