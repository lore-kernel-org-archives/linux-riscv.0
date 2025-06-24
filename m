Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95585C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0mYmSx2jD3dAZUhR6q62pboBgRUyDfOaJsqmn+SU2+Q=; b=eJS34jJdGq5tUd
	m4nMsWddZyniLxJqI8cxUU+Spz9Q6qFZCsuIPXN4CNsde7iPOwfCBlSgPbDuGic5N37lnyyt3aAf4
	5lwn55ABwuEPEdBu6mslLMz1osIzvkW/+UrSAx4h8kDPAFuK0Y79RAD2g6tcMcsf2yIDmXqT8a1J8
	KtCzf3OpWpGfEpTchdqPIodvaIVnBoHbM3V1rcSN8lJiJC16k/MCSUmPZ+EW+DsIIK6go4wRgRt7a
	TtBQlLNrgpmLe0YtYq/fZblCpI/FlaF6EEvP7lAIP4uSGSzqUSAD3/Ph139iM2iP0mBd+bdDGwA1/
	Qc6Z+l2JVnd8NgfcipoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64U-00000006D8J-0bJm;
	Tue, 24 Jun 2025 16:00:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Lu-00000005qIB-2ILF
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:10:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so3445055e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750774221; x=1751379021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
        b=KL7Ve2+xUDfGBZpgr9hzFRBq71bNBcJoJSRq9AzsZ3AcReVExjR6PuvA631K7Y2kPi
         Kb2lo49fRmlr/lf6YrMebfUs20XhrReK1iMdAI7lkDB8PHzbcu3rqQX7sG5wem0tiBJ7
         s5bKSpgqPxNKn0D17Z1NaP13yGZufsg+v3itKmT7OltjHDK9bwCZNKlJYdEQvY3H1V2W
         2Rf3TDFf0ii5/VH73h4ljY8rGg7VmMHPU3pMgnkM73/CWaO2fYYgkfkUqVySkxhkPz2J
         f9nEyrdYts2Sqn7o8Eq1HV7vdduP3ItxbzqujBnpbC6BCsXIn0VA9pEmkEovGYIP+KKC
         6/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774221; x=1751379021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
        b=rZfLv0A7Gn5e5bBdFLPYHHVESDS3nbqZo6asrMs+5nNyXfrR5htbTHVG08lFAhuDXF
         YUtl9LSrm3+lUhJx73O+BTYVgZHSGg/iDSZzB16tHQVrcB/qgSGC6ZhbVgwo6H8KMOGV
         bpWHBYS9GnTbw7g10S7ELWytQZhEBVJCVidtL1SW+gSxE6mUX14vHlh+CLi0EqSZBrl3
         gCnXsunpoF7XD7l3w43MhfdY8JclxVFiW5X7fErrKn5b3MASTV6Ulf4ODebGkmF4gAYi
         ZnwUJfiIocsK0uJCjUGqoh8r1TRlNsemf9STLfEuh2DPCNyTpY+ma8WjOeZmRZoNw9s3
         ZcQA==
X-Gm-Message-State: AOJu0YwQ+ue/qDz//B1894WkyIlW8KFnXIPJr5W/OOUsjYvBiW1/KKxU
	pfD1NcLVZJpcTaTFKuI57O50zFklbwvSE3MpZgndAMu5ipPUb95mnkwhqVTW1PjrBuU=
X-Gm-Gg: ASbGncsfAZJ0o4Pba0CFHnqVKVQ35vCFGKyh1F4LV6ngCl+7MynGfmiPOYCE4mMOSxL
	Ts3Kz+6gNa+N2OR/7mQkXQFsSL9iijrN4z+tDCFXaOgEKrYdPTbD9+Xv7DNBDtPutlYZFvIRCre
	BEg3ynk3J9L6vX4a/5YN+UkL98f75mMThtGN432Cvy7DMLzHHl2ulrXUDZn2P4gaM2B8proemz9
	iG7e/y5BqCVicutYOU+T1IR43yqKJ277iV++QaGWhjAznxLNZnnNOGCwpzpov8/njZmyvtZSeOK
	weV3pRBL/giILTgfQ8KhfrTjJuD7Y01VBt8kHBeEU9cmdUEIg/N0d+LbFBbA+4g=
X-Google-Smtp-Source: AGHT+IHAFIyNFoPHfcJpS9uG7ODV4IPOWAcQwwmdmU2AsHKw3IL8dxcp/xxloNOH3Z3z2+I3czNdHw==
X-Received: by 2002:a05:600c:4452:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-453716b567bmr78480325e9.7.1750774221073;
        Tue, 24 Jun 2025 07:10:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805175asm2004223f8f.20.2025.06.24.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain trees for v6.17-rc1
Date: Tue, 24 Jun 2025 16:10:13 +0200
Message-ID: <20250624141013.81358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_071022_585784_75593D8F 
X-CRM114-Status: UNSURE (   7.34  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here's an immutable tag containing the thead 1520 power sequencing driver
for the drm and pmdomain trees to pull from.

Best Regards,
Bartosz Golaszewski

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-th1520-driver-for-v6.17

for you to fetch changes up to d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3:

  power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver (2025-06-24 15:55:05 +0200)

----------------------------------------------------------------
Immutable tag between the pwrseq, drm and pmdomain trees

Add the T-HEAD TH1520 GPU power sequencer driver

----------------------------------------------------------------
Michal Wilczynski (1):
      power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver

 MAINTAINERS                                 |   1 +
 drivers/power/sequencing/Kconfig            |   8 +
 drivers/power/sequencing/Makefile           |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c | 247 ++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-thead-gpu.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
