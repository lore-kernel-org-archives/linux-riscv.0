Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80E5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 11:36:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CC360F14
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 11:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83CC360F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+cHS/mrLs7MVlkD80jeYF0xDDnIvXzZSTb03SZDaJh4=; b=vzdEg/ldA0Cq6kyWZcualNKSwY
	mmX7exh6Wl54KJJu+fxgs3Ad7+T3FRH+/8rZqjjKys0K5+OOEyibSHKro4i6JW+/sdj2er6cAvb7m
	csuKZTYAfH3TB66H6HEzdkeo1pjuTc4io6Y+BMjhhC13iNrH1qoY5/onUglaNd7pi8SdiVAe0Deoj
	61vzIjIfS42uZnXb14DiHARAF+VEK5UQuctdXBRuVOZD//esSAjEWxyCR5vI9QSjMDO+c6uvOTv2m
	oOMJDMGtwUrLo/2g4MG9b8lZ5cZqximfQv3qQHiYHZb4QhWFSYlMDhmkO/MrWLrv9OX7viN8YpMyP
	u4eVS3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk2xF-00GJFd-8p; Mon, 08 Nov 2021 11:36:49 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk2xC-00GJEZ-73; Mon, 08 Nov 2021 11:36:47 +0000
Received: by mail-lj1-x22d.google.com with SMTP id i26so28878225ljg.7;
 Mon, 08 Nov 2021 03:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+QlLlo/0/3EVdBxA2kw9RSD+7dI68j0akmWtlfHVoc=;
 b=aZVzW8uInA8LU/x+WSDcs8GL423pa/2TbHlNFMZCd9U6UTTINhRxHwWgMG+VIGRFXX
 YHsHS1Zp8SLg7g0I8x9US08hxM80ZghlJabXZBFwbjt/NZTi8D93A6u3DdWQsriGAEMv
 bFmB7LTf3DQwVbSm6WogHRt9oYdTZJJwV6Cdja/STeDW7/10QbzkyuPD5z+/FAuGPwej
 XDOG6vFO/moWThDJAR559rbcfRfK+AgOLrilun42rQLGkujwn1pckpcm4TgSB3WIb1LP
 WWP0u+S7lmnv27N0vKhUH9Av/RJV5C0NJsxi8Lo9cU/Zh/pB4HH/qd8XqYWZNDXsqTHX
 YlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+QlLlo/0/3EVdBxA2kw9RSD+7dI68j0akmWtlfHVoc=;
 b=Qsmx77f94ks+wIA7atjf9q5FmrinhkEoiQt7qb0z94E9MHceBwmeqMgoIwWylqtxbB
 HDY5Ey+LU9GB9YOH9gQJlRnfvdVSZ8z87DYtbezNJtbdgGLpZWPuZEssiUhOjm6e/peu
 Za3MlKilPdDsJ0usVF8rO5ISAj9xts+3rHsaVHzCiiEroVzLy4bRx0UPV1UYQhLHVEiX
 vNq0WtT6Mfc9lsoo51HsJjo08EcEtfC3gt6EpZkbY0DkPVd5y++1PnMYnn5MGTCrqnP6
 KPitw34avm2VmUVKvPMhCfxSgeMwKNz4Rjy2TEz6iE55vHdlb5bGU9pm5IKyQCH3TR+5
 NeMg==
X-Gm-Message-State: AOAM532qfseTrSK7F3Rd+B5VKAz6lVrimpE3rR8ouYgxb2N1Alt+NL7P
 X/wsD6e1sdg3FQEgNcqSNzw=
X-Google-Smtp-Source: ABdhPJzzWZ+q13ptoCU5JHKLBozyl2qyG0di7fj7GC0x6tQVXWEZ5utjk3vHuuOVClKYY3WCOwTKiw==
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr69963654ljq.197.1636371404363; 
 Mon, 08 Nov 2021 03:36:44 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id q6sm1523591ljh.1.2021.11.08.03.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 03:36:44 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
 <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com> <YYkIeBSCFka9yrqC@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com>
Date: Mon, 8 Nov 2021 14:36:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYkIeBSCFka9yrqC@latitude>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_033646_288158_E31B1B57 
X-CRM114-Status: GOOD (  16.32  )
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

MDguMTEuMjAyMSAxNDoyMiwgSm9uYXRoYW4gTmV1c2Now6RmZXIg0L/QuNGI0LXRgjoKPiBPbiBT
dW4sIE5vdiAwNywgMjAyMSBhdCAwODo0MjozM1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3Jv
dGU6Cj4gWy4uLl0KPj4gRUMgZHJpdmVycyB0ZW5kIHRvIHVzZSBoaWdoZXIgcHJpb3JpdHkgaW4g
Z2VuZXJhbC4gSm9uYXRoYW4sIGNvdWxkIHlvdQo+PiBwbGVhc2UgY29uZmlybSB0aGF0IE5UWEVD
IGRyaXZlciBpcyBhIG1vcmUgcHJlZmVyYWJsZSByZXN0YXJ0IG1ldGhvZAo+PiB0aGFuIHRoZSB3
YXRjaGRvZz8KPiAKPiBZZXMuIFRoZSBvcmlnaW5hbCBmaXJtd2FyZSB1c2VzIHRoZSBOVFhFQyB0
byByZXN0YXJ0LCBhbmQgaXQgd29ya3Mgd2VsbCwKPiBzbyBJIGRvIHRoaW5rIGl0J3MgcHJlZmVy
YWJsZS4KClRoYW5rIHlvdSwgdGhlbiBJJ2xsIHVwZGF0ZSB0aGUgTlRYRUMgcGF0Y2ggbGlrZSB0
aGlzOgoKaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci9saW51eC9jb21taXQvMjJkYTNk
OTFmMTczNGQ5YTBlZDAzNjIyMGFkNGVhMjg0NjVhZjk4OAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
