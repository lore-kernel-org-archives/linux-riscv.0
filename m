Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08DC531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqQfM+gh0IoywN0U0ASk4ullQzz/eG5E6SsRO4GBMsg=; b=4A1Ob4UVGkkQMH
	s48D2veFQbvgcyuYwzjgCHGNHqarKqdsjoNkXs82nLiCqo07H+irpK+s6dVl6n7wEwxNefLMBBnyG
	O9u06YOVG31m+eEeD57EOjnKmPTjD37QO7yp4NM5Qs2hOtr/a+PnEdvl1I9a2HwW9+KS4ULFCOoMM
	Gx5BYzDGBIWk1W+7qzEAWMKozHT10/EZaIay/VytvCzbXbdqainDdF1y6u9LOwhgYnTBZSrDp7vGI
	PyXUe9Pa133CXEhRp/R99gc7A61F2hMJREDr0vBMVlz/LobsJwDX4HzysRJnVEPY1wcg1A9eNIbtn
	QX80NcCtPLqJuYkOvCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgUrL-00000006V1v-2XbV;
	Tue, 20 Aug 2024 19:49:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgUrI-00000006Uzn-1b03
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 19:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1CFE6CE01BC
	for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 19:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D57C4AF0C
	for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724183373;
	bh=wkf9gsj1XSad7V3Dq8I4UyQtzWEYMfLIFCxAydmaCzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sy0DPFjE2z4e4ndbFJNJlaSfwCMDm0MejofoMIjOYLN7S16C40bZtSVdduAceF8kp
	 L37yPmYSv4YTmwiQr+4wVez8Rz3mCCFYoa46GGmoOWTBumQPHS3Cj7TUU69/WIw8L4
	 ZJB7+HrEesmVE6o/faFkeTHS2OairxmyGGwXtPLOwyX/Tqyo4vtrJCkIJNkzxAao9V
	 wJ8H91mn+kB/fkg3FBNMkcLZP3Fi8GAtlRDdFvbozoRSXTIg1Y6PRpOEd5IU9whwBk
	 5llTyew94a2FKNYn66OtIUD8ljb7MWCC2wvUVacfQQzLLVTvyQAntwvwoJkuGyG+9k
	 9OmcJn1CphI0g==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-270420e231aso2049315fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 12:49:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLlP9CE2gicy8P0keDXxx/8K6FFs71q8BY3ey35CwsD2X00EZa/5fALEJdSNfMjq2bmE6w8i6E0lAXCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/bkeh6jjpGq31z2CnO8DmJWGWCzV3xO0inYXq1DC+LlEHMr2s
	hmIwScmqmEiMnQEIyGqe/jVPfwyhWYF4a3wJtM0bCpBTpsaJcVOVC6i+3krzA/Sf4BuM/2MjIgY
	na871nQkI7A29Prhw0pMAmJAPvFE=
X-Google-Smtp-Source: AGHT+IEROyYPyyUToSOegMz5cgcnQfC+ZGutYEi8+81lPeRqkPLiLkJ6XqDwy11TysehDcz1PmHz7jBrDEzmfk2nO1I=
X-Received: by 2002:a05:6870:96ab:b0:270:4a9:c369 with SMTP id
 586e51a60fabf-2701c349c01mr18298140fac.7.1724183372607; Tue, 20 Aug 2024
 12:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org> <CAAhSdy3S_QTBzCNtj8kKDpzxtoeyKWvGLtjgSTViieWimpP-JA@mail.gmail.com>
In-Reply-To: <CAAhSdy3S_QTBzCNtj8kKDpzxtoeyKWvGLtjgSTViieWimpP-JA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 20 Aug 2024 21:49:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i7kweDVUGw103kq7kPOoh+9vJMU_8xugHA_hqqkRdaNg@mail.gmail.com>
Message-ID: <CAJZ5v0i7kweDVUGw103kq7kPOoh+9vJMU_8xugHA_hqqkRdaNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpuidle: riscv-sbi: Use scoped device node
 handling to fix missing of_node_put
To: Anup Patel <anup@brainfault.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@rivosinc.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_124936_628286_11D43879 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTI6NTfigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDIwLCAyMDI0IGF0IDM6MTDigK9QTSBL
cnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gVHdvIHJldHVybiBzdGF0ZW1lbnRzIGluIHNiaV9jcHVpZGxlX2R0X2luaXRf
c3RhdGVzKCkgZGlkIG5vdCBkcm9wIHRoZQo+ID4gT0Ygbm9kZSByZWZlcmVuY2UgY291bnQuICBT
b2x2ZSB0aGUgaXNzdWUgYW5kIHNpbXBsaWZ5IGVudGlyZSBlcnJvcgo+ID4gaGFuZGxpbmcgd2l0
aCBzY29wZWQvY2xlYW51cC5oLgo+ID4KPiA+IEZpeGVzOiA2YWJmMzJmMWQ5YzUgKCJjcHVpZGxl
OiBBZGQgUklTQy1WIFNCSSBDUFUgaWRsZSBkcml2ZXIiKQo+ID4gQ2M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+Cj4gTEdUTS4KPgo+IFJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCBhbG9uZyB3aXRoIHRoZSBbMi8y
XSBhcyA2LjEyIG1hdGVyaWFsLCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
