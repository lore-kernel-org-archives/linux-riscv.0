Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2673CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N7aEzlQEGEivXxnBZjy7QotlSFMqRQt+wytrUp/qUVs=; b=twJtP5c/LLlDsCG8DI5D8nVnRZ
	otAsDW9eyqgDPQ2RsNj53EYmTnfFkMzg82lNQ2Z34aZT55S2wHE6SSRTYxDp/CNJHkGR3q8DNAvmt
	Gwyy9ZHSlhZfwwm5u7zll4bEGdnYtdzXmyU8s6AWNrgKkBEp10pcmx+SYvAEsGuaomKp3ofxmsLjr
	mFD1aMEY7slGvFtN22+tjDLgXMtlhb+oJivZJzT9ZpG5eGiOdbSzoqKB/ShV6YV4y52MC/2KvutQ5
	xwVZFPNGCoTfKt+G131i11L4yLJK2r7+PG9MpROFD6uQOsS/4YuZMt1fCBZZxEEOhKrDsy+BHKWQg
	Q9rtcg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrRLQ-00Gge7-QY; Sun, 28 Nov 2021 21:04:20 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrRLN-00GgcO-Rv; Sun, 28 Nov 2021 21:04:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id d11so30552888ljg.8;
 Sun, 28 Nov 2021 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
 b=D7axuJW5K4soTW7ePg2XEY/iNxftObXK2r+AyGGcLpSZUVVVDeOdARXPvJKsrnTiWz
 AoAXcXPY5kZDAFmNd2VORgyu8fNJK2h3Akf7Z4wOIV4j7hl4k+Lg94oWKvPyZvxvLsrU
 gHjqykqz9pVTUOOpARf13AebW7syYSoupun9EMn0XvrUZckKr/LqJa+4eSWKEzDWJLdo
 K7OPzWs09+Av5yHcfZj3Q7MZQ+BDltCGiVFFVwhBt7T15YiSiT0WAJ3uiNnPq9pF4dyU
 I8pWXsXnC3XNCL+7zY4D1T6JR7EW9moTsiVuNSfEmpW1ojxHFbjsYoYQXbcJq5XV5+Um
 iPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
 b=i5Oi0/63FecyiiKx7UtwrwvX9UhHEFUJvwv/UG4Ii6SYLTXbmmwwVINaXbRQ+2UWOX
 3zWW7NXzpTVglEC5ew5Usq2fTLImBR+4a4kuiUVrFJUkzSSg+fDY3gHhD6j8KNTZVKkF
 p1ikDA7ohlU8GjWaUaOG3AtO9lRYT4G7mFGgmVfNP0+1V98cGLO2KAl+cLQSHdLf3aly
 kyfV/BzA9HNJ8Y4BcvvZHRIzIu1vxszx854rwmKrCeXatoeFQa2VzXI/NvQouYywW5AY
 v+9qQBs5Z5alMQ1V9MCgNeQfA+/Ls8qLpFy2NZKoA0m/K+flX+kp5iKTU02q4hk8BBq7
 7hsA==
X-Gm-Message-State: AOAM530HRB5V1lwFE5y40gjnATvoj0sS7jrg76AX+HS+igLq3sAE+u2e
 k+sb7z4eaJxo6Tgh3YHvkoM=
X-Google-Smtp-Source: ABdhPJxH7knkFdz7TFpFlawyIdB41srtPJMqsrOfzCPJDLK6AlWk3m8N6okcECoeJRZyDtP9PR9VhQ==
X-Received: by 2002:a05:651c:1257:: with SMTP id
 h23mr44458754ljh.17.1638133451873; 
 Sun, 28 Nov 2021 13:04:11 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c17sm1100736lfr.235.2021.11.28.13.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:11 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
Date: Mon, 29 Nov 2021 00:04:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_130417_934983_065ACE16 
X-CRM114-Status: GOOD (  23.12  )
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

MjguMTEuMjAyMSAwMzo0MywgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0NFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IFNvQyBwbGF0Zm9ybXMgb2Z0ZW4gaGF2ZSBtdWx0aXBsZSB3YXlzIG9mIGhvdyB0byBwZXJm
b3JtIHN5c3RlbSdzCj4+IHBvd2VyLW9mZiBhbmQgcmVzdGFydCBvcGVyYXRpb25zLiBNZWFud2hp
bGUgdG9kYXkncyBrZXJuZWwgaXMgbGltaXRlZCB0bwo+PiBhIHNpbmdsZSBvcHRpb24uIEFkZCBj
b21iaW5lZCBwb3dlci1vZmYrcmVzdGFydCBoYW5kbGVyIGNhbGwgY2hhaW4gQVBJLAo+PiB3aGlj
aCBpcyBpbnNwaXJlZCBieSB0aGUgcmVzdGFydCBBUEkuIFRoZSBuZXcgQVBJIHByb3ZpZGVzIGJv
dGggcG93ZXItb2ZmCj4+IGFuZCByZXN0YXJ0IGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IFRoZSBvbGQg
cG1fcG93ZXJfb2ZmIG1ldGhvZCB3aWxsIGJlIGtlcHQgYXJvdW5kIHRpbGwgYWxsIHVzZXJzIGFy
ZQo+PiBjb252ZXJ0ZWQgdG8gdGhlIG5ldyBBUEkuCj4+Cj4+IEN1cnJlbnQgcmVzdGFydCBBUEkg
d2lsbCBiZSByZXBsYWNlZCBieSB0aGUgbmV3IHVuaWZpZWQgQVBJIHNpbmNlCj4+IG5ldyBBUEkg
aXMgaXRzIHN1cGVyc2V0LiBUaGUgcmVzdGFydCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBzeXMtb2Zm
IGhhbmRsZXIKPj4gQVBJIGlzIGJ1aWx0IHVwb24gdGhlIGV4aXN0aW5nIHJlc3RhcnQtbm90aWZp
ZXIgQVBJcy4KPj4KPj4gSW4gb3JkZXIgdG8gZWFzZSBjb252ZXJzaW9uIHRvIHRoZSBuZXcgQVBJ
LCBjb252ZW5pZW50IGhlbHBlcnMgYXJlIGFkZGVkCj4+IGZvciB0aGUgY29tbW9uIHVzZS1jYXNl
cy4gVGhleSB3aWxsIHJlZHVjZSBhbW91bnQgb2YgYm9pbGVycGxhdGUgY29kZSBhbmQKPj4gcmVt
b3ZlIGdsb2JhbCB2YXJpYWJsZXMuIFRoZXNlIGhlbHBlcnMgcHJlc2VydmUgb2xkIGJlaGF2aW91
ciBmb3IgY2FzZXMKPj4gd2hlcmUgb25seSBvbmUgcG93ZXItb2ZmIGhhbmRsZXIgaXMgZXhwZWN0
ZWQsIHRoaXMgaXMgd2hhdCBhbGwgZXhpc3RpbmcKPj4gZHJpdmVycyB3YW50LCBhbmQgdGh1cywg
dGhleSBjb3VsZCBiZSBlYXNpbHkgY29udmVydGVkIHRvIHRoZSBuZXcgQVBJLgo+PiBVc2VycyBv
ZiB0aGUgbmV3IEFQSSBzaG91bGQgZXhwbGljaXRseSBlbmFibGUgcG93ZXItb2ZmIGNoYWluaW5n
IGJ5Cj4+IHNldHRpbmcgY29ycmVzcG9uZGluZyBmbGFnIG9mIHRoZSBwb3dlcl9oYW5kbGVyIHN0
cnVjdHVyZS4KPiBbLi4uXQo+IAo+IEhpLAo+IAo+IEEgZ2VuZXJhbCBxdWVzdGlvbjogZG8gd2Ug
cmVhbGx5IG5lZWQgdGhyZWUgZGlzdGluY3QgY2hhaW5zIGZvciB0aGlzPwoKSGVsbG8gTWljaGHF
giwKCkF0IG1pbmltdW0gdGhpcyBtYWtlcyBjb2RlIGVhc2llciB0byBmb2xsb3cuCgo+IENhbid0
IHRoZXJlIGJlIG9ubHkgb25lIHRoYXQgY2hhaW4gb2YgY2FsbGJhY2tzIHRoYXQgZ2V0IGEgc3Rh
Z2UKPiAoUkVTVEFSVF9QUkVQQVJFLCBSRVNUQVJULCBQT1dFUl9PRkZfUFJFUEFSRSwgUE9XRVJf
T0ZGKSBhbmQgY2FuIGlnbm9yZQo+IHRoZW0gYXQgd2lsbD8gQ2FsbGluZyB0aHJvdWdoIFBPV0VS
X09GRl9QUkVQQVJFIHdvdWxkIGFsc28gcmV0dXJuCj4gd2hldGhlciB0aGF0IFBPV0VSX09GRiBp
cyBwb3NzaWJsZSAoZm9yIGtlcm5lbF9jYW5fcG93ZXJfb2ZmKCkpLgoKSSdtIGhhdmluZyB0cm91
YmxlIHdpdGggcGFyc2luZyB0aGlzIGNvbW1lbnQuIENvdWxkIHlvdSBwbGVhc2UgdHJ5IHRvCnJl
cGhyYXNlIGl0PyBJIGRvbid0IHNlZSBob3cgeW91IGNvdWxkIGNoZWNrIHdoZXRoZXIgcG93ZXIt
b2ZmIGhhbmRsZXIKaXMgYXZhaWxhYmxlIGlmIHlvdSdsbCBtaXggYWxsIGhhbmRsZXJzIHRvZ2V0
aGVyLgoKPiBJIHdvdWxkIGFsc28gc3BsaXQgdGhpcyBwYXRjaCBpbnRvIHByZXBhcmF0aW9uIGNs
ZWFudXBzIChsaWtlIHdyYXBwaW5nCj4gcG1fcG93ZXJfb2ZmIGNhbGwgd2l0aCBhIGZ1bmN0aW9u
KSBhbmQgYWRkaW5nIHRoZSBub3RpZmllci1iYXNlZAo+IGltcGxlbWVudGF0aW9uLgoKV2hhdCdz
IHRoZSBiZW5lZml0IG9mIHRoaXMgc3BsaXQgdXAgd2lsbCBiZT8gQXJlIHlvdSBzdWdnZXN0aW5n
IHRoYXQgaXQKd2lsbCBlYXNlIHJldmlld2luZyBvZiB0aGlzIHBhdGNoIG9yIHNvbWV0aGluZyBl
bHNlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
