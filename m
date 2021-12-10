Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CACCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o4T2ZBNnpmpDIglN696j3rdkgGjkD9F1RTUQIbHWTVI=; b=SB5MKkEGCV04F1CdJTCdVIbccl
	NQHOUPVW5mjmAjdg3kCBmZa5zFY8WS26WJK6efjgjePkCO92/ZF9OHUa3ILVy2Va2AvAY37XicPgu
	de8EZz7AaurALkx372sz+nf3+yURWLG2Ob+YFB47EUFHSiLWQhrAOXr1QsuJrIuRSFuv0KqxlcgT2
	xf9tQNbsPeSX5ZviqSBRW90SHikML4GB1HNV5f8XOpJR7t8H2x7USYh6fjz4LHqBXiVvc+PmUOJC/
	FIxsAnlxiGWEVN/pL89Wcwg1O4BeerIvyR3amhbajE09h6yTT1I+2DVGWrIToWqXqd5LM/lBuGHD4
	f8rzyjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlee-003ZxQ-0u; Fri, 10 Dec 2021 19:34:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlea-003Zom-O1; Fri, 10 Dec 2021 19:34:02 +0000
Received: by mail-lf1-x130.google.com with SMTP id b1so19776532lfs.13;
 Fri, 10 Dec 2021 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f67p7hle6233nGxb6/xc+P0FVeEPFRJiI9iN2B4WT58=;
 b=kS8TNlYiN6vyIeYsSnRv3CIueRF7pdxQ8UZE6mOB14p99gTRdCMFnHOR44Z3ji5MiJ
 D03uWCT5igggIgLk+p2yc39IbVlARk1+JEGaNZDdXQzNupiaX8nvnDwM3tNyc59SP0HR
 COvxv+cjl6P+TY6I1M8f+NUOUD7TJTgjbz/0uJ+yLcxHdNhreTMQklx4JM+7jiYJuUv/
 resLJQRarl+ZtO8U6+PT9CFznfJa6MhK2xrna+jAtgpFDFUXFJ1z/3ZkYUzHdjAlQrRG
 I07USXxffxsEm/0A0PVKkY0duuTB1Y6XKt0r4xjJRFk8H0T/57tNUYmytuaRwqLJ7SMF
 vNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f67p7hle6233nGxb6/xc+P0FVeEPFRJiI9iN2B4WT58=;
 b=E40sy1S+W/Dtkvpy/ALSkLDCvUC78/S6jlKB9VIDTaqjYWFzXdw/hMlO/1MDyMiOXt
 cHI17Fo98xUxKgWK+rb9DX42MIpmd0vs+vgDQIFf2/w83AIcLHCrNw6Mo5Tph5zXVrkN
 n/aN17PbS4ofhEC/QFtu5cWbsBUZbDY2ngIPB5LIIrsHdA0yvrHDz/sejAQUKxENk861
 sxC/AvCAoJuy5gvl0rTcZ5vYLPyXbbkStx7z117CwFbdKFeEzwR5oLIOOOEE85HJr8AZ
 cVtQqmSAMgL52/m/XeRkqP07sKudCDQ7W+b7pIz02YXYCrE/FZ4W7MZXQ1Z0nS1VcnLo
 QhEg==
X-Gm-Message-State: AOAM530WJ3a5IZY3YZ6DZE9agXG6JE0j01k0BmSKeT+ARDJmPobYco+n
 jxqHzxM7MIbHIZo2VaDvOJ0=
X-Google-Smtp-Source: ABdhPJw47o96fQpbRseSJ19MnRQSW7xcHQNSX+uqiAcRJr+V49fJkk5gdmPL9j60fMnbKKwiMUD2ZA==
X-Received: by 2002:a05:6512:6e:: with SMTP id
 i14mr15149045lfo.488.1639164814789; 
 Fri, 10 Dec 2021 11:33:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id v23sm394184lji.79.2021.12.10.11.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:33:34 -0800 (PST)
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
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
 <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Date: Fri, 10 Dec 2021 22:33:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_113400_797654_2E3934AD 
X-CRM114-Status: GOOD (  34.47  )
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

MTAuMTIuMjAyMSAyMjowNSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IERlYyAxMCwgMjAyMSBhdCA3OjUyIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IDEwLjEyLjIwMjEgMjE6MTksIFJhZmFlbCBKLiBXeXNvY2tpINC/0LjR
iNC10YI6Cj4+IC4uLgo+Pj4+ICtib29sIGF0b21pY19ub3RpZmllcl9oYXNfdW5pcXVlX3ByaW9y
aXR5KHN0cnVjdCBhdG9taWNfbm90aWZpZXJfaGVhZCAqbmgsCj4+Pj4gKyAgICAgICAgICAgICAg
IHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKPj4+PiArewo+Pj4+ICsgICAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPj4+PiArICAgICAgIGJvb2wgcmV0Owo+Pj4+ICsKPj4+PiArICAgICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZuaC0+bG9jaywgZmxhZ3MpOwo+Pj4+ICsgICAgICAgcmV0ID0gbm90
aWZpZXJfaGFzX3VuaXF1ZV9wcmlvcml0eSgmbmgtPmhlYWQsIG4pOwo+Pj4+ICsgICAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmbmgtPmxvY2ssIGZsYWdzKTsKPj4+Cj4+PiBUaGlzIG9ubHkg
d29ya3MgaWYgdGhlIGNhbGxlciBjYW4gcHJldmVudCBuZXcgZW50cmllcyBmcm9tIGJlaW5nIGFk
ZGVkCj4+PiB0byB0aGUgbGlzdCBhdCB0aGlzIHBvaW50IG9yIGlmIHRoZSBjYWxsZXIga25vd3Mg
dGhhdCB0aGV5IGNhbm5vdCBiZQo+Pj4gYWRkZWQgZm9yIHNvbWUgcmVhc29uLCBidXQgdGhlIGtl
cm5lbGRvYyBkb2Vzbid0IG1lbnRpb24gdGhpcwo+Pj4gbGltaXRhdGlvbi4KPj4KPj4gSSdsbCB1
cGRhdGUgdGhlIGNvbW1lbnQuCj4+Cj4+IC4uCj4+Pj4gK2Jvb2wgYmxvY2tpbmdfbm90aWZpZXJf
aGFzX3VuaXF1ZV9wcmlvcml0eShzdHJ1Y3QgYmxvY2tpbmdfbm90aWZpZXJfaGVhZCAqbmgsCj4+
Pj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKPj4+PiArewo+Pj4+
ICsgICAgICAgYm9vbCByZXQ7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgLyoKPj4+PiArICAgICAgICAq
IFRoaXMgY29kZSBnZXRzIHVzZWQgZHVyaW5nIGJvb3QtdXAsIHdoZW4gdGFzayBzd2l0Y2hpbmcg
aXMKPj4+PiArICAgICAgICAqIG5vdCB5ZXQgd29ya2luZyBhbmQgaW50ZXJydXB0cyBtdXN0IHJl
bWFpbiBkaXNhYmxlZC4gQXQgc3VjaAo+Pj4+ICsgICAgICAgICogdGltZXMgd2UgbXVzdCBub3Qg
Y2FsbCBkb3duX3JlYWQoKS4KPj4+PiArICAgICAgICAqLwo+Pj4+ICsgICAgICAgaWYgKHN5c3Rl
bV9zdGF0ZSAhPSBTWVNURU1fQk9PVElORykKPj4+Cj4+PiBObywgcGxlYXNlIGRvbid0IGRvIHRo
aXMsIGl0IG1ha2VzIHRoZSB3aG9sZSB0aGluZyBlcnJvci1wcm9uZS4KPj4KPj4gV2hhdCBzaG91
bGQgSSBkbyB0aGVuPwo+IAo+IEZpcnN0IG9mIGFsbCwgZG8geW91IGtub3cgb2YgYW55IHVzZXJz
IHdobyBtYXkgd2FudCB0byBjYWxsIHRoaXMKPiBkdXJpbmcgZWFybHkgaW5pdGlhbGl6YXRpb24/
ICBJZiBzbywgdGhlbiB3aHkgbWF5IHRoZXkgd2FudCB0byBkbwo+IHRoYXQ/CgpJJ2xsIG5lZWQg
dG8gY2FyZWZ1bGx5IHJldmlldyBhbGwgdGhvc2UgZG96ZW5zIG9mIHBsYXRmb3JtIHJlc3RhcnQK
aGFuZGxlcnMgdG8gYW5zd2VyIHRoaXMgcXVlc3Rpb24uCgo+IERlcGVuZGluZyBvbiB0aGUgYWJv
dmUsIEkgd291bGQgY29uc2lkZXIgYWRkaW5nIGEgc3BlY2lhbCBtZWNoYW5pc20gZm9yIHRoZW0u
CgpQbGVhc2Ugbm90aWNlIHRoYXQgZXZlcnkgYmxvY2tpbmdfbm90aWZpZXJfKigpIGZ1bmN0aW9u
IGhhcyB0aGlzClNZU1RFTV9CT09USU5HIGNoZWNrLCBpdCdzIG5vdCBteSBpbnZlbnRpb24uIE5v
dGlmaWVyIEFQSSBuZWVkcyB0byBiZQpnZW5lcmljLgoKPj4+PiArICAgICAgICAgICAgICAgZG93
bl9yZWFkKCZuaC0+cndzZW0pOwo+Pj4+ICsKPj4+PiArICAgICAgIHJldCA9IG5vdGlmaWVyX2hh
c191bmlxdWVfcHJpb3JpdHkoJm5oLT5oZWFkLCBuKTsKPj4+PiArCj4+Pj4gKyAgICAgICBpZiAo
c3lzdGVtX3N0YXRlICE9IFNZU1RFTV9CT09USU5HKQo+Pj4+ICsgICAgICAgICAgICAgICB1cF9y
ZWFkKCZuaC0+cndzZW0pOwo+Pj4KPj4+IEFuZCBzdGlsbCB3aGF0IGlmIGEgbmV3IGVudHJ5IHdp
dGggYSBub24tdW5pcXVlIHByaW9yaXR5IGlzIGFkZGVkIHRvCj4+PiB0aGUgY2hhaW4gYXQgdGhp
cyBwb2ludD8KPj4KPj4gSWYgZW50cnkgd2l0aCBhIG5vbi11bmlxdWUgcHJpb3JpdHkgaXMgYWRk
ZWQgYWZ0ZXIgdGhlIGNoZWNrLCB0aGVuCj4+IG9idmlvdXNseSBpdCB3b24ndCBiZSBkZXRlY3Rl
ZC4KPiAKPiBXaHkgaXNuJ3QgdGhpcyBhIHByb2JsZW0/Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHRo
ZSBxdWVzdGlvbi4gVGhlc2UKPj4gZG93bi91cF9yZWFkKCkgYXJlIHRoZSBsb2NrcyB0aGF0IHBy
ZXZlbnQgdGhlIHJhY2UsIGlmIHRoYXQncyB0aGUgcXVlc3Rpb24uCj4gCj4gTm90IHJlYWxseSwg
dGhleSBvbmx5IHByZXZlbnQgdGhlIHJhY2UgZnJvbSBvY2N1cnJpbmcgd2hpbGUKPiBub3RpZmll
cl9oYXNfdW5pcXVlX3ByaW9yaXR5KCkgaXMgcnVubmluZy4KPiAKPiBJZiBhbnlvbmUgZGVwZW5k
cyBvbiB0aGlzIGNoZWNrIGZvciBjb3JyZWN0bmVzcywgdGhleSBuZWVkIHRvIGxvY2sgdGhlCj4g
cndzZW0sIGRvIHRoZSBjaGVjaywgZG8gdGhlIHRoaW5nIGRlcGVuZGluZyBvbiB0aGUgY2hlY2sg
d2hpbGUgaG9sZGluZwo+IHRoZSByd3NlbSBhbmQgdGhlbiByZWxlYXNlIHRoZSByd3NlbS4gIE90
aGVyd2lzZSBpdCBpcyByYWN5Lgo+IAoKSXQncyBmaW5lIHRoYXQgaXQncyBhIGJpdCAicmFjeSIg
c2luY2UgaW4gdGhlIGNvbnRleHQgb2YgdGhpcyBzZXJpZXMuIFdlCmFsd2F5cyBkbyB0aGUgY2hl
Y2sgYWZ0ZXIgYWRkaW5nIG5ldyBlbnRyeSwgc28gaXQncyBub3QgYSBwcm9ibGVtLgoKVGhlcmUg
YXJlIHR3byBvcHRpb25zOgoKMS4gVXNlIGJsb2NraW5nX25vdGlmaWVyX2hhc191bmlxdWVfcHJp
b3JpdHkoKSBsaWtlIGl0J3MgZG9uZSBpbiB0aGlzCnBhdGNoc2V0LiBSZW1vdmUgaXQgYWZ0ZXIg
YWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byB0aGUgbmV3IEFQSSBhbmQKYWRkIGJsb2NraW5n
X25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyX3VuaXF1ZSgpLgoKMi4gQWRkIGJsb2NraW5nX25vdGlm
aWVyX2NoYWluX3JlZ2lzdGVyX3VuaXF1ZSgpLCBidXQgZG9uJ3QgbGV0IGl0IGZhaWwKdGhlIHJl
Z2lzdHJhdGlvbiBvZiBub24tdW5pcXVlIGVudHJpZXMgdW50aWwgYWxsIGRyaXZlcnMgYXJlIGNv
bnZlcnRlZAp0byB0aGUgbmV3IEFQSS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
