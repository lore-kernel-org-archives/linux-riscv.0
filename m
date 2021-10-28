Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1573FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A2F60FE3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6A2F60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ejr6ULPYmbUJHeoU09qX/Wdo/Rb9z9rOn7Xd7jPKxOo=; b=JWe4dIXKYR0qd1/fDxoM6DcYWr
	G4YRvSj2+E+UdUqbdc6pxSQJP6+yMMC/81VNQUkUaqVf+9iBE7sIbQ6UXlexrTHG2A3PpyEpOAKWC
	JxOYdxG3CO+lt8rXWPOM95zmXpwfX/vfv0RERC3NOmr7LCwP08Dw4gSZsZV6RS/jjmlHSpc89xu7t
	F7LtfRGcqh2FNgIyz84ZMARaRLUElCwQ/C06v+NQsbwrTKgoxeaCr0qU/sqaON3A7JlRbra/ZThjK
	/aRZfjPhMuHv9DxjPif7xYHe8X3kDt7A/LEP8Gr45Zt8YlcM8t8/NMkBV+bhKsVGvaFAXGnbOWJIT
	JjUrWaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgD4Y-009A4Q-EH; Thu, 28 Oct 2021 21:36:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgD4V-009A2b-JI; Thu, 28 Oct 2021 21:36:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id p16so16525345lfa.2;
 Thu, 28 Oct 2021 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
 b=Y9ted3wnUvFPZbztZa+QHRbohuO2ujzfF68/pFicW5dA7D1yuFrKCL4aTWk/1AChzB
 fKwgUocsDwuNOGM2+iseiHe/bj2d1v3+dSRNtXKqEmTsyBkz7IWQs8pVvc2a2gvGjfup
 yLqAO4u/w7mjCphm/lBZwptgCTPupkSC+307KKr7OHU7po5AtPQB8ZhrguBiu6yERIjH
 bK0WN85VLNpdVAhT7soiJpVcCZ4Sp0KIHJV14Uu8RloVE9YJBCz/nPhBHDPyGgkjYHQ0
 imoJdP8GopH3zoQfTkWNgL4xsg20XHFvSLev9dZQthSUfjSrDblQ5bVzKxHiquLI0ZeF
 3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
 b=HXi7F7jrSLD5+VlIPx19RcOFgjU/nnegw/cuBQSWmanK8f9jJFOLDiN2c1SPC4YMiY
 orpBTcDuRWbSORyPK0f1uJcJD4+wUnHKqXU50Sw0FVz8xS4UAh5q3JJJ+WXAE5M7TnTE
 r+pBLxVsgNuuR4jOrEghNZ5HAGeAPgaxoDZgxFNUzmhpbN21VMPmvMPzyM7pd64JCYjE
 pXlSl33OUNMNdkYddiPYwkGLTPSrPRsX1Jgzdx5QuaVDTsTmTAHizbu9HCjGVP6FiD3y
 uTxvk+CkZWE8JVBoTyZZUug/i21110NTw1JUy/vDeJ0+LL993robg74WR/gOoIwrJhpD
 ns3Q==
X-Gm-Message-State: AOAM530T66SeraiE6Kyb3JWJXiZ8jIXvs8idV0sPYuw0yWfYu8gcyZs3
 XcPn91A08JCx5MCWCNB4twI=
X-Google-Smtp-Source: ABdhPJzbYSC0nWI15MXaoXJe2SikVhRJRnLxoLeSiSPsVfPjrcP1DbWpe0jTqiEw6MLnleJHOc1O3g==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr6437448lfu.619.1635456985989; 
 Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id s9sm396521ljg.76.2021.10.28.14.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
 Pavel Machek <pavel@ucw.cz>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 openbmc@lists.ozlabs.org, linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1837954-bd70-460d-3548-0d5ec5b75704@gmail.com>
Date: Fri, 29 Oct 2021 00:36:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143627_666124_8DC81875 
X-CRM114-Status: GOOD (  19.10  )
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

MjguMTAuMjAyMSAxMjo1MywgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPj4gKy8qKgo+
PiArICogc3RydWN0IHBvd2VyX2hhbmRsZXIgLSBNYWNoaW5lIHBvd2VyLW9mZiArIHJlc3RhcnQg
aGFuZGxlcgo+PiArICoKPj4gKyAqIERlc2NyaWJlcyBwb3dlci1vZmYgYW5kIHJlc3RhcnQgaGFu
ZGxlcnMgd2hpY2ggYXJlIGludm9rZWQgYnkga2VybmVsCj4+ICsgKiB0byBwb3dlciBvZmYgb3Ig
cmVzdGFydCB0aGlzIG1hY2hpbmUuICBTdXBwb3J0cyBwcmlvcml0aXplZCBjaGFpbmluZyBmb3IK
Pj4gKyAqIGJvdGggcmVzdGFydCBhbmQgcG93ZXItb2ZmIGhhbmRsZXJzLiAgQ2FsbGJhY2sncyBw
cmlvcml0eSBtdXN0IGJlIHVuaXF1ZS4KPj4gKyAqIEludGVuZGVkIHRvIGJlIHVzZWQgYnkgZGV2
aWNlIGRyaXZlcnMgdGhhdCBhcmUgcmVzcG9uc2libGUgZm9yIHJlc3RhcnRpbmcKPj4gKyAqIGFu
ZCBwb3dlcmluZyBvZmYgaGFyZHdhcmUgd2hpY2gga2VybmVsIGlzIHJ1bm5pbmcgb24uCj4+ICsg
Kgo+PiArICogU3RydWN0IHBvd2VyX2hhbmRsZXIgY2FuIGJlIHN0YXRpYy4gIE1lbWJlcnMgb2Yg
dGhpcyBzdHJ1Y3R1cmUgbXVzdCBub3QgYmUKPj4gKyAqIGFsdGVyZWQgd2hpbGUgaGFuZGxlciBp
cyByZWdpc3RlcmVkLgo+PiArICoKPj4gKyAqIEZpbGwgdGhlIHN0cnVjdHVyZSBtZW1iZXJzIGFu
ZCBwYXNzIGl0IHRvIHJlZ2lzdGVyX3Bvd2VyX2hhbmRsZXIoKS4KPj4gKyAqLwo+PiArc3RydWN0
IHBvd2VyX2hhbmRsZXIgewo+IFRoZSBuYW1lIG9mIHRoaXMgc3RydWN0dXJlIGlzIHRvbyBnZW5l
cmljIElNVi4gIFRoZXJlIGFyZSBtYW55IHRoaW5ncwo+IHRoYXQgaXQgbWlnaHQgYXBwbHkgdG8g
aW4gcHJpbmNpcGxlLgo+IAo+IFdoYXQgYWJvdXQgY2FsbGluZyBwb3dlcl9vZmZfaGFuZGxlciBv
ciBzeXNfb2ZmX2hhbmRsZXIgYXMgaXQgbmVlZCBub3QKPiBiZSBhYm91dCBwb3dlciBhdCBhbGw/
CgpJIGRpZG4ndCBsaWtlIG11Y2ggdGhlICdwb3dlcicgZWl0aGVyLCBidXQgY291bGRuJ3QgY29t
ZSB1cCB3aXRoIGEKYmV0dGVyIHZhcmlhbnQuIFdpbGwgY2hhbmdlIGl0IGluIHYzLCB0aGFuayB5
b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
