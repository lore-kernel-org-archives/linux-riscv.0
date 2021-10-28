Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED439C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:58:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9275A60E8B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9275A60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hl/yK5vnTDX4oE8Hu4NVSlBy/7+/HDsWt+RzIXQfFKk=; b=hitC8w6VgbVhZhGmxuPU04Zfw7
	LP9vHwf1IpnigAPOzyTHC7j56XgaYmPUl7FJC+g9+NwTJWyHvnk5rS7o2UOSZLHL9vj2shXTE8UBC
	rswWahp1K7by6rofUgandqznOHBIJaQlROb9Bb/dY7I4CqR3Ia1t9fnPQb8Lo172SD0T/sW69zXhi
	NtwJlCSjDuL0qGnrDtkCQ3IwIx7N0daSxKmuvNa+BLlTdsmSOSkwY8wnVeSLej7lOy8MzEUBSMz1l
	v1f9af7u+8E8ca/+WNpxDhHXC3EK5Hb5r+fjlQ8BTZP7w0rl5fOnmT07E6oKwkiQNXZ0MruD0y1WJ
	Nf3oPdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDQ1-009CV1-HD; Thu, 28 Oct 2021 21:58:41 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgDPy-009CTx-Nx; Thu, 28 Oct 2021 21:58:40 +0000
Received: by mail-lj1-x234.google.com with SMTP id k13so13097610ljj.12;
 Thu, 28 Oct 2021 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
 b=fN/sghTD1TZsVWGg7UdNVpmnpsJmxwTIReywOn3iS879FfwyrwTro/6JMf4MaGrEqh
 0NHbUx8tMPVCykH7rLffN6x80gPATjYeRH0X7Rke1JX3QXf40ikAhOl25K5S1BWImyNK
 Ws74ZKNhvY45yMsuq3FCKQn2UeHbmrvMca8cD6CCJ0R2lYcZYJkrBjgifHSN/5oWm7n1
 lFtQ6NQQUb7L/5VMhM9mJogVid13IyjOv29tIrHnCgMGRUpYmk/I5bl/5lJ21eD61OSt
 uVSSMkzEczkDy+3W/RlWkglTIAMMvdWcaEVw6izXBz+EOktxUqL8EL8FpyIQN0i0+0ax
 cKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
 b=FBTpLXLhs609v27P6Zw+K3+CYqDbcjaLqyuCnoj9MGUTDvL+Hiu/WMIsaCwiE3+AbF
 ohoEyoxF9mZI5P+FfQIEI0SeoKF4r1TmqQ1m1tG8qXTRSbIgcDdvFVveiioUor9KAgWa
 MApEksnWPBAg9i+nQ1i/525H+75JZCKORTTIGJERCPbWnTfIT/+Whvhs3mFkthtDHOoc
 wYSZ/UQ/AXxv0mrovlbPUog38xWIYfufv0ge02z85Ofp0BwFqoZd4FLeE65Dmfr6/OBJ
 PYIMsOJJnG2wDm9oWRO6/5plKcidLEUSpiYL7TZpCxAw271FQEsJFacJG8/lPmz2EhE6
 4Lfw==
X-Gm-Message-State: AOAM532z3Hli4fAnGdHrnjoRgijblltDXQn+7w/zPznFk9uLMjWJ6jAd
 oizzBPqNVTFb3GrUA/VWYs4=
X-Google-Smtp-Source: ABdhPJwU+yd9K4RKqPYJGKdWrmOtthi6PCwOlEc1MXGCnrTPBunu0coGknm3bBb5A7s1sx8AG2GBkw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr7402126ljp.157.1635458314886; 
 Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id t17sm248350ljc.136.2021.10.28.14.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 openbmc@lists.ozlabs.org, linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28560da7-8ab6-3bd5-b4d6-e34b21a9bbb0@gmail.com>
Date: Fri, 29 Oct 2021 00:58:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_145838_793498_F57C3A88 
X-CRM114-Status: GOOD (  18.64  )
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

MjguMTAuMjAyMSAxMjo1OSwgUmFmYWVsIEouIFd5c29ja2kg0L/QuNGI0LXRgjoKPj4gKyNkZWZp
bmUgUkVTVEFSVF9QUklPX1JFU0VSVkVEICAgICAgICAgIDAKPj4gKyNkZWZpbmUgUkVTVEFSVF9Q
UklPX0RFRkFVTFQgICAgICAgICAgIDEyOAo+PiArI2RlZmluZSBSRVNUQVJUX1BSSU9fSElHSCAg
ICAgICAgICAgICAgMTkyCj4+Cj4+ICBlbnVtIHJlYm9vdF9tb2RlIHsKPj4gICAgICAgICBSRUJP
T1RfVU5ERUZJTkVEID0gLTEsCj4+IEBAIC00OSw2ICs1NSwxNjcgQEAgaW50IHJlZ2lzdGVyX3Jl
c3RhcnRfaGFuZGxlcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKik7Cj4+ICBpbnQgdW5yZWdpc3Rl
cl9yZXN0YXJ0X2hhbmRsZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICopOwo+PiAgdm9pZCBkb19r
ZXJuZWxfcmVzdGFydChjaGFyICpjbWQpOwo+Pgo+PiArLyoKPj4gKyAqIFVuaWZpZWQgcG93ZXJv
ZmYgKyByZXN0YXJ0IEFQSS4KPj4gKyAqLwo+PiArCj4+ICsjZGVmaW5lIFBPV0VST0ZGX1BSSU9f
UkVTRVJWRUQgICAgICAgICAwCj4+ICsjZGVmaW5lIFBPV0VST0ZGX1BSSU9fUExBVEZPUk0gICAg
ICAgICAxCj4+ICsjZGVmaW5lIFBPV0VST0ZGX1BSSU9fREVGQVVMVCAgICAgICAgICAxMjgKPj4g
KyNkZWZpbmUgUE9XRVJPRkZfUFJJT19ISUdIICAgICAgICAgICAgIDE5Mgo+PiArI2RlZmluZSBQ
T1dFUk9GRl9QUklPX0ZJUk1XQVJFICAgICAgICAgMjI0Cj4gQWxzbyBJJ20gd29uZGVyaW5nIHdo
eSB0aGVzZSBwYXJ0aWN1bGFyIG51bWJlcnMgd2VyZSBjaG9zZW4sIGhlcmUgYW5kIGFib3ZlPwoK
VGhlc2UgdmFsdWVzIGFyZSBjaG9zZW4gYmFzZWQgb24gcHJpb3JpdGllcyB0aGF0IGRyaXZlcnMg
YWxyZWFkeSB1c2UuIEkgbG9va2VkIHRob3JvdWdoIHRoZW0gYWxsIGFuZCBlbmRlZCB3aXRoIHRo
aXMgc2NoZW1lIHRoYXQgZnVsZmlsbHMgdGhlIG5lZWRzIG9mIHRoZSBjdXJyZW50IEFQSSB1c2Vy
cy4KCkknbGwgYWRkIHRoZXNlIGNvbW1lbnRzIGluIHYzOgoKLyoKICogU3RhbmRhcmQgcmVzdGFy
dCBwcmlvcml0eSBsZXZlbHMuIEludGVuZGVkIHRvIGJlIHNldCBpbiB0aGUKICogc3lzX29mZl9o
YW5kbGVyLnJlc3RhcnRfcHJpb3JpdHkgZmllbGQuCiAqCiAqIFVzZSBgUkVTVEFSVF9QUklPX1hY
WCArLSBwcmlvYCBzdHlsZSBmb3IgYWRkaXRpb25hbCBsZXZlbHMuCiAqCiAqIFJFU1RBUlRfUFJJ
T19SRVNFUlZFRDoJRmFsbHMgYmFjayB0byBSRVNUQVJUX1BSSU9fREVGQVVMVC4KICoJCQkJRHJp
dmVycyBtYXkgbGVhdmUgcHJpb3JpdHkgaW5pdGlhbGl6ZWQKICoJCQkJdG8gemVybywgdG8gYXV0
by1zZXQgaXQgdG8gdGhlIGRlZmF1bHQgbGV2ZWwuCiAqCiAqIFJFU1RBUlRfUFJJT19ERUZBVUxU
OglVc2UgdGhpcyBmb3IgZ2VuZXJpYyBoYW5kbGVyLgogKgogKiBSRVNUQVJUX1BSSU9fSElHSDoJ
CVVzZSB0aGlzIGlmIHlvdSBoYXZlIG11bHRpcGxlIGhhbmRsZXJzIGFuZAogKgkJCQl0aGlzIGhh
bmRsZXIgaGFzIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZQogKgkJCQlkZWZhdWx0IGhhbmRsZXIu
CiAqLwoKLyoKICogU3RhbmRhcmQgcG93ZXItb2ZmIHByaW9yaXR5IGxldmVscy4gSW50ZW5kZWQg
dG8gYmUgc2V0IGluIHRoZQogKiBzeXNfb2ZmX2hhbmRsZXIucG93ZXJfb2ZmX3ByaW9yaXR5IGZp
ZWxkLgogKgogKiBVc2UgYFBPV0VST0ZGX1BSSU9fWFhYICstIHByaW9gIHN0eWxlIGZvciBhZGRp
dGlvbmFsIGxldmVscy4KICoKICogUE9XRVJPRkZfUFJJT19SRVNFUlZFRDoJRmFsbHMgYmFjayB0
byBQT1dFUk9GRl9QUklPX0RFRkFVTFQuCiAqCQkJCURyaXZlcnMgbWF5IGxlYXZlIHByaW9yaXR5
IGluaXRpYWxpemVkCiAqCQkJCXRvIHplcm8sIHRvIGF1dG8tc2V0IGl0IHRvIHRoZSBkZWZhdWx0
IGxldmVsLgogKgogKiBQT1dFUk9GRl9QUklPX1BMQVRGT1JNOglJbnRlbmRlZCB0byBiZSB1c2Vk
IGJ5IHBsYXRmb3JtLWxldmVsIGhhbmRsZXIuCiAqCQkJCUhhcyBsb3dlc3QgcHJpb3JpdHkgc2lu
Y2UgZGV2aWNlIGRyaXZlcnMgYXJlCiAqCQkJCWV4cGVjdGVkIHRvIHRha2Ugb3ZlciBwbGF0Zm9y
bSBoYW5kbGVyIHdoaWNoCiAqCQkJCWRvZXNuJ3QgYWxsb3cgZnVydGhlciBjYWxsYmFjayBjaGFp
bmluZy4KICoKICogUE9XRVJPRkZfUFJJT19ERUZBVUxUOglVc2UgdGhpcyBmb3IgZ2VuZXJpYyBo
YW5kbGVyLgogKgogKiBQT1dFUk9GRl9QUklPX0hJR0g6CQlVc2UgdGhpcyBpZiB5b3UgaGF2ZSBt
dWx0aXBsZSBoYW5kbGVycyBhbmQKICoJCQkJdGhpcyBoYW5kbGVyIGhhcyBoaWdoZXIgcHJpb3Jp
dHkgdGhhbiB0aGUKICoJCQkJZGVmYXVsdCBoYW5kbGVyLgogKgogKiBQT1dFUk9GRl9QUklPX0ZJ
Uk1XQVJFOglVc2UgdGhpcyBpZiBoYW5kbGVyIHVzZXMgZmlybXdhcmUgY2FsbC4KICoJCQkJSGFz
IGhpZ2hlc3QgcHJpb3JpdHkgc2luY2UgZmlybXdhcmUgaXMgZXhwZWN0ZWQKICoJCQkJdG8ga25v
dyBiZXN0IGhvdyB0byBwb3dlci1vZmYgaGFyZHdhcmUgcHJvcGVybHkuCiAqLwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
