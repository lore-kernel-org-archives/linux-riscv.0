Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CB2EEAA41
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12l61jgH4Uv17KZFk8j6qCyi9ny0CBWx2DGLvesLxwA=; b=hp59ElXTTw2H4y
	s51CRw/VPf3kVEVO4V5auD192q5lSz6ZIFrLNnrqy7V7TlEfdHe09RnpdGMJFZzD3kIZiQnyAYQ3H
	keicUaPPf7x3YsPappTIGslE7GvmObEmztwJWP2Zy0ArptdSNJfsSIbBRYtHWNO4rQqVHj7fm1E3A
	wdrX/NCC9oCrKBY6m1QwGAkfcHUgrMukF2+8zTcMWD8GBNE7P44SdxFUCHEKkkzMaKUDnQ66guwV6
	f058rblaeiwa5RYxMCJazWKFfGHCRmC2/RXU5yfKeJBAb9R/jQm+A6hJeW/XbTytJQuJDnGACRVJj
	ki1f3McIh28Y7EfH4lWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmqv-008ZNl-1o;
	Thu, 14 Sep 2023 13:57:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmqt-008ZN4-1C
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 13:57:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 207F461D98
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 13:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76053C433CD
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694699869;
	bh=Z0KDPgWeo5efMthoztpzOwWCTyxNs6un0zRktA7SDYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SRiUQ4cbahnMav6KqOA3GbBaLpxpFjP8/2il91aOk1pb7dhobJxjBWX0xkTYRCv1E
	 uLCReUMvbCC8fh0lpsC5ftxYr1DdhI9X7kX847r+EbWJieKxEtNgD/1SlrZlvZjTmh
	 bJ2Ci90BXURGza5QTuFfGTnY/0CUsqdeZELpjSXmcdUkUFQocmag3eb0iOhWzoz4Xg
	 96d7nvGMTftr2zXk4uoHnAEzkP/rDRVbFF10Ng7T2438OTQ51CpEmxGylTQXh3qInd
	 Ao/6kbcpExGoJolmLp3IEWU5VulKhntIs8w5XbzqqGtIdtNx8OwOLVCC7zEMKqPWtD
	 14iNpvX8KE6rA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so1669510e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 06:57:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxlF19oXo0EFWWdsrN9hXZbeQ0pI4rN6q7bZdEeuLFk3WkvqVl3
	mLe4MKxO1G1xtpDVOO0WshFM7wsxqk1TP2ROxg==
X-Google-Smtp-Source: AGHT+IHNdUOKkW3vz5F79REP5vnA/Wx2ToSwyPSlJlky6TGP6WTmHPQrFclX9Rm3JGY8kBBMtjsqiC2wd7kqF+WVhFA=
X-Received: by 2002:a19:2d5a:0:b0:502:c950:592e with SMTP id
 t26-20020a192d5a000000b00502c950592emr4029898lft.25.1694699867677; Thu, 14
 Sep 2023 06:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud> <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com>
In-Reply-To: <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 Sep 2023 08:57:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxxmdPTLhZ6MTfuAcM0V7pmfRLiK8L3AZhhQKcvy_PCw@mail.gmail.com>
Message-ID: <CAL_JsqLxxmdPTLhZ6MTfuAcM0V7pmfRLiK8L3AZhhQKcvy_PCw@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] Missed starfive pmdomain changes for v6.6, now for v6.7
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de, 
	changhuang.liang@starfivetech.com, jiajie.ho@starfivetech.com, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_065751_470423_14FE7B9F 
X-CRM114-Status: GOOD (  14.56  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNTozMeKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMTMgU2VwdCAyMDIzIGF0IDE1OjU2LCBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPgo+ID4gSGV5IFVmZmUsCj4g
Pgo+ID4gSGVyZSdzIHRob3NlIG1pc3NlZCBjaGFuZ2VzIGluIHBhdGNoIGZvcm0uIEkgZmlndXJl
ZCBpdCBtaWdodCBiZSBhIGJpdAo+ID4gZWFzaWVyIHRoaXMgd2F5IGdpdmVuIHRoZSBuYW1lIG9m
IHRoZSBzdWJzeXN0ZW0gaXMgaW4gZmx1eCwgZG91Ymx5IHNvIGlmCj4gPiB5b3UnZCBsaWtlIHRv
IHB1dCB0aGUgaGVhZGVyIGNoYW5nZSBvZiBSb2IncyBvbiBmaXhlcy4KPgo+IE5vdCBzdXJlIHdl
IHJlYWxseSBuZWVkIHRvIHF1ZXVlIHVwIHBhdGNoIDEgZm9yIGZpeGVzIC0gb3IgaXMgaXQKPiBm
aXhpbmcgYSByZWFsIHByb2JsZW0gZm9yIHVzPwoKSXQncyBhIGRlcGVuZGVuY3kgdG8gcmVtb3Zl
IHNvbWUgaW1wbGljaXQgaW5jbHVkZXMsIGJ1dCBJIHN0aWxsIGhhdmUKbW9yZSBmaXhlcyBmb3Ig
Ni42IHNvIGVpdGhlciBpcyBmaW5lLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
