Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F310C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 09:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C0E2081F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 09:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZhb6H01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C0E2081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zD+pNf717qE4+ynfeObPU9bP2iK70WCRQlFTyRgjdDo=; b=bZhb6H01MiaDey
	XAdlO1dhdviewCAz02l8KvyBlXezYC778siKdKZssq8lxLT9YSAXI19atodK+IJJacjGA3I2ylEuU
	wWJ1S0t980V1pcQ9snyayMUQ3U56/b1Hv9woSKf7LoMT4i0RZhff73VVixyyHn7O4yu3A8OHs+eT6
	dCCSZpclLiybaX/1RwuAnKiK1w9o/zZY6uum4zq+e/kCKQntbaOSU8HoU2MddDoqSB4qsNRCejV/9
	A2IjTgg83qHFxJbbMjIocM0cNdkukMK3+TF7IjZHoQ6UFJpgfm2RjOIgqEhUrbiBh4a/VpP6TYVDe
	5AVAVabHWlBRkgWUN74Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIs1k-0002sV-QG; Sat, 03 Nov 2018 09:15:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIs1g-0002qr-BP; Sat, 03 Nov 2018 09:15:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0885C606D487;
 Sat,  3 Nov 2018 10:15:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id POaZfqxv8zrK; Sat,  3 Nov 2018 10:15:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 81CD7606C48C;
 Sat,  3 Nov 2018 10:15:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6U7XB2Wlq2pf; Sat,  3 Nov 2018 10:15:14 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 440E1609F82F;
 Sat,  3 Nov 2018 10:15:12 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
Date: Sat, 03 Nov 2018 10:15:11 +0100
Message-ID: <6886607.O3ZT5bM3Cy@blindfold>
In-Reply-To: <20181103040041.7085-1-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_021528_687996_7D42EA29 
X-CRM114-Status: GOOD (  13.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joel Fernandes <joelaf@google.com>, linux-mips@linux-mips.org,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-ia64@vge,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 kvmarm@lists.cs.columbia.edu, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 r.kernel.org@lithops.sigma-star.at, hughd@google.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 anton.ivanov@kot-begemot.co.uk, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 pantin@google.com, linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103091511.faEDmINDiWsNFLba62WRwyJB651F9RSSBxifvKlrn7o@z>

Sm9lbCwKCkFtIFNhbXN0YWcsIDMuIE5vdmVtYmVyIDIwMTgsIDA1OjAwOjM4IENFVCBzY2hyaWVi
IEpvZWwgRmVybmFuZGVzOgo+IEhpLAo+IEhlcmUgaXMgdGhlIGxhdGVzdCAiZmFzdCBtcmVtYXAi
IHNlcmllcy4gVGhpcyBqdXN0IGEgcmVwb3N0IHdpdGggS2lyaWxsJ3MKPiBBY2tlZC1ieXMgYWRk
ZWQuIEkgd291bGQgbGlrZSB0aGlzIHRvIGJlIGNvbnNpZGVyZWQgZm9yIGxpbnV4IC1uZXh0LiAg
SSBhbHNvCj4gZHJvcHBlZCB0aGUgQ09ORklHIGVuYWJsZW1lbnQgcGF0Y2ggZm9yIGFybTY0IHNp
bmNlIEkgYW0geWV0IHRvIHRlc3QgaXQgd2l0aAo+IHRoZSBuZXcgVExCIGZsdXNoaW5nIGNvZGUg
dGhhdCBpcyBpbiB2ZXJ5IHJlY2VudCBrZXJuZWwgcmVsZWFzZXMuIChOb25lIG9mIG15Cj4gYXJt
NjQgZGV2aWNlcyBydW4gbWFpbmxpbmUgcmlnaHQgbm93Likgc28gSSB3aWxsIHBvc3QgdGhlIGFy
bTY0IGVuYWJsZW1lbnQgb25jZQo+IEkgZ2V0IHRvIHRoYXQuIFRoZSBwZXJmb3JtYW5jZSBudW1i
ZXJzIGluIHRoZSBzZXJpZXMgYXJlIGZvciB4ODYuCj4gCj4gTGlzdCBvZiBwYXRjaGVzIGluIHNl
cmllczoKPiAKPiAoMSkgbW06IHNlbGVjdCBIQVZFX01PVkVfUE1EIGluIHg4NiBmb3IgZmFzdGVy
IG1yZW1hcAo+IAo+ICgyKSBtbTogc3BlZWQgdXAgbXJlbWFwIGJ5IDIweCBvbiBsYXJnZSByZWdp
b25zICh2NCkKPiB2MS0+djI6IEFkZGVkIHN1cHBvcnQgZm9yIHBlci1hcmNoIGVuYWJsZW1lbnQg
KEtpcmlsbCBTaHV0ZW1vdikKPiB2Mi0+djM6IFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgdG8gc3Rh
dGUgdGhlIG9wdGltaXphdGlvbiBtYXkgYWxzbwo+IAlydW4gZm9yIG5vbi10aHAgdHlwZSBvZiBz
eXN0ZW1zIChEYW5pZWwgQ29sKS4KPiB2My0+djQ6IFJlbW92ZSB1c2VsZXNzIHBtZF9sb2NrIGNo
ZWNrIChLaXJpbGwgU2h1dGVtb3YpCj4gCVJlYmFzZWQgb250b3Agb2YgTGludXMncyBtYXN0ZXIs
IHVwZGF0ZWQgcGVyZiByZXN1bHRzIGJhc2VkCj4gICAgICAgICBvbiB4ODYgdGVzdGluZy4gQWRk
ZWQgS2lyaWxsJ3MgQWNrcy4KPiAKPiAoMykgbW06IHRyZWV3aWRlOiByZW1vdmUgdW51c2VkIGFk
ZHJlc3MgYXJndW1lbnQgZnJvbSBwdGVfYWxsb2MgZnVuY3Rpb25zICh2MikKPiB2MS0+djI6IGZp
eCBhcmNoL3VtLyBwcm90b3R5cGUgd2hpY2ggd2FzIG1pc3NlZCBpbiB2MSAoQW50b24gSXZhbm92
KQo+ICAgICAgICAgdXBkYXRlIGNoYW5nZWxvZyB3aXRoIG1hbnVhbCBmaXh1cHMgZm9yIG02OGsg
YW5kIG1pY3JvYmxhemUuCj4gCj4gbm90IGluY2x1ZGVkIC0gKDQpIG1tOiBzZWxlY3QgSEFWRV9N
T1ZFX1BNRCBpbiBhcm02NCBmb3IgZmFzdGVyIG1yZW1hcAo+ICAgICBUaGlzIHBhdGNoIGlzIGRy
b3BwZWQgc2luY2UgbGFzdCBwb3N0aW5nIHBlbmRpbmcgZnVydGhlciBwZXJmb3JtYW5jZQo+ICAg
ICB0ZXN0aW5nIG9uIGFybTY0IHdpdGggbmV3IFRMQiBnYXRoZXIgdXBkYXRlcy4gU2VlIG5vdGVz
IGluIHBhdGNoCj4gICAgIHRpdGxlZCAibW06IHNwZWVkIHVwIG1yZW1hcCBieSA1MDB4IG9uIGxh
cmdlIHJlZ2lvbnMiIGZvciBtb3JlCj4gICAgIGRldGFpbHMuCj4gCgpUaGlzIGJyZWFrcyBVTUwg
YnVpbGQ6CiAgQ0MgICAgICBtbS9tcmVtYXAubwptbS9tcmVtYXAuYzogSW4gZnVuY3Rpb24g4oCY
bW92ZV9ub3JtYWxfcG1k4oCZOgptbS9tcmVtYXAuYzoyMjk6MjogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNldF9wbWRfYXTigJk7IGRpZCB5b3UgbWVhbiDigJhz
ZXRfcHRlX2F04oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICBz
ZXRfcG1kX2F0KG1tLCBuZXdfYWRkciwgbmV3X3BtZCwgcG1kKTsKICBefn5+fn5+fn5+CiAgc2V0
X3B0ZV9hdAogIENDICAgICAgY3J5cHRvL3JuZy5vCiAgQ0MgICAgICBmcy9kaXJlY3QtaW8ubwpj
YzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKClRvIHRlc3QgeW91cnNl
bGYsIGp1c3QgcnVuIG9uIGEgeDg2IGJveDoKJCBtYWtlIGRlZmNvbmZpZyBBUkNIPXVtCiQgbWFr
ZSBsaW51eCBBUkNIPXVtCgpUaGFua3MsCi8vcmljaGFyZAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
