Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC5EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owPgO+As+3mtT9uZ4mFYDHLXjNF00FYrNdMB/0BurqQ=; b=ahGLc+sA8mm5fz
	Ek8pesK6bLfGMZz7e7a1+hi38BfuSC6SjMG2BwAqZB4j07gVK928UCmP8wNCnIACxWK0v66DjaoFK
	eimhe66OEnBjxYCAyb/WGDVmJVYHXcDqvKanoWrETvSxHIGAr4rWPxOICEHOvYngq/M0s1VFPA86U
	QJW3CBimA7+O1ohYJlZ0yfmucUCQ63EMuTYDWAHiA9yzDtXqhZA5J1dLbTt/zdilnlAyYD64n0nn+
	ta9voZmUyym2euiRwjoE1OjQgVGL1O1DCp9np5awFtwY2w2VlMujMKAUopDejrJWIs2Qa7XzTrmVC
	S0j3pDuHf4C8aPPi/B2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrRY3-00Gi8Z-L2; Sun, 28 Nov 2021 21:17:23 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrRY0-00Gi8B-LC; Sun, 28 Nov 2021 21:17:22 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2LsJ1Lcdz9y;
 Sun, 28 Nov 2021 22:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638134236; bh=AVVRrFppT2KXeoQ1knr4qxNAWz0fqZEqjSZX5XRty4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qeLiiTlDKcoC3FvftCsYmUekeo8vu2N1pSF3fCD2tgheWVvyonhdof+qu+Ea9djoI
 F0VfIqhNPcyB+IepSkiEVfWMkXITXgi5yRN5hDrKipQbOIN/UYPiCQ3ypFE5/lr3yX
 t143o/oCoxAN5HQdJgLvzJt9p7M6RWXHGnJUqKSETKZD7q6dZ+W4qIz0kh2v3idXT1
 jUvuN2o4SCcowRIIDi5HFtYotMwlOnPhdI33AjtMrxHoxjMEAOO/hdSLgu27razlyO
 MB5TcQY9Ad3wE8nllR9aML4jKPT5UuRgghYO2j4ETJ73vP6/OvL2peMilDKCW68Ia0
 6xDNHfFLM+f6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 22:17:06 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_131720_899652_D9D6C1A4 
X-CRM114-Status: GOOD (  30.06  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTI6MDQ6MDFBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI4LjExLjIwMjEgMDM6NDMsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6
Cj4gPiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0NFBNICswMzAwLCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4gPj4gU29DIHBsYXRmb3JtcyBvZnRlbiBoYXZlIG11bHRpcGxlIHdheXMg
b2YgaG93IHRvIHBlcmZvcm0gc3lzdGVtJ3MKPiA+PiBwb3dlci1vZmYgYW5kIHJlc3RhcnQgb3Bl
cmF0aW9ucy4gTWVhbndoaWxlIHRvZGF5J3Mga2VybmVsIGlzIGxpbWl0ZWQgdG8KPiA+PiBhIHNp
bmdsZSBvcHRpb24uIEFkZCBjb21iaW5lZCBwb3dlci1vZmYrcmVzdGFydCBoYW5kbGVyIGNhbGwg
Y2hhaW4gQVBJLAo+ID4+IHdoaWNoIGlzIGluc3BpcmVkIGJ5IHRoZSByZXN0YXJ0IEFQSS4gVGhl
IG5ldyBBUEkgcHJvdmlkZXMgYm90aCBwb3dlci1vZmYKPiA+PiBhbmQgcmVzdGFydCBmdW5jdGlv
bmFsaXR5Lgo+ID4+Cj4gPj4gVGhlIG9sZCBwbV9wb3dlcl9vZmYgbWV0aG9kIHdpbGwgYmUga2Vw
dCBhcm91bmQgdGlsbCBhbGwgdXNlcnMgYXJlCj4gPj4gY29udmVydGVkIHRvIHRoZSBuZXcgQVBJ
Lgo+ID4+Cj4gPj4gQ3VycmVudCByZXN0YXJ0IEFQSSB3aWxsIGJlIHJlcGxhY2VkIGJ5IHRoZSBu
ZXcgdW5pZmllZCBBUEkgc2luY2UKPiA+PiBuZXcgQVBJIGlzIGl0cyBzdXBlcnNldC4gVGhlIHJl
c3RhcnQgZnVuY3Rpb25hbGl0eSBvZiB0aGUgc3lzLW9mZiBoYW5kbGVyCj4gPj4gQVBJIGlzIGJ1
aWx0IHVwb24gdGhlIGV4aXN0aW5nIHJlc3RhcnQtbm90aWZpZXIgQVBJcy4KPiA+Pgo+ID4+IElu
IG9yZGVyIHRvIGVhc2UgY29udmVyc2lvbiB0byB0aGUgbmV3IEFQSSwgY29udmVuaWVudCBoZWxw
ZXJzIGFyZSBhZGRlZAo+ID4+IGZvciB0aGUgY29tbW9uIHVzZS1jYXNlcy4gVGhleSB3aWxsIHJl
ZHVjZSBhbW91bnQgb2YgYm9pbGVycGxhdGUgY29kZSBhbmQKPiA+PiByZW1vdmUgZ2xvYmFsIHZh
cmlhYmxlcy4gVGhlc2UgaGVscGVycyBwcmVzZXJ2ZSBvbGQgYmVoYXZpb3VyIGZvciBjYXNlcwo+
ID4+IHdoZXJlIG9ubHkgb25lIHBvd2VyLW9mZiBoYW5kbGVyIGlzIGV4cGVjdGVkLCB0aGlzIGlz
IHdoYXQgYWxsIGV4aXN0aW5nCj4gPj4gZHJpdmVycyB3YW50LCBhbmQgdGh1cywgdGhleSBjb3Vs
ZCBiZSBlYXNpbHkgY29udmVydGVkIHRvIHRoZSBuZXcgQVBJLgo+ID4+IFVzZXJzIG9mIHRoZSBu
ZXcgQVBJIHNob3VsZCBleHBsaWNpdGx5IGVuYWJsZSBwb3dlci1vZmYgY2hhaW5pbmcgYnkKPiA+
PiBzZXR0aW5nIGNvcnJlc3BvbmRpbmcgZmxhZyBvZiB0aGUgcG93ZXJfaGFuZGxlciBzdHJ1Y3R1
cmUuCj4gPiBbLi4uXQo+ID4gCj4gPiBIaSwKPiA+IAo+ID4gQSBnZW5lcmFsIHF1ZXN0aW9uOiBk
byB3ZSByZWFsbHkgbmVlZCB0aHJlZSBkaXN0aW5jdCBjaGFpbnMgZm9yIHRoaXM/Cj4gCj4gSGVs
bG8gTWljaGHFgiwKPiAKPiBBdCBtaW5pbXVtIHRoaXMgbWFrZXMgY29kZSBlYXNpZXIgdG8gZm9s
bG93Lgo+IAo+ID4gQ2FuJ3QgdGhlcmUgYmUgb25seSBvbmUgdGhhdCBjaGFpbiBvZiBjYWxsYmFj
a3MgdGhhdCBnZXQgYSBzdGFnZQo+ID4gKFJFU1RBUlRfUFJFUEFSRSwgUkVTVEFSVCwgUE9XRVJf
T0ZGX1BSRVBBUkUsIFBPV0VSX09GRikgYW5kIGNhbiBpZ25vcmUKPiA+IHRoZW0gYXQgd2lsbD8g
Q2FsbGluZyB0aHJvdWdoIFBPV0VSX09GRl9QUkVQQVJFIHdvdWxkIGFsc28gcmV0dXJuCj4gPiB3
aGV0aGVyIHRoYXQgUE9XRVJfT0ZGIGlzIHBvc3NpYmxlIChmb3Iga2VybmVsX2Nhbl9wb3dlcl9v
ZmYoKSkuCj4gCj4gSSdtIGhhdmluZyB0cm91YmxlIHdpdGggcGFyc2luZyB0aGlzIGNvbW1lbnQu
IENvdWxkIHlvdSBwbGVhc2UgdHJ5IHRvCj4gcmVwaHJhc2UgaXQ/IEkgZG9uJ3Qgc2VlIGhvdyB5
b3UgY291bGQgY2hlY2sgd2hldGhlciBwb3dlci1vZmYgaGFuZGxlcgo+IGlzIGF2YWlsYWJsZSBp
ZiB5b3UnbGwgbWl4IGFsbCBoYW5kbGVycyB0b2dldGhlci4KCklmIG5vdGlmeV9jYWxsX2NoYWlu
KCkgd291bGQgYmUgZml4ZWQgdG8gcmV0dXJuIE5PVElGWV9PSyBpZiBhbnkgY2FsbApyZXR1cm5l
ZCBOT1RJRllfT0ssIHRoZW4gdGhpcyB3b3VsZCBiZSBhIGNsZWFyIHdheSB0byBnYXRoZXIgdGhl
CmFuc3dlciBpZiBhbnkgb2YgdGhlIGhhbmRsZXJzIHdpbGwgYXR0ZW1wdCB0aGUgZmluYWwgYWN0
aW9uIChyZWJvb3Qgb3IKcG93ZXIgb2ZmKS4KCj4gCj4gPiBJIHdvdWxkIGFsc28gc3BsaXQgdGhp
cyBwYXRjaCBpbnRvIHByZXBhcmF0aW9uIGNsZWFudXBzIChsaWtlIHdyYXBwaW5nCj4gPiBwbV9w
b3dlcl9vZmYgY2FsbCB3aXRoIGEgZnVuY3Rpb24pIGFuZCBhZGRpbmcgdGhlIG5vdGlmaWVyLWJh
c2VkCj4gPiBpbXBsZW1lbnRhdGlvbi4KPiAKPiBXaGF0J3MgdGhlIGJlbmVmaXQgb2YgdGhpcyBz
cGxpdCB1cCB3aWxsIGJlPyBBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCBpdAo+IHdpbGwgZWFzZSBy
ZXZpZXdpbmcgb2YgdGhpcyBwYXRjaCBvciBzb21ldGhpbmcgZWxzZT8KCk1haW5seSB0byBlYXNl
IHJldmlldywgYXMgdGhlIHdyYXBwaW5nIHdpbGwgYmUgYSBuby1vcCwgYnV0IHRoZSBhZGRpdGlv
bgpvZiBub3RpZmllciBjaGFpbiBjaGFuZ2VzIHNlbWFudGljcyBhIGJpdC4KCkJlc3QgUmVnYXJk
cwpNaWNoYcWCwqBNaXJvc8WCYXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
