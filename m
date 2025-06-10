Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C293CC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 04:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4jMY9dpJrW6VHrUMTqlKQ6UGyYiq5gJXL487fFe93A=; b=bXxzOo2R7fAsKw
	hoaOSVkvbPLs60bVWssMEgHR0jv2uIP8JRguobiCSbKS0TAAjYoWuRrKj7AKNWGx+jympDwwCol7X
	BVnGZMc+S30e9+Kw8jWGSPpm+El5SxUwyvyPew3BKZKBz2xMtOIGmSeGhlsKkzpVLUTZWtqHwSdC8
	xNYz4W8EFq5cbYzLmytNk72jiVnknEHL8G2TAdYTUA4hPzAeTE9DnxthcJe9UFIDSx0ktVOfdY5av
	NYOOE/hd/fx6qUhUqqTrWEgZLcfsIonI2QTP+sbEyWCGT1fQTBdGVHEX7HhmCkt+OhuzZ0xWpB2Nl
	bnYloZfnSOUHdbr1Ihuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqi7-00000005lGP-3frl;
	Tue, 10 Jun 2025 04:35:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqi4-00000005lFv-47T4
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 04:35:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5533c562608so4896353e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749530139; x=1750134939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed8RxUAjYyp2LZZaxVzqOY+SgZzJQWB9mmLBoWY3jwg=;
        b=irZKGnLBfN15yQ1uvZGgnxrafBdMHu4CwY+oTNYEE1TJ2GEFrxicmNrIHQ9lV0wxqd
         6JZGUWRpUNS5onbl8sNfieJxYLMcw+JfToOD08sYsxCUBa3fmlQitlbDmd0eQreC9/qe
         +YT0xwH7yjd/W+89C4JYt4gr6DdvuBgNT8HtP/Rc424oh/Bfk+cbIgTIUlqqB9D2vOTG
         UDcca1up57n/g37D97U12mCQLI0GPjYgYGsh8ed/Z3hGHfB5pajDpQusnBevkjzPc4tp
         mFfO0Z0vM/sGuS1REFNoPROwTmXhdq1x3V0YjkJpTCy+rXMRylLr/VmLDYCI6Asy+uca
         Oyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530139; x=1750134939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed8RxUAjYyp2LZZaxVzqOY+SgZzJQWB9mmLBoWY3jwg=;
        b=q+X0knLdn3O9GuBMkM03Su6QedsXbF0Q2tYi13tYXzUefIXgoTM/wC/K7bRVkuJLvk
         /nvKDuFQetqkcPn3vQ6Lh56GAPJNkq1l5dq2dQwbA7aYPR7zajilSMCgexIYGGTRdbyN
         mMHxzAbcKP1ioW+EF2qj25vDA5vseiqXZ6VEnxbLD+dYiJGQ3pfe7j1woSZcLLo0k9D1
         9WGgPjHIv4J6HOS7i+7fvulnRjk8VGTdkhmYDR+qFWrdn+i4VBLh9Eg8hO5paZ9oyOAn
         4nc3waCHThaTWDreraYJTzska4CV2No/U/1XxcsXpjjq3kTtL7knvbdPmZETczCeVtg9
         4QqQ==
X-Forwarded-Encrypted: i=1; AJvYcCViq76AqKTfj1ngkZPuhYF0N86PrSgBfzgakAjarMJfuL0DF2NOkqeCavz4wwljlCvpODkaWCx2YhOdbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xuNnXYxQvOGfORamtYWtpIJvV1SRzVO/fB2YAc0b0i1bANGB
	+F9FK2m+VbHQHnjSpQpYsKO+NaPYl1O1ZIF6z2nEIJH5+WZYmc0NWc9c+kMt8xJObdaTYmLmiaR
	u7bOEJMbgMo45o3xx4d0IR32smqFJ1lAj0KsO1cL5xA==
X-Gm-Gg: ASbGncsuV9RLx5QMVsPc9lu+jZ+UuIi9QEMAUjIAFBNxasebd4Yo1XX+mXaLCmSdhQT
	wP5lGcVZG0x459l+ecVcsKwRNkMUZmRBWEx6ADe0ElIFfTDAGmhHkBrJQ2/c+p/da7GS1UWJkRX
	0zycwEJNM0kGheEnHjr5Jw7WC3BY/iJeutCG4D0N/5Tff4
X-Google-Smtp-Source: AGHT+IFxFmkHQ3fGwNL4owR0g3OIQgJ/V8z3FZMMkX4FuLFUg5JQYB9HKU+r2AMKe1MFWDs5KmtPabb7AI8QwZPozUs=
X-Received: by 2002:ac2:4c4d:0:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55366bee654mr3830038e87.15.1749530139008; Mon, 09 Jun 2025
 21:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com> <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com> <aEc-SHvL187xdj-m@smile.fi.intel.com>
In-Reply-To: <aEc-SHvL187xdj-m@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:05:27 +0530
X-Gm-Features: AX0GCFs_6x-PmQkIdN0TNx_kOYhGk1jP9YjELf3l8YvJWCRscxqU6ceG469MS-c
Message-ID: <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_213541_021699_F25244F2 
X-CRM114-Status: GOOD (  31.63  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTozNOKAr0FNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDA5LCAy
MDI1IGF0IDA1OjU5OjQwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBXZWQsIE1h
eSAyOCwgMjAyNSBhdCA0OjIz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA8YW5kcml5LnNoZXZj
aGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gT24gU3VuLCBNYXkgMjUsIDIwMjUg
YXQgMDI6MTY6NTRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPgo+IC4uLgo+Cj4gPiA+ID4g
KyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gPiA+Cj4gPiA+IGFzbS8qIHVzdWFsbHkgZ29lcyBhZnRl
ciBnZW5lcmljIGxpbnV4Lyogb25lcy4gV2h5IGhlcmU/Cj4gPgo+ID4gSSBhbSBub3QgYXdhcmUg
b2YgYW55IHN1Y2ggY29udmVudGlvbiBidXQgSSB3aWxsIHVwZGF0ZSBhbnl3YXkuCj4KPiBJdCdz
IGp1c3QgYSBjb21tb24gc2Vuc2UuIFdlIGluY2x1ZGUgbW9zdCBnZW5lcmljIGZpcnN0IGFuZCBt
b3N0IGN1c3RvbSBhdAo+IGxhc3QuCj4KPiAuLi4KPgo+ID4gPiA+ICtzdGF0aWMgaW50IG1weHlf
d3JpdGVfYXR0cnModTMyIGNoYW5uZWxfaWQsIHUzMiBiYXNlX2F0dHJpZCwgdTMyIGF0dHJfY291
bnQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgKmF0dHJzX2J1ZikKPiA+
ID4gPiArewo+ID4gPiA+ICsgICAgIHN0cnVjdCBtcHh5X2xvY2FsICptcHh5ID0gdGhpc19jcHVf
cHRyKCZtcHh5X2xvY2FsKTsKPiA+ID4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0IHNyZXQ7Cj4gPiA+
ID4gKyAgICAgdTMyIGk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGlmICghbXB4eS0+c2htZW1f
YWN0aXZlKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiA+ID4gKyAg
ICAgaWYgKCFhdHRyX2NvdW50IHx8ICFhdHRyc19idWYpCj4gPiA+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgZ2V0X2NwdSgpOwo+ID4gPiA+
ICsKPiA+ID4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgYXR0cl9jb3VudDsgaSsrKQo+ID4gPiA+
ICsgICAgICAgICAgICAgKChfX2xlMzIgKiltcHh5LT5zaG1lbSlbaV0gPSBjcHVfdG9fbGUzMihh
dHRyc19idWZbaV0pOwo+ID4gPgo+ID4gPiBEb24ndCB3ZSBoYXZlIGhlbHBlcnMgZm9yIHRoaXM/
IFRoZXkgYXJlIHN1ZmZpeGVkIHdpdGggX2FycmF5Lgo+ID4gPiBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ni4xNS1yYzYvc291cmNlL2luY2x1ZGUvbGludXgvYnl0ZW9yZGVyL2dl
bmVyaWMuaCNMMTY4Cj4gPiA+IERvbid0IGZvcmdldCB0byBoYXZlIGFzbS9ieXRlb3JkZXIuaCBi
ZWluZyBpbmNsdWRlZC4KPiA+ID4KPiA+ID4gRGl0dG8gZm9yIHRoZSBzaW1pbGFyIGNhc2Uocyku
Cj4gPgo+ID4gVGhlIGNwdV90b19sZTMyX2FycmF5KCkgYW5kIGxlMzJfdG9fY3B1X2FycmF5KCkg
aGVscGVycyB1cGRhdGUgZGF0YQo+ID4gaW4tcGxhY2UgYnV0IG92ZXIgaGVyZSB3ZSBoYXZlIHNl
cGFyYXRlIHNvdXJjZSBhbmQgZGVzdGluYXRpb24uCj4KPiBGYWlyIGVub3VnaC4gUGVyaGFwcyBh
ZGQgc29tZXRoaW5nIGxpa2UgbWVtY3B5X3RvX2xlMzIoKSAvIG1lbWNweV9mcm9tX2xlMzIoKQo+
IG9yIGFsaWtlIGZvciB5b3VyIGNhc2U/CgpPa2F5LCBJIHdpbGwgYWRkIG1lbWNweV90b19sZTMy
KCkgLyBtZW1jcHlfZnJvbV9sZTMyKCkKaW4gaW5jbHVkZS9saW51eC9ieXRlb3JkZXIvZ2VuZXJp
Yy5oIGFuZCB1c2UgaXQgb3ZlciBoZXJlLgoKPgo+ID4gPiA+ICsgICAgIHNyZXQgPSBzYmlfZWNh
bGwoU0JJX0VYVF9NUFhZLCBTQklfRVhUX01QWFlfV1JJVEVfQVRUUlMsCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICBjaGFubmVsX2lkLCBiYXNlX2F0dHJpZCwgYXR0cl9jb3VudCwgMCwg
MCwgMCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHB1dF9jcHUoKTsKPiA+ID4gPiArICAgICBy
ZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8oc3JldC5lcnJvcik7Cj4gPiA+ID4gK30KPgo+
IC4uLgo+Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YobWNoYW4t
PnJwbWlfYXR0cnMpIC8gc2l6ZW9mKHUzMiksCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodTMyICopJm1jaGFuLT5ycG1pX2F0dHJzKTsKPiA+ID4KPiA+ID4gV2h5IGNhc3Rp
bmc/IFdoYXQgYWJvdXQgYWxpZ25tZW50Pwo+ID4KPiA+IFRoZSBSUE1JIGF0dHJpYnV0ZXMgKGFr
YSBzdHJ1Y3Qgc2JpX21weHlfcnBtaV9jaGFubmVsX2F0dHJzKSBhcmUKPiA+IGEgY29sbGVjdGlv
biBvZiB1MzIgYXR0cmlidXRlcyBoZW5jZSB3ZSBjYW4gYWxzbyB0cmVhdCBycG1pX2F0dHJzCj4g
PiBhcyBhIHUzMiBhcnJheS4gRnVydGhlciwgdGhlIHJwbWlfYXR0cnMgaXMgWExFTiBhbGlnbmVk
IHdpdGhpbiB0aGUKPiA+IHN0cnVjdCBtcHh5X21ib3hfY2hhbm5lbCBzbyBubyBhbGlnbm1lbnQg
aXNzdWUgd2l0aCB0aGUgY2FzdGluZwo+ID4gb24gYm90aCBSVjMyIGFuZCBSVjY0Lgo+ID4KPiA+
IElmIHdlIHdhbnQgdG8gYXZvaWQgdGhlIGNhc3RpbmcgdGhlbiB3ZSB3aWxsIGhhdmUgdG8gdXNl
IGEgdGVtcG9yYXJ5Cj4gPiB1MzIgYXJyYXkgcGx1cyBhZGRpdGlvbmFsIG1lbWNweSgpLgo+Cj4g
T0suCj4KPiAuLi4KPgo+ID4gPiA+ICsgICAgIGlmIChtYm94LT5tc2lfY291bnQpCj4gPiA+Cj4g
PiA+IElzIHRoaXMgY2hlY2sgcmVhbGx5IG5lZWRlZD8KPiA+Cj4gPiBNU0lzIGFyZSBvcHRpb25h
bCBmb3IgdGhlIFNCSSBNUFhZIG1haWxib3ggc28gd2Ugc2hvdWxkIG9ubHkgdXNlCj4gPiBwbGF0
Zm9ybV9kZXZpY2VfbXNpX3h5eigpIEFQSXMgb25seSB3aGVuIE1TSXMgYXJlIGF2YWlsYWJsZS4K
Pgo+ID4gPiA+ICsgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxs
KG1ib3gtPmRldik7Cj4KPiBIbW0uLi4gSSBhbSBub3Qgc3VyZSB3aHkuIERvIHlvdSBoYXZlIGFu
eSBPb3BzIG9yIHdhcm5pbmdzIGlmIHRoZSBjaGVjawo+IGlzIG5vdCB0aGVyZSBhbmQgbm8gTVNJ
IHByb3ZpZGVkPwoKV2UgZG9uJ3Qgc2VlIGFueSBvb3BzIG9yIHdhcm5pbmdzLiBUaGlzIGNoZWNr
IGlzIHRvIGF2b2lkIHVubmVjZXNzYXJ5CndvcmsgKHN1Y2ggYXMgYWNxdWlyaW5nIGxvY2ssIGNo
ZWNraW5nIGRlZmF1bHQgZG9tYWluLCBldGMpIGluIHRoZQptc2lfZG9tYWluX2ZyZWVfaXJxc19h
bGwoKSBjYWxsZWQgYnkgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxsKCkuCgpJIGRv
bid0IG1pbmQgZHJvcHBpbmcgdGhlIGNoZWNrIHNvIEkgd2lsbCB1cGRhdGUgaW4gdGhlIG5leHQg
cmV2aXNpb24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
