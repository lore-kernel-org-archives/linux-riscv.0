Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4D1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84905610D2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84905610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eBME6AJif36dtw6iFPXoRAYyS3i56XYfidwFzi1c88g=; b=uC0CgraBJXZWfqLEbtZlLSlknQ
	kGMjCqpXkHm1NU0vSf/l2+j9FS4uQ/s0hcMFXES30hHaYVILPWODAuWtE3f/KK1dLoSqJ7GzRFhWo
	fkKJDnpPDr/GnVjAeQ8vckCZxRBAoTRYYYWeDcuZM2vrIEwM+dYRDYdvpDmABYclBaVDoKO6B3LOA
	FnZgz2jg4moryKdYKGgVxS1n+f+LRkTPcd/o9Z0k1a+TdyUnk+5K+vxNOmuGiacSxShEHbyIvV9+6
	gq9lvhHDfAC+H8fSEz75V5ueFBrPFj1F2vK3MDCqy5XsLdOlJ+3z/KfHFMP4C7ioLnxr2L3PYFOPq
	eVhASYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDX6-009DIB-H0; Thu, 28 Oct 2021 22:06:00 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgDX3-009DHS-Fe; Thu, 28 Oct 2021 22:05:58 +0000
Received: by mail-lj1-x22b.google.com with SMTP id u5so13167598ljo.8;
 Thu, 28 Oct 2021 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
 b=OJvAD8QIK23NiAd5gHFgNc2jMlnwbUhscd64oItZCjDzpbaa9HqfW53eGYcjGvS+Hd
 8DJvk+brxf2GEvT4zQ6W/ef2iXaKU3cVUF0C3X+R0CYtCLZK9UxcbzlXYXArEArHwTk8
 vcyalmRFTF2jyokLO2ef7zgVnqs7E2ea+6mOp4eaXLCsLH7zqMUa5b9lGYh++3iI3c5l
 5SNXuX8KUFV580Mc9ixmfzVIv8iajcv/gjbcoXvjaxxhRQdJfHyZ96a4PDZESCiQ0JsQ
 ezipbNgT7rnH4g7QwqVqZwJlBhjMy6NJ72j6JC2Ohga6KFFIy4TxdzbmMsSK+f4qNFMJ
 K+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
 b=yyq+PAASRrUTjYRnfttVk3fVjUjNiLN8AKBDqpoCrrcI7X1pUuMVnzo4UpixqJ8jFJ
 RkBXTvtvIRSJLutP1wlO3rrrkgy6K6hZ5EulwMXzMo+FmLYRWlSr+H5LBdeotzbrq0JS
 vZw9kaQZStjzBIosZuUTjNG5AZI4xb6zB1xhTo1ism54OJfZRnM69lileAR3exrLBBH5
 PeA7SICIyTmGJ6kTLqKxdNISf7n7jb/o54vx3Y3XGJ3KbG3iJPJJU7E/TTOhVcTPsit7
 ZEXy2FYqFl5sIMlKFZRM3w4sXSDUWAJCQoId9wHl/JseKvalzViR948oGarTg/McRTGL
 qO7Q==
X-Gm-Message-State: AOAM5313Xp9tWI1aS5pdqSerPAkSviM4klR5rjTMexy9AEbhylv5xgFj
 ja05/S7rH2agfSNPfopnfi4=
X-Google-Smtp-Source: ABdhPJzozZj+Szoqatj9JJ7zamkbp5Jf8v8z0Y7vkU95q/rca882+TrclSa79lyDyuur0f9DZkdGEw==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr5923422ljj.508.1635458756009; 
 Thu, 28 Oct 2021 15:05:56 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id v13sm444651ljk.72.2021.10.28.15.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:05:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/45] Introduce power-off+restart call chain API
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
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
Message-ID: <92067c5e-a256-ff45-eae2-21033c6a83d2@gmail.com>
Date: Fri, 29 Oct 2021 01:05:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_150557_573948_7A6486F8 
X-CRM114-Status: GOOD (  12.96  )
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

MjguMTAuMjAyMSAwMDoxNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gICBtZmQ6IGFi
ODUwMDogVXNlIGRldm1fcmVnaXN0ZXJfdHJpdmlhbF9wb3dlcl9vZmZfaGFuZGxlcigpCj4gICBy
ZXNldDogYXRoNzk6IFVzZSBkZXZtX3JlZ2lzdGVyX3NpbXBsZV9yZXN0YXJ0X2hhbmRsZXIoKQo+
ICAgcmVzZXQ6IGludGVsLWd3OiBVc2UgZGV2bV9yZWdpc3Rlcl9zaW1wbGVfcmVzdGFydF9oYW5k
bGVyKCkKPiAgIHJlc2V0OiBscGMxOHh4OiBVc2UgZGV2bV9yZWdpc3Rlcl9wcmlvcml0aXplZF9y
ZXN0YXJ0X2hhbmRsZXIoKQo+ICAgcmVzZXQ6IG5wY206IFVzZSBkZXZtX3JlZ2lzdGVyX3ByaW9y
aXRpemVkX3Jlc3RhcnRfaGFuZGxlcigpCgpUaGVzZSBwYXRjaGVzIGdvdCBsb3N0IGJlY2F1c2Ug
R21haWwgZ2F2ZSBtZSBiYW4gYWZ0ZXIgNDAncyBlbWFpbC4gSQp0aGluayBpdCBkb2Vzbid0IHdv
cnRoIHRvIHJlLXNlbmQgdGhlbSBub3cgc2luY2UgeW91IHNob3VsZCBnZXQgYW4gaWRlYQphYm91
dCBob3cgQVBJIHVzYWdlIGxvb2tzIGxpa2Ugd2l0aG91dCB0aGUgbG9zdCBwYXRjaGVzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
