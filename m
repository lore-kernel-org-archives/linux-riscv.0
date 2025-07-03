Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C30C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 05:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwhE3Qz419c2xwSy4T3KRcnohEjrq66Z391ZMdOlWx8=; b=XEky9OL9cBMsZN
	Hz4VZ2SECdvo8/KRpaRCGQ6Onee8WNcgHSC/t1LotyG+xtePNhTPooJ+ljeTN/PDx7dhZxJSn2heg
	zswnPsxP1QZui8YLDCPakH4pGKxKqP2Us4juRWdH516cPwLaHR0+2CAdWu/90zChHtk93qhcWD3RT
	QRVrMuzwa8xFPdSmT6UFANmykp4zExkNYyiGEFvEZJroxyH2aOX2FxfsmfETP1x/l/7Zh7cXVs1KH
	IzDNP7lxR9YtX8/IOg3kCEHFup9MMip7wuIGYFMLWQoPQ4B7fYIysvN6Wa+uuNBK/Frxk51Rlc3mO
	g8P7lDolM1qjq5rR7AKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXCJU-0000000AG23-1NDA;
	Thu, 03 Jul 2025 05:16:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXCJS-0000000AG1h-06ZF
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 05:16:47 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32b553e33e6so45061431fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751519804; x=1752124604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQGz01tJhAAGwav0P9s2fsB1+wOe9xwJQtDO+Z/F508=;
        b=AYs+FBhLWeN7XXegmW7tl8En6YNpalXGF4Eayk1r79go+lblD1mSVQ5U3Ldz6iPoLf
         cioSzmJP3Tg06cL9nC9F5LeRlrXSr4U5hfTqJ0l9FOC7hXwpzNyEgytmCBYs41Gav0kR
         LMadAbKGWSy07KGN4wFscExgG9jh3ac6UKb2YRhNk/P6+ZSzF5qxEcOR1enpGp/PdGDw
         ZHkD2tyIihiTqAVUEZneArd0G6ebVR1Ve5D0zwW4L33vb4T2zUjP1L96ali9PxBjxHUq
         mmm+URZDbOtpSRxDND7Vfh9H/dNudFgh3e/uP5aeJTfUTAYDFL8sCMndIxlgZ/64tjCT
         zpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751519804; x=1752124604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQGz01tJhAAGwav0P9s2fsB1+wOe9xwJQtDO+Z/F508=;
        b=T5W6S2rw9qt70J7TEvM/bXR5mpQm/fYcKeqd+K/JyN/TLtsQBjI5kW6cIJzuC6QnhU
         FdMx9eI+qplb0XLmhpyXXdLEq0sbbwzGlViVNzZafDZUvHIpntGq+SKwjku4afrC/c+s
         y9mVOl2K0B2hQMc95Y5QpTUca14Pw0D56rK0GyIxymR4wYJwPtmlsmnkg/qpw72r6BIe
         OoxLKXrSlrH6pPnkmtoGzE4Cmc68dfDFEgLRj3Lu2YUyuGxi7al2TbnBbuhKkVRXgpR/
         dwkMYezE/1BN9YXdKOSH3DG35bUpcJk+DAjXWw+z/fU0bZP27bp0hy6XdYfMjBLQ9odd
         Fttg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXKcYBsdkFzmjUehaIo0MgdC5Kq6yDSfHoZz/rFBPqve9RpYsTqEZUSeN4lGS1D9vAlBaPu8C1Zk68g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoD7aSJvXaccULZD1UAw/HJgiUmAlXXbm9zUGCiVpzLAbBNyfj
	DA5zB4Axs1m74AgFbYzAdSncjXxyB0eClttw+HLPHFubsoWIGsbYKXxgz8EiWkSLhNJNFXUHlAu
	9ukBfgzxKYshnYmJzmj3cGRK3hiJFCxrjRU9L7MOCTg==
X-Gm-Gg: ASbGncuj5PR7LCHp2ra9FnXK+DITKHmst50uPe8GE5lHedAabwouuIyGOUU4xyb9Tpy
	m2TcyWc81fqRHg9ZfUWEGcB7f2SXZoQPl/+3oqkQXxqdZoM0bLARDnZTvq06KzgSM9OoA48giXy
	3Cq+Q54150DdQVt+FdnSj/GPPHYdBgfxNAkKD24fKkTw==
X-Google-Smtp-Source: AGHT+IHYSiHUidLGv4dXFytFZP2Nt0HvbdpSFDn7lYujOZRVAvsZkPmjzani3yVgvf24c1Q3Pz34/X6Np9T1yBQoZbA=
X-Received: by 2002:a05:651c:1116:20b0:32b:4749:f929 with SMTP id
 38308e7fff4ca-32e00084c44mr11819561fa.30.1751519804242; Wed, 02 Jul 2025
 22:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-4-apatel@ventanamicro.com> <aGUg3h_vigc6mq5a@smile.fi.intel.com>
In-Reply-To: <aGUg3h_vigc6mq5a@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 10:46:33 +0530
X-Gm-Features: Ac12FXzWllMhgTE9HbRqxwe6piDDOSlScwKPfW6gr6Tv5nNXJiWHPlUH56eQbZc
Message-ID: <CAK9=C2VxhC6soxHtmacedbeCU=rFi84Br1RvN2uPcBKoLhRaJw@mail.gmail.com>
Subject: Re: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy extension
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_221646_067308_C54E50EB 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@rivosinc.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA1OjM34oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIw
MjUgYXQgMTA6NDM6MjRBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEFkZCBkZWZpbmVz
IGZvciB0aGUgbmV3IFNCSSBtZXNzYWdlIHByb3h5IGV4dGVuc2lvbiB3aGljaCBpcyBwYXJ0Cj4g
PiBvZiB0aGUgU0JJIHYzLjAgc3BlY2lmaWNhdGlvbi4KPgo+IEFjdHVhbGx5IGEgZmV3IG5pdC1w
aWNrcy4KPgo+IC4uLgo+Cj4gPiArZW51bSBzYmlfZXh0X21weHlfZmlkIHsKPiA+ICsgICAgIFNC
SV9FWFRfTVBYWV9HRVRfU0hNRU1fU0laRSwKPiA+ICsgICAgIFNCSV9FWFRfTVBYWV9TRVRfU0hN
RU0sCj4gPiArICAgICBTQklfRVhUX01QWFlfR0VUX0NIQU5ORUxfSURTLAo+ID4gKyAgICAgU0JJ
X0VYVF9NUFhZX1JFQURfQVRUUlMsCj4gPiArICAgICBTQklfRVhUX01QWFlfV1JJVEVfQVRUUlMs
Cj4gPiArICAgICBTQklfRVhUX01QWFlfU0VORF9NU0dfV0lUSF9SRVNQLAo+ID4gKyAgICAgU0JJ
X0VYVF9NUFhZX1NFTkRfTVNHX1dJVEhPVVRfUkVTUCwKPiA+ICsgICAgIFNCSV9FWFRfTVBYWV9H
RVRfTk9USUZJQ0FUSU9OX0VWRU5UUwo+Cj4gQWRkIGEgdHJhaWxpbmcgY29tbWEuCgpPa2F5LCBJ
IHdpbGwgdXBkYXRlLgoKPgo+ID4gK307Cj4KPiAuLi4KPgo+ID4gKy8qIFBvc3NpYmxlIHZhbHVl
cyBvZiBNU0dfUFJPVF9JRCBhdHRyaWJ1dGUgKi8KPiA+ICtlbnVtIHNiaV9tcHh5X21zZ3Byb3Rv
X2lkIHsKPiA+ICsgICAgIFNCSV9NUFhZX01TR1BST1RPX1JQTUlfSUQgPSAweDAKPgo+IEFkZCBh
IHRyYWlsaW5nIGNvbW1hLCBhbmQgeW91IG1pZ2h0IHdhbnQgdG8gZHJvcCAweC4gSSBkb24ndCBr
bm93IHdoYXQgZWxzZSBjYW4KPiBiZSBoZXJlLCBlc3AuIGluIHRoZSBmdXR1cmUsIGJ1dCBzb21l
IGtpbmQgb2YgdGhlIGRlc2NyaXB0aW9uIG9mIHRoaXMgaW4gVFJNCj4gY2FuIHNoZWQgYSBsaWdo
dCBvbiB3aGF0IGlzIGJldHRlciBwYXR0ZXJuIHRvIHVzZS4KClN1cmUsIEkgd2lsbCB1cGRhdGUu
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
