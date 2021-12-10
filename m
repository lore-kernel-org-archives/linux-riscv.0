Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B00C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y0gDvGkvUbCB4i6Zq4jk1AngbHP7jAoLY8ZaJc6LJOE=; b=GaPbYx4tSjzEPZcwarYH5j0pCT
	cuOsENVRTUbw7sUA7M7hincZV6cXat6eyI18w9xgZcoFhSG0vDlDY24Z0ogxgdJCoxC24WQBlnRkK
	fPLHdeDtnjI+mcf8Dm6QrRVV5itfdJ4RjhQKQjal9AtDtYB483srHA74bkWkQ2vCjFCmaN/itUNjY
	1GTNsgzSWc/kOxuKWqeBXUgxVA6NJ802qFIcXnQ+4m024yKx6rMVJqwwMV3uLhVeUYVe55gw/IHXO
	P4rA8bu/3JjIBluUeF+BWpoQ5emgimT1VlMAp/+1RYlIM7EpRup14MjdO9PvbX0dP0z4/7lmaS3pE
	WjNXleSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlQ5-003Ti9-Ua; Fri, 10 Dec 2021 19:19:02 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvl02-003Ip4-Lt; Fri, 10 Dec 2021 18:52:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id z7so19640610lfi.11;
 Fri, 10 Dec 2021 10:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j1hvlB2w2BrWNScbCJyLwX4oBGKG9hr6NJqtvFkNM/U=;
 b=DpLCPmMgrOty3y0HrpqopSxxp/qGs/dwG/CgN0apuyA6on28PorJtUybksa6iWzXUQ
 1nC+svp1ZReaFc8Ho69TZxII0UpyuP8U7xwSjZaJzyMIRrgh64VdMWwWLpT7FD5pRO3K
 REVQTxyYOO3tzHZOXPhjO1pz+wC6sFrKKUXdbaxaG08xMkm/2y6DNn/B8j1qrJKM7+bp
 P06T1NhQFOSTeILIcDdZiYIbm1FILYdO04vFRszXD6zy1FhLrwMPIaNrfLI1p4FempaK
 JIbIyvDEnU7xy4tOpOMAsYn+ngt9JZU69+QjylTYb0y426O41rF96XAtvzhN80gJmNuF
 j5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1hvlB2w2BrWNScbCJyLwX4oBGKG9hr6NJqtvFkNM/U=;
 b=gGwFGUMFYALiDcZXzcrvVDOTa+OVgfytliPIo6/sW6Y29KO/2+E69n2BxycCgvaWKN
 5dCcsjr0YfPXh+pWBV444c5LntGa/wCpCYT70xVmuTQKT7/q9tyCzsD3VLRi6jhRGnvZ
 6LpRkWLRwclrb2oGke3bmRQeNkbL40UwDVcUQ7WU0t9Rwe+geWimaqQZI18Q9AvNY9bH
 cS7Lgy82IqtLTK9NK8UfqTa6kKziN9gpVwmH/PhzXz0jzYFJkmNmhb7i7sb0T7xRnICV
 h8oFJbMec4NgKIInuxEYQxfYPotscpZKMqsBbrJ6QjWZej8HtOgbK70iSkzpzp/febi/
 vSew==
X-Gm-Message-State: AOAM531tIOBxIjKvUsM8diCapXg5zDnYs0zxC7JD64aBarE/YHXem7di
 jdbxfjIUfttL68EixaC+VlE=
X-Google-Smtp-Source: ABdhPJwwyZAuw0wQQ6Dju/0DgEoENSIDq2aqqR4iP7Vldq5bfh8DtMEIrZOS6poEr19ZPeaYgjpDkg==
X-Received: by 2002:ac2:58d9:: with SMTP id u25mr14351127lfo.514.1639162324540; 
 Fri, 10 Dec 2021 10:52:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c21sm387216lfv.29.2021.12.10.10.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:52:04 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
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
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
Date: Fri, 10 Dec 2021 21:52:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_105206_797010_B26B1642 
X-CRM114-Status: GOOD (  24.43  )
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

MTAuMTIuMjAyMSAyMToxOSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKLi4uCj4+ICti
b29sIGF0b21pY19ub3RpZmllcl9oYXNfdW5pcXVlX3ByaW9yaXR5KHN0cnVjdCBhdG9taWNfbm90
aWZpZXJfaGVhZCAqbmgsCj4+ICsgICAgICAgICAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
Km4pCj4+ICt7Cj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gKyAgICAgICBib29s
IHJldDsKPj4gKwo+PiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZuaC0+bG9jaywgZmxhZ3Mp
Owo+PiArICAgICAgIHJldCA9IG5vdGlmaWVyX2hhc191bmlxdWVfcHJpb3JpdHkoJm5oLT5oZWFk
LCBuKTsKPj4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZuaC0+bG9jaywgZmxhZ3Mp
Owo+IAo+IFRoaXMgb25seSB3b3JrcyBpZiB0aGUgY2FsbGVyIGNhbiBwcmV2ZW50IG5ldyBlbnRy
aWVzIGZyb20gYmVpbmcgYWRkZWQKPiB0byB0aGUgbGlzdCBhdCB0aGlzIHBvaW50IG9yIGlmIHRo
ZSBjYWxsZXIga25vd3MgdGhhdCB0aGV5IGNhbm5vdCBiZQo+IGFkZGVkIGZvciBzb21lIHJlYXNv
biwgYnV0IHRoZSBrZXJuZWxkb2MgZG9lc24ndCBtZW50aW9uIHRoaXMKPiBsaW1pdGF0aW9uLgoK
SSdsbCB1cGRhdGUgdGhlIGNvbW1lbnQuCgouLgo+PiArYm9vbCBibG9ja2luZ19ub3RpZmllcl9o
YXNfdW5pcXVlX3ByaW9yaXR5KHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkICpuaCwKPj4g
KyAgICAgICAgICAgICAgIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKPj4gK3sKPj4gKyAgICAg
ICBib29sIHJldDsKPj4gKwo+PiArICAgICAgIC8qCj4+ICsgICAgICAgICogVGhpcyBjb2RlIGdl
dHMgdXNlZCBkdXJpbmcgYm9vdC11cCwgd2hlbiB0YXNrIHN3aXRjaGluZyBpcwo+PiArICAgICAg
ICAqIG5vdCB5ZXQgd29ya2luZyBhbmQgaW50ZXJydXB0cyBtdXN0IHJlbWFpbiBkaXNhYmxlZC4g
QXQgc3VjaAo+PiArICAgICAgICAqIHRpbWVzIHdlIG11c3Qgbm90IGNhbGwgZG93bl9yZWFkKCku
Cj4+ICsgICAgICAgICovCj4+ICsgICAgICAgaWYgKHN5c3RlbV9zdGF0ZSAhPSBTWVNURU1fQk9P
VElORykKPiAKPiBObywgcGxlYXNlIGRvbid0IGRvIHRoaXMsIGl0IG1ha2VzIHRoZSB3aG9sZSB0
aGluZyBlcnJvci1wcm9uZS4KCldoYXQgc2hvdWxkIEkgZG8gdGhlbj8KCj4+ICsgICAgICAgICAg
ICAgICBkb3duX3JlYWQoJm5oLT5yd3NlbSk7Cj4+ICsKPj4gKyAgICAgICByZXQgPSBub3RpZmll
cl9oYXNfdW5pcXVlX3ByaW9yaXR5KCZuaC0+aGVhZCwgbik7Cj4+ICsKPj4gKyAgICAgICBpZiAo
c3lzdGVtX3N0YXRlICE9IFNZU1RFTV9CT09USU5HKQo+PiArICAgICAgICAgICAgICAgdXBfcmVh
ZCgmbmgtPnJ3c2VtKTsKPiAKPiBBbmQgc3RpbGwgd2hhdCBpZiBhIG5ldyBlbnRyeSB3aXRoIGEg
bm9uLXVuaXF1ZSBwcmlvcml0eSBpcyBhZGRlZCB0bwo+IHRoZSBjaGFpbiBhdCB0aGlzIHBvaW50
PwoKSWYgZW50cnkgd2l0aCBhIG5vbi11bmlxdWUgcHJpb3JpdHkgaXMgYWRkZWQgYWZ0ZXIgdGhl
IGNoZWNrLCB0aGVuCm9idmlvdXNseSBpdCB3b24ndCBiZSBkZXRlY3RlZC4gSSBkb24ndCB1bmRl
cnN0YW5kIHRoZSBxdWVzdGlvbi4gVGhlc2UKZG93bi91cF9yZWFkKCkgYXJlIHRoZSBsb2NrcyB0
aGF0IHByZXZlbnQgdGhlIHJhY2UsIGlmIHRoYXQncyB0aGUgcXVlc3Rpb24uCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
