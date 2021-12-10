Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E441FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4HrGDmiOELwp7K8OfTuxxn3DWd+FgPSVensAtCv9Uek=; b=acQUo/vREQio06FqHc8pnbjxzB
	5gvl3BKebKodZfJ1+Gsm0gA7K33B17nyb2cRPLk/ur6d7oxvZuRcnV//HKzRMr/eBReHPAAH3a4X5
	AqU3hSNUIWu8JtyHBr7lUmrSAYnoYilHiL+sQwyeUxvcTowT7VG44mIt8LvxNnEqrTDJBQXLX8n1C
	bC/NmnXXcCkNIXa96tHw5XkN/wFFAB4fNMYBYL0rY+eOM4AnNO7EoWaZlP/wAImnn7TfPwy/ix4C3
	sitl8x80CHfZaeBzJSie36pqIfkcOwjdI52+ROAU0ECm6DTvow6eoz4UTEY8Ziv0q+Tu0j/msmoWz
	i6KdTjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvln8-003bLs-Ql; Fri, 10 Dec 2021 19:42:50 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvln5-003bLI-K1; Fri, 10 Dec 2021 19:42:49 +0000
Received: by mail-lj1-x230.google.com with SMTP id k23so15276616lje.1;
 Fri, 10 Dec 2021 11:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=enFW8kq8VV/q8dA9a71dgatcJTVb3G9Q0VbIAiUg3GI=;
 b=OX0KzgQUdES/90pWlhpcoFWULe5/02wjF+ZN5bPPd3PaEe6K8Rw2QbmG+hYBDryF8r
 t1f6EkNRPieboSxPtviSTR/1V4y4Mr8zIstzUICcEoY48eKM2+0m88Bup+wVJuu+v7rM
 mwIk5EqSpZDyoTDNu1aQivf7cqdLiwt7kJ7MYsCU49jLtqsBENUcVljNfz8djr77JsJw
 nEuxWBBZFJueyYpPkJsYZuSAKA0Qf9vITcyimaXwItLwdGCf5tFbJFT6C3clmEwXp7kg
 1TFGkI4NdX0eDs8czP/NCn+FzZ3eaPKoluKA8KfWOjMbGdEYGco1sgCURxizjwPPW+3Z
 YGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=enFW8kq8VV/q8dA9a71dgatcJTVb3G9Q0VbIAiUg3GI=;
 b=CX2WWHaKwNS29IFP7GV/NI13AdFnMaocJdhddql17E4yHgfj1SK6Ygwmc8WrgEvL63
 7aLIYGhukB8/xOpnRa1xpE5lWKZrVs8kAagMFwijYvEQ+ZSR/M6fuEA7rZEVj0BlWry2
 6+VX3ZeCs/OM/mpRPVi/JgqNbwj5qFB2oKVArqzeNmjkGRjy+Yug/GY6YRnFu5JtAXN2
 f89KLAMhxhAFI3rKNsDSabNDTnQyuQft4vuu7xUSWZ5+JXB5S2o7g0qe6ZNpUU68QBiE
 OTSZZ0bxJhUHJt95BTcSowT+vBIUqbeQas1tDNhrWyCcLeJdxPNA/Yp92S8Bwvv6/4wj
 WVuA==
X-Gm-Message-State: AOAM531eLaBAgqawP2AY9i0w5Y46CjLO/F9p3CxggkV44nb6sEPDRHov
 VcpuzIC4JLdHDdXf5xb6mfY=
X-Google-Smtp-Source: ABdhPJw7x5EmEcRpJsG2MrtTa2zjfPAYa0CkU29XHMHibYlDXJBMyWndjSh2p83fU9klfOOOmpp/mQ==
X-Received: by 2002:a2e:9003:: with SMTP id h3mr15096538ljg.68.1639165365371; 
 Fri, 10 Dec 2021 11:42:45 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id a24sm397890ljd.25.2021.12.10.11.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:42:45 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Date: Fri, 10 Dec 2021 22:42:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_114247_693670_172351DE 
X-CRM114-Status: GOOD (  39.54  )
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

MTAuMTIuMjAyMSAyMjoxNCwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IERlYyAxMCwgMjAyMSBhdCA4OjA0IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IDEwLjEyLjIwMjEgMjE6MjcsIFJhZmFlbCBKLiBXeXNvY2tpINC/0LjR
iNC10YI6Cj4+PiBPbiBNb24sIE5vdiAyOSwgMjAyMSBhdCAxMjozNCBQTSBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gMjkuMTEuMjAyMSAwMzoyNiwg
TWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPj4+Pj4gT24gTW9uLCBOb3YgMjksIDIwMjEg
YXQgMTI6MDY6MTlBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4gMjguMTEu
MjAyMSAwMzoyOCwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPj4+Pj4+PiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4+Pj4+IEFkZCBzYW5pdHkgY2hlY2sgd2hpY2ggZW5zdXJlcyB0aGF0IHRoZXJlIGFyZSBu
byB0d28gcmVzdGFydCBoYW5kbGVycwo+Pj4+Pj4+PiByZWdpc3RlcmVkIHdpdGggdGhlIHNhbWUg
cHJpb3JpdHkuIE5vcm1hbGx5IGl0J3MgYSBkaXJlY3Qgc2lnbiBvZiBhCj4+Pj4+Pj4+IHByb2Js
ZW0gaWYgdHdvIGhhbmRsZXJzIHVzZSB0aGUgc2FtZSBwcmlvcml0eS4KPj4+Pj4+Pgo+Pj4+Pj4+
IFRoZSBwYXRjaCBkb2Vzbid0IGVuc3VyZSB0aGUgcHJvcGVydHkgdGhhdCB0aGVyZSBhcmUgbm8g
ZHVwbGljYXRlZC1wcmlvcml0eQo+Pj4+Pj4+IGVudHJpZXMgb24gdGhlIGNoYWluLgo+Pj4+Pj4K
Pj4+Pj4+IEl0J3Mgbm90IHRoZSBleGFjdCBwb2ludCBvZiB0aGlzIHBhdGNoLgo+Pj4+Pj4KPj4+
Pj4+PiBJJ2QgcmF0aGVyIHNlZSBhIGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3Rlcl91bmlx
dWUoKSB0aGF0IHJldHVybnMKPj4+Pj4+PiAtRUJVU1kgb3Igc29tZXRoaW5nIGlzdGVhZCBvZiBh
ZGRpbmcgYW4gZW50cnkgd2l0aCBkdXBsaWNhdGUgcHJpb3JpdHkuCj4+Pj4+Pj4gVGhhdCB3YXkg
aXQgd291bGQgbmVlZCBvbmx5IG9uZSBsaXN0IHRyYXZlcnNhbCB1bmxlc3MgeW91IHdhbnQgdG8K
Pj4+Pj4+PiByZWdpc3RlciB0aGUgZHVwbGljYXRlIGFueXdheSAodGhlbiB5b3Ugd291bGQgY2Fs
bCB0aGUgb2xkZXIKPj4+Pj4+PiBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSBhZnRl
ciByZXBvcnRpbmcgdGhlIGVycm9yKS4KPj4+Pj4+Cj4+Pj4+PiBUaGUgcG9pbnQgb2YgdGhpcyBw
YXRjaCBpcyB0byB3YXJuIGRldmVsb3BlcnMgYWJvdXQgdGhlIHByb2JsZW0gdGhhdAo+Pj4+Pj4g
bmVlZHMgdG8gYmUgZml4ZWQuIFdlIGFscmVhZHkgaGF2ZSBzdWNoIHRyb3VibGluZyBkcml2ZXJz
IGluIG1haW5saW5lLgo+Pj4+Pj4KPj4+Pj4+IEl0J3Mgbm90IGNyaXRpY2FsIHRvIHJlZ2lzdGVy
IGRpZmZlcmVudCBoYW5kbGVycyB3aXRoIGEgZHVwbGljYXRlZAo+Pj4+Pj4gcHJpb3JpdGllcywg
YnV0IHN1Y2ggY2FzZXMgcmVhbGx5IG5lZWQgdG8gYmUgY29ycmVjdGVkLiBXZSBzaG91bGRuJ3QK
Pj4+Pj4+IGJyZWFrIHVzZXJzJyBtYWNoaW5lcyBkdXJpbmcgdHJhbnNpdGlvbiB0byB0aGUgbmV3
IEFQSSwgbWVhbndoaWxlCj4+Pj4+PiBkZXZlbG9wZXJzIHNob3VsZCB0YWtlIGFjdGlvbiBvZiBm
aXhpbmcgdGhlaXJzIGRyaXZlcnMuCj4+Pj4+Pgo+Pj4+Pj4+IChPciB5b3UgY291bGQgcmV0dXJu
ID4gMCB3aGVuIGEgZHVwbGljYXRlIGlzIHJlZ2lzdGVyZWQgaW4KPj4+Pj4+PiBhdG9taWNfbm90
aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSBpZiB0aGUgY2FsbGVycyBhcmUgcHJlcGFyZWQKPj4+Pj4+
PiBmb3IgdGhhdC4gSSBkb24ndCByZWFsbHkgbGlrZSB0aGlzIHdheSwgdGhvdWdoLikKPj4+Pj4+
Cj4+Pj4+PiBJIGhhZCBhIHNpbWlsYXIgdGhvdWdodCBhdCBzb21lIHBvaW50IGJlZm9yZSBhbmQg
ZGVjaWRlZCB0aGF0IEknbSBub3QgaW4KPj4+Pj4+IGZhdm9yIG9mIHRoaXMgYXBwcm9hY2guIEl0
J3MgbmljZXIgdG8gaGF2ZSBhIGRlZGljYXRlZCBmdW5jdGlvbiB0aGF0Cj4+Pj4+PiB2ZXJpZmll
cyB0aGUgdW5pcXVlbmVzcywgSU1PLgo+Pj4+Pgo+Pj4+PiBJIGRvbid0IGxpa2UgdGhlIHBhcnQg
dGhhdCBpdCB0cmF2ZXJzZXMgdGhlIGxpc3Qgc2Vjb25kIHRpbWUgdG8gY2hlY2sKPj4+Pj4gdGhl
IHVuaXF1ZW5lc3MuIEJ1dCBhY3R1YWxseSB5b3UgY291bGQgYXZvaWQgdGhhdCBpZgo+Pj4+PiBu
b3RpZmllcl9jaGFpbl9yZWdpc3RlcigpIHdvdWxkIGFsd2F5cyBhZGQgZXF1YWwtcHJpb3JpdHkg
ZW50cmllcyBpbgo+Pj4+PiByZXZlcnNlIG9yZGVyOgo+Pj4+Pgo+Pj4+PiAgc3RhdGljIGludCBu
b3RpZmllcl9jaGFpbl9yZWdpc3RlcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKipubCwKPj4+Pj4g
ICAgICAgICAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm4pCj4+Pj4+ICB7Cj4+Pj4+ICAg
ICAgIHdoaWxlICgoKm5sKSAhPSBOVUxMKSB7Cj4+Pj4+ICAgICAgICAgICAgICAgaWYgKHVubGlr
ZWx5KCgqbmwpID09IG4pKSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBXQVJOKDEsICJk
b3VibGUgcmVnaXN0ZXIgZGV0ZWN0ZWQiKTsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+Pj4+PiAgICAgICAgICAgICAgIH0KPj4+Pj4gLSAgICAgICAgICAgICBpZiAobi0+
cHJpb3JpdHkgPiAoKm5sKS0+cHJpb3JpdHkpCj4+Pj4+ICsgICAgICAgICAgICAgaWYgKG4tPnBy
aW9yaXR5ID49ICgqbmwpLT5wcmlvcml0eSkKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+Pj4+PiAgICAgICAgICAgICAgIG5sID0gJigoKm5sKS0+bmV4dCk7Cj4+Pj4+ICAgICAg
IH0KPj4+Pj4gICAgICAgbi0+bmV4dCA9ICpubDsKPj4+Pj4gICAgICAgcmN1X2Fzc2lnbl9wb2lu
dGVyKCpubCwgbik7Cj4+Pj4+ICAgICAgIHJldHVybiAwOwo+Pj4+PiAgfQo+Pj4+Pgo+Pj4+PiBU
aGVuIHRoZSBjaGVjayBmb3IgdW5pcXVlbmVzcyBhZnRlciBhZGRpbmcgd291bGQgYmU6Cj4+Pj4+
Cj4+Pj4+ICBXQVJOKG5iLT5uZXh0ICYmIG5iLT5wcmlvcml0eSA9PSBuYi0+bmV4dC0+cHJpb3Jp
dHkpOwo+Pj4+Cj4+Pj4gV2UgY2FuJ3QganVzdCBjaGFuZ2UgdGhlIHJlZ2lzdHJhdGlvbiBvcmRl
ciBiZWNhdXNlIGludm9jYXRpb24gb3JkZXIgb2YKPj4+PiB0aGUgY2FsbCBjaGFpbiBkZXBlbmRz
IG9uIHRoZSByZWdpc3RyYXRpb24gb3JkZXIKPj4+Cj4+PiBJdCBkb2Vzbid0IGlmIHVuaXF1ZSBw
cmlvcml0aWVzIGFyZSByZXF1aXJlZCBhbmQgaXNuJ3QgdGhhdCB3aGF0IHlvdSB3YW50Pwo+Pj4K
Pj4+PiBhbmQgc29tZSBvZiBjdXJyZW50Cj4+Pj4gdXNlcnMgbWF5IHJlbHkgb24gdGhhdCBvcmRl
ci4gSSdtIHByZXR0eSBzdXJlIHRoYXQgY2hhbmdpbmcgdGhlIG9yZGVyCj4+Pj4gd2lsbCBoYXZl
IHVuZm9ydHVuYXRlIGNvbnNlcXVlbmNlcy4KPj4+Cj4+PiBXZWxsLCB0aGUgV0FSTigpIGRvZXNu
J3QgaGVscCBtdWNoIHRoZW4uCj4+Pgo+Pj4gRWl0aGVyIHlvdSBjYW4gbWFrZSBhbGwgb2YgdGhl
IHVzZXJzIHJlZ2lzdGVyIHdpdGggdW5pcXVlIHByaW9yaXRpZXMsCj4+PiBhbmQgdGhlbiB5b3Ug
Y2FuIG1ha2UgdGhlIHJlZ2lzdHJhdGlvbiByZWplY3Qgbm9uLXVuaXF1ZSBvbmVzLCBvciB5b3UK
Pj4+IGNhbm5vdCBhc3N1bWUgdGhlbSB0byBiZSB1bmlxdWUuCj4+Cj4+IFRoZXJlIGlzIG5vIHN0
cm9uZyByZXF1aXJlbWVudCBmb3IgcHJpb3JpdGllcyB0byBiZSB1bmlxdWUsIHRoZSByZWJvb3Qu
Ywo+PiBjb2RlIHdpbGwgd29yayBwcm9wZXJseS4KPiAKPiBJbiB3aGljaCBjYXNlIGFkZGluZyB0
aGUgV0FSTigpIGlzIG5vdCBhcHByb3ByaWF0ZSBJTVYuCj4gCj4gQWxzbyBJJ3ZlIGxvb2tlZCBh
dCB0aGUgZXhpc3RpbmcgY29kZSBhbmQgYXQgbGVhc3QgaW4gc29tZSBjYXNlcyB0aGUKPiBvcmRl
ciBpbiB3aGljaCB0aGUgbm90aWZpZXJzIHJ1biBkb2Vzbid0IG1hdHRlci4gIEknbSBub3Qgc3Vy
ZSB3aGF0Cj4gdGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyBUQkguCgpUaGUgcHVycG9zZSBp
cyB0byBsZXQgZGV2ZWxvcGVyIGtub3cgdGhhdCBkcml2ZXIgbmVlZHMgdG8gYmUgY29ycmVjdGVk
LgoKPj4gVGhlIHBvdGVudGlhbCBwcm9ibGVtIGlzIG9uIHRoZSB1c2VyJ3Mgc2lkZSBhbmQgdGhl
IHdhcm5pbmcgaXMgaW50ZW5kZWQKPj4gdG8gYWlkIHRoZSB1c2VyLgo+IAo+IFVubGVzcyBzb21l
Ym9keSBoYXMgdGhlIHBhbmljX29uX3dhcm4gbWVudGlvbmVkIHByZXZpb3VzbHkgc2V0IGFuZAo+
IHJlYWxseSB0aGUgdXNlciBuZWVkIG5vdCB1bmRlcnN0YW5kIHdoYXQgdGhlIFdBUk4oKSBpcyBh
Ym91dC4gIElPVywKPiBXQVJOKCkgaGVscHMgZGV2ZWxvcGVycywgbm90IHVzZXJzLgo+IAo+PiBX
ZSBjYW4gbWFrZSBpdCBhIHN0cm9uZyByZXF1aXJlbWVudCwgYnV0IG9ubHkgYWZ0ZXIgY29udmVy
dGluZyBhbmQKPj4gdGVzdGluZyBhbGwga2VybmVsIGRyaXZlcnMuCj4gCj4gUmlnaHQuCj4gCj4+
IEknbGwgY29uc2lkZXIgdG8gYWRkIHBhdGNoZXMgZm9yIHRoYXQuCj4gCj4gQnV0IGNhbiB5b3Ug
YXZvaWQgYWRkaW5nIG1vcmUgcGF0Y2hlcyB0byB0aGlzIHNlcmllcz8KCkkgd29uJ3QgYWRkIG1v
cmUgcGF0Y2hlcyBzaW5jZSBzdWNoIHBhdGNoZXMgY2FuIGJlIGFkZGVkIG9ubHkgYWZ0ZXIKY29t
cGxldGlvbiBvZiB0cmFuc2l0aW9uIHRvIHRoZSBuZXcgQVBJIG9mIHRoZSB3aG9sZSBrZXJuZWwu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
