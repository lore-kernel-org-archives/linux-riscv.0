Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC0E71068
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T8dwXdSXjEoiYkMTKdgVF8NSCi4S/Lqa6pWJm5ygvLY=; b=MLissdVOX+23xo
	0OFhq6Eg/DJjbEbTyBYiB2kqow3LBpxkJ7bZLZ5d+unMred4EesMa2ffGAr9QK2m6Ho64UbhRlFhB
	E7tRhBLeQ7DK4TGGVQucC6dCcWM0WRbmVC+m+qsxEdmxn8BrEeEfWH8ZZEH/IueHu9uUcmBIzVpz1
	9JY5QNoLyCgvNCBSKWQvJcK9op87OTKdkuXKDumQJRVH7Bp1fwCZmYOZPa7uNb3N3pe6CeGw07PDO
	g6FhVctu/9EPbSN1bSHY2HXEaeNnjciyLPTPjLKYLWlk13A7BMfZuiymA95ywIQVWCq4NWrtT1Fas
	taFRCQGjBJI842j0Q/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDK-00649J-1Z;
	Thu, 21 Sep 2023 12:55:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDH-00648M-2B
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4050bd2e33aso10043355e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300920; x=1695905720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+9S/3XqI29ycjBSyOtroUTvlyReak1CC86dTZJCqDA=;
        b=PsYOylHuU60DjbTuFWl86ymYc2BjW8vUhLqEKlJQ9H2arunzbjAbz070Q7Fm1rgavK
         kr2na7hUA8EVcPn1DezxJZHZmBRB0HZOJcBWCC/eMSBD984DeiMEQ0v8TM54Nd3Y61P8
         jOnTcaAnmGn+xSO+Gu+/E73poADzvpFmIdyjDjkHBORBVpLOGyzL0IVqGpxAdvpsF63J
         4nMQsES2DT93Fg09yX0LqUmXwU3PRGv9yXO2c77DdLvbhAeAcsSanKl6xzcSfF/gKyAO
         2VgJxT7F+1D9V+fTJHYp+nJaxJqng1pbu2lcdu3c3D3OyIUD9gJVvPPUciLD97bICG9C
         iIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300920; x=1695905720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+9S/3XqI29ycjBSyOtroUTvlyReak1CC86dTZJCqDA=;
        b=EJC2Kt+cIX+bPjIc3bomtTi3+VCJHb1dW7ojlRydbNqgU50vYZ2n3wjYG56PvrVYYd
         qiLawQ7SEcMLwu/6de0QtfK7mwr5EXEajBAuUAxOqGV7Fx15qSKU96QONq8I3eZIPicb
         kpsDdMc9rr9kOEPqlgRsXspvYaVmmFrl2OKhibjJZpcIlVyutVYhDDNOB57DCiJDnxk3
         1iRffphWV6RdeABOeL9uYHw/NpW0xK/9DK55Nq8QKeiysd8+fVdRM7AGTfRvVh4nQfwS
         +XDPzzpBotX84anQrl6ExjPiA5lymR3bpP2WmFbnnClmBrU277jvlEQrOPho/tHu1dbw
         1jUg==
X-Gm-Message-State: AOJu0YyQKH0XatCBbkDizChvbxskqZLerF2o5SkvQvMR/CbGlnedSJji
	2lv+hj5xVlZGmlFCAY/1oN16WYXTLX3XwBUtTO0=
X-Google-Smtp-Source: AGHT+IGgQwK2JS82TQ2lD7oSFNghifrKucXOw+rYSICG0dP08S/n69DETIThJSkCM7K3GUXCUUNWLw==
X-Received: by 2002:a05:600c:2193:b0:402:e6a2:c8c7 with SMTP id e19-20020a05600c219300b00402e6a2c8c7mr4690363wme.7.1695300920015;
        Thu, 21 Sep 2023 05:55:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id hn40-20020a05600ca3a800b003fee0741b8csm4749547wmb.23.2023.09.21.05.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 0/5] RISC-V: hwprobe related stuff
Date: Thu, 21 Sep 2023 14:55:19 +0200
Message-ID: <20230921125518.175428-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_055523_752351_5CC97CCF 
X-CRM114-Status: GOOD (  12.33  )
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

This series clarifies the hwprobe interface and introduces the first
hwprobe flag. The flag basically reverses hwprobe to go from getting
values for cpus to getting cpus for values. I've made the series an
RFC because for the first part, the clarification, I'm not sure if
the only person that needs clarification is me or not. If it's just
me, then consider me clarified and we can drop it. The second part,
the new flag, is an RFC, because so far the only use case is the CBO
hwprobe selftest, which this series is based on and the last patch of
the series applies the new hwprobe variant to it. If we don't believe
other use cases, or use cases that care about having to do the probing
inefficiently like the CBO test does before this series, will crop up,
then the second part of this series can be dropped.

Based-on: 20230918131518.56803-8-ajones@ventanamicro.com

Thanks,
drew


Andrew Jones (5):
  RISC-V: hwprobe: Clarify cpus size parameter
  RISC-V: selftests: Replace cpu_count with cpusetsize
  RISC-V: hwprobe: Introduce which-cpus flag
  RISC-V: selftests: Add which-cpus hwprobe test
  RISC-V: selftests: Apply which-cpus flag to CBO hwprobe test

 Documentation/riscv/hwprobe.rst               |  27 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |   3 +
 arch/riscv/kernel/sys_riscv.c                 | 162 +++++++++++++++++-
 arch/riscv/kernel/vdso/hwprobe.c              |  10 +-
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   |  26 +--
 .../testing/selftests/riscv/hwprobe/hwprobe.c |   2 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |   2 +-
 .../selftests/riscv/hwprobe/which-cpus.c      | 156 +++++++++++++++++
 .../selftests/riscv/vector/vstate_prctl.c     |   2 +-
 10 files changed, 353 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
