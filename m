Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF178C369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH8IO6nSgiE5M4UF66QW3SbEyeX5d2mchxc6AkxkPkY=; b=cD2T3uMAvcC6hV
	+grbVavmmTQVclhQkWgL7I6PjBKu36T/BxMNA8BcENOACrK3/hm3SVUdfImc86vPc2awwDeXrG45b
	zHoJ4WySYgtAf/A32WZxw+FSHEhYWk5PmzDPsRA5nxtpkt5kPjKb5zJR/3sFIEKumBtSJufidh68b
	WBLgbxuSq0G1zBlBojoWIsNz0/dqsIqxtP21FRxxajNxwFfcpdl9lnkp74EvxQ44rPJwZ+ISuai4m
	836cHWTStYWs9hEj78CZxjwWCLSdSOmCt62eoOGQExE+SNkBbvHuEEMS0XDxnUVsTb886d66aEwJ8
	9CS4TOUYUgnlqS/KuPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWgD-00000005BMl-3WZh;
	Sun, 04 May 2025 10:34:41 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWca-00000005B3t-1xpP
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:30:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso29556731fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746354654; x=1746959454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctjHK3tz3fFaUotDjbzNh8QkxmVX8TEvt8HdzjtOs8M=;
        b=L26PaI4wEgPl0UYiURcdtSQP6eFSHCIJQqeCk2/ofTnjB4iTfLIdH2XNKy2KoJ6qMD
         abXtCMNEbHrw2HN++Mf2Hf8pv/zb6shAhBXkhX0YqCPaNjpUWrZSedyawvqMVGB+xMdk
         4Znn8JyRpDuBj3E3WXgVnh+5bouXPyPMKnpSohTdtCjqpytzJg0zp8YnaEALbq5cSL+n
         +lM7vNf13Vui0PMXdKF3l0vWxmHS6Z1QuNkg9snpn/XFscDshH3F452P/T2sEiecU8wN
         BVwQtJ5M8PenSFmjd2rx4DXFEJkcf9guDBXFrIBOh2zjeJikW6YAEegizuiOrRgXLDds
         NfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354654; x=1746959454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctjHK3tz3fFaUotDjbzNh8QkxmVX8TEvt8HdzjtOs8M=;
        b=OZOhQyuyET4IoEKdtkEfbvRnD/7gYP05OKHPmlPqoti3lzdicGW5N2xwlzkBLDW576
         E+7dGtuJRVsY15U5QA0H0ZDlgrDPqoT1I8HjLJNLxLyEC2OWD0Y435aYvjlz4dL0CpVZ
         poQqjN97ninyYOfseCyfkCTXqG76PcfhXpOdjk85nyAXHXs9RxhOVoCD2LQWHQx64l43
         Ulx3VIwLj3YUZPt9FWXdZnwUlkyxa3JvdD9mDHCutriuW6fY0d09h1/1zf4OTDk2T4GC
         QrwSeN8BinFSDas/9l+snCDFmMQq8fbhFyiYPbRHzyvimbwbxqAUSNNPXpR0sZn5BtZY
         nXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk/WMUwsltn19aVczKNfMpuREaGsaNhMDP0GN2MmVpHmp46dzhzBUv6EryE2xYxMR+GABFogKF4W6BQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRjQLlbmYxgf1zWFKsMwv4zQ6wsEWrPuL+ixWyi9gOhn9XTqxT
	ZxMRPhjtAzEKUa9sxKFY0PHSO9Wb0CZsKWc3Y38m3TwnoCtZ/zb+IZLtpY+hVwKUT+TnB4bjVu9
	wIGJKG8lAlNsklxZmgfJd5hyQzhuYhm4d4nJcpw==
X-Gm-Gg: ASbGncu+GMoLQqVwcgIMEP8UU6j1vqrDvKo5QyLKE5gpKrUkDS9/dMc4YfzgLuav7Qp
	m6qG5dlDkSqXW673OAx8z02MGR0WChBGJcXDnAD40Q1PmeiD0uz5GMVEKh/TLYor2PApN7XsG6s
	DYrrWXx40x2tofpmr4jw1v3hp4jaIX2wlt
X-Google-Smtp-Source: AGHT+IHNddMh1MAEdaXyMhFUP3hPex+9ap5FzT1qAWDbC5vR9D0r3RQgxeM0Z7vpOyFKStYTnjvZBtG4mnuesFckMjo=
X-Received: by 2002:a05:651c:1511:b0:30b:ad2c:dfe4 with SMTP id
 38308e7fff4ca-3235211023amr11830601fa.30.1746354653993; Sun, 04 May 2025
 03:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-9-apatel@ventanamicro.com> <20250203225140.GA483650-robh@kernel.org>
In-Reply-To: <20250203225140.GA483650-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 4 May 2025 16:00:43 +0530
X-Gm-Features: ATxdqUGUPU3OFwgF9F3HEI1t-oVp4wPJkT1-hzjaASNwyPdtsiItmeAO9QQEekY
Message-ID: <CAK9=C2WKjDUGc5Se1nG=XTp3wn5ZytUcnghO_u85bSoqGiwmvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V
 RPMI clock service group
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_033056_512760_34B03BE5 
X-CRM114-Status: GOOD (  25.30  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA0OjIx4oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAwMywgMjAyNSBhdCAwMjoxODo1N1BNICswNTMw
LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUg
Y2xvY2sgc2VydmljZSBncm91cCBkZWZpbmVkIGJ5IHRoZQo+ID4gUklTQy1WIHBsYXRmb3JtIG1h
bmFnZW1lbnQgaW50ZXJmYWNlIChSUE1JKSBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
Li4uL2JpbmRpbmdzL2Nsb2NrL3Jpc2N2LHJwbWktY2xvY2sueWFtbCAgICAgIHwgNzcgKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9yaXNjdixycG1pLWNsb2NrLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Jpc2N2LHJwbWktY2xvY2sueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yaXNjdixycG1pLWNsb2NrLnlhbWwK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmMwODQ5MWMw
NDkyNgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL3Jpc2N2LHJwbWktY2xvY2sueWFtbAo+ID4gQEAgLTAsMCArMSw3NyBA
QAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvY2xvY2svcmlzY3YscnBtaS1jbG9jay55YW1sIwo+ID4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4g
K3RpdGxlOiBSSVNDLVYgUlBNSSBjbG9jayBzZXJ2aWNlIGdyb3VwIGJhc2VkIGNsb2NrIGNvbnRy
b2xsZXIKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJJU0Mt
ViBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYQo+ID4g
KyAgbWVzc2FnaW5nIHByb3RvY29sIHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUuIFRo
ZSBzdXBlcnZpc29yCj4gPiArICBzb2Z0d2FyZSBjYW4gc2VuZC9yZWNlaXZlIFJQTUkgbWVzc2Fn
ZXMgdmlhIFNCSSBNUFhZIGV4dGVuc2lvbiBbMl0KPiA+ICsgIG9yIHNvbWUgZGVkaWNhdGVkIHN1
cGVydmlzb3ItbW9kZSBSUE1JIHRyYW5zcG9ydC4KPiA+ICsKPiA+ICsgIFRoZSBSUE1JIHNwZWNp
ZmljYXRpb24gWzFdIGRlZmluZXMgY2xvY2sgc2VydmljZSBncm91cCBmb3IgYWNjZXNzaW5nCj4g
PiArICBzeXN0ZW0gY2xvY2tzIG1hbmFnZWQgYnkgYSBwbGF0Zm9ybSBtaWNyb2NvbnRyb2xsZXIu
Cj4gPiArCj4gPiArICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4gPiArICBSZWZlcmVuY2VzCj4gPiArICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gPiArCj4gPiArICBbMV0gUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQg
SW50ZXJmYWNlIChSUE1JKQo+ID4gKyAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24t
aXNhL3Jpc2N2LXJwbWkvcmVsZWFzZXMKPiA+ICsKPiA+ICsgIFsyXSBSSVNDLVYgU3VwZXJ2aXNv
ciBCaW5hcnkgSW50ZXJmYWNlIChTQkkpCj4gPiArICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcwo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6
Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOgo+ID4gKyAgICAgICAgICBJbnRlbmRlZCBmb3IgdXNlIGJ5IHRoZSBTQkkgaW1wbGVtZW50
YXRpb24gaW4gbWFjaGluZSBtb2RlIG9yCj4gPiArICAgICAgICAgIHNvZnR3YXJlIGluIHN1cGVy
dmlzb3IgbW9kZS4KPiA+ICsgICAgICAgIGNvbnN0OiByaXNjdixycG1pLWNsb2NrCj4gPiArCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgSW50ZW5kZWQgZm9yIHVzZSBi
eSB0aGUgU0JJIGltcGxlbWVudGF0aW9uIGluIG1hY2hpbmUgbW9kZS4KPiA+ICsgICAgICAgIGNv
bnN0OiByaXNjdixycG1pLW1weHktY2xvY2sKPiA+ICsKPiA+ICsgIG1ib3hlczoKPiA+ICsgICAg
bWF4SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgTWFpbGJveCBjaGFu
bmVsIG9mIHRoZSB1bmRlcmx5aW5nIFJQTUkgdHJhbnNwb3J0IG9yIFNCSSBtZXNzYWdlIHByb3h5
Lgo+ID4gKwo+ID4gKyAgcmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZDoKPiA+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlc2NyaXB0
aW9uOgo+ID4gKyAgICAgIFRoZSBTQkkgTVBYWSBjaGFubmVsIGlkIHRvIGJlIHVzZWQgZm9yIHBy
b3ZpZGluZyBSUE1JIGFjY2VzcyB0bwo+ID4gKyAgICAgIHRoZSBzdXBlcnZpc29yIHNvZnR3YXJl
LiBUaGlzIHByb3BlcnR5IGlzIG1hbmRhdG9yeSB3aGVuIHVzaW5nCj4gPiArICAgICAgcmlzY3Ys
cnBtaS1tcHh5LWNsb2NrIGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4gVGhhdCBjb25zdHJhaW50IGNh
biBiZSBleHByZXNzZWQgYXM6Cj4KPiBkZXBlbmRlbnRTY2hlbWFzOgo+ICAgcmlzY3Ysc2JpLW1w
eHktY2hhbm5lbC1pZDoKPiAgICAgcHJvcGVydGllczoKPiAgICAgICBjb21wYXRpYmxlOgo+ICAg
ICAgICAgY29uc3Q6IHJpc2N2LHJwbWktbXB4eS1jbG9jawo+Cj4gUGxlYXNlIGRvdWJsZSBjaGVj
ayB0aGF0IHdvcmtzLgo+Cj4gPiArCj4gPiArICAiI2Nsb2NrLWNlbGxzIjoKPiA+ICsgICAgY29u
c3Q6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBt
YW5kYXRvcnkgd2hlbiB1c2luZyByaXNjdixycG1pLWNsb2NrIGNvbXBhdGlibGUgc3RyaW5nLgo+
Cj4gU2ltaWxhciBjb25zdHJhaW50IGhlcmUuCj4KPiBUaG91Z2ggdGhlIG9ubHkgdGhpbmcgdGhl
IDIgY29tcGF0aWJsZXMgaGF2ZSBpbiBjb21tb24gaXMgJ21ib3hlcycuIEkKPiB0aGluayBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCBzcGxpdCB0aGlzIGludG8gMiBkb2NzLgoKWWVzLCBpdCBp
cyBtdWNoIHNpbXBsZXIgdG8gaGF2ZSAyIHNlcGFyYXRlIGRvY3MuIEkgd2lsbCB1cGRhdGUKaW4g
dGhlIG5leHQgcmV2aXNpb24uCgpSZWdhcmRzLApBbnVwCgo+Cj4gPiArCj4gPiArcmVxdWlyZWQ6
Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gbWJveGVzCj4gPiArCj4gPiArYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsg
ICAgbXB4eV9tYm94OiBzYmktbXB4eS1tYm94IHsKPgo+IG1haWxib3ggewo+Cj4gPiArICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmlzY3Ysc2JpLW1weHktbWJveCI7Cj4gPiArICAgICAgICAgICNt
Ym94LWNlbGxzID0gPDI+Owo+ID4gKyAgICB9Owo+ID4gKyAgICBycG1pLWNsayB7Cj4KPiBjbG9j
ay1jb250cm9sbGVyIHsKPgo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNjdixycG1pLWNs
b2NrIjsKPiA+ICsgICAgICAgIG1ib3hlcyA9IDwmbXB4eV9tYm94IDB4MTAwMCAweDA+Owo+ID4g
KyAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4gKyAgICB9Owo+ID4gKy4uLgo+ID4gLS0K
PiA+IDIuNDMuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
