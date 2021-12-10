Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E69C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kNRvIrcDxsA8V7F3C1YdtpS81ccB6dh8MJ/uWAXrIg=; b=PihmOwZTGPve+Y
	mBpUY41Ouoxn/6Aa7q9FmSswr4zvJ4WniLjyQyn4fosObOXr6DAJKdXA0HB77nzU4qSwbgkuXwkG6
	HDFl8G4inSawnjteihqmm1NjLIjtw4e5XDWF2g0+GfQXlVujBWcwA+OK3JfQ5xuSC68usjUFMbGaq
	j6TVU/bemiGTRsMlA8QtobBqhB8+roMQcWsIba+YhXPZbB5ClgY5vohxEd0b9yTGEhqH3tU46p+iB
	KHPCPlcc5/ldullKIEVpmixHroizirETLElxM57gSHBtpZ+8X8N7ricW/XI/m3koXOOL55NJFTvmh
	O36Amygldyv3gszmq3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkjx-003DyV-VV; Fri, 10 Dec 2021 18:35:29 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkjt-003Dxd-Rk; Fri, 10 Dec 2021 18:35:27 +0000
Received: by mail-oi1-f175.google.com with SMTP id bk14so14386946oib.7;
 Fri, 10 Dec 2021 10:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cmWwBA8Prvw8yKg8YllQ7/9D+dqLH//9VzjE/Uy0t0I=;
 b=pQ2CDaDQy9n0c62uDh+N8BqqW/lOWGFRGlJCAK2YPGqLeuB5Mb2qEhoWsj1A4yMxfg
 NniNb/cu6wreU1RgZqfB94yynvF5M64YgJkmbRJcywQyR4hsskSWP6sSXarfm6KuqGKk
 ySXjE2EoV4Un3/laypJlOwikqJ87YuYjPf0RO8ofZ7qJTM879jA6HcSJ4wyjsjsFjJsR
 YR5fbyMLr5hqC31FDTyi7um4XkyVPa/8uegRP3qspm4Bw938Syp4qEmWMtRkLQtYsNGM
 /d/nXCba4Y0JYJR4bnWCoHuq01qYAb0E3UlnMzQqUMzKK6kNwHtXrCRkvlnk9fl4KbXc
 FZWQ==
X-Gm-Message-State: AOAM533Nn9/2eEPvUze1NCB6gWP3paKUggpYRSiks0h0GamwmZJ+3IjG
 dkPeID0ZwWmw5xavGn6ys7V6+hP/stXgZIOTOPw=
X-Google-Smtp-Source: ABdhPJy55tGpIDxF+0NXDym/GuLq/jPswo3lW9bQPH3JZ5naSMZQfeBVB0yUiflqPmuJ6rchV13JR6onKlnNSicDR4M=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14005588oih.51.1639161324582; 
 Fri, 10 Dec 2021 10:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
 <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
In-Reply-To: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:35:13 +0100
Message-ID: <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
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
X-CRM114-CacheID: sfid-20211210_103525_922478_844E5E41 
X-CRM114-Status: GOOD (  19.07  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgNzoxNiBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTAuMTIuMjAyMSAyMTowOSwgUmFmYWVsIEouIFd5c29ja2kg
0L/QuNGI0LXRgjoKPiA+IE9uIEZyaSwgTm92IDI2LCAyMDIxIGF0IDc6MDIgUE0gRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IFRoZXJlIGlzIG5vIG5l
ZWQgdG8gYW5ub3RhdGUgZnVuY3Rpb24gcHJvdG90eXBlcyB3aXRoICdleHRlcm4nLCBpdCBtYWtl
cwo+ID4+IGNvZGUgbGVzcyByZWFkYWJsZS4gUmVtb3ZlIHVubmVjZXNzYXJ5IGFubm90YXRpb25z
IGZyb20gPHJlYm9vdC5oPi4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgdGhhdCB0aGlzIGlzIHJl
YWxseSB1c2VmdWwuCj4gPgo+ID4gUGVyc29uYWxseSwgSSB0ZW5kIHRvIHJlc3BlY3QgdGhlIGV4
aXN0aW5nIGNvbnZlbnRpb25zIGxpa2UgdGhpcy4KPiA+Cj4gPiBTdXJlbHksIHRoaXMgY2hhbmdl
IGlzIG5vdCByZXF1aXJlZCBmb3IgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyB0byB3b3JrLgo+Cj4g
UHJvYmxlbSB0aGF0IHN1Y2ggdGhpbmdzIHN0YXJ0IHRvIHNwcmVhZCBhbGwgb3ZlciB0aGUga2Vy
bmVsIHdpdGggYQo+IGNvcHktcGFzdGUgYXBwcm9hY2ggaWYgdGhlcmUgaXMgbm9ib2R5IHRvIGNs
ZWFuIHVwIHRoZSBjb2RlLgo+Cj4gVGhpcyBpcyBub3QgYSBjb21tb24gY29udmVudGlvbiBhbmQg
c29tZXRpbWVzIGl0J3MgZ2V0dGluZyBjb3JyZWN0ZWQgWzFdLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvbGludXMvNmQ3NDM0OTMxCgpJbiBzZXBhcmF0ZSBwYXRjaGVzIG91dHNpZGUg
b2Ygc2VyaWVzIGFkZGluZyBuZXcgZmVhdHVyZXMsIGlmIG9uZSBpcwpzbyBpbmNsaW5lZC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
