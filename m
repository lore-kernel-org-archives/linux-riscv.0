Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D5C79FA1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P63/UZQUXIYzZ5OczGsUWMrCKWFYyIsq4n0LvoD0ALA=; b=eq13xwVtIJ4yc+
	y/NbeodtGSzwsO79NG5bzquki+4fs5k7RPxzzgG0JvT7lvGF0PXcKTRchM0jskJDXuaLzo7Hzysaw
	M90FdOC+kwoWdmH9TlHFiPFMpdhCJRCaQkLExirk0mHvwDV3ZMNE8yGI3ftjvpenVKlIqv0ZokgCV
	2v9LnTXko1+ChiuL/q16EyPuwbYXiEjxIBOEVAksa6a6a2TL6E1jTiOefG298YlK8ru6m++SR6Vsu
	KlkKhTkO5dII9+fpAfD6awRmPWgZRUqhcdVdgLicdirlbyh58iyII6+JXi8DW/WgE11vyHLghzRFq
	D2EeYV3tA1bU73QZFyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3beh-00000007Ept-3coI;
	Mon, 07 Sep 2026 15:53:11 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bef-00000007Ep5-19gZ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 15:53:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso3731076a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796388; x=1789401188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6erjGy3u0IztxSasYUB07Hda9mjPevh3TT6gn74YsDM=;
        b=UK2tYDckyMdGMuepNIKibhTXVJMLPH3WlZDhTVx6QdsuJ5LSM/nYvSEDkVEpeYdHH5
         vaYDLsP3KU0dwcJ1WQ6oi2siEf8zXK9/4z//fsgz7u/3SA3cLYqehQtO9M1HQISMAoXQ
         avVuCkFP5EzIxRnWX+6ySacKoRoAQWWyDj2xI5lTB/lIbcvtYPYxemEkA/fUzFNK8+yY
         NOrduyE4zCcBZcZGfELJRpyBDQwOX05vGgMOK81sJkVCr5HyahqyN2tUyOo3+vxdAQNw
         HdmzPjKfPuq4LMA65tanZkft3fQ8iacy90GMeQR1LmPKIMt+Ca99Lji8aIUIVl343rco
         5fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796388; x=1789401188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6erjGy3u0IztxSasYUB07Hda9mjPevh3TT6gn74YsDM=;
        b=YRZACUaZFSHnj42qo2lTr6V1fVA6weT+zFcwQMqBx8ZuhYvilFLxzDNvcEHQVY+8rT
         vPAuXBhX4ZqIcPsHvBN28OXSuzwe1pSdJY/HQiF/U7f2yaAKriJWBjNzZ6r7Vr97ZasD
         rAvkEF1Q+wrWLX/sqWksa3D+9f0xsqYGevyWuhw6EzHO4D2QG6kl6t+K67bXJ0X65RAz
         4DNbGKDFgcAB5AQkXCXxCtyMZusNQ117I+DLNa6KnRuVyX8Cc8sQYzUia4KA+56xZjWO
         vhffaeOjjBerRO5nPC1AG9jn/i1bs8xWxIU4w0JoGcVnkQtxWbdOg45lcbWDkFRCWz0E
         SWRg==
X-Forwarded-Encrypted: i=1; AKwUvBwHN5wyZ2j5jiuB8pUYVDXwFUCpjLUtiJ6koPIvdX2rBVoEnQTOKFSeXtgqUbv20iiDtKMOcoHMqDxESg==@lists.infradead.org
X-Gm-Message-State: AFuF++niySMpBgh9P890PhRyqcTm5QvhqnDGKpP+zRmKLuWr326uD15l
	faqxonXOrQpyPW/YBmaDi4c7kwrGcz6T61I1VQHqZXj2yqERjuyuYeVK
X-Gm-Gg: AYBFou1t7Yx5rRjkPjId/rgcpEj0vuFq1Zzq+VyHl09bmQr+G40h8qfkouKlukjS/Zr
	uhmrG0QOUUWidmsVGtVVtbMFkZ1U3YkXC0UQs6wAFYiQt/oc24yYDsdNNamCYqbDwcqtpNo4yBj
	7bel6D/JDtTd92BoBPv/SceF2uwzBa10MFSvaZqvO1oejNKesVLJfXXzPJdOrjitMlhK824a1Jk
	P0mGzV0SfCIGujIOV5fqJuZei7U0PNm3Pm03vXmeLGeOVTz/AgTN/AZ4PEHjqC9q3WggQQBwGh7
	m1P37SGNk9V6qyUbIFxEOY+hecoWEWf5VA/wd5aBKHStCVZuGX0McWkF30a0DTDKs1TNqlSmERG
	Mahx5JO7gADasJCk0DdB3ca5dLn3qMeh7S0XcLA+PuQXlEUu4WBl35gAZLimLVZtvp5MAH1vfgU
	NbIVjnkj+PbhqQPGoSmQtc7lwzesXUJaV1setfrkdBAfHuk+gPkKJ15+8wkvPgBgJDqQXJ/QTNO
	TJc5DaAXC53r+JWRNU+Iav0ulWaHM6OFQWegoBIF843c9ZEdN8VVVzIFGExGfo1RFKvKqgHAjiF
	KjLvtEhx0oP8WXqruLEioVHR+uA1Pz63AZHjDNrdC1AsdxbgIR1F/w==
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr35695612a91.4.1788796387891;
        Mon, 07 Sep 2026 08:53:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b90e26276sm59604a91.2.2026.09.07.08.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:53:07 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: dlan@kernel.org,
	adrian.hunter@intel.com,
	ulfh@kernel.org
Cc: long.wan@linux.spacemit.com,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
Date: Mon,  7 Sep 2026 23:53:00 +0800
Message-ID: <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_085309_313569_16B86AA0 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02, 2026 at 08:04:27AM +0000, Yixun Lan wrote:
> Raise the minimum delay codes of RX tuning window from 3 to 50, to more
> accurately retrieve a valid configuration.
>
> A window of 3 codes wide leaves no sampling margin, which will result
> tuning tests reporting success on a configuration that drifts out of the
> window under thermal or power variation.

I agree with the motivation, and I have some data from a K1 board that
supports it. But I would like to ask about making 50 a compile-time
constant.

Caveat up front: my board runs the vendor sdhci-spacemit driver
(6.6.63, compatible "spacemit,k1-x-sdhci"), not sdhci-of-k1.c, so the
numbers below are observations from that driver rather than a test of
this series. I could not test the series itself: rootfs on this board
is on the SD card driven by this controller, and there is no eMMC, so
a tuning regression means it does not boot.

Measured RX tuning windows, Milk-V Jupiter (K1), SDR104 SD card,
across three boots (the vendor driver already logs these):

  mmc0 (SD, rootfs):
    boot 0:  [0,55) [77,255)         -> widest 178
    boot -1: [0,54) [77,255)         -> widest 178
    boot -2: [0,50) [71,76) [79,255) -> widest 176

  mmc1 (SDIO):
    boot 0:  [0,73) [81,106) [137,255) -> widest 118
    boot -1: [0,74) [81,106) [107,108) -> widest 74
    boot -2: [0,76) [82,100)           -> widest 76

So a threshold of 50 is comfortable here. It also supports your
rationale directly: boot -2 produced a 5-code window and boot -1
produced a 1-code window on mmc1, so the narrow-window case this
patch guards against does occur in practice.

Relevant to the delay-line question in 5/7: this board's DT already
sets spacemit,rx_dline_reg = 0, so the windows above are already at
the finest step size, i.e. they should be comparable to post-5/7
behaviour rather than to the current mainline default of 9.

My question is about the form rather than the value. The vendor
driver takes this same limit from DT, per host:

  sdh@d4280000: spacemit,rx_tuning_limit = <0x32>;  /* 50 */
  sdh@d4280800: spacemit,rx_tuning_limit = <0x32>;  /* 50 */

So 50 matches what SpacemiT already ships -- but there it is a
per-controller DT property, and this patch turns it into a global
compile-time constant. Was that deliberate? The vendor design implies
the value is expected to need per-board adjustment, and with a Fixes:
tag this will land in stable, where a board with a narrower window
would go from "adjust the DT" to "patch and rebuild the kernel".

Two options, if you think the concern is real: keep it as a DT
property (matching the existing binding), or keep the constant as a
default that DT can override.

One more thing on 5/7 and 6/7: since patch 5 changes the delay-line
step from 9 to 0, the same physical timing window spans a different
number of delay codes with and without it. If 50 is calibrated against
the finest step, then backporting 6/7 without 5/7 could reject
configurations that currently work. Both carry Fixes: tags pointing at
e9cb83c10071, so they may well be picked up separately -- might be
worth making the dependency explicit for the stable maintainers.

Thanks,
Hung-Chun Tseng <alan.tseng.cs@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
