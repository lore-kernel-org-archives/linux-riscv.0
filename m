Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9650CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kkOSNpRTTCYIaSAoHYiE29LA83Ed0hN1Z4h+ZCBiqPw=; b=DuOAQxZtUpNq79xow3iihHXUE6
	x9mQ7cxG/izmfsPSUVc3kj25f71ArFZiC7czFLuSvrCcBaIbpQ78BlZkEdFNwQdYhbt7xAdUsm3Tb
	HITSHKLi2BjUwlchEGqoJuskzT+WsC33BTtO/9BXx7nRn7HoQTAWyb6cVlijnqZX1uSIhu9x9cKEU
	TIEpR0TAafUpsJmZPYS2vK6wSJts31i3SUe+J8a7IuURBov4Eu9szQIfhg/f3usgi6Uz0Uo53+dum
	eCXHBVtbWVGkLa+g7KffZfYyoIQAAFMwyfC/fMi0p0qvGvLGOSzDIcKjWlw67izf488dYcX1L8pHk
	xWpmw8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvmJs-003jHq-Ty; Fri, 10 Dec 2021 20:16:41 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvmJm-003jCZ-9Q; Fri, 10 Dec 2021 20:16:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c32so20099438lfv.4;
 Fri, 10 Dec 2021 12:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
 b=pA5gJzqpb6DuYCThgFEy/8I55Q/DWCaUg3a+PUCGAi7titTHPZavt9HNjzNTaNOdtA
 W9bvYLeTFtb26OuFlSespYNsQjEuRbN74aib6efdQf4sRvk0jZOXEyR7Ry1SlPtvny3V
 dHFm88kS0utx46N/B1V95jCju3EdX/3tioPOW0AUjL07+k8WzDTAaYKBNQJxB0pggImt
 zxKY302IiWihQZ6zPY6n4S1ZYz2akRfe0TTR5ci41YrCJJyH8fb1pqNG9DRsK91AXeR3
 4OlRlbRYehYwacP4ScBqgyVswzojoT/ol0CB6bk5gTERql84YP9I/T1kujCvte5MFcNM
 x95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
 b=QzdKCxDKGfM+nc8URRUZSCkyLedCYceuXJqHjiGKegu1wNC6lJ3LuUSZbpl3BO/gXE
 J1RihIiwslaQcik6VMHW3simpXU4b4bXsW/gbYE0ncc5gO0Wz9TKY3VjAo58sJEgd+La
 FVOLjTpisncz8v5NtpkTR2+l3aeuueU2wWEhx8stbx11/E/Q69b2FqXklicCBubiGalV
 Lgg/N2fzTAHtC2igkxD+42rPXj32Pd0mNBjkG2JZO8YOCa60hDswyw+bkNve9OHqi3RD
 D3nARNweHL70KekAHnnc1Qvq533MQihYRm848HR0HL0dtrExn6Cm+rYUYV//vmhZUZBq
 fXRg==
X-Gm-Message-State: AOAM530XXWHSWBUXmh3YV+mZh9J5DISDrhDqugTiyD9RlF2E8n1K4oMK
 KnA2l1J6TQJx5PG3GVl7QK0=
X-Google-Smtp-Source: ABdhPJwE5tZeH/HHL0CnlLb6JayzZfWyUFquo/I1vHYJYjJlUN8IQfec3+fnfy4fMkF6dVQvXojbFQ==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr14265704lfu.18.1639167392050; 
 Fri, 10 Dec 2021 12:16:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z23sm409427ljn.23.2021.12.10.12.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 12:16:31 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
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
 <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Message-ID: <218e67e2-1d8c-5727-3862-8884d74aa63e@gmail.com>
Date: Fri, 10 Dec 2021 23:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_121634_462703_541CEAF6 
X-CRM114-Status: GOOD (  21.60  )
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

MTAuMTIuMjAyMSAyMjozMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IE5vdCByZWFs
bHksIHRoZXkgb25seSBwcmV2ZW50IHRoZSByYWNlIGZyb20gb2NjdXJyaW5nIHdoaWxlCj4+IG5v
dGlmaWVyX2hhc191bmlxdWVfcHJpb3JpdHkoKSBpcyBydW5uaW5nLgo+Pgo+PiBJZiBhbnlvbmUg
ZGVwZW5kcyBvbiB0aGlzIGNoZWNrIGZvciBjb3JyZWN0bmVzcywgdGhleSBuZWVkIHRvIGxvY2sg
dGhlCj4+IHJ3c2VtLCBkbyB0aGUgY2hlY2ssIGRvIHRoZSB0aGluZyBkZXBlbmRpbmcgb24gdGhl
IGNoZWNrIHdoaWxlIGhvbGRpbmcKPj4gdGhlIHJ3c2VtIGFuZCB0aGVuIHJlbGVhc2UgdGhlIHJ3
c2VtLiAgT3RoZXJ3aXNlIGl0IGlzIHJhY3kuCj4+Cj4gSXQncyBmaW5lIHRoYXQgaXQncyBhIGJp
dCAicmFjeSIgc2luY2UgaW4gdGhlIGNvbnRleHQgb2YgdGhpcyBzZXJpZXMuIFdlCj4gYWx3YXlz
IGRvIHRoZSBjaGVjayBhZnRlciBhZGRpbmcgbmV3IGVudHJ5LCBzbyBpdCdzIG5vdCBhIHByb2Js
ZW0uCj4gCj4gVGhlcmUgYXJlIHR3byBvcHRpb25zOgo+IAo+IDEuIFVzZSBibG9ja2luZ19ub3Rp
Zmllcl9oYXNfdW5pcXVlX3ByaW9yaXR5KCkgbGlrZSBpdCdzIGRvbmUgaW4gdGhpcwo+IHBhdGNo
c2V0LiBSZW1vdmUgaXQgYWZ0ZXIgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byB0aGUgbmV3
IEFQSSBhbmQKPiBhZGQgYmxvY2tpbmdfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXJfdW5pcXVlKCku
Cj4gCj4gMi4gQWRkIGJsb2NraW5nX25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyX3VuaXF1ZSgpLCBi
dXQgZG9uJ3QgbGV0IGl0IGZhaWwKPiB0aGUgcmVnaXN0cmF0aW9uIG9mIG5vbi11bmlxdWUgZW50
cmllcyB1bnRpbCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkCj4gdG8gdGhlIG5ldyBBUEkuCgpU
aGVyZSBpcyB0aGlyZCwgcGVyaGFwcyB0aGUgYmVzdCBvcHRpb246CgozLiBBZGQgYmxvY2tpbmdf
bm90aWZpZXJfY2hhaW5fcmVnaXN0ZXJfdW5pcXVlKCkgYW5kIGZhbGwgYmFjayB0bwpibG9ja2lu
Z19ub3RpZmllcl9jaGFpbl9yZWdpc3RlcigpIGlmIHVuaXF1ZSBmYWlscywgZG8gaXQgdW50aWwg
YWxsCmRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byB0aGUgbmV3IEFQSS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
