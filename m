Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BB5C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvYawqXi3gHiw/+BlewcLp/Sb3SckIaf8DI+/NqVC0Q=; b=PKxMzC4aBe7ZBn
	P90W2xF2vltB7ImRWdy8XLZBoQuUFh9vd5fpuSji4dmJDTpUjxN4FcMCp/kYWUJ2ii6eli2Gz6WGr
	9koAtctCcc/iV3rsYo5y0POKG3ynodTx3PWojzyh8/2NcDtP1xBuOipxa3lYk49xKEFfF3RcsUP97
	3mkpjJIK0fsCJB4eGpxW4UM/DV+Bmw/y34yzmkTbpA7x1bewkpdLVDBFm18OZ27bBM+DGlppDfnFO
	+s1rTr4zPpWf/27nnN1dAcRcNyGjh4NHtp/3PGmuNHP+Xz5VMjVpUX2Sv6Hcg5kmfaaXycgD75qKh
	10/PSk9ZT4vs28vOtjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL9f-0000000ACoU-1WbH;
	Fri, 25 Jul 2025 16:20:19 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL5u-0000000AC45-3lR0
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:16:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32e14cf205cso22264061fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753460184; x=1754064984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOo595UD81PW4Cz1UFmTlajy9wRb7dyhybVVNSTeWD4=;
        b=HqTPqEksDjQDSYgjKBlljj6/8N6O446A6Xiu6DQ3Un+tGOIDMLnb7oIJNhopgAFxkp
         UNjFDp+8LRrwMb29XgIU0GkIkPvpES+WBqdLqo8Fevp8w3JIwSOZyr0kB3yQgxxnB02M
         UIRz7gQoBTsRbNZatUhotZvDVliAyirPUmyn8e78VOYNm+3Fx2xukTVSuD/vP/Eb4Rb+
         YZ/kk6fdTjrEowuYhmFdsJhcjiOO/zPobGeZJxWqaJU1dIHkQNe6pzkxfauYbu2N52G4
         KbzM3ySYaC+1l/g/kMDvcqyxNv+6eM8c3Qp40HgYLrN5GqopW/8VqOvNMBrcAnyyjsm3
         hnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460184; x=1754064984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOo595UD81PW4Cz1UFmTlajy9wRb7dyhybVVNSTeWD4=;
        b=MC+2PUS7c36SugzLRS4SrSYRbAIvl/M6H4P/gkhYbonTv+r5mb6llsB17qniAlGFEm
         GjzPMZ6N0EzTBUZ4rH25cxqRxERLz4cejkO3bMp8OqampxVJHTiIje9GqxrJYuAFRIqU
         NSPglFeKcNkR4zuDa8SX1IrbA2vnImgmL7eOOX0mPftRjfWzq6Qn/noFcf8VA6xJyoD0
         W2yqAjZyWJ2pA5spi+Y4/mWKLFnDLfJjyrjP+VeF3OMU3VD7A4KbzVH/ysE7Y5JQwGEE
         /j+aj/LCTyGJmExLh5f5xzf0oit7neThrnfVwt1+UQiDB6Qv6AvC7VEVaqv/Y7EE9zwQ
         3q2w==
X-Forwarded-Encrypted: i=1; AJvYcCW91hYIdyAYhjwYI3fskl+4QdgXmTDLZ6bda+KfvkTpOoaa32kYtgQMCHumcTrDtcf9UesnYsLWnX81Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7dfmZMLuoFDM2WHBrU/6gl2rAILq7S7PpIlGKQu3ngEtq9giB
	m+uiiLj/DZ2lOsebaU8ETPy+NW9ZeXTap3aUsARZczqHRCQKTumcBaDX53znm60Nyr9NEPvUHdb
	CoPPX0YG0j3auka5YJ1dA7PN3bHVUoYRsEmTjuew5Vg==
X-Gm-Gg: ASbGncvAhMIXslUhNa26hqz+8yIuqge3pRGKRqtgz7+07Lu7IsKFjFuiUcC7ZYXJekn
	Uw6qYoc1I4mv1pv9dlAsb1zA0HRxB7QRVL3/LRz97a2hKXCyFnGkkb93zJ8ro2CAEB84x9O5KQ9
	SPiK9SlMu34Q6mQu7jOFHioaN+SVmDFsxf1VHtxNiondLlXvSOVitUsRbltmVvbokp3NxUrHZEH
	4VVAUc=
X-Google-Smtp-Source: AGHT+IFIuUIEQS0zyr6rBam/nD3H+hqGiiProGvcAqPkV/NrJ9CSjPmlKsQWWtSCr8nBHng2+tmatocM0hZ4PbG8CJs=
X-Received: by 2002:a05:651c:1503:b0:32b:5672:41fb with SMTP id
 38308e7fff4ca-331ee74cc42mr12092821fa.19.1753460184460; Fri, 25 Jul 2025
 09:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor>
In-Reply-To: <175341132347.3513.7184287611040628050@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 25 Jul 2025 21:46:12 +0530
X-Gm-Features: Ac12FXyJjR2ZAcC8iSDmp338bf2ZOm1s9QD7gpAd84fmChTRX_UPxaRyR5VVtyQ
Message-ID: <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_091626_937074_04DEE5B2 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgODoxMuKAr0FNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBRdW90aW5nIEFudXAgUGF0ZWwgKDIwMjUtMDctMDQgMDA6MDM6
NDApCj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBSUE1JIGNsb2NrIHNlcnZp
Y2UgZ3JvdXAgYmFzZWQKPiA+IG1lc3NhZ2UgcHJveHkgaW1wbGVtZW50ZWQgYnkgdGhlIFNCSSBp
bXBsZW1lbnRhdGlvbiAobWFjaGluZSBtb2RlCj4gPiBmaXJtd2FyZSBvciBoeXBlcnZpc29yKS4K
PiA+Cj4gPiBUaGUgUlBNSSBjbG9jayBzZXJ2aWNlIGdyb3VwIGlzIGRlZmluZWQgYnkgdGhlIFJJ
U0MtViBwbGF0Zm9ybQo+ID4gbWFuYWdlbWVudCBpbnRlcmZhY2UgKFJQTUkpIHNwZWNpZmljYXRp
b24uCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1p
Y3JvLmNvbT4KPiBbLi4uXQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+
ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIGNsb2NrLWNvbnRyb2xsZXIgewo+Cj4g
TWF5YmUgdGhlIG5hbWUgc2hvdWxkIGJlICdjbG9jay1zZXJ2aWNlJyB0aGVuPyBJIGRvbid0IHVu
ZGVyc3RhbmQgU0JJIHNvCj4gbm90IHN1cmUgd2h5IHRoaXMgaXMgaW4gRFQgdG8gYmVnaW4gd2l0
aC4gSXMgc29tZXRoaW5nIGNvbnN1bWluZyB0aGlzCj4gbm9kZT8gT3IgYSBkcml2ZXIgaXMgYmlu
ZGluZyB0byBpdD8KClNCSSBpcyBhIHN5c2NhbGwgc3R5bGUgaW50ZXJmYWNlIGJldHdlZW4gU0JJ
IGltcGxlbWVudGF0aW9uIChha2EKTS1tb2RlIGZpcm13YXJlIG9yIGh5cGVydmlzb3IpIGFuZCBz
dXBlcnZpc29yIHNvZnR3YXJlIChha2EKTGludXgga2VybmVsKS4KCldlIGhhdmUgRFQgYmFzZWQg
ZHJpdmVycyBpbiBPcGVuU0JJIChNLW1vZGUgZmlybXdhcmUpLiBUaGlzCmJpbmRpbmcgYWxsb3dz
IENsb2NrIG1lc3NhZ2UgcHJveHkgZHJpdmVyIHRvIGJlIHByb2JlZCBvbiB0aGUKT3BlblNCSSBz
aWRlLiBUaGUgY2xvY2sgbWVzc2FnZSBwcm94eSBkcml2ZXIgYWxsb3dzIExpbnV4ClJQTUkgY2xv
Y2sgZHJpdmVyIHRvIHNlbmQgUlBNSSBtZXNzYWdlcyB2aWEgT3BlblNCSSBhcwpwcm94eSB0aGVy
ZWJ5IHNoYXJpbmcgdGhlIFJQTUkgdHJhbnNwb3J0IGJldHdlZW4gT3BlblNCSQphbmQgTGludXgg
a2VybmVsLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
