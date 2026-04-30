Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9EEFF887E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 02:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ielvh78TZY1EP/KBPPHCzP6RWTxH3x3w8YCQNi3KK00=; b=sDronqSTXAFaqp
	zNvXzSbDqtJ7v0jPcLarZBso1w+Fq1J2CRZy0p6mEpRHgb0LD1f/I9sNiurrnrHZHtTACQUaz2Ra6
	X/9Z3m97XWJ1Yv8irQdtW/IkmJIlKzd3Qq7HX8i7+qYcm480GFuvPW3vykroC4BUSu9QNtbxpKTr9
	yXSRbe/Bhr2ItwP9asI6HSpo0FzNiXIZDk6N41GHTOPHRjDJL7C6n+tWbGZduag6EfJ2S1LYkOfBM
	9J2UiKi8JWLvCCjkknGoBWqVnOZ8AG9/sRddyEeCPE/EK7fvAPN2wPmku71GGgEbr7GyXsWdNTo/n
	X/SJKdhcW2PGzMB69LHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIH99-00000004SCG-3J1n;
	Thu, 30 Apr 2026 02:28:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIH96-00000004SBQ-3CVI
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 02:28:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35d95017a68so258652a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 19:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777516135; x=1778120935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvKNB8FFlV6JIJdaaGCkRo0LW6S72vZF1V6svTAMliY=;
        b=WMnuvEsf/Avh9BH9LusqEqiLgCYko03fqTV5sKhfG2Nw4O/mLVL7RzL9nGngPtlcWS
         KDpdSq/9+qnDTDdQ8jJvxJqTpL9YMPgYhNhIprf3+J9RLL9FrW4hFQM/yNmaROHfke8r
         ZgHE4InFNv7KN0jimvsFJ55ZljfmRXPwVmoeyJC78KjbliOSLQx44LNRrmdXwwHcHDQM
         hi0U89rCGCGoMeqNRcdsr9g+myLqBKZ6p7cBbWhnZNSQFkV5HDapg53kDW1u2H3YCQfo
         dxAGTIRqQlWcBiROSFd6Eiy0t+Ljbb9eUa9K1J70Q1ahe34oEZ+BWOOLGbV/DkUwzBrQ
         ptOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516135; x=1778120935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvKNB8FFlV6JIJdaaGCkRo0LW6S72vZF1V6svTAMliY=;
        b=hYTTRrqORZUgHK15EiKb6B6AcTsn8CBBYkViPMDYVf7eUMyIVCmW2CSs/zzK1b1JQa
         tq0MSdIUxMLcukGKOLmlDtX06gsEXyOPoJpuUaIAmKZK8Kn+VPtpkU6K+tb8Mufe30f8
         JM+0XWsT0di4VtbVWkUnFPHcwbBbw2EbxTkPVujxn1gd/BXmCdHXPhQ46IAynGB/JaEL
         NQMVOquvRifRnzuU6pKMWy1CGBfTzH04AkDVC7dxgOkA9a6RpteKTBqZz56w/nFzeahK
         FuRauaN1EMLZ9Mz3udhW9QpoxhDZRnGCIlSfIBCbr3BOwpPvOLD7ta0rcXIC1SBUea8G
         +gFA==
X-Forwarded-Encrypted: i=1; AFNElJ8rmOGcZ+2ryQXf5pwTS2Ij1ATvDrRTEu9MZ77aMHE93P8HhjVK8Kc2CdeOu5hhi+4a8zs06E5aKhYMCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmY31FoQrti5UmSXk76l7bwyFdJsW+lMmr1FEJiSdPJozTxrKM
	cHJ2BQ0Ik5Gipz6ismN3XozRXtixFiptylkqoWQIkaNZQQpOTlm7U8qt
X-Gm-Gg: AeBDiev8tdP1Q04YekquKkAEw3rbwT6CX6jUliYSmRd2g8y9qKr/xUAsgi0GaXRTAFx
	xiPAFEiBhKUTZVNNf/sLxx8RInK+p4AOSN9jc62U8mI0/qOQhaohyF/6DWv9s8wbCGTAey5iDew
	8FFA50EqNLeFQwy9SbvXzSBwVsJvEd1s3VdH9H3XoyHOXmoyhIQQmIq4uwphaTuR7eacz4uiC2C
	mFzNqPGve3eigmgz2HLq3UGySHxyLbmNqmoKA11rAJ0SYPBWZuQNAQbBipIUo02baixqGMF0z9l
	LRNskm54ZgGWdOLV+cU5Pa3UuOa5bDdFkNxyoYSavOu/XqKsAkp3C+0vfItqF+5zKuKYSeM7xPA
	p8LbmQ9OtgfLsKBp/0d6MIgszLGFlXUdHP+vdzwIB+hAHYANnl60C97cJ/Qw2dbBqJF0BhcRtJO
	wUDoo4IJ39/uyZ+Z5boasI6GZGTmyQ1DlgRg==
X-Received: by 2002:a17:90b:3c4e:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-364c309c2b0mr920821a91.18.1777516135395;
        Wed, 29 Apr 2026 19:28:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2a71bsm987033a91.1.2026.04.29.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:28:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: spacemit: Add K3 PCIe/USB comb phy support
Date: Thu, 30 Apr 2026 10:28:39 +0800
Message-ID: <20260430022843.1090138-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_192856_800493_E1B02F26 
X-CRM114-Status: UNSURE (   8.36  )
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

The PCIe/USB comb phy on K3 is a big phy that contains multiple
standalone phys for each PCIe and USB controllers. This phy is
required to configure a syscon device for mux configuration and
calibration.

Inochi Amaoto (2):
  dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
  phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3

 .../bindings/phy/spacemit,k3-comb-phy.yaml    |  63 +++
 drivers/phy/spacemit/Kconfig                  |  16 +
 drivers/phy/spacemit/Makefile                 |   2 +
 drivers/phy/spacemit/phy-k3-combphy.c         | 250 +++++++++++
 drivers/phy/spacemit/phy-k3-common.c          | 398 ++++++++++++++++++
 drivers/phy/spacemit/phy-k3-common.h          |  27 ++
 6 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
 create mode 100644 drivers/phy/spacemit/phy-k3-combphy.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.h

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
