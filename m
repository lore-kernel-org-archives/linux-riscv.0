Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E857C87FCB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3qAjJsBHjEug5Fir+GUjsccYwKHyNGscM4A0X+6P0U=; b=0ugHO8lf5DaLUh
	WJMTBais6I2rHh9UF+uL71ecB8VyGdARPViHbSm4LlpZn48B+AnYYnARj21s8zCwgbH858Y4fl3w3
	6buKb4/BYomE9lVRXIX+/GQrzc+mpr/3BHmat2h5Dqsk8yhMui301uuLsdjTp4DNhAQsZtpeopXPK
	Et1AO/SVpSF4yXUEny/Qacs+R9x8nkFjERdV2UsB+tlGGPIhHpCc4gvcil4qHSQtEbfknBKcnWuwB
	uvXpTuu+McgSbM5i6Y7LFXdHn8q6eIb96l1/4Z3jKfhZ2qjYVKxpPv4IQgn/GuJs3y7D+nRcCjbnS
	/qF8clIGcWUy+PIwGezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiZNH-00000008lBy-3XsB;
	Sun, 03 Aug 2025 14:07:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiZNF-00000008lBV-0xfO
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 14:07:42 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3323d8e0ac4so28545711fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Aug 2025 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754230059; x=1754834859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzN7qn/y0iYwP/aeVo8H8FbGk6Rq9qUZdl4rPLj5kjY=;
        b=hDdxVIWi24tPwKQeKuJeV8hAC7mJ4WQODVpnmgcIdmFBH+SgdNYuPpXudl/UtpXTkU
         F3e46Bp43D8z+ohKsY1yC57lL4ypO+MdTqq3TxADFT8X6Z3ji6btxaL5m1AxkB8VnUUI
         v1eWtpIjFHrQ0pO6M09tor6m+wTxs8VMOEAysiU49+wYg3R7KRje6KzUip/3ZwygFoBx
         flJxuKkkiMcTaOTrQgp/vUxAQagNErcL2qmE4CAKvXbgvnyIYvTDAxtezxLp0KwmYif3
         WeRAzBrAXXEDdGEnQaMkb6BrNGWzeXHc2oiGcjF1wqoOKFW0t6yo2n6iBLuphnXzLz3m
         tT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754230059; x=1754834859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzN7qn/y0iYwP/aeVo8H8FbGk6Rq9qUZdl4rPLj5kjY=;
        b=F1mMi6SypsMkKbFncHB6IKVris13dCAuwS/rfMKrH7hLQOIrOWFQVoKA7mwD3VSjq2
         ngaryMLcYIBsTuPbfZxOmvP9ZsWvtL0N4hTowzQVH1DVBvtwWqypal/Y8QBTNbUmgp+Q
         KigROkyLRKzkvUXn5jLOUSR/j0M0JPJg70f9pXVxKRl6PFXbPITB/qX9If3fjG/Np8PD
         kj9Ymh8xi+W1EJH89qldj8cgzqiEt7e1WMKf1ia7ac63w0O+6mPU+MzmIWJsB2lJUTv+
         NmAlF5CmzzF4inIpUiOubIZJOlBFsULvBfXKDwfc6kwh9mvf0/pmHfiG3fW0wW1YmjAJ
         bciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb+wYuyXxXRDUTzqeloZDAHiX40RopyOXGumhPWcVcx3w3BMulVezh090NL3DXlDKa5gEi2nyhkyya+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyukw9gyEEQpSPuc+Q2bit9bWt5RaQXOkIGMGhMjLe7pQGZFkit
	60Nwm1pyG1MMJt/SxUySBUqRS4nEy+IpC0Z79lE3+9AwvpafrgRsNkOhq0LskjO3VTg7SKJEzRc
	lQxFHcVPeAvdn/jLfcX5uSzC994Gior9OIEymxjAKZQ==
X-Gm-Gg: ASbGncv38/5VdRp6totgAHd1lFD1r6BZnq18WsvMca5PbPHCibzLFIhbcD5b8A4zwD5
	MCgEe3mJS2YIsoX3mLz/VQXfZ1MlowBbkVkxs3P6mY3rgfAEasO2bCk+1At6TP+FZyNv5NH9aoi
	it3JZDi9EAEurOk0eG+4uF1gldP1XzWgj4O89Uj7ZV3U6WCPzHfo/m41kA/INi9ms/kRD9G3v52
	K2HbQQj
X-Google-Smtp-Source: AGHT+IGI01nt/5ajRIEd/g/MYYkHAENe8uTVuWwKi9fXBY6lvrfHdbPFp85gGg1wpDr38Z4dWnZtmPTXqXWXRm4y5Hw=
X-Received: by 2002:a2e:b750:0:b0:32f:1c10:fa with SMTP id 38308e7fff4ca-332567e1fbfmr14536171fa.28.1754230058857;
 Sun, 03 Aug 2025 07:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250728094032.63545-1-apatel@ventanamicro.com>
 <20250728094032.63545-3-apatel@ventanamicro.com> <612a13d3-d3a6-460b-90fd-c26e47b80711@sifive.com>
In-Reply-To: <612a13d3-d3a6-460b-90fd-c26e47b80711@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 3 Aug 2025 19:37:27 +0530
X-Gm-Features: Ac12FXxM6lZVHsF2fkqmflt_uD2kktQDD8J5muF5ctWK04jd5MRevT31V0qlm18
Message-ID: <CAK9=C2Vaf5wuHW3db97TKJBQd7RjOng1mTGXZmoswJh3XxMNiw@mail.gmail.com>
Subject: Re: [PATCH v9 02/24] dt-bindings: mailbox: Add bindings for RISC-V
 SBI MPXY extension
To: Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_070741_276935_6820BBFF 
X-CRM114-Status: GOOD (  25.54  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBBdWcgMiwgMjAyNSBhdCA5OjQy4oCvQU0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjUtMDctMjgg
NDo0MCBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBm
b3IgdGhlIFJJU0MtViBTQkkgTWVzc2FnZSBQcm94eSAoTVBYWSkKPiA+IGV4dGVuc2lvbiBhcyBh
IG1haWxib3ggY29udHJvbGxlci4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL21haWxi
b3gvcmlzY3Ysc2JpLW1weHktbWJveC55YW1sIHwgNTEgKysrKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L3Jpc2N2LHNiaS1tcHh5
LW1ib3gueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWFpbGJveC9yaXNjdixzYmktbXB4eS1tYm94LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9yaXNjdixzYmktbXB4eS1tYm94LnlhbWwKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjA2MTQzN2EwYjQ1
YQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21haWxib3gvcmlzY3Ysc2JpLW1weHktbWJveC55YW1sCj4gPiBAQCAtMCwwICsxLDUx
IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9tYWlsYm94L3Jpc2N2LHNiaS1tcHh5LW1ib3gueWFtbCMKPiA+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+
ICsKPiA+ICt0aXRsZTogUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBleHRlbnNpb24g
YmFzZWQgbWFpbGJveAo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBU
aGUgUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBleHRlbnNpb24gWzFdIGFsbG93cyBz
dXBlcnZpc29yCj4gPiArICBzb2Z0d2FyZSB0byBzZW5kIG1lc3NhZ2VzIHRocm91Z2ggdGhlIFNC
SSBpbXBsZW1lbnRhdGlvbiAoTS1tb2RlCj4gPiArICBmaXJtd2FyZSBvciBIUy1tb2RlIGh5cGVy
dmlzb3IpLiBUaGUgdW5kZXJseWluZyBtZXNzYWdlIHByb3RvY29sCj4gPiArICBhbmQgbWVzc2Fn
ZSBmb3JtYXQgdXNlZCBieSB0aGUgc3VwZXJ2aXNvciBzb2Z0d2FyZSBjb3VsZCBiZSBzb21lCj4g
PiArICBvdGhlciBzdGFuZGFyZCBwcm90b2NvbCBjb21wYXRpYmxlIHdpdGggdGhlIFNCSSBNUFhZ
IGV4dGVuc2lvbgo+ID4gKyAgKHN1Y2ggYXMgUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50
ZXJmYWNlIChSUE1JKSBbMl0pLgo+ID4gKwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+ID4gKyAgUmVmZXJlbmNlcwo+ID4gKyAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gKyAgWzFdIFJJU0MtViBT
dXBlcnZpc29yIEJpbmFyeSBJbnRlcmZhY2UgKFNCSSkgdjMuMCAob3IgaGlnaGVyKQo+ID4gKyAg
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFz
ZXMKPiA+ICsKPiA+ICsgIFsyXSBSSVNDLVYgUGxhdGZvcm0gTWFuYWdlbWVudCBJbnRlcmZhY2Ug
KFJQTUkpIHYxLjAgKG9yIGhpZ2hlcikKPiA+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1ycG1pL3JlbGVhc2VzCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+
ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGNvbnN0OiByaXNjdixzYmktbXB4eS1tYm94Cj4gPiAr
Cj4gPiArICAiI21ib3gtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMgo+ID4gKyAgICBkZXNjcmlw
dGlvbjoKPiA+ICsgICAgICBUaGUgZmlyc3QgY2VsbCBzcGVjaWZpZXMgY2hhbm5lbF9pZCBvZiB0
aGUgU0JJIE1QWFkgY2hhbm5lbCwKPiA+ICsgICAgICB0aGUgc2Vjb25kIGNlbGwgc3BlY2lmaWVz
IE1TR19QUk9UX0lEIG9mIHRoZSBTQkkgTVBYWSBjaGFubmVsCj4KPiBXaGF0IGlzIHRoZSBwdXJw
b3NlIG9mIHRoZSBzZWNvbmQgbWFpbGJveCBjZWxsPwo+Cj4gVGhlIGNsaWVudCBjYW4gcHJvYmUg
dGhlIG1lc3NhZ2UgcHJvdG9jb2wgdXNpbmcgYSBTQkkgY2FsbCwgaWYgaXQgZG9lc24ndCBqdXN0
Cj4gYXNzdW1lIGEgcHJvdG9jb2wgYmFzZWQgb24gdGhlIGtpbmQgb2Ygbm9kZSB0aGF0IHJlZmVy
ZW5jZXMgdGhpcyBtYWlsYm94LiBUaGUKPiBTQkkgaW1wbGVtZW50YXRpb24ga25vd3MgdGhlIG1l
c3NhZ2UgcHJvdG9jb2wgZnJvbSB0aGUga2luZCBvZiBub2RlIHRoYXQKPiBpbnN0YW50aWF0ZXMg
dGhlIGNoYW5uZWwgKGZvciBleGFtcGxlIHJpc2N2LHJwbWktbXB4eS1jbG9jayBoYXMKPiByaXNj
dixzYmktbXB4eS1jaGFubmVsLWlkKS4gU28gdGhpcyBjZWxsIGxvb2tzIHJlZHVuZGFudC4KCkl0
IGlzIHRoZSBTQkkgTVBYWSBtYWlsYm94IGNvbnRyb2xsZXIgZHJpdmVyIHdoaWNoIGRvZXMgU0JJ
IGNhbGxzCmFuZCBub3QgdGhlIFJQTUkgY2xpZW50IGRyaXZlci4gVGhlIFJQTUkgY2xpZW50IGRy
aXZlciAoZm9yIGV4YW1wbGUKUlBNSSBjbG9jayBkcml2ZXIpIG9ubHkgeGZlciBSUE1JIG1lc3Nh
Z2VzIHNvIGl0IG9ubHkgbmVlZHMgbWFpbGJveApjaGFubmVscyBib3VuZCB0byBSUE1JIHByb3Rv
Y29sLiBUaGlzIHdheSBzYW1lIFJQTUkgY2xpZW50IGRyaXZlcgp3aWxsIHdvcmsgZm9yIGJvdGgg
U0JJIE1QWFkgbWFpbGJveCBjb250cm9sbGVyIGRyaXZlciBhbmQgUlBNSSBzaGFyZWQKbWVtb3J5
IG1haWxib3ggY29udHJvbGxlciBkcml2ZXIuCihOT1RFOiBSUE1JIHNoYXJlZCBtZW1vcnkgbWFp
bGJveCBjb250cm9sbGVyIGRyaXZlciBpcyBjdXJyZW50bHkKbm90IGF2YWlsYWJsZSBmb3IgTGlu
dXguKQoKVGhlIFNCSSBNUFhZIG1haWxib3ggY29udHJvbGxlciBkcml2ZXIgcHJvdmlkZXMgbWFp
bGJveCBjaGFubmVscwpmb3IgUlBNSSBwcm90b2NvbCBhbmQgb3RoZXIgY3VzdG9tIG1lc3NhZ2Ug
cHJvdG9jb2xzIGFzIHdlbGwgc28KaWYgYSBSUE1JIG1haWxib3ggY2xpZW50IHJlcXVlc3QgYSBt
YWlsYm94IGNoYW5uZWwgYm91bmQgdG8gc29tZQpvdGhlciBwcm90b2NvbCB0aGVuIHN1Y2ggYSBt
YWlsYm94IGNoYW5uZWwgcmVxdWVzdCBzaG91bGQgZmFpbC4gVG8KYWNoaWV2ZSB0aGlzLCB3ZSBo
YXZlIGEgc2Vjb25kIG1haWxib3ggY2VsbCBmb3IgbWFpbGJveCBjaGFubmVscwpwcm92aWRlZCBi
eSBTQkkgTVBYWSBtYWlsYm94IGNvbnRyb2xsZXIgZHJpdmVyIHdoaWNoIHNwZWNpZmllcyB0aGUK
ZXhwZWN0ZWQgbWVzc2FnZSBwcm90b2NvbCBJRCBmb3IgdGhlIG1haWxib3ggY2hhbm5lbC4KCk9u
IG90aGVyIGhhbmQsIHRoZSBSUE1JIHNoYXJlZCBtZW1vcnkgbWFpbGJveCBjb250cm9sbGVyIGRy
aXZlcgp3aWxsIG9ubHkgcHJvdmlkZSBtYWlsYm94IGNoYW5uZWxzIGJvdW5kIHRvIFJQTUkgcHJv
dG9jb2wgYW5kCm5vdCBhbnkgb3RoZXIgbWVzc2FnZSBwcm90b2NvbCBzbyBmb3Igc3VjaCBtYWls
Ym94IGNoYW5uZWxzIHdlCm9ubHkgbmVlZCBvbmUgbWFpbGJveCBjZWxsIHdoaWNoIHNwZWNpZmll
cyB0aGUgc2VydmljZSBncm91cCBJRC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
