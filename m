Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015DDC8303B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtxC10+CXQ2jm2JTe7dalcmR9MRsNwiSEU03mEW9+Ek=; b=J/ThsnT4UTe1/R
	ZNDBp/QqZP8ZtTAMFKMIAB0X9nEJWeEfNMFyZkd9tcjK8kbJnzpjV4Q7Qx5A4RVMAUcrNU893XHAG
	7vMpzWxSEZjcGyGWKqHuqbvDcbltDeoJYh6dQ4kR2c+8PduW5jNHLl15kDBBd1JzQAjbDbXir8zAH
	NXPN/XuEwBO1UbkcShOOWC2pFs8tnEbfrR/QXXFbpM+UZE+oCXRgWtHwr08Rl506CGVYiue9U/Mlp
	9pyBFhjVJeC2uZSZzns75WHD1imS0UR6MCP11eOxDUqnntC2GF7wyFEQH3mryfi9zUfdZbivhH5Ox
	1QmNEuNGLHgFtWYXQRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVnQ-00000004KO8-1tph;
	Tue, 01 Jul 2025 07:52:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVVg-00000004HYd-3YR4
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 07:34:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751355270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3pTxglj7rUaxTbf+kwFx+KhAmOnfuP/vGPEozKgxCs=;
	b=SLeZn/oISCskojCC5wqqgkJTMqAEjmNuH4xDYrPBA0i6op+Z97AmYXCL+HlD+S5KcDZp8J
	nQY5EOq6Z3HVLD9yg7HySrFYQjHt1VW6/WiQbtknVAac7IwUQ1V3+SsO0gFDs1aLg4nfiY
	lpFfnmVp8ycxnL3nOZvpIxLIRypW6+ud0sLtDt7IBn/xtRfyqqdXf0wRO4HKzk7CFI2LJW
	CiUdtztRAczzn/EMp9Kxo4Kib0whDuR5R1Aq/NIJNCipHuGjHd+sbA6FbVnrlJURW+WK7D
	wWRLWcRmmCB27pSSSoohceSFres5pESoTLkbb1SvFWGUYzAmKhInlpkN51f10A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751355270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3pTxglj7rUaxTbf+kwFx+KhAmOnfuP/vGPEozKgxCs=;
	b=kq9kpmEIKmCa77n3xHqg9PI3O5HFmJRcwwTQpSTIlSYRrEyYHYsWXuF8zWLoho7nDnwtFh
	OlNhQPLGg8OnahDQ==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
In-Reply-To: <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
 <87wm8tmcsr.ffs@tglx>
 <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
Date: Tue, 01 Jul 2025 09:34:29 +0200
Message-ID: <87ikkcmkje.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_003433_105394_8ED39E75 
X-CRM114-Status: GOOD (  17.34  )
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

T24gVHVlLCBKdWwgMDEgMjAyNSBhdCAxMjowMCwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24s
IEp1biAzMCwgMjAyNSBhdCA5OjM54oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+PiA+IFdoZW4gaW5qZWN0aW5nIElQSXMgdG8gYSBzZXQgb2YgaGFydHMs
IHRoZSBJTVNJQyBJUEkgc3VwcG9ydCB3aWxsCj4+ID4gZG8gYSBzZXBhcmF0ZSBNTUlPIHdyaXRl
IHRvIFNFVElQTlVNX0xFIHJlZ2lzdGVyIG9mIGVhY2ggdGFyZ2V0Cj4+ID4gaGFydC4gVGhpcyBt
ZWFucyBvbiBhIHBsYXRmb3JtIHdoZXJlIElNU0lDIGlzIHRyYXAtbi1lbXVsYXRlZCwKPj4gPiB0
aGVyZSB3aWxsIGJlIE4gTU1JTyB0cmFwcyB3aGVuIGluamVjdGluZyBJUEkgdG8gTiB0YXJnZXQg
aGFydHMKPj4gPiBoZW5jZSBJUElzIGJhc2VkIG9uIElNU0lDIHNvZnR3YXJlIGluamVjdGVkIE1T
SSBpcyBzbG93IGNvbXBhcmVkCj4+ID4gdG8gdGhlIFNCSSBJUEkgZXh0ZW5zaW9uLgo+PiA+Cj4+
ID4gQWRkIGEga2VybmVsIHBhcmFtZXRlciB0byBkaXNhYmxlIElQSXMgaW4gSU1TSUMgZHJpdmVy
IGZvciBwbGF0Zm9ybXMKPj4gPiB3aXRoIHRyYXAtbi1lbXVsYXRlZCBJTVNJQy4KPj4KPj4gV2h5
IGRvIHlvdSBuZWVkIGEga2VybmVsIHBhcmFtZXRlciBmb3IgdGhhdC4gSWYgdGhlIHBsYXRmb3Jt
IHVzZXMgdHJhcC1uCj4+IGVtdWxhdGlvbiwgdGhlbiBkaXNhYmxlIHRoZSBJUEkgbXVjayBhdXRv
bWF0aWNhbGx5LCBubz8KPj4KPiBVbmZvcnR1bmF0ZWx5LCB3ZSBkb24ndCBoYXZlIERULCBBQ1BJ
LCBvciBhbnkgb3RoZXIgd2F5IG9mIGRpc2NvdmVyaW5nCj4gd2hldGhlciB1bmRlcmx5aW5nIElN
U0lDIGlzIHRyYXAtbi1lbXVsYXRlZC4gSW4gZmFjdCwgdGhlIERUIG9yIEFDUEkKPiBwYXNzZWQg
dG8gYSBLVk0gR3Vlc3QgaXMgdGhlIHNhbWUgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgdW5kZXJs
eWluZwo+IElNU0lDIGlzIHRyYXAtbi1lbXVsYXRlZCBvciBiYWNrZWQgYnkgaGFyZHdhcmUgSU1T
SUMgVlMtZmlsZS4KClNpZ2guCgo+IFVzaW5nIHNvZnR3YXJlIGluamVjdGVkIE1TSXMgYXMgSVBJ
cyBpcyBwdXJlbHkgYSBzb2Z0d2FyZSBjaG9pY2UgaW4gdGhlCj4gSU1TSUMgZHJpdmVyIHNvIHRo
aXMgbmV3IGtlcm5lbCBwYXJhbWV0ZXIgYWxsb3dzIHVzZXJzIHRvIG92ZXJyaWRlIGl0LgoKUGxl
YXNlIGFkZCB0aGF0IGluZm9ybWF0aW9uIHRvIHRoZSBjaGFuZ2UgbG9nLgoKVGhhbmtzLAoKICAg
ICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
