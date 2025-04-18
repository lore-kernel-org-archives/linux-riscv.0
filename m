Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40507C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJfLG9vuu3sohOwFnilsYB3ECEuM9g+s/nyG8JHhMMY=; b=FlOxLXnNM0wifp
	uegdJkIHM5x2odOB/rKsOml8/zx9YrTpr9v2HXG+Xp6GfP7+N9R3U8meAALmulyklJFD3IzmqdGem
	1vBfOHvfthle4zu6aW5fUv8mh9lvna8HAWsyzFxhM8h9Bwu2QRnfcuVbu7CafI6SZxWtWBlgRHOVv
	Qr3nPvdp8DNlR0Q7soOw4sYwmbAAaXcGDre/Wmm3IuJrAATz7EiBJEJ+mJc/COa/ePX7zvjynCkXM
	7+1hiWzGDCZt7EOnKgjnlgr63I1Dr0G2AGhLXkr35ML1Bs6lWkrRF7hOulF5iC+DN/11n8XEXSvLi
	M5yGf/IwmN5yDlEtNOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUe-0000000Es7z-3Ive;
	Fri, 18 Apr 2025 02:30:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUb-0000000Es7U-2ebX
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 02:30:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1166070a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943412; x=1745548212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5U2m/1zIwftem6ijc0txeow0NVnpRTFEaq+AmNYeLGE=;
        b=kgH3XtZ89L5fOvFcsubeA2io9weJWJzWPLvFHNgFzW+6vdIFJjdY1xpf5yIu88hXNK
         RQrx8rIUuVaz/E/6Mp/fPTKm9R4+Ti2ESTJrV4pnnvDuRmn73zflb76Zra0WaH43merY
         GfUvwMSCK07c+M5OMm0Eg0S6EXwB7bmiKQwAC28v21bVGHzn45NfMKyPVp0M1XsY6zp9
         lcHqc3JKBivHwEV9aZx6Qiwyi/VouELEecgeyigo+ncweGd76EV7pcjUQcHZnkki+tqg
         n/FBUh94R1oRgdlmWpnaETLALbK2EXChEqSq4mgpX3VvCXAzHE9RO/mVXaUwS12USOOf
         E5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943412; x=1745548212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5U2m/1zIwftem6ijc0txeow0NVnpRTFEaq+AmNYeLGE=;
        b=Ay//Nia+N3ixY3Ivux3mqGMGRu8itRgB/WrKMN4pAFrwkpsFf4hrJ5HMBSgGGyHr44
         4qHIRt6fInBxbYSDpMe2kmSQOsRWsGp//aK7inqysajrnsvN0OZUWglYlxhT5yS5wvMz
         cI+CTfEX7gi1nDHp5f2zTmMb9b3qfU7u8OeM9NaqhB88s9ZFLT5e1DxgyqHfkei3K7OA
         04ivX/XMEhlJkkoXliwz2CXdlAeV1AmWIWcVEvXn96u7lPcNa1bYdTIo9ovvi8MW8xwj
         G4ws2VTuAPMY3kgvXyDjk5lotdVvvMZh6YA1qbVXfkN4sYbxpi7n2QMJRycZn6mXU0Pq
         rqeA==
X-Forwarded-Encrypted: i=1; AJvYcCU661Bx1U2DK+/BRLgA3Q8QU21T+guJ/52YTyMv2IhB0Z5sXiR/AzL1dVq4jSgdu/UDND1m+yv6J236Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbhZ1DH6crao9aTmD94r3HoNf5+7ek35LAPFUvfW337stRkDq4
	6iyHLWNp7O9HUf6Zxb4g2TLR3ejBXn4UtBZnRvm82aezc0xifXm8
X-Gm-Gg: ASbGnctT6+frUG+rvWDUgaFntx5Vvz0dphtVnggRb4scuNUOVS3WIneSNNR2CH/W2k6
	hEW0Ym4VIY9Ml/h2fztEhlkF3Ry5Elm2p2Lxukrm0/GiKItL65JWu1VgmOXrvpa5pkY2O2iN0je
	GDqK+lQotsC+a+WmapVUvJvblMZGr17SMDR/+/RCL02YpQ9bHPMOd4VuiXChS9NlfQm24uPdG8Z
	Vp6HPkIOk5fAlgGKO9G92ZMvQfr+vCT16LWd8FA2ojoQ/R7YUZTkPEifH/YSRuzSCd5T+3mMLhi
	lRAVHe3RDf1C/6KW1QGedb5zECFcTyTN4vldDwV5oSQOHg==
X-Google-Smtp-Source: AGHT+IEx1z4qiAeTBtr7S7/FGS2j/mqRRRu2uEicuvNdRBKYecwQYjYYbj1Nrv2sWaIQGpfTFyTyeA==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-3087bb631d7mr1870914a91.16.1744943412361;
        Thu, 17 Apr 2025 19:30:12 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:12 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Fri, 18 Apr 2025 10:29:43 +0800
Message-ID: <20250418022948.22853-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_193013_672729_5D5EA8F3 
X-CRM114-Status: UNSURE (   7.44  )
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

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v2:

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
