Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D5C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C3nZ9JKqoJ0lnPH+qNVMmU4sG8O6BuwFO8kd4thtctQ=; b=iZokHWVNmdhVEdhyO3LYyMYDTn
	l/SSqvHh9unJUdsPnaObAkA/oS4n14208QSrbCUmeEcyX/B9kRLDacc/Pq9Y4YZ5iaC8EoK0xDCXo
	UIGFGWh+8dntHPD/ZsYFK3ZVg1QgmLFo3e3rT0o2twblOTRli19OoYET+ktWYwUC017qNJWhzwycR
	2UVVdWRGyBGdvkD0Wq/UQ9LKkr+ef8l9NquAoqo4cbvWXqXryT5VZbr24bpioGEhU7BmnB8dG/3Gb
	+kePMmagLW+CD21KrWSbRBKcFeaK7ieCtstqYvAat50EWJGA/TMRXdcSpWHNXuiRaJoewu/UA5l3l
	deW2eeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrROB-00GhOO-ID; Sun, 28 Nov 2021 21:07:11 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrRO8-00GhN2-So; Sun, 28 Nov 2021 21:07:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bu18so39382273lfb.0;
 Sun, 28 Nov 2021 13:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
 b=MXJpk4bHJWHUsXnttmXJmMehCMhy9keZTcA7B/bYgzynu+fs9AEzA0zWS1didKGcXM
 ufZY1nIVOAfP0n1FcIj/YQO+JHOspxllH7lEwqxum4orCJ0HB2fsnMEDGJmWeH/qyrsf
 tBfKAbmns7/1QIwfCwYfnwageJ9+iaZP7wrA89IK5FuGsmtz3WgnEbf4CfOtVYKh+y1P
 P/ivsGXGLfJ8qk+PLiIxuT1vyrHF2S+SyEG3Jc+cuHLep64IrIJ92EMzFal/KsyKC+gQ
 ETMGdua/dzs6IwN9uDl7VCnKUva5ihWYK7VOkSKYM4fVdcc0cO/WridgO5+laEgsd2tU
 tz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
 b=eOhLdN6XY8YPLAFik74hyPyJq2TPR9VkU1KB6MlUnmy5cqvnH8hEPs6x4mO7DbESzu
 XdT3yIecPmPj4R7V6oIA5ZrPn+5IX1PikEBEQNA9+sjM/HAlXX6C9l4YDFRirOekwvYW
 J3Y3LxmXIoZlW3TiF/AjliiVRNPy65vNtdDT+J2VGEtQNv3Damc06oTzUYBu6x3ksLrr
 nFW2u5L5nJzWhGTuYgtgF0fn6V+mNKRiouzsazmRbvZ6lglAwQ8UDr3cOJJ+FtL4cIU0
 pRa0n5lBiqOuLvjLRt5OwPqBfd8TacaYNYztiBae1z6eeLMrv8GmENN2hQkMkqCYqEUg
 3dTA==
X-Gm-Message-State: AOAM530g4ugxPE0xWSJcYSxsytxricvBpoYtAg6HHgrVDj7kdIBbV9CW
 maM21ibhvZu/FXmhGiN9KZw=
X-Google-Smtp-Source: ABdhPJy4zl/AZzFPwJNVkHu3GSDT6aqXWQbZeWCJLgVwlcbzfRDN23rTDTUYoWjDb/oPahZVEVnA9Q==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr43385851lfi.686.1638133626682; 
 Sun, 28 Nov 2021 13:07:06 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id s13sm1104272lfg.126.2021.11.28.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:07:06 -0800 (PST)
Subject: Re: [PATCH v4 18/25] x86: Use do_kernel_power_off()
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
 <20211126180101.27818-19-digetx@gmail.com> <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3082ba7a-f8f6-b2d9-5ae3-ec639b1a6bee@gmail.com>
Date: Mon, 29 Nov 2021 00:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_130708_956066_1A0A5A74 
X-CRM114-Status: GOOD (  22.88  )
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

MjguMTEuMjAyMSAwNDoxNSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCAwOTowMDo1NFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IEtlcm5lbCBub3cgc3VwcG9ydHMgY2hhaW5lZCBwb3dlci1vZmYgaGFuZGxlcnMuIFVzZSBk
b19rZXJuZWxfcG93ZXJfb2ZmKCkKPj4gdGhhdCBpbnZva2VzIGNoYWluZWQgcG93ZXItb2ZmIGhh
bmRsZXJzLiBJdCBhbHNvIGludm9rZXMgbGVnYWN5Cj4+IHBtX3Bvd2VyX29mZigpIGZvciBub3cs
IHdoaWNoIHdpbGwgYmUgcmVtb3ZlZCBvbmNlIGFsbCBkcml2ZXJzIHdpbGwKPj4gYmUgY29udmVy
dGVkIHRvIHRoZSBuZXcgcG93ZXItb2ZmIEFQSS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGFyY2gveDg2L2tlcm5lbC9y
ZWJvb3QuYyB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9yZWJvb3QuYyBi
L2FyY2gveDg2L2tlcm5lbC9yZWJvb3QuYwo+PiBpbmRleCAwYTQwZGY2NmE0MGQuLmNkN2Q5NDE2
ZDgxYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYva2VybmVsL3JlYm9vdC5jCj4+ICsrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9yZWJvb3QuYwo+PiBAQCAtNzQ3LDEwICs3NDcsMTAgQEAgc3RhdGljIHZv
aWQgbmF0aXZlX21hY2hpbmVfaGFsdCh2b2lkKQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBuYXRpdmVf
bWFjaGluZV9wb3dlcl9vZmYodm9pZCkKPj4gIHsKPj4gLQlpZiAocG1fcG93ZXJfb2ZmKSB7Cj4+
ICsJaWYgKGtlcm5lbF9jYW5fcG93ZXJfb2ZmKCkpIHsKPj4gIAkJaWYgKCFyZWJvb3RfZm9yY2Up
Cj4+ICAJCQltYWNoaW5lX3NodXRkb3duKCk7Cj4+IC0JCXBtX3Bvd2VyX29mZigpOwo+PiArCQlk
b19rZXJuZWxfcG93ZXJfb2ZmKCk7Cj4+ICAJfQo+IAo+IEp1ZGdpbmcgZnJvbSBhbiBvbGQgY29t
bWl0IGZyb20gMjAwNiBbMV0sIHRoaXMgY2FuIGJlIHJld3JpdHRlbiBhczoKPiAKPiBpZiAoIXJl
Ym9vdF9mb3JjZSAmJiBrZXJuZWxfY2FuX3Bvd2VyX29mZigpKQo+IAltYWNoaW5lX3NodXRkb3du
KCk7Cj4gZG9fa2VybmVsX3Bvd2VyX29mZigpOwo+IAo+IEFuZCBtYXliZSBsYXRlciByZXdvcmtl
ZCBzbyBpdCBkb2Vzbid0IG5lZWQga2VybmVsX2Nhbl9wb3dlcl9vZmYoKS4KPiAKPiBbMV0gaHR0
cDovL2xrbWwuaXUuZWR1L2h5cGVybWFpbC8vbGludXgva2VybmVsLzA1MTEuMy8wNjgxLmh0bWwK
Ckl0IGNvdWxkIGJlIHJld3JpdHRlbiBsaWtlIHlvdSdyZSBzdWdnZXN0aW5nLCBidXQgSSdkIHBy
ZWZlciB0byBrZWVwIHRoZQpvbGQgdmFyaWFudCwgZm9yIGNsYXJpdHkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
