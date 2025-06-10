Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CCC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 05:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkpOlVUJeaaNQ0oeTopEHdVW2LLfn7EvQ+QMx0b4elQ=; b=wOIqmut3OCNLDh
	of4Qk4Cp/pkhKwVaynM8BjOnqnTwTY9Fix03fOHXGUKM8P4ZVT3p65kiaw+xOOvcbksXw935eOcOS
	KSW/AqHi3ak5LSNX6DyE6Sft25DddPlOI8nG3Bjn4xThtIxKDvEb/tzqeyHHhUXB8K4xpAEBLOxFO
	w/Rji3dh+nxvNuEeFGYogEvtqN8/qBv58fQzYz6SAs7efgg6qAomBmSYwrB1VuMNE/FGh4dNGR6BP
	WzAjWErET3fEFGQGj4uP/KcgX5Jg4TOmIPeVzrcJ4RUdRLUXopC/uhOsisIDoAp0vswRGsL/DGZeo
	D8LdOACNbtThNYRgv23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrPo-00000005pe8-1Qwf;
	Tue, 10 Jun 2025 05:20:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrPl-00000005pdb-2Nlw
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 05:20:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55394ee39dfso256510e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 22:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749532847; x=1750137647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmTF4qV0RYmWw+ybuIh+3cVh2LX7i9DDgBKJzM2NILw=;
        b=HSEyLdlwD/kKUO6Tnc0qRe8qS3ljNG1C/foZfy17O0/3zVzPAbKezhZQ+W+PIuQaTU
         Q0zIYa7oERaUMsJZxuhEH2g8TJ/y0O/niaantRjjPhKW/OyXbJNGXBqWSKiwpRqtnoX1
         M57f85G+7tPKC5iGobRdrdbLkYclybJrM6RjD4LwTqwuqNzqCOSXayXZQUCLxI32MJBS
         SQ+zex63a4IKjEJIMjZF3oveR3AbhTwsTLmkS8DPn9hag4eoW+UPmV5ILzy6k6CyxMdd
         l0m2AobVL0jK6A/uIetYYaszcRs1rWtxjdlrF6b20B5xYf6b7WTjincf/1u9Vi/MUADD
         /Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749532847; x=1750137647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmTF4qV0RYmWw+ybuIh+3cVh2LX7i9DDgBKJzM2NILw=;
        b=bYo3kB/cUJ3ydVhYc++URrSKewaI79d/SVNoFSoeuoJNOE19IumrVQ6fyjpdj/3utL
         652+6/hTqzLSZVCbgJNaIMKKj3xTQ4yQJbYv7KrVFxBmJyYDA0ButHupHb5Z9OH+QfaP
         sGQgx63bBE7TY238irmsDNgP8/lMLVKdZsKyqUu4RlN8mSZh2XVzYYFY9WLPq85x7LI8
         WkqT3r4SDHfywRF08XLheayX6dh7gDttpSabF0xLdJMQa6n7vKCV2hYtcUNEuhPHO0DS
         iI3ITTdgF7MhG/wZQb/uwcp0WRwnXtOPWJeZDJLbb/+erYYHGAijnRrUWp1wgSIkQDwj
         lQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVZ0dl2D62SzZo+FtlXAiNI6pJN02E7m8btTB7fSmyf3b4+CEmUDB0rVofw2WQtNcwGXmO82I/e0d8uA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw6kHnJcxqx/PH/YD1IPtyUneVdLNpXGpymZMa/V2r2Djb4F9+
	+UStc5/aFmjDuAnhX78efFBWPsXRRvPNuJo8mpQhkldckkapGkGV9DDNvKm64EXVuPPEHpgnDz7
	9Hy2hCStTT0S69LzNDKPQTtgQiWO/TViCr6B2EOtrLw==
X-Gm-Gg: ASbGnctO+tipejdVbGARuU8qLwDy625kHO/83LB5auKxXF8KW1WGx9Z74aMPWQ7EmY3
	uSi/3SZFtJ/U0/hb4WKV0Mx5RDh6+nC/t12PCMv4H8NOTMXPmeKCR8AvL/teh5en6IpJ/MktJUm
	Vq1ykv41q8IkVtbWzz+TBWtqJY3HXWBm2UdtEr1ZpST3PM
X-Google-Smtp-Source: AGHT+IE3kgKkVTatiXjLhBs2ID8jLzFcQgDLrCorEvfhipa1LZ7VqXob3i0ScHraWw7Nta7tAX4V3YYaxNtr4ZvTZ0E=
X-Received: by 2002:a05:6512:ea0:b0:553:660a:4c9a with SMTP id
 2adb3069b0e04-5539316961dmr599951e87.9.1749532847227; Mon, 09 Jun 2025
 22:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-10-apatel@ventanamicro.com> <20250530-squatting-chatroom-230f035f18ef@spud>
In-Reply-To: <20250530-squatting-chatroom-230f035f18ef@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:50:34 +0530
X-Gm-Features: AX0GCFuSkYjuAn0nKTg3vjMOZr-vbcntRpWviUWfwQSNW1KeC5eZy6YDX8Ko6Mc
Message-ID: <CAK9=C2X1svSheL8KFF40vXT9Fc2a5_zyX4PzWRkcR44rd3KmBw@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_222049_607517_4B07453F 
X-CRM114-Status: GOOD (  27.48  )
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

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMTA6MTHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBNYXkgMjUsIDIwMjUgYXQgMDI6MTY6NTZQTSAr
MDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3Ig
dGhlIFJQTUkgY2xvY2sgc2VydmljZSBncm91cCBiYXNlZAo+ID4gY29udHJvbGxlciBmb3IgdGhl
IHN1cGVydmlzb3Igc29mdHdhcmUuCj4gPgo+ID4gVGhlIFJQTUkgY2xvY2sgc2VydmljZSBncm91
cCBpcyBkZWZpbmVkIGJ5IHRoZSBSSVNDLVYgcGxhdGZvcm0KPiA+IG1hbmFnZW1lbnQgaW50ZXJm
YWNlIChSUE1JKSBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2Ns
b2NrL3Jpc2N2LHJwbWktY2xvY2sueWFtbCAgICAgIHwgNjEgKysrKysrKysrKysrKysrKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yaXNjdixycG1pLWNs
b2NrLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL3Jpc2N2LHJwbWktY2xvY2sueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9yaXNjdixycG1pLWNsb2NrLnlhbWwKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjljNjcyYTM4NTk1YQo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2Nr
L3Jpc2N2LHJwbWktY2xvY2sueWFtbAo+ID4gQEAgLTAsMCArMSw2MSBAQAo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZ
QU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
Y2xvY2svcmlzY3YscnBtaS1jbG9jay55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBSSVNDLVYg
UlBNSSBjbG9jayBzZXJ2aWNlIGdyb3VwIGJhc2VkIGNsb2NrIGNvbnRyb2xsZXIKPiA+ICsKPiA+
ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
PiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJJU0MtViBQbGF0Zm9ybSBNYW5h
Z2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYQo+ID4gKyAgbWVzc2FnaW5nIHBy
b3RvY29sIHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUuIFRoZSBzdXBlcnZpc29yCj4g
PiArICBzb2Z0d2FyZSBjYW4gc2VuZC9yZWNlaXZlIFJQTUkgbWVzc2FnZXMgdmlhIFNCSSBNUFhZ
IGV4dGVuc2lvbiBbMl0KPiA+ICsgIG9yIHNvbWUgZGVkaWNhdGVkIHN1cGVydmlzb3ItbW9kZSBS
UE1JIHRyYW5zcG9ydC4KPiA+ICsKPiA+ICsgIFRoZSBSUE1JIHNwZWNpZmljYXRpb24gWzFdIGRl
ZmluZXMgY2xvY2sgc2VydmljZSBncm91cCBmb3IgYWNjZXNzaW5nCj4gPiArICBzeXN0ZW0gY2xv
Y2tzIG1hbmFnZWQgYnkgYSBwbGF0Zm9ybSBtaWNyb2NvbnRyb2xsZXIuIFRoZSBzdXBlcnZpc29y
Cj4gPiArICBzb2Z0d2FyZSBjYW4gYWNjZXNzIFJQTUkgY2xvY2sgc2VydmljZSBncm91cCB2aWEg
U0JJIE1QWFkgY2hhbm5lbCBvcgo+ID4gKyAgc29tZSBkZWRpY2F0ZWQgc3VwZXJ2aXNvci1tb2Rl
IFJQTUkgdHJhbnNwb3J0Lgo+ID4gKwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+ID4gKyAgUmVmZXJlbmNlcwo+ID4gKyAgPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gKyAgWzFdIFJJU0MtViBQbGF0
Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkKPiA+ICsgICAgICBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1pL3JlbGVhc2VzCj4gPiArCj4gPiArICBbMl0g
UklTQy1WIFN1cGVydmlzb3IgQmluYXJ5IEludGVyZmFjZSAoU0JJKQo+ID4gKyAgICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMKPiA+ICsK
PiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgZGVzY3JpcHRpb246
Cj4gPiArICAgICAgSW50ZW5kZWQgZm9yIHVzZSBieSB0aGUgc3VwZXJ2aXNvciBzb2Z0d2FyZS4K
PiA+ICsgICAgY29uc3Q6IHJpc2N2LHJwbWktY2xvY2sKPiA+ICsKPiA+ICsgIG1ib3hlczoKPiA+
ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgTWFpbGJv
eCBjaGFubmVsIG9mIHRoZSB1bmRlcmx5aW5nIFJQTUkgdHJhbnNwb3J0IG9yIFNCSSBtZXNzYWdl
IHByb3h5IGNoYW5uZWwuCj4gPiArCj4gPiArICAiI2Nsb2NrLWNlbGxzIjoKPiA+ICsgICAgY29u
c3Q6IDEKPgo+IENvdWxkIHlvdSBwbGVhc2UgYWRkIHNvbWUgZGVzY3JpcHRpb24gaGVyZSBhcyB0
byB3aGF0IHRoaXMgY2xvY2stY2VsbAo+IGFjdHVhbGx5IGRvZXM/IE9uIGEgbm9ybWFsIGNsb2Nr
IGNvbnRyb2xsZXIgc29tZW9uZSBtaWdodCBjaXRlIGFuCj4gaW5jbHVkZSBmaWxlIHdpdGggYSBo
dWdlIGxpc3Qgb2YgZGVmaW5lcyBmb3Igd2hhdCBudW1iZXJzIG1hcCB0byB3aGF0Cj4gY2xvY2su
IEluIHRoaXMgY2FzZSwgdGhpcyB2YWx1ZSBpcyBDTE9DS19JRCBpbiB0aGUgc3BlYywgc28gaXQn
cwo+IGNvbXBsZXRlbHkgcGxhdGZvcm0gc3BlY2lmaWMgYXMgdG8gd2hhdCB0aGV5IG1lYW4gc28g
Y2l0aW5nIHNvbWUgaW5jbHVkZQo+IGlzbid0IGhlbHBmdWwsIHNvIGp1c3QgbWVudGlvbiB0aGF0
IGl0IGlzIENMT0NLX0lEIGFuZCB0aGUgbWVhbmluZ3MgYXJlCj4gcGxhdGZvcm0gc3BlY2lmaWMu
Cj4KPiBJIHN1cHBvc2UgdGVjaG5pY2FsbHkgaXQgY2FuIGJlIHNvbWV0aGluZyBvdGhlciB0aGFu
IENMT0NLX0lELCBpZiB0aGlzIGlzCj4gdXNlZCB3aGVuIHRoZSBTQkkgbWVzc2FnZSBwcm94eSBl
eHRlbnNpb24gaXMgcHJvdmlkZWQgYnkgYW4gU0JJCj4gaW1wbGVtZW50YXRpb24gdGhhdCB1c2Vz
IGEgbm9uLVJQTUkgdHJhbnNwb3J0LCBidXQgSSBkb24ndCB0aGluayB0aGF0J3MgYQo+IGNhbiBv
ZiB3b3JtcyB3b3J0aCBicmluZ2luZyB1cCBpbiB0aGUgYmluZGluZy4gQW55b25lIGRvaW5nIHRo
YXQgY2FuIHB1dAo+IDIrMiB0b2dldGhlciBJIHRoaW5rLgoKVGhlICNjbG9jay1jZWxsIHZhbHVl
IG11c3QgYmUgdGhlIHBsYXRmb3JtIHNwZWNpZmljIENMT0NLX0lEIGFzIGRlZmluZWQgYnkKdGhl
IFJJU0MtViBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgc3BlY2lmaWNhdGlv
biBpcnJlc3BlY3RpdmUKb2YgdGhlIHVuZGVybHlpbmcgbWVjaGFuaXNtIChlLmcuIFNCSSBNUFhZ
IG9yIFJQTUkgdHJhbnNwb3J0KSB1c2VkIHRvCmFjY2VzcyB0aGUgUlBNSSBDbG9jayBzZXJ2aWNl
IGdyb3VwLgoKRWFjaCBwbGF0Zm9ybSBtdXN0IHB1Ymxpc2ggdGhlaXIgQ0xPQ0tfSUQgdmFsdWVz
IGFzIHBhcnQgb2YgdGhlaXIgU29DIGRvY3MKb3IgYXMgYSBoZWFkZXIgdXNlZCBieSB0aGVpciBT
b0MgRFRTIGZpbGVzLgoKSSB3aWxsIGFkZCAiZGVzY3JpcHRpb246IiBmb3IgY2xvY2stY2VsbHMg
YWxvbmcgdGhlc2UgbGluZXMuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
