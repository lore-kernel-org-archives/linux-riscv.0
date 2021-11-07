Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4376BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:17:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3F560EBD
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB3F560EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UAg/B21DW1O3reRRnIvJcmHfC0HF9YGfGpUqHF50PaI=; b=aCsN6XE/89Dac1S9hc5H8854Kn
	vYWOkRva7sgkhzm9JJZcSzF3qK2L3YiBt5EEDVY6XAMCycmDqNaHi4axLeRBxezgzH9ziDw4m1uwR
	rLNf6x3UsSgaNqfEnYZzLHHGfuB8GQvAPIuey2pWyHXxMSrkB01FuaxJD0dxGUn7/7qg4X0QEmYX1
	JqIyPVtoWMTeTfkO1DBOqcU18WZ7WVWwR8rROKbyJJ8jDcxsXG14qLmUts4yrWvsTlqqvV98pQaKL
	7GHUCcJUH3TR3NRXc6X4FvleI1hrpMljyzV9z40vPGtp/GuKY3PhQD4YUypyZ08zyDzWTLGnRxRPl
	R2AWHs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjlmk-00EdCF-Nl; Sun, 07 Nov 2021 17:16:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjlmi-00EdBS-E3; Sun, 07 Nov 2021 17:16:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id d11so3674332ljg.8;
 Sun, 07 Nov 2021 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jV9RGgGqsoNpHnAdElYoxsETzdtFTgnoU+evNHPJvgw=;
 b=XcS1vFi7jvcKKMU+Vh16iv2r+zEgY2qHFwfEvUkTbUqhYfGd/aHwUSSPvlkmYZnUDY
 yKyQ/S1MODqE5UdkEERTRM+mtxI1gBtYC+YHMFR0Q7VUSP941Fv1rRNweTBgkgPsVjOi
 /VhimMLC6erylFfqa93dW9OuY6rPJeGZgNEfAStOSIcxbKlGE8kYSWtur2agIS+KxZBT
 uxw/ElMwoYX/SIJQ69spejui0ImHzrQg/eO3RQFc7ylvx2K4v5e4KD8cBjKF0cCi6jz/
 kU0RJ2R+nsOSEtcz9pzFEbzI1pboWLlqc1bt4/UyILzUL1onLEjZ1y8wuTJEXkf/BE4p
 Mk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jV9RGgGqsoNpHnAdElYoxsETzdtFTgnoU+evNHPJvgw=;
 b=ZS2ZAzJ9+UPfLB7WSR+Qzy0D8XQrhBNNdqZmIIL3fcdDGWJhOzhcyKlhqxd+Wc5sxW
 Q8cKC3W2cLmGwYn3qInN43Bhte933MGAMxFzbHIbHSgrjuzZnzR8fwwHqzAJT/jjov38
 n3OKK5jPCIGiXUcu+BI7kDecim7j2avQOqj0NhCcow38wvGtb6U6eTMa+4IrGu2KOki3
 eU8u2JljnveVMxhgmxz5GfvTX0SDp12GRY0t5gpingYlHLBSPkw4c0Yuqp1kX7fc+xWZ
 KNXl3G6ePWfri69aGZ2/Bl9k7FaIy2TArlwBFQn+yLx+YCIapDzOl/EMQuBBDa4RUZEz
 bAOA==
X-Gm-Message-State: AOAM530YSCMXqUUNmL5FlAh7pXM+AY1EOak6iXf4I3RqYk7QavfSfrew
 LvyhNNfPVgny0xW/lCREGmxhau+8foo=
X-Google-Smtp-Source: ABdhPJxvgxAU8oisB10upx88enZ2ZbX58EuDflf4IdQYDWaIcA3t9DPLAVkvy85p5EpHAL+e+Eae8Q==
X-Received: by 2002:a2e:92c4:: with SMTP id k4mr61687714ljh.271.1636305406651; 
 Sun, 07 Nov 2021 09:16:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id h14sm1531135lfv.83.2021.11.07.09.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:16:46 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
Date: Sun, 7 Nov 2021 20:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_091648_549840_4A012261 
X-CRM114-Status: GOOD (  20.75  )
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

MDcuMTEuMjAyMSAyMDowOCwgR3VlbnRlciBSb2VjayDQv9C40YjQtdGCOgo+IE9uIDExLzcvMjEg
ODo1MyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwNi4xMS4yMDIxIDIzOjU0LCBKb25h
dGhhbiBOZXVzY2jDpGZlciDQv9C40YjQtdGCOgo+Pj4gSGksCj4+Pgo+Pj4gT24gVGh1LCBPY3Qg
MjgsIDIwMjEgYXQgMTI6MTY6NTdBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+
IFVzZSBkZXZtX3JlZ2lzdGVyX3Bvd2VyX2hhbmRsZXIoKSB0aGF0IHJlcGxhY2VzIGdsb2JhbCBw
bV9wb3dlcl9vZmYKPj4+PiB2YXJpYWJsZSBhbmQgYWxsb3dzIHRvIHJlZ2lzdGVyIG11bHRpcGxl
IHBvd2VyLW9mZiBoYW5kbGVycy4gSXQgYWxzbwo+Pj4+IHByb3ZpZGVzIHJlc3RhcnQtaGFuZGxl
ciBzdXBwb3J0LCBpLmUuIGFsbCBpbiBvbmUgQVBJLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
RG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4KPj4+IFdoZW4g
SSBib290IHdpdGggKG1vc3Qgb2YpIHRoaXMgcGF0Y2hzZXQgYXBwbGllZCwgSSBnZXQgdGhlIHdh
cm5pbmcgYXQKPj4+IGtlcm5lbC9yZWJvb3QuYzoxODc6Cj4+Pgo+Pj4gwqDCoMKgwqAvKgo+Pj4g
wqDCoMKgwqAgKiBIYW5kbGVyIG11c3QgaGF2ZSB1bmlxdWUgcHJpb3JpdHkuIE90aGVyd2lzZSBj
YWxsIG9yZGVyIGlzCj4+PiDCoMKgwqDCoCAqIGRldGVybWluZWQgYnkgcmVnaXN0cmF0aW9uIG9y
ZGVyLCB3aGljaCBpcyB1bnJlbGlhYmxlLgo+Pj4gwqDCoMKgwqAgKi8KPj4+IMKgwqDCoMKgV0FS
Tl9PTighYXRvbWljX25vdGlmaWVyX2hhc191bmlxdWVfcHJpb3JpdHkoJnJlc3RhcnRfaGFuZGxl
cl9saXN0LAo+Pj4gbmIpKTsKPj4+Cj4+PiBBcyB0aGUgTlRYRUMgZHJpdmVyIGRvZXNuJ3Qgc3Bl
Y2lmeSBhIHByaW9yaXR5LCBJIHRoaW5rIHRoaXMgaXMgYW4gaXNzdWUKPj4+IHRvIGJlIGZpeGVk
IGVsc2V3aGVyZS4KPj4+Cj4+PiBPdGhlciB0aGFuIHRoYXQsIGl0IHdvcmtzIGFuZCBsb29rcyBn
b29kLCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4KPj4+Cj4+Pgo+Pj4gRm9yIHRoaXMgcGF0Y2g6Cj4+
Pgo+Pj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdt
eC5uZXQ+Cj4+PiBUZXN0ZWQtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Cj4+Cj4+IFRoYW5rIHlvdS4gWW91IGhhdmUgY29uZmxpY3RpbmcgcmVzdGFydCBo
YW5kbGVycywgYXBwYXJlbnRseSBOVFhFQwo+PiBkcml2ZXIgc2hvdWxkIGhhdmUgaGlnaGVyIHBy
aW9yaXR5IHRoYW4gdGhlIHdhdGNoZG9nIGRyaXZlci4gSXQgc2hvdWxkCj4+IGJlIGEgY29tbW9u
IHByb2JsZW0gZm9yIHRoZSB3YXRjaGRvZyBkcml2ZXJzLCBJIHdpbGwgbG93ZXIgd2F0Y2hkb2cn
cwo+PiBkZWZhdWx0IHByaW9yaXR5IHRvIGZpeCBpdC4KPj4KPiAKPiBUaGUgd2F0Y2hkb2cgc3Vi
c3lzdGVtIGFscmVhZHkgdXNlcyAiMCIgYXMgZGVmYXVsdCBwcmlvcml0eSwgd2hpY2ggd2FzCj4g
aW50ZW5kZWQgYXMgcHJpb3JpdHkgb2YgbGFzdCByZXNvcnQgZm9yIHJlc3RhcnQgaGFuZGxlcnMu
IEkgZG8gbm90IHNlZQo+IGEgcmVhc29uIHRvIGNoYW5nZSB0aGF0LgoKUmlnaHQsIEkgbWVhbnQg
dGhhdCB3YXRjaGRvZyBkcml2ZXJzIHdoaWNoIHVzZSByZXN0YXJ0IGhhbmRsZXIgc2V0IHRoZQps
ZXZlbCB0byB0aGUgZGVmYXVsdCAxMjggWzFdLiBBbHRob3VnaCwgbWF5YmUgaXQncyBhIHByb2Js
ZW0gb25seSBmb3IKaS5NWCBkcml2ZXJzIGluIHByYWN0aWNlLCBJJ2xsIHRha2UgYSBjbG9zZXIg
bG9vayBhdCB0aGUgb3RoZXIgZHJpdmVycy4KClsxXQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYyNMMzE4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
