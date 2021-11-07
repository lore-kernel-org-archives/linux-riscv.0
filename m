Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21503C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 16:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD5761157
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 16:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBD5761157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d7I+vuv5HgAjSKIKW+Gft+ckRgo9xz0ACKnfqVKblyg=; b=qMAw1Nj+qYp1ttQ3e/RPlRf0VP
	TDZyb8Gq1OknoZgokB+HiFWQg2alH3uvM9YvFAVM0SaWm6hZiMB548sb/DizIFA430+LrhFIGQNJn
	y0pLAYxNuIieREgKkz4UrPxz3tJx7apVDlqjFaGxTlGcAkYoB/M4WY3iRECVl6Dm9F7vS7pGLFIZ5
	woB3OP1pGr1wCea7VvDhq1qDEntoWXL5Xu1DcsU/o65/pShCy9ODnWc/0m7tEx4G6x/9+zKNBSncG
	ct84IBvublqj03VN/vTHaVcnpXBF5ole31SpjPbFTmNqukmAtGvp3Ld37CfDsI2fqh0IxmM3ZMcOI
	vue4XTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjlPm-00EbL2-Td; Sun, 07 Nov 2021 16:53:06 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjlPl-00EbKY-0h; Sun, 07 Nov 2021 16:53:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y26so30708345lfa.11;
 Sun, 07 Nov 2021 08:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
 b=Lwzfxq5uEYmwUHQaauy1zdfEe4xJydQ9b9Od8uYrwBczi5NJMIekKLJg7wlYTXl+4h
 aBwFrnzPjUuQZKv1Ia+S222jU8dJElyFhzTX7Y6Z3zgW5uo6fxyJ6Ub7QZuJOpIcD/5G
 Z5zvDqw9CupdRxfoeBn7XfS8iSTjIzecdpz5R8YfLYHN44fPq2Sj3DZqQfYaE9SGw4KM
 9QVgWsVoZpReO+np7PVvhGoeoi2Muq2En7xd12JC02FvD5KUvlS8dKa1pfLtqGdyB8C3
 Q31AQZyOLu3Y3rBXma7EsV9dMapOWW+H7dfnyyasqa2gU34jVZGgiKgGYKDrTdyFanCB
 8Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
 b=N8lRwlVYQJA71cFdxpeZ62vK/fw7U8luGj93qqUDIBJ8WJRGfRepIsLxn9fbGIURVj
 g2+r85KPQ/Guog3d9amAp8eXWyGyMIreEO795ubTA5graYwHClMCoYJxczW+5Jmb9AZa
 K0Yu9citLkjdMh+pvIb3KxUGrmSTHgPByaxTpnCfEQ8iA54I0YBzCBLtRR0GF8pe+cY7
 QBgHnBc7Ki1RtvtELg8OP+HOBtpVNxOt+rNZevW7KcDDt9nSZps1GzPmjgfmRxKV9ImH
 E78N9tXMTPA3r5aojMDODU6XKHzN+zqfvBZdO9Hbdv5npx5W5mGgiPmHT6wsaUk7lilm
 fyaw==
X-Gm-Message-State: AOAM533czm1qPXtMwLaF8TYXPHUL3lVpF6cxqNdr+leoDymi9ACUxCKP
 y9SBFa56W0fLC/lyd19mWw0=
X-Google-Smtp-Source: ABdhPJyYdIEr6ONtuDBexIQwg75AwiW2LoF8DEUBqYkEbum61pW0vPuGJTsEH8z54RKtLjaAI2MWow==
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr64106958lfg.568.1636303982698; 
 Sun, 07 Nov 2021 08:53:02 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id c3sm860233lfb.122.2021.11.07.08.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 08:53:02 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Date: Sun, 7 Nov 2021 19:53:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYbqlmOM95q7Hbjo@latitude>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_085305_087600_1AA2A658 
X-CRM114-Status: GOOD (  22.75  )
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

MDYuMTEuMjAyMSAyMzo1NCwgSm9uYXRoYW4gTmV1c2Now6RmZXIg0L/QuNGI0LXRgjoKPiBIaSwK
PiAKPiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxMjoxNjo1N0FNICswMzAwLCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+IFVzZSBkZXZtX3JlZ2lzdGVyX3Bvd2VyX2hhbmRsZXIoKSB0aGF0IHJl
cGxhY2VzIGdsb2JhbCBwbV9wb3dlcl9vZmYKPj4gdmFyaWFibGUgYW5kIGFsbG93cyB0byByZWdp
c3RlciBtdWx0aXBsZSBwb3dlci1vZmYgaGFuZGxlcnMuIEl0IGFsc28KPj4gcHJvdmlkZXMgcmVz
dGFydC1oYW5kbGVyIHN1cHBvcnQsIGkuZS4gYWxsIGluIG9uZSBBUEkuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4gCj4gV2hl
biBJIGJvb3Qgd2l0aCAobW9zdCBvZikgdGhpcyBwYXRjaHNldCBhcHBsaWVkLCBJIGdldCB0aGUg
d2FybmluZyBhdAo+IGtlcm5lbC9yZWJvb3QuYzoxODc6Cj4gCj4gCS8qCj4gCSAqIEhhbmRsZXIg
bXVzdCBoYXZlIHVuaXF1ZSBwcmlvcml0eS4gT3RoZXJ3aXNlIGNhbGwgb3JkZXIgaXMKPiAJICog
ZGV0ZXJtaW5lZCBieSByZWdpc3RyYXRpb24gb3JkZXIsIHdoaWNoIGlzIHVucmVsaWFibGUuCj4g
CSAqLwo+IAlXQVJOX09OKCFhdG9taWNfbm90aWZpZXJfaGFzX3VuaXF1ZV9wcmlvcml0eSgmcmVz
dGFydF9oYW5kbGVyX2xpc3QsIG5iKSk7Cj4gCj4gQXMgdGhlIE5UWEVDIGRyaXZlciBkb2Vzbid0
IHNwZWNpZnkgYSBwcmlvcml0eSwgSSB0aGluayB0aGlzIGlzIGFuIGlzc3VlCj4gdG8gYmUgZml4
ZWQgZWxzZXdoZXJlLgo+IAo+IE90aGVyIHRoYW4gdGhhdCwgaXQgd29ya3MgYW5kIGxvb2tzIGdv
b2QsIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgo+IAo+IAo+IEZvciB0aGlzIHBhdGNoOgo+IAo+IFJl
dmlld2VkLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+
IFRlc3RlZC1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4K
ClRoYW5rIHlvdS4gWW91IGhhdmUgY29uZmxpY3RpbmcgcmVzdGFydCBoYW5kbGVycywgYXBwYXJl
bnRseSBOVFhFQwpkcml2ZXIgc2hvdWxkIGhhdmUgaGlnaGVyIHByaW9yaXR5IHRoYW4gdGhlIHdh
dGNoZG9nIGRyaXZlci4gSXQgc2hvdWxkCmJlIGEgY29tbW9uIHByb2JsZW0gZm9yIHRoZSB3YXRj
aGRvZyBkcml2ZXJzLCBJIHdpbGwgbG93ZXIgd2F0Y2hkb2cncwpkZWZhdWx0IHByaW9yaXR5IHRv
IGZpeCBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
