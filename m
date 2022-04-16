Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A1C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa1365MM06+2zoQUqZJqm5KdGrRLRtj8sIwp74ZuBBo=; b=0X/lSGw3mcrNJA
	Omw91WhdUGJTzTBeY7GYTPSa86BSJVfgOwlyiF33AAc9nvU5w0/Irx9w4BvqQC0s+atJRrzwUBq+0
	9OM9vkjx8othdZx/mgvulpJqxzWjBG18KrkXNO1XyO98Qkg/lR8ratnnxFoqid6JCJrmgdVw39Q7y
	/gtWzHhDPLaph2L2V0TgQ/66TceI0+2dPkMWSVwfMpEYDKZF4UDAY3pzSeUUwvWcJrdVLQgseOSs9
	obt3fKeKQ2LM8OpmQIVpdBV2wkrnnHtRtxUCFup9swuUmQiQfMs8z2MB8byF1z01G7q23YBh37adY
	7XePE6+mLGNo64woCvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfjfk-00D81p-3F; Sat, 16 Apr 2022 14:45:12 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfjfY-00D7yK-KY; Sat, 16 Apr 2022 14:45:02 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id EDBF792009E; Sat, 16 Apr 2022 16:44:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id E02D092009C;
 Sat, 16 Apr 2022 15:44:53 +0100 (BST)
Date: Sat, 16 Apr 2022 15:44:53 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
 Theodore Ts'o <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
In-Reply-To: <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2204161533420.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
 <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_074500_882406_8F641CD5 
X-CRM114-Status: GOOD (  27.61  )
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

SGkgSmFzb24sCgo+ID4gIFRoZXJlIGFyZSB0d28gdmFyaWFudHMgb25seSBvZiB0aGUgQ1AwIFJh
bmRvbSByZWdpc3RlciB0aGF0IHdlIGNhbiBldmVyCj4gPiBlbmNvdW50ZXIsIGFzIGl0J3MgYmVl
biBkZS1mYWN0byBzdGFuZGFyZGlzZWQgaW4gZWFybHkgMTk5MHMgYWxyZWFkeSBhbmQKPiA+IHRo
ZW4gd3JpdHRlbiBkb3duIGluIHRoZSBNSVBTcjEgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb24g
fjIwMDAuICBTbyBJCj4gPiB0aGluayBpdCBtYXkgbWFrZSBzZW5zZSB0byBhY3R1YWxseSBoYW5k
bGUgdGhlbSBib3RoIGV4cGxpY3RpdGx5IHdpdGgKPiA+IGluZGl2aWR1YWwgY2FsY3VsYXRpb25z
LCBwb3NzaWJseSBjb25kaXRpb25hbGlzZWQgb24gYSBDT05GSUcgc2V0dGluZyBvcgo+ID4gYGNw
dV9oYXNfM2tleCcsIGJlY2F1c2Uga2VybmVscyB0aGF0IHN1cHBvcnQgdGhlIHR3byB2YXJpYW50
cyBvZiB0aGUgTU1VCj4gPiBhcmNoaXRlY3R1cmUgYXJlIG11dHVhbGx5IGluY29tcGF0aWJsZS4K
PiAKPiBPa2F5LCBJIGNhbiBnaXZlIHRoaXMgYSBzaG90LCBidXQgdGhpcyBjZXJ0YWlubHkgaXNu
J3QgbXkgZm9ydMOpLiBJdAo+IG1heSB1bHRpbWF0ZWx5IHdpbmQgdXAgYmVpbmcgc2ltcGxlciBm
b3IgeW91IHRvIGp1c3Qgc2VuZCBzb21lIGNvZGUgb2YKPiB3aGF0IHlvdSBlbnZpc2lvbiBmb3Ig
dGhpcywgYnV0IGlmIEkgdW5kZXJzdGFuZCB5b3VyIGlkZWEgY29ycmVjdGx5LAo+IHdoYXQgeW91
J3JlIHNheWluZyBpcyBzb21ldGhpbmcgbGlrZToKPiAKPiBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgcmFuZG9tX2dldF9lbnRyb3B5KHZvaWQpCj4gewo+ICAgICAgICAgdW5zaWduZWQgaW50
IHByaWQgPSByZWFkX2MwX3ByaWQoKTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBpbXAgPSBwcmlk
ICYgUFJJRF9JTVBfTUFTSzsKPiAgICAgICAgIHVuc2lnbmVkIGludCBjMF9yYW5kb207Cj4gCj4g
ICAgICAgICBpZiAoY2FuX3VzZV9taXBzX2NvdW50ZXIocHJpZCkpCj4gICAgICAgICAgICAgICAg
IHJldHVybiByZWFkX2MwX2NvdW50KCk7Cj4gCj4gICAgICAgICBpZiAoY3B1X2hhc18za2V4KQo+
ICAgICAgICAgICAgICAgICBjMF9yYW5kb20gPSAocmVhZF9jMF9yYW5kb20oKSA+PiA4KSAmIDB4
M2Y7Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGMwX3JhbmRvbSA9IHJlYWRfYzBf
cmFuZG9tKCkgJiAweDNmOwo+ICAgICAgICAgcmV0dXJuIChyYW5kb21fZ2V0X2VudHJvcHlfZmFs
bGJhY2soKSA8PCA2KSB8ICgweDNmIC0gYzBfcmFuZG9tKTsKPiB9Cj4gCj4gV2hhdCBkbyB5b3Ug
dGhpbmsgb2YgdGhhdD8gU29tZSB0d2VhayBJJ20gbWlzc2luZz8KCiBJdCBjZXJ0YWlubHkgbG9v
a3MgZ29vZCB0byBtZS4gIERvIHlvdSBoYXZlIGEgd2F5IEkgY291bGQgdmVyaWZ5IGhvdyB0aGlz
IApmdW5jdGlvbiBwZXJmb3Jtcz8gIElmIHNvLCB0aGVuIEkgY291bGQgcHV0IGl0IHRocm91Z2gg
bXkgc3lzdGVtcyBhcyBJIGNhbiAKY292ZXIgYWxsIHRoZSBjYXNlcyBoYW5kbGVkIGhlcmUuCgog
QW55IGltcHJvdmVtZW50cyBJIHByZXZpb3VzbHkgZGlzY3Vzc2VkIGNhbiB0aGVuIGJlIG1hZGUg
bG9jYWxseSBpbiB0aGUgCk1JUFMgcG9ydCBhcyBmb2xsb3ctdXAgY2hhbmdlcy4KCj4gPiAgSXNu
J3QgaXQgZ29pbmcgdG8gYmUgYW4gaXNzdWUgZm9yIGFuIGVudHJvcHkgc291cmNlIHRoYXQgdGhl
IGRpc3RyaWJ1dGlvbgo+ID4gb2YgdmFsdWVzIG9idGFpbmVkIGZyb20gdGhlIENQMCBSYW5kb20g
Yml0LWZpZWxkIGlzIG5vdCBldmVuLCB0aGF0IGlzIHNvbWUKPiA+IHZhbHVlcyBmcm9tIHRoZSA2
LWJpdCByYW5nZSB3aWxsIG5ldmVyIGFwcGVhcj8KPiAKPiBJdCdzIHRoZSBzYW1lIHNpdHVhdGlv
biB3aXRob3V0IGludmVydGluZyB0aGUgb3JkZXI6IGluc3RlYWQgb2Ygc29tZQo+IGJpdHMgb24g
dGhlIHRvcCBuZXZlciBoYXBwZW5pbmcsIHNvbWUgYml0cyBvbiB0aGUgYm90dG9tIG5ldmVyIGhh
cHBlbgo+IGluc3RlYWQuIEluIGdlbmVyYWwsIGNvdW50ZXJzIGRvbid0IGZvcm0gdW5pZm9ybSBk
aXN0cmlidXRpb25zIGFueXdheSwKPiBzaW5jZSB0aGUgbG93ZXIgYml0cyBjaGFuZ2UgZmFzdGVy
LCBhbmQgbmVpdGhlciBhcmUgdGhleSBpbmRlcGVuZGVudCwKPiBzaW5jZSBvbmUgc2FtcGxlIGlu
IGxhcmdlIHBhcnQgZGVwZW5kcyBvbiB0aGUgcHJldmlvdXMuIFRoaXMgaXMganVzdAo+IHNvcnQg
b2YgdGhlIG5hdHVyZSBvZiB0aGUgYmVhc3QsIGFuZCB0aGUgY29kZSB0aGF0IGNhbGxzCj4gcmFu
ZG9tX2dldF9lbnRyb3B5KCkgZGVhbHMgd2l0aCB0aGlzIGFwcHJvcHJpYXRlbHkgKGJ5LCBhdCB0
aGUgbW9tZW50LAo+IGp1c3QgaGFzaGluZyBhbGwgdGhlIGJpdHMpLgoKIE9LIHRoZW4sIHRoYW5r
cyBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLgoKICBNYWNpZWoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
