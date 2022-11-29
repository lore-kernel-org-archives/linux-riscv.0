Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6D5C4708B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K6yXoQlXlGG6mIVJr5WWgS9gB6TXyW+XQyMZAiSXs8s=; b=E9y+Z3q5Pn6dkS
	0ClKL0JvyrQcEM6bXotcW0TAegRWJsIYF1qta8sMGrR04OPu/VKsEPXTjFgJj3bbADbR+FjIhyCSM
	BAtKYQXtjr6rK7yiZtJ73T0MiT1840gRPYUYdFmU6WJfLAahjCCtJ/tuxDtrKBbmzBRpVT4LVx/zM
	VKp7T7Ks1BuwEROfEMgd9MD1KNdUfAgtVVRVagq3AsTZ0vDcOKC1SoHV9aRqUPXxuqkaWZ4T4E3C4
	8apGCEuX8Q3zO+Pc2Z4v6TQGN4BoA8UaYS8y33sEXOo5FPeNV1DnqQZNIL0ov8zB0JE6+lQcGubtX
	GqIj1M3s/hvAGIV35HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Cr-0092wp-4B; Tue, 29 Nov 2022 14:03:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Co-0092tK-BY
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:03:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so13512821pjj.4
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pjq0SJx9GK7fi74EZz816s2rBUHtlCxatQJYtnjVbuM=;
        b=HRYib5uKKfPx9dsXiXvzZ9/38Ir8ibfurUtJJpxA8EOiMLOSgoQHFo0Q/WYnFHaSTl
         BzDPFLTRFg2fHnyZBhxdlCj+Qe9hPUU0iFaM2kuBv46oMQYrqT40aZ/sx6zCL3/GrX9W
         8zO/EqcFiYmP0xGdhLWtk4LJmfOG5rnhWIDQvb5ORxKoCP6K1bgd9AK7HkpoQZfGVI1O
         20i54mss0essruIsuaaEnRJ1sFHCBT5j4OwNc53MDDMJqBL/h2zZyXQcANvlkqy5yqrg
         kCbVXVcWHFV8UD1naeeLA26+g43l0Wyx4KDkAtm1udPorYm9S/8OSIb5ie87X1aYLr5l
         DYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjq0SJx9GK7fi74EZz816s2rBUHtlCxatQJYtnjVbuM=;
        b=DzZufH0A59a+mjRd0CalVGP5xEMVuA7kqDB2dROG6oQnd6b6c4X6fkkhqlnZxa8gF0
         TTKuoyxaCYgYCl5/9NBNNlle08hqo2/BcGdS6eqFwhb5L/LvnYkBdIRYNdlshm6WLJg1
         0nqNG5/S8FeQmDEYZ8pF+9pCSgejoMZ+oneEhRHrJyKUT+9eS/mUlip8KYfevOqqA3NV
         o4fjeDVDQLRdd6aB+GGcsvZ01upFTNcyyTXQLSUWZTwSmRJTOF4fxJmGXZM8GYMxX3oM
         jWK4qGMDPIcD50FquMWiw6SUlQt0dac9xRB3iiw0tofJ9nON4SizfiN09ziKgM2HXNKQ
         NDrQ==
X-Gm-Message-State: ANoB5pnUXCx67VskBh5rxtW8LhT0dvgqGfaJPM0d6hddDWH44zpSeDw6
	nJ2cdgXy4d1sHJhAtWIwNYEgpQ==
X-Google-Smtp-Source: AA0mqf5NLlwP8x1H+pb8ntntoBOW1EREsRhfbakgtMzchWSKW+8ALoxPQii4Oo+V7X44nfgwYVsrtg==
X-Received: by 2002:a17:90a:c68d:b0:219:80b:6ea with SMTP id n13-20020a17090ac68d00b00219080b06eamr24396424pjt.212.1669730603217;
        Tue, 29 Nov 2022 06:03:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b00574f83c5d51sm6013747pfp.198.2022.11.29.06.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:03:22 -0800 (PST)
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
Subject: [PATCH v4 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Tue, 29 Nov 2022 19:33:10 +0530
Message-Id: <20221129140313.886192-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_060326_438916_ACF1494E 
X-CRM114-Status: GOOD (  10.44  )
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

These patches can also be found in riscv_timer_dt_imp_v4 branch at:
https://github.com/avpatel/linux.git

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
  RISC-V: time: initialize broadcast hrtimer based clock event device

 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 arch/riscv/kernel/time.c                      |  3 ++
 drivers/clocksource/timer-riscv.c             | 12 ++++-
 3 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
