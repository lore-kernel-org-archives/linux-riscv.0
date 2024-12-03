Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47220E77160
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxmEfyeISi6g91yUHYfe0znjF7HSTupEEvsFfCuL/JY=; b=sHq96SkG408uil
	CPsakH68g2du1EHTPuOqiARgQ4S9sY7d4GIC7xX65mAvqtfh0S3J9wHLOzHL3wBKZahzpfibrMe6W
	YfCKALdAYZr60J+GOQ0FiELqytFPxcEzNn1Rom6VG6ikGm9pW0s+bTkFw+NUjVeIOyAhn2b7miekc
	DlPIOw68C5/wy5pQYB2zIcYBs/l//fPUBCG1QzAnB4+cvJLaMNJUHMOqLn4hL+n+9FPc4A8VCiNNM
	QuLLJgVe4sdLaq7zK9cBDpSC2Q+246PfuskJFSwYskWVmtB7inNh3vAW1EGIdgvjhgjTU679EDQur
	uhnWGABLIZJLwiU0vqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbrY-0000000AynU-1qOG;
	Tue, 03 Dec 2024 22:59:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbrU-0000000Aym0-475D;
	Tue, 03 Dec 2024 22:59:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733266758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xkyLKWpUVdm6mfEZQQyS1yp6VoP0OWawZ5KoEQBw98=;
	b=uUpHwAstAvPIPqurwVOkG4Z+xsuHUFtZ1THMwPD1xXJxmU3itDeHHaJi+jhl8lLBJ7eZ/4
	rikeyL9y6/r0ZR071XOgksOdUYZ/PQCe+hGK2BvzyddYsmst8WpxFVe+UJVJzQGrdhxgcV
	HLNq7f9LeqLepzH7RGzXJqq5B5jJnr9J9t79clawHMUjQb2mmGKapYpb+SK2DhA2lakxq8
	iBadArbE9YJ0ZSq/71hfYpbAAi3BpT0+6GSmKjPazSH/yyLgWTtVB1F0ADpZ6/xF9oAxLK
	SGrYIEc+XE/odY9cufIHKNqH/CkVZlI3It65iNeu/FplcxvHLpJdwfka9aOq7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733266758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xkyLKWpUVdm6mfEZQQyS1yp6VoP0OWawZ5KoEQBw98=;
	b=c+FJ40EsursGL5c6ZmSdluV0Hszl6xqc8ugVFc+JqAg5TyAq0eyEU7V2yrjQR13ZoVbsYq
	CKD1ARZ8ojo9HDCA==
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, atishp@atishpatra.org,
 alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach
 irq_set_affinity
In-Reply-To: <874j3ktrjv.ffs@tglx>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com> <87mshcub2u.ffs@tglx>
 <CAAhSdy08gi998HsTkGpaV+bTWczVSL6D8c7EmuTQqovo63oXDw@mail.gmail.com>
 <874j3ktrjv.ffs@tglx>
Date: Tue, 03 Dec 2024 23:59:17 +0100
Message-ID: <87ser4s796.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_145921_160963_0ECBC1DF 
X-CRM114-Status: GOOD (  16.67  )
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

T24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMTo1NSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9u
IFR1ZSwgRGVjIDAzIDIwMjQgYXQgMjI6MDcsIEFudXAgUGF0ZWwgd3JvdGU6Cj4+IE9uIFR1ZSwg
RGVjIDMsIDIwMjQgYXQgNzoyM+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPiB3cm90ZToKPj4+IFNvcnJ5LCBJIG1pc3NlZCB0aGF0IHdoZW4gcmV2aWV3aW5nIHRoZSBv
cmlnaW5hbCBJTVNJQyBNU0kgc3VwcG9ydC4KPj4+Cj4+PiBUaGUgd2hvbGUgSU1TSUMgTVNJIHN1
cHBvcnQgY2FuIGJlIG1vdmVkIG92ZXIgdG8gTVNJIExJQiB3aGljaCBtYWtlcyBhbGwKPj4+IG9m
IHRoaXMgaW5kaXJlY3Rpb24gZ28gYXdheSBhbmQgeW91ciBpbnRlcm1lZGlhdGUgZG9tYWluIHdp
bGwganVzdCBmaXQKPj4+IGluLgo+Pj4KPj4+IFVuY29tcGlsZWQgcGF0Y2ggYmVsb3cuIElmIHRo
YXQgd29ya3MsIGl0IG5lZWRzIHRvIGJlIHNwbGl0IHVwIHByb3Blcmx5Lgo+Pj4KPj4+IE5vdGUs
IHRoaXMgcmVtb3ZlcyB0aGUgc2V0dXAgb2YgdGhlIGlycV9yZXRyaWdnZXIgY2FsbGJhY2ssIGJ1
dCB0aGF0J3MKPj4+IGZpbmUgYmVjYXVzZSBvbiBoaWVyYXJjaGljYWwgZG9tYWlucyBpcnFfY2hp
cF9yZXRyaWdnZXJfaGllcmFyY2h5KCkgaXMKPj4+IGludm9rZWQgYW55d2F5LiBTZWUgdHJ5X3Jl
dHJpZ2dlcigpLgo+Pgo+PiBUaGUgSU1TSUMgZHJpdmVyIHdhcyBtZXJnZWQgb25lIGtlcm5lbCBy
ZWxlYXNlIGJlZm9yZSBjb21tb24KPj4gTVNJIExJQiB3YXMgbWVyZ2VkLgo+Cj4gQWggaW5kZWVk
Lgo+Cj4+IFdlIHNob3VsZCBkZWZpbml0ZWx5IHVwZGF0ZSB0aGUgSU1TSUMgZHJpdmVyIHRvIHVz
ZSBNU0kgTElCLCBJIHdpbGwKPj4gdHJ5IHlvdXIgc3VnZ2VzdGVkIGNoYW5nZXMgKGJlbG93KSBh
bmQgcG9zdCBhIHNlcGFyYXRlIHNlcmllcy4KPgo+IFBpY2sgdXAgdGhlIGRlbHRhIHBhdGNoIEkg
Z2F2ZSBBbmRyZXcuLi4KCkFzIEkgd2FzIGxvb2tpbmcgYXQgc29tZXRoaW5nIGVsc2UgTVNJIHJl
bGF0ZWQgSSBoYWQgYSBsb29rIGF0Cmltc2ljX2lycV9zZXRfYWZmaW5pdHkoKSBhZ2Fpbi4KCkl0
J3MgYWN0dWFsbHkgcmVxdWlyZWQgdG8gaGF2ZSB0aGUgbWVzc2FnZSB3cml0ZSBpbiB0aGF0IGZ1
bmN0aW9uIGFuZApub3QgYWZ0ZXJ3YXJkcyBhcyB5b3UgaW52b2tlIGltc2ljX3ZlY3Rvcl9tb3Zl
KCkgZnJvbSB0aGF0IGZ1bmN0aW9uLgoKVGhhdCdzIG9idmlvdXNseSBub3QgdHJ1ZSBmb3IgdGhl
IHJlbWFwIGNhc2UgYXMgdGhhdCB3aWxsIG5vdCBjaGFuZ2UgdGhlCm1lc3NhZ2UgYWRkcmVzcy9k
YXRhIHBhaXIgYmVjYXVzZSB0aGUgcmVtYXAgdGFibGUgZW50cnkgaXMgaW1tdXRhYmxlIC0KYXQg
bGVhc3QgSSBhc3N1bWUgc28gZm9yIG15IG1lbnRhbCBzYW5pdHkgc2FrZSA6KQoKQnV0IHRoYXQg
YnJpbmdzIG1lIHRvIGEgcmVsYXRlZCBxdWVzdGlvbi4gSG93IGlzIHRoaXMgc3VwcG9zZWQgdG8g
d29yawp3aXRoIG5vbi1hdG9taWMgbWVzc2FnZSB1cGRhdGVzPyBQQ0kvTVNJIGRvZXMgbm90IG5l
Y2Vzc2FyaWx5IHByb3ZpZGUKbWFza2luZywgYW5kIHRoZSB3cml0ZSBvZiB0aGUgYWRkcmVzcy9k
YXRhIHBhaXIgaXMgZG9uZSBpbiBiaXRzIGFuZApwaWVjZXMuIFNvIHlvdSBjYW4gZW5kIHVwIHdp
dGggYW4gaW50ZXJtZWRpYXRlIHN0YXRlIHNlZW4gYnkgdGhlIGRldmljZQp3aGljaCBlbmRzIHVw
IHNvbWV3aGVyZSBpbiBpbnRlcnJ1cHQgbmlydmFuYSBzcGFjZS4KClNlZSB0aGUgZGFuY2UgaW4g
bXNpX3NldF9hZmZpbml0eSgpIGFuZCBjb21taXQgNmYxYTQ4OTFhNTkyCigieDg2L2FwaWMvbXNp
OiBQbHVnIG5vbi1tYXNrYWJsZSBNU0kgYWZmaW5pdHkgcmFjZSIpIGZvciBmdXJ0aGVyCmV4cGxh
bmF0aW9uLgoKVGhlIHdheSBob3cgdGhlIElNU0lDIGRyaXZlciB3b3JrcyBzZWVtcyB0byBiZSBw
cmV0dHkgbXVjaCB0aGUgc2FtZSBhcwp0aGUgeDg2IEFQSUMgbWVzczoKCiAgICAgICAgQGFkZHJl
c3MgaXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIHBlciBDUFUgTVNJIHRhcmdldAogICAg
ICAgIGFkZHJlc3MgYW5kIEBkYXRhIGlzIHRoZSB2ZWN0b3IgSUQgb24gdGhhdCBDUFUuCgpTbyB0
aGUgbm9uLWF0b21pYyB1cGRhdGUgaW4gY2FzZSBvZiBub24tbWFza2FibGUgTVNJIHN1ZmZlcnMg
ZnJvbSB0aGUKc2FtZSBwcm9ibGVtLiBJdCB3b3JrcyBtb3N0IG9mIHRoZSB0aW1lLCBidXQgaWYg
aXQgZG9lc24ndCB5b3UgbWlnaHQKc3RhcmUgYXQgdGhlIG9jY2FzaW9uYWxseSBsb3N0IGludGVy
cnVwdCBhbmQgdGhlIHN0YWxlIGRldmljZSBpbgpkaXNiZWxpZWYgZm9yIHF1aXRlIGEgd2hpbGUg
OikKCkkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcgd2hpY2ggbWFnaWNhbGx5IHByZXZlbnQg
dGhhdCB0aG91Z2ggOikKClRoYW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
