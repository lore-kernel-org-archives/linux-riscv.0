Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28172C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:28:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01D7610CA
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E01D7610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6t5YoRKEKNH/+eF2ELWzRf+CCcJ6QvbPfzOY47777M4=; b=pQs8IHVcbcuJoMeiWQLU4ktFGN
	0c1LTFKP+2UukCDJyTP7/ilpBCdYXFBL4s8lmWmW6hWBdYVXN8AUBxCJom9iOiOksGO5pKkm9DZ8/
	gK6yuoWeOmsEHW08SXEzO1sS0Pmw4iLOClOL7ugsgVthEIRdmuXWzBD5GuhMLwWnM8cGJmLAwVsVr
	jUqaa0dSJGaKgwM2bjhkfW5UaPMKikRKBiggynHUbwOFW412xJUuAvvpZHDgRPe8YH8E+JIyZ1r3v
	VOnK1HsSJ7nww4LKT3UzUt6mQfPhvC/8fe441PYzSjtOplyXLeYI2VXyMffKZddMTJqvYQpzwxsAQ
	jYvvqMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgEom-009IOk-Qg; Thu, 28 Oct 2021 23:28:20 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgEoj-009IO3-Q4; Thu, 28 Oct 2021 23:28:19 +0000
Received: by mail-lf1-x133.google.com with SMTP id x27so17000662lfu.5;
 Thu, 28 Oct 2021 16:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
 b=or9I8eXmdc6hOUu3ilMz+ymgHlGQQmwFfcjANI787MFy3461r29Qlx4Drko3A82jiZ
 /Dxbh+rXJkVd+vSmZQz7ByF21FNMWE7Msuh2tmQH7FzEaAaJykw/79BGIIrJtKwboRDm
 04V8OvO+c+XCXlI7f4QRPE7cqx6GZulezk5I+0MnmugoyzWrW9wGp3T/sQ+0YL50opsM
 PEj+17btedXyPtu3l7DUltlj+rCIDD63O2gZoZwfDEKUeboD39P9kLuxM5uqsYcKe9n/
 MuNWRD7sUlbhLEou6B/xsQNLsenMP/929SI9uvSZZXHuqFx/YvhRAZPMrz7X4+YxCerI
 /TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
 b=Ps85A51wAJZ2MeNMyH+0kDp4JGWm2RJS4/FYqYlkrWYoYW4m+IaI92irohnQ71oCMf
 PiDZ9ywuZabsskOVcByPfuC0wLxysRC07vhO6l4UK9eSKqtP0+3a/rwCqf7iNKGkO3Jq
 7RGcamqJyAsJpkl4dWJUtNivtW6AY3q121SDVEFupd8sXTQAlxUAJv4cn2B/WrHxEURV
 AjAkDAYtLaKUvHUeIGzRjyT0lclCwUGWZyoAFIyrlMjkyJSMJUo6umeHw07+YPCkLdUR
 H6um7AA6jT90VHOKT4L2554Z22M5mf6eGxVLox+S1P3J5y2G/RfwTa1wDzn+snE2V26i
 o4Vg==
X-Gm-Message-State: AOAM531uNzXC82uYUf/ZVor6Fyp4Bkyprh5DCyNoIYxxWXCuKQ/WTSZE
 TsI3riK8OtFcLPHWY4sT1dQ=
X-Google-Smtp-Source: ABdhPJwV2hV4le461ll7P/MiVtzPzva4GF7PaVejAVvhmYPc9uewsxLl7FIVcxk+rSnnrtvlDg/jfg==
X-Received: by 2002:a19:760a:: with SMTP id c10mr6627861lff.302.1635463695803; 
 Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bn3sm414682ljb.7.2021.10.28.16.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
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
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
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
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
 <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Message-ID: <8a9c4a9a-ea0d-4bc9-cf57-9bd99b211d47@gmail.com>
Date: Fri, 29 Oct 2021 02:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_162817_885058_80AE86A7 
X-CRM114-Status: GOOD (  15.19  )
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

MjkuMTAuMjAyMSAwMDozMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+PiArCS8qCj4+
PiArCSAqIFRoaXMgY29kZSBnZXRzIHVzZWQgZHVyaW5nIGJvb3QtdXAsIHdoZW4gdGFzayBzd2l0
Y2hpbmcgaXMKPj4+ICsJICogbm90IHlldCB3b3JraW5nIGFuZCBpbnRlcnJ1cHRzIG11c3QgcmVt
YWluIGRpc2FibGVkLiAgQXQKPj4gT25lIHNwYWNlIGlzIGVub3VnaC4KPiBUaGlzIGNvbW1lbnQg
aXMgcmVwbGljYXRlZCBtdWx0aXBsZSB0aW1lcyBvdmVyIHRoaXMgc291cmNlIGZpbGUuIFlvdSBj
YW4KPiBmaW5kIGl0IGJlZm9yZSBlYWNoIGRvd25fd3JpdGUoKS4gSSBib3Jyb3dlZCB0aGUgdGV4
dCBhcy1pcywgZm9yCj4gY29uc2lzdGVuY3kuCgpBY3R1YWxseSwgaXQgc2hvdWxkIGJlIGRvd25f
cmVhZCgpIGhlcmUgc2luY2UgdGhlcmUgYXJlIG5vIHdyaXRlcy4gSSdsbApjb3JyZWN0IGl0IGlu
IHYzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
