Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B6C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gjdg4Z1hKVM6sgDH0tScnGAFAdH3CgA8kQhFyvz0Zbk=; b=iJaT1/GTyR6dckUX+iGDTIzlAQ
	hftl7HTmPUU1EB3HPrcpTmeWTGA2tsKiDDWRRVAgLJN39UjeUl+oCVBC4x8PVX1cTAAWk7grcoHpT
	BqkKNqDw52Hyr3q2B3ySfJjpxLuqxGm/FHo0thNd0DsBovX6KvhWYSAAmC/zL4eR/+59qjHxWYQu6
	L/k7N32bJLrfbBTcMQ1XPjNHhSeXGZnVbFmdOyLV3c1wZAhBPefhzJ9BCgRCftpTZxOPOqp1w91sr
	dsEZrb+n6OlcLHzA//fGMQDSBl6SWvakzyf3hyhPe3jNehI0F2NS0teUbJm3jF88YXAqtZKqCKwRJ
	rtcvkPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrRNa-00GhD3-Bu; Sun, 28 Nov 2021 21:06:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrRNX-00GhBB-EF; Sun, 28 Nov 2021 21:06:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id m27so39178747lfj.12;
 Sun, 28 Nov 2021 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dBFzSL4UYCAYQqmDupNTSShpvRMUEbaJ9Mx4K7HGHPc=;
 b=oml1oX0ZWjhkzuRjHJtH1XTn55+HCuWM51eukHmTMUsqYvepCYTnsQ8nmJ1fi6Ny8O
 hk+9nsbkv1H426inD0KEeQ2Fx2c/aojT5orC8a1HaRiSAHCfbZ4GibLUq6jXw8umdLa+
 7Npmf61QEFnfrTJUhnvyNQXEcG3o44nwO/yhewKgQ2Tv5+cyXPwRAr9avOHgipiR7uOU
 3lG/X5TvXt9e7Baba1QmnryaUy282ao9aOX5wnj9w2azfGP26R8Qk0MYK0SZQyDuBX5E
 nJWhN9xVkrVnERfId0Z6c0a3FiVVFjBlUiijA64WcIz/4PjWlAuAjWR6TMU93ETZJ9CC
 EpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dBFzSL4UYCAYQqmDupNTSShpvRMUEbaJ9Mx4K7HGHPc=;
 b=bwuVEdq3nH7x/11xUfAm6TF8hAQA8KGL/k0X5EvByUacAYF/u5YhF0NlMugcls+/8T
 Xl+Hm9RPWfLCi9q/NLmU0NCoNUHtZEeO5YdhEjebG6DzFtU0r1ZLCIbX+A/OyIwS1vqN
 kb/IS41fJ/DmlYLL8iDbT50HflEwBCG9yEeIGvz5+Fkl+JEvPc7vVsub8ny3sGTpizwg
 P6+3vuz8IkgZOM6T6s9Lx6M24JB56djgdS6Y0NBtx72UoLwouaEAhafTUbUQrjODoUYS
 L9zM5CTI1pCLGGbwtMe2U90ol+B75WJI9u2+kA4bAVdnNdhrHlhKujaxrT4mY9U2tVsQ
 Hf1g==
X-Gm-Message-State: AOAM531OLudnijujO9PKiwHqy9vmnFrBPmU+46ykB5AInn7eppVqxOJl
 I9le9xR3PKhKoTCrgN7fZis=
X-Google-Smtp-Source: ABdhPJw8DbrxRHQUKfkUrzcq3jrRe892hdaQjtTmhQ/Pf+osYN9e0RKllfwyJmy+SLn8xY0V3MlxVg==
X-Received: by 2002:a05:6512:3fa1:: with SMTP id
 x33mr34004371lfa.676.1638133588639; 
 Sun, 28 Nov 2021 13:06:28 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id v2sm1096217lfb.258.2021.11.28.13.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:06:28 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
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
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
Date: Mon, 29 Nov 2021 00:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_130631_511275_06BBB1F5 
X-CRM114-Status: GOOD (  24.21  )
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

MjguMTEuMjAyMSAwMzoyOCwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IEFkZCBzYW5pdHkgY2hlY2sgd2hpY2ggZW5zdXJlcyB0aGF0IHRoZXJlIGFyZSBubyB0d28g
cmVzdGFydCBoYW5kbGVycwo+PiByZWdpc3RlcmVkIHdpdGggdGhlIHNhbWUgcHJpb3JpdHkuIE5v
cm1hbGx5IGl0J3MgYSBkaXJlY3Qgc2lnbiBvZiBhCj4+IHByb2JsZW0gaWYgdHdvIGhhbmRsZXJz
IHVzZSB0aGUgc2FtZSBwcmlvcml0eS4KPiAKPiBUaGUgcGF0Y2ggZG9lc24ndCBlbnN1cmUgdGhl
IHByb3BlcnR5IHRoYXQgdGhlcmUgYXJlIG5vIGR1cGxpY2F0ZWQtcHJpb3JpdHkKPiBlbnRyaWVz
IG9uIHRoZSBjaGFpbi4KCkl0J3Mgbm90IHRoZSBleGFjdCBwb2ludCBvZiB0aGlzIHBhdGNoLgoK
PiBJJ2QgcmF0aGVyIHNlZSBhIGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3Rlcl91bmlxdWUo
KSB0aGF0IHJldHVybnMKPiAtRUJVU1kgb3Igc29tZXRoaW5nIGlzdGVhZCBvZiBhZGRpbmcgYW4g
ZW50cnkgd2l0aCBkdXBsaWNhdGUgcHJpb3JpdHkuCj4gVGhhdCB3YXkgaXQgd291bGQgbmVlZCBv
bmx5IG9uZSBsaXN0IHRyYXZlcnNhbCB1bmxlc3MgeW91IHdhbnQgdG8KPiByZWdpc3RlciB0aGUg
ZHVwbGljYXRlIGFueXdheSAodGhlbiB5b3Ugd291bGQgY2FsbCB0aGUgb2xkZXIKPiBhdG9taWNf
bm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSBhZnRlciByZXBvcnRpbmcgdGhlIGVycm9yKS4KClRo
ZSBwb2ludCBvZiB0aGlzIHBhdGNoIGlzIHRvIHdhcm4gZGV2ZWxvcGVycyBhYm91dCB0aGUgcHJv
YmxlbSB0aGF0Cm5lZWRzIHRvIGJlIGZpeGVkLiBXZSBhbHJlYWR5IGhhdmUgc3VjaCB0cm91Ymxp
bmcgZHJpdmVycyBpbiBtYWlubGluZS4KCkl0J3Mgbm90IGNyaXRpY2FsIHRvIHJlZ2lzdGVyIGRp
ZmZlcmVudCBoYW5kbGVycyB3aXRoIGEgZHVwbGljYXRlZApwcmlvcml0aWVzLCBidXQgc3VjaCBj
YXNlcyByZWFsbHkgbmVlZCB0byBiZSBjb3JyZWN0ZWQuIFdlIHNob3VsZG4ndApicmVhayB1c2Vy
cycgbWFjaGluZXMgZHVyaW5nIHRyYW5zaXRpb24gdG8gdGhlIG5ldyBBUEksIG1lYW53aGlsZQpk
ZXZlbG9wZXJzIHNob3VsZCB0YWtlIGFjdGlvbiBvZiBmaXhpbmcgdGhlaXJzIGRyaXZlcnMuCgo+
IChPciB5b3UgY291bGQgcmV0dXJuID4gMCB3aGVuIGEgZHVwbGljYXRlIGlzIHJlZ2lzdGVyZWQg
aW4KPiBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoKSBpZiB0aGUgY2FsbGVycyBhcmUg
cHJlcGFyZWQKPiBmb3IgdGhhdC4gSSBkb24ndCByZWFsbHkgbGlrZSB0aGlzIHdheSwgdGhvdWdo
LikKCkkgaGFkIGEgc2ltaWxhciB0aG91Z2h0IGF0IHNvbWUgcG9pbnQgYmVmb3JlIGFuZCBkZWNp
ZGVkIHRoYXQgSSdtIG5vdCBpbgpmYXZvciBvZiB0aGlzIGFwcHJvYWNoLiBJdCdzIG5pY2VyIHRv
IGhhdmUgYSBkZWRpY2F0ZWQgZnVuY3Rpb24gdGhhdAp2ZXJpZmllcyB0aGUgdW5pcXVlbmVzcywg
SU1PLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
