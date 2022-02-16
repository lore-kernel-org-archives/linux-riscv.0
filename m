Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC088C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2gYFLnYSVWZwBecaB1PQSK4avIdi2dFaOe2hR9Q9KE=; b=sgrBdvdDDRg2gs
	bplYhmWhEp6sAvProzFij5B9PraLE84pGQ8GF95Zj0uZuEOswmn+f7FW9JvvKzE7FHsvUyvsyJrYB
	Q6ey+WqvAw3CMaP8KNqrSU8eYPoQIb0Scm+3mZumbQ9c9E5lI02l2hfStKxVMSJFVOQP05rOg1Npp
	W/n2P1RJizIhbuAvX9dmeLN5E6fXmPQqx87em/7XfQQ95YzCxbstuSxL779l2zHeZ6UJhuiH6e2ht
	QLmt1xUYgOzFJEPK4ftrC/KeFhhTDH48w+m6IvfUGo5z57zoyKsEWlV2jGsDE9itPNowOn5r1CNqA
	A3uAoBRSnRrZg3JIXsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKQzU-008KbH-80; Wed, 16 Feb 2022 20:33:32 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKQzR-008KaR-27
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 20:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645043515;
 bh=Ybn8l+gnMKMMXvs55hiDNOMPxOVIuTwQZmrqM3YEIT4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AntNcnKLyF3jvT6nrcYCG4qX//R6P/jg6GX9PAq9ahEaqC1d66RPjmbHb+W4q1nhN
 pMU7WD5iY0FX3JDLRsLSlGXye9WL2FfhU+BQo9tN+35Wd+ULtBzJKhMvmm/TuqFOvm
 IqYpmS3G8VF0HmaztNK8BDpk8AcbiuITor+K4TAE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.232]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1oJIk801n5-011mvb; Wed, 16
 Feb 2022 21:31:55 +0100
Message-ID: <de2cbd2a-8d0d-8678-e514-b153d04546cc@gmx.de>
Date: Wed, 16 Feb 2022 21:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220130233718.21544-1-digetx@gmail.com>
 <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
 <CAJZ5v0g0MrBm2+GwctkB7kUyBEt6HTAexRCFFRmTF1UKDrVQ-g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAJZ5v0g0MrBm2+GwctkB7kUyBEt6HTAexRCFFRmTF1UKDrVQ-g@mail.gmail.com>
X-Provags-ID: V03:K1:BtWBXH8Hx0gs6H70GSeWdQfjHJJkkJcL0sCha+IYkFzIkqPcTuW
 qKy+2T0ZaFjOf0xL3yRiF1cUpCUYSVgqU7KzwzS+JfDwLwpezAw537tUvZg/2bOLghB+l87
 w3cRaMw1LIHIT6wVzHTvekJyjtx+uVE2jwwagYFCMH9R/cOGUhFKVp6jWY02QQ7l0/6B1hQ
 6lKAfYfgEy3VsBR0gZMrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m5CRufpR4Nc=:3YY8ipwdQLVft0dePw9YSh
 GUR0lnlWhCPH8e7cGyZuVRF4QTaiMpo/t4CaEOUGLIsLKu9l5M/J0O5M31HNvfJdp+wCixixW
 ethNV9fQwcaghavvR5Ys8j3bZzVgSa7R1OyImZriy57lwfiqdjxLeLcFAKSN2rNhwXo+L/1W0
 CQyzAyysct5pNIn6YhVq+UHJuMW9E5n4xaMMBrwmLs2OCCvppuqotMNUovPjEQwyXKEJ+eFhM
 9yjpXwZ8d3mtYgImVbnKr09+gh/F/wPYXq7eYIpe39d9AbGAEQBSqL/KVOnCktbbcz2QF5Qbk
 4e7AQF9zoGHa9dkqmKwp5ZIdSigW0kvkTZVGQrYpdQk+jIkqYRXSjx48uK1QfjU+0gP6+BazZ
 vHIF29XOsraFmwyXxbJ9z62U6lScuvKK+hcIdwsTDX1ggSkvbxldkEoF5EU5WckNyKgp3gyzH
 DfO65T9j2hzIuIY+WJVtkWoyJeNgSwsFOR7Izo94OQHlrcyx49oOnlwEdPO+nwrmIJBci5bOR
 WOLNQgMmF6kCc29abhcYlGzqUMIWI+FO/fCqXzwMQQmpGHb0yApKLUA4nUq0AMOk6w+NN8w2X
 /FbqL85ikgC66lPN0ooU1nS7KTmmY5exT9d7V9iWM6nLCea6Xm6zHRAIXEdyFZzA8VCkbFnzD
 h2vE8D32H6zqsIt6XTnvWDjRnU13iMkEj3E7cMmMtSopa2Wp8u/DtvdAeO/wkDmneLWInPLs8
 6RgI97ngQ4wqgYy1sPu7EIk9kIRcFo4/RoCxjHgIBkJrc2sI1wfoeqEIWGAnQxL/RmH+OLvYO
 4yVmqq+p6FhQjuDDZ4yhghQDs+3QKjtVbK+8SqzHgH28Ka1VeSb/Sjw00g5YRoCxba1dPjJUz
 745leF9ctWiJ4d2dLvna8gH4qOiznTFUsQruaIlZTRQt2Q4WnGzd6w/B0Yn+xWmbkRgyZHOZI
 uy8YKYBLf5449zcoQ3q6pmGV9kDPV93qDp6c5xvkslulnnJ92iiU/+AhdlS7dUnaoQWw0libs
 PaL7jI3w3bUjzZ86ihC2Hg/wIiAwKaAAUMew3jB75LdA9Od0L63l2pMobL+2iUUq3y+BntMIe
 DlxSKf+Q98mWIw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_123329_481742_AAC30057 
X-CRM114-Status: GOOD (  22.64  )
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

T24gMi8xNi8yMiAxMzoyNSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTUsIDIwMjIgYXQgMTE6MDAgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4gMzEuMDEuMjAyMiAwMjozNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6
Cj4+PiBQcm9ibGVtCj4+PiAtLS0tLS0tCj4+Pgo+Pj4gU29DIGRldmljZXMgcmVxdWlyZSBwb3dl
ci1vZmYgY2FsbCBjaGFpbmluZyBmdW5jdGlvbmFsaXR5IGZyb20ga2VybmVsLgo+Pj4gV2UgaGF2
ZSBhIHdpZGVseSB1c2VkIHJlc3RhcnQgY2hhaW5pbmcgcHJvdmlkZWQgYnkgcmVzdGFydCBub3Rp
ZmllciBBUEksCj4+PiBidXQgbm90aGluZyBmb3IgcG93ZXItb2ZmLgo+Pj4KPj4+IFNvbHV0aW9u
Cj4+PiAtLS0tLS0tLQo+Pj4KPj4+IEludHJvZHVjZSBuZXcgQVBJIHRoYXQgcHJvdmlkZXMgYm90
aCByZXN0YXJ0IGFuZCBwb3dlci1vZmYgY2FsbCBjaGFpbnMuCj4+Pgo+Pj4gV2h5IGNvbWJpbmUg
cmVzdGFydCB3aXRoIHBvd2VyLW9mZj8gQmVjYXVzZSBkcml2ZXJzIG9mdGVuIGRvIGJvdGguCj4+
PiBNb3JlIHByYWN0aWNhbCB0byBoYXZlIEFQSSB0aGF0IHByb3ZpZGVzIGJvdGggdW5kZXIgdGhl
IHNhbWUgcm9vZi4KPj4+Cj4+PiBUaGUgbmV3IEFQSSBpcyBkZXNpZ25lZCB3aXRoIHNpbXBsaWNp
dHkgYW5kIGV4dGVuc2liaWxpdHkgaW4gbWluZC4KPj4+IEl0J3MgYnVpbHQgdXBvbiB0aGUgZXhp
c3RpbmcgcmVzdGFydCBhbmQgcmVib290IEFQSXMuIFRoZSBzaW1wbGljaXR5Cj4+PiBpcyBpbiBu
ZXcgaGVscGVyIGZ1bmN0aW9ucyB0aGF0IGFyZSBjb252ZW5pZW50IGZvciBkcml2ZXJzLiBUaGUK
Pj4+IGV4dGVuc2liaWxpdHkgaXMgaW4gdGhlIGRlc2lnbiB0aGF0IGRvZXNuJ3QgaGFyZGNvZGUg
Y2FsbGJhY2sKPj4+IGFyZ3VtZW50cywgbWFraW5nIGVhc3kgdG8gYWRkIG5ldyBwYXJhbWV0ZXJz
IGFuZCByZW1vdmUgb2xkLgo+Pj4KPj4+IFRoaXMgaXMgYSB0aGlyZCBhdHRlbXB0IHRvIGludHJv
ZHVjZSB0aGUgbmV3IEFQSS4gRmlyc3Qgd2FzIG1hZGUgYnkKPj4+IEd1ZW50ZXIgUm9lY2sgYmFj
ayBpbiAyMDE0LCBzZWNvbmQgd2FzIG1hZGUgYnkgVGhpZXJyeSBSZWRpbmcgaW4gMjAxNy4KPj4+
IEluIGZhY3QgdGhlIHdvcmsgZGlkbid0IHN0b3AgYW5kIHJlY2VudGx5IGFybV9wbV9yZXN0YXJ0
KCkgd2FzIHJlbW92ZWQKPj4+IGZyb20gdjUuMTQga2VybmVsLCB3aGljaCB3YXMgYSBwYXJ0IG9m
IHByZXBhcmF0b3J5IHdvcmsgc3RhcnRlZCBieQo+Pj4gR3VlbnRlciBSb2Vjay4gSSB0b29rIGlu
dG8gYWNjb3VudCBleHBlcmllbmNlIGFuZCBpZGVhcyBmcm9tIHRoZQo+Pj4gcHJldmlvdXMgYXR0
ZW1wdHMsIGV4dGVuZGVkIGFuZCBwb2xpc2hlZCB0aGVtLgo+Pgo+Pgo+PiBSYWZhZWwgYW5kIGFs
bCwgZG8geW91IHNlZSBhbnl0aGluZyBjcml0aWNhbCB0aGF0IG5lZWRzIHRvIGJlIGltcHJvdmVk
Cj4+IGluIHRoaXMgdjY/Cj4+Cj4+IFdpbGwgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIHRha2UgdGhp
cyBwYXRjaHNldCB2aWEgdGhlIHBvd2VyIHRyZWUgaWYgaXQKPj4gbG9va3Mgb2theSwgb3IgZ2l2
ZSBhbiBhY2suCj4KPiBJIG5lZWQgc29tZSBtb3JlIHRpbWUgZm9yIHRoaXMsIHNvcnJ5Lgo+Cj4g
SSdtIGEgYml0IGNvbmNlcm5lZCBhYm91dCBzZWVpbmcgbm8gcmVzcG9uc2UgdG8gdGhpcyBzZXQg
ZnJvbSBhbnlvbmUuCj4KPiBJdCBsb29rcyBsaWtlIG11bHRpcGxlIHBsYXRmb3JtcyBtYXkgYmUg
YWZmZWN0ZWQgYnkgaXQgaW4gcHJpbmNpcGxlLAo+IHNvIGRvZXNuJ3QgYW55b25lIGNhcmU/CgpJ
IGRpZCBsb29rZWQgaW50byB0aGUgd2hvbGUgcGF0Y2ggc2V0IGFmdGVyIGFwcGx5aW5nIGl0IGxv
Y2FsbHkuCgpXaGlsZSBJIGFncmVlIGEgbmV3IGNvbWJpbmVkIEFQSSBpcyBnb29kLCBhbmQgdGhl
IGJlZ2lubmluZyBsb29rZWQgcHJvbWlzaW5nLAphZnRlciBzb21lIHRpbWUgSSBzdGFydGVkIHRv
IGFzayBteXNlbGYgaWYgdGhlIHdob2xlIGluZnJhc3RydWN0dXJlIG1pZ2h0CmJlIGEgbGl0dGxl
IG92ZXJkZXNpZ25lZC4KCkFueXdheSwgSSB0ZXN0ZWQgaXQgYW5kIGl0IHdvcmtzIGZvciBtZSBv
biBwYXJpc2MuCkFuZCBpdCdzIHByb2JhYmx5IGJldHRlciB0aGFuIHdoYXQgd2UgaGF2ZSB0b2Rh
eS4KCkhlbGdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
