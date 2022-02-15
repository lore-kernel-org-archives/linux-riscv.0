Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8216DC4167E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:To:References:Cc:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyrGvLnlkIZpPOswHjIsi7xWaprAeOOa6C2Os4bAjQQ=; b=m70Vh/soulnYBB
	La3JFcKs864z2J2rBhDvk/nL92CTE3WxUS16sw4BQ34ZhfbE43F92RhOU822bYpNdRBVkWbiRfQpn
	BWaDIE9fW5CSEQ4gBarZYGzcenEF3lTTSmtONtyFJtBJvJ1lvFqnoGFnrPWk6tyuprtzmIYVrnQTR
	Y1iduxC7f4EqLfKCVRQLZlaLlaD/PowNM2fqSQbC0RK8Zxb76M3bko8hJu7bxvzruTCCrvqoOwhJw
	sHBys9GmFKFS/iwlrCfoKSTj2d2H38dEziZJ8tO9/Rf27TdOet6ILDiGSKAlWKEfLvOV0ynLl5lR1
	2qR2rhemC5Y3OmydoSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK5sH-004ksK-Bl; Tue, 15 Feb 2022 22:00:41 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK5sE-004kro-Gm
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 22:00:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b11so165785lfb.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 14:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:cc:references:to:in-reply-to:content-transfer-encoding;
 bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
 b=eAbTUd8SWrkduWMDvYSL9PCIMvTyx1/PDNq+g34U5a6HTO/JfyDazuc/276Sm7ld7f
 RQAUjz9KnJpaex/eozKDcsnVqqRwA5Fj5CSlNJHiQfzBkJVLCc7y3vw02lxihPY3TExU
 lYcUYoYFkQWAG/XD2qnNsvTl5P4zqH6pcaasqRB1LojAt2IN4Q9BVX82FHrNStE8wYB4
 mmhCvKeDI7YjVSy4dXfgCBsx8WWHAoaLNoouUIXdBuim6buHAqSq3/5veKqw8hxrEwEf
 aYlaoKh86/GFDdT8ghhsvoX3tr735feUL8boUX68tZ9vbfpFMdKPrE/wFw8zC0NNEmPZ
 ssKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:cc:references:to:in-reply-to
 :content-transfer-encoding;
 bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
 b=Tar0fhXGB5GTOBY69m5BcDw0WWYjw4jrDOi1ssZ9aJaWnMoG5EBDDb8mgBe4gPDme6
 +W754BMFZJt5G7N8eOJyXflkIzBWRVQtexSfB/v9jqsGtZMjEoYJE8Xpb8/2uIxpHjCr
 +nB+q4Si2cwqyaU1yIA57qYfQkGBf+eyJMSoEOCtvckpntFceS5gASnuQk+o/kXJkqoZ
 5iTaaxCegYjXEpJHbyLWcr3pND9W0i9mFNeuglWDYJzJ7x8ejj3yYy8gIK6towM0kCxr
 DBkEb9Kslw7kRzuAg/MH36zVh4Zl+RP5ToIzEEnpFn0OnfLkRPinesrGwmzmoq0zwOhj
 d68w==
X-Gm-Message-State: AOAM531XFhunGlN+TLvZMP7+tnDjfA1X1XOHkSwzNPTjvqkmImOOl/Be
 Ea8rs5rB53I6xqvZLelsTHs=
X-Google-Smtp-Source: ABdhPJyJtWqeT1e2wzvijosINOm/qc6wwzWUL/FDa9uqhHR32CJOoO1KF1UaVLhHtHEQQhQBEaQuLQ==
X-Received: by 2002:a05:6512:96d:: with SMTP id
 v13mr790998lft.343.1644962435902; 
 Tue, 15 Feb 2022 14:00:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id k3sm66075lfo.10.2022.02.15.14.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 14:00:35 -0800 (PST)
Message-ID: <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
Date: Wed, 16 Feb 2022 01:00:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220130233718.21544-1-digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_140038_597916_2D16C6C8 
X-CRM114-Status: GOOD (  18.63  )
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

MzEuMDEuMjAyMiAwMjozNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gUHJvYmxlbQo+
IC0tLS0tLS0KPiAKPiBTb0MgZGV2aWNlcyByZXF1aXJlIHBvd2VyLW9mZiBjYWxsIGNoYWluaW5n
IGZ1bmN0aW9uYWxpdHkgZnJvbSBrZXJuZWwuCj4gV2UgaGF2ZSBhIHdpZGVseSB1c2VkIHJlc3Rh
cnQgY2hhaW5pbmcgcHJvdmlkZWQgYnkgcmVzdGFydCBub3RpZmllciBBUEksCj4gYnV0IG5vdGhp
bmcgZm9yIHBvd2VyLW9mZi4KPiAKPiBTb2x1dGlvbgo+IC0tLS0tLS0tCj4gCj4gSW50cm9kdWNl
IG5ldyBBUEkgdGhhdCBwcm92aWRlcyBib3RoIHJlc3RhcnQgYW5kIHBvd2VyLW9mZiBjYWxsIGNo
YWlucy4KPiAKPiBXaHkgY29tYmluZSByZXN0YXJ0IHdpdGggcG93ZXItb2ZmPyBCZWNhdXNlIGRy
aXZlcnMgb2Z0ZW4gZG8gYm90aC4KPiBNb3JlIHByYWN0aWNhbCB0byBoYXZlIEFQSSB0aGF0IHBy
b3ZpZGVzIGJvdGggdW5kZXIgdGhlIHNhbWUgcm9vZi4KPiAKPiBUaGUgbmV3IEFQSSBpcyBkZXNp
Z25lZCB3aXRoIHNpbXBsaWNpdHkgYW5kIGV4dGVuc2liaWxpdHkgaW4gbWluZC4KPiBJdCdzIGJ1
aWx0IHVwb24gdGhlIGV4aXN0aW5nIHJlc3RhcnQgYW5kIHJlYm9vdCBBUElzLiBUaGUgc2ltcGxp
Y2l0eQo+IGlzIGluIG5ldyBoZWxwZXIgZnVuY3Rpb25zIHRoYXQgYXJlIGNvbnZlbmllbnQgZm9y
IGRyaXZlcnMuIFRoZQo+IGV4dGVuc2liaWxpdHkgaXMgaW4gdGhlIGRlc2lnbiB0aGF0IGRvZXNu
J3QgaGFyZGNvZGUgY2FsbGJhY2sKPiBhcmd1bWVudHMsIG1ha2luZyBlYXN5IHRvIGFkZCBuZXcg
cGFyYW1ldGVycyBhbmQgcmVtb3ZlIG9sZC4KPiAKPiBUaGlzIGlzIGEgdGhpcmQgYXR0ZW1wdCB0
byBpbnRyb2R1Y2UgdGhlIG5ldyBBUEkuIEZpcnN0IHdhcyBtYWRlIGJ5Cj4gR3VlbnRlciBSb2Vj
ayBiYWNrIGluIDIwMTQsIHNlY29uZCB3YXMgbWFkZSBieSBUaGllcnJ5IFJlZGluZyBpbiAyMDE3
Lgo+IEluIGZhY3QgdGhlIHdvcmsgZGlkbid0IHN0b3AgYW5kIHJlY2VudGx5IGFybV9wbV9yZXN0
YXJ0KCkgd2FzIHJlbW92ZWQKPiBmcm9tIHY1LjE0IGtlcm5lbCwgd2hpY2ggd2FzIGEgcGFydCBv
ZiBwcmVwYXJhdG9yeSB3b3JrIHN0YXJ0ZWQgYnkKPiBHdWVudGVyIFJvZWNrLiBJIHRvb2sgaW50
byBhY2NvdW50IGV4cGVyaWVuY2UgYW5kIGlkZWFzIGZyb20gdGhlCj4gcHJldmlvdXMgYXR0ZW1w
dHMsIGV4dGVuZGVkIGFuZCBwb2xpc2hlZCB0aGVtLgoKClJhZmFlbCBhbmQgYWxsLCBkbyB5b3Ug
c2VlIGFueXRoaW5nIGNyaXRpY2FsIHRoYXQgbmVlZHMgdG8gYmUgaW1wcm92ZWQKaW4gdGhpcyB2
Nj8KCldpbGwgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIHRha2UgdGhpcyBwYXRjaHNldCB2aWEgdGhl
IHBvd2VyIHRyZWUgaWYgaXQKbG9va3Mgb2theSwgb3IgZ2l2ZSBhbiBhY2suCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
