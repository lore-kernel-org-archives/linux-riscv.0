Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6880EC433E3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6C820702
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7Xn2F1B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DjjLcbwY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B6C820702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPeeH8a0BbaQLCpASS+a8BtBhgHL72/Ov89JLR+poo4=; b=z7Xn2F1BfBnASc1Huw2T/O+uQl
	ll+eOZEe2eLnex2kTpinGSKgdznpUYgtwB8g+Ad9mOxFv3kRqAyE8rZ/p8sVz/Bb+8rxoJIdgVmCs
	5KxADrRV42GWyVuMcWosSYqLQj3eWr5jkErLKh/VcQjP6OwlsMbDdjPfhERYjWtmscAgKCR0+V66K
	OO3eYVwYH1p2KLNXjFjRyl0fYHT3pkKZ6X8yfs5x3tWD7UK3dDlIr3PaHu/buPHyZAnZIs5Bdk6in
	07Sl8H32+teZVJyemej3NLgh3+5JUXZFN+86vcR2Brk00HvGZ9IMyOr62bwQnNAVA5K5IXIm2mD/U
	JQLRaSrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpkKN-00011V-AE; Mon, 29 Jun 2020 03:19:27 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkKJ-000116-VG
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 03:19:25 +0000
Received: by mail-pj1-x1044.google.com with SMTP id l6so4352452pjq.1
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 20:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MX1npRs6E1BJMvrT9omJsOQIQGUgSUPJQrW7wHX73nA=;
 b=DjjLcbwY5BLsHDucAiJGHAt3gNsHaOg6PiLoaWZxOGruFvSbZQF4RW1hATXG1HnaWO
 pcZRJWshtmAxSLaRi/JtjxHj7PxLej/B40u2BarfoutSjccAyDxw2hcUwpex99gqqQb2
 9O3yqMDejj0DMYOFaiMYErhmu/2Fez6uwhyw8wgwxXrcc1yRNEkmuc8yM1x5s63g+AiZ
 enfWSmp4cHLHLk6qJkgylXKWsIYPPMmEsWXpb0kiUrlFJ7M5Cf/meUzPO5Kim1q1/NrW
 AQSaf1wD/krSAdzXwK7sbRUfAlua4GNPn5T1oGK4hVGstQcy3UrdJk7pyl0BaJ07C+f1
 ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MX1npRs6E1BJMvrT9omJsOQIQGUgSUPJQrW7wHX73nA=;
 b=daoAcCoj8oyAxUbBi/O3rmOJlIrvq5gZkGswjZRdOJex3NME7BFBa/2YLCihmU3BEb
 YGGQXGEXXhwGfubdndttE9urg6nyunAqAq+OIEnjAkaD3o27Bm659WwYOuyFOxJq78Rl
 6LTcX5LVRGQZfcVrT9tfsu5GrrntbJ+wYXWvO6raUSAKaNvUvMaspEvyo8St89oxoOYp
 qpap/H1IxVfO8KNu70YCzTE3XlyCivz5vcJ1Q23nCU3ks07lzwk566mLrB/dAcTfPgYG
 EVEXogVC7RwFDLXm9rHM4vkaeNMSvngMoOETQe/oM6G8GQJZDh91rg+9Vkui+Eusjobd
 pwCA==
X-Gm-Message-State: AOAM531j3evYnlq8PzMz05WqTqNES0zlmWptYoIp9bls9pH/9NLWp42o
 qKCaDhlaKNvauuXpoeLSmy/s2OiHftnwuA==
X-Google-Smtp-Source: ABdhPJwMpumCfd5Jtkmq2Tt8wb0YP3wqWSpHA4kY8SYSv0AOtdrJJ+gRAkE7qay+ZlKDrO56B2TLPA==
X-Received: by 2002:a17:90a:20ad:: with SMTP id
 f42mr5130595pjg.96.1593400760594; 
 Sun, 28 Jun 2020 20:19:20 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id j70sm12876254pfd.208.2020.06.28.20.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:19:20 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
Date: Mon, 29 Jun 2020 11:19:09 +0800
Message-Id: <cover.1593397455.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch set adds raw event support on RISC-V. In addition, we
introduce the DT mechanism to make our perf more generic and common.

Currently, we set the hardware events by writing the mhpmeventN CSRs, it
would raise an illegal instruction exception and trap into m-mode to
emulate event selector CSRs access. It doesn't make sense because we
shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
selector through standard SBI call or the shadow CSRs of s-mode. We have
prepared a proposal of a new SBI extension, called "PMU SBI extension",
but we also discussing the feasibility of accessing these PMU CSRs on
s-mode at the same time, such as delegation mechanism, so I was
wondering if we could use SBI calls first and make the PMU SBI extension
as legacy when s-mode access mechanism is accepted by Foundation? or
keep the current situation to see what would happen in the future.

This patch set also introduces the DT mechanism, we don't want to add too
much platform-dependency code in perf like other architectures, so we
put the mapping of generic hardware events to DT, then we can easy to
transfer generic hardware events to vendor's own hardware events without
any platfrom-dependency stuff in our perf.

Zong Li (6):
  dt-bindings: riscv: Add YAML documentation for PMU
  riscv: dts: sifive: Add DT support for PMU
  riscv: add definition of hpmcounter CSRs
  riscv: perf: Add raw event support
  riscv: perf: introduce DT mechanism
  riscv: remove PMU menu of Kconfig

 .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
 arch/riscv/Kconfig                            |  13 -
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
 arch/riscv/include/asm/csr.h                  |  58 +++
 arch/riscv/include/asm/perf_event.h           | 100 ++--
 arch/riscv/kernel/Makefile                    |   2 +-
 arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
 7 files changed, 471 insertions(+), 245 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
