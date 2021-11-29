Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1766C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/ZahuaVB3G6ie/eRxxkts0co97o1RGbuOpZcX2Ktl7o=; b=wLoIqDSn5oHI0dqmgaI6OXpbOa
	gpzXGcd+sF2KCqeY287ijpFPaUZr/rCQpoUWCobCTMmP2Fm7OaGCEjwf3mHpbZTdfVedDX3cmf2LS
	M8et+RpXBc6CVXHMHU0Ly1t+lZMepP6p+pJVs+o2Dg4ottv4BnH9nixqim5MaQ/T2z/8uciKRtO32
	sZ7a8JYOhWrcrYgWtYiVi7JoxyFhX80TTsIcYdbdtwsHZjxRwnkg7atU/o/ri3dQYGExffuL9nxfB
	YlE3uByUVTQLKondN9+wc3FAhaG/DyaTLMq2JEeJK3Dn63UUN5+1cstSxPYVt5Mih1LeohG85QcKa
	gn7r9OxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfD6-000aOs-DD; Mon, 29 Nov 2021 11:52:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfD4-000aNV-8x; Mon, 29 Nov 2021 11:52:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id l22so43818435lfg.7;
 Mon, 29 Nov 2021 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iWUEeMgXKbO77AD47foBEfa7mbQmssJKLzk8yjSOYSY=;
 b=U2tIEVQPLPCeMdCu1GCSmBGmgd4b3cE0YUaVA7Ptat003bULsFRIKB0ShMWsNVLpnC
 gIiNSuaR89vPD5NvBHVAJptiz6fEnTOzANkyKGw87fayadLAwoS9823DcSjh7ICj4+z3
 8BMKd+pKMrfT65KNK+2vA4wn0Ab/36kY6JZj8X/gHMh+mTKic7nzZ9Q5pTe+scSSAMrR
 oGXpQFc+Y/9JY1X3lRTxbgKArCnrSUBW7q8iJYRRAFJ8bg8FkN1DAbSGthXoerdFc3rX
 j1XUuuRyr6MK1Wp6xTbZoTqp3eksfHnUZLI3T8PZzPTIBG4u+ANjjJp1zdOJ3alnPslD
 h0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iWUEeMgXKbO77AD47foBEfa7mbQmssJKLzk8yjSOYSY=;
 b=ZZXs3+8k0QZqeuebpHQv+MyfCI8+Ak4EGVsaTdgKitDoQ8/UFqVHWXVVhJ6DB3vy3S
 oaJIVlwClKifq0fBhhJrbxz9ChZwDaxr28fJc+af0053fxsXCRw2BDoTKDCQ+G+OgQxh
 yTU6y51xED8Lku3NcPtBhdPaWw8ptSM3ysWw9s2TXq3zvPB59RaWlvDO/yUCK4cEjEQK
 4ZTVR+zalXEy9XyocByK9WjCZg5e5n0DtIYW+z7y+j5RML5dUAGwR+VlQohF/BqjfeP/
 S/6cjWta5QT37Rem0XQHuADFSN1zZsQ/+mzGn7FYnDes4fNijglBTQbsbkmqV/iiOBE3
 OB2g==
X-Gm-Message-State: AOAM532bzuzBDhEjPbJAjw2aVhXU5B7fMPvKZLpgzh55+C20ijqiW/eF
 gWG1IUlIgg6uuenhiXNTRuc=
X-Google-Smtp-Source: ABdhPJyV4a2kK7Hf+W0BvWJCYp3tm9l5nhuE3mizXVMpliBSqh/r6CyMfNuIh0FZ0TT44eUwwVCrkw==
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr46080008lfu.425.1638186755724; 
 Mon, 29 Nov 2021 03:52:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id o15sm1323059lfd.164.2021.11.29.03.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 03:52:35 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
 <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
 <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33d1dfa7-e90e-d174-7375-836c15e7f818@gmail.com>
Date: Mon, 29 Nov 2021 14:52:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_035238_366093_859AF477 
X-CRM114-Status: GOOD (  24.27  )
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

MjkuMTEuMjAyMSAwMzozNiwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBNb24s
IE5vdiAyOSwgMjAyMSBhdCAxMjo1Mzo1MUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IDI5LjExLjIwMjEgMDA6MTcsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6Cj4+Pj4g
SSdtIGhhdmluZyB0cm91YmxlIHdpdGggcGFyc2luZyB0aGlzIGNvbW1lbnQuIENvdWxkIHlvdSBw
bGVhc2UgdHJ5IHRvCj4+Pj4gcmVwaHJhc2UgaXQ/IEkgZG9uJ3Qgc2VlIGhvdyB5b3UgY291bGQg
Y2hlY2sgd2hldGhlciBwb3dlci1vZmYgaGFuZGxlcgo+Pj4+IGlzIGF2YWlsYWJsZSBpZiB5b3Un
bGwgbWl4IGFsbCBoYW5kbGVycyB0b2dldGhlci4KPj4+IElmIG5vdGlmeV9jYWxsX2NoYWluKCkg
d291bGQgYmUgZml4ZWQgdG8gcmV0dXJuIE5PVElGWV9PSyBpZiBhbnkgY2FsbAo+Pj4gcmV0dXJu
ZWQgTk9USUZZX09LLCB0aGVuIHRoaXMgd291bGQgYmUgYSBjbGVhciB3YXkgdG8gZ2F0aGVyIHRo
ZQo+Pj4gYW5zd2VyIGlmIGFueSBvZiB0aGUgaGFuZGxlcnMgd2lsbCBhdHRlbXB0IHRoZSBmaW5h
bCBhY3Rpb24gKHJlYm9vdCBvcgo+Pj4gcG93ZXIgb2ZmKS4KPj4gQ291bGQgeW91IHBsZWFzZSBz
aG93IGEgY29kZSBzbmlwcGV0IHRoYXQgaW1wbGVtZW50cyB5b3VyIHN1Z2dlc3Rpb24/Cj4gCj4g
QSByb3VnaCBpZGVhIGlzIHRoaXM6Cj4gCj4gIHN0YXRpYyBpbnQgbm90aWZpZXJfY2FsbF9jaGFp
bihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKipubCwKPiAgCQkJICAgICAgIHVuc2lnbmVkIGxvbmcg
dmFsLCB2b2lkICp2LAo+ICAJCQkgICAgICAgaW50IG5yX3RvX2NhbGwsIGludCAqbnJfY2FsbHMp
Cj4gIHsKPiAtCWludCByZXQgPSBOT1RJRllfRE9ORTsKPiArCWludCByZXQsIHJlc3VsdCA9IE5P
VElGWV9ET05FOwo+ICAJc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgKm5leHRfbmI7Cj4gIAo+
ICAJbmIgPSByY3VfZGVyZWZlcmVuY2VfcmF3KCpubCk7Cj4gIAo+ICAJd2hpbGUgKG5iICYmIG5y
X3RvX2NhbGwpIHsKPiAuLi4KPiAgCQlyZXQgPSBuYi0+bm90aWZpZXJfY2FsbChuYiwgdmFsLCB2
KTsKPiArCj4gKwkJLyogQXNzdW1pbmcgTk9USUZZX1NUT1AtY2FycnlpbmcgcmV0dXJuIGlzIGFs
d2F5cyBncmVhdGVyIHRoYW4gbm9uLXN0b3BwaW5nIG9uZS4gKi8KPiArCQlpZiAocmVzdWx0IDwg
cmV0KQo+ICsJCQlyZXN1bHQgPSByZXQ7Cj4gLi4uIAo+ICAJfQo+IC0JcmV0dXJuIHJldDsKPiAr
CXJldHVybiByZXN1bHQ7Cj4gIH0KPiAKPiBUaGVuOgo+IAo+IGJvb2wgcHJlcGFyZV9yZWJvb3Qo
KQo+IHsKPiAJaW50IHJldCA9IHh4X25vdGlmaWVyX2NhbGxfY2hhaW4oJnNodXRkb3duX25vdGlm
aWVyLCBQUkVQQVJFX1JFQk9PVCwgLi4uKTsKPiAJcmV0dXJuIHJldCA9PSBOT1RJRllfT0s7Cj4g
fQo+IAo+IEFuZCB0aGUgcmV0dXJuIHZhbHVlIHdvdWxkIHNpZ25pZnkgd2hldGhlciB0aGUgcmVi
b290IHdpbGwgYmUgYXR0ZW1wdGVkCj4gd2hlbiBjYWxsaW5nIHRoZSBjaGFpbiBmb3IgdGhlIFJF
Qk9PVCBhY3Rpb24uIChBbmFsb2dvdXNseSBmb3IgcG93ZXJpbmcgb2ZmLikKCklmIHlvdSBzdGFy
dGVkIHRvIGV4ZWN1dGUgY2FsbCBjaGFpbiwgdGhlbiB5b3UgYmVnYW4gdGhlIHBvd2VyLW9mZiAv
CnJlc3RhcnQgc2VxdWVuY2UsIHRoaXMgaXMgYSBwb2ludCBvZiBubyByZXR1cm4uIFNvcnJ5LCBJ
IHN0aWxsIGRvbid0CnVuZGVyc3RhbmQgd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGFjaGlldmUuCgpU
aGUgYXBwcm9hY2ggb2YgaGF2aW5nIHNlcGFyYXRlIGNhbGwgY2hhaW5zIGlzIHNpbXBsZSBhbmQg
aW50dWl0aXZlLCBJCmRvbid0IHNlZSByZWFzb25zIHRvIGNoYW5nZSBpdC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
