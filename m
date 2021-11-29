Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD07C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZJ2e0evOkTx4UsB2iYNkQdFATUwoo9jfBAPXF/eMXZE=; b=j6sufe1dZ1gp6rjOFSq9YWy5Mv
	WAWrS1oJtwMS7UIuJ7XOGjZHYTuoWro4xVVCAlad/3UoR6kecI1Wjw2+Jz63Szd0NAvNVp+rgfPoz
	IbBRWyQvUnEH86yDfA8kLkDME+Iria7L3knM2eHNXekLMDz6vany7YeEe61I7IdipuhEbR8yMMqjz
	+97ANSBMiROr+APNkHxHs09JQTdCBkFahCN9mWzenuQaLH+/108n3y7UP7ScgFFellAEc9nrzxx9J
	b9P0vU0r8btMzL9klVdWBVo2U2IlhYH0WkbazbGd4SORsAb7vqCLCrA/No8liD5s0GPviEcsLiXKe
	cNaKAl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrevv-000YQg-Eh; Mon, 29 Nov 2021 11:34:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrevt-000YQB-Bi; Mon, 29 Nov 2021 11:34:54 +0000
Received: by mail-lj1-x22a.google.com with SMTP id p8so20328299ljo.5;
 Mon, 29 Nov 2021 03:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=euaa0MK3qpl38vu/xm/JZntaVOCHcXyS5pdHcr9Cv9Y=;
 b=j7IepB0c7QsF+gZGn8sLWlXDCQr83Yhq9Uwq9fJmgvQdhWWCer0J3Db/gwAG0Blu3V
 KLIiDLWANtPW2sX+O/m2jQqBDLC+4NfkDAxYnlnBfxi7qlePYrZZysw0Kj4NFPMagEe7
 5Z58UnljUl1PUrtNNqQtNaR8rjEOAOjAptz9aZ81TzHnOGVzQL+Ka518l0o45nrM05c1
 wTSb3kazkFWdVLhzdtamDwO56fb5XsgOF41m+pkkrOCbpYLS/NmBUtznRV2wcvObV+eX
 /QUCocD7Th3AP/6bIoc90HuBDrH/5Le5nNAAFps88ziv0187Td+CIqcDZxoQmDkSEFJt
 ILjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=euaa0MK3qpl38vu/xm/JZntaVOCHcXyS5pdHcr9Cv9Y=;
 b=lR3DYEgCX9JZUTJi810aUgfpkqTG78/z5LBShZAHJmOZEljD20vF4Q86rwyLrylxuy
 TPpjo/cniB/CSxKRfIh6UzF4Appl2+8RljNQJdb5cgJJ+kzifyNfKK3EP5uOdX6rj0CA
 THUhHnG9JnnX2e2fNtXlRDb+yLSm8/d/yygEzVhNnFlBhRgj1xHxsUe2cjmZtT+NDcy5
 baP8qUn5SqSbEMN/G+jKuP3jB0uofmAsXqJaAW4/AesewGGc4WnsfnpFdfGivy+N4+Oo
 IFkuWMzJ/jcsRm/7nkMrTqFRjf4ZD4YNhcaPUzXmYNo63x8sHbl/27ncoJHSbOnpVDAR
 yurw==
X-Gm-Message-State: AOAM531Fs3PAG5sI16FvQ50DDfJUG/fH6Dq7dYbzlU8aEPK72eJMYQ1X
 dYeaddrkzyO9hbugZlZIO5k=
X-Google-Smtp-Source: ABdhPJzVpycz41Q2saZagDnrHTPX3H5Cn8S9UMBEs5Q4UAjlx4ArmiP2PAHXWXd2FxMxn0TZfV9KEQ==
X-Received: by 2002:a2e:814b:: with SMTP id t11mr47973901ljg.171.1638185691187; 
 Mon, 29 Nov 2021 03:34:51 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id n2sm131579ljq.30.2021.11.29.03.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 03:34:50 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
Date: Mon, 29 Nov 2021 14:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_033453_444534_5A81C14C 
X-CRM114-Status: GOOD (  32.28  )
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

MjkuMTEuMjAyMSAwMzoyNiwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBNb24s
IE5vdiAyOSwgMjAyMSBhdCAxMjowNjoxOUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IDI4LjExLjIwMjEgMDM6MjgsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6Cj4+PiBP
biBGcmksIE5vdiAyNiwgMjAyMSBhdCAwOTowMDo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28g
d3JvdGU6Cj4+Pj4gQWRkIHNhbml0eSBjaGVjayB3aGljaCBlbnN1cmVzIHRoYXQgdGhlcmUgYXJl
IG5vIHR3byByZXN0YXJ0IGhhbmRsZXJzCj4+Pj4gcmVnaXN0ZXJlZCB3aXRoIHRoZSBzYW1lIHBy
aW9yaXR5LiBOb3JtYWxseSBpdCdzIGEgZGlyZWN0IHNpZ24gb2YgYQo+Pj4+IHByb2JsZW0gaWYg
dHdvIGhhbmRsZXJzIHVzZSB0aGUgc2FtZSBwcmlvcml0eS4KPj4+Cj4+PiBUaGUgcGF0Y2ggZG9l
c24ndCBlbnN1cmUgdGhlIHByb3BlcnR5IHRoYXQgdGhlcmUgYXJlIG5vIGR1cGxpY2F0ZWQtcHJp
b3JpdHkKPj4+IGVudHJpZXMgb24gdGhlIGNoYWluLgo+Pgo+PiBJdCdzIG5vdCB0aGUgZXhhY3Qg
cG9pbnQgb2YgdGhpcyBwYXRjaC4KPj4KPj4+IEknZCByYXRoZXIgc2VlIGEgYXRvbWljX25vdGlm
aWVyX2NoYWluX3JlZ2lzdGVyX3VuaXF1ZSgpIHRoYXQgcmV0dXJucwo+Pj4gLUVCVVNZIG9yIHNv
bWV0aGluZyBpc3RlYWQgb2YgYWRkaW5nIGFuIGVudHJ5IHdpdGggZHVwbGljYXRlIHByaW9yaXR5
Lgo+Pj4gVGhhdCB3YXkgaXQgd291bGQgbmVlZCBvbmx5IG9uZSBsaXN0IHRyYXZlcnNhbCB1bmxl
c3MgeW91IHdhbnQgdG8KPj4+IHJlZ2lzdGVyIHRoZSBkdXBsaWNhdGUgYW55d2F5ICh0aGVuIHlv
dSB3b3VsZCBjYWxsIHRoZSBvbGRlcgo+Pj4gYXRvbWljX25vdGlmaWVyX2NoYWluX3JlZ2lzdGVy
KCkgYWZ0ZXIgcmVwb3J0aW5nIHRoZSBlcnJvcikuCj4+Cj4+IFRoZSBwb2ludCBvZiB0aGlzIHBh
dGNoIGlzIHRvIHdhcm4gZGV2ZWxvcGVycyBhYm91dCB0aGUgcHJvYmxlbSB0aGF0Cj4+IG5lZWRz
IHRvIGJlIGZpeGVkLiBXZSBhbHJlYWR5IGhhdmUgc3VjaCB0cm91YmxpbmcgZHJpdmVycyBpbiBt
YWlubGluZS4KPj4KPj4gSXQncyBub3QgY3JpdGljYWwgdG8gcmVnaXN0ZXIgZGlmZmVyZW50IGhh
bmRsZXJzIHdpdGggYSBkdXBsaWNhdGVkCj4+IHByaW9yaXRpZXMsIGJ1dCBzdWNoIGNhc2VzIHJl
YWxseSBuZWVkIHRvIGJlIGNvcnJlY3RlZC4gV2Ugc2hvdWxkbid0Cj4+IGJyZWFrIHVzZXJzJyBt
YWNoaW5lcyBkdXJpbmcgdHJhbnNpdGlvbiB0byB0aGUgbmV3IEFQSSwgbWVhbndoaWxlCj4+IGRl
dmVsb3BlcnMgc2hvdWxkIHRha2UgYWN0aW9uIG9mIGZpeGluZyB0aGVpcnMgZHJpdmVycy4KPj4K
Pj4+IChPciB5b3UgY291bGQgcmV0dXJuID4gMCB3aGVuIGEgZHVwbGljYXRlIGlzIHJlZ2lzdGVy
ZWQgaW4KPj4+IGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3RlcigpIGlmIHRoZSBjYWxsZXJz
IGFyZSBwcmVwYXJlZAo+Pj4gZm9yIHRoYXQuIEkgZG9uJ3QgcmVhbGx5IGxpa2UgdGhpcyB3YXks
IHRob3VnaC4pCj4+Cj4+IEkgaGFkIGEgc2ltaWxhciB0aG91Z2h0IGF0IHNvbWUgcG9pbnQgYmVm
b3JlIGFuZCBkZWNpZGVkIHRoYXQgSSdtIG5vdCBpbgo+PiBmYXZvciBvZiB0aGlzIGFwcHJvYWNo
LiBJdCdzIG5pY2VyIHRvIGhhdmUgYSBkZWRpY2F0ZWQgZnVuY3Rpb24gdGhhdAo+PiB2ZXJpZmll
cyB0aGUgdW5pcXVlbmVzcywgSU1PLgo+IAo+IEkgZG9uJ3QgbGlrZSB0aGUgcGFydCB0aGF0IGl0
IHRyYXZlcnNlcyB0aGUgbGlzdCBzZWNvbmQgdGltZSB0byBjaGVjawo+IHRoZSB1bmlxdWVuZXNz
LiBCdXQgYWN0dWFsbHkgeW91IGNvdWxkIGF2b2lkIHRoYXQgaWYKPiBub3RpZmllcl9jaGFpbl9y
ZWdpc3RlcigpIHdvdWxkIGFsd2F5cyBhZGQgZXF1YWwtcHJpb3JpdHkgZW50cmllcyBpbgo+IHJl
dmVyc2Ugb3JkZXI6Cj4gCj4gIHN0YXRpYyBpbnQgbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrICoqbmwsCj4gIAkJc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuKQo+
ICB7Cj4gIAl3aGlsZSAoKCpubCkgIT0gTlVMTCkgewo+ICAJCWlmICh1bmxpa2VseSgoKm5sKSA9
PSBuKSkgewo+ICAJCQlXQVJOKDEsICJkb3VibGUgcmVnaXN0ZXIgZGV0ZWN0ZWQiKTsKPiAgCQkJ
cmV0dXJuIDA7Cj4gIAkJfQo+IC0JCWlmIChuLT5wcmlvcml0eSA+ICgqbmwpLT5wcmlvcml0eSkK
PiArCQlpZiAobi0+cHJpb3JpdHkgPj0gKCpubCktPnByaW9yaXR5KQo+ICAJCQlicmVhazsKPiAg
CQlubCA9ICYoKCpubCktPm5leHQpOwo+ICAJfQo+ICAJbi0+bmV4dCA9ICpubDsKPiAgCXJjdV9h
c3NpZ25fcG9pbnRlcigqbmwsIG4pOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAKPiBUaGVuIHRoZSBj
aGVjayBmb3IgdW5pcXVlbmVzcyBhZnRlciBhZGRpbmcgd291bGQgYmU6Cj4gCj4gIFdBUk4obmIt
Pm5leHQgJiYgbmItPnByaW9yaXR5ID09IG5iLT5uZXh0LT5wcmlvcml0eSk7CgpXZSBjYW4ndCBq
dXN0IGNoYW5nZSB0aGUgcmVnaXN0cmF0aW9uIG9yZGVyIGJlY2F1c2UgaW52b2NhdGlvbiBvcmRl
ciBvZgp0aGUgY2FsbCBjaGFpbiBkZXBlbmRzIG9uIHRoZSByZWdpc3RyYXRpb24gb3JkZXIgYW5k
IHNvbWUgb2YgY3VycmVudAp1c2VycyBtYXkgcmVseSBvbiB0aGF0IG9yZGVyLiBJJ20gcHJldHR5
IHN1cmUgdGhhdCBjaGFuZ2luZyB0aGUgb3JkZXIKd2lsbCBoYXZlIHVuZm9ydHVuYXRlIGNvbnNl
cXVlbmNlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
