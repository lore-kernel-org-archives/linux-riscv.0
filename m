Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCDFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PSUwXRLadrjM+cSb/Xr8Fk1lZdB/Ta95LWDXSHfvYeM=; b=qx3KMF2Un31IaMd4nfHg3ARwa6
	IdeX7sSM5plIkRiF24XdSd4ITFvdwcfeB4sGnGBZMSHP3rLp2CwCCkvORSMeWnonXAITgfjWnYenB
	ff2pOjWYyBqS/WyBHJgriJU/wpANq0afKurRREnoa3K6wQLtId90Inufzg+RdL4h/UQeO8CAdmF7L
	g+NSYGdIsFx//eaU4OQh04roGO+SpbIRL083bbu5wsrW/Aeu68cZDNdJdZiMuMujA7Yqky+mVUWK2
	uuQun89na6QmUxbJBs0UwdgUgDRTVuByhJKRL4lnvU2cTkRW5gi37SxBpePL40P2t8AXCBfVv4Xst
	yKdwhf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfOj-000cRR-94; Mon, 29 Nov 2021 12:04:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfOg-000cQf-HJ; Mon, 29 Nov 2021 12:04:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id m27so43883424lfj.12;
 Mon, 29 Nov 2021 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
 b=MI4kP55/Zlm7TBL7y2OrNMI5h+lPZeZmB7t8OlZkmrVqz5nkh2/Y6HuliAe0oVs0Rk
 rFetODlieSY8yYJ/zujS836D4HMa1RwjML/CAxKtomUWXSGb1qL/KVpTn6q2+Uvz6fll
 o53AZuiQAc2GWbWiafTtGZSuw2c5mqIFJqFNiJYF9aTjEDiBqb562eel2zakvhyPlOl3
 pG/pjhw/StA1ckadkeclKZKjMkX16zdmIl6oAlX+4fS7qeRy6PONzcXzKzm9X1QdAno0
 Kkwc07Ys2BvHYPaVq37PhoNg88rbf4eu8IhUwjBo48bGGmIHfJryc8vu/Bws5bIp8Ted
 95RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
 b=hBkgYb5vcM4KtvRVur8EHRUthcXBFLQz0wxeAVwcQw2Fdx55b2bnI/+bKV+046ZQ7b
 Gc6xGClpSm+J1gyndlTznVI+Op6REZA9hOiag3slqZMLorwvxg+Q3s5zOw21RODcvw7V
 r/ymiDcrfqTnzPIfWli7QVTmOV4NEe87vKaVEzkcRrxop2Z9MN/z7F4ksX3BfD3YFVpj
 o82O4LcKg2bGV4X+uK6rEmHEjIzcd8Ae0XHIMkzpVBygqIe9oUxrH9/lSNynAXE/EHkT
 ilQD7wf/kRbDcuwHGDf6nLWqFqmjGr6e3wHyNys8pfmyce16yz985zwZz48eRSqK+uk0
 bS8A==
X-Gm-Message-State: AOAM530FLW3s1A9fjBOL8sHkKpkO/6aJ/UodR/D5+nvHJsdA6LDGw0CD
 d9g2j6vGImsHrYc6kK+JIi0=
X-Google-Smtp-Source: ABdhPJwfeiycltlybhTj7UKB2JEhJqYEuRYscpRNQomunXBGc+OXGSTBjoVVWr3Sr9Zkv1hFoSwEuA==
X-Received: by 2002:a05:6512:e9c:: with SMTP id
 bi28mr45440847lfb.245.1638187475542; 
 Mon, 29 Nov 2021 04:04:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id g12sm1317274lfu.135.2021.11.29.04.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:04:34 -0800 (PST)
Subject: Re: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
To: Lee Jones <lee.jones@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
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
 <20211027211715.12671-29-digetx@gmail.com> <YaS/lStp2b8GhVxw@google.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <592f2326-b450-1db1-0d3d-804415cf5de6@gmail.com>
Date: Mon, 29 Nov 2021 15:04:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaS/lStp2b8GhVxw@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_040438_604131_E6148F69 
X-CRM114-Status: GOOD (  17.22  )
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

MjkuMTEuMjAyMSAxNDo1NSwgTGVlIEpvbmVzINC/0LjRiNC10YI6Cj4gT24gVGh1LCAyOCBPY3Qg
MjAyMSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IAo+PiBVc2UgZGV2bV9yZWdpc3Rlcl9wb3dl
cl9oYW5kbGVyKCkgdGhhdCByZXBsYWNlcyBnbG9iYWwgcG1fcG93ZXJfb2ZmCj4+IHZhcmlhYmxl
IGFuZCBhbGxvd3MgdG8gcmVnaXN0ZXIgbXVsdGlwbGUgcG93ZXItb2ZmIGhhbmRsZXJzLiBJdCBh
bHNvCj4+IHByb3ZpZGVzIHJlc3RhcnQtaGFuZGxlciBzdXBwb3J0LCBpLmUuIGFsbCBpbiBvbmUg
QVBJLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tZmQvcm41dDYxOC5jIHwgNTYgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQo+IAo+IEZvciBteSBvd24gcmVmZXJlbmNlIChhcHBs
eSB0aGlzIGFzLWlzIHRvIHlvdXIgc2lnbi1vZmYgYmxvY2spOgo+IAo+ICAgQWNrZWQtZm9yLU1G
RC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAKClRoYW5rcyB5b3UuIFRo
aXMgYW5kIG90aGVyIGRyaXZlciBwYXRjaGVzIHdpbGwgYmUgc2xpZ2h0bHkgY2hhbmdlZApiZWNh
dXNlIHRoZSBwb3dlci1oYW5kbGVyIHdhcyByZW5hbWVkIHRvIHN5cy1vZmYgaGFuZGxlciBzdGFy
dGluZyB3aXRoCnRoZSB2MyBvZiB0aGlzIHNlcmllcywgYnV0IHlvdXJzIGFjayBzdGlsbCB3aWxs
IGJlIHZhbGlkIGhlcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
