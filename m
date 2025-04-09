Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A63C369A5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oHRm7w/96RF+Yl4pCbTrizdQ2EPk3KDqNJ7wWheb1Z0=; b=KqpVkdxKNYCQMS
	/xYWcfFp+eBCwguOJMiQKWdDFOnbiISIFFbDeF/JbcXbkagaeSJszMaUyJg5Neb8uwFNUW6xeSv+k
	dkn6Dw2PoTC0v2hsKj6MUEN2tZBQ3pLV5dvKqa+wOHN+VAyNKW1nk8oklAmqlgRhvHaVS2PPhviRR
	J30Khow9TKRkvEeuPnAsgIsu+piHKam1q3mAdUJz1Pz/3gW2QkzgOJru7mZggMrpiyQNQk1aVwpkO
	J3lgtFGjwiSxBCDL0uHic6i1ZBJix47qVtwSeRTvIbB9B2D7B6sCymyD36tp2t3BHhTlMNyy2OlZm
	doznl+yZM+3xtzN6YdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNU-00000008dpG-1Aib;
	Wed, 09 Apr 2025 21:54:36 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnr-00000008Ya9-1Vzm
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:49 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85da5a3667bso5298139f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233466; x=1744838266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=TuXNoIfotjJv4U7hpuTF8iWeQQP06m2ZSb9aQeKj1AD7RanZdMXwFFC6ka9egYt8AP
         2Wy9m+5COwFUX4QeCxm27d2WyDpVPQbWIxz4Wyl5lLLWyHWBgCA6KpJlBRlQqoHLD6pJ
         Cnw1nmgn9b4oqzz7D7HgqDI3SjqM7Oebc/lx1hsmCDTkx8yppScvj4AFWsUhS/t2EpZA
         qxe+h5c7tEQkX1RpkeslPP/AY9VwAE2qsuM+t94De7reRa5rU+zBMc6FRHfGhfsH11lm
         lSWq3s9+4EtgJTe7FKoH0TjJ6dAjCWhgMQBgVc0quS8sTa6iiwx7IFagrF+Hkt2rVOfB
         UWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=Z281iGxVkX4IaRNFNX/qepo9OVHnYLoEYTUn0NdpB5V3cNW3ywE0jvxwrPwCiAGPLw
         Unv+rl4O4THbaNX/C10M/90Kr1pyJNIsAhe41WKZEkN1Aoy2iw6uI5ZeVhHdb7hR2sYK
         Or8RCFWpOUW/ufY/8haotyxDtrLh7q2LsrPUWZ8VpVt0bMS0q2KxYejXq4z0LxXrEqQX
         NyqEXQISQ4ucuwudL82oUhrrMAiSEYqX0OV8WC9TO+6zsFfUcWvHsXPAUVD9iOwMG1JV
         /lrg+EVRSzYX38xSlJRCwq6F0kpapTHGAzCluFSRNiPMoQNXJAEO1N0VmcjwKoFbwLMV
         ZF6g==
X-Forwarded-Encrypted: i=1; AJvYcCWvA3ikE79LJ41uGLs34XkbBJRAqcagoFd1ips8OmV6FTbytfKMQvpyAU2uPw7knQ7d72pPQrUqwfaa7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDk4X9ArwG8obm8qqGfBNLyeVJexWSR88PLbcKH2RPfajjARZ7
	mdoqen7VbFQGTzbrlv4abl2JDZpAvBp8XJ1JF2r2VdHjlW7UE1MDtZhU2vI4wY0=
X-Gm-Gg: ASbGncsLGpMgXAj8BB3KHuvqjzy7WpftR8JSoJcSMY8wCt4Ljr/4zVKuzdaCDg5EW8f
	YRzcHFSL+5cnEdk5IoNPNj/CPIY9dCM11Tzfy9ge6BIt3Ikemf9IEZIuVkGUPtA3lB2D8oSs7X8
	EZTScuOERSqjhRMQ8ZLnQPIXV35J3u4pzlrCABuvOla4ELwvyWROcf8XDPWbZuugIgkS2CUBOUR
	ZWaUHOpJsTIUPZRTx33DK95E3mQ7rDKR6xY7w+lRfRcZZ14fGGrX4xsu4Wfj7r9xrgPMh1XYyIf
	tLnMTwi96cNNyZqa1rN6dKHrULiG0bFMXhehnLc/eNVW4aN9wzeOxUO/HqdHz/1HWT+cvAPyZ79
	cM7V4KGERog3mhQ==
X-Google-Smtp-Source: AGHT+IG6Fs0mDXRYU2o6Td0yWxwYb8N9uHgcDDzyd75KPdUxyiPuO9N5OH70dXQk1TVcz0gCoG5PKQ==
X-Received: by 2002:a05:6e02:1887:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d7e4780824mr6626785ab.21.1744233465833;
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] clk: spacemit: add K1 reset support
Date: Wed,  9 Apr 2025 16:17:33 -0500
Message-ID: <20250409211741.1171584-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141747_531429_317CB39B 
X-CRM114-Status: GOOD (  15.67  )
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

This series adds reset controller support for the SpacemiT K1 SoC.

As before, this version is built upon the clock controller driver that
Haylen Chu has out for review (currently at v6):
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v3

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 340 ++++++++++++++++--
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 488 insertions(+), 27 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
