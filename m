Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFLTqPNocMcf/w137uGCy6IMNrXf2ofqN+tEcLQvsQI=; b=YAUevFEw1qBvMs
	am99HLUZ11FB1T3hIhkT401s4N14rJ2pjbEweItsXK6jsMx+a6a+vN5OyJPwOdagfYoQCTVLpeHex
	QNPhqYjfqr0galXq8OHKeUW6LFP5IytJUhXEzvaivazPDPcmsm3Oa6bbqYvOqKInNMBVMc0qRqY6S
	qVALIu0jEcZ2tRJURDGWWaCizcyTzfSL6j5MrCnuZEo1YCz3HJ8XhClq7a4u1gk0MVzrSSVgS3Y0K
	Ao9UHxdOXNUTdtfelYF49pMRvbQGqdYK4Pceui3StJFPRYRYanZ6C1dknlfHdF3xkiWWpQdyW0L72
	qlYu4VtyNl/cxeOx3RFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noUNF-003Ykp-B3; Tue, 10 May 2022 18:14:17 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noUNC-003YiT-Ih
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 18:14:15 +0000
Received: by mail-yb1-f170.google.com with SMTP id y76so32223745ybe.1
 for <linux-riscv@lists.infradead.org>; Tue, 10 May 2022 11:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qpqXrLDWUEHd+BUtmgMjhwAa3QcGPruT6uNMBEv9rjU=;
 b=lG7Xrznqcmo6JCRbcWttaNJNHOdgx0RTq0Kb6POsCOfP4JoozzGITVFAoHMkZY8Mp7
 1AIhgFojCM1P1t5ToDolEcCU3/BAV/Vmc98l6EN6G+C6uj6iORfmrLLh92AQwBvkzZNM
 wSNTLolwYbrvmnHELxQQ/51ult2gT8Atry1H+a0bhgDTenC5tWIG+pD4vUx07By7CRbZ
 2RU0TLGDdTSJ+GakwGqjQbYXVLgT4aupTGwLCNPvCzyuSrHv/D63Yi/fazgfAYDhcnhP
 xMnoK84NPwjbcrLuHJcdmcaLGdzpqls83xLcsiWjYapLUtB4O7rzD9lYHN8pH3c73qDE
 xeiQ==
X-Gm-Message-State: AOAM533VpqgwzlsGbB8sfzsV9kr3FJC857bvmFkfek1JiclKzooM6MOm
 ppacdmV5SIHv0UCvEpQpXExC1qDaqpdRr8b8HYM=
X-Google-Smtp-Source: ABdhPJy/3C7Xf5XL6o3yFhMZ917Dv3JWEaRfPbmjw9NKhK3//cChodJMWe9FmxWaGm5UEgRYGP1Nqk2NauJUMOpu3kk=
X-Received: by 2002:a25:e792:0:b0:645:7ddb:b5eb with SMTP id
 e140-20020a25e792000000b006457ddbb5ebmr19781278ybh.482.1652206451725; Tue, 10
 May 2022 11:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-2-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 10 May 2022 20:14:00 +0200
Message-ID: <CAJZ5v0gApRhc9+jZLxgNXC2B2tmz450=8+mFZUjTFF1iU7C-gw@mail.gmail.com>
Subject: Re: [PATCH v8 01/27] notifier: Add
 atomic_notifier_call_chain_is_empty()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
 xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_111414_656327_0044BA80 
X-CRM114-Status: GOOD (  21.31  )
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

T24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgMTozMyBBTSBEbWl0cnkgT3NpcGVua28KPGRtaXRyeS5v
c2lwZW5rb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEFkZCBhdG9taWNfbm90aWZpZXJfY2Fs
bF9jaGFpbl9pc19lbXB0eSgpIHRoYXQgcmV0dXJucyB0cnVlIGlmIGdpdmVuCj4gYXRvbWljIGNh
bGwgY2hhaW4gaXMgZW1wdHkuCgpJdCB3b3VsZCBiZSBnb29kIHRvIG1lbnRpb24gYSB1c2UgY2Fz
ZSBmb3IgaXQuCgo+IFJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEBy
ZXJlLnFtcW0ucGw+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3Np
cGVua29AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9ub3RpZmllci5oIHwg
IDIgKysKPiAga2VybmVsL25vdGlmaWVyLmMgICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmgKPiBpbmRleCA4NzA2
OWI4NDU5YWYuLjk1ZTI0NDAwMzdkZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L25vdGlm
aWVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmgKPiBAQCAtMTczLDYgKzE3Myw4
IEBAIGV4dGVybiBpbnQgYmxvY2tpbmdfbm90aWZpZXJfY2FsbF9jaGFpbl9yb2J1c3Qoc3RydWN0
IGJsb2NraW5nX25vdGlmaWVyX2hlYWQgKm5oCj4gIGV4dGVybiBpbnQgcmF3X25vdGlmaWVyX2Nh
bGxfY2hhaW5fcm9idXN0KHN0cnVjdCByYXdfbm90aWZpZXJfaGVhZCAqbmgsCj4gICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsX3VwLCB1bnNpZ25lZCBsb25nIHZhbF9kb3duLCB2b2lk
ICp2KTsKPgo+ICtleHRlcm4gYm9vbCBhdG9taWNfbm90aWZpZXJfY2FsbF9jaGFpbl9pc19lbXB0
eShzdHJ1Y3QgYXRvbWljX25vdGlmaWVyX2hlYWQgKm5oKTsKPiArCj4gICNkZWZpbmUgTk9USUZZ
X0RPTkUgICAgICAgICAgICAweDAwMDAgICAgICAgICAgLyogRG9uJ3QgY2FyZSAqLwo+ICAjZGVm
aW5lIE5PVElGWV9PSyAgICAgICAgICAgICAgMHgwMDAxICAgICAgICAgIC8qIFN1aXRzIG1lICov
Cj4gICNkZWZpbmUgTk9USUZZX1NUT1BfTUFTSyAgICAgICAweDgwMDAgICAgICAgICAgLyogRG9u
J3QgY2FsbCBmdXJ0aGVyICovCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9ub3RpZmllci5jIGIva2Vy
bmVsL25vdGlmaWVyLmMKPiBpbmRleCBiYTAwNWViZjQ3MzAuLmFhZjViNTY0NTJhNiAxMDA2NDQK
PiAtLS0gYS9rZXJuZWwvbm90aWZpZXIuYwo+ICsrKyBiL2tlcm5lbC9ub3RpZmllci5jCj4gQEAg
LTIwNCw2ICsyMDQsMTkgQEAgaW50IGF0b21pY19ub3RpZmllcl9jYWxsX2NoYWluKHN0cnVjdCBh
dG9taWNfbm90aWZpZXJfaGVhZCAqbmgsCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGF0b21pY19ub3Rp
Zmllcl9jYWxsX2NoYWluKTsKPiAgTk9LUFJPQkVfU1lNQk9MKGF0b21pY19ub3RpZmllcl9jYWxs
X2NoYWluKTsKPgo+ICsvKioKPiArICogICAgIGF0b21pY25vdGlmaWVyX2NhbGxfY2hhaW5faXNf
ZW1wdHkgLSBDaGVjayB3aGV0aGVyIG5vdGlmaWVyIGNoYWluIGlzIGVtcHR5Cj4gKyAqICAgICBA
bmg6IFBvaW50ZXIgdG8gaGVhZCBvZiB0aGUgYmxvY2tpbmcgbm90aWZpZXIgY2hhaW4KPiArICoK
PiArICogICAgIENoZWNrcyB3aGV0aGVyIG5vdGlmaWVyIGNoYWluIGlzIGVtcHR5Lgo+ICsgKgo+
ICsgKiAgICAgUmV0dXJucyB0cnVlIGlzIG5vdGlmaWVyIGNoYWluIGlzIGVtcHR5LCBmYWxzZSBv
dGhlcndpc2UuCj4gKyAqLwo+ICtib29sIGF0b21pY19ub3RpZmllcl9jYWxsX2NoYWluX2lzX2Vt
cHR5KHN0cnVjdCBhdG9taWNfbm90aWZpZXJfaGVhZCAqbmgpCj4gK3sKPiArICAgICAgIHJldHVy
biAhcmN1X2FjY2Vzc19wb2ludGVyKG5oLT5oZWFkKTsKPiArfQo+ICsKPiAgLyoKPiAgICogICAg
IEJsb2NraW5nIG5vdGlmaWVyIGNoYWluIHJvdXRpbmVzLiAgQWxsIGFjY2VzcyB0byB0aGUgY2hh
aW4gaXMKPiAgICogICAgIHN5bmNocm9uaXplZCBieSBhbiByd3NlbS4KPiAtLQo+IDIuMzUuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
