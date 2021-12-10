Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5CBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QCNETB/xTcbeB4wnPkRf70lgo20VO6aBtsvUYakoYmY=; b=BkX9mgoXlqkBX0QLjsrhilScXY
	tvd8jOUGBDCfDhEzpUIyx/pra/YfvRQiJK4vFffUq7seapJzj5QkBxw78CeyOr6JQh2ohvac5f84b
	Dk4o8nswm25IECPXEMrnOy3IwDk6Ea79l0F7EbpPftGuBDX4hRxfnA5EZSDCbTb+Z7ijlQmvbVsBL
	DXbXQTo1shgmXjgR5LroR42J8jy7IBDcIixv6siu5h5XSJNW4onhb6wKHsq/13ImHiv+v+8HfyyFn
	neg7S47/CQZBYaz6cmsP/sNT5sdpPvwfyn8z8/XqDB5iibph+8s5jlqU5LvM5/qbs2rqRPoCnOije
	6iYQN/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlii-003afN-29; Fri, 10 Dec 2021 19:38:16 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlie-003ae8-Ux; Fri, 10 Dec 2021 19:38:14 +0000
Received: by mail-lj1-x235.google.com with SMTP id k23so15262281lje.1;
 Fri, 10 Dec 2021 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vz91z0+ORqGgdBCzgXjvRZ+BnKWf40l2Uiz2VnVlq8k=;
 b=eZMbcUXJM6JFal7aKwXhI/zy2v2hsv6rjyETVziUEcyYhNcg6LAUN09SVbxxTQlCdu
 48ThdZHjH5oN83Vb3L4mJIfoBjma15qEEhMbLCJ9enFQmERgo4lteVUQPAb4Y8JgOjsq
 7ZmOQ7grPhjGYig7dCgOjLZZBHSDH75bpeiQUz0UkPGOU7rsqJhk71e0rLD6TE0flZ2X
 dazEIm86TjOs0vu1kBQHUAQAqwylSJZ01JBHT6WLG7J/LOnVfkO/7b9CPxeuZ6NJ8BMo
 jKCmkVO9SLg4PsHP720p1V12OBYdWJK0lEqLDpCAuJd3HSFk0stATZ42n3vOpzDj4hRW
 GlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vz91z0+ORqGgdBCzgXjvRZ+BnKWf40l2Uiz2VnVlq8k=;
 b=6ztWrosd5sjNXL9OmEFRxVxoWOg9wIo3nAdzrQccSbCIGzXqKy7au129lx/2Apgb0V
 ksNWc21PYY7zziBGnRvXWbYAK63MF6DWTHuTIsp+mQR90aJtQ29/ri5BMOJ64sueBPyE
 n+AOf1lS1XRsBjBsMpFuBLPZqLB/B/5StD9prltPL8ngSudwnn0ks/3V7GzxLB33YJMj
 Z3LZX/9nBlOYZejjHWmX3OHsH89Yd7wAJaDlK+acLf5mT5B7U6mGF7rbv55MRAPGdflK
 o4UwTXJAXu8PUe+IC/OTBZOydPvY24T8zpP9cbo+UImTLv2/uJs1QEDkMsEjxJpmBCtw
 e5QA==
X-Gm-Message-State: AOAM531oqyBQU0v2J3CL6nvRo2LdL3fJk1TzRW7kxeDutBNv55Z8Efro
 cBn3gQsGGZjYUhup6hlO52k=
X-Google-Smtp-Source: ABdhPJwmRMsITckKyfKcY5/bceJH9ZYTPTjj0S432HFHTKbLTU9WPpBsAnrN2ZIngDo5MzFGTcTiYQ==
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr14941958ljb.271.1639165089500; 
 Fri, 10 Dec 2021 11:38:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id g26sm381590ljn.107.2021.12.10.11.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:38:09 -0800 (PST)
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
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
 <20211126180101.27818-7-digetx@gmail.com>
 <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
 <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
 <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <41415df9-0d08-2944-5cf2-493468e21a22@gmail.com>
Date: Fri, 10 Dec 2021 22:38:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_113813_027554_C67F5F23 
X-CRM114-Status: GOOD (  21.13  )
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

MTAuMTIuMjAyMSAyMjowOCwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IERlYyAxMCwgMjAyMSBhdCA3OjU0IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IDEwLjEyLjIwMjEgMjE6MzIsIFJhZmFlbCBKLiBXeXNvY2tpINC/0LjR
iNC10YI6Cj4+PiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCA3OjAyIFBNIERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBFbWl0IHdhcm5pbmcgaWYgdW5y
ZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIoKSBmYWlscyBzaW5jZSBpdCBuZXZlciBzaG91bGQKPj4+
PiBmYWlsLiBUaGlzIHdpbGwgZWFzZSBmdXJ0aGVyIEFQSSBkZXZlbG9wbWVudCBieSBjYXRjaGlu
ZyBtaXN0YWtlcyBlYXJseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiAga2VybmVsL3JlYm9vdC5jIHwgMiAr
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvcmVib290LmMgYi9rZXJuZWwvcmVib290LmMKPj4+
PiBpbmRleCBlNjY1OWFlMzI5ZjEuLmYwZTdiOWMxM2Y2YiAxMDA2NDQKPj4+PiAtLS0gYS9rZXJu
ZWwvcmVib290LmMKPj4+PiArKysgYi9rZXJuZWwvcmVib290LmMKPj4+PiBAQCAtMjEwLDcgKzIx
MCw3IEBAIEVYUE9SVF9TWU1CT0wocmVnaXN0ZXJfcmVzdGFydF9oYW5kbGVyKTsKPj4+PiAgICov
Cj4+Pj4gIGludCB1bnJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcihzdHJ1Y3Qgbm90aWZpZXJfYmxv
Y2sgKm5iKQo+Pj4+ICB7Cj4+Pj4gLSAgICAgICByZXR1cm4gYXRvbWljX25vdGlmaWVyX2NoYWlu
X3VucmVnaXN0ZXIoJnJlc3RhcnRfaGFuZGxlcl9saXN0LCBuYik7Cj4+Pj4gKyAgICAgICByZXR1
cm4gV0FSTl9PTihhdG9taWNfbm90aWZpZXJfY2hhaW5fdW5yZWdpc3RlcigmcmVzdGFydF9oYW5k
bGVyX2xpc3QsIG5iKSk7Cj4+Pgo+Pj4gVGhlIG9ubHkgcmVhc29uIHdoeSBpdCBjYW4gZmFpbCBp
cyBpZiB0aGUgb2JqZWN0IHBvaW50ZWQgdG8gYnkgbmIgaXMKPj4+IG5vdCBpbiB0aGUgY2hhaW4u
Cj4+Cj4+IEkgaGFkIGV4YWN0bHkgdGhpcyBjYXNlIHdoZXJlIG9iamVjdCB3YXNuJ3QgaW4gdGhl
IGNoYWluIGR1ZSB0byBhIGJ1Zwo+PiBhbmQgdGhpcyB3YXJuaW5nIHdhcyB2ZXJ5IGhlbHBmdWwu
Cj4gCj4gRHVyaW5nIHRoZSBkZXZlbG9wbWVudC4gIEluIHByb2R1Y3Rpb24gaXQgd291bGQgYmUg
cmF0aGVyIGFubm95aW5nLgo+IAo+Pj4gIFdoeSBXQVJOKCkgYWJvdXQgdGhpcz8gIEFuZCB3aGF0
IGFib3V0IHN5c3RlbXMgd2l0aAo+Pj4gcGFuaWNfb25fd2FybiBzZXQ/Cj4+Cj4+IFRoYXQgd2Fy
bmluZyBjb25kaXRpb24gd2lsbCBuZXZlciBoYXBwZW4gbm9ybWFsbHksIG9ubHkgd2hlbiBzb21l
dGhpbmcKPj4gaXMgc2VyaW91c2x5IHdyb25nLgo+Pgo+PiBUaG9zZSBzeXN0ZW1zIHdpdGggcGFu
aWNfb25fd2FybiB3aWxsIGdldCB3aGF0IHdhcyB0aGV5IGFza2VkIGZvci4KPiAKPiBUaGV5IG1h
eSBub3QgYmUgYXNraW5nIGZvciBwYW5pY2tpbmcgb24gYnVncyBpbiB0aGUgcmVib290IG5vdGlm
aWVyCj4gY29kZSwgdGhvdWdoLiAgVGhhdCdzIHdoYXQgeW91ciBjaGFuZ2UgaXMgbWFraW5nIHRo
ZW0gcGFuaWMgb24uCj4gCgpBbHJpZ2h0LCBJJ2xsIGRyb3AgdGhlIHdhcm5pbmdzIGFuZCB0dXJu
IHRoZSB3YXJuaW5nIGFib3V0IHVuaXF1ZW5lc3MKaW50byBlcnJvciBvciB3YXJuaW5nIG1lc3Nh
Z2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
