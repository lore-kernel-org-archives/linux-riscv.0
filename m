Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F324CC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 05:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhbhTei1kjyQk0+7RNZd5J0BLlKQHJyRWzqZg6snkP0=; b=FrIqfsopYJ1xrp
	MMi9iOizfq6LclZN2A16jQcal1kr0YNSYwHu2ruiiqF+RYKZLzgUe+Dn9NKeHk9Tg8dFub/mESqBf
	k12/9h/yTxxQTEswdtY/AmuzB9Z5QvWHR6gAKUouIwDAG1DoQ1UhurqEZMSSkglSBNVHNZpzz1G66
	IQ6XAsxrp5y+T1r1Q2zJEc+kDHgc2MwcEMILMMuL6MC0l5kK1gLczPOQ0pLvUM8H/E9ftZx/C428W
	AhLHgS9Qb25tEXrmwj+Yz6b84Ap+7eSDkajNuq/BTXcRKB38Ia5oGroMD3GObYtPotMDWkHUaLSPE
	tsNWu8GEk/q5LJaE+swA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOr6M-00000005nBo-0sl9;
	Tue, 10 Jun 2025 05:00:46 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOr6J-00000005nBQ-29qx
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 05:00:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5534edc6493so5422101e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749531642; x=1750136442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG+QZlPSjwTQk4wkX+p/421OYI0NEzGDtfD+xtVDmlU=;
        b=GffDJL5gjelEF9z9FZuzU3Q9ew3lYYqkAYrEWg+apvpHjb9YMdUaQxsigU+BvgAgQ4
         TUmJcedj0wpuOvx6MH+avAxGJByWGleks0xG+yHY5VUaglZCAiDC3qAUY+EQci2kwrkP
         rZpoBkwd99oS3KCZ3UwumfAv5BcC3SNVhklyiAiZuhFzSNDSnZKRVFjwrGUOjKfjpVsd
         DM/f1SZ65S2kof5rQ5dKdR4jK2/87QJV97xbtVHmZYQUafg6Fm+oZH3VF93+uRNJy4M9
         Ei+/KwoTDy6NnqyZaskV0nLkElyAmiqGnSGB0UFUDlb2wyU6LUW+1SivV9l5GVt0B6vx
         FSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531642; x=1750136442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG+QZlPSjwTQk4wkX+p/421OYI0NEzGDtfD+xtVDmlU=;
        b=pjbDVfRiiKnpBcEcIkJ8iqzfWRVfNlvXw0bWjRdIewgpRYWyDYCAoGDEQQP2MutJ0P
         3wgy6RPk9GjZo5RbrJVcrBLVsJlGBcmfs+5oEsbKu+gSG49wMhxbkCecofNDOS1X29I7
         rrMAaPPm60gvHuyEvuukLPVA8/n3+v4lqgLUWtsDRX+CB0fSTVk/hKZAH/c+DJ6osvFl
         bqzKPeyvQP4+vaeOhZMEnFDAVQp6yfzWHiJ+G5SBi+XbNcU67EjaFbCA7RxoyERqDIbK
         QsDddWc90aiY3e51vGNt2zVAF6qMXdlhg7ylsGTv908kuHQ9yQlai9GqdY0CF1Do+I3f
         lv2w==
X-Forwarded-Encrypted: i=1; AJvYcCXA8/eMejfTRk2Y+Ch4LNcpNQfx4P2D2MofbgqzgxMftp5mSsy/ttTENEnAcsmt/IbAsD3lbBjiYuz6PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsXfIbwGUu0gqIJIMHoPBuvge8tKCj30ruAtlOVSXfXQhi94im
	hmcEWkQtJU7ebrZrYIfDAbahoRCIidSn0K8q2oGxCgEG22N7ejTX6vI9bvNdOHK1hDTmXPNSeo0
	paBS0xdmiDWLuCheIc0/zv2PzNMBpUbB5zqnSmSThEw==
X-Gm-Gg: ASbGnctgj8VfALoHXijhUgXzVfJaVEdWdohkvfzEPKt3IiJP3j0dm70H1oS+GjN3yVF
	oggZWHYAndY4H6Dmk3AYUCLWF5CaPIEYx8GrWOoNHW2emEr1xf+XZXvfNnYrqbM5YH92xKuLe9e
	CKHyYGdQxNIh+LoL8udlFsnRlNEwxurQZy6cSpcQNUPhO2
X-Google-Smtp-Source: AGHT+IFc4bbR66Mv3WuueixJqBxHJULaviJZZe7HO26p9olq62flNuPFgpr2ULooMQPQ7QoisA5p/os4fCv6d0mjLC8=
X-Received: by 2002:a05:6512:1193:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-55366e338e8mr4285433e87.52.1749531641605; Mon, 09 Jun 2025
 22:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-9-apatel@ventanamicro.com> <20250530-stark-maximum-2306978237db@spud>
In-Reply-To: <20250530-stark-maximum-2306978237db@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:30:29 +0530
X-Gm-Features: AX0GCFsG-CIRwlRAtjpdQwDbh-LfI7tbNGcMGwY5mVPx4e4ZARAwAgOKgyJVzwQ
Message-ID: <CAK9=C2Vs+q2t+iB7zdrXdieCcT7yYvQM4Z0vdVW3iGKG01UF9A@mail.gmail.com>
Subject: Re: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_220043_558030_3C4C3706 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgOTo1OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAyNSwgMjAyNSBhdCAwMjoxNjo1NVBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gKyAgcmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZDoK
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
PiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoZSBTQkkgTVBYWSBjaGFubmVsIGlkIHRv
IGJlIHVzZWQgZm9yIHByb3ZpZGluZyBSUE1JIGFjY2VzcyB0bwo+ID4gKyAgICAgIHRoZSBzdXBl
cnZpc29yIHNvZnR3YXJlLgo+Cj4gU29ycnkgZm9yIHRoZSBkZWxheSBpbiByZXZpZXdpbmcgdGhp
cyBzZXJpZXMsIHdhbnRlZCB0byB0YWxrIHRvIHNvbWUKPiBmb2xrcyBhdCB3b3JrIGJlZm9yZSBk
b2luZyBzby4gT3ZlcmFsbCB0aGVzZSBiaW5kaW5ncyBhbGwgbG9vayBwcmV0dHkKPiBnb29kIHRv
IG1lLiBJIGRvbid0IHRoaW5rIHRoZSBkZXNjcmlwdGlvbiBvbiB0aGlzIHByb3BlcnR5IGhlcmUg
aXMKPiBwYXJ0aWN1bGFybHkgZ3JlYXQsIEkgZGlkbid0IGZvbGxvdyB3aGF0IGl0IHdhcyBtZWFu
dCB0byBiZSB1c2VkIGZvcgo+IGltbWVkaWF0ZWx5LiBCdXQgSSBkb24ndCBoYXZlIGFueXRoaW5n
IG1lYW5pbmdmdWxseSBiZXR0ZXIgdG8KPiBzdWdnZXN0IG5vciBkbyBJIHRoaW5rIHRoYXQgYW55
b25lIGFjdHVhbGx5IHdyaXRpbmcgdGhlIGR0cyBmb3IgYQo+IHBsYXRmb3JtIHVzaW5nIHRoaXMg
YmluZGluZyB3aWxsIHN0cnVnZ2xlIHRvIHVuZGVyc3RhbmQgaXQuCgpPa2F5LCBJIHdpbGwga2Vl
cCB0aGlzIGFzLWlzIHVudGlsIHdlIGhhdmUgYSBiZXR0ZXIgc3VnZ2VzdGlvbi4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
