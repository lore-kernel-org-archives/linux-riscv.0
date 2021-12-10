Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443CFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LBnulBENAo77tICb6xhxsXWHB1rsIwsHF0COZ+gcls=; b=gWsN7z0XYFTBSy
	ZtGPvkYpH45PTnPPtQU1yr4O5PTxF4lPy807VpyY8GLID8xqyy6BkOF7ffqhJlFP3IGx3G7nB+oVo
	6FbCrKNsnNGmpuhKOXw0IHEe5GjwuiUARurVOxtt8h0h4Pn7UdZRWJgAl8WhQjsfV660fh9j6tBK3
	xPk7XT9iHbQV7MAb5vRDh2OJPkEndOj+RAtOWauD3Jfyu6tqG2M/euyhg3RL83MCcqfhybrxfZl83
	qc5wCsGQ0BjdvbDmXLK4V7KwD9HCzsqvHclrd1YPcC8irOqnpfvVLUVu9OI/CFf5OLOmA1r1w25LM
	VnD7nHJnX7VbxIdPvoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkcu-003Cto-1R; Fri, 10 Dec 2021 18:28:12 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkcq-003Csb-9V; Fri, 10 Dec 2021 18:28:09 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so10435586otu.10; 
 Fri, 10 Dec 2021 10:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O1tFpICrUp02/Rz91q5M3zJOsfP+AsepTWSxKHsDYko=;
 b=VuLT4iSbv7CFM0yi4w01XUGRULdlJHwkAwMKyHsGSQujkrIiH3FvZ5yKa8tjvL6IPQ
 BuZVFWQNWSOsVA1/c8LSqVZpScFuHgh8CrpxeUVyF/H/DoFGwIb1oGDvKCJwMX7vvN85
 6QQGwDTK7Hv1TSdNCjSeTRJq+PttYDFRgI2wq2TjTCyhfq4wTwqDIZfx0QAZopI+ZBwl
 OrCK5Ok4LMKl+HdZuuItD9PRhM7IuOE/+A6RzCcpnTQdT+FPovRf0uyacbROw6cHH5KU
 I0RF4lIkQqbtdKShNOdlPUhd7DzYOfYMoEg4mL/QanL1TzO4tCMzeqOfKUFi8pD+gxdS
 BmWw==
X-Gm-Message-State: AOAM531Etak6ig9lzoqrG3AZ70Ny9JuNwdUkUt/pUeAeeL87/wYCO5f3
 RT7WILWjNs6HAVFwA8ebXODwRxBXWZL/jINgU80=
X-Google-Smtp-Source: ABdhPJyYCS/8s4tkJCG4AWTeWKT+d6o4I/cnaoDS1n1/MlonZY2Ew73o7SGhiWkpQrPntkE0d8ozu+9C4WKQVKYTs8M=
X-Received: by 2002:a9d:4c10:: with SMTP id l16mr12535470otf.198.1639160886984; 
 Fri, 10 Dec 2021 10:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
In-Reply-To: <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:27:55 +0100
Message-ID: <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Thierry Reding <thierry.reding@gmail.com>,
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
 Santosh Shilimkar <ssantosh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20211210_102808_360591_6CEA090E 
X-CRM114-Status: GOOD (  39.26  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTI6MzQgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPiB3cm90ZToKPgo+IDI5LjExLjIwMjEgMDM6MjYsIE1pY2hhxYIgTWlyb3PFgmF3
INC/0LjRiNC10YI6Cj4gPiBPbiBNb24sIE5vdiAyOSwgMjAyMSBhdCAxMjowNjoxOUFNICswMzAw
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPj4gMjguMTEuMjAyMSAwMzoyOCwgTWljaGHFgiBN
aXJvc8WCYXcg0L/QuNGI0LXRgjoKPiA+Pj4gT24gRnJpLCBOb3YgMjYsIDIwMjEgYXQgMDk6MDA6
NDFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+ID4+Pj4gQWRkIHNhbml0eSBjaGVj
ayB3aGljaCBlbnN1cmVzIHRoYXQgdGhlcmUgYXJlIG5vIHR3byByZXN0YXJ0IGhhbmRsZXJzCj4g
Pj4+PiByZWdpc3RlcmVkIHdpdGggdGhlIHNhbWUgcHJpb3JpdHkuIE5vcm1hbGx5IGl0J3MgYSBk
aXJlY3Qgc2lnbiBvZiBhCj4gPj4+PiBwcm9ibGVtIGlmIHR3byBoYW5kbGVycyB1c2UgdGhlIHNh
bWUgcHJpb3JpdHkuCj4gPj4+Cj4gPj4+IFRoZSBwYXRjaCBkb2Vzbid0IGVuc3VyZSB0aGUgcHJv
cGVydHkgdGhhdCB0aGVyZSBhcmUgbm8gZHVwbGljYXRlZC1wcmlvcml0eQo+ID4+PiBlbnRyaWVz
IG9uIHRoZSBjaGFpbi4KPiA+Pgo+ID4+IEl0J3Mgbm90IHRoZSBleGFjdCBwb2ludCBvZiB0aGlz
IHBhdGNoLgo+ID4+Cj4gPj4+IEknZCByYXRoZXIgc2VlIGEgYXRvbWljX25vdGlmaWVyX2NoYWlu
X3JlZ2lzdGVyX3VuaXF1ZSgpIHRoYXQgcmV0dXJucwo+ID4+PiAtRUJVU1kgb3Igc29tZXRoaW5n
IGlzdGVhZCBvZiBhZGRpbmcgYW4gZW50cnkgd2l0aCBkdXBsaWNhdGUgcHJpb3JpdHkuCj4gPj4+
IFRoYXQgd2F5IGl0IHdvdWxkIG5lZWQgb25seSBvbmUgbGlzdCB0cmF2ZXJzYWwgdW5sZXNzIHlv
dSB3YW50IHRvCj4gPj4+IHJlZ2lzdGVyIHRoZSBkdXBsaWNhdGUgYW55d2F5ICh0aGVuIHlvdSB3
b3VsZCBjYWxsIHRoZSBvbGRlcgo+ID4+PiBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIo
KSBhZnRlciByZXBvcnRpbmcgdGhlIGVycm9yKS4KPiA+Pgo+ID4+IFRoZSBwb2ludCBvZiB0aGlz
IHBhdGNoIGlzIHRvIHdhcm4gZGV2ZWxvcGVycyBhYm91dCB0aGUgcHJvYmxlbSB0aGF0Cj4gPj4g
bmVlZHMgdG8gYmUgZml4ZWQuIFdlIGFscmVhZHkgaGF2ZSBzdWNoIHRyb3VibGluZyBkcml2ZXJz
IGluIG1haW5saW5lLgo+ID4+Cj4gPj4gSXQncyBub3QgY3JpdGljYWwgdG8gcmVnaXN0ZXIgZGlm
ZmVyZW50IGhhbmRsZXJzIHdpdGggYSBkdXBsaWNhdGVkCj4gPj4gcHJpb3JpdGllcywgYnV0IHN1
Y2ggY2FzZXMgcmVhbGx5IG5lZWQgdG8gYmUgY29ycmVjdGVkLiBXZSBzaG91bGRuJ3QKPiA+PiBi
cmVhayB1c2VycycgbWFjaGluZXMgZHVyaW5nIHRyYW5zaXRpb24gdG8gdGhlIG5ldyBBUEksIG1l
YW53aGlsZQo+ID4+IGRldmVsb3BlcnMgc2hvdWxkIHRha2UgYWN0aW9uIG9mIGZpeGluZyB0aGVp
cnMgZHJpdmVycy4KPiA+Pgo+ID4+PiAoT3IgeW91IGNvdWxkIHJldHVybiA+IDAgd2hlbiBhIGR1
cGxpY2F0ZSBpcyByZWdpc3RlcmVkIGluCj4gPj4+IGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdp
c3RlcigpIGlmIHRoZSBjYWxsZXJzIGFyZSBwcmVwYXJlZAo+ID4+PiBmb3IgdGhhdC4gSSBkb24n
dCByZWFsbHkgbGlrZSB0aGlzIHdheSwgdGhvdWdoLikKPiA+Pgo+ID4+IEkgaGFkIGEgc2ltaWxh
ciB0aG91Z2h0IGF0IHNvbWUgcG9pbnQgYmVmb3JlIGFuZCBkZWNpZGVkIHRoYXQgSSdtIG5vdCBp
bgo+ID4+IGZhdm9yIG9mIHRoaXMgYXBwcm9hY2guIEl0J3MgbmljZXIgdG8gaGF2ZSBhIGRlZGlj
YXRlZCBmdW5jdGlvbiB0aGF0Cj4gPj4gdmVyaWZpZXMgdGhlIHVuaXF1ZW5lc3MsIElNTy4KPiA+
Cj4gPiBJIGRvbid0IGxpa2UgdGhlIHBhcnQgdGhhdCBpdCB0cmF2ZXJzZXMgdGhlIGxpc3Qgc2Vj
b25kIHRpbWUgdG8gY2hlY2sKPiA+IHRoZSB1bmlxdWVuZXNzLiBCdXQgYWN0dWFsbHkgeW91IGNv
dWxkIGF2b2lkIHRoYXQgaWYKPiA+IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCkgd291bGQgYWx3
YXlzIGFkZCBlcXVhbC1wcmlvcml0eSBlbnRyaWVzIGluCj4gPiByZXZlcnNlIG9yZGVyOgo+ID4K
PiA+ICBzdGF0aWMgaW50IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKHN0cnVjdCBub3RpZmllcl9i
bG9jayAqKm5sLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm4pCj4g
PiAgewo+ID4gICAgICAgd2hpbGUgKCgqbmwpICE9IE5VTEwpIHsKPiA+ICAgICAgICAgICAgICAg
aWYgKHVubGlrZWx5KCgqbmwpID09IG4pKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgV0FS
TigxLCAiZG91YmxlIHJlZ2lzdGVyIGRldGVjdGVkIik7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+IC0gICAgICAgICAgICAgaWYgKG4t
PnByaW9yaXR5ID4gKCpubCktPnByaW9yaXR5KQo+ID4gKyAgICAgICAgICAgICBpZiAobi0+cHJp
b3JpdHkgPj0gKCpubCktPnByaW9yaXR5KQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ID4gICAgICAgICAgICAgICBubCA9ICYoKCpubCktPm5leHQpOwo+ID4gICAgICAgfQo+ID4g
ICAgICAgbi0+bmV4dCA9ICpubDsKPiA+ICAgICAgIHJjdV9hc3NpZ25fcG9pbnRlcigqbmwsIG4p
Owo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IFRoZW4gdGhlIGNoZWNrIGZvciB1
bmlxdWVuZXNzIGFmdGVyIGFkZGluZyB3b3VsZCBiZToKPiA+Cj4gPiAgV0FSTihuYi0+bmV4dCAm
JiBuYi0+cHJpb3JpdHkgPT0gbmItPm5leHQtPnByaW9yaXR5KTsKPgo+IFdlIGNhbid0IGp1c3Qg
Y2hhbmdlIHRoZSByZWdpc3RyYXRpb24gb3JkZXIgYmVjYXVzZSBpbnZvY2F0aW9uIG9yZGVyIG9m
Cj4gdGhlIGNhbGwgY2hhaW4gZGVwZW5kcyBvbiB0aGUgcmVnaXN0cmF0aW9uIG9yZGVyCgpJdCBk
b2Vzbid0IGlmIHVuaXF1ZSBwcmlvcml0aWVzIGFyZSByZXF1aXJlZCBhbmQgaXNuJ3QgdGhhdCB3
aGF0IHlvdSB3YW50PwoKPiBhbmQgc29tZSBvZiBjdXJyZW50Cj4gdXNlcnMgbWF5IHJlbHkgb24g
dGhhdCBvcmRlci4gSSdtIHByZXR0eSBzdXJlIHRoYXQgY2hhbmdpbmcgdGhlIG9yZGVyCj4gd2ls
bCBoYXZlIHVuZm9ydHVuYXRlIGNvbnNlcXVlbmNlcy4KCldlbGwsIHRoZSBXQVJOKCkgZG9lc24n
dCBoZWxwIG11Y2ggdGhlbi4KCkVpdGhlciB5b3UgY2FuIG1ha2UgYWxsIG9mIHRoZSB1c2VycyBy
ZWdpc3RlciB3aXRoIHVuaXF1ZSBwcmlvcml0aWVzLAphbmQgdGhlbiB5b3UgY2FuIG1ha2UgdGhl
IHJlZ2lzdHJhdGlvbiByZWplY3Qgbm9uLXVuaXF1ZSBvbmVzLCBvciB5b3UKY2Fubm90IGFzc3Vt
ZSB0aGVtIHRvIGJlIHVuaXF1ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
