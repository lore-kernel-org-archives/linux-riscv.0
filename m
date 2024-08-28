Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FEAC5474E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9QXXlW7qW+HTtjjOH/3tal7LwR+XSVhA2N0OBRT/7vw=; b=ZYOE+yINDghU5B
	6/st/jKM97lByaQ+WRgSUQ/0eBKkQJBewYb1ypaSqW4ICYIqkteY2IFz2C7lkrHC+qgfRlR4CP7OY
	SzWZ38TM29WVoHyfdBGOkBU9AdgOteA8JFw3iBI2/uzGf4vSucYRNlWjvhsoE57REocKova+ipfIe
	uhc/jZ9z5uLXXCtxmCmic/NdXvA80nkuWr+Fhq/I1tecFbPm432rOKmB5FzOGiLEnSPf/QV4pntUs
	XTQkD35blQ8rX5H/K7tFxeCCafPGMxoOy0GzcXfVsLArv4zdnzIqKMx3x/r0/dAqqGbh8dYs4Nld9
	M++oH1us9xDW9C8hDhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbf-0000000ERMO-3clV;
	Wed, 28 Aug 2024 08:00:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCaP-0000000EA6H-3j6N
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 06:55:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20223b5c1c0so58208585ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724828120; x=1725432920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y574CmIKcywIxcvCP6EUBAVLWIdKH8rgpanWyLXGN4E=;
        b=O+tlloQobIjKIyJ4PBqEeogepv9e/WhWAq2d8c2T398CcIj+7SpQdlLHyWH/1miWde
         ffOZr0M7VVu+VbTUehLzSwk4hrkV+VVHWq0hpBAc6zlSGau+Shc7vytkffpZxfRpM3aB
         RlyLi/zHPGuCQXKpaBxX6/1Spu+4nrhk1lHzYNX3xCw8FC9nO4+md0vzonus+v5gc5F0
         nGlvydRmjrPI1ZG+aPWhNZPsZVpnI0LPgsd88DCGMJPWPYlsVQGSFpNqDVjXmNn1KLFY
         nwvhdL8B9S6aNELT8Atzy5jQdwyX+A9Rwt7KUOIpxUv5qWIth+MNIPiXYe5wmlELTNQh
         pRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724828120; x=1725432920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y574CmIKcywIxcvCP6EUBAVLWIdKH8rgpanWyLXGN4E=;
        b=LtxKXvUDcprgJCAUNg2VkJ9qDTVlal6S08ZDxpgVUaOneia39n1C5uQRtbxB6TcFNn
         QOOfytE2edGoUtrZrp2X0f8x1RxJSR4j/tMv2SR6u+GGczj+rpcZenfiaJv5TlrKQv9w
         3GgwE+pKIKMAPdO4E0LTdA+x9+WSxI2jRUvv3tr46zBl+6jpHKNjuj2EhmqCtiwsqofg
         40SQEEsrC1P2ErRlah03A89kh2DOoQQb8BUzGA9lrOf0i8dYYnB2ZLzOos/f11lacV/R
         /GOLh4Fdegz1kd++NzzSyLEMmKmqxgJtREGw5hrKJwOGQEh8HNtj1urEiF7nJifGnI82
         mJiw==
X-Forwarded-Encrypted: i=1; AJvYcCW1NrCWqZhUgKEz7Rwnh7hcpTvNN+F3pjpD81GBmeC7RMWNhkvdBM4DO83UfsrcJUHc3qGxUQim8uslRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUkE6QJI/21NA0Sak84OUH9m9xNGENVhCej41761ujWCFOKvDd
	oYBGY+PZ7n9okOk4s/sSEsOslXGm3qmzCELal79J/Td2kn6AHt0/UHHl0h3a
X-Google-Smtp-Source: AGHT+IEr75YUiPOn/QVcVEtUzyKHpnQasbYQYnkmKjNPiEoQCXEnkKLiZrGu/ut1KsP2T0+uM7FknA==
X-Received: by 2002:a17:902:f541:b0:204:f324:e7a8 with SMTP id d9443c01a7336-204f9a3e92bmr14866705ad.6.1724828120492;
        Tue, 27 Aug 2024 23:55:20 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385607f94sm92816005ad.182.2024.08.27.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:55:19 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: zong.li@sifive.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Pragnesh.patel@sifive.com,
	aou@eecs.berkeley.edu,
	erik.danie@sifive.com,
	hes@sifive.com,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	pragnesh.patel@openfive.com,
	sboyd@kernel.org,
	schwab@linux-m68k.org,
	yash.shah@sifive.com
Subject: [PATCH 0/3] clk: sifive: Fix chip hang when booting linux directly
Date: Tue, 27 Aug 2024 23:55:17 -0700
Message-Id: <cover.1724827635.git.ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_235521_954315_F7F91F21 
X-CRM114-Status: GOOD (  10.98  )
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

This patch adds the release_reset hook interface to __prci_wrpll_data.
For gemgxlpll/cltxpll clocks in fu540/fu740, the reset pins also have to
be relased for the device to function properly. This was missing in Linux.
The board (Sifive Unmatched/Unleashed) happened to work because previous
boot stage (u-boot) usually already enables the clocks when trying to boot
from PXE/network, and the release_reset logic is present in u-boot. When
booting directly from firmware (OpenSBI) or when u-boot isn't configured
with networking enabled, the board will hang when cadence/macb driver
starts initializing the device.

Fix that by taking the same logic in u-boot and apply to linux.

Bo Gan (3):
  dt-bindings: reset: sifive: add fu540/fu740 reset indexes
  riscv: dts: sifive: fu740: Use reset index from header
  clk: sifive: prci: Add release_reset hooks for gemgxlpll/cltxpll

 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  3 +-
 drivers/clk/sifive/fu540-prci.h               | 16 ++++++++++
 drivers/clk/sifive/fu740-prci.h               | 31 +++++++++++++++++++
 drivers/clk/sifive/sifive-prci.c              | 23 ++++++++++++++
 drivers/clk/sifive/sifive-prci.h              |  8 +++++
 include/dt-bindings/reset/sifive-fu540-prci.h | 19 ++++++++++++
 include/dt-bindings/reset/sifive-fu740-prci.h | 19 ++++++++++++
 7 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/sifive-fu540-prci.h
 create mode 100644 include/dt-bindings/reset/sifive-fu740-prci.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
