Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ySVdVyoDoBaG4ckFVlzO+rAFhoeScCXnEo8tb52HNHo=; b=Jg5iTt5wNue09Izw7bgZ+WqtsP
	JxKtxzS+McFuc3rrP0cPMrbbfcm7HOV02poKKXJERmX+GRpzZi27uavAEusjCFZ/evgtDOAQivApb
	MMpd/4hjWfkZ2vXUrwMFVYMvk0hwqrodzchx6cXF5gtlis8eEGZOlnnT+ym13O4NE2CgNYdM1bIWK
	qJhBwLAnbqMrKZA6JQp5O1QeHTKEhxfwaeqq91gQDfk5pOV2BaQqQl8+0SDaiGKpYYI1KSaOb3GpY
	op4wGlrdErfrSrr9Zf5Oy3T85GwzU5QHEkYpCsI+DwnxbjKcPnJ6on7QdcCKJ5By8HFbTguC/dNZ4
	pXdoMXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7C1y-00FDYC-6k; Tue, 11 Jan 2022 07:57:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7C1v-00FDWq-Ez
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 07:57:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id g11so53303155lfu.2
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 23:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
 b=o816YNn0CIDbCy7uwUkg0QIssuplfNYZWg1E7+kMoiU09fEhi1ExzqEDKdXYCKWai9
 qL9GIVzs3SGnxKwGJEOsSM3dx9RhiXQOO+ArNyWLk+C6CEkyik9J0oiqnGoR0d0pIAj9
 53smI6i/pfdhdE0TtmtHvyvhbPCgckL8+ELBFQn7KfvHLFewJSBKJEg5/OYThOUaKs30
 YfS/REggk0oGjchlK3DJSLwWFv3g0lGM/Rxm4G3MobhsE5sy8EV2tAxeU17tchxilpyJ
 Cm1nk2GkD8C8mwFhmX8oxyCwbcyhBHAvQH1mhnlt/pBPXM0S0279pLMAkDnMH4r8aI8U
 4vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
 b=FShmBi7McFovwFz42a6IQUPsuef1bsa43W82l/PSnn0nrpTjcxpPS76NIBO8I7LhMQ
 Y6M//W8mvju4Vw9nIrH9IBzsPBC095ic9sa5vF7kPMnyB+zBtJzv8CfBvMcl2/Rsy1h+
 BkUos5Dyf0HLjaNRCkHGpI6LH94x13gl+6OyBg9DYcIPmaalXgFygt9Y3cvXpgtn2Rhl
 Ir7Uwq+TKd88mEugJoE4FaoVKX2fN8G2igpmpATWwBm17OjiNGYDuOMHBT8TZeFccFdd
 rZIsYNLtWVAnmO69t45tm/ZtmX52ApdKAcWnts7MvpzLpWIIHaErUJL7BWXTBcLe/ZH3
 mnfA==
X-Gm-Message-State: AOAM530hOrpCKHYEVvnS/B83vuBU4eiNeoXlVqsmKr6UH82MyNNOrkWE
 +B2B8fgbak/e4IMydkOX/TQ=
X-Google-Smtp-Source: ABdhPJwj4SWIivJF19fC8reHgAOesHmr0N4ouSyiTwjUsKFxuFFgsPk/HMJ5T5WGAATZ9pKSch9NEg==
X-Received: by 2002:a05:651c:49a:: with SMTP id
 s26mr2063487ljc.109.1641887836867; 
 Mon, 10 Jan 2022 23:57:16 -0800 (PST)
Received: from ?IPv6:2a00:1370:810c:714f:a10:76ff:fe69:21b6?
 ([2a00:1370:810c:714f:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id x14sm1206180ljd.76.2022.01.10.23.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 23:57:16 -0800 (PST)
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <80f5a739-0850-a8db-7493-e8c387109ce0@gmail.com>
Date: Tue, 11 Jan 2022 10:57:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_235719_555424_C4560CA3 
X-CRM114-Status: GOOD (  38.14  )
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

MDkuMDEuMjAyMiAwMjozNSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBNb24s
IERlYyAxMywgMjAyMSBhdCAxMjowMjo1MkFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4gWy4uLl0KPj4gKy8qKgo+PiArICogc3RydWN0IHBvd2VyX29mZl9kYXRhIC0gUG93ZXItb2Zm
IGNhbGxiYWNrIGFyZ3VtZW50Cj4+ICsgKgo+PiArICogQGNiX2RhdGE6IENhbGxiYWNrIGRhdGEu
Cj4+ICsgKi8KPj4gK3N0cnVjdCBwb3dlcl9vZmZfZGF0YSB7Cj4+ICsJdm9pZCAqY2JfZGF0YTsK
Pj4gK307Cj4+ICsKPj4gKy8qKgo+PiArICogc3RydWN0IHBvd2VyX29mZl9wcmVwX2RhdGEgLSBQ
b3dlci1vZmYgcHJlcGFyYXRpb24gY2FsbGJhY2sgYXJndW1lbnQKPj4gKyAqCj4+ICsgKiBAY2Jf
ZGF0YTogQ2FsbGJhY2sgZGF0YS4KPj4gKyAqLwo+PiArc3RydWN0IHBvd2VyX29mZl9wcmVwX2Rh
dGEgewo+PiArCXZvaWQgKmNiX2RhdGE7Cj4+ICt9Owo+IAo+IFdoeSB0d28gZXhhY3RseSBzYW1l
IHN0cnVjdHVyZXM/IFdoeSBvbmx5IGEgc2luZ2xlIHBvaW50ZXIgaW5zdGVhZD8gSWYKPiBpdCBq
dXN0IHRvIGVuYWJsZSB0eXBlLWNoZWNraW5nIGNhbGxiYWNrcywgdGhlbiB0aG91c2UgY291bGQg
YmUgb3BhcXVlCj4gb3IgemVyby1zaXplZCBzdHJ1Y3RzIHRoYXQgd291bGQgYmUgZW1iZWRkZWQg
b3IgY2FzdGVkIGF3YXkgaW4KPiByZXNwZWN0aXZlIGNhbGxiYWNrcy4KClByZXBhcmF0aW9uIGFu
ZCBmaW5hbCBleGVjdXRpb24gYXJlIHR3byBkaWZmZXJlbnQgb3BlcmF0aW9ucywgaXQncyBtdWNo
CmNsZWFuZXIgZnJvbSBhIHVzZXIncyBwZXJzcGVjdGl2ZSB0byBoYXZlIHNhbWUgc2VwYXJhdGVk
LCBJTU8uIEluIHRoZQpmdXR1cmUgd2UgbWF5IHdvdWxkIHdhbnQgdG8gZXh0ZW5kIG9uZSBvZiB0
aGUgc3RydWN0cywgYW5kIG5vdCB0aGUKb3RoZXIuIFR5cGUtY2hlY2tpbmcgaXMgYW5vdGhlciBi
ZW5lZml0LCBvZiBjb3Vyc2UuCgpUaGUgc2luZ2xlIGNhbGxiYWNrIHBvaW50ZXIgaXMgd2hhdCBp
cyB1dGlsaXplZCBieSBhbGwgY3VycmVudCBrZXJuZWwKdXNlcnMuIFRoaXMgbWF5IGNoYW5nZSBp
biB0aGUgZnV0dXJlIGFuZCB0aGVuIGl0IHdvbid0IGJlIGEgcHJvYmxlbSB0bwpleHRlbmQgdGhl
IHBvd2VyLW9mZiBBUEkgd2l0aG91dCBkaXNydXB0aW5nIHdob2xlIGtlcm5lbC4KCj4+ICsKPj4g
Ky8qKgo+PiArICogc3RydWN0IHJlc3RhcnRfZGF0YSAtIFJlc3RhcnQgY2FsbGJhY2sgYXJndW1l
bnQKPj4gKyAqCj4+ICsgKiBAY2JfZGF0YTogQ2FsbGJhY2sgZGF0YS4KPj4gKyAqIEBjbWQ6IFJl
c3RhcnQgY29tbWFuZCBzdHJpbmcuCj4+ICsgKiBAc3RvcF9jaGFpbjogRnVydGhlciBsb3dlciBw
cmlvcml0eSBjYWxsYmFja3Mgd29uJ3QgYmUgZXhlY3V0ZWQgaWYgc2V0IHRvCj4+ICsgKgkJdHJ1
ZS4gQ2FuIGJlIGNoYW5nZWQgd2l0aGluIGNhbGxiYWNrLiBEZWZhdWx0IGlzIGZhbHNlLgo+PiAr
ICogQG1vZGU6IFJlYm9vdCBtb2RlIElELgo+PiArICovCj4+ICtzdHJ1Y3QgcmVzdGFydF9kYXRh
IHsKPj4gKwl2b2lkICpjYl9kYXRhOwo+PiArCWNvbnN0IGNoYXIgKmNtZDsKPj4gKwlib29sIHN0
b3BfY2hhaW47Cj4+ICsJZW51bSByZWJvb3RfbW9kZSBtb2RlOwo+PiArfTsKPj4gKwo+PiArLyoq
Cj4+ICsgKiBzdHJ1Y3QgcmVib290X3ByZXBfZGF0YSAtIFJlYm9vdCBhbmQgc2h1dGRvd24gcHJl
cGFyYXRpb24gY2FsbGJhY2sgYXJndW1lbnQKPj4gKyAqCj4+ICsgKiBAY2JfZGF0YTogQ2FsbGJh
Y2sgZGF0YS4KPj4gKyAqIEBjbWQ6IFJlc3RhcnQgY29tbWFuZCBzdHJpbmcuCj4+ICsgKiBAc3Rv
cF9jaGFpbjogRnVydGhlciBsb3dlciBwcmlvcml0eSBjYWxsYmFja3Mgd29uJ3QgYmUgZXhlY3V0
ZWQgaWYgc2V0IHRvCj4+ICsgKgkJdHJ1ZS4gQ2FuIGJlIGNoYW5nZWQgd2l0aGluIGNhbGxiYWNr
LiBEZWZhdWx0IGlzIGZhbHNlLgo+IAo+IFdoeSB3b3VsZCB3ZSB3YW50IHRvIHN0b3AgcG93ZXIt
b2ZmIG9yIGVyYm9vdCBjaGFpbj8gSWYgdGhlIGNhbGxiYWNrCj4gc3VjY2VkZWQsIHRoZW4gZnVy
dGhlciBjYWxscyB3b24ndCBiZSBtYWRlLiBJZiBpdCBkb2Vzbid0IHN1Y2NlZWQsIGJ1dAo+IHBv
c3NpYmx5IGJyZWFrcyB0aGUgc3lzdGVtIHNvbWVob3csIGl0IHNob3VsZG4ndCByZXR1cm4uIFRo
ZW4gdGhlIG9ubHkKPiBjYXNlIGxlZnQgd291bGQgYmUgdG8ganVzdCB0cnkgdGhlIG5leHQgbWV0
aG9kIG9mIHNodXR0aW5nIGRvd24uCgpUaGlzIGlzIHdoYXQgc29tZSBvZiB0aGUgQVBJIHVzZXJz
IHdlcmUgZG9pbmcgZm9yIHllYXJzLiBJIGRvbid0IGtub3cKZm9yIHN1cmUgd2h5IHRoZXkgd2Fu
dCB0byBzdG9wIHRoZSBjaGFpbiwgaXQgaW5kZWVkIGxvb2tzIGxpa2UgYW4KaW5jb3JyZWN0IGJl
aGF2aW91ciwgYnV0IHRoYXQncyB1cCB0byBkZXZlbG9wZXJzIHRvIGRlY2lkZS4gSSBvbmx5CnJl
dGFpbmVkIHRoZSBvbGQgYmVoYXZpb3VyIGZvciB0aG9zZSB1c2Vycy4KCj4+ICsgKiBAbW9kZTog
UHJlcGFyYXRpb24gbW9kZSBJRC4KPj4gKyAqLwo+PiArc3RydWN0IHJlYm9vdF9wcmVwX2RhdGEg
ewo+PiArCXZvaWQgKmNiX2RhdGE7Cj4+ICsJY29uc3QgY2hhciAqY21kOwo+PiArCWJvb2wgc3Rv
cF9jaGFpbjsKPj4gKwllbnVtIHJlYm9vdF9wcmVwYXJlX21vZGUgbW9kZTsKPj4gK307Cj4+ICsK
Pj4gK3N0cnVjdCBzeXNfb2ZmX2hhbmRsZXJfcHJpdmF0ZV9kYXRhIHsKPj4gKwlzdHJ1Y3Qgbm90
aWZpZXJfYmxvY2sgcG93ZXJfb2ZmX25iOwo+PiArCXN0cnVjdCBub3RpZmllcl9ibG9jayByZXN0
YXJ0X25iOwo+PiArCXN0cnVjdCBub3RpZmllcl9ibG9jayByZWJvb3RfbmI7Cj4gCj4gV2hhdCdz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gcmVzdGFydCBhbmQgcmVib290PwoKUmVib290IGlzIGFs
d2F5cyBleGVjdXRlZCBiZWZvcmUgcmVzdGFydCBhbmQgcG93ZXItb2ZmIGNhbGxiYWNrcy4gVGhp
cwppcyBleHBsYWluZWQgaW4gdGhlIGRvYy1jb21tZW50IG9mIHRoZSBzdHJ1Y3Qgc3lzX29mZl9o
YW5kbGVyLgoKKyAqIEByZWJvb3RfcHJlcGFyZV9jYjogUmVib290L3NodXRkb3duIHByZXBhcmF0
aW9uIGNhbGxiYWNrLiBBbGwgcmVib290CisgKiBwcmVwYXJhdGlvbiBjYWxsYmFja3MgYXJlIGlu
dm9rZWQgYmVmb3JlIEByZXN0YXJ0X2NiIG9yIEBwb3dlcl9vZmZfY2IsCisgKiBkZXBlbmRpbmcg
b24gdGhlIG1vZGUuIEl0J3MgcmVnaXN0ZXJlZCB3aXRoIHJlZ2lzdGVyX3JlYm9vdF9ub3RpZmll
cigpLgorICogVGhlIHBvaW50IGlzIHRvIHJlbW92ZSBib2lsZXJwbGF0ZSBjb2RlIGZyb20gZHJp
dmVycyB3aGljaCB1c2UgdGhpcworICogY2FsbGJhY2sgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUg
cmVzdGFydC9wb3dlci1vZmYgY2FsbGJhY2tzLgorICoKClRoaXMgcmVib290IGNhbGxiYWNrIHVz
dWFsbHkgcGVyZm9ybXMgZWFybHkgcHJlcGFyYXRpb25zIHRoYXQgYXJlIG5lZWQKdG8gYmUgZG9u
ZSBiZWZvcmUgbWFjaGluZSBpcyBwbGFjZWQgaW50byByZXNldCBzdGF0ZSwgcGxlYXNlIHNlZSBb
MV0gZm9yCnRoZSBleGFtcGxlcy4KClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92NS4xNi9BL2lkZW50L3JlZ2lzdGVyX3JlYm9vdF9ub3RpZmllcgoKSSBhZ3JlZSB0aGF0ICJy
ZWJvb3QiIHNvdW5kcyBsaWtlIGEgbWlzbm9tZXIuIFRoaXMgbmFtZSB3YXMgY29pbmVkIGxvbmcK
dGltZSBhZ28sIHBlcmhhcHMgbm90IHdvcnRoIHRvIHJlbmFtZSBpdCBhdCB0aGlzIHBvaW50LiBJ
J20gYWxzbyBub3QKc3VyZSB3aGF0IGNvdWxkIGJlIGEgYmV0dGVyIG5hbWUuCgo+PiArCXZvaWQg
KCpwbGF0Zm9ybV9wb3dlcl9vZmZfY2IpKHZvaWQpOwo+PiArCXZvaWQgKCpzaW1wbGVfcG93ZXJf
b2ZmX2NiKSh2b2lkICpkYXRhKTsKPj4gKwl2b2lkICpzaW1wbGVfcG93ZXJfb2ZmX2NiX2RhdGE7
Cj4+ICsJYm9vbCByZWdpc3RlcmVkOwo+PiArfTsKPiAKPiBCVFcsIEkgY291bGRuJ3QgZmluZCBh
IHJpZ2h0IGRlc2NyaXB0aW9uIG9mIG15IGlkZWEgb2YgdW5pZnlpbmcgdGhlCj4gY2hhaW5zIGJl
Zm9yZSwgc28gbGV0IG1lIHNrZXRjaCBpdCBub3cuCj4gCj4gVGhlIGlkZWEgaXMgdG8gaGF2ZSBh
IHNpbmdsZSBzeXN0ZW0tb2ZmIGNoYWluIGluIHdoaWNoIHRoZSBjYWxsYmFjawo+IGdldHMgYSBt
b2RlICh7UVVFUllfKiwgUFJFUF8qLCBET18qfSBmb3IgZWFjaCBvZiB7Kl9SRUJPT1QsICpfUE9X
RVJPRkYsIC4uLj8pLgo+IFRoZSBRVUVSWV8qIGNhbGxzIHdvdWxkIGJlIG1hZGUgaW4gY2FuX2tl
cm5lbF9yZWJvb3QvcG93ZXJvZmYoKTogYWxsCj4gd291bGQgYmUgY2FsbGVkLCBhbmQgaWYgYXQg
bGVhc3Qgb25lIHJldHVybmVkIHRydWUsIHRoZW4gdGhlIHNodXRkb3duCj4gbW9kZSB3b3VsZCBj
b250aW51ZS4gQWxsIG9mIFBSRVBfKiB3b3VsZCBiZSBjYWxsZWQgdGhlbi4gQWZ0ZXIgdGhhdAo+
IGFsbCBET18qIHdvdWxkIGJlIHRyaWVkIHVudGlsIG9uZSBkb2Vzbid0IHJldHVybiAoc3VjY2Vl
ZGVkIG9yIGJyb2tlCj4gdGhlIHN5c3RlbSBoYXJkKS4gQ2xhc3NpYyBmb3IoOzspOyBjb3VsZCBi
ZSBhIGZpbmFsIGZhbGxiYWNrIGZvciB0aGUKPiBjYXNlIHdoZXJlIGFyY2gvbWFjaGluZSAobG93
ZXN0IHByaW9yaXR5KSBjYWxsIHdvdWxkIHJldHVybiBpbnN0ZWFkCj4gb2YgaGFsdGluZyB0aGUg
c3lzdGVtIGluIG1hY2hpbmUtZGVwZW5kZW50IHdheS4gVGhlIFFVRVJZIGFuZCBQUkVQCj4gc3Rh
Z2VzIGNvdWxkIGJlIGNvbWJpbmVkLCBidXQgSSBoYXZlbid0IHRob3VnaHQgYWJvdXQgaXQgZW5v
dWdoIHRvCj4gc2VlIHdoYXQgY29uZGl0aW9ucyB3b3VsZCBuZWVkIHRvIGJlIGltcG9zZWQgb24g
dGhlIGNhbGxiYWNrcyBpbgo+IHRoYXQgY2FzZSAobWF5YmUgaXQncyBub3Qgd29ydGggdGhlIHRy
b3VibGUsIHNpbmNlIGl0IGlzbid0IGEgZmFzdAo+IHBhdGggYW55d2F5PykuIFRoZSBnb2FsIGhl
cmUgaXMgdG8gaGF2ZSBsZXNzIChkdXBsaWNhdGVkKSBjb2RlIGluCj4ga2VybmVsLCBidXQgb3Ro
ZXJ3aXNlIGl0IHNlZW1zIGVxdWl2YWxlbnQgdG8geW91ciBBUEkgcHJvcG9zYWwuCgpNaWNoYcWC
LCB0aGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIHN1Z2dlc3Rpb25zISBJJ2xsIHRha2UgYW5v
dGhlciBsb29rCmF0IHlvdXJzIHByb3Bvc2FsIGR1cmluZyB0aGlzIG1lcmdlIHdpbmRvdywgaW4g
YSBwcmVwYXJhdGlvbiB0byB2Ni4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
