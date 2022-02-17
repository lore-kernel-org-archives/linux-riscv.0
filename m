Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D69C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IF6ZZc+G/S4V5XKs+VqoPScUKs4hU8SM3qFnD9NGai0=; b=gKJQJRfns1dm3Q
	+aSIVBPehO0LR+kbtQ//ctPuqtkgwRwMLiUQcUXgAXGBBiSYA3xIVZ7wq7OaYozYZ4icBZ+uU+DLl
	NA6upebxbTIjN0+ek8tspZN5kxAuyvdKG2hS63Z1ub74e7ouvA1SW7cW6GG5mLw1j5bwL9N3BBM3E
	TPLeHABwSfBkqSvgICJ/B0eTXU6llzLG1cb0qHcwz6Uo9pdh5t0KfLb4LIcFkyfmfIXWZqt5XTFfq
	9FtSa/OyCrZdlCgiag+rdex2Rg9BoDFluZSzV/Kgr87MK6QajNth3z6tBE+uU3xsclCKIxAWBLneV
	saxb6gB70nstoGmjYwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdma-009r9p-Pq; Thu, 17 Feb 2022 10:13:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdmY-009r8L-19
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 10:13:03 +0000
Received: by mail-lj1-x231.google.com with SMTP id c10so7474268ljr.9
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 02:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OO8O5AkWPhI/5yGYSTEQp+LjZetKZnyQ+pZ7++XrzEA=;
 b=X8w7in6JtN9+vwIDY375tbKdJ6/kAXjQzoJEMNX/aRNZ/xldyGjWjXODYmSy5mi1RE
 IVBvYSJ5Q0hWoh3euDgluS6hajxAwota0SjPBhdLfholDQzq33VHuJfcHHzCkXGyz8tb
 MDBzs6ibY/EGdDqB/ff2GewtKr6TpYHNqvy5y4L9nhOeKSaVrEEfVSAdHs3oIc8/KGvy
 BUoC/Ntz4HLIebyoKI3bup9qeurRZrprpsOzzaMBNquRHtxpasWvx6s1xD7yjJ47gW7a
 aqMUkT2VhDOvjwLmzIlZFje3GuDLrgVXuDJcvjJJbqm/WRU77L4UMZYg+2nxY7fnS64M
 8wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OO8O5AkWPhI/5yGYSTEQp+LjZetKZnyQ+pZ7++XrzEA=;
 b=up6/05W6Qg3YmYHjiSWrux4CTeKCoRn9E5lC8tgNoGNyexdwrrdP4FmbM4B9xfbqMx
 /kz0EDKGB8oMuKegRo2LpATTvtBK6YBGL00R1rPl3z9IeiNtCU1xOddlr5HYXDZK4GZo
 ZMrOuVHabOboxBhbHhPxPglj9JM0swPf9bkJK4xu/oWufeL9BaQPGSJ0REm9P8EOSFD3
 OMEu3DYREdulVDV9KfvuYSprjxnNwS3BPH6OuiRWK5lL1ymUGAmJUj6QVQOpiFCLFHSE
 DdadiP179o+KNzhTW6jXVAKi8jhE+KFiawoPEhAOJul1ZThfSqQaJwLVTLYyht3lxLOw
 eGhw==
X-Gm-Message-State: AOAM532jcWczD5cV53UDeRBtI59TAQWdinlFMjtL0bIMzDvHYGGU8T3I
 NlaGqHaKIKCEaZICrR1aWok=
X-Google-Smtp-Source: ABdhPJzppLbwPh7ryO4JRMtpJc/4Lz2rbVquaymBUgCgBO2OneSkA3o02raf386TVCaqFDiGA98BPg==
X-Received: by 2002:a05:651c:1544:b0:246:1887:cf4c with SMTP id
 y4-20020a05651c154400b002461887cf4cmr917179ljp.118.1645092779295; 
 Thu, 17 Feb 2022 02:12:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id o10sm5079173lfl.116.2022.02.17.02.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 02:12:58 -0800 (PST)
Message-ID: <4f0d1b50-9f55-dd81-f0c7-f5e0dfd75c2a@gmail.com>
Date: Thu, 17 Feb 2022 13:12:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
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
 Michael Ellerman <mpe@ellerman.id.au>,
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
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220130233718.21544-1-digetx@gmail.com>
 <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
 <CAJZ5v0g0MrBm2+GwctkB7kUyBEt6HTAexRCFFRmTF1UKDrVQ-g@mail.gmail.com>
 <de2cbd2a-8d0d-8678-e514-b153d04546cc@gmx.de>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <de2cbd2a-8d0d-8678-e514-b153d04546cc@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_021302_115123_82F5FA46 
X-CRM114-Status: GOOD (  21.72  )
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

MTYuMDIuMjAyMiAyMzozMCwgSGVsZ2UgRGVsbGVyINC/0LjRiNC10YI6Cj4gT24gMi8xNi8yMiAx
MzoyNSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0
IDExOjAwIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4gMzEuMDEuMjAyMiAwMjozNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4gUHJv
YmxlbQo+Pj4+IC0tLS0tLS0KPj4+Pgo+Pj4+IFNvQyBkZXZpY2VzIHJlcXVpcmUgcG93ZXItb2Zm
IGNhbGwgY2hhaW5pbmcgZnVuY3Rpb25hbGl0eSBmcm9tIGtlcm5lbC4KPj4+PiBXZSBoYXZlIGEg
d2lkZWx5IHVzZWQgcmVzdGFydCBjaGFpbmluZyBwcm92aWRlZCBieSByZXN0YXJ0IG5vdGlmaWVy
IEFQSSwKPj4+PiBidXQgbm90aGluZyBmb3IgcG93ZXItb2ZmLgo+Pj4+Cj4+Pj4gU29sdXRpb24K
Pj4+PiAtLS0tLS0tLQo+Pj4+Cj4+Pj4gSW50cm9kdWNlIG5ldyBBUEkgdGhhdCBwcm92aWRlcyBi
b3RoIHJlc3RhcnQgYW5kIHBvd2VyLW9mZiBjYWxsIGNoYWlucy4KPj4+Pgo+Pj4+IFdoeSBjb21i
aW5lIHJlc3RhcnQgd2l0aCBwb3dlci1vZmY/IEJlY2F1c2UgZHJpdmVycyBvZnRlbiBkbyBib3Ro
Lgo+Pj4+IE1vcmUgcHJhY3RpY2FsIHRvIGhhdmUgQVBJIHRoYXQgcHJvdmlkZXMgYm90aCB1bmRl
ciB0aGUgc2FtZSByb29mLgo+Pj4+Cj4+Pj4gVGhlIG5ldyBBUEkgaXMgZGVzaWduZWQgd2l0aCBz
aW1wbGljaXR5IGFuZCBleHRlbnNpYmlsaXR5IGluIG1pbmQuCj4+Pj4gSXQncyBidWlsdCB1cG9u
IHRoZSBleGlzdGluZyByZXN0YXJ0IGFuZCByZWJvb3QgQVBJcy4gVGhlIHNpbXBsaWNpdHkKPj4+
PiBpcyBpbiBuZXcgaGVscGVyIGZ1bmN0aW9ucyB0aGF0IGFyZSBjb252ZW5pZW50IGZvciBkcml2
ZXJzLiBUaGUKPj4+PiBleHRlbnNpYmlsaXR5IGlzIGluIHRoZSBkZXNpZ24gdGhhdCBkb2Vzbid0
IGhhcmRjb2RlIGNhbGxiYWNrCj4+Pj4gYXJndW1lbnRzLCBtYWtpbmcgZWFzeSB0byBhZGQgbmV3
IHBhcmFtZXRlcnMgYW5kIHJlbW92ZSBvbGQuCj4+Pj4KPj4+PiBUaGlzIGlzIGEgdGhpcmQgYXR0
ZW1wdCB0byBpbnRyb2R1Y2UgdGhlIG5ldyBBUEkuIEZpcnN0IHdhcyBtYWRlIGJ5Cj4+Pj4gR3Vl
bnRlciBSb2VjayBiYWNrIGluIDIwMTQsIHNlY29uZCB3YXMgbWFkZSBieSBUaGllcnJ5IFJlZGlu
ZyBpbiAyMDE3Lgo+Pj4+IEluIGZhY3QgdGhlIHdvcmsgZGlkbid0IHN0b3AgYW5kIHJlY2VudGx5
IGFybV9wbV9yZXN0YXJ0KCkgd2FzIHJlbW92ZWQKPj4+PiBmcm9tIHY1LjE0IGtlcm5lbCwgd2hp
Y2ggd2FzIGEgcGFydCBvZiBwcmVwYXJhdG9yeSB3b3JrIHN0YXJ0ZWQgYnkKPj4+PiBHdWVudGVy
IFJvZWNrLiBJIHRvb2sgaW50byBhY2NvdW50IGV4cGVyaWVuY2UgYW5kIGlkZWFzIGZyb20gdGhl
Cj4+Pj4gcHJldmlvdXMgYXR0ZW1wdHMsIGV4dGVuZGVkIGFuZCBwb2xpc2hlZCB0aGVtLgo+Pj4K
Pj4+Cj4+PiBSYWZhZWwgYW5kIGFsbCwgZG8geW91IHNlZSBhbnl0aGluZyBjcml0aWNhbCB0aGF0
IG5lZWRzIHRvIGJlIGltcHJvdmVkCj4+PiBpbiB0aGlzIHY2Pwo+Pj4KPj4+IFdpbGwgYmUgZ3Jl
YXQgaWYgeW91IGNvdWxkIHRha2UgdGhpcyBwYXRjaHNldCB2aWEgdGhlIHBvd2VyIHRyZWUgaWYg
aXQKPj4+IGxvb2tzIG9rYXksIG9yIGdpdmUgYW4gYWNrLgo+Pgo+PiBJIG5lZWQgc29tZSBtb3Jl
IHRpbWUgZm9yIHRoaXMsIHNvcnJ5LgoKTm8gd29ycmllcywgd2UncmUgbm90IGluIGEgcnVzaC4K
Cj4+IEknbSBhIGJpdCBjb25jZXJuZWQgYWJvdXQgc2VlaW5nIG5vIHJlc3BvbnNlIHRvIHRoaXMg
c2V0IGZyb20gYW55b25lLgo+Pgo+PiBJdCBsb29rcyBsaWtlIG11bHRpcGxlIHBsYXRmb3JtcyBt
YXkgYmUgYWZmZWN0ZWQgYnkgaXQgaW4gcHJpbmNpcGxlLAo+PiBzbyBkb2Vzbid0IGFueW9uZSBj
YXJlPwoKVGhlIHBsYXRmb3JtcyB0aGF0IGRpZG4ndCBwcm92aWRlIGFjayBzbyBmYXIgYXJlOiBT
SCwgeDg2LCBJQTY0LCBNSVBTCmFuZCBORFMzMi4gQXQgbGVhc3QgeDg2IGFuZCBNSVBTIGFyZSBh
bGl2ZSwgbm90IHN1cmUgd2h5IG1haW50YWluZXJzCmRpZG4ndCBib3RoZXIgdG8gYW5zd2VyIHll
dC4KCj4gSSBkaWQgbG9va2VkIGludG8gdGhlIHdob2xlIHBhdGNoIHNldCBhZnRlciBhcHBseWlu
ZyBpdCBsb2NhbGx5Lgo+IAo+IFdoaWxlIEkgYWdyZWUgYSBuZXcgY29tYmluZWQgQVBJIGlzIGdv
b2QsIGFuZCB0aGUgYmVnaW5uaW5nIGxvb2tlZCBwcm9taXNpbmcsCj4gYWZ0ZXIgc29tZSB0aW1l
IEkgc3RhcnRlZCB0byBhc2sgbXlzZWxmIGlmIHRoZSB3aG9sZSBpbmZyYXN0cnVjdHVyZSBtaWdo
dAo+IGJlIGEgbGl0dGxlIG92ZXJkZXNpZ25lZC4KPiAKPiBBbnl3YXksIEkgdGVzdGVkIGl0IGFu
ZCBpdCB3b3JrcyBmb3IgbWUgb24gcGFyaXNjLgo+IEFuZCBpdCdzIHByb2JhYmx5IGJldHRlciB0
aGFuIHdoYXQgd2UgaGF2ZSB0b2RheS4KClRoYW5rIHlvdSEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
