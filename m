Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD18C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 13:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571F061211
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 13:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 571F061211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=34YlHEiVIWvZwvHAw4TA9qm6yDcPm3Ume+JN1apEtMw=; b=03+Wg1DumFYK9YfThUrDq+UQKT
	zanj02NWeE32ugsOQ2JDxEVVvJpE9+/PrK7nu2AJgKjkDWG/EBjJSOMRvZchJkiSRDhQrXrXKG/3L
	2NAx9KPk4JrPr1lHAylp8CyQmbxFGT9KI/OycQNjKUD28Loplc7sbqFbvMx5jdbK0SwleO71QvgpJ
	oEdR+bZD+ECREicVMouCRG7178cm197afKI7TxuAZsGR9XKnS/wxkxrRQMlnFIkjPYlBJn2Tj2KLa
	njGETSGf/P9dVPURrugXkDueIElyxyOCQtvuYaY+B/w04DwmKYBaeRMx9OS53l3zVg1AKgDNMiSzK
	w6Gail1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mknns-005ZoN-Dy; Wed, 10 Nov 2021 13:38:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mknno-005Zme-R3; Wed, 10 Nov 2021 13:38:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id br15so2314717lfb.9;
 Wed, 10 Nov 2021 05:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
 b=lD15/VjqUInHM3dZidzqbDMtU49DALHBS4Ay1C40nUi5lxcF7BMQ5EnHXXzG4e6Wu9
 KEtaN/+P0k1Njtg3ToWP1/KM8wIXtXfb2GMI1jVOw30JDescBKoGZyWGQkHaeFFMF1Cx
 557WfM+CudsCe0rfY4tn9Qu/fZ6FXK7hdk9Wu9dTaZ71QukQt6Mf26SjkHrJIeq+MupJ
 /vckqogxswS5UmhYqlk9vNHYa1S8ChRuc7OrOB+B+82hPJEZwrpCBIceX5S6KM+5NMWF
 FSm1MYMPHMKiWtHmf2u4gxwpqn+oAaxX8rT7fWDE5HDvTnS5+IytbAjE77fEnTdMp1QG
 4sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
 b=XkjbEA3fJ2GYLVa8czM6t9eEb2oWIRFeyO8AtOCbAfjOIIz1C9cB/L/fmxuL1ViGyr
 olEg4ZaAu9tpsWncmy7X99ExZAQPkf+i2HvnuNUkK2D8JtrWhc+wMXK5UXFbnkBE+PqZ
 IWMZOmLDTN1KKc6QQsDOiwRr5O7MyUae7OQDv+NhhiQZL6v2o5I6BmK8pBcUqVYJPhpW
 YIGO2rTAjVM92ne3KdRNk7GQU5TMfZUKGz5wmZMUd73ajfPazXhL0mdql7TOAJGePv2l
 NEltgPW8kdRBJbIMb+jCNsCnL4DDKrtZLEs+ubInSfXJz85CWbTIoCER8gsj+qOaG+Dg
 +r+w==
X-Gm-Message-State: AOAM532NDC2iBQRKYxGgFyUDSJGXNurSSf8QlNX9eF/ZwjIyCInN++nW
 1Zzj09A8xaROuEaAsVaqFCc=
X-Google-Smtp-Source: ABdhPJxBHb2JNLIS70NEJi27Oqj8IHGODoK0u1oyS1uV5awJ6mpkyMTiHwL65DF0nZiuWJMJYZ6aSw==
X-Received: by 2002:a05:6512:c02:: with SMTP id
 z2mr14599668lfu.445.1636551490068; 
 Wed, 10 Nov 2021 05:38:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru.
 [79.139.177.117])
 by smtp.googlemail.com with ESMTPSA id z25sm60391lja.99.2021.11.10.05.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 05:38:09 -0800 (PST)
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
 <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com> <YYuia9KFdi+ETT+I@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceefc854-5d15-b73c-0135-c1cbbbb473b7@gmail.com>
Date: Wed, 10 Nov 2021 16:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYuia9KFdi+ETT+I@latitude>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_053812_900517_641612D2 
X-CRM114-Status: GOOD (  22.40  )
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

MTAuMTEuMjAyMSAxMzo0MywgSm9uYXRoYW4gTmV1c2Now6RmZXIg0L/QuNGI0LXRgjoKPiBPbiBN
b24sIE5vdiAwOCwgMjAyMSBhdCAwMjozNjo0MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3Jv
dGU6Cj4+IDA4LjExLjIwMjEgMTQ6MjIsIEpvbmF0aGFuIE5ldXNjaMOkZmVyINC/0LjRiNC10YI6
Cj4+PiBPbiBTdW4sIE5vdiAwNywgMjAyMSBhdCAwODo0MjozM1BNICswMzAwLCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+IEVDIGRyaXZlcnMgdGVuZCB0byB1c2UgaGlnaGVy
IHByaW9yaXR5IGluIGdlbmVyYWwuIEpvbmF0aGFuLCBjb3VsZCB5b3UKPj4+PiBwbGVhc2UgY29u
ZmlybSB0aGF0IE5UWEVDIGRyaXZlciBpcyBhIG1vcmUgcHJlZmVyYWJsZSByZXN0YXJ0IG1ldGhv
ZAo+Pj4+IHRoYW4gdGhlIHdhdGNoZG9nPwo+Pj4KPj4+IFllcy4gVGhlIG9yaWdpbmFsIGZpcm13
YXJlIHVzZXMgdGhlIE5UWEVDIHRvIHJlc3RhcnQsIGFuZCBpdCB3b3JrcyB3ZWxsLAo+Pj4gc28g
SSBkbyB0aGluayBpdCdzIHByZWZlcmFibGUuCj4+Cj4+IFRoYW5rIHlvdSwgdGhlbiBJJ2xsIHVw
ZGF0ZSB0aGUgTlRYRUMgcGF0Y2ggbGlrZSB0aGlzOgo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20v
Z3JhdGUtZHJpdmVyL2xpbnV4L2NvbW1pdC8yMmRhM2Q5MWYxNzM0ZDlhMGVkMDM2MjIwYWQ0ZWEy
ODQ2NWFmOTg4Cj4gCj4gSSB0ZXN0ZWQgYWdhaW4sIGJ1dCBzeXNfb2ZmX2hhbmRsZXJfcmVib290
IGNhbGxlZCBhIGJvZ3VzIHBvaW50ZXIKPiAocHJvYmFibHkgcmVib290X3ByZXBhcmVfY2IpLiBJ
IHRoaW5rIGl0IHdhcyBsZWZ0IHVuaW5pdGlhbGl6ZWQgaW4KPiBudHhlY19wcm9iZSwgd2hpY2gg
dXNlcyBkZXZtX2ttYWxsb2MuIEkgZ3Vlc3Mgd2UgY291bGQgc3dpdGNoIGl0IHRvCj4gZGV2bV9r
emFsbG9jOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9udHhlYy5jIGIvZHJpdmVycy9t
ZmQvbnR4ZWMuYwo+IGluZGV4IDFmNTVkZmNlMTQzMDguLjMwMzY0YmViNGIxZDAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tZmQvbnR4ZWMuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL250eGVjLmMKPiBA
QCAtMTQ0LDcgKzE0NCw3IEBAIHN0YXRpYyBpbnQgbnR4ZWNfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkKPiAgCWNvbnN0IHN0cnVjdCBtZmRfY2VsbCAqc3ViZGV2czsKPiAgCXNpemVf
dCBuX3N1YmRldnM7Cj4gIAo+IC0JZWMgPSBkZXZtX2ttYWxsb2MoJmNsaWVudC0+ZGV2LCBzaXpl
b2YoKmVjKSwgR0ZQX0tFUk5FTCk7Cj4gKwllYyA9IGRldm1fa3phbGxvYygmY2xpZW50LT5kZXYs
IHNpemVvZigqZWMpLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghZWMpCj4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gIAo+IAo+IAo+IFdpdGggdGhhdCBkb25lLCBpdCB3b3JrcyBmbGF3bGVzc2x5LgoKR29v
ZCBjYXRjaCwgdGhhbmsgeW91ISBJJ2xsIGNvcnJlY3QgdGhpcyBwYXRjaCBhbmQgYWRkIHlvdXJz
IHQtYi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
