Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF8DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCKQpNwZQeK2SfFiB3dnZMch3yJ8dgaoMxW6tXjJvu8=; b=TZ54NhacDHZgA8
	DzwXd785eBa7I9BXW/ZWg1YIQneMBEQlh9++OuwKklPpOqzJ96/5nxahaN7TSOc9R3OTc72v1viot
	iHverZj7EB4CTljmAD+MeZfv5jVkmGB5G1Remw3aCVMvnUEIKmlalgZHnahdt1UWa58L8cem5QRmn
	o2Ei9wfLxo6RiuFTH62sRConnyWz2FNfHiihxTumogFnNLoaijZ/Gi1f0NDPKlxEilw1VcJqBaJn+
	vn8BZgSoeA+rasSDfAEwFM31UlKUqWfyzc9dJgrqyBcOhwXYKG9hzDeN1No7LHsmoq234CB8XXFQC
	jb/q5+BSRJK3R79YR9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlXg-003X9Y-0G; Fri, 10 Dec 2021 19:26:52 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlFy-003PQ7-Ja; Fri, 10 Dec 2021 19:08:36 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso10567817ots.6; 
 Fri, 10 Dec 2021 11:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eV+MT/c+cWty36yyN1k88RcKH0yc2be+fuKXycnWnqs=;
 b=2gc1ZAfoY2fsIUxzvtZPHXRAvhhlq32uyZ86Z47Tb0yW20IflhrJ9M7hONtE7B5uyJ
 NRiSCQ2vBGRA93W0BCHb3FmaLiJ/Beam8OaQRr9CJKCdGuCDzDCFYSgdEOp+yduQtf4t
 etFP0cP4t/rVA0fAhl+D4VACE+hPEr3PGzvuiJgqLo2iV4VYLLccbZ8zrA9T8O6lSuz4
 ndYHtDWQIImx24zrGn32XbyKKAbWcpguq7ckpePlaoX4ak3/ciNXktS+/F0idFAOrHpA
 0MxHIh6k+mOIu8nty1YLHd21csEr1ShhG0jD+hyx+E2/Ev1SZEB8gSLtY3yOzA3I0nWR
 etvA==
X-Gm-Message-State: AOAM53175bDmWH9/Av1C0BZTdb/VqHkzYOXb8IZY7CfinQiiUNY8w6fC
 3Lbrp+0RzcMzQV8Rhra5kebHXg5QbSgiWS7/Pxc=
X-Google-Smtp-Source: ABdhPJz3WnXJDp9MR1neaOhkZU7y1rSVa1ldfWi3aUs9lzZU+HiO7VfKdE35iqJJyDqw6NIr5Fwr8foXDpr2Xp5/alg=
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12553404otj.16.1639163312676; 
 Fri, 10 Dec 2021 11:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-7-digetx@gmail.com>
 <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
 <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
In-Reply-To: <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:08:21 +0100
Message-ID: <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
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
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_110834_693603_03597208 
X-CRM114-Status: GOOD (  24.39  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgNzo1NCBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTAuMTIuMjAyMSAyMTozMiwgUmFmYWVsIEouIFd5c29ja2kg
0L/QuNGI0LXRgjoKPiA+IE9uIEZyaSwgTm92IDI2LCAyMDIxIGF0IDc6MDIgUE0gRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEVtaXQgd2FybmluZyBp
ZiB1bnJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigpIGZhaWxzIHNpbmNlIGl0IG5ldmVyIHNob3Vs
ZAo+ID4+IGZhaWwuIFRoaXMgd2lsbCBlYXNlIGZ1cnRoZXIgQVBJIGRldmVsb3BtZW50IGJ5IGNh
dGNoaW5nIG1pc3Rha2VzIGVhcmx5Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICBrZXJuZWwvcmVib290LmMg
fCAyICstCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yZWJvb3QuYyBiL2tlcm5lbC9yZWJvb3Qu
Ywo+ID4+IGluZGV4IGU2NjU5YWUzMjlmMS4uZjBlN2I5YzEzZjZiIDEwMDY0NAo+ID4+IC0tLSBh
L2tlcm5lbC9yZWJvb3QuYwo+ID4+ICsrKyBiL2tlcm5lbC9yZWJvb3QuYwo+ID4+IEBAIC0yMTAs
NyArMjEwLDcgQEAgRVhQT1JUX1NZTUJPTChyZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIpOwo+ID4+
ICAgKi8KPiA+PiAgaW50IHVucmVnaXN0ZXJfcmVzdGFydF9oYW5kbGVyKHN0cnVjdCBub3RpZmll
cl9ibG9jayAqbmIpCj4gPj4gIHsKPiA+PiAtICAgICAgIHJldHVybiBhdG9taWNfbm90aWZpZXJf
Y2hhaW5fdW5yZWdpc3RlcigmcmVzdGFydF9oYW5kbGVyX2xpc3QsIG5iKTsKPiA+PiArICAgICAg
IHJldHVybiBXQVJOX09OKGF0b21pY19ub3RpZmllcl9jaGFpbl91bnJlZ2lzdGVyKCZyZXN0YXJ0
X2hhbmRsZXJfbGlzdCwgbmIpKTsKPiA+Cj4gPiBUaGUgb25seSByZWFzb24gd2h5IGl0IGNhbiBm
YWlsIGlzIGlmIHRoZSBvYmplY3QgcG9pbnRlZCB0byBieSBuYiBpcwo+ID4gbm90IGluIHRoZSBj
aGFpbi4KPgo+IEkgaGFkIGV4YWN0bHkgdGhpcyBjYXNlIHdoZXJlIG9iamVjdCB3YXNuJ3QgaW4g
dGhlIGNoYWluIGR1ZSB0byBhIGJ1Zwo+IGFuZCB0aGlzIHdhcm5pbmcgd2FzIHZlcnkgaGVscGZ1
bC4KCkR1cmluZyB0aGUgZGV2ZWxvcG1lbnQuICBJbiBwcm9kdWN0aW9uIGl0IHdvdWxkIGJlIHJh
dGhlciBhbm5veWluZy4KCj4gPiAgV2h5IFdBUk4oKSBhYm91dCB0aGlzPyAgQW5kIHdoYXQgYWJv
dXQgc3lzdGVtcyB3aXRoCj4gPiBwYW5pY19vbl93YXJuIHNldD8KPgo+IFRoYXQgd2FybmluZyBj
b25kaXRpb24gd2lsbCBuZXZlciBoYXBwZW4gbm9ybWFsbHksIG9ubHkgd2hlbiBzb21ldGhpbmcK
PiBpcyBzZXJpb3VzbHkgd3JvbmcuCj4KPiBUaG9zZSBzeXN0ZW1zIHdpdGggcGFuaWNfb25fd2Fy
biB3aWxsIGdldCB3aGF0IHdhcyB0aGV5IGFza2VkIGZvci4KClRoZXkgbWF5IG5vdCBiZSBhc2tp
bmcgZm9yIHBhbmlja2luZyBvbiBidWdzIGluIHRoZSByZWJvb3Qgbm90aWZpZXIKY29kZSwgdGhv
dWdoLiAgVGhhdCdzIHdoYXQgeW91ciBjaGFuZ2UgaXMgbWFraW5nIHRoZW0gcGFuaWMgb24uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
