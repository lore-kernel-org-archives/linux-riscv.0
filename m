Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 20:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEKFp3Gc+ULopBJtdMGqAVhco0rtPSRTTw/R4Bp1Yjc=; b=CafVzIoQ3HKYWZ
	VDzdxt2FEKbdCY+T4QBUPtn3+QmYvKmC1Z75F1AjaUxEYyx9Hxhe4QVPImxz7YLhIboLX3u8cABZo
	Svy+UmxPLrgoT2jAr38PZRZPumB/a1UEeBFBawKhHTyTJFVBr8g4wlmQFXToMn1R3yUSP3uYYdEww
	sz21cHxhlaRkHRgec2aQVUUqf2u0u4uOXDVGut4UZTI2SWuOy9EpjMjK0c1DuBCfDrZMRWxjUlKb5
	FGk7q6sNqIVfv6zm5t6Kh98nrdKsGnxGRKmzwpyuCfo9MXA3GL85gumkJbkgIIhO2QOTW6jwyVaP7
	MDAUURNMwNkv5csUm7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9Bm-00CgNY-2q;
	Tue, 12 Dec 2023 20:17:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9Bj-00CgME-1p;
	Tue, 12 Dec 2023 20:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PDwWMvE707rKJbV02zug7t37qFDv7YOoytMyP2X6xyQ=; b=Le1a7b+MYxlb3kfygQ0jhZGDz+
	1KEl3WefH1wExk5k9L8RKfyjQb31NtNsFDmeS4rbyNsnV/AXUNGZ4lb5p5n6bzlws55DQTx6h0Pci
	2u3wY6NiE6B+lMqsPbDzadz2m2GUvO+8cAcQqTDUn2jhye7PisBrMewyqd/QZUPpAurEe+jBmHuOo
	QZY3oxISKjP6uooc+4ddKW0Y68+IKpagaLdIr/CvX94n5Xo5rkXFcE7Uvf+3APlWLA0ytjjrnZlrN
	8dsbOoFtwrn6T2CxI8FRZWBoRtSUTRQ8ww5gyZJb/FHHmDSGFj8cA+TDfANxb1MalWyb1DtUqoygz
	L/AUbcjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58234)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rD9Ba-0007OH-0y;
	Tue, 12 Dec 2023 20:16:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rD9Bb-0000jo-UJ; Tue, 12 Dec 2023 20:16:59 +0000
Date: Tue, 12 Dec 2023 20:16:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual
 cpuhotplug
Message-ID: <ZXi/u7dZ20oLPF9n@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
 <ZW4ZBkj2oCmxv55T@shell.armlinux.org.uk>
 <ZXi7do4mVfdsz/k0@shell.armlinux.org.uk>
 <CAJZ5v0jOU4Re2g5QtxpG0RjP3MYBxqz5Z+TtfXq2dz8HTq9A0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jOU4Re2g5QtxpG0RjP3MYBxqz5Z+TtfXq2dz8HTq9A0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_121707_605035_349A947D 
X-CRM114-Status: GOOD (  27.32  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMDk6MDU6MTRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgODo1OOKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IE9uIE1v
biwgRGVjIDA0LCAyMDIzIGF0IDA2OjIzOjAyUE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xl
KSB3cm90ZToKPiA+ID4gT24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMDg6MjY6NThQTSArMDIwMCwg
UmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gSSd2ZSBnb25lIHRocm91Z2ggdGhlIHNl
cmllcyBhbmQgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHRoaW5nIGluIGl0Cj4gPiA+ID4gdGhhdCBj
b25jZXJucyBtZSBhIGxvdCBhbmQgc29tZSBvdGhlcnMgdGhhdCBhdCBsZWFzdCBhcHBlYXIgdG8g
YmUKPiA+ID4gPiByZWFsbHkgcXVlc3Rpb25hYmxlLgo+ID4gPiA+Cj4gPiA+ID4gSSBuZWVkIG1v
cmUgdGltZSB0byBzZW5kIGNvbW1lbnRzIHdoaWNoIEknbSBub3QgZ29pbmcgdG8gZG8gYmVmb3Jl
IHRoZQo+ID4gPiA+IDYuNyBtZXJnZSB3aW5kb3cgKHNvcnJ5KSwgYnV0IGZyb20gd2hhdCBJIGNh
biBzYXkgcmlnaHQgbm93LCB0aGlzIGlzCj4gPiA+ID4gbm90IGxvb2tpbmcgZ29vZC4KPiA+ID4K
PiA+ID4gSGkgUmFmYWVsLAo+ID4gPgo+ID4gPiBXaWxsIHlvdSBiZSBhYmxlIHRvIHNlbmQgeW91
ciBjb21tZW50cywgc28gdGhhdCB3ZSBjYW4gZmluZCBvdXQgd2hhdAo+ID4gPiB5b3VyIG90aGVy
IGNvbmNlcm5zIGFyZSBwbGVhc2U/IEknbSBnZXR0aW5nIHF1ZXN0aW9ucyBmcm9tIGludGVyZXN0
ZWQKPiA+ID4gcGFydGllcyB3aG8gd2FudCB0byBrbm93IHdoYXQgeW91ciBjb25jZXJucyBhcmUu
Cj4gPiA+Cj4gPiA+IE5vdGhpbmcgbXVjaCBoYXMgY2hhbmdlZCB0byB0aGUgQUNQSSBjaGFuZ2Vz
LCBzbyBJIHRoaW5rIGl0J3Mgc3RpbGwKPiA+ID4gdmFsaWQgdG8gaGF2ZSB0aGUgY29tbWVudHMg
YmFjayBmb3IgdGhpcy4KPiA+Cj4gPiBIaSBSYWZhZWwsCj4gPgo+ID4gQW5vdGhlciBnZW50bGUg
cHJvZCBvbiB0aGlzLi4uCj4gCj4gVGhlcmUgd2FzIGEgc2VsZWN0aW9uIG9mIHRoZSBwYXRjaGVz
IGluIHRoZSBzZXJpZXMgc2VudCBzZXBhcmF0ZWx5IGFuZAo+IEkgYmVsaWV2ZSB0aGF0IHNvbWUg
b2YgdGhlbSBoYXZlIGJlZW4gYXBwbGllZCBhbHJlYWR5Lgo+IAo+IENhbiB5b3UgcGxlYXNlIHNl
bmQgdGhlIHJlbWFpbmluZyBwYXRjaGVzIGFnYWluIHNvIGl0IGlzIGNsZWFyIHdoYXQncwo+IHN0
aWxsIG91dHN0YW5kaW5nPwoKSSBjYW4gZG8gdG9tb3Jyb3csIHRoYW5rcy4gSSB3aWxsIHJlLXBv
c3QgYXMgUkZDIGFnYWluIGJlY2F1c2UgaXQgd2lsbApkZXBlbmQgb24gdGhlIGNsZWFudXAgcGFy
dCB0aGF0IHdhcyBtZXJnZWQgaW50byBHcmVnJ3MgdHJlZSAtIGFuZCB0aHVzCnRoZSBzZXJpZXMg
aXNuJ3Qgc3RhbmRhbG9uZSAoYW5kIEknbGwgbWVudGlvbiB0aGF0IGluIHRoZSBjb3ZlcgptZXNz
YWdlLikKCldlIG5lZWQgdG8gaGVhciB5b3VyIGNvbmNlcm5zLCB3aGljaCBzb3VuZGVkIHF1aXRl
IGRhbW5pbmcgZm9yIHRoZQpzZXJpZXMsIHNvIHRoYXQgaWYgaXQncyBwb3NzaWJsZSB0byBzYXZl
IHRoaXMgYSBwbGFuIHRvIGFkZHJlc3MgeW91cgpjb25jZXJucyBjYW4gYmUgZm9ybXVsYXRlZC4K
ClRoYW5rcy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9y
Zy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMg
dXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
