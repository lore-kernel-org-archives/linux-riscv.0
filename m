Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CAC7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uqy+yU6cjQPbD0htXrry6TzMw+sDI40eZa2Rcc5ZegM=; b=mmR+s8yVh/q61y
	rkea+cBRSazChUtUyz6l9MiZ3YLSo2QLMJ9D3QFxhkwi2uOGO/2CdXjU5DbmIvNL1Dg7FldqXa8Q/
	xW36svZ7/wXlx48UMvZ5Bb5LAJz17F7meMPRA/KIi2XRkBM1ynCmcYLmrI3fsh97mIQphXc/uKvuw
	wgXK7fARmdydKp/rDA5GsjRBY4sfqUTPR9+gQCm7SNBDXqshUFHi2ezssTJlmvI4x2s8CKyZe0/Xm
	oAs7X1eNF1Q3GviGxdzmGuSwnVLI4aTtPA5hUWqTUxBuhb9sl5GfPtGpcbeaHyzOd50HCmcaTWZHY
	6ghR3b/Mf58tslHZVFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTY8N-00000001W67-3bg5;
	Mon, 23 Jun 2025 03:46:15 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTY8K-00000001W4V-3U3u
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 03:46:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553d52cb80dso3915133e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 20:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750650370; x=1751255170; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=oFcu8SZCXMGg3uhw0d0WEaJtz1CLfl9tx2Ph/N9wZKN7Q6YJy/WJSOSkoAt3AggORW
         3lODnpOrg17Hm1oDD/jHVz+sQ3jROCkFC1SW9kiJ7ldfVHoeYqdR5cVNovBWV3nwwnbf
         rPDqEL8933d7JQKeKQjpQGCsE+FfJ9gN/o7lYqBLpofxe01CO6eFIf9uesTljlubas5w
         5Dyec9gvxZf3cjEs4FOZtNy1x4sr8MwyRd5tjdpIdNRWPnEW5VQHg8efzjTxUUMZUvDb
         c9d/pkHZJZZxpqcWb1sGUIEIzfLiJZwCcA0uG9C0B0GOQt2uvD6lhqhP+C/xP2YxIof4
         tGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750650370; x=1751255170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=dd6qxkWuRYPA+enh3VObIjxqJl0E50Iv5lh7dg4+HtZvj7zehQR94tiWionhQ/SOxy
         NtBqRnoIyHONQPTms/QfUFSPdYkPLJukErm9w0t4e3muyt0+m964D10DuNqyEp/3TRN9
         u2/befej1hYcZTPL9ednDAQPP9sE/wk/iZ4r9rRe+9sNG0SwgIjoBbXnMXWxRTL8TLek
         GMIJJWaeBh/cU+kIwlzu3IaK/baqioZxtCTB42CQUL5eHsyt8iCAw/3Pv1UXTkre1aYn
         CZ51pT8VDD2yzx8Wbv6+/lKg8jEkys6vefxtehdQOacFHGuo7BdlZuBpNlZsYy0vww4Y
         PtDw==
X-Forwarded-Encrypted: i=1; AJvYcCXCK4gQwWg+dh06Lm69WIW48JvWyYi6Td6ugxrisf9vKMHgM2PREqn3kWWqTKMaNI1zGmRA0sXrVsXEUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykSTXFKlOl5oEMOHImQ0XX1P3VzITdLhbjBXwawyeoUkNkZ0c9
	SAX9LJiWFRGsd21zGIr9JJBhVlAVNFOM8qR4AKNThJ0khN6DU8YELZqdsBzfqyAq7yrI5+Z3s0l
	ZbEOlV8ZBxLSUbnPDpl9guUQyi59N2Rvftw41ynwGXg==
X-Gm-Gg: ASbGnctPPAq9Kc92+IQqETdTOSvCXC4u6HDnSScmDQUrdEtwybqYT0wCo8gVmF9ygXx
	YTuXwM3PCFsZ5E4AMC9HBr6T9CLd5l4diNzXHcfF1xR15hhyCFr5GAr/hymnCoe7nT0BUILjGF/
	0zmIVScbCD8Wdc2h6XXsLXdRGGeCA0uffLHjSDDDecJLPUoIf6vGty0A==
X-Google-Smtp-Source: AGHT+IE0Jkesv6pAtTAvnI4YAZPll7TdweNoY+w50jD3bpHSeBhHHCGGisCxbc8QIYILMjmd8O72zuctCezkc0bAqvQ=
X-Received: by 2002:a05:6512:a8e:b0:552:21b9:8bae with SMTP id
 2adb3069b0e04-553e4fe12c4mr3138959e87.7.1750650370384; Sun, 22 Jun 2025
 20:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-8-apatel@ventanamicro.com> <175053960304.4372.5933123695583752824@lazor>
In-Reply-To: <175053960304.4372.5933123695583752824@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Jun 2025 09:15:59 +0530
X-Gm-Features: AX0GCFvKul9rLlA0ewcROor8dZBLyfCt2SyRm-GbcQtvCrJAULk_IJwmPLxWSvQ
Message-ID: <CAK9=C2WutH5+3eNvMpD89WhXdNaJAJVz=h5r6c_Jc39nBx9NEw@mail.gmail.com>
Subject: Re: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_204612_868872_15A09614 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gMjIsIDIwMjUgYXQgMjozMOKAr0FNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBRdW90aW5nIEFudXAgUGF0ZWwgKDIwMjUtMDYtMTggMDU6MTM6
NDIpCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL3Jpc2N2LHJwbWktbXB4eS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL3Jpc2N2LHJwbWktbXB4eS1jbG9jay55YW1sCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi43MGZmYzg4ZDAxMTAKPiA+IC0tLSAv
ZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9yaXNjdixycG1pLW1weHktY2xvY2sueWFtbAo+ID4gQEAgLTAsMCArMSw2NCBAQAo+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+
ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvY2xvY2svcmlzY3YscnBtaS1tcHh5LWNsb2NrLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gWy4uLl0K
PiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBjbG9jay1jb250cm9sbGVy
IHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1tcHh5LWNsb2NrIjsKPiA+
ICsgICAgICAgIG1ib3hlcyA9IDwmcnBtaV9zaG1lbV9tYm94IDB4OD47Cj4gPiArICAgICAgICBy
aXNjdixzYmktbXB4eS1jaGFubmVsLWlkID0gPDB4MTAwMD47Cj4KPiBXaHkgYXJlbid0IHRoZXJl
IGFueSAjY2xvY2stY2VsbHMgaW4gdGhpcyBjbG9jayBjb250cm9sbGVyIG5vZGU/CgpUaGlzIGJp
bmRpbmcgaXMgaW50ZW5kZWQgZm9yIE0tbW9kZSBmaXJtd2FyZSAoT3BlblNCSSkgYW5kIG5vdApm
b3IgUy1tb2RlIE9TIChMaW51eCkgd2hlcmUgdGhlIGZpcm13YXJlIHdpbGwgdXNlIHRoaXMgYmlu
ZGluZyB0bwpwcm9iZSBhIG1lc3NhZ2UgcHJveHkgZHJpdmVyIHdoaWNoIGluLXR1cm4gd2lsbCBh
bGxvd3MgdGhlIExpbnV4ClJQTUkgY2xvY2sgZHJpdmVyIHRvIGFjY2VzcyBSUE1JIGNsb2NrcyB2
aWEgU0JJIGNhbGxzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
