Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F91C55822
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UDN41W6oI/FTVOPHO6tDYV2L2e31gKLTvZTctI6pZy8=; b=WLoWiiqv3ZMT42
	ieazoHiQGsgKmGt/NO6vtlVC8CFjc+bQjbW2/SPVLDdP+4GXOPf4v5W4k2J/VEOoG/2yKD+ADvISo
	U56d0PvW6cuHbXJ59gNOxr5MkmGQW8V2Zp8zrvInY7664J+OYxN4CPdnMj5xN1zgadvslB62OnM8/
	LwjzoUg7Br0ua3EBjXTaDw68dzBC1drZisft8XApuaa+sHU+l1cDiuVSOZoMreVzcrgRPedCdz5cJ
	cvP8zwWL+QRIcyW8hqv49m1Nq2vtH+wzJQgBdov5Yo9fNkSEO0MmXovgBB9qn31jCwqSxRkQ3jJ59
	J9KCWqK/I5O4KvB9L+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG7-00000001vnX-0tYE;
	Tue, 04 Aug 2026 13:32:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG5-00000001vmm-09II
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 13:32:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495590dde14so32486735e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850359; x=1786455159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnS+ToAVs8VPBevN/ktqdqEpqgN1qgKy4u1VdvZUrps=;
        b=ECgAEpl/vRP+5nIURex2cNQbUW5ulI79CVtoT06W42QPe3VCdKmoFGf2AI1plJIO0c
         tLIhi4g0H0CQUOdCsn7sbV1gl5aqSWvLsdmBkqeXmgqn/Xucm8OX3IRs/VE0nMZ1UVfk
         TsX/7YiSFcOkXnfC0iVthhXzfdDlA2KtKk0P/KHt4KiFi+4bmBq7LN6hILju1+yZDsqE
         bRFzusGBNQc0sNMr1Loa6bmvW9SbHVlOyCN8d9J3Wn6u41IrAyFtxInsP/AyWPp+xE4g
         k34om6G+p1zmSmtFOysvc7ukHpym5JY6S00pJ08U8t6FtPoZmpojA+WCIaAxeriWjUBP
         CR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850359; x=1786455159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnS+ToAVs8VPBevN/ktqdqEpqgN1qgKy4u1VdvZUrps=;
        b=d/zcuq9V+CrsEGMduCwjoJTQ8nzqqQyP7yO4uYWbmzxI8+D5BKjBPwm60r/seyGi3/
         NcPcxkoegvDzZIb0TzFZBH8fzzm0aMXVekfhgvJDIdCMlf4PnRXR4rz+k3biYErgu0UZ
         LD1cGKwA4IV851kwc1Fb4dL3WM64sVzqRQ8izuZozpEeyBgPetnJFesIkYBPd3jVW8fA
         TLhTxpOkCo9eyoQmsingBEcbw0eyj9fL7krDlAeaRrqMPRcSgqayH3zWoTTT2oiAELeJ
         xZmXUdlVEUYbTAeio70w8p0Bz4+Ywm9hX4POcFAcn2pPr5TaCwb9HC/BcskRXPISV0kt
         31/A==
X-Gm-Message-State: AOJu0YxOaEKVNzVtcBWvZ1LNL+G7oT67YugCZiftPIDg3d1GsILp/sjo
	XA4YKb23uf76Sc5jF7iqY5N4C6A62qTnFUTL7xmAnB0VzGIhFPdT+HgM
X-Gm-Gg: AR+sD109wJolcyR9uONwyTsjaTuaOtLROudDgVCOeDDuK+Yo2L/sGfE/C8jRsMMFbxy
	DrlSdjWcHj3T1x/FIa/yF0y/DRuyet503fcSXImexAbr+zBoax6jn3qSp9/UYxtTQH0HNQjTwsf
	A88gD5arOKbRjjCiv/WdI0qJRS2fr8mzTZWFBNKNECbccY4clbHe9qBO3p47HutOC/yoJgvEl8/
	orbQXxcjssNFoHwFJS7N4uS/mFObPmRWiW956A1vC9FxBKPsfVnaOmQVPHHGzNgjL45UBR1KuOu
	9A4AQgWFpeCnvIVJkCWn8NyYhXJ/+wJDZee/9/eqxaEqgJQoZo5z9slZDoAahE8HV78RO4xd321
	5uxDukGJFjxXOKVpF+pw0NH4zBtxi0DfDhMFTToqiRK/SFa09HxUQ9/8RP/Vz53u0K1jq2GbrS2
	9RyOd5bzMS/UePMNZHTuKZteHpWo0nsEJwBz1xSUSG8Afj3fS6MQPGZdvdCMjDBhDgPgStVfGwJ
	VDMOzWVmqTCNdGwCVI0ZjPGkTkzRYnauIpISzzyaw==
X-Received: by 2002:a05:600c:a45:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4980c66d8a5mr291501805e9.5.1785850358389;
        Tue, 04 Aug 2026 06:32:38 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:37 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Date: Tue,  4 Aug 2026 15:32:31 +0200
Message-ID: <20260804133236.205668-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063241_103768_CBEED20E 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds cpu scaling for 3 boards, each authored and tested by a
community member on their device:

- k1-musepi-pro
  fixed include order  
  v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/

- orangepi-rv2
  unchanged, included here because it's still unmerged, probably just
  fell through the cracks
  v2: https://lore.kernel.org/spacemit/20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com/

- k1-orangepi-r2s
  new patch from Vincent, cc'ed
  origin: https://github.com/dhewg/openwrt/pull/3

Andre Heider (1):
  riscv: dts: spacemit: k1-musepi-pro: add cpu scaling

Jonatan Hazell (1):
  riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC

Vincent Legoll (1):
  riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
 3 files changed, 102 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
