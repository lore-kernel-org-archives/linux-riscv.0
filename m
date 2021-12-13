Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A231AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNfkl009A4EAKLZU/bG7CDXvAqIYQcfJivPITT1ap9I=; b=EATIaJe74MuC8v
	w4w1eAzOp4XbIO5pHa9ENpxgl1bmwV3m2QWAhSNJUhuEaUpDWJOkjeROwcOdoPPK2Q0OP9+CTMwS8
	aqPIN4pKo4yaDfHI6nmnboLSqFgsa8H4cXZaY2P/MkvzTc24ktRvlAqn3aAW8ETM+xntVgJZxzFcl
	2AynxDVLSuhS2jrb8ejZFNzMYA9IA/x96RQe37bP2ega/SQDJuYNxF5YJfoqVXNeHbk58Q758EYPq
	bjXM03C691EtLJ9SxyH1Wu7RYmtA2SJPI7Jrrin138XQ8DIWKCu4fBTx3P3YIqZhEQmD5IwkBH++v
	O719jIX7VH2XeVhUYgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwhYe-008bqt-AU; Mon, 13 Dec 2021 09:23:44 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhYX-008boJ-G1; Mon, 13 Dec 2021 09:23:39 +0000
Received: by mail-pj1-f50.google.com with SMTP id iq11so11425196pjb.3;
 Mon, 13 Dec 2021 01:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7JQ6xhDuC8UGs/jm3YR6x8QoCCs8KyehtdxluDCRZKo=;
 b=EJmA36QGAZH/MgkdeciMQNqVBan7MPSrTXu7SzEPywHDlo0tE+b//6iy7ycnc3sjCK
 Ew+TKUhhtNidbRr4Y71nip5utB8eTIKk1l9io0S5dv18zHQEoP5UGnvXED6oJwK/KAcs
 OqG0DFKVHcIyjvoIYDNzgg055aRgQhv3s3Q3K6YBplUI5THrkv+b/Zvm1ZqdWeSsALAm
 2QM5kBH8hIE2NEO60i79oo4Do2KF+5DnGQ0npjQ/6H5HRa5ljdNljs70RELooeUNARVd
 VDBxDVdg8RZJDFlUpqLD7DNr5ExELuhinjT+w8YeV9/xRuzEKBHpGBBS6ks6FZDXL339
 N0Qg==
X-Gm-Message-State: AOAM533lYpo6tOGUGFRBBPVlVm4XrEP+Op6EvWFnTd98ka2zM55HQCa3
 yXtrADajPQIuGo/43j5LPdTlP2xwPehQZw==
X-Google-Smtp-Source: ABdhPJxm/FVo0Z+o9lGujGt3zv2C/QlsTnD0a5R9DDu5U9+rUxLMvS+PpzahYCpd4gKMp7rPX4Fp4A==
X-Received: by 2002:a17:902:c086:b0:142:7169:1573 with SMTP id
 j6-20020a170902c08600b0014271691573mr94049000pld.13.1639387415992; 
 Mon, 13 Dec 2021 01:23:35 -0800 (PST)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180])
 by smtp.gmail.com with ESMTPSA id k18sm13137116pfc.155.2021.12.13.01.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:23:35 -0800 (PST)
Received: by mail-pl1-f180.google.com with SMTP id u11so10736700plf.3;
 Mon, 13 Dec 2021 01:23:34 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr26074577vsj.77.1639387403608; 
 Mon, 13 Dec 2021 01:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
In-Reply-To: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Dec 2021 10:23:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
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
X-CRM114-CacheID: sfid-20211213_012337_598842_06A040C4 
X-CRM114-Status: GOOD (  56.61  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgODoxNCBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDEwLCAyMDIxIGF0IDg6MDQgUE0gRG1p
dHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPiA+IDEwLjEyLjIwMjEgMjE6
MjcsIFJhZmFlbCBKLiBXeXNvY2tpINC/0LjRiNC10YI6Cj4gPiA+IE9uIE1vbiwgTm92IDI5LCAy
MDIxIGF0IDEyOjM0IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+PiAyOS4xMS4yMDIxIDAzOjI2LCBNaWNoYcWCIE1pcm9zxYJhdyDQv9C40YjQtdGCOgo+
ID4gPj4+IE9uIE1vbiwgTm92IDI5LCAyMDIxIGF0IDEyOjA2OjE5QU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+ID4+Pj4gMjguMTEuMjAyMSAwMzoyOCwgTWljaGHFgiBNaXJvc8WC
YXcg0L/QuNGI0LXRgjoKPiA+ID4+Pj4+IE9uIEZyaSwgTm92IDI2LCAyMDIxIGF0IDA5OjAwOjQx
UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+ID4+Pj4+PiBBZGQgc2FuaXR5IGNo
ZWNrIHdoaWNoIGVuc3VyZXMgdGhhdCB0aGVyZSBhcmUgbm8gdHdvIHJlc3RhcnQgaGFuZGxlcnMK
PiA+ID4+Pj4+PiByZWdpc3RlcmVkIHdpdGggdGhlIHNhbWUgcHJpb3JpdHkuIE5vcm1hbGx5IGl0
J3MgYSBkaXJlY3Qgc2lnbiBvZiBhCj4gPiA+Pj4+Pj4gcHJvYmxlbSBpZiB0d28gaGFuZGxlcnMg
dXNlIHRoZSBzYW1lIHByaW9yaXR5Lgo+ID4gPj4+Pj4KPiA+ID4+Pj4+IFRoZSBwYXRjaCBkb2Vz
bid0IGVuc3VyZSB0aGUgcHJvcGVydHkgdGhhdCB0aGVyZSBhcmUgbm8gZHVwbGljYXRlZC1wcmlv
cml0eQo+ID4gPj4+Pj4gZW50cmllcyBvbiB0aGUgY2hhaW4uCj4gPiA+Pj4+Cj4gPiA+Pj4+IEl0
J3Mgbm90IHRoZSBleGFjdCBwb2ludCBvZiB0aGlzIHBhdGNoLgo+ID4gPj4+Pgo+ID4gPj4+Pj4g
SSdkIHJhdGhlciBzZWUgYSBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXJfdW5pcXVlKCkg
dGhhdCByZXR1cm5zCj4gPiA+Pj4+PiAtRUJVU1kgb3Igc29tZXRoaW5nIGlzdGVhZCBvZiBhZGRp
bmcgYW4gZW50cnkgd2l0aCBkdXBsaWNhdGUgcHJpb3JpdHkuCj4gPiA+Pj4+PiBUaGF0IHdheSBp
dCB3b3VsZCBuZWVkIG9ubHkgb25lIGxpc3QgdHJhdmVyc2FsIHVubGVzcyB5b3Ugd2FudCB0bwo+
ID4gPj4+Pj4gcmVnaXN0ZXIgdGhlIGR1cGxpY2F0ZSBhbnl3YXkgKHRoZW4geW91IHdvdWxkIGNh
bGwgdGhlIG9sZGVyCj4gPiA+Pj4+PiBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSBh
ZnRlciByZXBvcnRpbmcgdGhlIGVycm9yKS4KPiA+ID4+Pj4KPiA+ID4+Pj4gVGhlIHBvaW50IG9m
IHRoaXMgcGF0Y2ggaXMgdG8gd2FybiBkZXZlbG9wZXJzIGFib3V0IHRoZSBwcm9ibGVtIHRoYXQK
PiA+ID4+Pj4gbmVlZHMgdG8gYmUgZml4ZWQuIFdlIGFscmVhZHkgaGF2ZSBzdWNoIHRyb3VibGlu
ZyBkcml2ZXJzIGluIG1haW5saW5lLgo+ID4gPj4+Pgo+ID4gPj4+PiBJdCdzIG5vdCBjcml0aWNh
bCB0byByZWdpc3RlciBkaWZmZXJlbnQgaGFuZGxlcnMgd2l0aCBhIGR1cGxpY2F0ZWQKPiA+ID4+
Pj4gcHJpb3JpdGllcywgYnV0IHN1Y2ggY2FzZXMgcmVhbGx5IG5lZWQgdG8gYmUgY29ycmVjdGVk
LiBXZSBzaG91bGRuJ3QKPiA+ID4+Pj4gYnJlYWsgdXNlcnMnIG1hY2hpbmVzIGR1cmluZyB0cmFu
c2l0aW9uIHRvIHRoZSBuZXcgQVBJLCBtZWFud2hpbGUKPiA+ID4+Pj4gZGV2ZWxvcGVycyBzaG91
bGQgdGFrZSBhY3Rpb24gb2YgZml4aW5nIHRoZWlycyBkcml2ZXJzLgo+ID4gPj4+Pgo+ID4gPj4+
Pj4gKE9yIHlvdSBjb3VsZCByZXR1cm4gPiAwIHdoZW4gYSBkdXBsaWNhdGUgaXMgcmVnaXN0ZXJl
ZCBpbgo+ID4gPj4+Pj4gYXRvbWljX25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCkgaWYgdGhlIGNh
bGxlcnMgYXJlIHByZXBhcmVkCj4gPiA+Pj4+PiBmb3IgdGhhdC4gSSBkb24ndCByZWFsbHkgbGlr
ZSB0aGlzIHdheSwgdGhvdWdoLikKPiA+ID4+Pj4KPiA+ID4+Pj4gSSBoYWQgYSBzaW1pbGFyIHRo
b3VnaHQgYXQgc29tZSBwb2ludCBiZWZvcmUgYW5kIGRlY2lkZWQgdGhhdCBJJ20gbm90IGluCj4g
PiA+Pj4+IGZhdm9yIG9mIHRoaXMgYXBwcm9hY2guIEl0J3MgbmljZXIgdG8gaGF2ZSBhIGRlZGlj
YXRlZCBmdW5jdGlvbiB0aGF0Cj4gPiA+Pj4+IHZlcmlmaWVzIHRoZSB1bmlxdWVuZXNzLCBJTU8u
Cj4gPiA+Pj4KPiA+ID4+PiBJIGRvbid0IGxpa2UgdGhlIHBhcnQgdGhhdCBpdCB0cmF2ZXJzZXMg
dGhlIGxpc3Qgc2Vjb25kIHRpbWUgdG8gY2hlY2sKPiA+ID4+PiB0aGUgdW5pcXVlbmVzcy4gQnV0
IGFjdHVhbGx5IHlvdSBjb3VsZCBhdm9pZCB0aGF0IGlmCj4gPiA+Pj4gbm90aWZpZXJfY2hhaW5f
cmVnaXN0ZXIoKSB3b3VsZCBhbHdheXMgYWRkIGVxdWFsLXByaW9yaXR5IGVudHJpZXMgaW4KPiA+
ID4+PiByZXZlcnNlIG9yZGVyOgo+ID4gPj4+Cj4gPiA+Pj4gIHN0YXRpYyBpbnQgbm90aWZpZXJf
Y2hhaW5fcmVnaXN0ZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICoqbmwsCj4gPiA+Pj4gICAgICAg
ICAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm4pCj4gPiA+Pj4gIHsKPiA+ID4+PiAgICAg
ICB3aGlsZSAoKCpubCkgIT0gTlVMTCkgewo+ID4gPj4+ICAgICAgICAgICAgICAgaWYgKHVubGlr
ZWx5KCgqbmwpID09IG4pKSB7Cj4gPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgIFdBUk4oMSwg
ImRvdWJsZSByZWdpc3RlciBkZXRlY3RlZCIpOwo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiA+ID4+PiAgICAgICAgICAgICAgIH0KPiA+ID4+PiAtICAgICAgICAgICAg
IGlmIChuLT5wcmlvcml0eSA+ICgqbmwpLT5wcmlvcml0eSkKPiA+ID4+PiArICAgICAgICAgICAg
IGlmIChuLT5wcmlvcml0eSA+PSAoKm5sKS0+cHJpb3JpdHkpCj4gPiA+Pj4gICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gPj4+ICAgICAgICAgICAgICAgbmwgPSAmKCgqbmwpLT5uZXh0
KTsKPiA+ID4+PiAgICAgICB9Cj4gPiA+Pj4gICAgICAgbi0+bmV4dCA9ICpubDsKPiA+ID4+PiAg
ICAgICByY3VfYXNzaWduX3BvaW50ZXIoKm5sLCBuKTsKPiA+ID4+PiAgICAgICByZXR1cm4gMDsK
PiA+ID4+PiAgfQo+ID4gPj4+Cj4gPiA+Pj4gVGhlbiB0aGUgY2hlY2sgZm9yIHVuaXF1ZW5lc3Mg
YWZ0ZXIgYWRkaW5nIHdvdWxkIGJlOgo+ID4gPj4+Cj4gPiA+Pj4gIFdBUk4obmItPm5leHQgJiYg
bmItPnByaW9yaXR5ID09IG5iLT5uZXh0LT5wcmlvcml0eSk7Cj4gPiA+Pgo+ID4gPj4gV2UgY2Fu
J3QganVzdCBjaGFuZ2UgdGhlIHJlZ2lzdHJhdGlvbiBvcmRlciBiZWNhdXNlIGludm9jYXRpb24g
b3JkZXIgb2YKPiA+ID4+IHRoZSBjYWxsIGNoYWluIGRlcGVuZHMgb24gdGhlIHJlZ2lzdHJhdGlv
biBvcmRlcgo+ID4gPgo+ID4gPiBJdCBkb2Vzbid0IGlmIHVuaXF1ZSBwcmlvcml0aWVzIGFyZSBy
ZXF1aXJlZCBhbmQgaXNuJ3QgdGhhdCB3aGF0IHlvdSB3YW50Pwo+ID4gPgo+ID4gPj4gYW5kIHNv
bWUgb2YgY3VycmVudAo+ID4gPj4gdXNlcnMgbWF5IHJlbHkgb24gdGhhdCBvcmRlci4gSSdtIHBy
ZXR0eSBzdXJlIHRoYXQgY2hhbmdpbmcgdGhlIG9yZGVyCj4gPiA+PiB3aWxsIGhhdmUgdW5mb3J0
dW5hdGUgY29uc2VxdWVuY2VzLgo+ID4gPgo+ID4gPiBXZWxsLCB0aGUgV0FSTigpIGRvZXNuJ3Qg
aGVscCBtdWNoIHRoZW4uCj4gPiA+Cj4gPiA+IEVpdGhlciB5b3UgY2FuIG1ha2UgYWxsIG9mIHRo
ZSB1c2VycyByZWdpc3RlciB3aXRoIHVuaXF1ZSBwcmlvcml0aWVzLAo+ID4gPiBhbmQgdGhlbiB5
b3UgY2FuIG1ha2UgdGhlIHJlZ2lzdHJhdGlvbiByZWplY3Qgbm9uLXVuaXF1ZSBvbmVzLCBvciB5
b3UKPiA+ID4gY2Fubm90IGFzc3VtZSB0aGVtIHRvIGJlIHVuaXF1ZS4KPiA+Cj4gPiBUaGVyZSBp
cyBubyBzdHJvbmcgcmVxdWlyZW1lbnQgZm9yIHByaW9yaXRpZXMgdG8gYmUgdW5pcXVlLCB0aGUg
cmVib290LmMKPiA+IGNvZGUgd2lsbCB3b3JrIHByb3Blcmx5Lgo+Cj4gSW4gd2hpY2ggY2FzZSBh
ZGRpbmcgdGhlIFdBUk4oKSBpcyBub3QgYXBwcm9wcmlhdGUgSU1WLgo+Cj4gQWxzbyBJJ3ZlIGxv
b2tlZCBhdCB0aGUgZXhpc3RpbmcgY29kZSBhbmQgYXQgbGVhc3QgaW4gc29tZSBjYXNlcyB0aGUK
PiBvcmRlciBpbiB3aGljaCB0aGUgbm90aWZpZXJzIHJ1biBkb2Vzbid0IG1hdHRlci4gIEknbSBu
b3Qgc3VyZSB3aGF0Cj4gdGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyBUQkguCj4KPiA+IFRo
ZSBwb3RlbnRpYWwgcHJvYmxlbSBpcyBvbiB0aGUgdXNlcidzIHNpZGUgYW5kIHRoZSB3YXJuaW5n
IGlzIGludGVuZGVkCj4gPiB0byBhaWQgdGhlIHVzZXIuCj4KPiBVbmxlc3Mgc29tZWJvZHkgaGFz
IHRoZSBwYW5pY19vbl93YXJuIG1lbnRpb25lZCBwcmV2aW91c2x5IHNldCBhbmQKPiByZWFsbHkg
dGhlIHVzZXIgbmVlZCBub3QgdW5kZXJzdGFuZCB3aGF0IHRoZSBXQVJOKCkgaXMgYWJvdXQuICBJ
T1csCj4gV0FSTigpIGhlbHBzIGRldmVsb3BlcnMsIG5vdCB1c2Vycy4KCkRvIHBhbmljX29uX3dh
cm4gYW5kIHJlYm9vdF9vbl9wYW5pYyBwbGF5IHdlbGwgd2l0aCBoYXZpbmcgYSBXQVJOKCkKaW4g
dGhlIHJlYm9vdCBub3RpZmllciBoYW5kbGluZz8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
