Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECEDD6CFAA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dbQtokVlf6LeEvc3b6IAexQISzyF46RdBNwvOJaGP9E=; b=kQqGsd/IdTQrbX
	Ivzu3noJ8blMsGqXUa4opbdZ/cA06B1knf/oc9Xul0eAddtKkKXastdvlIHYPvGjnuWR9K7WUV+Dw
	r9TTEkYOWJH7+wWTrCfBseuuYqm6E5RYeGZzSouBeVZJbSNs4l2hRlSKdvi37cAsFCafa+fvDYuIV
	Tl8jOCdjfAc+3GPnXuqWDjLgzAHdyq1O0Wy+NDh2Ys/GAMutYFjd+GBa6uheHRsC0n/61aT8mrm8h
	jljM1+Rsw7AVQPSrR7HGs6S4Tpw60CWdtFa8n19TlszeybuSKg/yixvkhE8s4C7NCHIjRhrMy4N0d
	NC23IoZKlaOK/QqjgRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Id-00000007qn4-36I8;
	Thu, 22 Jan 2026 22:37:11 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Ia-00000007qli-3toC
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:37:10 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-794279c3b00so16038617b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 14:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769121427; x=1769726227; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJFvGWecxblPWRrtOP+G/pbSkfENKjUxaykiz55+f6o=;
        b=cC0BVJXIck4CMGZc2bnSe0MBmxLBj/2oWP89bWHo21La4d5EOK2wKw2lFBs1JGAjTf
         Bt/8v1z5bQuW/ibGOGhoVjL+rALWd7CBEi07sg0FvE2T4OwIcNLBJlajoVnf6FzrXTXB
         Ika/WC8R1UUh/1g43ICAVMVyk+crFN2WccyxsZG7A4dL24pvGGyQsFPrSplZr/J4iEtG
         dtxVXZMzaHwKNPSv8u1ksHorv4sHn7fqFr4+i3YdmwFVMdz5DS0AxlmQBqAHnVN8dFCC
         awfFv2NmQOZ9sWUjMa884Zzm+8IELsJnVmCGvroR5Vcjah2ycQ8c3FUcUrw3gmCv74IM
         P5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121427; x=1769726227;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJFvGWecxblPWRrtOP+G/pbSkfENKjUxaykiz55+f6o=;
        b=HgvKM1RiWUvNcJ3jh7kmQCkdQ/f8HLJo4b3Y6wVCrDCQJLmGJroQsSEt3ET+z81zGy
         OEvAmyJxSerNZhpPxixboAlFj1Q+snoI7Th07rVGnPm8+D1ebTj2E2zxHVhIss7HHiEP
         3bFIAR3Br9Z1ObNZB0Ga9ECEMWQIBLunGBAaBkj3xWN2L0JdY1O+tLmcz3xxZQYGpTKj
         tdcNBKUWmdw2MNx8PTkLGPQ7CroCV0JSdPB5jr1G+Th59CanF8j0Glw21Tdmi0m0aUPV
         ChcMOM+AzXVINSSmddxKFO3AgmRDn1NvTO1Qh4Hjvs5s2rzos/mIlALOCAcpo19Mvm9j
         Jv/g==
X-Gm-Message-State: AOJu0YxKDAF/R3fBii47/hdSiLKzbJKm9/IIe6oe7Tjhac24+wyS5AnP
	ae4G4VNhUpr92zZG/a0vT6g8tlxT6Ff0MMQztiGvTKFIcajq70z0/s2AygXD9UVeV6Q=
X-Gm-Gg: AZuq6aLmEcEhA0VV7JQlXM5LTVrNXvJkm+kZQZoFnZPBaiOO+aRL6L0r94jSLyxc5Xd
	uX0dSdUG++C8TqtIP+7ilFt0NzKHaSFBQ5wgFC+VxN3dzZ9EF0GXW1lVurR4J6xLcguXJElscGO
	tLnijyh8vsqfZfH/hJNtP1bGzXVzi+1TBum7xmU+H7fnQqi9adD/GckzwQI/eiHeL28ZoFJ5zPh
	MYpHADyyWNcx4cwEduFjL67DVq9gJaHHad4FjMHK2Nw/Oh3xxr+/cBIH/2KH2r47hZCbxR6Bhix
	AwtcTP8iKc6oKmIr4GsP55FxR+3va/Xu9bG9o41qW3nxXKGh/AkINtE/ZwL9RR8Z9FH4gnO2xoy
	K86HLQgdu23KSQB6GwGMw8kVS6oL1xdgYw10xMtPSCVPbuVU1vfADItx1DBcLRbt8zY63wHGliY
	SUAjI+F+VheDOlm+O0fDa+jSp1oLaiM9ts8Pnemy3Ob2GFXPbejbevxxOld6mKzJdeIbpj/FM=
X-Received: by 2002:a05:690c:f15:b0:794:c2:5e55 with SMTP id 00721157ae682-79439921fb7mr9492697b3.17.1769121427320;
        Thu, 22 Jan 2026 14:37:07 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b01b09csm2766167b3.15.2026.01.22.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:37:06 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v2 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Thu, 22 Jan 2026 16:36:36 -0600
Message-Id: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHSmcmkC/2XNQQ6CMBCF4auQWVvS1lDAlfcwLKAMMhFb02mIh
 vTuFhJXLv+XzDcbMAZChkuxQcCVmLzLoU8F2Ll3dxQ05gYttZFKadHHpXeRWNjF2weLSbbSqlY
 OjRkhX70CTvQ+xFuXeyaOPnyOB6va159V/VmrElLU58qgqdWkm+HqmcuIbicCulha/4QupfQFy
 UJOd7gAAAA=
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_143708_983053_1C3E47CF 
X-CRM114-Status: GOOD (  12.32  )
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

This series adds support for a multifunctional register block
(implemented as a syscon) in the Tenstorrent Atlantis SoC,
whose main functionality is to serve clocks and resets.
This block is instantiated multiple times in the SoC, with
each block covering clock/resets from a different subsystem. This series
adds a driver that covers clocks and resets from the RCPU subsystem,
which covers most low speed IO interfaces found in the chip. The reset
controller is implemented as an auxiliary device of the clock controller
and shares the same regmap as it.

The first commit adds bindings documenting the syscon block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  90 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-ccu.c             | 939 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 158 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 101 +++
 include/soc/tenstorrent/atlantis-syscon.h          |  53 ++
 12 files changed, 1377 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
