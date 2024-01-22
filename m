Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5716FC46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 21:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbVEQbAhTImHS1tLv8GecN57XDhOL1g5yIR6jnez2qw=; b=SYluW5/9Ibg5YN
	QYjIJWOwLcB1ioSyylzk45odtvrD692GU9n4zUOnalMDc7gMGL8SOQTk7ftvE9dkor1DWnHx+lW/U
	gIc54YJOeN8rJacnvkhS8vvOUvbtnZXRV5vR4hDDRULhMGeg9I35q1Z2tVuIahX+zSB4lcu2anICL
	GKRil16RmAqTYyOuCXWenWLzDBqEHY4454NxOZcJIOB0zUcKOPVqnAVtRr4LRbu+jo4HVXZMMQBur
	51gOfL0OB9yGjNy+FfEfPjk5FT+rzD7ba/67iWXMwbImXcPl/xdfeCVrBGI2WHUjOb4eYUKTcNy7J
	oOzBMsejcSchPzc2QShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS2Ha-00EEK3-1e;
	Mon, 22 Jan 2024 21:56:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS2HW-00EEJF-2O;
	Mon, 22 Jan 2024 21:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DlkxdPo00vFXMtifZbwmiD3pZWcfGIoDSDnanNUdXxo=; b=XtyKsMO6Yn2dYk1lNRNde3BiDP
	un+RAJyMR6k8+9e/yJl2r+Ov0qOcDIbhiz/y/7GX3fw87B0GNJ/3HmCLVJiLb2Ks1V96LgACams6f
	cX+obUMvFpeX/Pmcl6RnUH2y50c9vxvFy0DDxefuB+2qrsso/uyXuGtyvj3A9FRQHRH/QBhxa5OTm
	Zz/RSWt46rOm+BHPj4216FX8QXMjUNV0DnJe0jlcqUzpr7YBglGllncVFHK+j40azOzpeA1xvOtkS
	tXvN5txsFycplH3UgwgXX380INC6PxDJ2P3HQ+KLP+EUK49pbp89QiATkRHw/56ttdlNvv/I2Oqdt
	A0vRazAA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rS2HI-0001cI-2Q;
	Mon, 22 Jan 2024 21:56:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rS2HC-0001MW-T5; Mon, 22 Jan 2024 21:56:18 +0000
Date: Mon, 22 Jan 2024 21:56:18 +0000
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
Subject: Re: [PATCH RFC v3 04/21] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <Za7kglu6qO1n5ZCg@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
 <CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_135638_805635_31B10E51 
X-CRM114-Status: GOOD (  13.77  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDk6MzA6NTBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gU3lzdGVtcyBjYW4gc3Rp
bGwgYmUgYm9vdGVkIHdpdGggJ2FjcGk9b2ZmJywgb3Igbm90IGluY2x1ZGUgYW4KPiA+IEFDUEkg
ZGVzY3JpcHRpb24gYXQgYWxsLiBGb3IgdGhlc2UsIHRoZSBDUFVzIGNvbnRpbnVlIHRvIGJlCj4g
PiByZWdpc3RlcmVkIGJ5IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYygpLgo+ID4KPiA+IFRoaXMg
bW92ZXMgdGhlIENQVSByZWdpc3RlciBsb2dpYyBiYWNrIHRvIGEgc3Vic3lzX2luaXRjYWxsKCks
Cj4gPiB3aGlsZSB0aGUgbWVtb3J5IG5vZGVzIHdpbGwgaGF2ZSBiZWVuIHJlZ2lzdGVyZWQgZWFy
bGllci4KPiAKPiBJc24ndCB0aGlzIHNvbWV3aGF0IHJpc2t5PwoKTm90IHJlYWxseS4gVGhlIGVh
cmxpZXIgZnVsbCBzZXJpZXMgbW92ZWQgdGhlIHJlZ2lzdHJhdGlvbiBvZiBDUFVzCmZyb20gc3Vi
c3lzIChieSB0aGUgdmFyaW91cyBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgY29kZSkgaW50byB0aGUK
ZHJpdmVyIGNvcmUgLSB0aHVzIG1vdmluZyBpdCBtdWNoIGVhcmxpZXIuIFRoaXMgcGF0Y2ggbWVy
ZWx5CnJlc3RvcmVzIGl0IGJhY2sgdG8gdGhlIHN1YnN5cyBpbml0aWFsaXNhdGlvbiBzdGFnZS4K
ClRoZXJlIGlzIGEgbG93IGNoYW5jZSB0aGF0IHNvbWV0aGluZyBfY291bGRfIGhhdmUgYmVjb21l
IHJlbGlhbnQKb24gdGhhdCBjaGFuZ2UgLSBhbmQgdGhlIGxvbmdlciBpdCB0YWtlcyBmb3IgdGhp
cyBjaGFuZ2UgdG8gYmUKbWVyZ2VkLCB0aGUgbW9yZSByaXNrIHRoZXJlIGlzIHRoYXQgc29tZXRo
aW5nIGNvdWxkIGJlY29tZSByZWxpYW50Cm9uIENQVXMgYmVpbmcgcmVnaXN0ZXJlZCB2ZXJ5IGVh
cmx5LgoKTWF5YmUgdGhpcyBvdWdodCB0byBiZSBzcGVsdCBvdXQgbW9yZSBleHBsaWNpdGx5IHRo
YXQgaXQncyBtZXJlbHkKcmVzdG9yaW5nIHRoZSBwb2ludCBhdCB3aGljaCBDUFVzIGFyZSByZWdp
c3RlcmVkLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3Jn
LnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1
cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
