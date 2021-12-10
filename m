Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A83C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CLS7B5R6pFZhzDYMqTLH4MSISsbP/uKXPDPs2OX3q5E=; b=whwoOc5WWri4PPM4xt0A9/cQnM
	tvZZYx0zl6c2/yPOi8/4GGxmLa4v2c6Clt661NEUJF61Q17WpY0jSolVQVJZnE2wv67TQdIdp/nOb
	YDKei4HaJg17J7oARDTOYG4TjbL6THSER5im1XRkJAF4KYHV0WCxxc6CwRU7sdDiddNTvOo3fiWm1
	+t8nOxv0Kj/d3mAjz+5zRu7BGKdee9tsglksM0RMhNcXESYWEWHbcCuAhHgQ9lVT2Du5NF3ctJgyW
	CQlTdlk0UNspZntAxqbykrn8QkV/14K7B0hg1dizK8JFD6PhgE9RH92RkGRYyqCsYOAKvOU4nQBjd
	PbPB1jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkRB-003Ah4-DH; Fri, 10 Dec 2021 18:16:05 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkR8-003Afq-Hx; Fri, 10 Dec 2021 18:16:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id cf39so7442444lfb.8;
 Fri, 10 Dec 2021 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
 b=G0qTQ3KGFrwps8qADsCL0qK6agYLp7ivalOB/mF7ukTMqKqODRUNPClBA+tjj958iZ
 zDP5ALcBXKrVg0xx9H2ws3hyb3r6CIVdqsbS/GVCsvrWbnNO0HGlLBE864udH5VLQpzA
 E4ZCGQvWrQ3sm3YxkToWB7AGuZSE/qHZ86M8KsEpcZTMCU4IFoRlulk9U2f7fjt0DgcE
 dievaYp3/3GIUU6nMVScS6FhLqdlOsaTCJ8+eRNM/gp2aIGsGid35kag1Oq9XwyLJEZe
 Lsdj6NoONSIfbrp21Zrfz1ZI08pSDTMKtV8ZG3ySXOqe/j3lBC+KMsiD//GTJ5tyuvfx
 eTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
 b=iUKB/txw6xzG30F+V6To6hM0+cqbRAvKfzgIcpF0QP/jlxLgORzr7Fe8Nkd8jf5VO4
 jax+jh9OPRLlfrSjcb+lmRN7EirSl6xNC5vvD52GHJrHJx+SvtzlGQuONubluODYWnjw
 //kYzbJOSzZXxrIH+mYkHI60/pE/KVna/EenbnrHUVqhf7Q8c2KSUntKUkbiQkRzp3im
 Ed9CCLR2lmmz4AnIxXGAmFfkUq45brB8Cbip5T4b7wpBCpbdJL5EviZGpMID0+9+m00T
 HoodwkkTjA62q0V56vpxqcM/mWaHMr4CxLPQUkw6zogsHmetTJax1v6My7OSa8NjShL3
 c2tw==
X-Gm-Message-State: AOAM533LvyYpE/o49rJ2OJOwXsXhfVnP1AhHp7ZK2Ir89BAKe11UGE1w
 BPfqxeGeeK9UHlTwwKqpqfE=
X-Google-Smtp-Source: ABdhPJwR/4XeF0n78EyaU8daj5gqPU1YI5WhyixXiCZ/1XxnYO6fYoSxPShwkvEp5UZp5BYd303wDQ==
X-Received: by 2002:a05:6512:40b:: with SMTP id
 u11mr13847699lfk.377.1639160159550; 
 Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id q15sm379095lfp.32.2021.12.10.10.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
Date: Fri, 10 Dec 2021 21:15:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_101602_638771_5977A411 
X-CRM114-Status: GOOD (  17.33  )
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

MTAuMTIuMjAyMSAyMTowOSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCA3OjAyIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gYW5ub3RhdGUgZnVuY3Rpb24gcHJv
dG90eXBlcyB3aXRoICdleHRlcm4nLCBpdCBtYWtlcwo+PiBjb2RlIGxlc3MgcmVhZGFibGUuIFJl
bW92ZSB1bm5lY2Vzc2FyeSBhbm5vdGF0aW9ucyBmcm9tIDxyZWJvb3QuaD4uCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAKPiBJJ20gbm90
IHN1cmUgdGhhdCB0aGlzIGlzIHJlYWxseSB1c2VmdWwuCj4gCj4gUGVyc29uYWxseSwgSSB0ZW5k
IHRvIHJlc3BlY3QgdGhlIGV4aXN0aW5nIGNvbnZlbnRpb25zIGxpa2UgdGhpcy4KPiAKPiBTdXJl
bHksIHRoaXMgY2hhbmdlIGlzIG5vdCByZXF1aXJlZCBmb3IgdGhlIHJlc3Qgb2YgdGhlIHNlcmll
cyB0byB3b3JrLgoKUHJvYmxlbSB0aGF0IHN1Y2ggdGhpbmdzIHN0YXJ0IHRvIHNwcmVhZCBhbGwg
b3ZlciB0aGUga2VybmVsIHdpdGggYQpjb3B5LXBhc3RlIGFwcHJvYWNoIGlmIHRoZXJlIGlzIG5v
Ym9keSB0byBjbGVhbiB1cCB0aGUgY29kZS4KClRoaXMgaXMgbm90IGEgY29tbW9uIGNvbnZlbnRp
b24gYW5kIHNvbWV0aW1lcyBpdCdzIGdldHRpbmcgY29ycmVjdGVkIFsxXS4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL2xpbnVzLzZkNzQzNDkzMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
