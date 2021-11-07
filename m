Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C05C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C655613A2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C655613A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OY5Uj9HJsTaibBL2mMuUo/FjnS2lAyym6Md8MGxdMYs=; b=chqEGEdCz3Bq6eYDAPJeLd7gqW
	bleuDv1+0gCt8+19SZ9Vr+5zkUvDereroH2fqS9IF+5REdHOsFzQWksCOfsDJAA3l+dfD7YurPcSn
	a9mmYr3z3FEGT74bfWLZDHXsTWfH5GLB8irVpW/wKpacNCq27LevVBUJuT9WD7ePPJNGp8Lvc5ur7
	E3BN7jlkOz+tRRdjwIZ9QYFNLRsDA+/yvpaIOZv85qmDK5u4HvkpOV9NJ8DJQxhqQAQhyrFC1dehL
	DpkCh8j2NymqYDiAAcCdIVJLLCqtC37U038FpxMcB5xZ7c/NtugEKblnmnAFPwTRBn3jlbda350Br
	Zkhm1tWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjmBm-00EeKm-7O; Sun, 07 Nov 2021 17:42:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjmBj-00EeK6-6K; Sun, 07 Nov 2021 17:42:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id l22so4161477lfg.7;
 Sun, 07 Nov 2021 09:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yp6jZ6b/7UxZJRYtTwXk1ZheTwTRVWw2YizZoWEGBFY=;
 b=Kz4LsYWHF1VLAkkHNhWuY0M4e42sK4F6sbepl/m1LlUZc7d3ve0+PCaFGV/EW5J0Qp
 q3gOw3u9HDrcvbcy0ihsCdfp4jZucUbKQSHRkLa1MP7e5ywuxBNTRkBRVQjdXS9WYB4a
 75JZ2tni2XNEB9cE2UtRo1WCAu8alZQtGLiKAGmbi/fYYSN/XzQ2AMB855RVvlrPgYwR
 rhnxfzYw0xMwDEQtzpN4vSGSTSGsur7/4vd8RZnKhOdoVQg9OK2TefhJzCLnTq9oEqOU
 +An3rMVrqt5asX/Z17ZvVIT93/IFfnrUb7jTwuCOBo+NhYvWwEU+N1HBtnKoiVp4DFnC
 c3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yp6jZ6b/7UxZJRYtTwXk1ZheTwTRVWw2YizZoWEGBFY=;
 b=uDAhIHM8zODEailuJenDkleMVULxveLmDSL2nEdDu5Ca19VAzt6smQu8VTuqvchj+E
 4Dkr3CUSvQyndheB/G/+Mm85CWDw10SqvaWczPPgtGych4DUnm9NMDoXhdEsBzQgLcOI
 JXqrLNWSEMqwD4g5PJeAHRbNSYqktom7zkz39pmPIBHl2VaNCR2rHksF1rwIUAtTUcQg
 Hzx2U2JrM/pRNZS9bQCdnrzG7qr5moebsWiEZPp6rJ+q3W0k/RZ/OE9TguShx8BviLTP
 QOUnWpW2bf7eqUNsm/h0DDaEQZEkcakfd7beXfcclXVhYcQLWt4LfpbLKrphDSCptwea
 pBNQ==
X-Gm-Message-State: AOAM5314kNT1RejKHbV8mKsE/KThs6yqrgvaN5dHD7ePudherOhBD1yX
 GEz79zP8uH8zf2Motrj1M3c=
X-Google-Smtp-Source: ABdhPJxbnSyAP7uVMoABCneWUE/0znULgGMoNtn8dVGgMW1HOHcNNIL0n14F/iW1e4ue0spHO1DEGA==
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr18358331lfk.527.1636306956359; 
 Sun, 07 Nov 2021 09:42:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id o1sm1351686ljg.130.2021.11.07.09.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:42:35 -0800 (PST)
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
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com>
Date: Sun, 7 Nov 2021 20:42:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_094239_247161_899B124D 
X-CRM114-Status: GOOD (  29.42  )
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

MDcuMTEuMjAyMSAyMDozMiwgR3VlbnRlciBSb2VjayDQv9C40YjQtdGCOgo+IE9uIDExLzcvMjEg
OToxNiBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwNy4xMS4yMDIxIDIwOjA4LCBHdWVu
dGVyIFJvZWNrINC/0LjRiNC10YI6Cj4+PiBPbiAxMS83LzIxIDg6NTMgQU0sIERtaXRyeSBPc2lw
ZW5rbyB3cm90ZToKPj4+PiAwNi4xMS4yMDIxIDIzOjU0LCBKb25hdGhhbiBOZXVzY2jDpGZlciDQ
v9C40YjQtdGCOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gVGh1LCBPY3QgMjgsIDIwMjEgYXQg
MTI6MTY6NTdBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4gVXNlIGRldm1f
cmVnaXN0ZXJfcG93ZXJfaGFuZGxlcigpIHRoYXQgcmVwbGFjZXMgZ2xvYmFsIHBtX3Bvd2VyX29m
Zgo+Pj4+Pj4gdmFyaWFibGUgYW5kIGFsbG93cyB0byByZWdpc3RlciBtdWx0aXBsZSBwb3dlci1v
ZmYgaGFuZGxlcnMuIEl0IGFsc28KPj4+Pj4+IHByb3ZpZGVzIHJlc3RhcnQtaGFuZGxlciBzdXBw
b3J0LCBpLmUuIGFsbCBpbiBvbmUgQVBJLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pgo+Pj4+PiBX
aGVuIEkgYm9vdCB3aXRoIChtb3N0IG9mKSB0aGlzIHBhdGNoc2V0IGFwcGxpZWQsIEkgZ2V0IHRo
ZSB3YXJuaW5nIGF0Cj4+Pj4+IGtlcm5lbC9yZWJvb3QuYzoxODc6Cj4+Pj4+Cj4+Pj4+IMKgwqDC
oMKgwqAvKgo+Pj4+PiDCoMKgwqDCoMKgICogSGFuZGxlciBtdXN0IGhhdmUgdW5pcXVlIHByaW9y
aXR5LiBPdGhlcndpc2UgY2FsbCBvcmRlciBpcwo+Pj4+PiDCoMKgwqDCoMKgICogZGV0ZXJtaW5l
ZCBieSByZWdpc3RyYXRpb24gb3JkZXIsIHdoaWNoIGlzIHVucmVsaWFibGUuCj4+Pj4+IMKgwqDC
oMKgwqAgKi8KPj4+Pj4gwqDCoMKgwqDCoFdBUk5fT04oIWF0b21pY19ub3RpZmllcl9oYXNfdW5p
cXVlX3ByaW9yaXR5KCZyZXN0YXJ0X2hhbmRsZXJfbGlzdCwKPj4+Pj4KPj4+Pj4gbmIpKTsKPj4+
Pj4KPj4+Pj4gQXMgdGhlIE5UWEVDIGRyaXZlciBkb2Vzbid0IHNwZWNpZnkgYSBwcmlvcml0eSwg
SSB0aGluayB0aGlzIGlzIGFuCj4+Pj4+IGlzc3VlCj4+Pj4+IHRvIGJlIGZpeGVkIGVsc2V3aGVy
ZS4KPj4+Pj4KPj4+Pj4gT3RoZXIgdGhhbiB0aGF0LCBpdCB3b3JrcyBhbmQgbG9va3MgZ29vZCwg
YXMgZmFyIGFzIEkgY2FuIHRlbGwuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEZvciB0aGlzIHBhdGNoOgo+
Pj4+Pgo+Pj4+PiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVm
ZXJAZ214Lm5ldD4KPj4+Pj4gVGVzdGVkLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0Pgo+Pj4+Cj4+Pj4gVGhhbmsgeW91LiBZb3UgaGF2ZSBjb25mbGljdGlu
ZyByZXN0YXJ0IGhhbmRsZXJzLCBhcHBhcmVudGx5IE5UWEVDCj4+Pj4gZHJpdmVyIHNob3VsZCBo
YXZlIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZSB3YXRjaGRvZyBkcml2ZXIuIEl0IHNob3VsZAo+
Pj4+IGJlIGEgY29tbW9uIHByb2JsZW0gZm9yIHRoZSB3YXRjaGRvZyBkcml2ZXJzLCBJIHdpbGwg
bG93ZXIgd2F0Y2hkb2cncwo+Pj4+IGRlZmF1bHQgcHJpb3JpdHkgdG8gZml4IGl0Lgo+Pj4+Cj4+
Pgo+Pj4gVGhlIHdhdGNoZG9nIHN1YnN5c3RlbSBhbHJlYWR5IHVzZXMgIjAiIGFzIGRlZmF1bHQg
cHJpb3JpdHksIHdoaWNoIHdhcwo+Pj4gaW50ZW5kZWQgYXMgcHJpb3JpdHkgb2YgbGFzdCByZXNv
cnQgZm9yIHJlc3RhcnQgaGFuZGxlcnMuIEkgZG8gbm90IHNlZQo+Pj4gYSByZWFzb24gdG8gY2hh
bmdlIHRoYXQuCj4+Cj4+IFJpZ2h0LCBJIG1lYW50IHRoYXQgd2F0Y2hkb2cgZHJpdmVycyB3aGlj
aCB1c2UgcmVzdGFydCBoYW5kbGVyIHNldCB0aGUKPj4gbGV2ZWwgdG8gdGhlIGRlZmF1bHQgMTI4
IFsxXS4gQWx0aG91Z2gsIG1heWJlIGl0J3MgYSBwcm9ibGVtIG9ubHkgZm9yCj4+IGkuTVggZHJp
dmVycyBpbiBwcmFjdGljZSwgSSdsbCB0YWtlIGEgY2xvc2VyIGxvb2sgYXQgdGhlIG90aGVyIGRy
aXZlcnMuCj4+Cj4gCj4gVGhleSBkb24ndCBoYXZlIHRvIGRvIHRoYXQuIFRoZSBkZWZhdWx0IGlz
IHByaW9yaXR5IDAuIEl0IGlzIHRoZSBkZWNpc2lvbgo+IG9mIHRoZSBkcml2ZXIgYXV0aG9yIHRv
IHNldCB0aGUgd2F0Y2hkb2cncyByZXN0YXJ0IHByaW9yaXR5LiBTbyBpdCBpcyB3cm9uZwo+IHRv
IGNsYWltIHRoYXQgdGhpcyB3b3VsZCBiZSAiYSBjb21tb24gcHJvYmxlbSBmb3IgdGhlIHdhdGNo
ZG9nIGRyaXZlcnMiLAo+IGJlY2F1c2UgaXQgaXNuJ3QuIFByZXN1bWFibHkgdGhlcmUgd2FzIGEg
cmVhc29uIGZvciB0aGUgZHJpdmVyIGF1dGhvcgo+IHRvIHNlbGVjdCB0aGUgZGVmYXVsdCBwcmlv
cml0eSBvZiAxMjguIElmIHRoZXJlIGlzIGEgcGxhdGZvcm0gd2hpY2ggaGFzCj4gYSBiZXR0ZXIg
bWVhbnMgdG8gcmVzdGFydCB0aGUgc3lzdGVtLCBpdCBzaG91bGQgc2VsZWN0IGEgcHJpb3JpdHkg
b2YKPiAxMjkgb3IgaGlnaGVyIGluc3RlYWQgb2YgYWZmZWN0aW5nIF9hbGxfIHBsYXRmb3JtcyB1
c2luZyB0aGUgaW14IHdhdGNoZG9nCj4gdG8gcmVzZXQgdGhlIHN5c3RlbS4KPiAKPiBTdXJlLCB5
b3UgY2FuIG5lZ290aWF0ZSB0aGF0IHdpdGggdGhlIGRyaXZlciBhdXRob3IsIGJ1dCB0aGUgZGVm
YXVsdCBzaG91bGQKPiByZWFsbHkgYmUgdG8gY2hhbmdlIHRoZSBwcmlvcml0eSBmb3IgbGVzcyBh
ZmZlY3RlZCBwbGF0Zm9ybXMuCgpZZXMsIGxvb2tzIGxpa2UgdGhlcmUgaXMgbm8gY29tbW9uIHBy
b2JsZW0gZm9yIHdhdGNoZG9nIGRyaXZlcnMuCkluaXRpYWxseSBJIHdhcyByZWNhbGxpbmcgdGhh
dCB3YXRjaGRvZyBjb3JlIHVzZXMgMTI4IGJ5IGRlZmF1bHQgYW5kCnR5cGVkIHRoZSBtZXNzYWdl
IHdpdGhvdXQgdmVyaWZ5aW5nIGl0LiBJIHNlZSBub3cgdGhhdCBpdCdzIGluY29ycmVjdCwKbXkg
YmFkLgoKRUMgZHJpdmVycyB0ZW5kIHRvIHVzZSBoaWdoZXIgcHJpb3JpdHkgaW4gZ2VuZXJhbC4g
Sm9uYXRoYW4sIGNvdWxkIHlvdQpwbGVhc2UgY29uZmlybSB0aGF0IE5UWEVDIGRyaXZlciBpcyBh
IG1vcmUgcHJlZmVyYWJsZSByZXN0YXJ0IG1ldGhvZAp0aGFuIHRoZSB3YXRjaGRvZz8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
