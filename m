Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsLx7Jdhwb7D6u6DwG97SZsgsW1ISuF4G2jZixMSYnU=; b=jSBsFo/1pLtAXv
	zhWMGy8d5hGLFHJzC1+nlile7RrNHHOZAyQlCyMV+ktzd2DzI7d/QEhxB0ZC7Sskxgkp00o/OCZXK
	rc4IGka2poX35PWlvb+1c7OuFmv/CEFTnSkw3PIe4u6ZUnxY3rUz397gTMV0R6i0knafGDmOjzm8f
	3LQHGJsO4P+mp001ne7ToCWR0h1DbMmFdIrlf5t82Q8aaCfsd1qVo3LfjnpSdVthwnCfGHhfChSh8
	1H+x51RF3Az7GoQBOeOlRsTRWOW5Y9eJ8KRFfvTHFyZlSTp8QH3qzwM7S/mYPVFmmA18CqHd4+ITj
	mXlrYCLtKXFh7/IXKgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfFY-000b7e-5h; Mon, 29 Nov 2021 11:55:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfFU-000b69-EP
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 11:55:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i5so36205659wrb.2
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VVOPTlZ25TG0A/D/zPlBV/5uhzVs33QmnMBQ/KVuzok=;
 b=lkwhQKXAkPk/45MOJA8n7UmDgKAdLF4A1HrNaCp2DAoqL5jLTFjou3x32wDBBU6GIT
 yI/CJhxLCUTnAb5/Em/j6rhcsE0aVo3sMd3LYPxdE5+hC1/mTgxkJqsMs5FMlUOo6mFj
 p7BNzyn9xjUhYwkgG5BzPtj9HurcHm+ccwOPwS4lv9ee0Rp8UDrMmrydCXbQHsTaZXjk
 xJu5xIGGnwbHMKU206LqjROnwejVkM/SZiOAqwNOvL8q0Fxve51MyLPqAjPb4PZY1YMm
 QSzNrZA4BSS9QFja3wZ8ES46Bccp24Bd6Zbx0NoBWxwAbV7Rw05PPAukg5XBBny7eyFr
 nlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VVOPTlZ25TG0A/D/zPlBV/5uhzVs33QmnMBQ/KVuzok=;
 b=NSMb4Utm8vukkPdsFlZ8RRQA86FnhYHavLf68f2AIXmdB3eJZyGr0Rkhng9gQo1Q5o
 E7MrD+BZTeXogRI8wKkat2vSiAJoOiv8LffrbpPDKRfAP9GmiVVy5SLJqPn9S2SMYWRN
 ISXxCyrCvj1u7tjeJxBcHzSqNg27Iy5Ajx9l6grWlXeH0CwG+R+i9II8PXffEtmpSx1q
 euqUJ6bq+buMnpD8STj3rJwmxlO+BfGTGpNdIdwksNlMkTTyV6Jm50UWkwVFPZNL/tH5
 NMjFpOp6kloUOcCYLx1mscebj9lAaMoUnrhw6kzSebWF8DGE+pvwzbCnrx7tHkOfBeo9
 xjPg==
X-Gm-Message-State: AOAM530zcYWWcWXvrP9SsdC1ZrKs9+2psYiAe4YGTSBViUchu/LKf13c
 IfldoxoNpfKpmIbjwUbhvVhgmQ==
X-Google-Smtp-Source: ABdhPJzBdvU2Vc8uq5wk1K9UX3j47S9iY7roSh9nDqHEi2kZs1JBlBSlXeazNTFhoQ+QITHlIyszPw==
X-Received: by 2002:adf:e742:: with SMTP id c2mr32868966wrn.498.1638186905995; 
 Mon, 29 Nov 2021 03:55:05 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id y15sm16736665wry.72.2021.11.29.03.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 03:55:05 -0800 (PST)
Date: Mon, 29 Nov 2021 11:55:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
Message-ID: <YaS/lStp2b8GhVxw@google.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027211715.12671-29-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_035508_497860_44F6069B 
X-CRM114-Status: GOOD (  13.81  )
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

T24gVGh1LCAyOCBPY3QgMjAyMSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgoKPiBVc2UgZGV2bV9y
ZWdpc3Rlcl9wb3dlcl9oYW5kbGVyKCkgdGhhdCByZXBsYWNlcyBnbG9iYWwgcG1fcG93ZXJfb2Zm
Cj4gdmFyaWFibGUgYW5kIGFsbG93cyB0byByZWdpc3RlciBtdWx0aXBsZSBwb3dlci1vZmYgaGFu
ZGxlcnMuIEl0IGFsc28KPiBwcm92aWRlcyByZXN0YXJ0LWhhbmRsZXIgc3VwcG9ydCwgaS5lLiBh
bGwgaW4gb25lIEFQSS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL3JuNXQ2MTguYyB8IDU2ICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKRm9yIG15IG93biByZWZlcmVuY2UgKGFw
cGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
