Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978B4C54EBF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lskjdIysURpPshQp2HRZWBOLnbNAQp/0VxgW9Q7qwW8=; b=v/EBjaqkDRMxRz
	7kScvW3mT4dWUK2/RgtsWx86/wocp3tCHwHrD1Bi2dVTRv67mksow/JX7GzClqUhw2ZI9+vyeXXuE
	G9TsGcMZI3sGOtFIXKtgTF2URWOwdEc49md4Pfm+1LOZbIKv7CgxNxR3GRPd6GaTgXFoOkEJLFdgo
	B9LBXCFMru88/gPWRQ3uzl8aUsF5Gkd8fCefNasaBIM/ROsLeVVCvp7to9fKCDlfQF8+cT/J1aZ75
	6/eAm7COhN9iJ+ndqq6ao8dhhhuUngnuMGZhhEy5Onfzh+D4veqEpdFmPz5rp8Jc7RyCQUUmtijvb
	3zQqkyWyvS/O4gDe75qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCke6-003BIq-OX; Tue, 03 Jan 2023 17:00:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi0c-001pv3-EU
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:11:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso36038221pjt.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0/1+xwVSOl78TtVqWGcIupt5yvD4IwY5jPVM8+Y5Bk=;
        b=b0mGnvztdBrz/eFLximm769v/H7VgZ64bULZnXcY5BP0X4aY19eZweFY+waU5/QooG
         JmUWQQHr+hn3/TtqZOSyPS6mFTXwdf6PhGkfrXSmEA4TNhjgLBxIxHkRHV0c8hz0BKT2
         /H7eyFQzYemg3dfTSZFFoTrrMKWhcR46MNtPiTGtwsh14OUxM6OBuS5os8Fn4+As5QrB
         bOTFU0CT+KUHb/P7Xp6NBofRzWCWucg8dwS2wKmm6YIRzl01+r0nhoQwBdo5tvNrDs+w
         8gDhkNyhJeCNh3fr0b6u8AEq3033XVJUMkih7YFwGh1xHLHyQ074kLOvyvtFy03HEalP
         sLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0/1+xwVSOl78TtVqWGcIupt5yvD4IwY5jPVM8+Y5Bk=;
        b=rFt8pfv13houIq7TvS1sXVx3AflCl9+7i6Bmklqk9+PMIgWVsYZ/AZIf+r53uSdQed
         x5r1t18r/oh+33c7h36pJaMSNMUxddVGe5KzJ1E7R9dMzFajBlk5JotQyCyIKcJ69vyQ
         TpBSykmbPICAPUMBUFDExo9jL/K9Ewm00vY59kEKjudqAC9FJ47laICYlophTJdZtKdm
         6Q+icUja6VNQY6Yip2sF1uHo8VXAswvy2rYwfUJHspStrknPQZ37DB23b614PJhYMmL8
         2UUZqGefwcvkblQF7Ax00/HDOJn9HNfC+ULB7QitmLD4Kd2yXhtKpGWZWOt1iZgtImkw
         kFdQ==
X-Gm-Message-State: AFqh2kpGAiOIGLck2XMYib7Mu6pnXBUIHpb11RyWBg7UDWQEWjgkrlll
	0fXCWC8xkD57cLD40kd31EaXMw==
X-Google-Smtp-Source: AMrXdXvZtg4dkclTJdJxMSBRmE+LwGZZpjGtJv3rOMeS6rPZv3VYVAEdULNyKHSxQUobkk4F+RecJA==
X-Received: by 2002:a17:902:c382:b0:191:4378:ec06 with SMTP id g2-20020a170902c38200b001914378ec06mr51792779plg.61.1672755073254;
        Tue, 03 Jan 2023 06:11:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a170902e2c300b00192bf7eaf28sm6146117plc.286.2023.01.03.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:11:12 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Tue,  3 Jan 2023 19:40:59 +0530
Message-Id: <20230103141102.772228-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061118_787447_BE00B8DC 
X-CRM114-Status: GOOD (  11.18  )
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

This series improves the RISC-V timer driver to set CLOCK_EVT_FEAT_C3STOP
feature based on RISC-V platform capabilities.

These patches can also be found in riscv_timer_dt_imp_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased on Linux-6.2-rc2

Changes since v4:
 - Update commit text of PATCH1 based on Samuel's comments
 - Renamed DT property "riscv,timer-can-wake-cpu" to
   "riscv,timer-cannot-wake-cpu" in PATCH2 and PATCH3
 - Updated description of DT property "riscv,timer-cannot-wake-cpu"
   in PATCH2

Changes since v3:
 - Rebased on Linux-6.1-rc7
 - Replaced PATCH1 with a patch to initialize broadcast timer

Changes since v2:
 - Include Conor's revert patch as the first patch and rebased other patches
 - Update PATCH2 to document bindings for separate RISC-V timer DT node
 - Update PATCH3 based on RISC-V timer DT node bindings

Changes since v1:
 - Rebased on Linux-5.19-rc8
 - Renamed "riscv,always-on" DT property to "riscv,timer-can-wake-cpu"

Anup Patel (2):
  dt-bindings: timer: Add bindings for the RISC-V timer device
  clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT

Conor Dooley (1):
  RISC-V: time: initialize hrtimer based broadcast clock event device

 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 arch/riscv/kernel/time.c                      |  3 ++
 drivers/clocksource/timer-riscv.c             | 10 ++++
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
