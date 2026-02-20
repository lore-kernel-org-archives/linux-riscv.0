Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C1EC5AE49
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1fg9fEyWYNgcSy32Rk9FmCC9v3YxIZE4FxRu26ZKi5o=; b=wEYADdSYkuNQrQ
	IfycEsGtW0Cts1LZobcx4xVuvGoh81Q+pJ3t90+VVS5uwbE7lw95FXTitIfa+NSmH5S8OWzhdGDEw
	H3wpmwPM/aeYWwBTs5lH1Exh2KW0H/1FEvns+2fetb9GsePBzTHUnxGlL7dRoJ4U/Y+SQxHpRZNa4
	E9a5tyeJC3cp1y2goWywEaj1tIDKgK1Iz+RWe2/784bB+8tlzru6yshtKrIGqMTkfxCqE2H/cFA+p
	ss9VvAyXVYQoRScu1xBsXhplxNmo3dP/cwZ7e3jBofq2IMqruatbs3c7Gnp7jpnUbEynn2UivMx+F
	0HaREyi2dGYgJiLTWe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQ2-0000000FWTW-1ycM;
	Fri, 20 Feb 2026 19:44:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQ0-0000000FWSi-0Bfd
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 19:44:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48371119eacso23669485e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 11:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771616642; x=1772221442; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfuC8wYvmgXv6e0lpDTw84mMEMfi1vaHFSvb7DY2Jxo=;
        b=IFMomFttpLezl/kzReorCz/kKtd+rWc5S2g92fbYNRYGAt+hR2kXcM/ueJeZim4gwE
         /fh1nlchTxWxd1aKay5Na0Y4Q81wgy/hWDdk+9W84toOBCoVThk1or2/x7+H2nUHjnxm
         yTtULDFUHbBIOVb9FfwNGzvgnu6Zwo+OpSyRM/fyTI0y+2kzPXUpMZlhsgH6Tqw5HSLQ
         xxqE1xQudhYr70Kmm6gcUDAMKua9zySQpSMhJbp21xjCYEHFMF3L33i0hd9IgxNmhsUA
         U4VYG3W6V+fBmBMDIPIRW4nGbVRLIqTgDpZLndcDnFJWJXayV24VveS0zVREbwO44Uw+
         4kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616642; x=1772221442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfuC8wYvmgXv6e0lpDTw84mMEMfi1vaHFSvb7DY2Jxo=;
        b=M8levAm2Tag7boA0g/vCMkWFEyXQ5SJCSTyyC0UGL8wXoXX/vlhDi7h1g7RQ8L7qAe
         Ghb7fZ+fvZltWuHqnaH+zTis/Uv6IJord7onUAEPBocOVVGxHQu9JGtJm9TsrVGS0ekI
         +aIRc5/s/AaqnD1GL/UsomZeox2ShHS/Df15opy6t1zZ57KOF/HQ6J/N2if2xz+PnG5Q
         3ZIW2hOOhzDo5tgsdNjZJ4KKQdxBc0bay0atlk8HIumrDz4omssr4usCdWAQUk5pnfIo
         mAFfLWZpVLQ6831wJ0SGLj8XRjP1MQ77IIyB51r28k30YdHkaHjIp5fzYWstpA742kto
         y+rA==
X-Gm-Message-State: AOJu0YwVPauKTwITX63Knzqy6dJZwifbBU7pmuu8xa5XshIJ8fxkYhl1
	HlIHFdjdRFgbzB4VHGR51anSwjlJ2OuYYR+K4kLLjgqgbLjlHdpl1cvM/usnec+O0s0=
X-Gm-Gg: AZuq6aL53EyMyzaSrk+286PtK3HZIaVCHqAawLRwAr0g+JISqReAk8cxgbujCCcYnAM
	2xJmbDvUlvSGMskbDk6zRqZZ58w5VFCmdmJtyt3QxB3PAzqj1WkWjex5sNclDF9JIovPHqvFv57
	1eMbyXMWug9Egn0bnScZgqHefoHdY4wU527PZAGJHnF/OWKr8Nckrk9DYlc53kTOEL7aW4SxDpL
	DTV+Fi2UrHKYQtzY19bG04JgklH5UnWSmM1qV45wHmOOrdoydD//NE26GtWgxEDTYZeJEq5x51r
	w30G48gE6Dh+Bb4NsOOUzjD6BK2JBbFABV2W5MP313sUCZu6wB/dPdEvima3hI9xc6avAL5ZsnS
	CQz0Gp7dQh9e+RhGIY7q9z6442E9DTdLi+Hb4nUv0NGJvtrN67MrZks9C1jT2vAdeaJUB2ICVIa
	SFy9W06vZKDjdba4JtR1A/
X-Received: by 2002:a05:600c:6298:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-483a95fb23amr11365705e9.10.1771616641935;
        Fri, 20 Feb 2026 11:44:01 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e1b7ccsm24460755e9.11.2026.02.20.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:44:01 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH 0/5] dmaengine: sf-pdma: critical fixes and FU740 support
Date: Sat, 21 Feb 2026 03:43:52 +0800
Message-Id: <20260221-pdma-v1-0-838d929c2326@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHi5mGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3YKU3ERdAxMjwySDVBOLREMDJaDSgqLUtMwKsDHRsbW1AEiI36l
 WAAAA
X-Change-ID: 20260111-pdma-0421b0e48a10
To: Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Green Wan <green.wan@sifive.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Palmer Debbelt <palmer@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 devicetree@vger.kernel.org, Max Hsu <max.hsu@sifive.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=Ly4iEjx6uZ+rJ9+G/vlKsJCinNauJ5e6oyNiW9ulKl8=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmLl7l/9teiwq1b0uEqS6AzBQvvq9KwMuuyxvo
 Hllat95F1qJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZi5ewAKCRDSA/2dB3lA
 vfitC/wNrgFNBVPVRVSl1TVKWOE7GbVcK8IJOazLaHl6+IC6NBJKUSQaBtYSLNPntLIfd4Zq/3S
 A3IqmGTSo+JJPcTGgaMfNEBazujzQ3UPslRRGOyMXg/spiAJs7IqnD03WYZZ0Pajntzc1cpz7XV
 OK9BEc/q6wn/GKslOuz5cWvUhEd5IXo+7OvSWvYrOhDF0bNmPKOZzJh2xuVfQaViupGywWxwgbb
 hgB5nkavL5jSOu0/mR00PAjr9NF+Ug+enB2Ap8eW7Mw6hWogEAXih7V7kbvdQ6S9Ll7PERBnoPQ
 EufsAIGwP91QJRlQt9+XvgWoIRm1QfmVEfC3ObbQ0LZyvpxExqVUSnDSvW8CN5+prB4bekwXe3/
 ZFAAhitkqABVNl0lBx/MVrG6xcyQ1NwsMHoWFOLdHIcRAXQs1bgNQ2hergH5V3U3KeVVVZojJmL
 mVoqRcz5BDnQY1LuDAzEwDa6xyvSQPxs0+wyofj20dWS3DuGRCzM1FQy+OXssQtibHM4A=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_114404_130684_7F4F9A18 
X-CRM114-Status: GOOD (  12.89  )
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

This series addresses critical bugs in the SiFive Platform DMA (PDMA)
driver and adds support for the FU740 SoC.

The first three patches fix serious issues in the existing sf-pdma driver:

1. Missing PDMA base offset (0x80000) in register calculations. While
   the hardware provides an alias at offset 0x0, the driver should use
   the canonical offset 0x80000 as documented in the specification to
   ensure consistency and maintainability.

2. Race condition between done and error interrupts on SMP systems. Per
   the FU540-C000 and FU740-C000 specs, both DONE and ERROR interrupt
   bits are set simultaneously when a DMA error occurs, which can cause
   concurrent execution of done_isr and err_isr on different CPUs,
   leading to undefined behavior.

3. NULL pointer dereferences in both error and done tasklets due to race
   conditions during channel termination. Both tasklets unconditionally
   dereference chan->desc, which can be NULL during legitimate scenarios
   like sf_pdma_terminate_all() or when interrupts fire after channel
   cleanup. The fix adds NULL checks in both tasklets, protected by
   vchan.lock to ensure atomicity.

These three fixes are tagged for stable as they address bugs present
since the driver's introduction in commit 6973886ad58e ("dmaengine:
sf-pdma: add platform DMA support for HiFive Unleashed A00").

The last two patches add FU740 support:

4. Add "sifive,fu740-c000-pdma" compatible string to the dt-bindings.

5. Add PDMA device node to the FU740 device tree to enable DMA support.

All patches have been tested on HiFive Unmatched (FU740-C000) hardware.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
Max Hsu (5):
      dmaengine: sf-pdma: add missing PDMA base offset to register calculations
      dmaengine: sf-pdma: fix race between done and error interrupts
      dmaengine: sf-pdma: fix NULL pointer dereference in error and done handlers
      dt-bindings: dma: sifive,fu540-c000-pdma: add fu740 support
      riscv: dts: sifive: fu740: add PDMA device node

 .../bindings/dma/sifive,fu540-c000-pdma.yaml       |  1 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         |  9 ++++
 drivers/dma/sf-pdma/sf-pdma.c                      | 63 +++++++++++++++++-----
 drivers/dma/sf-pdma/sf-pdma.h                      |  4 +-
 4 files changed, 63 insertions(+), 14 deletions(-)
---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260111-pdma-0421b0e48a10

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
