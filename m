Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DEBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334A760F90
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 334A760F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvpSDbJQXRh3/lwVa8Bi8Q/CGpXzIeCMtejwGFpmXoo=; b=xYuGCQtY/5lgV4
	vO4D499j3JsiS6FSkbYJ7RNHOBvE1+bftqAZ/SF0QBiy/44p60zlxJovuJcLB31fwWnBDB/OUF6ZJ
	jpSuHK1+z4YD9Qun5DMRzh5rBABycbIdXLwK8KUbtA+Zo40TERa9PjxZmYFFDUr+BnB4S+9H60NvS
	ieKuLpu5uG4mpPzn2ItZ4AAfHgPWY0ciFydrqFJ4wvv26N61lompZ+7P76XRbzNXjAfJUqqbgXiDF
	WMbaQ164irfQeFEuqRoN/ZBONLoeBxh21xFXatlLSu2ZXrQlTorP3jiye3gr/RdtKBlpC4YIQ0nj/
	B6uvFkD96c+K5NQADoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4Q1-007mXG-Ru; Thu, 28 Oct 2021 12:22:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4Pz-007mW9-47; Thu, 28 Oct 2021 12:22:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so4578433pjb.0; 
 Thu, 28 Oct 2021 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
 b=iTF+KxXEUPxEL0X/A/h2gzR6rfhKbueZtpV43T9ecbwhzi0t+l3q/o5Ua3AWvU+Enc
 ByGkTqENMRntgh3iznFMDxu2CMYcinTkd+zVseDqmIBVqNiOOl7jtDTN28tXnXeh/eHS
 f+SIvvi2YC7tI22dM3EDibcHeQLa3iIqsv5H8CiejoyVxtmYKOA3VOetskmtU4Lx+Pqb
 LjWvbMeTK5pVAec3h6exgixTZBuA0b6b4pLrHZnH5EOvWXMCcJgTfSDot7PpiFpwOrmA
 UDe0Zf8yyrgR8VQIYltC0W9ualVYljq6alX4ZkNWzu2NeGmBPW3wY5ZPA2p2XVSWoIe3
 jylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
 b=o6BMm/Meu4QKKqp9PA2Zhh6Zz3jM1g2qHnMmuc1v7IAgRaCUpMSr2H8lmmDCMJzaz/
 TO+OJxNn6c/JMbmdfrWSq5hALImXrR9Y79gPUrp81xig8rAlhkoXRPydoOKctQqBZx3p
 /ilLqfOQdWaizabjve+nGh+waV9MsQGBEqomUTsndmUwE0e3757AW9Epg06M7GtJXV6s
 NeeVAtn0SVdhOQxbvMte2vvyrfavVxOmnE1JynGvmENqFOAsGASXK68Uen2RqiOkr/5L
 2KJWoJ8K1++laaU6XKsLILZt/1L6WEsRMKSIEmXt/dGVqfiqd0Rbkm8RU0obnVHLApVH
 oWFg==
X-Gm-Message-State: AOAM530em1+y7ut6O7zY4UogIbZLm9m2WCjcZbeiTTrNI3mwlAR6A1ay
 zfgAKoKgkLt1wVypfOP42af1fiwGR8yjZ2VZhgA=
X-Google-Smtp-Source: ABdhPJwgRG6Z5IlQAMmxkEb7xwk/3DRskWOoc9lq5s+Jze0PB67uqVa13ZU9GrnI44E+cb/61DiEpYjC8sFDBN8RSYA=
X-Received: by 2002:a17:902:b716:b0:13f:b2d1:f316 with SMTP id
 d22-20020a170902b71600b0013fb2d1f316mr3644234pls.24.1635423719258; Thu, 28
 Oct 2021 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-16-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-16-digetx@gmail.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Thu, 28 Oct 2021 20:20:00 +0800
Message-ID: <CAEbi=3eTruN6rYvEHCtyhTEZ=Ep8n6g75UMpHffc=0UrVTGbdQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/45] nds32: Use do_kernel_power_off()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Lee Jones <lee.jones@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alan Kao <alankao@andestech.com>, 
 =?UTF-8?B?Sy5DLiBLdWVuLUNoZXJuIExpbijmnpflnaTmiJAp?= <kclin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_052203_176190_917534A8 
X-CRM114-Status: GOOD (  19.17  )
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

RG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiDmlrwgMjAyMeW5tDEw5pyIMjjml6Ug
6YCx5ZubIOS4iuWNiDU6MTjlr6vpgZPvvJoKPgo+IEtlcm5lbCBub3cgc3VwcG9ydHMgY2hhaW5l
ZCBwb3dlci1vZmYgaGFuZGxlcnMuIFVzZSBkb19rZXJuZWxfcG93ZXJfb2ZmKCkKPiB0aGF0IGlu
dm9rZXMgY2hhaW5lZCBwb3dlci1vZmYgaGFuZGxlcnMuIEl0IGFsc28gaW52b2tlcyBsZWdhY3kK
PiBwbV9wb3dlcl9vZmYoKSBmb3Igbm93LCB3aGljaCB3aWxsIGJlIHJlbW92ZWQgb25jZSBhbGwg
ZHJpdmVycyB3aWxsCj4gYmUgY29udmVydGVkIHRvIHRoZSBuZXcgcG93ZXItb2ZmIEFQSS4KPgo+
IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAtLS0K
PiAgYXJjaC9uZHMzMi9rZXJuZWwvcHJvY2Vzcy5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbmRz
MzIva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYwo+IGluZGV4
IDQ5ZmFiOWUzOWNiZi4uMDkzNmRjZDdkYjFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvbmRzMzIva2Vy
bmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC01
NCw4ICs1NCw3IEBAIEVYUE9SVF9TWU1CT0wobWFjaGluZV9oYWx0KTsKPgo+ICB2b2lkIG1hY2hp
bmVfcG93ZXJfb2ZmKHZvaWQpCj4gIHsKPiAtICAgICAgIGlmIChwbV9wb3dlcl9vZmYpCj4gLSAg
ICAgICAgICAgICAgIHBtX3Bvd2VyX29mZigpOwo+ICsgICAgICAgZG9fa2VybmVsX3Bvd2VyX29m
ZigpOwo+ICB9Cj4KPiAgRVhQT1JUX1NZTUJPTChtYWNoaW5lX3Bvd2VyX29mZik7Cj4gLS0KPiAy
LjMzLjEKPgoKTG9vcCBpbiBBbGFuIGFuZCBLQwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
