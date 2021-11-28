Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF437C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F+i+DjQIV9W8X5YNqhW+CJcro/VaCounmlBD0YRMCEY=; b=QwCHLPNVOWQEuIVsV93NxnOx4H
	8oicZcNOcfvz4wodwWIkjah8xQgkmFcgOng1gpJQ+NAd5pq3+yCqENyzeo+qTSaH/IKfCe1PhvaFo
	yGG8ZQiMvsmY3yW8SiP/cNeClKG+9ud/Nh8b9nxKLuT2Bej2QTLiAYbsTQ7b3eu71DZa5gKVkGZfn
	OM6ti8vC3cFfxQYW2COMq1/ZZd79UO08evoLMrYxeRDlsGL+bfzl935RSadWPCGsv6lYIGXPMPB4r
	zMXjpUCmfCRY3xHKTZzCLOTua3AGEfRNbRurHodSLXFt6Id9ShfCQ+KqVtzkLqcxBP3VHpYBO9Ddc
	0mHESILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrS7c-00GjW7-50; Sun, 28 Nov 2021 21:54:08 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrS7Z-00GjUN-Fk; Sun, 28 Nov 2021 21:54:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b40so39416085lfv.10;
 Sun, 28 Nov 2021 13:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
 b=Ve2rGzh1LJA0+OcOlbbQ73O4vszbugE425G36NIT/LJkRhFMX190Vmwf9Z1u+DozQy
 nt7KBoHLP6NcqsCJJVf/XMiWi1msgC02rhfjLu8CKl0SI+0RrFvUKjFjlZH7bdfHOiEX
 jvvRM0yX0DY0N616Cr6USUXBiFSTo4izfqBOoNpjwV+G+cH1cFHUwmonpjoWJX8Ppl5i
 8dEUJUKATxCUbOfS4VM/cGGt6HuPu0povTPAj3Y6GTkQG70Ogmn5eg+CfWVBj+3pxNr6
 ReZIvwRQlO/G/fnEj5DP0/liBCD4UXfZ78eAcvQevgGY/DQsBvKDeMEPHSEvbIQ59N2I
 efCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
 b=yQ0+6YbTLhCG4yzkKX9iCRMWAwXh+hLFHIkgrNgEejcNigh2fazthNzhKdNJ/8Yn9J
 q1DPrxxHACbiC8Je+KqUTUBVTLBEqTEKyyPM+t87ij7zdRL6XvthT3X6VbQG7pC0zJB2
 KkyfM5WyDXUjTfJdIHznJMjx/Saeg3EqvtrH+4CFYUq5mwejEPHG9AqLSHqUXELVoL4+
 +3cZZaYwSJC6Y+VmN7xRV0MGD5xqUrT+vQOO1aXfPqj3SgxC3GOwbCGFwhVaXLwjvNk3
 WMf7QA9R97X6JnVJHwp0nXXXgE/A7oBKbel+Bgg0E2Ext0z2xnWbmF6PKVtyuiAe/tui
 49Tw==
X-Gm-Message-State: AOAM530JNtAouy0/ADmmYDIX7xV7Rlll0oxRXh+8aZiIWId8jlOS0dV4
 q6wraxFa5URiphXMFFiC670=
X-Google-Smtp-Source: ABdhPJxrac6Czjs8U2D2QGSscJN4jhlYtGpRqd/e7TNYLEXAP/IVggs/yFEWoCFlClXMagpvBwvrwg==
X-Received: by 2002:a05:6512:3c82:: with SMTP id
 h2mr44786433lfv.128.1638136440658; 
 Sun, 28 Nov 2021 13:54:00 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id w15sm1168884ljo.97.2021.11.28.13.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:54:00 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
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
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
Date: Mon, 29 Nov 2021 00:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_135405_567808_26537B0A 
X-CRM114-Status: GOOD (  15.13  )
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

MjkuMTEuMjAyMSAwMDoxNywgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPj4gSSdtIGhh
dmluZyB0cm91YmxlIHdpdGggcGFyc2luZyB0aGlzIGNvbW1lbnQuIENvdWxkIHlvdSBwbGVhc2Ug
dHJ5IHRvCj4+IHJlcGhyYXNlIGl0PyBJIGRvbid0IHNlZSBob3cgeW91IGNvdWxkIGNoZWNrIHdo
ZXRoZXIgcG93ZXItb2ZmIGhhbmRsZXIKPj4gaXMgYXZhaWxhYmxlIGlmIHlvdSdsbCBtaXggYWxs
IGhhbmRsZXJzIHRvZ2V0aGVyLgo+IElmIG5vdGlmeV9jYWxsX2NoYWluKCkgd291bGQgYmUgZml4
ZWQgdG8gcmV0dXJuIE5PVElGWV9PSyBpZiBhbnkgY2FsbAo+IHJldHVybmVkIE5PVElGWV9PSywg
dGhlbiB0aGlzIHdvdWxkIGJlIGEgY2xlYXIgd2F5IHRvIGdhdGhlciB0aGUKPiBhbnN3ZXIgaWYg
YW55IG9mIHRoZSBoYW5kbGVycyB3aWxsIGF0dGVtcHQgdGhlIGZpbmFsIGFjdGlvbiAocmVib290
IG9yCj4gcG93ZXIgb2ZmKS4KPiAKCkNvdWxkIHlvdSBwbGVhc2Ugc2hvdyBhIGNvZGUgc25pcHBl
dCB0aGF0IGltcGxlbWVudHMgeW91ciBzdWdnZXN0aW9uPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
