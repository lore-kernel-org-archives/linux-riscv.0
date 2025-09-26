Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3853CAC5AC
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYIUQVh3FwEZxHPo9NETztWAWw2wBfI0jpMDwMEldag=; b=Em6FqlJ/R2fI7I
	1YzE68mvQOxtCujcK0Gv5S9v4nQ/N3M5KQ2XGEM7jlgXYyJZre1OzCOdNodijXjyCiS16QM6ApwII
	vj+hbU+iI5OLzgLbhdn5R6q3oEmsYphgO3+oSAoGHevmXP5sri8jDqPqhyG9NtpD0pFSi1rAoP9dg
	P/F0a6udJBv8wfp5F2jFgXVGZd/GvuM4GYjfufTcq4VVPBZEB60OlRh5cn/XpBq1283gFEeYv74dq
	DkPWNG43dScTeeQkuKPEewjvmJRRU0xLPNFpxSubc/VYUkP27kBnWeBhSUIU2i3U/JkIaXfxmGcd6
	Bl5nvG/eiSHVVGEw5ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22b3-0000000GeDI-2ppn;
	Fri, 26 Sep 2025 07:10:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22b0-0000000GeBs-3xdZ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 07:10:24 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f605f22easo1654896b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758870622; x=1759475422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s13NkV03DI482hdQXj9L0MMsFVndYTlMMN96sJroDYc=;
        b=DA/AeTQXxjfCawvcN0XWZ7OusAfGHBImgsmXyhE03vOksOtYSj/SRd7FhHfxl+In0W
         /xa5Jhf1T7tEAcsUwPVy8GvQuPyRj6lrTTYb579X+O1Z1fmCzTQB1xgvk80oPKxTsNYZ
         gcSEGfMHdo2xE96dvkIdSkVCIavixCVk6WyOvXc7mv6WOuu4yo/xQ1PsBpiEzj7KAzTL
         /jjXyENvUdtA+3xBKTsLVtJhGDlvMKvTkn2Z9lZJJ20V+UbradiErPMyEU2Noh44kjsW
         hD/6paCcbJUtc879vLZADWnCVo+i4JBTc2h4/gdh1xaKfenUpFsGUF8hFgrw0oPI+oiW
         FYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870622; x=1759475422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s13NkV03DI482hdQXj9L0MMsFVndYTlMMN96sJroDYc=;
        b=lXK6QPpz03QjyLcL6z5ShjZINWuJQfBuW/YK7cMWCN0swTOkxoUO0CPg+gU+5WPjEE
         fb6hh7r3EzMl43WF28AiCgOpBeY1X+7BgKe+k2Ie/UTOLNeD76iXkDvE8auqXcNNTAt7
         IrEYTRXefOGqwiK7YYxT0undfOftDjjJCQLb4Mxj00n8D/1EDb8VrIo8nW01tCejzeuG
         k7xYAQ88CViCi0qxsLYsIgb9IEUZUmBh2hqN4FxoEeuT5dHoCiKcr5Si/QjDaDEHwUlW
         CipJyHbxRH8bnzHzG9/vMlSMf4ju+dk+TVmxaZ9JyiTOMcVErP7A61nO08cdZC9G/D/U
         pySQ==
X-Forwarded-Encrypted: i=1; AJvYcCViV/6W8j46PY7QltYj0mdLwvk3PHkeFqkDQaxGEarff+VG8949tQRQx5qp+JVhRRVBs0x9hgtFgmXLEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyanONynHkAqKENBYa1an+Qrlsxi6M8YrG1z+BN+9fBn9NrUWJq
	iNIj4Zpm9slnM5plXSsAIwq+PucgLc+x5H0F36yl8uiS5SX8KUueI9gdx2dcJKfY0APx6qdOCtJ
	N+enWPYTd6PlDY95wmVsDfttSwZnWtVELZ1bWPCjZuw==
X-Gm-Gg: ASbGncuo7tD0VHrBj9oIZ5IHi2mE3ChDny0G0Cqlgd/co76568viDTyOIt+ntPXehKA
	6HUvhnyWCH584X6INsGKnqmceqQeHFKDiAMfneFHlqU+fZwssZrRCkl6bPRhNTfo2xbPrp0zbOE
	N426XNyjfcXUGOcnV8HAiuFYgH1SCcWtXYOSKNpVnmNI3QLvcXcsBjogQ1r45k4zJvHHdVXUDAR
	R9CTj7E5FtylyAMsbbGrUUI5+FHZ+EHmZsVSeqEAx+8oXU072tgcDHH2UXrsMjQqttDwn7PHIKm
	2EvQUm909RM+LV5BkeBPTZKE/85iKA1rPyHpQRvcvQm90wmrOmXfrFtcG3e9oOp5HhNa8se6pDx
	stPCJ9rkmlX8=
X-Google-Smtp-Source: AGHT+IHdhWdKIldo725yaRcV2e2TLmZiar6ZsNJtmau9dPpPlg1CcGz3EfIZ8rNp7OmbymTgF9AsP6YdfPARBysWd9Y=
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id
 98e67ed59e1d1-3342a2c9fdemr6991714a91.24.1758870621944; Fri, 26 Sep 2025
 00:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250818040920.272664-1-apatel@ventanamicro.com>
 <20250818040920.272664-11-apatel@ventanamicro.com> <823e11f3-ba2b-f0ec-8bb9-0785c89e8234@kernel.org>
In-Reply-To: <823e11f3-ba2b-f0ec-8bb9-0785c89e8234@kernel.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 26 Sep 2025 12:39:45 +0530
X-Gm-Features: AS18NWApnm5B16UUErYVg9jHjWgczHP7q0_6OfFV3wst3Z5Hkpf8DICkPiw9CaE
Message-ID: <CA+Oz1=aXDTvC+qnL5zA-Lhcy1X=okbHCYtfDMzQ=7k6GufCJHw@mail.gmail.com>
Subject: Re: [PATCH v10 10/24] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Paul Walmsley <pjw@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_001022_985012_647B20D3 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgNzozN+KAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGEgZmV3IG1pbm9yIGNvbW1lbnRzOgo+Cj4gPiArCj4gPiArI2Rl
ZmluZSBycG1pX2Nsa3JhdGVfdTY0KF9faGksIF9fbG8pICgoKHU2NCkoX19oaSkgPDwgMzIpIHwg
KHUzMikoX19sbykpCj4KPiBJJ2QgcHJlZmVyIHRvIHNlZSBjb2RlIGxpa2UgdGhpcyBpbXBsZW1l
bnRlZCBhcyBzdGF0aWMgaW5saW5lIGZ1bmN0aW9ucywKPiByYXRoZXIgdGhhbiBtYWNyb3MuCj4K
PiA+ICtzdGF0aWMgaW50IHJwbWlfY2xrX2dldF9hdHRycyh1MzIgY2xraWQsIHN0cnVjdCBycG1p
X2NsayAqcnBtaV9jbGspCj4gPiArewo+Cj4gWyAuLi4gXQo+ID4gKwo+ID4gKyAgICAgZm9ybWF0
ID0gbGUzMl90b19jcHUocmVzcC0+ZmxhZ3MpICYgM1U7Cj4KPiBBbmQgc2ltaWxhcmx5LCBpdCdz
IGJlc3QgdG8gcHVsbCB0aGVzZSBraW5kcyBvZiBtYWdpYyBudW1iZXJzIHVwIGludG8KPiBhcHBy
b3ByaWF0ZWx5LW5hbWVkIG1hY3JvcywgdG8gaGVscCByZXZpZXdlcnMgdW5kZXJzdGFuZCB5b3Vy
IGludGVudGlvbi4KPgo+IFNpbmNlIHdlJ3JlIHByZXR0eSBjbG9zZSB0byB0aGUgbWVyZ2Ugd2lu
ZG93IG9wZW5pbmcsIGFuZCB0aGUgY2hhbmdlcyBhcmUKPiBtaW5vciwgSSd2ZSBnb25lIGFoZWFk
IGFuZCBqdXN0IG1hZGUgdGhlc2UgdHdvIGNoYW5nZXMgaW4gdGhlIHBhdGNoLCBhbmQKPiBxdWV1
ZWQgaXQgZm9yIHY2LjE4IChob3BlZnVsbHkpLiAgQnV0IG1heWJlIHlvdSBjYW4ga2VlcCB0aGVt
IGluIG1pbmQgZm9yCj4gbmV4dCB0aW1lLgo+CgpIaSBQYXVsLCBzdXJlLCB0aGFua3MgZm9yIGhh
bmRsaW5nIHRoaXMuCgpUaGFua3MKUmFodWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
