Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BF4C43219
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB5B6134F
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEB5B6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1dmWGhOkiH06St9y4jszXX8Vw59k1lwLA4hQSKwO9M=; b=eQ7WEnclXYi7Ilr9zd5Bkz548e
	ZMj+0qB/8wpic++655seuIqsR48RtiYLL7Wpg2Wss9mFNH92PcqPTPO885R/BcRABhFpO90PMykp4
	p37W0yM9hJlQaC/95ep5uL8UN2CBNd+AFws0BuFRqCm/14GX4YwxJVSwR91NVG4jjpptQNufrLwgO
	jBYwNXkZzvEJR9MvO0AzdM2PtIH6aXihdxrDkQpWR9bc2ceYGVA9C+uph9sNkYNE1RrgZJT1egAcD
	b7ow9CRbBqzKXIqosn4p2FgDwtDnXbkGw3EX6qXWOcm7s/JMurY6lI8SiRGEm6GxD22HwOyetibvW
	wNTj/1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjleY-00EcGY-5g; Sun, 07 Nov 2021 17:08:22 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjleV-00EcFx-ME; Sun, 07 Nov 2021 17:08:21 +0000
Received: by mail-oi1-x236.google.com with SMTP id bl27so21012691oib.0;
 Sun, 07 Nov 2021 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
 b=TxOMGGlgYCG6dkxhcHrWleMH5bQzzwXZ9FgwNICO938yYvOADrHCJxaIH+GmktBmdj
 VF/g/5abCbj1SCo77l//+Q8ZaEKZ59DzYbLYNazQAh1d/LI9QSnOgttApF1NrD9BSZdp
 gXEIPq4X5WBftSdrWeIB1XoHAUTyRVaiGJM3hjDVKwLTIaIl/5BV9x60u06nn/MoayP2
 XKdxX9rsONJssDlEkPGWyc5+2eLAU/A93X+4aNShdnC/nVsO9kvbYnMJEh3NiFo/gq2s
 n/ryBqjSn/iug4O0nxdm910/aVIInOrXjz5uU8hb+PebuTd+WVfeeVeSdkkUcfpq82Ph
 3xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
 b=R9uvnytwW4plvj7HGxxGs37/0HhD+4zeFIZMy6tFMhWPolNajvDF8zvEiHHbqH6Fe8
 zcpG9OFwObLW8sg+Vf8Gvl2yC1Lwa/h7rmQEiKvrhsK460uqIJLt0vGRMukCY4WQIysq
 I+f5hZCiZxPdr7fkVydEkPvaWYmwPyV2is8ISW8M4zi9khY8S78XsWrw8494gThDNmee
 lLICfqlma5SBGwtRvJf8kwK+A+fzjORhUApsga1or31h2wF5E+Tprk0jpsK2eRqXzS7i
 rg2gEp4j4nYi2o4SyJPom99/xuLu+SZEpqhhDek/3A2PuKe9j6Ko5bkfR6P4H8AFeP+B
 xodw==
X-Gm-Message-State: AOAM5334Jj4+TG1uAQejK79SC3H3s4ZmchQaEgiojAt3CYjVpzVsQtM5
 jmdJ8x+gkGh5jQtbwyEOD9U=
X-Google-Smtp-Source: ABdhPJwtuSZgtmAkEs0Dks9+MnuUhljSkzaFgRaxP+iMBCUUKLEs54Fh1SgZ30w0yfdl8sLFhcnMyg==
X-Received: by 2002:a05:6808:158a:: with SMTP id
 t10mr3003509oiw.24.1636304899015; 
 Sun, 07 Nov 2021 09:08:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i18sm3076850oik.6.2021.11.07.09.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:08:18 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
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
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
Date: Sun, 7 Nov 2021 09:08:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_090819_775869_3DD4E4A2 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvNy8yMSA4OjUzIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDYuMTEuMjAyMSAy
Mzo1NCwgSm9uYXRoYW4gTmV1c2Now6RmZXIg0L/QuNGI0LXRgjoKPj4gSGksCj4+Cj4+IE9uIFRo
dSwgT2N0IDI4LCAyMDIxIGF0IDEyOjE2OjU3QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4+IFVzZSBkZXZtX3JlZ2lzdGVyX3Bvd2VyX2hhbmRsZXIoKSB0aGF0IHJlcGxhY2VzIGds
b2JhbCBwbV9wb3dlcl9vZmYKPj4+IHZhcmlhYmxlIGFuZCBhbGxvd3MgdG8gcmVnaXN0ZXIgbXVs
dGlwbGUgcG93ZXItb2ZmIGhhbmRsZXJzLiBJdCBhbHNvCj4+PiBwcm92aWRlcyByZXN0YXJ0LWhh
bmRsZXIgc3VwcG9ydCwgaS5lLiBhbGwgaW4gb25lIEFQSS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+PiAtLS0KPj4KPj4gV2hlbiBJ
IGJvb3Qgd2l0aCAobW9zdCBvZikgdGhpcyBwYXRjaHNldCBhcHBsaWVkLCBJIGdldCB0aGUgd2Fy
bmluZyBhdAo+PiBrZXJuZWwvcmVib290LmM6MTg3Ogo+Pgo+PiAJLyoKPj4gCSAqIEhhbmRsZXIg
bXVzdCBoYXZlIHVuaXF1ZSBwcmlvcml0eS4gT3RoZXJ3aXNlIGNhbGwgb3JkZXIgaXMKPj4gCSAq
IGRldGVybWluZWQgYnkgcmVnaXN0cmF0aW9uIG9yZGVyLCB3aGljaCBpcyB1bnJlbGlhYmxlLgo+
PiAJICovCj4+IAlXQVJOX09OKCFhdG9taWNfbm90aWZpZXJfaGFzX3VuaXF1ZV9wcmlvcml0eSgm
cmVzdGFydF9oYW5kbGVyX2xpc3QsIG5iKSk7Cj4+Cj4+IEFzIHRoZSBOVFhFQyBkcml2ZXIgZG9l
c24ndCBzcGVjaWZ5IGEgcHJpb3JpdHksIEkgdGhpbmsgdGhpcyBpcyBhbiBpc3N1ZQo+PiB0byBi
ZSBmaXhlZCBlbHNld2hlcmUuCj4+Cj4+IE90aGVyIHRoYW4gdGhhdCwgaXQgd29ya3MgYW5kIGxv
b2tzIGdvb2QsIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgo+Pgo+Pgo+PiBGb3IgdGhpcyBwYXRjaDoK
Pj4KPj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdt
eC5uZXQ+Cj4+IFRlc3RlZC1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD4KPiAKPiBUaGFuayB5b3UuIFlvdSBoYXZlIGNvbmZsaWN0aW5nIHJlc3RhcnQgaGFu
ZGxlcnMsIGFwcGFyZW50bHkgTlRYRUMKPiBkcml2ZXIgc2hvdWxkIGhhdmUgaGlnaGVyIHByaW9y
aXR5IHRoYW4gdGhlIHdhdGNoZG9nIGRyaXZlci4gSXQgc2hvdWxkCj4gYmUgYSBjb21tb24gcHJv
YmxlbSBmb3IgdGhlIHdhdGNoZG9nIGRyaXZlcnMsIEkgd2lsbCBsb3dlciB3YXRjaGRvZydzCj4g
ZGVmYXVsdCBwcmlvcml0eSB0byBmaXggaXQuCj4gCgpUaGUgd2F0Y2hkb2cgc3Vic3lzdGVtIGFs
cmVhZHkgdXNlcyAiMCIgYXMgZGVmYXVsdCBwcmlvcml0eSwgd2hpY2ggd2FzCmludGVuZGVkIGFz
IHByaW9yaXR5IG9mIGxhc3QgcmVzb3J0IGZvciByZXN0YXJ0IGhhbmRsZXJzLiBJIGRvIG5vdCBz
ZWUKYSByZWFzb24gdG8gY2hhbmdlIHRoYXQuCgpHdWVudGVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
