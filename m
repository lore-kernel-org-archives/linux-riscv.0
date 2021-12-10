Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D36DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8PquPhIvYBxUhd0CsyBh+HKrxOfekN/E2zWw+Y2O+j0=; b=ZKSpoMurgy+ebKM+fYCYud/H7y
	BkMYbQVXR9QmGc7Mm/oIoVbJH+pwNlQq1+MrXBj4BH5HrUPDDAquXZAQQGUWOURVMJiuscE26kSfJ
	2UUFm3RO44xXnzTUSA0zAKjXUk5B6eP8rtceDc7nPaBgQSh5FWP5j0k/5AyMLOLVPaRcFYD6eOdzI
	Su7mHulst/UL325ntSrga2i68RCEuhybxqcJjmgdcjEX7Q1NGgZrKpAxq2+0X00RbUOuNYcioY4+K
	/BaHMXJ7GTq5JJcPK0amLumT1iKW88mbZe1vi2ZlTp9XNBm4GLYxB43BBUgQurhURHA29uc++nWr7
	sNnzeywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlTW-003VFC-Vk; Fri, 10 Dec 2021 19:22:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvl4O-003Kal-7M; Fri, 10 Dec 2021 18:56:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id m27so19650414lfj.12;
 Fri, 10 Dec 2021 10:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLTFQmX2Kf2e3cZmLG4jxsS1bq2aSoDXpxl5QnKq9FU=;
 b=lRJVrFA11Fu94g9aC4quIzKTIJBQHb56jvC3UHQRYxQnYMhhiqHXe+HNIaU6izZboH
 h0BDFCIwI4bVAz64DQVVsH0MSKsIo5r3rhYcpSgEs+F8SRLOvGUk6MezYqtprOuHSHY+
 xZjhnDgdSP0x9ihrSMtshGYvbNVvxVMeCabfWJNzXp5+bcL+U+5yCBZgtjUoQy5c5Srk
 XvThuXHF65j6/Qpyivd03hsOvMnXYmDchKWNvnb9km4xj+cql2CnI3JZSdhbiWgBDsX+
 pJV/q1mj1vSBgnFw5Nf3SQ1PcuWrLHkWB0ABMsx7hJcTqhLbY3gqIMN0WZdDvJ/sUnhK
 zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLTFQmX2Kf2e3cZmLG4jxsS1bq2aSoDXpxl5QnKq9FU=;
 b=Lnz1r/hQjOEdm8MvRvqReFedjAg27+OSMxYwQtoeljV0fsdFY9cqPNRDx4XamDp4oa
 CdFTbawCFF5vT3OV5dShclgkbBkdBRDrUd9lpAKiGYcXlTNF+nO4Fk98JU7+BfQrETiW
 BxcILAB2ViSyqOad4cTMdrnRinZ04BtQ++6KcHgRuz55WrOQu3O61nEK5uRMPHv8SEGY
 2Ie7w7YXaJ2A4pkz9TyfhgjqEjIU7pK264EVikS6j6t3ExsQG6z7st2mUgOpRF2qH339
 0oms21axd/EPvkqviiOMQ7ym4VQxUqmI24EgDjZVN49RQB67tvcAxWakam695Hidjp/m
 2Mlg==
X-Gm-Message-State: AOAM5309rK4Fa+ijzo0xt82BNzv4QAlWgxbWsCDkW2d7Ap6NDe+xeoXU
 8Cx7DAKGGdkNLke+/ckaZR0=
X-Google-Smtp-Source: ABdhPJx4BKlEbZ+Eghk+XJYmXdOJaHtYRLuIKsc/RB19AF8hnZocVzO0VkIjSpmfvEqny0BWm7yDgw==
X-Received: by 2002:ac2:5101:: with SMTP id q1mr8849810lfb.319.1639162594092; 
 Fri, 10 Dec 2021 10:56:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id b10sm416126lfj.230.2021.12.10.10.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:56:33 -0800 (PST)
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
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
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
 <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
 <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bafcaa92-5bd1-874c-c5ff-a72ebc98945d@gmail.com>
Date: Fri, 10 Dec 2021 21:56:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_105636_325161_1DF7776A 
X-CRM114-Status: GOOD (  18.22  )
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

MTAuMTIuMjAyMSAyMTozNSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IERlYyAxMCwgMjAyMSBhdCA3OjE2IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IDEwLjEyLjIwMjEgMjE6MDksIFJhZmFlbCBKLiBXeXNvY2tpINC/0LjR
iNC10YI6Cj4+PiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCA3OjAyIFBNIERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGVyZSBpcyBubyBuZWVkIHRv
IGFubm90YXRlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2l0aCAnZXh0ZXJuJywgaXQgbWFrZXMKPj4+
PiBjb2RlIGxlc3MgcmVhZGFibGUuIFJlbW92ZSB1bm5lY2Vzc2FyeSBhbm5vdGF0aW9ucyBmcm9t
IDxyZWJvb3QuaD4uCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Cj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIHRoYXQgdGhpcyBpcyByZWFsbHkg
dXNlZnVsLgo+Pj4KPj4+IFBlcnNvbmFsbHksIEkgdGVuZCB0byByZXNwZWN0IHRoZSBleGlzdGlu
ZyBjb252ZW50aW9ucyBsaWtlIHRoaXMuCj4+Pgo+Pj4gU3VyZWx5LCB0aGlzIGNoYW5nZSBpcyBu
b3QgcmVxdWlyZWQgZm9yIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgdG8gd29yay4KPj4KPj4gUHJv
YmxlbSB0aGF0IHN1Y2ggdGhpbmdzIHN0YXJ0IHRvIHNwcmVhZCBhbGwgb3ZlciB0aGUga2VybmVs
IHdpdGggYQo+PiBjb3B5LXBhc3RlIGFwcHJvYWNoIGlmIHRoZXJlIGlzIG5vYm9keSB0byBjbGVh
biB1cCB0aGUgY29kZS4KPj4KPj4gVGhpcyBpcyBub3QgYSBjb21tb24gY29udmVudGlvbiBhbmQg
c29tZXRpbWVzIGl0J3MgZ2V0dGluZyBjb3JyZWN0ZWQgWzFdLgo+Pgo+PiBbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9saW51cy82ZDc0MzQ5MzEKPiAKPiBJbiBzZXBhcmF0ZSBwYXRjaGVzIG91
dHNpZGUgb2Ygc2VyaWVzIGFkZGluZyBuZXcgZmVhdHVyZXMsIGlmIG9uZSBpcwo+IHNvIGluY2xp
bmVkLgo+IAoKQWxyaWdodCwgSSdsbCBkcm9wIHRoaXMgcGF0Y2ggdGhlbiBiZWNhdXNlIGl0IGNh
bid0IGJlIGRvbmUgaW4gcGFyYWxsZWwKd2l0aG91dCBjcmVhdGluZyB0aGUgbWVyZ2UgY29uZmxp
Y3QuIEknbGwgdHJ5IG5vdCB0byBmb3JnZXQgdG8gY29tZSBiYWNrCnRvIHRoaXMgbGF0ZXIgb24u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
