Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34187C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 06:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCpUVT4qeV6wR4O73QpdEWEm5PE2Jgdlpbt3qCRRrd0=; b=vo4ebFFgDYS+tJ
	vY8itzX0OU+uZ971/5SulJ7iFlmJuH/mzmzb9EpqDEgamHshXQZOoqiHdkHLzesZjC+upgxU0itCg
	w1QZiCVMMTK5CRLbqaRKqAF806GO3GFJwmgcpNXN8Pu7sVIQg+xfCqTN5hxgaP5kc0TC5/G0a0Ilg
	+E8VNBrUSV2EitwL4/NMr+oScRsdsufpNmKND5wgEBr7AXBBpMYK7idJeSp2crQPl/cdQDl9LZR/R
	PFYPflhzaN4gbxnC7WilmMEFVvRYE+8DtTKZPVSz2phNDZDG0vGUadvvP3wzQhInMuDgU+mdQKKyW
	TvRlfvfgv14yvyjP6ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pofIX-0013fa-2d;
	Tue, 18 Apr 2023 06:58:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pofIT-0013dm-20;
	Tue, 18 Apr 2023 06:58:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681801114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JrvTFx0WVeMY9cJy762Xh8k6ZgcD547tgSMeBaRvfE=;
	b=Et6llJLqBk0yfoU12mOHK72SfYQgEWu+q48gtjbOp01/oW1pWwNWzYkMj3rsubBi7GEzq5
	mPT5IZDLQl4QKMdJBFAIqKyeL5/EHZMZmHN21initZgWfHDK9dVyf4svi0aLfhUnyeDqQK
	I3vYRVmGWdTJWrOGtNsTNLH4myxFa9B/Cic2FVRJKblYIYu57zyU8GZBAWAfanD+weXHiR
	ms33Y/xbIFrXQYi8r9H5uTRDm8lfMric1/URavwJ7tQwqLrW0R7pwMbi7rSmGj07t3TRXL
	qWncTgcrXxLCvAZcnDKbYXnQQ7HAmFlnUm/wlHJLSqR024Ajk5DxDVTQi7RWeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681801114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JrvTFx0WVeMY9cJy762Xh8k6ZgcD547tgSMeBaRvfE=;
	b=2IDo3vCdzNc6EWeefm49U4euIaA6bLjlIhlJmFMjsR5vvqBpGyDNOwFnUfvXHrOiAPFmV7
	jCwlVmV4XYpFQwCw==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de>
Date: Tue, 18 Apr 2023 08:58:32 +0200
Message-ID: <87ttxd4qxz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_235837_805273_43FBBE74 
X-CRM114-Status: GOOD (  15.96  )
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

UGF1bCEKCk9uIE1vbiwgQXByIDE3IDIwMjMgYXQgMTk6NDAsIFBhdWwgTWVuemVsIHdyb3RlOgo+
IEFtIDE3LjA0LjIzIHVtIDE2OjQ4IHNjaHJpZWIgVGhvbWFzIEdsZWl4bmVyOgo+Cj4+IE9uIE1v
biwgQXByIDE3IDIwMjMgYXQgMTM6MTksIFBhdWwgTWVuemVsIHdyb3RlOgo+Pj4gQW0gMTUuMDQu
MjMgdW0gMDE6NDQgc2NocmllYiBUaG9tYXMgR2xlaXhuZXI6Cj4+PiBbICAgIDAuMjU4MTkzXSBz
bXBib290OiBDUFUwOiBBTUQgQTYtNjQwMEsgQVBVIHdpdGggUmFkZW9uKHRtKSBIRAo+Pj4gR3Jh
cGhpY3MgKGZhbWlseTogMHgxNSwgbW9kZWw6IDB4MTMsIHN0ZXBwaW5nOiAweDEpCj4+PiBb4oCm
XQo+Pj4gWyAgICAwLjI1OTMyOV0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4K
Pj4+IFsgICAgMC4yNTk1MjddIHg4NjogQm9vdGluZyBTTVAgY29uZmlndXJhdGlvbjoKPj4+IFsg
ICAgMC4yNTk1MjhdIC4uLi4gbm9kZSAgIzAsIENQVXM6ICAgICAgIzEKPj4+IFsgICAgMC4yNjEw
MDddIEFmdGVyIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQKPj4+IFsgICAxMC4yNjA5OTBdIENQ
VTEgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQo+PiAKPj4gV2VpcmQuIENQVTEgZmFpbHMg
dG8gY29tZSB1cCBhbmQgcmVwb3J0IHRoYXQgaXQgaGFzIHJlYWNoZWQgdGhlCj4+IHN5bmNocm9u
aXphdGlvbiBwb2ludC4KPj4gCj4+IERvZXMgaXQgd29yayB3aGVuIHlvdSBhZGQgY3B1aHAucGFy
YWxsZWw9b2ZmIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lPwo+Cj4gWWVzLCB0aGUgdGVuIHNl
Y29uZHMgZGVsYXkgaXMgZ29uZSB3aXRoIGBjcHVocC5wYXJhbGxlbD1vZmZgLgo+Cj4gVGhlcmUg
d2FzIGEgcGF0Y2ggc2V0IGluIHRoZSBwYXN0LCB0aGF0IHdvcmtlZCBvbiB0aGF0IGRldmljZS4g
SSB0aGluayAKPiB1cCB0byB2NCBpdCBkaWQgKm5vdCogd29yayBhdCBhbGwgYW5kIGh1bmcgWzFd
LiBJIG5lZWQgc29tZSBkYXlzIHRvIAo+IGNvbGxlY3QgdGhlIHJlc3VsdHMgYWdhaW4uCgpDYW4g
eW91IHBsZWFzZSBhcHBseSB0aGUgcGF0Y2ggYmVsb3cgb24gdG9wIG9mIHRoZSBwaWxlIHJlbW92
ZSB0aGUKY29tbWFuZCBsaW5lIG9wdGlvbiBhZ2Fpbj8KClRoYW5rcywKCgogICAgICAgIHRnbHgK
LS0tCiBrZXJuZWwvY3B1LmMgfCAgICAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKLS0tIGEva2VybmVsL2NwdS5jCisrKyBiL2tlcm5lbC9jcHUuYwpAQCAtMTc3Nyw2ICsxNzc3
LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNwdWhwX2JyaW5ndXBfbWFzayhjbwogCQkJICovCiAJ
CQlXQVJOX09OKGNwdWhwX2ludm9rZV9jYWxsYmFja19yYW5nZShmYWxzZSwgY3B1LCBzdCwgQ1BV
SFBfT0ZGTElORSkpOwogCQl9CisJCW1zbGVlcCgyMCk7CiAJfQogfQogCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
