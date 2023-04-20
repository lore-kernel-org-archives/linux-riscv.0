Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F02C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cq3s+LTn636MG2zx85N8UU4nVKe7c9Gbb3FoPziF9Bo=; b=psh7Bo1w8fGoXG
	j98cV4fP4lGfD0MAePjlnq06NQ6uXdeTzG9jzV0Q6Azxjru6MF47JGhCUERkJcxWZ/OcKFr8C2Ayz
	eB0kDizdRc7jq53TtCxGZPTx9bKzlz6JV6NZoD3Kf1nLapp3nTYFeiHL2kwih9K52mYDNbqNDBuy9
	+iVjlqyHk6nw4K5emRRK2eLIEE4DzWqdq9tFsSxjNSxe20DWk3oDU2DbzymH8SNAYOJvfjBZ2BYsm
	j4gxK2ukswIlB/VEgh7dVZTCiojRqRrRfL2D5cgNOM+5d3RtSVYNJB/XqAmofjpJ5DX70i7Jcu/t+
	mLN9/cM5BiGiJ2wrXJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPiS-007Pje-1B;
	Thu, 20 Apr 2023 08:32:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPiO-007PiJ-20;
	Thu, 20 Apr 2023 08:32:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681979541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+ebiUykc2oGiW9xPV9ZKUG/P8FsTezy0HSUaGX7/pY=;
	b=Jz/cXv5/DHLlLjV0z8BL66SPZKoeNMGD449tum189TN4LYaNtkzbsEgLqCXxeR5D2x4DmB
	AiiH4E3wu4mBGTwiuHyl8BJq1iKIMjEryKHI4Rwh2aIdHQXjHwgf71hZZEbZyP9aBjU6fv
	3zXpJo+I3lE6AOTbjLnufJBUwJfr8usMbNL18Mci5Spg10fimG4h36b3KXVFHqqEKIS4NL
	6O/vuWFYSqyD35wd+FaTjGBiDpyu2BeCfT9L9YjBMhEbpDoYxV0wuRUxlhwDe39bW/c/BG
	Fut9OwTjPUuzPGtLKQMIt2adUOVPSweDTmlzV8g0EUacW9ueX1QxUKw2lpWF0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681979541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+ebiUykc2oGiW9xPV9ZKUG/P8FsTezy0HSUaGX7/pY=;
	b=fiV2/prU9cb5dhmyq+s9y7Q+ypTlDxy8b3yL8uPmb2zNIq4Xu7UguxKO2bu7hAd0D1st/s
	PIPzYABPo+6ab0BQ==
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, Arjan van de Veen
 <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
Date: Thu, 20 Apr 2023 10:32:19 +0200
Message-ID: <871qkf3qek.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_013228_826016_18FE7137 
X-CRM114-Status: GOOD (  21.52  )
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

T24gV2VkLCBBcHIgMTkgMjAyMyBhdCAxNzoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAx
OS8wNC8yMDIzIDI6NTAgcG0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFdoYXQgSSdtIGNvbmZ1
c2VkIGJ5IGlzIHdoeSB0aGlzIHN5c3RlbSBib290cyBpbiB0aGUgZmlyc3QgcGxhY2UuwqAgSSBj
YW4KPj4gb25seSB0aGluayB0aGF0J3MgaXMgYSBzeXN0ZW0gd2hpY2ggb25seSBoYXMgNC1iaXQg
QVBJQyBJRHMsIGFuZCBoYXBwZW5zCj4+IHRvIGZ1bmN0aW9uIHdoZW4gYml0IDQgZ2V0cyB0cnVu
Y2F0ZWQgb2ZmIHRoZSB0b3Agb2YgdGhlIFNJUEkgZGVzdGluYXRpb24uLi4KPgo+IGh0dHBzOi8v
d3d3LmFtZC5jb20vc3lzdGVtL2ZpbGVzL1RlY2hEb2NzLzQyMzAwXzE1aF9Nb2RfMTBoLTFGaF9C
S0RHLnBkZgo+Cj4gVGhpcyBzeXN0ZW0gZG9lcyBzdGlsbCByZXF1aXJlIHRoZSBJTy1BUElDcyB0
byBiZSBhdCAwLCBhbmQgdGhlIExBUElDcwo+IHRvIHN0YXJ0IGF0IHNvbWUgb2Zmc2V0LCB3aGlj
aCBpcyBjbGVhcmx5IDE2IGluIHRoaXMgY2FzZS7CoCBBbHNvLCB0aGlzCj4gc3lzdGVtIGhhcyBj
b25maWd1cmFibGUgNC1iaXQgb3IgOC1iaXQgd2lkZSBBUElDIElEcywgYW5kIEkgY2FuJ3QgdGVs
bAo+IHdoaWNoIG1vZGUgaXMgYWN0aXZlIGp1c3QgZnJvbSB0aGUgbWFudWFsLgoKVGhhdCBkb2N1
bWVudCBjb250cmFkaWN0cyBpdHNlbGY6CgogICJUaGUgQXBpY0lkIG9mIGNvcmUgaiBtdXN0IGJl
IGVudW1lcmF0ZWQvYXNzaWduZWQgYXM6CiAgIEFwaWNJZFtjb3JlPWpdID0gKE9GRlNFVF9JRFgp
ICogTU5DICsgagoKICAgV2hlcmUgT0ZGU0VUX0lEWCBpcyBhbiBpbnRlZ2VyIG9mZnNldCAoMCB0
byBOKSB1c2VkIHRvIHNoaWZ0IHVwIHRoZQogICBjb3JlIEFwaWNJZCB2YWx1ZXMgdG8gYWxsb3cg
cm9vbSBmb3IgSU9BUElDIGRldmljZXMuCgogICBJdCBpcyByZWNvbW1lbmRlZCB0aGF0IEJJT1Mg
dXNlIHRoZSBmb2xsb3dpbmcgQVBJQyBJRCBhc3NpZ25tZW50cyBmb3IKICAgdGhlIGJyb2FkZXN0
IG9wZXJhdGluZyBzeXN0ZW0gc3VwLSBwb3J0LiBHaXZlbiBOID0gTU5DIGFuZCBNID0KICAgTnVt
YmVyX09mX0lPQVBJQ3M6CgogICDigKIgQXNzaWduIHRoZSBjb3JlIEFwaWNJZOKAmXMgZmlyc3Qg
ZnJvbSAwIHRvIE4tMSwgYW5kIHRoZSBJT0FQSUMgSURzCiAgICAgZnJvbSBOIHRvIE4rKE0tMSku
IgoKT2ggd2VsbC4gSWYgdGhlIHJlc3Qgb2YgdGhlc2UgZG9jcyBpcyBvZiB0aGUgc2FtZSBxdWFs
aXR5IHRoZW4gaXQncyBub3QKYSBzdXJwcmlzZSB0aGF0IEJJT1NlcyBhcmUgdHJhaW53cmVja3Mu
Cgo+IEJ1dCwgaXQgZG9lcyBtZWFuIHRoYXQgdGhlIEJJT1MgaGFzIGdlbnVpbmVseSBtb2RpZmll
ZCB0aGUgQVBJQyBJRHMgb2YKPiB0aGUgbG9naWMgcHJvY2Vzc29ycy7CoCBUaGlzIGRvZXMgaGln
aGxpZ2h0IGFuIGVycm9yIGluIHJlYXNvbmluZyB3aXRoCj4gdGhlIHBhcmFsbGVsIGJyaW5ndXAg
Y29kZS4KClllcy4KCj4gRm9yIHhBUElDLCB0aGUgQVBJQ19JRCByZWdpc3RlciBpcyB3cml0ZWFi
bGUgKGF0IGxlYXN0LCBtb2RlbAo+IHNwZWNpZmljYWxseSksIGFuZCBDUFVJRCBpcyBvbmx5IHRo
ZSB2YWx1ZSBpdCB3b3VsZCBoYXZlIGhhZCBhdCByZXNldC7CoAo+IFNvIHRoZSBBUCBicmluZ3Vw
IGxvZ2ljIGNhbid0IGFjdHVhbGx5IHVzZSBDUFVJRCByZWxpYWJseS4KPgo+IFRoaXMgd2FzIGNo
YW5nZWQgaW4geDJBUElDLCB3aGljaCBtYWRlIHRoZSB4MkFQSUNfSUQgaW1tdXRhYmxlLgo+Cj4g
SSBkb24ndCBzZWUgYW4gb3B0aW9uIG90aGVyIHRoYW4gdGhlIEFQIGJyaW5ndXAgY29kZSBxdWVy
eSBmb3IgeEFQSUMgdnMKPiB4MkFQSUMgbW9kZSwgYW5kIGVpdGhlciBsb29raW5nIGF0IHRoZSBy
ZWFsIEFQSUNfSUQgcmVnaXN0ZXIsIG9yIGZhbGxpbmcKPiBiYWNrIHRvIENQVUlELgoKSSdtIHBv
bmRlcmluZyB0byBzaW1wbHkgZGVueSBwYXJhbGxlbCBtb2RlIGlmIHgyQVBJQyBpcyBub3QgdGhl
cmUuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
