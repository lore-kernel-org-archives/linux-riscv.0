Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JBOZsj/kncAkWakcpEmGEl4uMDLjhp5n6DVOWyORQx4=; b=0/LFH4zN8fd+xbT89asmNpgQzs
	CpEJBsZOKETDZhTch1JD/0W5uZ3wZKYyz+3jr6+J4UrQWwNwgwdoQ1B+zd9Nm2JS0q+OfSBbud7Yi
	KxbyiXyWDpX2wpWMJomhgZd+PxhmJSuGf4N95PkOw+PkxcOchXxyo0o1O9A81LFuhzGQmCEqeLNGu
	GKjqgfSViOncpkt4fs6ekCue2QJKhi/82TlCasOCBX0QwzlUzAvEAJIkcNQ4rxowg/O75w5iDGlIN
	6W6+052RpvsvymXXQmV1EkIoxELaYJfrMjDGl8+evtAAOtWr2DOLFd12uWo2/Ldn4mWJaMZadgMv8
	oB4ZZtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkUj-003BSL-OG; Fri, 10 Dec 2021 18:19:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkUh-003BQB-5v; Fri, 10 Dec 2021 18:19:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id t26so19552810lfk.9;
 Fri, 10 Dec 2021 10:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
 b=AqjAg4O7giyzVdt+tBG9uHdplJtifqxLx/yVu+cgoY6plA3iYDA6wXW+lamp4aSGK0
 JtAw3aPoKL/gydUbbFYOf1pi7KNgtnB7CRHE+MknWMiFR30YU057EAppHMp3RQPfHd8d
 06yVvqsThCCunZ4BRns7COFfMth1pjRjda7taFbydUf0oWJrqvgB05orw4q9ScnuxSKa
 RGrhlOCs187IEnib8HCpTe8JzWEZV9cVroOWHPffKJtOeT7C/Fogm7PG4qgUyWMygMmF
 ds56Fkt5Zck/MXhrzJhxcRgHcy1bwpmNWqyftpmBQa7CL/iiV+9v5OptrusSns2ZXc73
 k16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
 b=WnjDXxezFPMWcSXfoqZYZt3uvKF7MdWwczu991mHDppPeMivN4UPb3HUkYvwGOShhY
 1BZLkSJWvvbefqx2nsYfdSy+9ZbwM51sqQ5dHGHsRk89cwpCL8wXcXR8f5y8WFq+pZqg
 5F9L42XSdXlBcy2omo7p3nYzK/H9xX9LtMvS4P/HD+ATle7vtGCLXQfti2i5evNMCQUh
 h4GgCCr+xWsNViBoll5BZlocOhVjb3LUEQNL3ZxlfxBNxqsogncE1vOnJKmOmITnDzLO
 NOJd0Vj4gYnJx3pkNWxjgvlCHd3r2bIJhhO3H+oIUZHU9c3xpRrrYGSna/4pFcbFSlre
 KAXg==
X-Gm-Message-State: AOAM530DU44oOxubxp64FWeGytpbpHW8HD69z6wRVqZg7K94ELv+1zxG
 ds7dgW1WfohTPvZJzpzB8+o=
X-Google-Smtp-Source: ABdhPJzMrOyS+fXdy9iuUu0OwY3ayky869D80K4hHhkf8whZoWRjpK8Gq06BVfaBtvKTtjzQFmSyrg==
X-Received: by 2002:a05:6512:2603:: with SMTP id
 bt3mr13366040lfb.202.1639160372149; 
 Fri, 10 Dec 2021 10:19:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id u16sm379604lfu.42.2021.12.10.10.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:19:31 -0800 (PST)
Subject: Re: [PATCH v4 02/25] notifier: Add
 blocking_notifier_call_chain_is_empty()
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
 <20211126180101.27818-3-digetx@gmail.com>
 <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9307a684-0b0b-0488-75be-7845d9b973a1@gmail.com>
Date: Fri, 10 Dec 2021 21:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_101943_236290_1DD5FF0C 
X-CRM114-Status: GOOD (  21.00  )
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

MTAuMTIuMjAyMSAyMToxNCwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCA3OjAxIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEFkZCBibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluX2lzX2VtcHR5
KCkgdGhhdCByZXR1cm5zIHRydWUgaWYgY2FsbAo+PiBjaGFpbiBpcyBlbXB0eS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4g
IGluY2x1ZGUvbGludXgvbm90aWZpZXIuaCB8ICAyICsrCj4+ICBrZXJuZWwvbm90aWZpZXIuYyAg
ICAgICAgfCAxNCArKysrKysrKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmggYi9pbmNs
dWRlL2xpbnV4L25vdGlmaWVyLmgKPj4gaW5kZXggNGI4MGE4MTViNjY2Li45MjRjOWQ3YzhlNzMg
MTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbm90aWZpZXIuaAo+PiArKysgYi9pbmNsdWRl
L2xpbnV4L25vdGlmaWVyLmgKPj4gQEAgLTE3Myw2ICsxNzMsOCBAQCBpbnQgYmxvY2tpbmdfbm90
aWZpZXJfY2FsbF9jaGFpbl9yb2J1c3Qoc3RydWN0IGJsb2NraW5nX25vdGlmaWVyX2hlYWQgKm5o
LAo+PiAgaW50IHJhd19ub3RpZmllcl9jYWxsX2NoYWluX3JvYnVzdChzdHJ1Y3QgcmF3X25vdGlm
aWVyX2hlYWQgKm5oLAo+PiAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2YWxfdXAsIHVu
c2lnbmVkIGxvbmcgdmFsX2Rvd24sIHZvaWQgKnYpOwo+Pgo+PiArYm9vbCBibG9ja2luZ19ub3Rp
Zmllcl9jYWxsX2NoYWluX2lzX2VtcHR5KHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkICpu
aCk7Cj4+ICsKPj4gICNkZWZpbmUgTk9USUZZX0RPTkUgICAgICAgICAgICAweDAwMDAgICAgICAg
ICAgLyogRG9uJ3QgY2FyZSAqLwo+PiAgI2RlZmluZSBOT1RJRllfT0sgICAgICAgICAgICAgIDB4
MDAwMSAgICAgICAgICAvKiBTdWl0cyBtZSAqLwo+PiAgI2RlZmluZSBOT1RJRllfU1RPUF9NQVNL
ICAgICAgIDB4ODAwMCAgICAgICAgICAvKiBEb24ndCBjYWxsIGZ1cnRoZXIgKi8KPj4gZGlmZiAt
LWdpdCBhL2tlcm5lbC9ub3RpZmllci5jIGIva2VybmVsL25vdGlmaWVyLmMKPj4gaW5kZXggYjgy
NTFkYzBiYzBmLi5iMjBjYjdiOWIxZjAgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9ub3RpZmllci5j
Cj4+ICsrKyBiL2tlcm5lbC9ub3RpZmllci5jCj4+IEBAIC0zMjIsNiArMzIyLDIwIEBAIGludCBi
bG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluKHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFk
ICpuaCwKPj4gIH0KPj4gIEVYUE9SVF9TWU1CT0xfR1BMKGJsb2NraW5nX25vdGlmaWVyX2NhbGxf
Y2hhaW4pOwo+Pgo+PiArLyoqCj4+ICsgKiAgICAgYmxvY2tpbmdfbm90aWZpZXJfY2FsbF9jaGFp
bl9pc19lbXB0eSAtIENoZWNrIHdoZXRoZXIgbm90aWZpZXIgY2hhaW4gaXMgZW1wdHkKPj4gKyAq
ICAgICBAbmg6IFBvaW50ZXIgdG8gaGVhZCBvZiB0aGUgYmxvY2tpbmcgbm90aWZpZXIgY2hhaW4K
Pj4gKyAqCj4+ICsgKiAgICAgQ2hlY2tzIHdoZXRoZXIgbm90aWZpZXIgY2hhaW4gaXMgZW1wdHku
Cj4+ICsgKgo+PiArICogICAgIFJldHVybnMgdHJ1ZSBpcyBub3RpZmllciBjaGFpbiBpcyBlbXB0
eSwgZmFsc2Ugb3RoZXJ3aXNlLgo+PiArICovCj4+ICtib29sIGJsb2NraW5nX25vdGlmaWVyX2Nh
bGxfY2hhaW5faXNfZW1wdHkoc3RydWN0IGJsb2NraW5nX25vdGlmaWVyX2hlYWQgKm5oKQo+PiAr
ewo+PiArICAgICAgIHJldHVybiAhcmN1X2FjY2Vzc19wb2ludGVyKG5oLT5oZWFkKTsKPj4gK30K
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGJsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW5faXNfZW1w
dHkpOwo+IAo+IFRoZSBjaGVjayBpcyBub3QgcmVsaWFibGUgKHJhY3kpIHdpdGhvdXQgbG9ja2lu
Zywgc28gSSB3b3VsZG4ndCBleHBvcnQKPiBhbnl0aGluZyBsaWtlIHRoaXMgdG8gbW9kdWxlcy4K
PiAKPiBBdCBsZWFzdCBJTU8gaXQgc2hvdWxkIGJlIGFkZGVkIGFsb25nIHdpdGggYSB1c2VyLgo+
IAoKSSdsbCByZW1vdmUgdGhlIGV4cG9ydCBzaW5jZSBpdCdzIGluZGVlZCBub3Qgb2J2aW91cyBo
b3cgb3RoZXIgdXNlcnMgbWF5CndhbnQgdG8gdXNlIHRoaXMgZnVuY3Rpb24uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
