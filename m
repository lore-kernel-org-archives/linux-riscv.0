Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18CDC10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0Q+QJiBW+tvCfXf7VlZIksD7xYoegnxSkk+/2eAquo=; b=yGZLfF2GQQXPc/
	t77tvsbH5ysK/UPA1menva5GiKWwKwS/a3ZePP+hunxf2BiT3loDs8pqUUpJn6Hhos1ERLvrfhAY9
	xyzw4YXUxUa2RlEhbIvBMQvkVFzxPuPy3hl74fCCuxie8UWz8V+nIHtlXZxdi52pWHpDl4S0GvphD
	cMCoNPR/LqtNmVKnU6E9satV7COmbZOKJ+BTwecT75o5yZ4wO/FBdKb2HHGHlcblEUzMMvOyStInz
	i0o7l2WDfmFIocw2ZFgDgE3ceKM6MBzw55v4cGm3gQQZ4ovgWUVAyUQcjYbAzaTNJUYGScltNiMwI
	8n+TTU+e4qc2Xx4C7/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzgqd-00000005CXA-0bAD;
	Wed, 24 Apr 2024 17:55:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzgqY-00000005CVp-27H8;
	Wed, 24 Apr 2024 17:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0240F61731;
	Wed, 24 Apr 2024 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237D7C2BD10;
	Wed, 24 Apr 2024 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713981353;
	bh=R4CYpHlj8jEVfIevCJyMoADNlNhxgxYKx+hnKC/6ZHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o90A0dji/1C/nj8o2so91Qf2gUBarrMOTde/k9C3QoyX+SPqyPj5Rl0J4CAjtDPFv
	 ubbWx4NO7WFN5DxKr7dtMjXqL3ifQV9ZDEk9/E1heWe6mZNCR3tAkbzNz+d03g+0BC
	 zhW5Qh+mMI/dbfxC5jak+61K8KAWmZm2QipBZDFOJaxHU3oYUnGE53WJHMqiMA8Wln
	 CZnyVTlkM6DAQ/XVxoGGhSPFJKd5LRyybY0tP5A/QZNStYy/3YS1hDvFw4EGJg1UXu
	 Z8G/GpZzpGRZNQ88h30w7vNI+z8rhH0gNd5Or4YxleSamM9mFDlFo1Y4rW+NQiv4rm
	 upnSXlJDq9F+g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anup Patel
 <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, Samuel
 Holland <samuel.holland@sifive.com>, Robert Moore
 <robert.moore@intel.com>, Haibo1 Xu <haibo1.xu@intel.com>, Conor Dooley
 <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Andrei Warkentin
 <andrei.warkentin@intel.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt
 controller support
In-Reply-To: <CAJZ5v0gTzn3TDoh0+0UQjMeJVdU+z16dDOT_fKMhr0XrOxyRtA@mail.gmail.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
 <CAJZ5v0gTzn3TDoh0+0UQjMeJVdU+z16dDOT_fKMhr0XrOxyRtA@mail.gmail.com>
Date: Wed, 24 Apr 2024 19:55:50 +0200
Message-ID: <871q6uir15.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_105554_644504_50B10D0F 
X-CRM114-Status: GOOD (  14.07  )
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

IlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gTW9u
LCBBcHIgMTUsIDIwMjQgYXQgNzowMeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPj4KPj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgYmVs
b3cgRUNSIGFwcHJvdmVkIGJ5IEFTV0cuCj4+IDEpIE1BRFQgLSBodHRwczovL2RyaXZlLmdvb2ds
ZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1QtVktzSUtpYTd6Ui92aWV3P3VzcD1z
aGFyaW5nCj4+Cj4+IFRoZSBzZXJpZXMgcHJpbWFyaWx5IGVuYWJsZXMgaXJxY2hpcCBkcml2ZXJz
IGZvciBSSVNDLVYgQUNQSSBiYXNlZAo+PiBwbGF0Zm9ybXMuCj4+Cj4+IFRoZSBzZXJpZXMgY2Fu
IGJlIGJyb2FkbHkgY2F0ZWdvcml6ZWQgbGlrZSBiZWxvdy4KPj4KPj4gMSkgUENJIEFDUEkgcmVs
YXRlZCBmdW5jdGlvbnMgYXJlIG1pZ3JhdGVkIGZyb20gYXJtNjQgdG8gY29tbW9uIGZpbGUgc28K
Pj4gdGhhdCB3ZSBkb24ndCBuZWVkIHRvIGR1cGxpY2F0ZSB0aGVtIGZvciBSSVNDLVYuCj4+Cj4+
IDIpIEFkZGVkIHN1cHBvcnQgZm9yIHJlLW9yZGVyaW5nIHRoZSBwcm9iZSBvZiBpbnRlcnJ1cHQg
Y29udHJvbGxlcnMgd2hlbgo+PiBJUlFDSElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+Pgo+PiAz
KSBUbyBlbnN1cmUgcHJvYmUgb3JkZXIgYmV0d2VlbiBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYW5k
IGRldmljZXMsCj4+IGltcGxpY2l0IGRlcGVuZGVuY3kgaXMgY3JlYXRlZCBzaW1pbGFyIHRvIHdo
ZW4gX0RFUCBpcyBwcmVzZW50Lgo+Pgo+PiA0KSBXaGVuIFBOUCBkZXZpY2VzIGxpa2UgR2VuZXJp
YyAxNjU1MEEgVUFSVCwgaGF2ZSB0aGUgZGVwZW5kZW5jeSBvbiB0aGUKPj4gaW50ZXJydXB0IGNv
bnRyb2xsZXIsIHRoZXkgd2lsbCBub3QgYmUgYWRkZWQgdG8gUE5QIGRhdGEgc3RydWN0dXJlcy4g
U28sCj4+IGFkZGVkIHNlY29uZCBwaGFzZSBvZiBwbnBhY3BpX2luaXQgdG8gaGFuZGxlIHRoaXMu
Cj4+Cj4+IDUpIEFDUEkgc3VwcG9ydCBhZGRlZCBpbiBSSVNDLVYgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgZHJpdmVycy4KPj4KPj4gVGhpcyBzZXJpZXMgaXMgc3RpbGwga2VwdCBhcyBSRkMgdG8gc2Vl
ayBmZWVkYmFjayBvbiBhYm92ZSBkZXNpZ24KPj4gY2hhbmdlcy4gTG9va2luZyBmb3J3YXJkIGZv
ciB0aGUgZmVlZGJhY2shCj4KPiBJJ3ZlIGxvb2tlZCBhdCB0aGUgcGF0Y2hlcyBhbmQgSSBkb24n
dCBzZWUgYW55dGhpbmcgZGVlcGx5IGNvbmNlcm5pbmcKPiBpbiB0aGVtIGZyb20gdGhlIEFDUEkg
Y29yZSBjb2RlIHBlcnNwZWN0aXZlLgo+Cj4gVGhlIGNoYW5nZXMgbG9vayByZWFzb25hYmx5IHN0
cmFpZ2h0Zm9yd2FyZCB0byBtZS4KClN1bmlsLCBnaXZlbiBSYWZhZWwncyBpbnB1dCwgaXQgc291
bmRzIGxpa2UgaXQncyB0aW1lIGZvciBhIHBhdGNoCnByb3Blci4gVGhpcyBpcyByZWFsbHkgdGhl
IG1pc3NpbmcgcGllY2UgdG8gbWFrZSBBQ1BJIHVzYWJsZSBvbiBSSVNDLVYhCgpUaGFua3MgZm9y
IHRoZSBuaWNlIHdvcmshCkJqw7ZybgoKRldJVywKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkByaXZvc2luYy5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
