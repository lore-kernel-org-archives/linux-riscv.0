Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF4FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECV0vB9t2kdLJ8QTot28B19LjFeEgoWJrjgiOFlPKLc=; b=zyonqOLmwg31HW
	4A2xwzld9Ofj4lU7NA1B95NLQrI/YSwo6ZDEF7rCz9fDJezNokJ916Kz4b9mpl4sQJSSuukwoQyZV
	3IQVNAXJ5z1vSOaVmKZhwDqIZLGeZOw6v05VC5TBn54EIcfBq67/1oIssNdqL0fEL1QIzcUHbbgnj
	vlW4rGsNt8R0jaDAWY34sIPsOrVl9nnegGZ05qrXxJdynBOXxaIlJqKo7wSFjV7MLI1hBWDt6tCoD
	Zq3GJcJ5mdanNnPCS/2rauva8Z3j/YrmsGgR8WgFuvCRD6/0v78+LkVsc4AwTUBjbvLiSf90aP6ga
	MzZNXnAlO03VU55HzUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxS8r-00000002R7f-38jr;
	Thu, 18 Apr 2024 13:49:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxS8n-00000002R5f-2BIu;
	Thu, 18 Apr 2024 13:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 730D8CE1831;
	Thu, 18 Apr 2024 13:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2064AC113CC;
	Thu, 18 Apr 2024 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713448165;
	bh=jfOQXsG4f9jvja2w3Ld4pdH6HBJIb87wPUxNL/nBu08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o9VtkE4ePs1Kn8oRF5n8WcljMFlRPUrOeX0M2eFt0VjvDoYupdqg+8AAQrh6yexev
	 Yy4qSEQp7xvRGROpudXwJrLUR149J8R9gYOiw3nsbjzxYJ3S6lqVZztdQ/QuTYpdJ3
	 AMxVbS9TxBORXr4RfAOXu4hhzDZeiulUkhE2sSM9J2hTdFIwYuZMSLwTSbCRcTseiL
	 /XcdKDNoV3E0Vbyw8q4L+3DqVfDwkbwaSK7Hv6I3jlJoEKmPAla7ufnGJiEbeGcaSr
	 ANdzPRoT333poFim3YKZJqvnXp8FyB3JQxICibj2Ch6VqjQHtbbu4ituRhMns1bgrS
	 7POoB7ZWa0Rrg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt
 controller support
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
Date: Thu, 18 Apr 2024 15:49:22 +0200
Message-ID: <87a5lqsrvh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_064929_943210_D72672CB 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgYmVsb3cgRUNSIGFwcHJvdmVkIGJ5IEFTV0cuCj4gMSkg
TUFEVCAtIGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMW9NR1B5T0Q1OEphUGdNbDFw
S2FzVC1WS3NJS2lhN3pSL3ZpZXc/dXNwPXNoYXJpbmcKPgo+IFRoZSBzZXJpZXMgcHJpbWFyaWx5
IGVuYWJsZXMgaXJxY2hpcCBkcml2ZXJzIGZvciBSSVNDLVYgQUNQSSBiYXNlZAo+IHBsYXRmb3Jt
cy4KPgo+IFRoZSBzZXJpZXMgY2FuIGJlIGJyb2FkbHkgY2F0ZWdvcml6ZWQgbGlrZSBiZWxvdy4g
Cj4KPiAxKSBQQ0kgQUNQSSByZWxhdGVkIGZ1bmN0aW9ucyBhcmUgbWlncmF0ZWQgZnJvbSBhcm02
NCB0byBjb21tb24gZmlsZSBzbwo+IHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgdGhl
bSBmb3IgUklTQy1WLgo+Cj4gMikgQWRkZWQgc3VwcG9ydCBmb3IgcmUtb3JkZXJpbmcgdGhlIHBy
b2JlIG9mIGludGVycnVwdCBjb250cm9sbGVycyB3aGVuCj4gSVJRQ0hJUF9BQ1BJX0RFQ0xBUkUg
aXMgdXNlZC4KPgo+IDMpIFRvIGVuc3VyZSBwcm9iZSBvcmRlciBiZXR3ZWVuIGludGVycnVwdCBj
b250cm9sbGVycyBhbmQgZGV2aWNlcywKPiBpbXBsaWNpdCBkZXBlbmRlbmN5IGlzIGNyZWF0ZWQg
c2ltaWxhciB0byB3aGVuIF9ERVAgaXMgcHJlc2VudC4KPgo+IDQpIFdoZW4gUE5QIGRldmljZXMg
bGlrZSBHZW5lcmljIDE2NTUwQSBVQVJULCBoYXZlIHRoZSBkZXBlbmRlbmN5IG9uIHRoZQo+IGlu
dGVycnVwdCBjb250cm9sbGVyLCB0aGV5IHdpbGwgbm90IGJlIGFkZGVkIHRvIFBOUCBkYXRhIHN0
cnVjdHVyZXMuIFNvLAo+IGFkZGVkIHNlY29uZCBwaGFzZSBvZiBwbnBhY3BpX2luaXQgdG8gaGFu
ZGxlIHRoaXMuCj4KPiA1KSBBQ1BJIHN1cHBvcnQgYWRkZWQgaW4gUklTQy1WIGludGVycnVwdCBj
b250cm9sbGVyIGRyaXZlcnMuCj4KPiBUaGlzIHNlcmllcyBpcyBzdGlsbCBrZXB0IGFzIFJGQyB0
byBzZWVrIGZlZWRiYWNrIG9uIGFib3ZlIGRlc2lnbgo+IGNoYW5nZXMuIExvb2tpbmcgZm9yd2Fy
ZCBmb3IgdGhlIGZlZWRiYWNrIQo+Cj4gQ2hhbmdlcyBzaW5jZSBSRkMgdjM6Cj4gCTEpIE1vdmVk
IHRvIF9ERVAgbWV0aG9kIGluc3RlYWQgb2YgZndfZGV2bGluay4KPiAJMikgUExJQy9BUExJQyBk
cml2ZXIgcHJvYmUgdXNpbmcgbmFtZXNwYWNlIGRldmljZXMuCj4gCTMpIEhhbmRsaW5nIFBOUCBk
ZXZpY2VzIGFzIHBhcnQgb2YgY2xlYXJpbmcgZGVwZW5kZW5jeS4KPiAJNCkgUmViYXNlZCB0byBs
YXRlc3QgbGludXgtbmV4dCB0byBnZXQgQUlBIERUIGRyaXZlcnMuCj4KPiBDaGFuZ2VzIHNpbmNl
IFJGQyB2MjoKPiAJMSkgSW50cm9kdWNlZCBmd19kZXZsaW5rIGZvciBBQ1BJIG5vZGVzIGZvciBJ
UlEgZGVwZW5kZW5jeS4KPiAJMikgRHJvcHBlZCBwYXRjaGVzIGluIGRyaXZlcnMgd2hpY2ggYXJl
IG5vdCByZXF1aXJlZCBkdWUgdG8KPiAJICAgZndfZGV2bGluayBzdXBwb3J0Lgo+IAkzKSBEcm9w
cGVkIHBjaV9zZXRfbXNpKCkgcGF0Y2ggYW5kIGFkZGVkIGEgcGF0Y2ggaW4KPiAJICAgcGNpX2Ny
ZWF0ZV9yb290X2J1cygpLgo+IAk0KSBVcGRhdGVkIHBucF9pcnEoKSBwYXRjaCBzbyB0aGF0IG5v
bmUgb2YgdGhlIGFjdHVhbCBQTlAKPiAJICAgZHJpdmVycyBuZWVkIHRvIGNoYW5nZS4KPgo+IENo
YW5nZXMgc2luY2UgUkZDIHYxOgo+IAkxKSBBYmFuZG9uZWQgc3dub2RlIGFwcHJvYWNoIGFzIHBl
ciBNYXJjJ3MgZmVlZGJhY2suCj4gCTIpIFRvIGNvcGUgdXAgd2l0aCBBSUEgc2VyaWVzIGNoYW5n
ZXMgd2hpY2ggY2hhbmdlZCBpcnFjaGlwIGRyaXZlcgo+IAkgICBwcm9iZSBmcm9tIGNvcmVfaW5p
dGNhbGwoKSB0byBwbGF0Zm9ybV9kcml2ZXIsIGFkZGVkIHBhdGNoZXMKPiAJICAgdG8gc3VwcG9y
dCBkZWZlcnJlZCBwcm9iaW5nLgo+IAkzKSBSZWJhc2VkIG9uIHRvcCBvZiBBbnVwJ3MgQUlBIHYx
MSBhbmQgYWRkZWQgdGFncy4KPgo+IFRvIHRlc3QgdGhlIHNlcmllcywKPgo+IDEpIFFlbXUgc2hv
dWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSByaXNjdl9hY3BpX25hbWVzcGFjZV92MSBicmFuY2ggYXQK
PiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9xZW11LmdpdAo+Cj4gMikgRURLMiBzaG91bGQg
YmUgYnVpbHQgdXNpbmcgdGhlIGluc3RydWN0aW9ucyBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20v
dGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQvUkVBRE1FLm1kCgpI
aSBTdW5pbCwKCkkgc3RhcnRlZCBwbGF5aW5nIHdpdGggeW91ciB3b3JrLCBhbmQgRllJOiBVc2lu
ZyBVLWJvb3QgaW5zdGVhZCBvZiBFREsyCndvcmtzIG91dCBvZiB0aGUgYm94ICh3aXRoIGFjcGku
Y29uZmlnIGFkZGVkIHRvIFUtYm9vdCkuCgpJIGNoYW5nZWQgbXkgcm9vdGZzL2Jvb3QgdG9vbGlu
ZyBsaWtlIFsxXSwgYW5kIGl0IGJvb3RzLgoKKEZvciB0aG9zZSB3aG8gcHJlZmVyIHdvcmtpbmcg
d2l0aCBVLWJvb3QgVUVGSSBpbnN0ZWFkIG9mIEVESzIuKQoKCkJqw7ZybgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9iam90by9yaXNjdi1yb290ZnMtdXRpbHMvY29tbWl0L2MwYzYyMDEzMWYwNGQw
YzI1ZGYxNTA0YWY0ZDA2MjlhNDIwYjA5N2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
