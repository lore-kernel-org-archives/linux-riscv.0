Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OgmqYIHg6jHr0BJfziy1d/08Kv6PPTtuFA2vkU2k2Y0=; b=HOESHtm4oTJxEJdGZ2Chso4XsG
	Gp/PH9u5NLLgc6PhNWj8Oso4L/DkPHynDpCcb0rqQgyvIoNRZTPHnB7YhHFhvUUvyE/+9VrLPyaqs
	noV1uy4cYGg8wveSpkM2bSA1cMe1zUCeLuhoGgEJpsLDY5tO4TypUd5yTitjb44Uf9hRdtvooXb7A
	xoSqvjVHFlQ70kSNlrgG0Wp56iECuziulKfcyBcBAA8S4s1ASfxrgdUmXJW+zKfdAB69k7fKhkgh7
	3juYUSP1n+xQQLeXy66tw8YRut3v806b8ecGzBwIInxIYJ2OTdycfTFmJYfjlO6cCsEQ9yfFuwzhr
	40cppVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlty-003cek-7e; Fri, 10 Dec 2021 19:49:54 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvltw-003ceL-37; Fri, 10 Dec 2021 19:49:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id cf39so7836189lfb.8;
 Fri, 10 Dec 2021 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Fx2AxGyl7h70TiPIfAS4vLJoC4O4KHoawTu1bt5PLU=;
 b=V/Owe18bjaHxi/q9LMXS8LNROf16L9DCZYGpExoCj+SNTLCiSQNB3HcPLajV/NP5JE
 39hqIvfIb3bc7xrS2E0EYCC3yAPKzLg7BnA0PumFQ89YOCGyLF9Ipz3BTISejc0ZvQJA
 z5FDAeVaX1e2/Z9TFGOO31SRX4KXbVNvKZ2tbYOwQTeu/RyJ9cs6xalps+Kn8iqrggDL
 HFUryH5SPjqHR6nW0F4ENPTnll1o3uJ7tQu3AMV7MUX+qx7nV3LMFjM06jk+Y2dJ7HtP
 J+zk+OszrogiRw5+RRL4W19jTgJEJXo+L0tNHRiDg9ofDsu8gJQpDKtlXAuJgOp4GYiB
 LSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Fx2AxGyl7h70TiPIfAS4vLJoC4O4KHoawTu1bt5PLU=;
 b=MbRd2xUqV7ROHqewRy1wxhQiHLdAZ/HznPtzpmX3xL3u7OMfgwGCtJ6reZK1DVsNyk
 Ivfjc845fmBJhXe+q2YrinnzeAQvtVjmck09oPtcVO8bJzBuO16xTCjKbXIZ2oLhrOWP
 YatNHlK07NUxVU8NU+pg0NkjUkfiFAnr5KsAfLqb2RAABdHclhhyjdalj8IeFc1fHPy+
 UCj4T59DCg33mn1E6woKbSqH91iAo41ejApXV7LthxGl08fuXMRee+4P8nkp4IkaSAbR
 zXIptmyV4pHiakFNUFUafTyMF3QrbO5UhJQsvCifDtnTuR/3YdRNrVSIr4ecLM1zpHz3
 HSDA==
X-Gm-Message-State: AOAM532ggpwmqAYVzXGikjsID+Ju3zdkLMp9ymV78jsOFX1TxyyIrMSK
 AjUayXSTI/YCP/slSoN4yOA=
X-Google-Smtp-Source: ABdhPJz32UCAa2RfOn9XCHx2JjAq/5XnkzKJ8mqE0CmU9Bnm8cg96K7fElVvubFW0G/2Bv0vNQ8r/g==
X-Received: by 2002:a05:6512:114a:: with SMTP id
 m10mr14457333lfg.188.1639165790431; 
 Fri, 10 Dec 2021 11:49:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z24sm395757lfh.289.2021.12.10.11.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:49:49 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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
 <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
 <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
Message-ID: <7875d10b-0d9b-ca29-668b-630ea3650fd0@gmail.com>
Date: Fri, 10 Dec 2021 22:49:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_114952_198466_CC73A49B 
X-CRM114-Status: GOOD (  20.72  )
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

MTAuMTIuMjAyMSAyMjo0NCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTAuMTIuMjAy
MSAyMjo0MiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gLi4uCj4+Pj4gVGhlcmUgaXMg
bm8gc3Ryb25nIHJlcXVpcmVtZW50IGZvciBwcmlvcml0aWVzIHRvIGJlIHVuaXF1ZSwgdGhlIHJl
Ym9vdC5jCj4+Pj4gY29kZSB3aWxsIHdvcmsgcHJvcGVybHkuCj4+Pgo+Pj4gSW4gd2hpY2ggY2Fz
ZSBhZGRpbmcgdGhlIFdBUk4oKSBpcyBub3QgYXBwcm9wcmlhdGUgSU1WLgo+Pj4KPj4+IEFsc28g
SSd2ZSBsb29rZWQgYXQgdGhlIGV4aXN0aW5nIGNvZGUgYW5kIGF0IGxlYXN0IGluIHNvbWUgY2Fz
ZXMgdGhlCj4+PiBvcmRlciBpbiB3aGljaCB0aGUgbm90aWZpZXJzIHJ1biBkb2Vzbid0IG1hdHRl
ci4gIEknbSBub3Qgc3VyZSB3aGF0Cj4+PiB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzIFRC
SC4KPj4KPj4gVGhlIHB1cnBvc2UgaXMgdG8gbGV0IGRldmVsb3BlciBrbm93IHRoYXQgZHJpdmVy
IG5lZWRzIHRvIGJlIGNvcnJlY3RlZC4KPj4KPj4+PiBUaGUgcG90ZW50aWFsIHByb2JsZW0gaXMg
b24gdGhlIHVzZXIncyBzaWRlIGFuZCB0aGUgd2FybmluZyBpcyBpbnRlbmRlZAo+Pj4+IHRvIGFp
ZCB0aGUgdXNlci4KPj4+Cj4+PiBVbmxlc3Mgc29tZWJvZHkgaGFzIHRoZSBwYW5pY19vbl93YXJu
IG1lbnRpb25lZCBwcmV2aW91c2x5IHNldCBhbmQKPj4+IHJlYWxseSB0aGUgdXNlciBuZWVkIG5v
dCB1bmRlcnN0YW5kIHdoYXQgdGhlIFdBUk4oKSBpcyBhYm91dC4gIElPVywKPj4+IFdBUk4oKSBo
ZWxwcyBkZXZlbG9wZXJzLCBub3QgdXNlcnMuCj4+Pgo+Pj4+IFdlIGNhbiBtYWtlIGl0IGEgc3Ry
b25nIHJlcXVpcmVtZW50LCBidXQgb25seSBhZnRlciBjb252ZXJ0aW5nIGFuZAo+Pj4+IHRlc3Rp
bmcgYWxsIGtlcm5lbCBkcml2ZXJzLgo+Pj4KPj4+IFJpZ2h0Lgo+Pj4KPj4+PiBJJ2xsIGNvbnNp
ZGVyIHRvIGFkZCBwYXRjaGVzIGZvciB0aGF0Lgo+Pj4KPj4+IEJ1dCBjYW4geW91IGF2b2lkIGFk
ZGluZyBtb3JlIHBhdGNoZXMgdG8gdGhpcyBzZXJpZXM/Cj4+Cj4+IEkgd29uJ3QgYWRkIG1vcmUg
cGF0Y2hlcyBzaW5jZSBzdWNoIHBhdGNoZXMgY2FuIGJlIGFkZGVkIG9ubHkgYWZ0ZXIKPj4gY29t
cGxldGlvbiBvZiB0cmFuc2l0aW9uIHRvIHRoZSBuZXcgQVBJIG9mIHRoZSB3aG9sZSBrZXJuZWwu
Cj4+Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+IAoKSSBtZWFudCB5b3UsIFJhZmFl
bCwgYW5kIE1pY2hhxYIsIGp1c3QgaW4gY2FzZSA6KQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
