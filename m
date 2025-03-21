Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2583BC36007
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3keJq23QdhgSB5CCSzi1VjiKHnJNBblz134yVWc9Ze8=; b=BgcDK1lNCqxfuR
	aBw5TxMIVATGTlg5QTzHcpirr2d+xS08cPcoL/WYODb6fQqm7ZCdOQJFQa3LsH9XAkjhEEE9hn5Wq
	LaKmjAs3bFO3fW21ms3kdsiH42vKPCRyAa8L8tY0MVdt5mvb9PgSzJOe03I0hBIvRoo2TPzfpHkH4
	lgAfMVEJsJi4nM0kFB6v/+SzEhmJr/jktP4BWy1ykUg3F4aiWheRPypDLepCZYK5rwtFTsQ8esi7S
	SxyOl015m/irHu03REVDW86zhppFqBIMKtSkB9hAuxgY3H3Z6vvJaMhM/hJX37j7n/bdW009LmVoK
	2qYwiRbNRFolPGpGQ87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveA4-0000000FHaY-0pND;
	Fri, 21 Mar 2025 15:19:52 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tve8q-0000000FHKU-1EB7
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 15:18:37 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-85b44094782so63000539f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570315; x=1743175115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTantLRj2g1pI/nv2rQCu8piWojTNSsUaDvPh+ZcZxc=;
        b=zVCCgSvF+1MzaJWr5YUm0z70SOdK630BGX91c6hrkxvC8q85ib7m+J5I2vdmqw7FQG
         WAmva/H3o+uCwSoNoYFi7331n6QO0AXHqYWVyLWBSTp67d6cpavKbcRNYwcHreqPvVJN
         XD3rHCDPAkz9KqS5U3si1DDHMpLKjJ5ClpIm2rdnSwpfR7gnCPhBZRCJ5oVChktjMpuH
         KUZSuRHESdtj1zUyb5q0a8PgxWBFJnknewGwoeqEkIw/6KP012MAjmreiWDf7vJES+9Z
         HpmUIS61+ONLuIvt9NGwbzumLmbBn1K8+x27eOOoOmvfHc+2A7wRbYmdFbSbJ0N4xO78
         kIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570315; x=1743175115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTantLRj2g1pI/nv2rQCu8piWojTNSsUaDvPh+ZcZxc=;
        b=b5z4ajbx5Ibzb7Ni/tNUjdpLbRnbUFlpdh13THJUCSNbjYYBTW2l/CSxCUjfcXLklz
         tegaC3GXjnRUvGbE7y/bMYR/ZQjKF3SSfXa+2xOEydvmeJ22xIo+bxY6CpqW7Mvog2Zu
         6HvPUuBnrfEBdlcSpS6M3ScRXD9KVsVS9QwUfQIcyKIAGfeNe0nuaLySPo7bgJJoqU/2
         nmHMzP7jthOzyzka2uIkC0oY58/42cI+/t6XgACx1yrsk07Dr5Wr7LxeQ4OnhjU7TNTL
         oOGZZB/XSVQC0uloOwgiamzj7C/Rq6EWwqYN4VK4TOQGcvNBR9Jv+9JFCMdy6z4lJ6KT
         VVQA==
X-Forwarded-Encrypted: i=1; AJvYcCWJhBAUoHXzbED00KFlESvRjy6fVBzBRypCTXI64pT2CRVkqdLwbRcjS7phi39XM6LAQbfu4k6OgY85oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhxi4lY4OVZ7D9pM7tMfJYxkZc29Z4N3+b+dJLoEECFuu37NpM
	vn4b60sKYxnVZmtqDrESnsaeIxNgWB/5pwf1+A2lvNW/PEN89qB1ZbC+07RFu8U=
X-Gm-Gg: ASbGncsN+dDEjPbw/o8skjp873hO3GJswucOtmrHZuoAsm3X7uzddl1dz6JElpulY13
	PXhnImQ5/5hmaULXMw32UhCE3tudEFd2fxmWbjHxwfO2Sd35Xk9mAKfDRM2gc4WlSONRVzCU5O0
	cbT6TNDneFyGReqO4XCQskIEFpS5rAsUw9T8zT2eBdTFnp9XYQYy98t5YnSVyMxIRuHWqxlb+OM
	zuYYLgi30RI8yy9boUViqLvDMw8bKnRJSm+lD315mu/U9hPWt8K9NiPZE1BtuHa4KON+O2VyfuD
	tk4CCAVkMRw5Nete5IpMrFu6id1V9yXZrVcQIk0oOoNmaMHah+zaerr8QWBFaGaV4zIcLmvdB7V
	RCzLsfcHb3VU9XVIwiCb0HcPJwJE8f1WiD4k=
X-Google-Smtp-Source: AGHT+IGSab75MXOOp0j710KIm4LrkQU9r7YtJUQHaFEL9MotB5UuhKhBeVLzh5RSsEP9NerpL6ljFQ==
X-Received: by 2002:a05:6602:3998:b0:85b:46d7:1892 with SMTP id ca18e2360f4ac-85e2ca1895amr415643939f.2.1742570315183;
        Fri, 21 Mar 2025 08:18:35 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/7] clk: spacemit: add K1 reset support
Date: Fri, 21 Mar 2025 10:18:23 -0500
Message-ID: <20250321151831.623575-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_081836_460359_6F447EE9 
X-CRM114-Status: GOOD (  11.62  )
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

(Resending as requested by Yixun, this timing adding the SpacemiT
mailing list to the CC list.)

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14-rc1.

It is built upon the clock controller driver that Haylen Chu
currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The first patch adds three more system controller CCU nodes to those
implemented by the SpacemiT K1.  The second updates the existing clock
driver with a structure used for OF match data, allowing both clocks
and resets to be specified.  The third provides code that implements
reset functionality.  The fourth defines groups of reset controls
implemented by the CCUs that have alraady been defined.  The fifth
makes it possible for a CCU to be defined with resets but no clocks.
The sixth defines three new CCUs which define only resets.  And the
last patch defines these additional syscon nodes in "k1.dtsi".

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v1

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct k1_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
 4 files changed, 539 insertions(+), 19 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
