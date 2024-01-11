Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22176C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gy49y7zSIZU1Ad9QVdAtqVbVICmysX1lmmwk5eyc2d0=; b=DXZ5zqGAVyarMo
	6eTmF5yfYPtkVfVma0/P9/xOPbcUOdNVHVR6ige/1NGZLEoQsHSDlvMqYdpSVki0X5r3uignOmo6e
	28l5+DauE5QrhSuv596d8yPefiF9bWIfRgU6AsR4ps8kmXoU2KIV8KevNKcPLkVzkHyKMO0FaHMKI
	pkzGP6iHbGb7wSMGJKLh8pOBFqweLpF/K6zlQZ7jsku03YZNkGuRh58FuKtWrZecZli4TOOvju0Oh
	k6Ug4lLEyWXhmrUuypJ94W+YvxvVUG2/s+Hmgj2qi4f3CaOHDLdS3CzhMb5wAx0XU7ci3oLHzo9pJ
	1ITH/HPi1UgI+B/DPISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO05E-000xEU-11;
	Thu, 11 Jan 2024 18:47:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO058-000xBT-0n;
	Thu, 11 Jan 2024 18:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sG0vta/K25cX+m3KWmJQGIOyHDu76/qWE53sJiW1pFo=; b=QdyXNbVgAPkw53YLTW5MFLAwGd
	JSmyBJYT187WJ9+lEgwFU4PhK1dNACRkVKJfr68Vrl3dvWbrfDcajsyxvDC+L+X9FlhxRdzkHifJ7
	Nyxxyw4E6rhW4a9StvHd/8k0K7cZ2ejK8wWeAxlnWB3EXAqRbexHDSm2Ym+JznIMwLMETkZI1EOBF
	aFTVH+8Oirspf3X8ccXVNUEcwyl/yFabJZJG4kbTOUGr9HGQnWzceum2L980kdwneZgFV/2GpF9u7
	+ZMQvD6P6lp8CqjbYvw2rm5IOxMyXQjXa+F/gD8ocRGtER1nVEgTt8Q6I3eYKL9yLoSjoGENQ2Kyy
	yStOVlHw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54562)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rO04n-0006t8-0R;
	Thu, 11 Jan 2024 18:46:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rO04l-0006ah-8R; Thu, 11 Jan 2024 18:46:47 +0000
Date: Thu, 11 Jan 2024 18:46:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
 <20240111175908.00002f46@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111175908.00002f46@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_104710_283302_2422F0BE 
X-CRM114-Status: GOOD (  21.18  )
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

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMDU6NTk6MDhQTSArMDAwMCwgSm9uYXRoYW4gQ2FtZXJv
biB3cm90ZToKPiBPbiBNb24sIDE4IERlYyAyMDIzIDIxOjE3OjM0ICswMTAwCj4gIlJhZmFlbCBK
LiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4gT24gV2VkLCBEZWMg
MTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VA
YXJtLmNvbT4KPiAKPiBEb25lIHNvbWUgZGlnZ2luZyArIG1hY2hpbmUgZmFraW5nLiAgVGhpcyBp
cyBtaWQgc3RhZ2UgcmVzdWx0cyBhdCBiZXN0Lgo+IAo+IFN1bW1hcnk6IEkgZG9uJ3QgdGhpbmsg
dGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkuICBJZiBhbnlvbmUgaGFwcGVucyB0byBiZSBpbgo+IHRo
ZSBtb29kIGZvciB0ZXN0aW5nIG9uIHZhcmlvdXMgcGxhdGZvcm1zLCBjYW4geW91IGRyb3AgdGhp
cyBwYXRjaCBhbmQKPiBzZWUgaWYgZXZlcnl0aGluZyBzdGlsbCB3b3Jrcy4KPiAKPiBXaXRoIHRo
aXMgcGF0Y2ggaW4gcGxhY2UsIGFuZCBhIHByb2Nlc3NvciBjb250YWluZXIgY29udGFpbmluZwo+
IFByb2Nlc3NvcigpIG9iamVjdHMgYWNwaV9wcm9jZXNzX2FkZCBpcyBjYWxsZWQgdHdpY2UgLSBv
bmNlIHZpYQo+IHRoZSBwYXRoIGFkZGVkIGhlcmUgYW5kIG9uY2UgdmlhIGFjcGlfYnVzX2F0dGFj
aCBldGMuCj4gCj4gTWF5YmUgaXQncyBhIGxlZnQgb3ZlciBmcm9tIGVhcmxpZXIgYXBwcm9hY2hl
cyB0byBzb21lIG9mIHRoaXM/CgpGcm9tIHdoYXQgeW91J3JlIHNheWluZywgaXQgc2VlbXMgdGhh
dCB3YXkuIEl0IHdvdWxkIGJlIHJlYWxseSBnb29kIHRvCmdldCBhIHJlcGx5IGZyb20gSmFtZXMg
dG8gc2VlIHdoZXRoZXIgaGUgYWdyZWVzIC0gb3IgYXQgbGVhc3QgZ2V0IHRoZQpyZWFzb24gd2h5
IHRoaXMgcGF0Y2ggaXMgaW4gdGhlIHNlcmllcy4uLiBidXQgSSBzdXNwZWN0IHRoYXQgd2lsbCBu
ZXZlcgpjb21lLgoKPiBCb3RoIGNhc2VzIGFyZSBjb3ZlcmVkIGJ5IHRoZSBleGlzdGluZyBoYW5k
bGluZyB3aXRob3V0IHRoaXMuCj4gCj4gSSdtIGZhciBmcm9tIGNsZWFyIG9uIHdoeSB3ZSBuZWVk
IHRoaXMgcGF0Y2guICBQcmVzdW1hYmx5Cj4gaXQncyB0aGUgcmVmZXJlbmNlIGluIHRoZSBkZXNj
cmlwdGlvbiBvbiBpdCBicmVha2luZyBmb3IKPiBQcm9jZXNzb3IgUGFja2FnZSBjb250YWluaW5n
IFByb2Nlc3NvcigpIG9iamVjdHMgdGhhdCBtYXR0ZXJzCj4gYWZ0ZXIgYSBtb3ZlLi4uIEknbSBz
dHJ1Z2dsaW5nIHRvIGZpbmQgdGhhdCBtb3ZlIHRob3VnaCEKCkkgZG8ga25vdyB0aGF0IEphbWVz
IGRpZCBhIGxvdCBvZiB0ZXN0aW5nLCBzbyBtYXliZSBoZSBmb3VuZCBzb21lCmNvcm5lciBjYXNl
IHNvbWV3aGVyZSB3aGljaCBtYWRlIHRoaXMgbmVjZXNzYXJ5IC0gYnV0IHdpdGhvdXQgaW5wdXQK
ZnJvbSBKYW1lcywgd2UgY2FuJ3Qga25vdyB0aGF0LgoKU28sIG1heWJlIHRoZSByaWdodCB3YXkg
Zm9yd2FyZCBvbiB0aGlzIGlzIHRvIHJlLXRlc3QgdGhlIHNlcmllcwp3aXRoIHRoaXMgcGF0Y2gg
ZHJvcHBlZCwgYW5kIHNlZSB3aGV0aGVyIHRoZXJlJ3MgYW55IGlsbCBlZmZlY3RzLgpJdCBzaG91
bGQgYmUgcG9zc2libGUgdG8gcmVzdXJlY3QgdGhlIHBhdGNoIGlmIGl0IGRvZXMgdHVybiBvdXQg
dG8KYmUgbmVjZXNzYXJ5LgoKRG9lcyB0aGF0IHNvdW5kIGxpa2UgYSBnb29kIHdheSBmb3J3YXJk
PwoKVGhhbmtzLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJw
cyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
