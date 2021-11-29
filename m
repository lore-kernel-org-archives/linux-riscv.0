Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCB0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 00:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFQ9eDU/u6Z/ihpaDsyJ2w5j3TCb+XNXwMmxSnyMViE=; b=JvwnVi2E1OcIxH
	8DUm1ZM0/iV+O8DNZSnBY7UxmAugFbFTX4KFIcceGVsiovLeUoTMpWrYMakCxMn24f6YsYF+TvaJv
	MBhPK6PNzbtPuB4GJU5Hbm8/5QmHUM35DxDdFM3iZcZTbqJaiksC7U5o5ovxxaqSB9XedMDe36WSj
	OGv6eUv61bQglfyhyQd3yCrdmOkWtcrMPP96RIy+0gJOUAlwyS4JC+Ghw6u+rS7ftWHmJ3gqFYyXB
	cvIrNlgIOP5ScD8IV+WUdzH6hOXT0VROOcuMqZBEiP4/h1lChWcQURyyV8XtrX2vLQu71QNy8m/Z6
	OegfnIryIrs0NFKj5zGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrUf0-00GxRm-Qh; Mon, 29 Nov 2021 00:36:46 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrUew-00GxQO-Tt; Mon, 29 Nov 2021 00:36:44 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2RHF5R6Gz9Y;
 Mon, 29 Nov 2021 01:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638146198; bh=DI1VWBOrDzR1kSFvGVwF5e/uC6F95umcWDF0D1gW0co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H73sBxsM7L9z8xEfnp2Ak7MzBK8+vuHhYSpX9ZmIw96z66YhhL0jbzAc1kAW4E8/k
 E+n0myrDaFBdTPW3DCJBAB1QxLCznookgF41GB3ur/8AtJ172fB625fAJLQBCfF2Il
 1tVB3rwB3wCft3kEONBcl+9mGZ0YFJna/va55m2Id6G5OQJMzxWyiW8mEoVG9uWh4D
 9FU7cd4y+9BUv1/bcd+v0FTSSINIJ8msC5Z+cow25KP+uSrFkzTmZSbuYJNYmoN8pj
 wIHmD3sAFqkn2Up4Tyhb9Q0kZcFFYL4JTYDk03Wdeze2AnxwyR74tes3GEAEUnF7BY
 Uq7OHC/U12/7A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:36:24 +0100
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
Message-ID: <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
 <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_163643_191541_AA3ED973 
X-CRM114-Status: GOOD (  20.78  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTI6NTM6NTFBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI5LjExLjIwMjEgMDA6MTcsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6
Cj4gPj4gSSdtIGhhdmluZyB0cm91YmxlIHdpdGggcGFyc2luZyB0aGlzIGNvbW1lbnQuIENvdWxk
IHlvdSBwbGVhc2UgdHJ5IHRvCj4gPj4gcmVwaHJhc2UgaXQ/IEkgZG9uJ3Qgc2VlIGhvdyB5b3Ug
Y291bGQgY2hlY2sgd2hldGhlciBwb3dlci1vZmYgaGFuZGxlcgo+ID4+IGlzIGF2YWlsYWJsZSBp
ZiB5b3UnbGwgbWl4IGFsbCBoYW5kbGVycyB0b2dldGhlci4KPiA+IElmIG5vdGlmeV9jYWxsX2No
YWluKCkgd291bGQgYmUgZml4ZWQgdG8gcmV0dXJuIE5PVElGWV9PSyBpZiBhbnkgY2FsbAo+ID4g
cmV0dXJuZWQgTk9USUZZX09LLCB0aGVuIHRoaXMgd291bGQgYmUgYSBjbGVhciB3YXkgdG8gZ2F0
aGVyIHRoZQo+ID4gYW5zd2VyIGlmIGFueSBvZiB0aGUgaGFuZGxlcnMgd2lsbCBhdHRlbXB0IHRo
ZSBmaW5hbCBhY3Rpb24gKHJlYm9vdCBvcgo+ID4gcG93ZXIgb2ZmKS4KPiBDb3VsZCB5b3UgcGxl
YXNlIHNob3cgYSBjb2RlIHNuaXBwZXQgdGhhdCBpbXBsZW1lbnRzIHlvdXIgc3VnZ2VzdGlvbj8K
CkEgcm91Z2ggaWRlYSBpcyB0aGlzOgoKIHN0YXRpYyBpbnQgbm90aWZpZXJfY2FsbF9jaGFpbihz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKipubCwKIAkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbCwg
dm9pZCAqdiwKIAkJCSAgICAgICBpbnQgbnJfdG9fY2FsbCwgaW50ICpucl9jYWxscykKIHsKLQlp
bnQgcmV0ID0gTk9USUZZX0RPTkU7CisJaW50IHJldCwgcmVzdWx0ID0gTk9USUZZX0RPTkU7CiAJ
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgKm5leHRfbmI7CiAKIAluYiA9IHJjdV9kZXJlZmVy
ZW5jZV9yYXcoKm5sKTsKIAogCXdoaWxlIChuYiAmJiBucl90b19jYWxsKSB7Ci4uLgogCQlyZXQg
PSBuYi0+bm90aWZpZXJfY2FsbChuYiwgdmFsLCB2KTsKKworCQkvKiBBc3N1bWluZyBOT1RJRllf
U1RPUC1jYXJyeWluZyByZXR1cm4gaXMgYWx3YXlzIGdyZWF0ZXIgdGhhbiBub24tc3RvcHBpbmcg
b25lLiAqLworCQlpZiAocmVzdWx0IDwgcmV0KQorCQkJcmVzdWx0ID0gcmV0OwouLi4gCiAJfQot
CXJldHVybiByZXQ7CisJcmV0dXJuIHJlc3VsdDsKIH0KClRoZW46Cgpib29sIHByZXBhcmVfcmVi
b290KCkKewoJaW50IHJldCA9IHh4X25vdGlmaWVyX2NhbGxfY2hhaW4oJnNodXRkb3duX25vdGlm
aWVyLCBQUkVQQVJFX1JFQk9PVCwgLi4uKTsKCXJldHVybiByZXQgPT0gTk9USUZZX09LOwp9CgpB
bmQgdGhlIHJldHVybiB2YWx1ZSB3b3VsZCBzaWduaWZ5IHdoZXRoZXIgdGhlIHJlYm9vdCB3aWxs
IGJlIGF0dGVtcHRlZAp3aGVuIGNhbGxpbmcgdGhlIGNoYWluIGZvciB0aGUgUkVCT09UIGFjdGlv
bi4gKEFuYWxvZ291c2x5IGZvciBwb3dlcmluZyBvZmYuKQoKQmVzdCBSZWdhcmRzCk1pY2hhxYLC
oE1pcm9zxYJhdwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
