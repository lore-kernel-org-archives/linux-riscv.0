Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6PMObV23CWlG9k9U3Q4+jmRgvV/czIFKjjz7gBraO0=; b=vaNLosIhYNL9ZQ
	3ern7sNLPH+6ZS+Jvd3n3E3SSbVlKm28yFaVeJ8anYxE5QnNwuR0CqztzNSfDygTod/CM+tt5vf2V
	2TQa721DozrNIxuLEGmIppD5LISh8vhs5yA6XjvKH4fGAaaQZ7AP5b9niUmB4TLVKKBD8FEyqNt6h
	ZYNzNY13FjXCANL7V1v1tsNDfNa+385y6oL7Zfn0YHzzyOxmuHYPD2GRzEFvJQ62rYfTwV8dWlPyN
	KvaqgZKjaKgMXdyms8ruE8C92oxqaLie9Gl7wwcNUOQjzy3kdDRuLYox2wv4FKqQ3rPL1rqxwaU+g
	5INwJAbMNskvI80Wz43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKJNe-006vwI-K0; Wed, 16 Feb 2022 12:25:58 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKJNb-006vv5-8a
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 12:25:56 +0000
Received: by mail-yb1-f172.google.com with SMTP id y129so5474827ybe.7
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 04:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZzgKkF+Qi9uD0PohBja9X66WgBtIRyDp12JGMxNBcpY=;
 b=iraXVmAWIcGkhTtJmxnvEamGVXJ0uxjmAJHzGz7FtpP1rDaG6iSPsFR+Pe8DJqxKZ5
 l7Z8JnhzbLi2tS8wBfvSxHEcOaXN7cgwGjOmJiWuc19YuPgEmSV0m4Y/e3H8qs6LaXYN
 KAkFna+TccnecwQzqaKrQ8FwqpEijQ0tilxyUei+5iDcsi/buvxszQ9esmWdlWcRskKM
 fNMFu4ka9EQWqL76VkZcBK1qaBhw0WUa5Ur65sj5C+bHUVPRE0VfraZqgDk1r156f4kM
 lMUlMiOxf2ZvQ3fHWBqqfPwQMVPvF84i3q+Az7YyiPrwiuU3xinFNB78wyWmqLtgJa+D
 8H7g==
X-Gm-Message-State: AOAM532gTvfwoO9+YFS0+4NWQVELHmrknmtwqBxh59uYC1fSufLHGZH7
 NcPKSOE0JwiDAQkhBoJ0buOPh1qp0s4OmU6wNOU=
X-Google-Smtp-Source: ABdhPJzgB2WXDlMNWyEW279no9A0knLc+PLldmsjtAqBW5sJWGuZ+ouM0fPGPUzKV7R9c8p8BV9gaIDPnZPFqeD/pjM=
X-Received: by 2002:a81:f008:0:b0:2d0:cd72:74e5 with SMTP id
 p8-20020a81f008000000b002d0cd7274e5mr2135032ywm.301.1645014353165; Wed, 16
 Feb 2022 04:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20220130233718.21544-1-digetx@gmail.com>
 <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
In-Reply-To: <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 13:25:39 +0100
Message-ID: <CAJZ5v0g0MrBm2+GwctkB7kUyBEt6HTAexRCFFRmTF1UKDrVQ-g@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
 xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>,
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
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_042555_327465_C814632D 
X-CRM114-Status: GOOD (  25.04  )
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTE6MDAgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPiB3cm90ZToKPgo+IDMxLjAxLjIwMjIgMDI6MzYsIERtaXRyeSBPc2lwZW5rbyDQ
v9C40YjQtdGCOgo+ID4gUHJvYmxlbQo+ID4gLS0tLS0tLQo+ID4KPiA+IFNvQyBkZXZpY2VzIHJl
cXVpcmUgcG93ZXItb2ZmIGNhbGwgY2hhaW5pbmcgZnVuY3Rpb25hbGl0eSBmcm9tIGtlcm5lbC4K
PiA+IFdlIGhhdmUgYSB3aWRlbHkgdXNlZCByZXN0YXJ0IGNoYWluaW5nIHByb3ZpZGVkIGJ5IHJl
c3RhcnQgbm90aWZpZXIgQVBJLAo+ID4gYnV0IG5vdGhpbmcgZm9yIHBvd2VyLW9mZi4KPiA+Cj4g
PiBTb2x1dGlvbgo+ID4gLS0tLS0tLS0KPiA+Cj4gPiBJbnRyb2R1Y2UgbmV3IEFQSSB0aGF0IHBy
b3ZpZGVzIGJvdGggcmVzdGFydCBhbmQgcG93ZXItb2ZmIGNhbGwgY2hhaW5zLgo+ID4KPiA+IFdo
eSBjb21iaW5lIHJlc3RhcnQgd2l0aCBwb3dlci1vZmY/IEJlY2F1c2UgZHJpdmVycyBvZnRlbiBk
byBib3RoLgo+ID4gTW9yZSBwcmFjdGljYWwgdG8gaGF2ZSBBUEkgdGhhdCBwcm92aWRlcyBib3Ro
IHVuZGVyIHRoZSBzYW1lIHJvb2YuCj4gPgo+ID4gVGhlIG5ldyBBUEkgaXMgZGVzaWduZWQgd2l0
aCBzaW1wbGljaXR5IGFuZCBleHRlbnNpYmlsaXR5IGluIG1pbmQuCj4gPiBJdCdzIGJ1aWx0IHVw
b24gdGhlIGV4aXN0aW5nIHJlc3RhcnQgYW5kIHJlYm9vdCBBUElzLiBUaGUgc2ltcGxpY2l0eQo+
ID4gaXMgaW4gbmV3IGhlbHBlciBmdW5jdGlvbnMgdGhhdCBhcmUgY29udmVuaWVudCBmb3IgZHJp
dmVycy4gVGhlCj4gPiBleHRlbnNpYmlsaXR5IGlzIGluIHRoZSBkZXNpZ24gdGhhdCBkb2Vzbid0
IGhhcmRjb2RlIGNhbGxiYWNrCj4gPiBhcmd1bWVudHMsIG1ha2luZyBlYXN5IHRvIGFkZCBuZXcg
cGFyYW1ldGVycyBhbmQgcmVtb3ZlIG9sZC4KPiA+Cj4gPiBUaGlzIGlzIGEgdGhpcmQgYXR0ZW1w
dCB0byBpbnRyb2R1Y2UgdGhlIG5ldyBBUEkuIEZpcnN0IHdhcyBtYWRlIGJ5Cj4gPiBHdWVudGVy
IFJvZWNrIGJhY2sgaW4gMjAxNCwgc2Vjb25kIHdhcyBtYWRlIGJ5IFRoaWVycnkgUmVkaW5nIGlu
IDIwMTcuCj4gPiBJbiBmYWN0IHRoZSB3b3JrIGRpZG4ndCBzdG9wIGFuZCByZWNlbnRseSBhcm1f
cG1fcmVzdGFydCgpIHdhcyByZW1vdmVkCj4gPiBmcm9tIHY1LjE0IGtlcm5lbCwgd2hpY2ggd2Fz
IGEgcGFydCBvZiBwcmVwYXJhdG9yeSB3b3JrIHN0YXJ0ZWQgYnkKPiA+IEd1ZW50ZXIgUm9lY2su
IEkgdG9vayBpbnRvIGFjY291bnQgZXhwZXJpZW5jZSBhbmQgaWRlYXMgZnJvbSB0aGUKPiA+IHBy
ZXZpb3VzIGF0dGVtcHRzLCBleHRlbmRlZCBhbmQgcG9saXNoZWQgdGhlbS4KPgo+Cj4gUmFmYWVs
IGFuZCBhbGwsIGRvIHlvdSBzZWUgYW55dGhpbmcgY3JpdGljYWwgdGhhdCBuZWVkcyB0byBiZSBp
bXByb3ZlZAo+IGluIHRoaXMgdjY/Cj4KPiBXaWxsIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCB0YWtl
IHRoaXMgcGF0Y2hzZXQgdmlhIHRoZSBwb3dlciB0cmVlIGlmIGl0Cj4gbG9va3Mgb2theSwgb3Ig
Z2l2ZSBhbiBhY2suCgpJIG5lZWQgc29tZSBtb3JlIHRpbWUgZm9yIHRoaXMsIHNvcnJ5LgoKSSdt
IGEgYml0IGNvbmNlcm5lZCBhYm91dCBzZWVpbmcgbm8gcmVzcG9uc2UgdG8gdGhpcyBzZXQgZnJv
bSBhbnlvbmUuCgpJdCBsb29rcyBsaWtlIG11bHRpcGxlIHBsYXRmb3JtcyBtYXkgYmUgYWZmZWN0
ZWQgYnkgaXQgaW4gcHJpbmNpcGxlLApzbyBkb2Vzbid0IGFueW9uZSBjYXJlPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
