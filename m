Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0A1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0/gJmm7/PaiuYxorw/PnkWV5wI4ZfaLbdxg6cTr9a5o=; b=2P6X2DmWFxOzd6gTLlU9waWsKE
	ITSUJH/cP9YX4cF1AKCBiPkpXjUfJ0LrP962XqAyVmVrk/JCpSiwkSoZJ0+7inTHTmUnackJGbB2S
	dnMrRR2FN6i4Kk0dA6g4t51QyNPDQIN/tqTWc07zmd+xZgViOqS2h3nXV3amq1S+vOhsFgvpzgB8P
	C84ei1FPiLW0efOHYL+CLoE5IdtOAILG5xQ3tMYz3l9wkAbKkLOEDjX++8Nw4d4rWMGRYlROKRvZO
	RJzTCr5hOFpTJysQnTwT+SHlhd/hV8tnM6Wkx0RTs9yiBa/E8oxlsL9nuNmrcrpy/mPUug4q6xODb
	Cn7K2CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlTG-003V6v-4P; Fri, 10 Dec 2021 19:22:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvl2D-003JiU-R6; Fri, 10 Dec 2021 18:54:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id m27so19641349lfj.12;
 Fri, 10 Dec 2021 10:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IKf1m11e2CmLOphgB5tXRwG67Tf75LBrlnq5Vg7yJZw=;
 b=IxhbpvG2CFXB3xmkjVMdWRMntYmHOq8xg7eP7zr/AbSS5vu1B9sdxo5o91nGOD2995
 QQ3KG6tw48EY7IhOrAyb30j6v2PDl8KJF+jKSnPayvNkG1XmqZAU+fLfW7OnlwsZZOnn
 0A9elkL050dIg2mh2nAMxrCkv1StUF1LjCWn+NlhosKjCmIUCMa0MKcmxWQ+/W+IgKI6
 i8CNkkus5bglRUlOxac8XP3LVuSzA40MUvRiA2U0B7IAsHpJ1AsKj9N6snoJl+u70szG
 pZzPqoOnQIc/elfvbeQCxFa9JUiQLy0NMI8wwjD0fM288MJ0ySJSpfHIgwDyPyb7i3mv
 C2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKf1m11e2CmLOphgB5tXRwG67Tf75LBrlnq5Vg7yJZw=;
 b=5fTAtvI7+d7IfWjv3MzzMpNUMdYawWcgFXVH7Enu4WdeD2no8Rk0KwcRuzXXBQ1ZOF
 TDRl3yk6JEtjLC5hcRP9340UJoABa/Kk5sBntoAFk/Mw9yhTRw/lA4FUXmo8l9vVNEfc
 Ux9h11aweNkDgC+gS+NFFcG5zfWynV9iUc0GOGJwWNuQMTwM/gV/ZD3ifGEQ1v7QRNjq
 5LMyByOaOGR8yg8YNqtU7a+mmdEmwDncCnnFdt1ruVoeC7JEHINQtGfdNjhqXFezMSoF
 7jlAehDFBJwS+e18axiFdYCpgwwDY5t0H1wMAN+OQAEfkBE03mW1kSlSiL+05SowAk6O
 5lfg==
X-Gm-Message-State: AOAM530z5rFkZgym5EJiIJeoVsaPZeUt7YUdCl5HUNs/M+zF2pD/aZEP
 nl1o1xjg2mSIrN80p58ZUl4=
X-Google-Smtp-Source: ABdhPJyNtPZVq+j4jRpVe2vNWn4eVPA/mLyRKU7MjcAV9J6qXLR8NEClMh21SuEPG0vCBnH7Acz/0w==
X-Received: by 2002:ac2:4c4d:: with SMTP id o13mr13668768lfk.196.1639162460068; 
 Fri, 10 Dec 2021 10:54:20 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id v15sm390403ljj.5.2021.12.10.10.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:54:19 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
Date: Fri, 10 Dec 2021 21:54:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_105421_990336_50869E09 
X-CRM114-Status: GOOD (  19.89  )
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

MTAuMTIuMjAyMSAyMTozMiwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE5vdiAyNiwgMjAyMSBhdCA3OjAyIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEVtaXQgd2FybmluZyBpZiB1bnJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxl
cigpIGZhaWxzIHNpbmNlIGl0IG5ldmVyIHNob3VsZAo+PiBmYWlsLiBUaGlzIHdpbGwgZWFzZSBm
dXJ0aGVyIEFQSSBkZXZlbG9wbWVudCBieSBjYXRjaGluZyBtaXN0YWtlcyBlYXJseS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0K
Pj4gIGtlcm5lbC9yZWJvb3QuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL3JlYm9vdC5jIGIv
a2VybmVsL3JlYm9vdC5jCj4+IGluZGV4IGU2NjU5YWUzMjlmMS4uZjBlN2I5YzEzZjZiIDEwMDY0
NAo+PiAtLS0gYS9rZXJuZWwvcmVib290LmMKPj4gKysrIGIva2VybmVsL3JlYm9vdC5jCj4+IEBA
IC0yMTAsNyArMjEwLDcgQEAgRVhQT1JUX1NZTUJPTChyZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIp
Owo+PiAgICovCj4+ICBpbnQgdW5yZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIoc3RydWN0IG5vdGlm
aWVyX2Jsb2NrICpuYikKPj4gIHsKPj4gLSAgICAgICByZXR1cm4gYXRvbWljX25vdGlmaWVyX2No
YWluX3VucmVnaXN0ZXIoJnJlc3RhcnRfaGFuZGxlcl9saXN0LCBuYik7Cj4+ICsgICAgICAgcmV0
dXJuIFdBUk5fT04oYXRvbWljX25vdGlmaWVyX2NoYWluX3VucmVnaXN0ZXIoJnJlc3RhcnRfaGFu
ZGxlcl9saXN0LCBuYikpOwo+IAo+IFRoZSBvbmx5IHJlYXNvbiB3aHkgaXQgY2FuIGZhaWwgaXMg
aWYgdGhlIG9iamVjdCBwb2ludGVkIHRvIGJ5IG5iIGlzCj4gbm90IGluIHRoZSBjaGFpbi4KCkkg
aGFkIGV4YWN0bHkgdGhpcyBjYXNlIHdoZXJlIG9iamVjdCB3YXNuJ3QgaW4gdGhlIGNoYWluIGR1
ZSB0byBhIGJ1ZwphbmQgdGhpcyB3YXJuaW5nIHdhcyB2ZXJ5IGhlbHBmdWwuCgo+ICBXaHkgV0FS
TigpIGFib3V0IHRoaXM/ICBBbmQgd2hhdCBhYm91dCBzeXN0ZW1zIHdpdGgKPiBwYW5pY19vbl93
YXJuIHNldD8KClRoYXQgd2FybmluZyBjb25kaXRpb24gd2lsbCBuZXZlciBoYXBwZW4gbm9ybWFs
bHksIG9ubHkgd2hlbiBzb21ldGhpbmcKaXMgc2VyaW91c2x5IHdyb25nLgoKVGhvc2Ugc3lzdGVt
cyB3aXRoIHBhbmljX29uX3dhcm4gd2lsbCBnZXQgd2hhdCB3YXMgdGhleSBhc2tlZCBmb3IuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
