Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AC2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPNnMgx2k1+ek/CX9AstJn0Jch1Qn9wZv73OfoQEAFw=; b=N/pTJXAT9say0S
	JaK1MmrNxsuuVFWx5IQMNwbuASSn82PH4ZJCpgS6wadcbDEmr4mUKn8sfeE4tHIrerp/fFemljQhy
	FuyKVBU/IWJPyAqJimKz4ECfydtRqh8FENZtCH04y4iVIF/mY4ZMXHX/+tudQSjVjjnf1iOEzaYTy
	I3vLNsr7oW5jBXLN7URAkz8xVQn43Yi3DQ4KgB1Euob0K8fPyh5Ok2lYznHvFbY8+W54laWXaaUV2
	/uyjOF+m0LLyXlSZCKZq9jQMnZG8FF1JrJLKpaBbVy/jzRxOjh1wFafLOTLc760flfWKt/W4NlLWF
	nlXjzapsICaIEzfO8Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrUVZ-00GwGA-In; Mon, 29 Nov 2021 00:27:01 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrUVV-00GwEP-Ui; Mon, 29 Nov 2021 00:27:00 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2R463HYCz9Y;
 Mon, 29 Nov 2021 01:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638145614; bh=rYhG1/gOEGdeEm/s8Gt8rEBk1iF8QMIsgq7S9tytKm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbL6Dkr0hp6+eWfnOkswWvW2NOKJ79Uh6/l2ZCnK5kWTiOO50iqx187Rg4dryYZZY
 bxYRz4m9fgWtZVh11lmgMaMMzocpKUJUWIlke/44DEMmzJJm4vDOSxFAyf1Gq25nhd
 1THlT17c8aj7yKXukSvNxOS2rqgVH1j/XRMa1p7Hswrcs4jJdmmxtpOwmRnm9PweUg
 dgln8/6i94ET+XVFAx+2l6pzk4WNbL+PWxg255szxizJhOsvQ3eK1ntEQbcIyPN3HU
 KJwCs9dJC+yqQftWDNSkBS/r4FvpiW2ousq8It65okWyLREqQTSJR+N2Sf4mDmjtBp
 iZvEDATRHwtcA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:26:42 +0100
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
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
Message-ID: <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_162658_648081_AFFC503B 
X-CRM114-Status: GOOD (  33.68  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTI6MDY6MTlBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI4LjExLjIwMjEgMDM6MjgsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6
Cj4gPiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0MVBNICswMzAwLCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4gPj4gQWRkIHNhbml0eSBjaGVjayB3aGljaCBlbnN1cmVzIHRoYXQgdGhl
cmUgYXJlIG5vIHR3byByZXN0YXJ0IGhhbmRsZXJzCj4gPj4gcmVnaXN0ZXJlZCB3aXRoIHRoZSBz
YW1lIHByaW9yaXR5LiBOb3JtYWxseSBpdCdzIGEgZGlyZWN0IHNpZ24gb2YgYQo+ID4+IHByb2Js
ZW0gaWYgdHdvIGhhbmRsZXJzIHVzZSB0aGUgc2FtZSBwcmlvcml0eS4KPiA+IAo+ID4gVGhlIHBh
dGNoIGRvZXNuJ3QgZW5zdXJlIHRoZSBwcm9wZXJ0eSB0aGF0IHRoZXJlIGFyZSBubyBkdXBsaWNh
dGVkLXByaW9yaXR5Cj4gPiBlbnRyaWVzIG9uIHRoZSBjaGFpbi4KPiAKPiBJdCdzIG5vdCB0aGUg
ZXhhY3QgcG9pbnQgb2YgdGhpcyBwYXRjaC4KPiAKPiA+IEknZCByYXRoZXIgc2VlIGEgYXRvbWlj
X25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyX3VuaXF1ZSgpIHRoYXQgcmV0dXJucwo+ID4gLUVCVVNZ
IG9yIHNvbWV0aGluZyBpc3RlYWQgb2YgYWRkaW5nIGFuIGVudHJ5IHdpdGggZHVwbGljYXRlIHBy
aW9yaXR5Lgo+ID4gVGhhdCB3YXkgaXQgd291bGQgbmVlZCBvbmx5IG9uZSBsaXN0IHRyYXZlcnNh
bCB1bmxlc3MgeW91IHdhbnQgdG8KPiA+IHJlZ2lzdGVyIHRoZSBkdXBsaWNhdGUgYW55d2F5ICh0
aGVuIHlvdSB3b3VsZCBjYWxsIHRoZSBvbGRlcgo+ID4gYXRvbWljX25vdGlmaWVyX2NoYWluX3Jl
Z2lzdGVyKCkgYWZ0ZXIgcmVwb3J0aW5nIHRoZSBlcnJvcikuCj4gCj4gVGhlIHBvaW50IG9mIHRo
aXMgcGF0Y2ggaXMgdG8gd2FybiBkZXZlbG9wZXJzIGFib3V0IHRoZSBwcm9ibGVtIHRoYXQKPiBu
ZWVkcyB0byBiZSBmaXhlZC4gV2UgYWxyZWFkeSBoYXZlIHN1Y2ggdHJvdWJsaW5nIGRyaXZlcnMg
aW4gbWFpbmxpbmUuCj4gCj4gSXQncyBub3QgY3JpdGljYWwgdG8gcmVnaXN0ZXIgZGlmZmVyZW50
IGhhbmRsZXJzIHdpdGggYSBkdXBsaWNhdGVkCj4gcHJpb3JpdGllcywgYnV0IHN1Y2ggY2FzZXMg
cmVhbGx5IG5lZWQgdG8gYmUgY29ycmVjdGVkLiBXZSBzaG91bGRuJ3QKPiBicmVhayB1c2Vycycg
bWFjaGluZXMgZHVyaW5nIHRyYW5zaXRpb24gdG8gdGhlIG5ldyBBUEksIG1lYW53aGlsZQo+IGRl
dmVsb3BlcnMgc2hvdWxkIHRha2UgYWN0aW9uIG9mIGZpeGluZyB0aGVpcnMgZHJpdmVycy4KPiAK
PiA+IChPciB5b3UgY291bGQgcmV0dXJuID4gMCB3aGVuIGEgZHVwbGljYXRlIGlzIHJlZ2lzdGVy
ZWQgaW4KPiA+IGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3RlcigpIGlmIHRoZSBjYWxsZXJz
IGFyZSBwcmVwYXJlZAo+ID4gZm9yIHRoYXQuIEkgZG9uJ3QgcmVhbGx5IGxpa2UgdGhpcyB3YXks
IHRob3VnaC4pCj4gCj4gSSBoYWQgYSBzaW1pbGFyIHRob3VnaHQgYXQgc29tZSBwb2ludCBiZWZv
cmUgYW5kIGRlY2lkZWQgdGhhdCBJJ20gbm90IGluCj4gZmF2b3Igb2YgdGhpcyBhcHByb2FjaC4g
SXQncyBuaWNlciB0byBoYXZlIGEgZGVkaWNhdGVkIGZ1bmN0aW9uIHRoYXQKPiB2ZXJpZmllcyB0
aGUgdW5pcXVlbmVzcywgSU1PLgoKSSBkb24ndCBsaWtlIHRoZSBwYXJ0IHRoYXQgaXQgdHJhdmVy
c2VzIHRoZSBsaXN0IHNlY29uZCB0aW1lIHRvIGNoZWNrCnRoZSB1bmlxdWVuZXNzLiBCdXQgYWN0
dWFsbHkgeW91IGNvdWxkIGF2b2lkIHRoYXQgaWYKbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSB3
b3VsZCBhbHdheXMgYWRkIGVxdWFsLXByaW9yaXR5IGVudHJpZXMgaW4KcmV2ZXJzZSBvcmRlcjoK
CiBzdGF0aWMgaW50IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqKm5sLAogCQlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm4pCiB7CiAJd2hpbGUgKCgqbmwpICE9
IE5VTEwpIHsKIAkJaWYgKHVubGlrZWx5KCgqbmwpID09IG4pKSB7CiAJCQlXQVJOKDEsICJkb3Vi
bGUgcmVnaXN0ZXIgZGV0ZWN0ZWQiKTsKIAkJCXJldHVybiAwOwogCQl9Ci0JCWlmIChuLT5wcmlv
cml0eSA+ICgqbmwpLT5wcmlvcml0eSkKKwkJaWYgKG4tPnByaW9yaXR5ID49ICgqbmwpLT5wcmlv
cml0eSkKIAkJCWJyZWFrOwogCQlubCA9ICYoKCpubCktPm5leHQpOwogCX0KIAluLT5uZXh0ID0g
Km5sOwogCXJjdV9hc3NpZ25fcG9pbnRlcigqbmwsIG4pOwogCXJldHVybiAwOwogfQoKVGhlbiB0
aGUgY2hlY2sgZm9yIHVuaXF1ZW5lc3MgYWZ0ZXIgYWRkaW5nIHdvdWxkIGJlOgoKIFdBUk4obmIt
Pm5leHQgJiYgbmItPnByaW9yaXR5ID09IG5iLT5uZXh0LT5wcmlvcml0eSk7CgpCZXN0IFJlZ2Fy
ZHMKTWljaGHFgsKgTWlyb3PFgmF3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
