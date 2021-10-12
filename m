Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71866C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B1961050
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B1961050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wFh/StIJX1BimPmp+KAT8BUf4/buVC2nNuFOt3tQ8E=; b=uGjk1fEMv80Ly9
	fNJlzE0ZDApNyZ7YRPhrPG9LomTCsAmHgUb8gfktOHWDaYwg/0ctaylUwWiAzICcBVuPRZaHJAtGz
	DaRKs/egeWsj6TxZdpm36OYDmXjA80Q7QzGbvFSCDtc7GtIfVfx05QxrVdtRoC9eyNduM3YCZpXCm
	tBKh0mFoIIfqY+kn9UoXIpLhWqmj7VJ6CXtsfsWIweL4gpVvu8Ql0CjtOfdN1I2IjlldtfcTb5Q6B
	2+ISxD6iJuZoss9Jdyru1w9IHwKs3XdkY6ZGetBGl7thG7NvWXvZKqw1cFb6r/1X9Z8aYXPpcrWJF
	F2c5PGKLgW1WU9Fyf7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maFPx-00CUsa-KN; Tue, 12 Oct 2021 10:53:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maFPv-00CUrc-Ev; Tue, 12 Oct 2021 10:53:56 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1maFPm-00050U-8a; Tue, 12 Oct 2021 12:53:46 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v9 5/8] cpuidle: Factor-out power domain related code from
 PSCI domain driver
Date: Tue, 12 Oct 2021 12:53:45 +0200
Message-ID: <4115080.dWhdjDhTqs@diego>
In-Reply-To: <3552162.bMjzuKGm0O@diego>
References: <20211012095857.1314214-1-anup.patel@wdc.com>
 <20211012095857.1314214-6-anup.patel@wdc.com> <3552162.bMjzuKGm0O@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_035355_520579_974B90C4 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 12. Oktober 2021, 12:50:54 CEST schrieb Heiko St=FCbner:
> Hi Anup,
> =

> Am Dienstag, 12. Oktober 2021, 11:58:54 CEST schrieb Anup Patel:
> > The generic power domain related code in PSCI domain driver is largely
> > independent of PSCI and can be shared with RISC-V SBI domain driver
> > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> > =

> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> =

> =

> On a Rockchip rk3399 with "psci_idle" cpuidle driver and states
> "WFI", "cpu-sleep" and "cluster-sleep" I checked that all states
> are entered sucessfully both before and after applying this patch, so
> =

> ARM64-side:
> Tested-by: Heiko Stuebner <heiko@sntech.de>

sorry about the noise, but scrap that.

There is a difference between psci-idle and psci I only noticed too late.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
