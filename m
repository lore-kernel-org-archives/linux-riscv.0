Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9E4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FDC60F70
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64FDC60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VX1o8wIoqo8x42TcB+kTEKVWR73nyKO6cTefGYAkIDE=; b=P4qRIff4syilNJSnrODnSFYkGc
	KYpdZDx7+F5q62EGJD7ygtAZu/pU68ccf0yAg2/um+oJ9NufXRKgk9MhO0FtN43MBt+bfYIaCRfS/
	SGii0hsNLlHOWwDBr7bJPUgwaq0VeonY/iZAEbEpNKWWtvjzaDwCcorEd9Tm+MWvUAGo40Ok8Pc+B
	jIu2SeSWWfkiTOmTx9/mrjoErsn9mZB8DqX63NbSrigzsRq7syyUybe1S7zZRxUUOeOpnpjVswx73
	sWDwawKqNxnCDDe5qOmTReRGHlBT0qnFrH1Yj8CEkI6lVveoSYKpGtJYIyvnI8Glh9fGQo623zJSc
	PtbCYMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDRB-009Cgo-JX; Thu, 28 Oct 2021 21:59:53 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgDR8-009Cg1-Tp; Thu, 28 Oct 2021 21:59:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 1so7251303ljv.2;
 Thu, 28 Oct 2021 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7iQ4oU5lLihLvwqt++KnGQLKBiUKhW8mB9CMlvRrAlo=;
 b=A2gDnKnXbVmAEWSfC30h5AU4KgqctGREzx+w+qi3liDGTlzRRXf3E1jZyML8gNPqGK
 Li6mIZ0lXuGBdwOE60K0G95Tgukhjr9rRKc5cXQiD0w/VxhtL95meDusnxyabh4+EWGW
 r0TYt6OWs+PjfxzqoZ6eJ3DrcMZlu658BTNljXfs4JxLykUHrLNYB1GLE4vhnXR1mGD/
 zsbBpAOKKFkkKsVx+h1bPiV6KMSfM+yc+Xd2DvoUE9RQ/ZfhiCHVvnICfk2iVe468EjX
 DSGsN20SLeM1V9+yNC6BNE7z4vvudCJzb443pi2WeFnCmYQbcFE9zeHCdAOjGieXrkv9
 /UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7iQ4oU5lLihLvwqt++KnGQLKBiUKhW8mB9CMlvRrAlo=;
 b=fOjwhv5CA7jei8R6Hs+gsZWAv+ckdW9S2oRNPcuq/ifB8QCBRYsBcyTUIoDJw3YYUY
 L9piErQhSBgq4AURJx0omJ/dtu8CcN9x0/ptFQDP/y79s0rDr+Nu2P6XkD0tYfJJypMp
 3pW6pg1+Yvoa956DxWpiX0JJeIA5jCIJBdOUdiuIfzFMUxr9Hnn7YdV6qZ3nHLhvR6ph
 hkews94bJeMh2asmioAXJpMHWSlTCrWgM2YVq/sv51Eh+Ucp/wCoEhXep2/7tLjdOXkL
 b5eKP3ggigsb3Gzmq+gX2fFpMq1OHoCtRw4BhSu3CbWcs6qDUc6FXQVmYqKdUZm01oj3
 2ymg==
X-Gm-Message-State: AOAM532NKaFjU2pT66a2QR/idKfGhtXAjUg5XCQFlSltpihY+3lOv1A3
 ACL8WFKgbSxLZhoZ2myfdVc=
X-Google-Smtp-Source: ABdhPJxS5C9pTHHcX2SeZO1OzU/OwueG01d90Y/t9QArtk4xiAh7ZBD5U7QFitj+IF+gde/bz4TCKA==
X-Received: by 2002:a2e:9d93:: with SMTP id c19mr7265789ljj.363.1635458389307; 
 Thu, 28 Oct 2021 14:59:49 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id e12sm398160ljp.30.2021.10.28.14.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:59:49 -0700 (PDT)
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
 <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <31547403-969e-91a9-0792-6fd657b78503@gmail.com>
Date: Fri, 29 Oct 2021 00:59:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_145950_984848_9452D44F 
X-CRM114-Status: GOOD (  19.46  )
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

MjguMTAuMjAyMSAxMjo1OSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPj4gKy8qKgo+
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
IHBvd2VyX2hhbmRsZXIgewo+PiArICAgICAgIC8qKgo+PiArICAgICAgICAqIEBjYl9kYXRhOgo+
PiArICAgICAgICAqCj4+ICsgICAgICAgICogVXNlciBkYXRhIGluY2x1ZGVkIGluIGNhbGxiYWNr
J3MgYXJndW1lbnQuCj4+ICsgICAgICAgICovCj4gQW5kIGhlcmUgSSB3b3VsZCBkb2N1bWVudCB0
aGUgc3RydWN0dXJlIGZpZWxkcyBpbiB0aGUgbWFpbiBrZXJuZWxkb2MKPiBjb21tZW50IGFib3Zl
Lgo+IAo+IEFzIGlzLCBpdCBpcyBhIGJpdCBoYXJkIHRvIGdyYXNwIHRoZSB3aG9sZSBkZWZpbml0
aW9uLgo+IAoKSSdsbCBtb3ZlIHRoZSBjb21tZW50cyBpbiB2MywgdGhhbmtzLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
