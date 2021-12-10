Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Modx15zgoqyfIRmw2gIRvOWTPyjmS+pyKK5pvK/8UfI=; b=EsiMmFPyOxQ9/H
	IfWtE+e1QvcVVL25F3iOfY4Il4uiX1Vm2VAIAcNXmCgv36o5aTY8WRbHJ0p1lC5gkox476O3dgQZf
	CbwlTzXmtBX5MGKfBUOSxQcuzdoVe8fwX7SYnb9NA403hR66YOcSAj6FVvwjEvOtdOFRqfwMm4AVf
	UyGXmVTOq0pYk3U1Wx16bkBnJwsA1wS7n205alRzkOGIL1yvyRuiARXopvsIZhE8cg6GkVihsXvbh
	Dsh/fvrvYmXDpmfOmzigz46zkvx0dnzhlM87pp4RelIOQNffzeEIiPBRyQKrjeUZfvbUUUfadVblI
	dqZ9eOn2qghfV3D1YzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlW6-003WO4-L9; Fri, 10 Dec 2021 19:25:14 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlDE-003OCy-Us; Fri, 10 Dec 2021 19:05:46 +0000
Received: by mail-oi1-f174.google.com with SMTP id u74so14456160oie.8;
 Fri, 10 Dec 2021 11:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+Gg3IcBrVO+p3DERDiz2wIK2rZh3JBEUqlmxz2Wt9w=;
 b=2H2h1KQ47Dmt939TFfnm8z49SBJXOrYpekdEDTAVlCDOruV52YOpfX/lenYwnJaNBU
 xnhhpzEwHlHfNvQOWItyuyeQ/fJ+G8+1dGcpYdtFpEN9dqcN999foM0EjC080zCN1RX8
 meYgpp+eSeY+RCThAosoDx7ViNRA1KEqtmeSxRMhkdv+PlDrpuUwQoRxRH2pP03ImlPZ
 3iIs/bFyuxgIUEtTkyo+aLsbyl6AYhgkeNW2cDQjAN+9/Oij2NnANUb0VRhuou2ok14N
 hhH6jFI5su9kRA8eCfOQxFYMNtgxwMqlsFRohy9Vyk0DIBp5os7xApx9uXMcg+7IV4Ix
 Y/Sw==
X-Gm-Message-State: AOAM532Ra8PmHQFqVCOLiH1lEMjHMZNGEStuCysNIB0HJLnCdNvxcvj+
 NEp3bGi/1fohLxTMnvyfEegrh4ojlKEPFjb2iKU=
X-Google-Smtp-Source: ABdhPJyFnxvuCdo/SAuZsTrbeFY0ttrM6VIAZMHiyNGyFieUXOlcjM/63kmCFhhj1nwi5THbS12OxkRKZ5ROskKDe+g=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14151206oih.51.1639163143930; 
 Fri, 10 Dec 2021 11:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
In-Reply-To: <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:05:32 +0100
Message-ID: <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
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
X-CRM114-CacheID: sfid-20211210_110545_036854_EBA3D570 
X-CRM114-Status: GOOD (  31.55  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgNzo1MiBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTAuMTIuMjAyMSAyMToxOSwgUmFmYWVsIEouIFd5c29ja2kg
0L/QuNGI0LXRgjoKPiAuLi4KPiA+PiArYm9vbCBhdG9taWNfbm90aWZpZXJfaGFzX3VuaXF1ZV9w
cmlvcml0eShzdHJ1Y3QgYXRvbWljX25vdGlmaWVyX2hlYWQgKm5oLAo+ID4+ICsgICAgICAgICAg
ICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm4pCj4gPj4gK3sKPiA+PiArICAgICAgIHVuc2ln
bmVkIGxvbmcgZmxhZ3M7Cj4gPj4gKyAgICAgICBib29sIHJldDsKPiA+PiArCj4gPj4gKyAgICAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmbmgtPmxvY2ssIGZsYWdzKTsKPiA+PiArICAgICAgIHJldCA9
IG5vdGlmaWVyX2hhc191bmlxdWVfcHJpb3JpdHkoJm5oLT5oZWFkLCBuKTsKPiA+PiArICAgICAg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm5oLT5sb2NrLCBmbGFncyk7Cj4gPgo+ID4gVGhpcyBv
bmx5IHdvcmtzIGlmIHRoZSBjYWxsZXIgY2FuIHByZXZlbnQgbmV3IGVudHJpZXMgZnJvbSBiZWlu
ZyBhZGRlZAo+ID4gdG8gdGhlIGxpc3QgYXQgdGhpcyBwb2ludCBvciBpZiB0aGUgY2FsbGVyIGtu
b3dzIHRoYXQgdGhleSBjYW5ub3QgYmUKPiA+IGFkZGVkIGZvciBzb21lIHJlYXNvbiwgYnV0IHRo
ZSBrZXJuZWxkb2MgZG9lc24ndCBtZW50aW9uIHRoaXMKPiA+IGxpbWl0YXRpb24uCj4KPiBJJ2xs
IHVwZGF0ZSB0aGUgY29tbWVudC4KPgo+IC4uCj4gPj4gK2Jvb2wgYmxvY2tpbmdfbm90aWZpZXJf
aGFzX3VuaXF1ZV9wcmlvcml0eShzdHJ1Y3QgYmxvY2tpbmdfbm90aWZpZXJfaGVhZCAqbmgsCj4g
Pj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKPiA+PiArewo+ID4+
ICsgICAgICAgYm9vbCByZXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAgLyoKPiA+PiArICAgICAgICAq
IFRoaXMgY29kZSBnZXRzIHVzZWQgZHVyaW5nIGJvb3QtdXAsIHdoZW4gdGFzayBzd2l0Y2hpbmcg
aXMKPiA+PiArICAgICAgICAqIG5vdCB5ZXQgd29ya2luZyBhbmQgaW50ZXJydXB0cyBtdXN0IHJl
bWFpbiBkaXNhYmxlZC4gQXQgc3VjaAo+ID4+ICsgICAgICAgICogdGltZXMgd2UgbXVzdCBub3Qg
Y2FsbCBkb3duX3JlYWQoKS4KPiA+PiArICAgICAgICAqLwo+ID4+ICsgICAgICAgaWYgKHN5c3Rl
bV9zdGF0ZSAhPSBTWVNURU1fQk9PVElORykKPiA+Cj4gPiBObywgcGxlYXNlIGRvbid0IGRvIHRo
aXMsIGl0IG1ha2VzIHRoZSB3aG9sZSB0aGluZyBlcnJvci1wcm9uZS4KPgo+IFdoYXQgc2hvdWxk
IEkgZG8gdGhlbj8KCkZpcnN0IG9mIGFsbCwgZG8geW91IGtub3cgb2YgYW55IHVzZXJzIHdobyBt
YXkgd2FudCB0byBjYWxsIHRoaXMKZHVyaW5nIGVhcmx5IGluaXRpYWxpemF0aW9uPyAgSWYgc28s
IHRoZW4gd2h5IG1heSB0aGV5IHdhbnQgdG8gZG8KdGhhdD8KCkRlcGVuZGluZyBvbiB0aGUgYWJv
dmUsIEkgd291bGQgY29uc2lkZXIgYWRkaW5nIGEgc3BlY2lhbCBtZWNoYW5pc20gZm9yIHRoZW0u
Cgo+ID4+ICsgICAgICAgICAgICAgICBkb3duX3JlYWQoJm5oLT5yd3NlbSk7Cj4gPj4gKwo+ID4+
ICsgICAgICAgcmV0ID0gbm90aWZpZXJfaGFzX3VuaXF1ZV9wcmlvcml0eSgmbmgtPmhlYWQsIG4p
Owo+ID4+ICsKPiA+PiArICAgICAgIGlmIChzeXN0ZW1fc3RhdGUgIT0gU1lTVEVNX0JPT1RJTkcp
Cj4gPj4gKyAgICAgICAgICAgICAgIHVwX3JlYWQoJm5oLT5yd3NlbSk7Cj4gPgo+ID4gQW5kIHN0
aWxsIHdoYXQgaWYgYSBuZXcgZW50cnkgd2l0aCBhIG5vbi11bmlxdWUgcHJpb3JpdHkgaXMgYWRk
ZWQgdG8KPiA+IHRoZSBjaGFpbiBhdCB0aGlzIHBvaW50Pwo+Cj4gSWYgZW50cnkgd2l0aCBhIG5v
bi11bmlxdWUgcHJpb3JpdHkgaXMgYWRkZWQgYWZ0ZXIgdGhlIGNoZWNrLCB0aGVuCj4gb2J2aW91
c2x5IGl0IHdvbid0IGJlIGRldGVjdGVkLgoKV2h5IGlzbid0IHRoaXMgYSBwcm9ibGVtPwoKPiBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLiBUaGVzZQo+IGRvd24vdXBfcmVhZCgpIGFy
ZSB0aGUgbG9ja3MgdGhhdCBwcmV2ZW50IHRoZSByYWNlLCBpZiB0aGF0J3MgdGhlIHF1ZXN0aW9u
LgoKTm90IHJlYWxseSwgdGhleSBvbmx5IHByZXZlbnQgdGhlIHJhY2UgZnJvbSBvY2N1cnJpbmcg
d2hpbGUKbm90aWZpZXJfaGFzX3VuaXF1ZV9wcmlvcml0eSgpIGlzIHJ1bm5pbmcuCgpJZiBhbnlv
bmUgZGVwZW5kcyBvbiB0aGlzIGNoZWNrIGZvciBjb3JyZWN0bmVzcywgdGhleSBuZWVkIHRvIGxv
Y2sgdGhlCnJ3c2VtLCBkbyB0aGUgY2hlY2ssIGRvIHRoZSB0aGluZyBkZXBlbmRpbmcgb24gdGhl
IGNoZWNrIHdoaWxlIGhvbGRpbmcKdGhlIHJ3c2VtIGFuZCB0aGVuIHJlbGVhc2UgdGhlIHJ3c2Vt
LiAgT3RoZXJ3aXNlIGl0IGlzIHJhY3kuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
