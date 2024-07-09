Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C34C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMQjlBu22CQHqA7zfFPvDkeKsF16sYQG7RJNeqA6YUg=; b=LYc0eoNIEZbx1g
	Nyfwg28AymPZVH5xZ0XFEa4MJXFLAuLAAlCKF5sIQsFBBwgivZU3VWXnu/YZbtR1K81rKp9J9JqgG
	2Z6tFrZ1+A3leVIZGstqfrK7zgxlf+dXPQoExXTVeQbXgP7Gn28NdVnEl7CAYj6glZ1xS+94Iwe/H
	qrLkgKld3D2qz9T9V+pGXn+rK6mRz6YgJj0uTITkWY+D2wbp+9+gUtkRltoNA65QNHr9Wtdbn638h
	Omrl8TrxfQ7z4nAabiJLlzjIW4Ru27ozPSWXpsDP8l3rJ3yrGo6aFEu1+a425UBTEmhSTwbdYWjZe
	bkoc6+jwtLmUouq5CFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRAEG-00000007BNn-1CbC;
	Tue, 09 Jul 2024 12:45:56 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRAEC-00000007BL2-16RG;
	Tue, 09 Jul 2024 12:45:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso1289335ad.1;
        Tue, 09 Jul 2024 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720529151; x=1721133951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTkMABYzGdhSQd9C4loTDYzycJLf8ODZaPM06fmE3pI=;
        b=PVguD2o7ctxsfbloYf2fpje4SImhWFaQ3txo60/EQbBhCIq//f0RDyr7m4j/wGkS2n
         Kdxrz+6bMqfYSvlKyt/qVPBBGLF29RYVaZ16TsN4uFiGp9aLcCqpCQlvbPUgr2ZtNyZ5
         Cwxo3rxNdTa1E2rJeeTSqkFtcAemhyOgqNDUJdV3Lye/Mdxbfv9zaz5BpNE1Uz68gz/3
         S1VzZRXMu5C6GCl7Aad27xyZIhUyrbV5s5rbG3mx3UsdJNsMg5fGtkJKDLSy3GVpBctm
         gWcGZH3q6+2mM1KsdwVlJya9C1sEtO7cmOQ3tKOJuObIoreFt9wLalaHqzxJJ8jsC6ad
         CUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529151; x=1721133951;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTkMABYzGdhSQd9C4loTDYzycJLf8ODZaPM06fmE3pI=;
        b=vJl/WriiW40qwkubrvgigReOUsxs2nWRUmgCJlPzvnPcq4X7iDkwtQsBNNOJIQBtzH
         hCcwZhb282MU26I31MbFqZ7OTd1AFD8pWo16OTZSK4yOMloibUt85HBI+oJLKPPThcxq
         5zk7BBHxBShaQ0Ag8zeRQDvJttgyLJkLann/CQVcah35ZdTUtjReKxwWe3C2V+Pqp87D
         TBbzKTEEw2mnGJ8PbxaLLLXbAmT/kFZDUJJDoS3JQpSUuNjzVJ6MFXpmhV1xyG6EOVQb
         T8DRLBqwW/RuecWIxzio+2imksCPQSHdZYBQuHlDXAPor9DJHMHHU/8kuWoTFoyXZwUf
         zvdw==
X-Forwarded-Encrypted: i=1; AJvYcCURHe4LQdrh9B023sXea50FF0QsiqnSTUHCZKVcqh/46eXLJQ1nADVy8ewzeZ86nDJNpiP45ZQqh6wi8eVTa5MwUwkznGmwHCgvzIy/Cr1dEZSGsbgV3vzl8ZwR5rzLDwcEUXqHaH2ltM4gz7+Sup200U3CnMtEBIjh7LXpPaYJBgTN7zGSVwQeZ3VrNO4gJMwJra0WO35J/J1n5A==
X-Gm-Message-State: AOJu0YziqfISbGXCoBaKsE+eF+cbJt4exulv6R+UNNWdPc3Sd//RzQOP
	ktmeIfhLrCwqf+unqrupG9ptz93Hr9KnzwL0F3iPPJlO3WWag0u6
X-Google-Smtp-Source: AGHT+IFOaJNRaCw0x5duAR8ySF29N2zLhsw5jMvf8ySrYnWHRx3vmy5Ah54KY0oG4A60mrkmNodEQw==
X-Received: by 2002:a05:6a20:734b:b0:1be:caf6:66e5 with SMTP id adf61e73a8af0-1c29820d407mr2618980637.6.1720529150564;
        Tue, 09 Jul 2024 05:45:50 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acf9a3sm15241475ad.255.2024.07.09.05.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 05:45:49 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <44535d2d-c95d-4673-b845-032669cf7abf@gmail.com>
Date: Tue, 9 Jul 2024 20:45:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
To: Stefan Wahren <wahrenst@gmx.net>, Kevin Hilman <khilman@kernel.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
 <7hv81f78cy.fsf@baylibre.com> <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
Content-Language: en-GB-large
In-Reply-To: <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_054552_325584_CE251C6F 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, Lennart Poettering <lennart@poettering.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjQtMDctMDkgMjA6MjYsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4gSGkgQ2VsZXN0ZSwK
PiAKPiB0aGVyZSBpcyBhIHR5cG8gaW4gdGhlIHN1YmplY3QgbGluZQo+IAo+IHMvYmNtMjg1NS9i
Y20yODM1CgpXaWxsIGJlIGluY2x1ZGVkIGluIG5leHQgdmVyc2lvbi4KCj4gCj4gQW0gMDkuMDcu
MjQgdW0gMDE6NDkgc2NocmllYiBLZXZpbiBIaWxtYW46Cj4+IENlbGVzdGUgTGl1IDxjb2VsYWNh
bnRodXNoZXhAZ21haWwuY29tPiB3cml0ZXM6Cj4+Cj4+PiBDb21taXQgNjczY2UwMGM1ZDZjICgi
QVJNOiBvbWFwMnBsdXNfZGVmY29uZmlnOiBBZGQgc3VwcG9ydCBmb3IgZGlzdHJvcwo+Pj4gd2l0
aCBzeXN0ZW1kIikgc2FpZCBpdCdzIGJlY2F1c2Ugb2YgcmVjb21tZW5kYXRpb24gZnJvbSBzeXN0
ZW1kLiBCdXQKPj4+IHN5c3RlbWQgY2hhbmdlZCB0aGVpciByZWNvbW1lbmRhdGlvbiBsYXRlci5b
MV0KPj4+Cj4+PiBGb3IgY2dyb3VwIHYxLCBpZiB0dXJuZWQgb24sIGFuZCB0aGVyZSdzIGFueSBj
Z3JvdXAgaW4gdGhlICJjcHUiIGhpZXJhcmNoeSBpdAo+Pj4gbmVlZHMgYW4gUlQgYnVkZ2V0IGFz
c2lnbmVkLCBvdGhlcndpc2UgdGhlIHByb2Nlc3NlcyBpbiBpdCB3aWxsIG5vdCBiZSBhYmxlIHRv
Cj4+PiBnZXQgUlQgYXQgYWxsLiBUaGUgcHJvYmxlbSB3aXRoIFJUIGdyb3VwIHNjaGVkdWxpbmcg
aXMgdGhhdCBpdCByZXF1aXJlcyB0aGUKPj4+IGJ1ZGdldCBhc3NpZ25lZCBidXQgdGhlcmUncyBu
byB3YXkgd2UgY291bGQgYXNzaWduIGEgZGVmYXVsdCBidWRnZXQsIHNpbmNlIHRoZQo+Pj4gdmFs
dWVzIHRvIGFzc2lnbiBhcmUgYm90aCB1cHBlciBhbmQgbG93ZXIgdGltZSBsaW1pdHMsIGFyZSBh
YnNvbHV0ZSwgYW5kIG5lZWQgdG8KPj4+IGJlIHN1bSB1cCB0byA8IDEgZm9yIGVhY2ggaW5kaXZp
ZGFsIGNncm91cC4gVGhhdCBtZWFucyB3ZSBjYW5ub3QgcmVhbGx5IGNvbWUgdXAKPj4+IHdpdGgg
dmFsdWVzIHRoYXQgd291bGQgd29yayBieSBkZWZhdWx0IGluIHRoZSBnZW5lcmFsIGNhc2UuWzJd
Cj4+Pgo+Pj4gRm9yIGNncm91cCB2MiwgaXQncyBhbG1vc3QgdW51c2FibGUgYXMgd2VsbC4gSWYg
aXQgdHVybmVkIG9uLCB0aGUgY3B1IGNvbnRyb2xsZXIKPj4+IGNhbiBvbmx5IGJlIGVuYWJsZWQg
d2hlbiBhbGwgUlQgcHJvY2Vzc2VzIGFyZSBpbiB0aGUgcm9vdCBjZ3JvdXAuIEJ1dCBpdCB3aWxs
Cj4+PiBsb3NlIHRoZSBiZW5lZml0cyBvZiBjZ3JvdXAgdjIgaWYgYWxsIFJUIHByb2Nlc3Mgd2Vy
ZSBwbGFjZWQgaW4gdGhlIHNhbWUgY2dyb3VwLgo+Pj4KPj4+IFJlZCBIYXQsIEdlbnRvbywgQXJj
aCBMaW51eCBhbmQgRGViaWFuIGFsbCBkaXNhYmxlIGl0LiBzeXN0ZW1kIGFsc28gZG9lc24ndAo+
Pj4gc3VwcG9ydCBpdC4KPj4+Cj4+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5
c3RlbWQvY29tbWl0L2Y0ZTc0YmUxODU2YjNhYzA1OGFjYmYxYmUzMjFjMzFkNTI5OWY2OWYKPj4+
IFsyXTogaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xMjI5NzAw
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBnbWFp
bC5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtL2NvbmZpZ3MvYmNtMjgzNV9kZWZjb25maWfC
oMKgIHwgMSAtCj4+PiDCoCBhcmNoL2FybS9jb25maWdzL29tYXAycGx1c19kZWZjb25maWcgfCAx
IC0KPj4+IMKgIGFyY2gvYXJtL2NvbmZpZ3MvdGVncmFfZGVmY29uZmlnwqDCoMKgwqAgfCAxIC0K
Pj4gRm9yIG9tYXAycGx1c19kZWZjb25maWc6Cj4+Cj4+IEFja2VkLWJ5OiBLZXZpbiBIaWxtYW4g
PGtoaWxtYW5AYmF5bGlicmUuY29tPgo+Pgo+Pgo+IEZvciBiY20yODM1X2RlZmNvbmZpZzoKPiAK
PiBUZXN0ZWQtYnk6IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
