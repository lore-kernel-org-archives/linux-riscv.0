Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C59DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wttTQK6bLetrU2Du4ZBatxtiwe7vj4clXnjlN8rct+4=; b=3q57yhCHzyURouLt950zmZhiLj
	5g8l5KDlIEVWJ5cGIqKA1ZNEYwi8Grl0ebhIIdtRXU+7zqrX0A/Y0yXvWcjja5GlpVRNh4c1WBawX
	r6nUR3d+qjVE8XVMtRzfox7C++FK08P1eWWCn1uBJ66JpWSGfTRGIOZ0qwKkV4w3xQG23j4IPVpjQ
	qQaMHn5V9kEDSmc7+vV2fzooWrnISW2IxJnq9TJSInJVM8h54Hpd/GADLJ1/Fr1OYgKQq4S/7T6Az
	07QJBcPzPHlrH0+d9yRhWRRX+twl1+376HY4A+eWM/wOOu5G9STei6Ptgzy3XRwmnVP1CwXFMSv/5
	JFGob5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlp2-003bdD-6d; Fri, 10 Dec 2021 19:44:48 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlp0-003bcV-3t; Fri, 10 Dec 2021 19:44:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id l22so19892969lfg.7;
 Fri, 10 Dec 2021 11:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bghkq/gqakBG3UMA9KtKqv9kgT5Wq1LJh/DaMMP+Buo=;
 b=lFdiyPZK17AYCTV65ZUsvdfciaNUYWPxmzSgJajTwQ07RVOIMn5cd3OMLqgm70DBAO
 sO9a+0M7Ylp7HtPfjlNdELPWJPhFEsL+BBJZhlleZ8ktrzvWgXu2rCggboh+AgCAyR+i
 WdIEhcqPzr+EGbl0oQk36HsGosG8oJ4OqatnVU+rYKpyd3R/jmhh8wJ5nt8gGw45GBZy
 rNd0gesXdm60r4RJ7qNGWsHGKiq3UiUqi5FkpCzhl0LGExdzbir7EPh4UTzIBF/YRE+s
 kyUVKadGSflj2NYa6m+B4vuldmIqJM59VgWObzoRC+XA5qxz4D0b/H+jRuY2tRZWYoPI
 /XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bghkq/gqakBG3UMA9KtKqv9kgT5Wq1LJh/DaMMP+Buo=;
 b=Yza/ktPCaTCbmesJq4VHJAa7mCMQNn8fUkMAEbXN4HQk2A2noq5QwyUZW6EigR/GL/
 tkR9OrWJAn/ofAeAtSuWLbDFst8+yvCZKoaLfakF2zOrxxfaCcbgKP7CaFynZ0Ktr7Mh
 PehFMiDSrYZnSBtHvsKHbDeinZc368VPgXs5hZ3aiXI+vZGj+cY8QG/B/dOS+DwnY85d
 ZZDgZjINlIp4fORfN28Lr/WMoebytx/phrtcEROQeK7L+rSRZV6oWL1PU9QfsXMZVU1Y
 xrq6x3l7ROknMCK/QV+chg/AxLVSeXeKhiTxGcXHJ9i5ZsGvel8An8KOfExbNEkyUc45
 +K6g==
X-Gm-Message-State: AOAM53053mZ7fRqMj7g/+zQE5+dLq0OaY0d/2j0AqRs2clxT4g2QLL8T
 kCERN/4Tinv580qQr2Trdew=
X-Google-Smtp-Source: ABdhPJwdPpKxpD5iCVpMoy0RbhPzj8+6gSmN9/Uu5pMKxteqUazmF0c3BRQXsHXIE6Vu9MIa4P5vrA==
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr14291331lfk.517.1639165484083; 
 Fri, 10 Dec 2021 11:44:44 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c15sm394938lfb.154.2021.12.10.11.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:44:43 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
 <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Message-ID: <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
Date: Fri, 10 Dec 2021 22:44:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_114446_206007_CE60456B 
X-CRM114-Status: GOOD (  21.73  )
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

MTAuMTIuMjAyMSAyMjo0MiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+Pj4gVGhl
cmUgaXMgbm8gc3Ryb25nIHJlcXVpcmVtZW50IGZvciBwcmlvcml0aWVzIHRvIGJlIHVuaXF1ZSwg
dGhlIHJlYm9vdC5jCj4+PiBjb2RlIHdpbGwgd29yayBwcm9wZXJseS4KPj4KPj4gSW4gd2hpY2gg
Y2FzZSBhZGRpbmcgdGhlIFdBUk4oKSBpcyBub3QgYXBwcm9wcmlhdGUgSU1WLgo+Pgo+PiBBbHNv
IEkndmUgbG9va2VkIGF0IHRoZSBleGlzdGluZyBjb2RlIGFuZCBhdCBsZWFzdCBpbiBzb21lIGNh
c2VzIHRoZQo+PiBvcmRlciBpbiB3aGljaCB0aGUgbm90aWZpZXJzIHJ1biBkb2Vzbid0IG1hdHRl
ci4gIEknbSBub3Qgc3VyZSB3aGF0Cj4+IHRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgVEJI
Lgo+IAo+IFRoZSBwdXJwb3NlIGlzIHRvIGxldCBkZXZlbG9wZXIga25vdyB0aGF0IGRyaXZlciBu
ZWVkcyB0byBiZSBjb3JyZWN0ZWQuCj4gCj4+PiBUaGUgcG90ZW50aWFsIHByb2JsZW0gaXMgb24g
dGhlIHVzZXIncyBzaWRlIGFuZCB0aGUgd2FybmluZyBpcyBpbnRlbmRlZAo+Pj4gdG8gYWlkIHRo
ZSB1c2VyLgo+Pgo+PiBVbmxlc3Mgc29tZWJvZHkgaGFzIHRoZSBwYW5pY19vbl93YXJuIG1lbnRp
b25lZCBwcmV2aW91c2x5IHNldCBhbmQKPj4gcmVhbGx5IHRoZSB1c2VyIG5lZWQgbm90IHVuZGVy
c3RhbmQgd2hhdCB0aGUgV0FSTigpIGlzIGFib3V0LiAgSU9XLAo+PiBXQVJOKCkgaGVscHMgZGV2
ZWxvcGVycywgbm90IHVzZXJzLgo+Pgo+Pj4gV2UgY2FuIG1ha2UgaXQgYSBzdHJvbmcgcmVxdWly
ZW1lbnQsIGJ1dCBvbmx5IGFmdGVyIGNvbnZlcnRpbmcgYW5kCj4+PiB0ZXN0aW5nIGFsbCBrZXJu
ZWwgZHJpdmVycy4KPj4KPj4gUmlnaHQuCj4+Cj4+PiBJJ2xsIGNvbnNpZGVyIHRvIGFkZCBwYXRj
aGVzIGZvciB0aGF0Lgo+Pgo+PiBCdXQgY2FuIHlvdSBhdm9pZCBhZGRpbmcgbW9yZSBwYXRjaGVz
IHRvIHRoaXMgc2VyaWVzPwo+IAo+IEkgd29uJ3QgYWRkIG1vcmUgcGF0Y2hlcyBzaW5jZSBzdWNo
IHBhdGNoZXMgY2FuIGJlIGFkZGVkIG9ubHkgYWZ0ZXIKPiBjb21wbGV0aW9uIG9mIHRyYW5zaXRp
b24gdG8gdGhlIG5ldyBBUEkgb2YgdGhlIHdob2xlIGtlcm5lbC4KPiAKClRoYW5rIHlvdSBmb3Ig
dGhlIHJldmlldy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
