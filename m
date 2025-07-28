Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FDFC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4o8BBidSyHB/OCplq0WB9uJpRLqxsDTaYZMz2OE2f9Q=; b=v1FSPkRTBVTnjH
	D1TytKANgvaAnRT1RxS8CljEIsHBXlwikzUeogKNkJbazL91koCuEXMSYMAQu4F4LRfCIpqvYgI/0
	obavIFa6YBi0Q6Z8tcVyF08QdvnSk8wH27yDfjmqNwZ0UZ7MCn/hTdkZ11V3Ax9E47p/Qe9Xx09Mt
	jlXnjqHqvEhtzuZjQIhevN1wydqUCBlqQYhxVXTyfDkAcJmHGOtG5HCkY/KzPJEV62diK0WUan57G
	y99r1XcaZklaIfjW8pbCMNTfQ0V0+xBhJSjLLrL483vHfVtu1pcMKIbK2a2xB6Up3Mk+cMhjKlsc8
	+YlgvFomVTmwfKAgslEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK1F-0000000E5Uy-2AL0;
	Mon, 28 Jul 2025 09:19:41 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK1C-0000000E5UD-3LLi
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:19:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553d771435fso4309694e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753694376; x=1754299176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5Wfr6IDv5PxwXwO5SalQp0PsuBKS/k9qem5YR1Q0PY=;
        b=ARqDIKDpEh28GOrQYphFAae+1jnBp5s0XJWx4MxI3vTDrzqd/MYrnC1z0ZI7QABLUs
         S3Zqtm2ibDNzzMPiBSLa2H1NviSK9rhIupJCyEWq0sceFsQxGGUr/g8mTqt1mulRGzXp
         /pj4tEicQKkK0Yij+7lMrt/UMrin6Gb+FIj4AidWL7I75LdQdQ4t++5BB1VAqN/M1Ek6
         oY2ooBFpdLdcEiD2vjq2Jxmo8M3rMvrOHvP9CKzpjztt4tyyD2FX3ZNT4maX8fHWm7fS
         1I5rBZ/WMg+PAu0c2N79aSe5ToXkuoO4evjcvXyQmpyXW7I0WUUUCGfjYc/mEsvFDCsO
         7/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694376; x=1754299176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Wfr6IDv5PxwXwO5SalQp0PsuBKS/k9qem5YR1Q0PY=;
        b=bobofD4oB6Wxk6YqNSJ5OYTgcnq3ufCuxTp+7TrlKnj5r2lCQhQU64ZE8IrEVQCq6K
         PoyIldfObrwYDVIw45iKaFW7p0AnbUPoMpwsZkEnUXe7LmZVbpFB1AgZKD3yX/8Py1t7
         KpWZSGBg1fHSlLHsw4ab0ncrLV66MSB4nc8tVmJ8AYjx/bXzBU1i0dDB1xPkuKVZcSAV
         NcD2tCYycUfbiRnTANQZfUoQgBbXswQahEBGiZtdZ3Bt5y0F/KoJj/pnBMHyhiki0cSf
         y6/82NvPGGjY3mI098vfjVGteEbDyU+hF6XzvrIOEBVDQS2/Bsz8GrhoNfoV1i8q98hs
         mUeg==
X-Forwarded-Encrypted: i=1; AJvYcCWe+VncFm0oyetUQxtAfkYThd/MMNVux25EBazp5SB7or1K6H4177rp2iDloFpa0FTxA4kPZ7nc/x3V6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyedo/8H7whinn+EAPx+Gb5xl8derx5/aQ9HoQrD5qKdK2lSfoq
	V2kbSYj9N115SZv6PqpW+A79+aoU3yLCWDzpxMek/epy/+LRAuyQI2KYrREHrQRhuCAqOHrJX6l
	ScbI80NDQO0bo+PMxBKlyFcVeBXImdkfROJ2Vt9JkcA==
X-Gm-Gg: ASbGncvgsHzXwa4m946Zk/JD3zytGZYJ5Tj5LFBTjXEQT2YOVL/lxBlpKB0KdaJJ49G
	jpq/Gz+lVAEtaJDpN23VfxnaI0CL2zxCIKcd/fv8vmWkN0XbzI3W8Sqj+TvGsRLjORI6sJgXtX7
	mg1TGOsLC2iH47+7vD/710Mz+bPGa35/4DIWjGwx2M6vvcei2u67ZVBtTC2EcBKwErjjkO1q3k0
	Z7L3Ec=
X-Google-Smtp-Source: AGHT+IE+L8kojs9dsw3C6rCUb7FSCgckOs2Jkf9bqhFZnlMh8FPpWpEIQvGXcm9tMwdZmOjR+SBZh5eXeLrR0pntl+w=
X-Received: by 2002:ac2:51d2:0:b0:55b:5ad8:186d with SMTP id
 2adb3069b0e04-55b5f4bbd79mr2861674e87.37.1753694376329; Mon, 28 Jul 2025
 02:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor>
 <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com> <175359739515.3513.8664828076215459722@lazor>
In-Reply-To: <175359739515.3513.8664828076215459722@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Jul 2025 14:49:23 +0530
X-Gm-Features: Ac12FXzCp3IP9jRK5qLB49tEzZkZnvv77-g8d-wAPrlIzxfNVRivXQcgZVb8d84
Message-ID: <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_021938_841712_24EE7045 
X-CRM114-Status: GOOD (  25.22  )
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
Cc: linux-acp <i@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMjcsIDIwMjUgYXQgMTE6NTPigK9BTSBTdGVwaGVuIEJveWQgPHNib3lkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBBbnVwIFBhdGVsICgyMDI1LTA3LTI1IDA5OjE2
OjEyKQo+ID4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgODoxMuKAr0FNIFN0ZXBoZW4gQm95ZCA8
c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFF1b3RpbmcgQW51cCBQYXRlbCAo
MjAyNS0wNy0wNCAwMDowMzo0MCkKPiA+ID4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBSUE1JIGNsb2NrIHNlcnZpY2UgZ3JvdXAgYmFzZWQKPiA+ID4gPiBtZXNzYWdlIHByb3h5
IGltcGxlbWVudGVkIGJ5IHRoZSBTQkkgaW1wbGVtZW50YXRpb24gKG1hY2hpbmUgbW9kZQo+ID4g
PiA+IGZpcm13YXJlIG9yIGh5cGVydmlzb3IpLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIFJQTUkgY2xv
Y2sgc2VydmljZSBncm91cCBpcyBkZWZpbmVkIGJ5IHRoZSBSSVNDLVYgcGxhdGZvcm0KPiA+ID4g
PiBtYW5hZ2VtZW50IGludGVyZmFjZSAoUlBNSSkgc3BlY2lmaWNhdGlvbi4KPiA+ID4gPgo+ID4g
PiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPgo+ID4gPiBbLi4uXQo+ID4gPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+
ID4gPiArCj4gPiA+ID4gK2V4YW1wbGVzOgo+ID4gPiA+ICsgIC0gfAo+ID4gPiA+ICsgICAgY2xv
Y2stY29udHJvbGxlciB7Cj4gPiA+Cj4gPiA+IE1heWJlIHRoZSBuYW1lIHNob3VsZCBiZSAnY2xv
Y2stc2VydmljZScgdGhlbj8gSSBkb24ndCB1bmRlcnN0YW5kIFNCSSBzbwo+ID4gPiBub3Qgc3Vy
ZSB3aHkgdGhpcyBpcyBpbiBEVCB0byBiZWdpbiB3aXRoLiBJcyBzb21ldGhpbmcgY29uc3VtaW5n
IHRoaXMKPiA+ID4gbm9kZT8gT3IgYSBkcml2ZXIgaXMgYmluZGluZyB0byBpdD8KPiA+Cj4gPiBT
QkkgaXMgYSBzeXNjYWxsIHN0eWxlIGludGVyZmFjZSBiZXR3ZWVuIFNCSSBpbXBsZW1lbnRhdGlv
biAoYWthCj4gPiBNLW1vZGUgZmlybXdhcmUgb3IgaHlwZXJ2aXNvcikgYW5kIHN1cGVydmlzb3Ig
c29mdHdhcmUgKGFrYQo+ID4gTGludXgga2VybmVsKS4KPiA+Cj4gPiBXZSBoYXZlIERUIGJhc2Vk
IGRyaXZlcnMgaW4gT3BlblNCSSAoTS1tb2RlIGZpcm13YXJlKS4gVGhpcwo+ID4gYmluZGluZyBh
bGxvd3MgQ2xvY2sgbWVzc2FnZSBwcm94eSBkcml2ZXIgdG8gYmUgcHJvYmVkIG9uIHRoZQo+ID4g
T3BlblNCSSBzaWRlLiBUaGUgY2xvY2sgbWVzc2FnZSBwcm94eSBkcml2ZXIgYWxsb3dzIExpbnV4
Cj4gPiBSUE1JIGNsb2NrIGRyaXZlciB0byBzZW5kIFJQTUkgbWVzc2FnZXMgdmlhIE9wZW5TQkkg
YXMKPiA+IHByb3h5IHRoZXJlYnkgc2hhcmluZyB0aGUgUlBNSSB0cmFuc3BvcnQgYmV0d2VlbiBP
cGVuU0JJCj4gPiBhbmQgTGludXgga2VybmVsLgo+Cj4gTGV0IG1lIHRyeSB0byBjbGFyaWZ5IG15
IGNvbmZ1c2lvbi4gQSAnY2xvY2stY29udHJvbGxlcicgbm9kZSB3aXRob3V0IGEKPiAnI2Nsb2Nr
LWNlbGxzJyBwcm9wZXJ0eSBpcyBjb25mdXNpbmcuCgpBaGgsIEkgc2VlIHlvdXIgcG9pbnQuIFRo
ZSBub2RlIG5hbWUgbmVlZCBub3QgYmUgJ2Nsb2NrLWNvbnRyb2xsZXInCnNpbmNlIHRoZSBub2Rl
IGlzIGZvciBhIGZpcm13YXJlIGRyaXZlciB3aGljaCBwcm92aWRlcyBNUFhZIGNoYW5uZWwKdG8g
c3VwZXJ2aXNvciBzb2Z0d2FyZSAoYWthIExpbnV4IGtlcm5lbCkuCgo+Cj4gSXQncyBub3QgcHJv
dmlkaW5nIGNsa3M/IFRoZSBTQkkgZmlybXdhcmUgaXMgbm90IGRpc2NvdmVyYWJsZT8gRG8geW91
Cj4gaGF2ZSBhIHBvaW50ZXIgdG8gdGhlIERUUyBmb3IgdGhpcyBub2RlIGFuZCB0aGUgY2xvY2sg
Y29udHJvbGxlciBub2RlIGluCj4gdGhlIG5leHQgcGF0Y2g/IEknZCBsaWtlIHRvIHVuZGVyc3Rh
bmQgd2h5IHRoaXMgaXMgbmFtZWQgYSBjbG9jawo+IGNvbnRyb2xsZXIgd2hlbiBpdCBkb2Vzbid0
IHByb3ZpZGUgY2xrcy4KClRoZSBmaXJtd2FyZSBkcml2ZXIgaXMgbm90IHByb3ZpZGluZyBjbGtz
LiBBbHNvLCB0aGUgU0JJIGZpcm13YXJlIGFuZAp2YXJpb3VzIFNCSSBleHRlbnNpb25zIGFyZSBp
bmRlZWQgZGlzY292ZXJhYmxlIGZyb20gc3VwZXJ2aXNvciBzb2Z0d2FyZS4KCk9uIHRoZSBMaW51
eCBzaWRlLCB3ZSBoYXZlIHR3byBEVCBub2RlczoKMSkgT25lIERUIG5vZGUgZm9yIHRoZSBTQkkg
TVBYWSBiYXNlZCBtYWlsYm94LWNvbnRyb2xsZXIKICAgIChSZWZlciwgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNzA0MDcwMzU2LjE2ODM5OTItMy1hcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbS8pCjIpIFNlY29uZCBEVCBub2RlIGZvciB0aGUgY2xvY2stY29udHJvbGxlciBiYXNlZCBv
biB0aGUKICAgIFJQTUkgY2xvY2sgc2VydmljZSBncm91cC4KICAgIChSZWZlciwgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNzA0MDcwMzU2LjE2ODM5OTItMTAtYXBhdGVsQHZlbnRh
bmFtaWNyby5jb20vKQoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
