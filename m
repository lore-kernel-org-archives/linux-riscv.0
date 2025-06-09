Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C0C61DB2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1QoQs72PVCB2VVxvCZqU7WDXpslKVkKzQYLp8rC3ns=; b=yi3jSvmCL8puGa
	DKKCRb7TOv/NumOxzla70O0uFoc5V8NELpvheMigoMWIUK5o2mimkFMeF8MZ+v/LQ3U30hMCNz8N8
	K4toGQmRZ5XYEFCBkHY++xFN2yqpI/dgUgZ3M/tQv5bkwCTPmIFT3OYYt4WPfLBxHL9A6cU0I7G+0
	9lC5AI8qHynaJ55cZq9qJJJCdEqZ4ku+fHPnsok0yUiamVs2GWphllIB+nOp74mocdFYlCEf/Iw0H
	Fz4GRDfm1sGAGP7zqQkoX1TANDcmZnZP3gyLHPAnTW3m7H0zJ1DGnaKQacddjsV9Z+QkD5Pe2Z4cB
	ZfI6WtO/Mfh6M9Nw4Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYBD-00000003hL0-35D0;
	Mon, 09 Jun 2025 08:48:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYBA-00000003hKf-3jJx
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 08:48:30 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55365c63fa5so3334704e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749458907; x=1750063707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+qulMhJZHk6X+tREHSphVBY4DmeNmnxx1NU3h6SyVE=;
        b=guzK41cvTD16/gxCLjhttIgIZALzSq2+Qou0qxuWBA79PjBYRg4i8GbPxS+fwZUbxh
         jqUrX2HkmUFdLeme8fezra4eH1AHD1r5qkMp0cT/j08u64HwWrzLoyUShAlasKu5g/FA
         Os+Aw1oTy8O8jg+KyPQrdmvj/z9aCCKU+rGfob2FqIjFTEW7gY5ymiXxHpQxukyPpmfC
         vKG8BRKOt7fVxunJHYriHfltsyMdn44T2Q4zYfmqb+M7P3CFcefrVFkeXL0C1tbvVjEk
         NWkHhnOKxhepIdJ8UN4s/Zrx1ycKUPzUujINLS+gr/wFD5qqO+WvB4Qwnqze+QShjLPj
         CiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749458907; x=1750063707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+qulMhJZHk6X+tREHSphVBY4DmeNmnxx1NU3h6SyVE=;
        b=iRu6bQfwM5/EzVDA8CAJ52GPAkSrJavSG4FEo7bwuuEKzQGRSVCCEiixOvDym2wcat
         rUp+s57wMM/TDulnOfLXDOJDv7Wgpsg0ZtASn617ISN2bow8B9jtMw9HoWF0xACG9fcT
         xXMNuNGq34Ftz8hSnnMNDmn0kCdspldb9l9JAbqLQyaq2bJn8CWFvWubDnJVRq1aY9fq
         76mJFElFZYcc3AEJnBnXVtfqSBK14mXCvHWqO/CNXSlXka2ny07fOeIxhHDT6F6lF3nF
         Qtx7oGUXFNOEVVDLTK1ZuavOiBi+f83MQe+vnmeGtwoNrlJ10Z/9vcoc7u5T2nLpDERH
         JVHA==
X-Forwarded-Encrypted: i=1; AJvYcCUkISMQev+mhhsvs7XeV+jO+fbItQZFpgmwq2KUieLaLl/tfSyg5tom364jBBrhq1TqUtzCQKgOJpvh3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCGqzfhyQnqaLRxu3subFhJp4VfQxFRT8mvkcK1rERZhOFJSD
	MjBYGQWz6deZas/UwsFE39iz/qvO7qtHlWLBii5FnOwCYEFqcJosTP4ykd3UovTpIlAxoeochIS
	AXgLGHmxe2GnnPzbKHy5iuwdTkvIZF/TC+TY2ZC4cxQ==
X-Gm-Gg: ASbGnctujuiX1ELKBIxaNASVoiHchMKLGCAUrEY+7VqM6rz9QZEYmO9EL2Y8Q5W329L
	jndDaDJF34OXK5BrnZuAYqrY1lrel0C3katHSgRmW8jS8P8v9nWGstfq/WcxtW+5OYYz6PwzwUd
	EWdhc56PjdWw20DShFxa/4Iqc08j/iyDWajA==
X-Google-Smtp-Source: AGHT+IGD0pH7TFlMkgX9gTB2arw453UvhjyRmw09ACjbNfgzKN77QnxzN12Gz5PpF/wVzlrHBwVIxkmX2zq51K32rMQ=
X-Received: by 2002:a05:6512:398b:b0:553:263d:ab90 with SMTP id
 2adb3069b0e04-55366be26b0mr2962896e87.18.1749458906940; Mon, 09 Jun 2025
 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-6-apatel@ventanamicro.com> <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
In-Reply-To: <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 14:18:15 +0530
X-Gm-Features: AX0GCFv7nT4kE5svL_VD2AT2FTxU3u5CwWlzFhZ6AhttmorGU6f8kX-CYBTFYjM
Message-ID: <CAK9=C2Wc75EmvTnGF0m59eQjhXK0=htHCafpi5oPNE0_5TS-7A@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] mailbox: Add common header for RPMI messages
 sent via mailbox
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_014828_930234_E0CC5F51 
X-CRM114-Status: GOOD (  18.01  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNDo0NuKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDI1LCAy
MDI1IGF0IDAyOjE2OjUyUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgUlBNSSBi
YXNlZCBtYWlsYm94IGNvbnRyb2xsZXIgZHJpdmVycyBhbmQgbWFpbGJveCBjbGllbnRzIG5lZWQg
dG8KPiA+IHNoYXJlIGRlZmluZXMgcmVsYXRlZCB0byBSUE1JIG1lc3NhZ2VzIG92ZXIgbWFpbGJv
eCBpbnRlcmZhY2Ugc28gYWRkCj4gPiBhIGNvbW1vbiBoZWFkZXIgZm9yIHRoaXMgcHVycG9zZS4K
Pgo+IC4uLgo+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21haWxib3hfY2xpZW50Lmg+Cj4KPiBUaGlz
IGlzIG5vdCBldmVuIGNsb3NlciB0byB0aGUgbGlzdCBvZiB0aGUgaGVhZGVycyB0aGUgaGVhZGVy
IGlzIHVzaW5nLgo+IEUuZy4sIHR5cGVzLmggaXMgbWlzc2luZy4KCk9rYXksIEkgd2lsbCBhZGQg
dHlwZXMuaAoKPgo+ID4gKy8qIFJQTUkgdmVyc2lvbiBlbmNvZGUvZGVjb2RlIG1hY3JvcyAqLwo+
ID4gKyNkZWZpbmUgUlBNSV9WRVJfTUFKT1IoX192ZXIpICAgICAgICAgICAgICAgICgoKF9fdmVy
KSA+PiAxNikgJiAweGZmZmYpCj4gPiArI2RlZmluZSBSUE1JX1ZFUl9NSU5PUihfX3ZlcikgICAg
ICAgICAgICAgICAgKChfX3ZlcikgJiAweGZmZmYpCj4KPiBTYW1lIGNvbW1lbnQgYXMgcGVyIHBy
ZXZpb3VzIHBhdGNoLgoKT2theSwgSSB3aWxsIHVzZSBtYWNyb3MgZnJvbSBsaW51eC93b3JkcGFy
dC5oCgo+Cj4gLi4uCj4KPiA+ICsgICAgIFJQTUlfRVJSX05PX0RBVEEgICAgICAgICAgICAgICAg
PSAtMTQsCj4gPiArICAgICBSUE1JX0VSUl9SRVNFUlZFRF9TVEFSVCAgICAgICAgID0gLTE1LAo+
ID4gKyAgICAgUlBNSV9FUlJfUkVTRVJWRURfRU5EICAgICAgICAgICA9IC0xMjcsCj4gPiArICAg
ICBSUE1JX0VSUl9WRU5ET1JfU1RBUlQgICAgICAgICAgID0gLTEyOAo+Cj4gTGVhdmUgdGhlIHRy
YWlsaW5nIGNvbW1hLCBhcyBpdCBkb2Vzbid0IHNvdW5kIGxpa2UgYSB0ZXJtaW5hdG9yLgoKT2th
eQoKPgo+IC4uLgo+Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRVRJTUVET1VUOwo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVDT01NOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVPUE5P
VFNVUFA7Cj4KPiArIGVycm5vLmgKCk9rYXksIEkgd2lsbCBhZGQgZXJybm8uaAoKPgo+IC4uLgo+
Cj4gPiArLyogUlBNSSBsaW51eCBtYWlsYm94IGF0dHJpYnV0ZSBJRHMgKi8KPiA+ICtlbnVtIHJw
bWlfbWJveF9hdHRyaWJ1dGVfaWQgewo+ID4gKyAgICAgUlBNSV9NQk9YX0FUVFJfU1BFQ19WRVJT
SU9OID0gMCwKPgo+IFdoeSBkbyB5b3UgbmVlZCBhbiBleHBsaWNpdCBpbml0aWFsaXNlcj8gSWYg
aXQncyBhIEhXIHJlcXVpcmVtZW50LCBhbGwgb2YgdGhlbQo+IHNob3VsZCBiZSBleHBsaWNpdGx5
IGRlZmluZWQuIFRoaXMgbWFrZXMgY29kZSByb2J1c3QgYWdhaW5zdCBwb3RlbnRpYWwgY2hhbmdl
cy4KCkV4cGxpY2l0IGluaXRpYWxpemVycyBhcmUgbm90IG5lZWRlZC4gSSB3aWxsIGRyb3AgaW4g
dGhlIG5leHQgcmV2aXNpb24uCgo+Cj4gPiArICAgICBSUE1JX01CT1hfQVRUUl9NQVhfTVNHX0RB
VEFfU0laRSwKPiA+ICsgICAgIFJQTUlfTUJPWF9BVFRSX1NFUlZJQ0VHUk9VUF9JRCwKPiA+ICsg
ICAgIFJQTUlfTUJPWF9BVFRSX1NFUlZJQ0VHUk9VUF9WRVJTSU9OLAo+ID4gKyAgICAgUlBNSV9N
Qk9YX0FUVFJfTUFYX0lECj4gPiArfTsKPgo+IC4uLgo+Cj4gPiArLyogUlBNSSBsaW51eCBtYWls
Ym94IG1lc3NhZ2UgdHlwZXMgKi8KPgo+IGxpbnV4IC0tPiBMaW51eAo+IChldmVyeXdoZXJlKQoK
T2theSwgSSB3aWxsIHVwZGF0ZS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
