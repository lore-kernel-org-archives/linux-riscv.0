Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD1AC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 05:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k87MqNWNyN2UYIbNO3DtVi1PkIEeIn/clF2LCouT2rw=; b=aYv9Rle9NRqFsP
	vibFpIDb8p7Z5+kuJbqmEoHQ604kq7gK25g+Wp45dksM8U0gyr1NVF3hUXIAFTwLMK7jHeun6m9HH
	KpLzKRKOW2T5dZPIfvLYcSMPTgJfhF8v4HasU0tcA9j9uejVK6ZmdIunEGb62y0QD65EuUVx0Hae1
	lxj9TyLiIsmpUnrzQ/+oU/wR7i/q+zHSIfc7PrbmF5if+fFWXoIOEGY+DIMrOvnXCaNUULUtx+rqi
	JOXE8K3DVRQWkqkIpKLnBWkpc9K2ULCjG6cAURii3XLZqsU8jxdV6rdoqQzOSpH8ZCfL4ooknsLa+
	ONURTL2wVMO1A9W3WPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDu0-00000008sRX-2ZCV;
	Wed, 11 Jun 2025 05:21:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDtx-00000008sR1-3edw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 05:21:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5532f9ac219so7179072e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 22:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749619288; x=1750224088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZBCRuywHIrHwB4Y6CUEmtf4oyW/dhVJ1DZHpWrRRRc=;
        b=h+iCS/uE1T+pVLJoCu1TvdMj5QlG+dATVZnGk5Zdf0g+bjMk4X6o61F0aEz16YYStz
         H+nKQS1hxazqGe6xEgC8cy8jkNK15z7zd2luDfRuNiA/Mw3IfwpkKZMKSb+ycKQ4RRcA
         ZcfNEv2HlUobgZa0H/pfBzJP2y2ilYzFoEQ2VgVJrxypNkPXCUsRn5JA0xS7gq1+hmlb
         +aIi1AgmFsgOpIbFTWSDU55X6t9nbhD7tsCZosJzKyXIt10xtns6wUvl08/qGFeoABet
         un12ATBwHlruaXNcxIyV3PmlBUffCsQVlzh6PEPjQChaB/ywODyJ7L+8RSn/qFC9yL5p
         vJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749619288; x=1750224088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZBCRuywHIrHwB4Y6CUEmtf4oyW/dhVJ1DZHpWrRRRc=;
        b=O5rNaXaxpMfZaIOiVSqxYahpx9jVPt/XLQZ3iHvi4noIpH9bTGJDxB9Oxn7Rgti4YU
         GcuzBqpbZ2OsN0+6gDjjIyZ4CtA1QS2G6xsJmx9Og0kaogQ4VJpzxRlZGLxrmLZwj5u1
         BGSbfHHKmxR79EGoZUy2BhkI9MlQyZqc7uYwovFDVRXId9GSYzu+8+pfdNLXw8NQ//+O
         rCCvbZ2ixpC3eYJiB4GLPAIcnKvyBi2rh8tzHhMAGbvYBdfhbdRnpXjtLHILM+2CVFL2
         x70/kLWMgusI69znr2furp6JDXBMWvhiMHa5kxmPkrGlEFpwMk8wm8vMp+Rdx+okxqrH
         erpg==
X-Forwarded-Encrypted: i=1; AJvYcCWVi2+lE2u/Mv9/PFwaOau6fHfzTITsbUw9BeG8Za8XIMhsxX1hvd6b4QguoRcIou+27Ug2nRfdXRRm5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQCKUkV9WiM/bCI7JyL1gvVw+eg4jQLS01uMCdXuKCL/TS//Z
	mIIwTwB8tLXpnF2mO6P0P4WhXsvcj7MhfAXhjs2xBMojo85+fyo/eVllgxQtTpuLZ+jhFZBWk0W
	T2nzoAGprB1Ncetmd4Cm2gZKi+kXMTNUJtRKA13EZ1w==
X-Gm-Gg: ASbGncsFpVoo04l2JkyB0TZoQP1wg0Fng+8yJ9ekNhi3uavG9vmZafwTMNnpSyweaEI
	x1iY+49KMl/ZuSnx2q6bjmvmlBIAtTn5829UVSA+FXPOKZtFfMW4evtV6j3RCq9RjNAtnyH8qJf
	uz8PyZLuEiOrJYW4BdR7SrTSMY6tLQ7YCfXNqmAswaLwCZf9ra44qa4v4=
X-Google-Smtp-Source: AGHT+IGcTZB8S6Gd3hIZot1w2/0Yfybi+OExqcLnX1AZuMKGrGy+Zh6YIGrowqLXEqln+XAK8JxzBWfPL5Z462AVQRQ=
X-Received: by 2002:a05:6512:ea0:b0:553:2411:b4ef with SMTP id
 2adb3069b0e04-5539c14d883mr614133e87.34.1749619287649; Tue, 10 Jun 2025
 22:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com> <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com> <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
 <aEgBGup553Pki98e@smile.fi.intel.com>
In-Reply-To: <aEgBGup553Pki98e@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Jun 2025 10:51:15 +0530
X-Gm-Features: AX0GCFt0zvXLqPkqunyCtbvdd6VWwuT7DuTT2gaTg9GfnLxzDC88KAV9zwbxwm8
Message-ID: <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_222129_914776_FCC4F9F5 
X-CRM114-Status: GOOD (  26.89  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMzoyNeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDEwLCAy
MDI1IGF0IDEwOjA1OjI3QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1
biAxMCwgMjAyNSBhdCAxOjM04oCvQU0gQW5keSBTaGV2Y2hlbmtvCj4gPiA8YW5kcml5LnNoZXZj
aGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gT24gTW9uLCBKdW4gMDksIDIwMjUg
YXQgMDU6NTk6NDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIE1h
eSAyOCwgMjAyNSBhdCA0OjIz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+ID4gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBTdW4sIE1heSAy
NSwgMjAyNSBhdCAwMjoxNjo1NFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Cj4gLi4uCj4K
PiA+ID4gPiA+ID4gKyAgICAgaWYgKG1ib3gtPm1zaV9jb3VudCkKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJcyB0aGlzIGNoZWNrIHJlYWxseSBuZWVkZWQ/Cj4gPiA+ID4KPiA+ID4gPiBNU0lzIGFyZSBv
cHRpb25hbCBmb3IgdGhlIFNCSSBNUFhZIG1haWxib3ggc28gd2Ugc2hvdWxkIG9ubHkgdXNlCj4g
PiA+ID4gcGxhdGZvcm1fZGV2aWNlX21zaV94eXooKSBBUElzIG9ubHkgd2hlbiBNU0lzIGFyZSBh
dmFpbGFibGUuCj4gPiA+Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNl
X21zaV9mcmVlX2lycXNfYWxsKG1ib3gtPmRldik7Cj4gPiA+Cj4gPiA+IEhtbS4uLiBJIGFtIG5v
dCBzdXJlIHdoeS4gRG8geW91IGhhdmUgYW55IE9vcHMgb3Igd2FybmluZ3MgaWYgdGhlIGNoZWNr
Cj4gPiA+IGlzIG5vdCB0aGVyZSBhbmQgbm8gTVNJIHByb3ZpZGVkPwo+ID4KPiA+IFdlIGRvbid0
IHNlZSBhbnkgb29wcyBvciB3YXJuaW5ncy4gVGhpcyBjaGVjayBpcyB0byBhdm9pZCB1bm5lY2Vz
c2FyeQo+ID4gd29yayAoc3VjaCBhcyBhY3F1aXJpbmcgbG9jaywgY2hlY2tpbmcgZGVmYXVsdCBk
b21haW4sIGV0YykgaW4gdGhlCj4gPiBtc2lfZG9tYWluX2ZyZWVfaXJxc19hbGwoKSBjYWxsZWQg
YnkgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxsKCkuCj4gPgo+ID4gSSBkb24ndCBt
aW5kIGRyb3BwaW5nIHRoZSBjaGVjayBzbyBJIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHJldmlz
aW9uLgo+Cj4gUGVyaGFwcyB5b3UgY2FuIHJhdGhlciBhZGQgdGhpcyBjaGVjayBpbnRvIHRoZSBj
YWxsZWU/IFNlZW1zIHRvIG1lIHRoYXQKPiB5b3UgaGF2ZSBhIGp1c3RpZmljYXRpb24gZm9yIGl0
LiBVc3VhbCBwYXR0ZXJuIGluIHRoZSBrZXJuZWwgdGhhdCBmcmVlaW5nCj4gcmVzb3VyY2VzIHNo
b3VsZCBiZSBhd2FyZSBvZiB0aGUgTlVMTCBwb2ludGVycyBvciBvcHRpb25hbCByZXNvdXJjZXMK
PiBzbyB3ZSBtYXkgY2FsbCBpdCB1bmNvbmRpdGlvbmFsbHkgZnJvbSB0aGUgdXNlcihzKS4KPgoK
VW5jb25kaXRpb25hbGx5IGNhbGxpbmcgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxs
KCkgd2hlbiB0aGVyZQp3ZXJlIG5vIE1TSXMgYWxsb2NhdGVkIGNhdXNlcyB0aGUgYmVsb3cgY3Jh
c2ggYmVjYXVzZSAiZGV2LT5tc2kuZGF0YSIKaXMgbm9uLU5VTEwgb25seSB3aGVuOgoKWyAgICAx
LjM1NTczNV0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
IGF0CnZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDA4ClsgICAgMS4zNTgyMTJdIEN1cnJl
bnQgc3dhcHBlci8wIHBndGFibGU6IDRLIHBhZ2VzaXplLCA1Ny1iaXQgVkFzLApwZ2RwPTB4MDAw
MDAwMDA4MWEyYjAwMApbICAgIDEuMzYwNjMyXSBbMDAwMDAwMDAwMDAwMDAwOF0gcGdkPTAwMDAw
MDAwMDAwMDAwMDAKWyAgICAxLjM2MzEzMl0gT29wcyBbIzFdClsgICAgMS4zNjM3NDhdIE1vZHVs
ZXMgbGlua2VkIGluOgpbICAgIDEuMzY0NzY4XSBDUFU6IDMgVUlEOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgTm90IHRhaW50ZWQKNi4xNi4wLXJjMS0wMDAzNy1nYWI1NWUxYzFkOTdhLWRpcnR5
ICM3IE5PTkUKWyAgICAxLjM2ODMyNV0gZXBjIDogbXV0ZXhfbG9jaysweDAvMHgyOApbICAgIDEu
MzY5Nzk2XSAgcmEgOiBfX21zaV9sb2NrX2Rlc2NzKzB4MzIvMHgzYwpbICAgIDEuMzcwMjM0XSBl
cGMgOiBmZmZmZmZmZjgwYWY5NmU4IHJhIDogZmZmZmZmZmY4MDAwMzhlNiBzcCA6CmZmMjAwMDAw
MDAwNGJhOTAKWyAgICAxLjM3MjQxMl0gIGdwIDogZmZmZmZmZmY4MTgxOWMwMCB0cCA6IGZmNjAw
MDAwMDFkYzAwMDAgdDAgOgo2OTAwMDAwMDAwMDAwMDAwClsgICAgMS4zNzM1MjddICB0MSA6IDAw
MDAwMDAwMDAwMDAwNzIgdDIgOiA2OTYyNzMyZDc2NjM3MzY5IHMwIDoKZmYyMDAwMDAwMDA0YmFi
MApbICAgIDEuMzc2NjI4XSAgczEgOiBmZjYwMDAwMDAyNDFjNDEwIGEwIDogMDAwMDAwMDAwMDAw
MDAwOCBhMSA6CmZmZmZmZmZmODE2OGNhNTgKWyAgICAxLjM3OTExMF0gIGEyIDogMDAwMDAwMDAw
MDAwMDAxMCBhMyA6IDAwMDAwMDAwMDAwMDAwYTMgYTQgOgowMDAwMDAwMDAwMDAwMDAwClsgICAg
MS4zODA0MTBdICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3
IDoKMDAwMDAwMDA0NDQyNDM0ZQpbICAgIDEuMzgxMDE5XSAgczIgOiAwMDAwMDAwMDAwMDAwMDAw
IHMzIDogZmY2MDAwMDAzZmZmMzBhMCBzNCA6CmZmNjAwMDAwMDI0MWM0MTAKWyAgICAxLjM4MTU3
OV0gIHM1IDogZmY2MDAwMDAwMzlmOTMyMCBzNiA6IGZmNjAwMDAwMDI0MWM0MDAgczcgOgowMDAw
MDAwMDAwMDAwMDAyClsgICAgMS4zODIyNDJdICBzOCA6IGZmZmZmZmZmODE4MjFmYTAgczkgOiAw
MDAwMDAwMDAwMDAwMDAwIHMxMDoKMDAwMDAwMDAwMDAwMDAwMApbICAgIDEuMzg0MDE4XSAgczEx
OiAwMDAwMDAwMDAwMDAwMDAwIHQzIDogZmZmZmZmZmY4MTgzMGEzNyB0NCA6CmZmZmZmZmZmODE4
MzBhMzcKWyAgICAxLjM4NTk1OF0gIHQ1IDogZmZmZmZmZmY4MTgzMGEzOCB0NiA6IGZmMjAwMDAw
MDAwNGI3YzgKWyAgICAxLjM4NzMwNl0gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6
IDAwMDAwMDAwMDAwMDAwMDgKY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKWyAgICAxLjM4ODQwN10g
WzxmZmZmZmZmZjgwYWY5NmU4Pl0gbXV0ZXhfbG9jaysweDAvMHgyOApbICAgIDEuMzg5MzMzXSBb
PGZmZmZmZmZmODAwMDNkYmE+XSBtc2lfZG9tYWluX2ZyZWVfaXJxc19hbGwrMHgyYS8weDQ4Clsg
ICAgMS4zOTAyNzVdIFs8ZmZmZmZmZmY4MDcxNGU4Nj5dIHBsYXRmb3JtX2RldmljZV9tc2lfZnJl
ZV9pcnFzX2FsbCsweDE2LzB4MmMKWyAgICAxLjM5MTcxNV0gWzxmZmZmZmZmZjgwOGQ4MTE0Pl0g
bXB4eV9tYm94X3Byb2JlKzB4NmRjLzB4NzUwClsgICAgMS4zOTI1MjJdIFs8ZmZmZmZmZmY4MDZm
MTcwNj5dIHBsYXRmb3JtX3Byb2JlKzB4NGUvMHhiNApbICAgIDEuMzkzMTY5XSBbPGZmZmZmZmZm
ODA2ZWVmNTg+XSByZWFsbHlfcHJvYmUrMHg4NC8weDIzMApbICAgIDEuMzkzNzg5XSBbPGZmZmZm
ZmZmODA2ZWYxNjA+XSBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg1Yy8weGRjClsgICAgMS4zOTQy
ODJdIFs8ZmZmZmZmZmY4MDZlZjJhND5dIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgyYy8weGY4Clsg
ICAgMS4zOTY1NzddIFs8ZmZmZmZmZmY4MDZlZjRhYz5dIF9fZHJpdmVyX2F0dGFjaCsweDZjLzB4
MTVjClsgICAgMS4zOTc2MzRdIFs8ZmZmZmZmZmY4MDZlZDE0Nj5dIGJ1c19mb3JfZWFjaF9kZXYr
MHg2Mi8weGIwClsgICAgMS4zOTkwNjBdIFs8ZmZmZmZmZmY4MDZlZWE5YT5dIGRyaXZlcl9hdHRh
Y2grMHgxYS8weDI0ClsgICAgMS4zOTk3OTJdIFs8ZmZmZmZmZmY4MDZlZTMxZT5dIGJ1c19hZGRf
ZHJpdmVyKzB4Y2UvMHgxZDgKWyAgICAxLjQwMDM2M10gWzxmZmZmZmZmZjgwNmYwMjBjPl0gZHJp
dmVyX3JlZ2lzdGVyKzB4NDAvMHhkYwpbICAgIDEuNDAwODMyXSBbPGZmZmZmZmZmODA2ZjE0MTQ+
XSBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDFjLzB4MjQKWyAgICAxLjQwMTU1MV0gWzxm
ZmZmZmZmZjgwYzNkZjdlPl0gbXB4eV9tYm94X2RyaXZlcl9pbml0KzB4MWEvMHgyNApbICAgIDEu
NDAyMzI4XSBbPGZmZmZmZmZmODAwMTA4YjI+XSBkb19vbmVfaW5pdGNhbGwrMHg1Ni8weDFkOApb
ICAgIDEuNDAzNjc0XSBbPGZmZmZmZmZmODBjMDEyMzY+XSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsw
eDI2Ni8weDJkMApbICAgIDEuNDA0OTU2XSBbPGZmZmZmZmZmODBhZjU0OWE+XSBrZXJuZWxfaW5p
dCsweDFlLzB4MTNjClsgICAgMS40MDU0MjJdIFs8ZmZmZmZmZmY4MDAxMjI2Nj5dIHJldF9mcm9t
X2Zvcmtfa2VybmVsKzB4ZS8weGNjClsgICAgMS40MDU4NzBdIFs8ZmZmZmZmZmY4MGFmZjA0Mj5d
IHJldF9mcm9tX2Zvcmtfa2VybmVsX2FzbSsweDE2LzB4MTgKCkl0IGlzIGJldHRlciB0byBoYXZl
IHRoZSBjaGVjayBvbiAibWJveC0+bXNpX2NvdW50IiBiZWZvcmUgY2FsbGluZwpwbGF0Zm9ybV9k
ZXZpY2VfbXNpX2ZyZWVfaXJxc19hbGwoKS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
