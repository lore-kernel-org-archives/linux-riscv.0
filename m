Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8491DC388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0787E2071A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLrtFa35";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="WUBH7LVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0787E2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ipG2pVDjCRNiHYOzPiLb/tqbR22zioSfNqjFb3YfL5w=; b=PLrtFa359POmyHXqfBWKPSPru
	oeIxpOf11gQgBz8hEubYjN1plwz2PlvWYf9fcekLnfZIcFxW4pdJ/IGsIGlAOIUT1GCZoaFmGp4J8
	jvZW0CfjskDMmbzrw+JHjclB0zv1J+3oirSbZuZ47MpZk7v6OeljCaFLxnLR61kJmW+wibH1j+1Y7
	fLxcz8z/f6BiuVufF47omozrS12y2xwkYdfXeXkYtslejrb6HA5RfpB0fnM1+ZPSxMCc3jVx9OhJ3
	qWnshb7+m/MazMErzORz1TvSV+Mf5jnHrtgdYKfvi2j9vnWf2giH8D8z3qoYbbBG4U1apMWOgve/s
	7iVpze/1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavxK-0002wM-8K; Fri, 06 Nov 2020 07:14:42 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavxG-0002uI-NK
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:14:39 +0000
Received: by mail-pf1-x442.google.com with SMTP id z3so484227pfz.6
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fq6B0QhUEt1eA8lH21dyI7mYJ3laRtZGR038F2jnq/k=;
 b=WUBH7LVinnQuGGBP47rJTYuOxdnAP7M8/rEGoe1S74EUauDWWggaKdYnMStOfE2vhk
 D5cPj4rH8coj/d+gqSHfg9YvUDkvpGxb7f0dSs0+6gjbJ5HWCN28MinH22Tkzjb6M8Ck
 sdIcnQGGmUpyDiZVAWMvJKapQlQx/pdiIgXNg8lVrhBJog4/liUlhgIPC7zaaiBj/NRx
 ACuifBa7TTm+g5nC9xGhEGJMsVIWMeyoBAP+sFOW4b8/1wnM/A9L2nEFeccet+I5TdzN
 8I0scs4bs9JDRP5UcdXW90jsM9RKw46Fo09khAn4RwNfOaIDaE+V8CvrIyE4S8YSX/qG
 LAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fq6B0QhUEt1eA8lH21dyI7mYJ3laRtZGR038F2jnq/k=;
 b=VZTxRXjmeVaLRjCP3rHt9/+t0NAxPHSdJModfuXYEyJP6ViI3fXJSwHF0pau8kwRuQ
 Tl7Fp3p2khH7Uq0BryAco3lwORT1lRazJqFwRY6y7Vo2ED1rpZ4RlI/d8lTDfp7RPs8+
 JocgepXUeVgZFM9dDXBCbdfr2XlyvKgOCbsrJ8BHG9ZVNrVf/i7gaKzqJP2g5xws+SHF
 XvZNh7Y6+YscjnpoyoOJZVUB1JIG9hrTlQLXwp80y/gdl8GB6CFkmzpNjo1t/Scusosh
 S2qCsHgT1lq0CoQWDRcJ7Hkau+R+U3Hie7/SHE8aC8HpMxZljOpOcF6b7Ct26H+/r2Oz
 8d8Q==
X-Gm-Message-State: AOAM533/wotlB6UiSeHTAD/1cl1yKfUczWHqurb4MXZnatLmZlhIuTwy
 ujZAdf6oPStZLNNWYHsS1zt0XA==
X-Google-Smtp-Source: ABdhPJzaXMxSt2eJmDQy9mNYgo4KQIbRfUfUgL7wVlPY7dfZiDFRssY3KbzHva6WyWPup1n8fBfnLA==
X-Received: by 2002:a17:90a:e643:: with SMTP id
 ep3mr1016533pjb.211.1604646877045; 
 Thu, 05 Nov 2020 23:14:37 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 26sm601171pgm.92.2020.11.05.23.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:14:36 -0800 (PST)
Date: Thu, 05 Nov 2020 23:14:36 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 23:14:23 PST (-0800)
Subject: Re: [RFC PATCH 0/3] Add Microchip PolarFire Soc Support 
In-Reply-To: <20201028232759.1928479-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-3a4619db-fe42-4ae0-a521-4032f23591ee@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_021438_852942_98589F07 
X-CRM114-Status: GOOD (  24.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 padmarao.begari@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Oct 2020 16:27:56 PDT (-0700), Atish Patra wrote:
> This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> It is rebased on v5.10-rc1 and depends on clock support.
> Only MMC and ethernet drivers are enabled via this series.
> The idea here is to add the foundational patches so that other drivers
> can be added to on top of this.
>
> This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> The following qemu series is necessary to test it on Qemu.
>
> The series can also be found at the following github repo.
>
> I noticed the latest version of mmc driver[2] hangs on the board with
> the latest clock driver. That's why, I have tested with the old clock
> driver available in the above github repo.

OK, I guess that's why it's an RFC?

> [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> [2] https://www.spinics.net/lists/devicetree/msg383626.html

Looks like this one hasn't been merged yet.  IDK if something is broken with my
mail client but I'm not seeing any github repos.  If this depends on
not-yet-merged drivers then it's certainly RFC material, but aside from the DT
stuff (which should be straight-forward) it seems fine to me.

Since you posted this an an RFC I'm going to assume you're going to re-spin it.

Thanks!

>
> Atish Patra (3):
> RISC-V: Add Microchip PolarFire SoC kconfig option
> RISC-V: Initial DTS for Microchip ICICLE board
> RISC-V: Enable Microchip PolarFire ICICLE SoC
>
> arch/riscv/Kconfig.socs                       |   7 +
> arch/riscv/boot/dts/Makefile                  |   1 +
> arch/riscv/boot/dts/microchip/Makefile        |   2 +
> .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
> arch/riscv/configs/defconfig                  |   4 +
> 5 files changed, 327 insertions(+)
> create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
