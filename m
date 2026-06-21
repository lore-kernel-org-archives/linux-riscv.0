Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D0DCD98F0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 06:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1tERA+u7JvnizdSuJ238eIBsp42IME/pG9K2KnYQDE=; b=CyASYjJdGzyZTD
	NzXWB+OPaXoHkEOBx+wTYYmThJK/t+xafk+5ws4AVQ5elonVIMhFdvEL3I1ZxpxrIDZmqEv4dL19l
	IhjIElLvClJrII7GAAMcw61VXx/MFBPh5wxsrlhYxsheTXzKvefDa2ExqnN4dgTnaucvK8lHOsejS
	ovxsk/J0p8f3rCmlDXSZTHFuFy7tpC85WblJveTpFS4yM4QY+hsa509dlcrV9S/+k1JYV00ggfYML
	MyHyyTMmKxzg1hLyfzqxnSERcPYP7HC6rEupVZ+qsPBepXg40iw2pAKBpxC4NXXKgSORQqVnkeMaX
	KN5oAzO7xMqiz24Gb1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbC3E-00000003mWm-2Wg1;
	Sun, 21 Jun 2026 06:53:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbC3D-00000003mWf-4Anb
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 06:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E5060051;
	Sun, 21 Jun 2026 06:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8281F000E9;
	Sun, 21 Jun 2026 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782024781;
	bh=JhZlBu9SdfAZGdDjAMHbR85c9tDS0ug0vz9c84b8zSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3KSZhini09jmdcT1J2c7Gan8C+du4ROFAnbeyot1K8YN7d0Aqw7e4RpHDdZlSWz5
	 VZjXtW5/W0RI/7Zhl+GAaIxKBlOdLaKQ2u7ZVE2Ux2uJAkO6ELu7Vhz35vosaWPpJL
	 0xNrhvihUXiaLKUKAJKcPn/Cf+yzkGKMoGCAZ2gJ9wfFCqnlZlLDHFD1WInwJhouvy
	 7LREb4B5oS7DwPNFcGgM0diT6l5o2A6syHwALTxgxI6GGLXFXn0h6COUN05WIe2UvM
	 IzQ4rCXui2c2bGEtpegfM3113rSZWsVA8/Vuh+IfR0d/MeNZ7yuLQcYxLYHUbuOkVK
	 6SIz2LikfVxfA==
Date: Sun, 21 Jun 2026 02:52:46 -0400
From: Guo Ren <guoren@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
	palmer@dabbelt.com, bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <ajeKPpg2rwadVPY4@gmail.com>
References: <20230702025708.784106-1-guoren@kernel.org>
 <202606191652.38297DE51@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202606191652.38297DE51@keescook>
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

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgMDQ6NTQ6NTNQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+ICp0aHJlYWQgZW5jcm9tYW5jeSoKPiAKPiBPbiBTYXQsIEp1bCAwMSwgMjAyMyBhdCAxMDo1
NzowN1BNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4g
PGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IAo+ID4gVGhlIGlycWVudHJ5X25taV9lbnRl
ci9leGl0IHdvdWxkIGZvcmNlIHRoZSBjdXJyZW50IGNvbnRleHQgaW50byBpbl9pbnRlcnJ1cHQu
Cj4gPiBUaGF0IHdvdWxkIHRyaWdnZXIgdGhlIGtlcm5lbCB0byBkZWFkIHBhbmljLCBidXQgdGhl
IGtkYiBzdGlsbCBuZWVkcyAiZWJyZWFrIiB0bwo+ID4gZGVidWcgdGhlIGtlcm5lbC4KPiA+IAo+
ID4gTW92ZSBpcnFlbnRyeV9ubWlfZW50ZXIvZXhpdCB0byBleGNlcHRpb25fZW50ZXIvZXhpdCBj
b3VsZCBjb3JyZWN0IGhhbmRsZV9icmVhawo+ID4gb2YgdGhlIGtlcm5lbCBzaWRlLgo+ID4gCj4g
PiBCZWZvcmUgdGhlIGZpeHVwOgo+ID4gJGVjaG8gQlVHID4gL3N5cy9rZXJuZWwvZGVidWcvcHJv
dm9rZS1jcmFzaC9ESVJFQ1QKPiA+ICAgbGtkdG06IFBlcmZvcm1pbmcgZGlyZWN0IGVudHJ5IEJV
Rwo+ID4gICAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+ICAga2VybmVs
IEJVRyBhdCBkcml2ZXJzL21pc2MvbGtkdG0vYnVncy5jOjc4IQo+ID4gWy4uLl0KPiA+ICAgS2Vy
bmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEFpZWUsIGtpbGxpbmcgaW50ZXJydXB0IGhhbmRsZXIh
Cj4gCj4gVGhpcyBhcHBlYXJzIHRvIHN0aWxsIGJlIHVuZml4ZWQuIFdoYXQncyB0aGUgYmxvY2tl
cj8gVGhlIHNvbHV0aW9ucyBpbgo+IHRoaXMgdGhyZWFkIHNlZW0gdG8gd29yay4uLgo+IAo+IEkn
ZCBsaWtlIHRvIGJlIGV4ZXJjaXNpbmcgYW4gT29wcyBwYXRoIHZpYSBLVW5pdCAoZm9yIEtDRkkp
LCBhbmQgcmlzY3YKPiBqdXN0IGluc3RhbnRseSBmYWxscyBvdmVyIGluc3RlYWQgb2YgdGhyZWFk
LWtpbGxpbmcgb24gdGhlIGV4Y2VwdGlvbi4KVGhhbmtzIGZvciByZXZpdmluZyB0aGlzIHRocmVh
ZC4gQXQgdGhlIHRpbWUgSSBkaWRu4oCZdCBmdWxseSB1bmRlcnN0YW5kClBldGVy4oCZcyBwb2lu
dC4gV2Ugc2hvdWxkIG9ubHkgdXNlIHRoZSBOTUkgcGF0aCB3aGVuIHRoZSB0cmFwIG9jY3VycyB3
aXRoCmludGVycnVwdHMgZGlzYWJsZWQuCkhlcmXigJlzIHRoZSB1cGRhdGVkIGZpeDoKCiBkb190
cmFwX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQouLi4gCiAJCWlycWVudHJ5X2V4aXRfdG9f
dXNlcl9tb2RlKHJlZ3MpOwogCX0gZWxzZSB7Ci0JCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBp
cnFlbnRyeV9ubWlfZW50ZXIocmVncyk7CisJCWlmIChyZWdzLT5zdGF0dXMgJiBTUl9JRSkgewor
CQkJZW51bSBjdHhfc3RhdGUgcHJldl9zdGF0ZSA9IGV4Y2VwdGlvbl9lbnRlcigpOwogCi0JCWhh
bmRsZV9icmVhayhyZWdzKTsKKwkJCWhhbmRsZV9icmVhayhyZWdzKTsKIAotCQlpcnFlbnRyeV9u
bWlfZXhpdChyZWdzLCBzdGF0ZSk7CisJCQlleGNlcHRpb25fZXhpdChwcmV2X3N0YXRlKTsKKwkJ
fSBlbHNlIHsKKwkJCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIo
cmVncyk7CisKKwkJCWhhbmRsZV9icmVhayhyZWdzKTsKKworCQkJaXJxZW50cnlfbm1pX2V4aXQo
cmVncywgc3RhdGUpOworCQl9CiAJfQogfQoKSWYgeW91ICYgUGV0ZXIgaGF2ZSBubyBvYmplY3Rp
b24sIEnigJlsbCBwb3N0IGEgdjIuCgpCZXN0IFJlZ2FyZHMKICBHVU8gUmVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
