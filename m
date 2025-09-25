Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9CCAC5AA
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WhCARPk5Gw87HjFL15wbQ8C4tOesYK8DIddKAZ0blv4=; b=JdzmuHqb3eL83+
	/epTBnSZr7wNAjQjo29zgz6DnEp5LT+7IDEDgiwsnxvOiTeInidMLiH09zx3p/OSnwbe44dQkAdpV
	rlal0tPpNCmD9k5QIfOxJNFp7cDUEgSirfhKyikTaXTztIQRmCdJLAFYEKLd0tKy2wvN4BLFNwiZD
	yxzsA1WYZzCw7E1GPFzyozNyJltv92YVz9omawhfj53I9nMd+HQu4QlqhjW4jVOW8AGWGWrt30dkt
	4CQ4mTFUKYWWvbQHalCmJjQfMdlc/T1Cgqh+S5Ik+dmJpIoOffVNwIJa9IRK+UCI/0lcUTIPnzAYB
	5CX7pMDOEqcLn7jFntnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heQ-00000007H5W-31ce;
	Thu, 25 Sep 2025 08:48:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heN-00000007H1H-2fSv
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 08:48:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77f3405c38aso797300b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758790103; x=1759394903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gphyOsNtOdKDqs9aSBR2mOumTKsLxXqSuoON6fWyPlc=;
        b=D5ra5J3pv3mQF+pT0ttygy7dIe1EkvYfr2uPfXyTmAU2d+Ehj3M4XPCGjcgkMzVAw0
         eSY3mfY1NKTg4s03uPg2jPFabGlGlt9nttv5XVGjwV3VzBgylREqtgVKjJJtrPfTdXxu
         dRZWEEqHjXL1hAmv944b3CGvClVSq3alXib7Ft+VpzrzdTsS5Emr2HaW9eN9vHhNrItN
         3EKAMc+vkmC/QSZ7OOfjfzftTk4IrC4S3svMqOy65NmqgXog5FBnaZeQLt1R64/Cybd3
         2ugJs3qHCe6ULc2/30SVTu7cn3DStgY+iF7mGO0+OEBw1D2+sCJ4U/1/DUOo+paxVSxx
         bUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790103; x=1759394903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gphyOsNtOdKDqs9aSBR2mOumTKsLxXqSuoON6fWyPlc=;
        b=w255CVFufvZxGi/aIatxJJm570kSBjtvRSAkyqz4QLcmdiQf115Vv2/WCC+mZVmOgu
         i0YNjwk+0b4FU84mFEI2nGrrNRSPkUtjRvIDxGjp6jHCpG0GLIiXypvLXQpzQr6d3zvv
         wDGddp4Q6Ku8OEBEG+95k/5GIAja6Agj3hnNbwEstHi3WzmWYhbmX0kvkhhtxwR+16CV
         udRQUZKiV8XLotGHbhvZqk0/vuKxMtFG5ONHhoJ1CmUjPTMPfamQYkS/0ycaW+Qdl+P4
         6g03z/zcYHbY02cBbxHb7/8nf0a6DuCWOJSTl/apAf6zLlbVgrl4PLFaao114ePUqIbn
         xsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5tgSPiROp/WpM/dS/iJCXbYM5caztrMMr+izOF97AyYOhF6bxENaa7GMChfNeWOC6VNCV1jt0T4d/rA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV2N5/wv1I9hnIYF5GsffIk+bYDowqdocd45BmU8siiTGa665b
	p2q3feJTr/Y3unMYgLCdzyiqnsvg7Jcp0rudVm9MR9PBPf04BOD+y2EMY1dpXjwUc1E=
X-Gm-Gg: ASbGncsnelaCkwKD/f8DN2EAWkC3FoN5Uy4pSUanYsVU3wQCGDgB/yxhDwsB7Uh2uU5
	/t1FyjU62JN+tY4F6MXU6cxXZKpeSpE37aX9fzv1eSidYw0UzGY5CHC0knMotIySxRQL16SH9nF
	3RkM6sNFWxUzkmFUIUb4A0D6Ugr+c1hZL5dlgpnSC6n/a/L+y1tkPcjaIWOOIFnUpeP5BotxMUx
	KQd7knCT9XSKdKM0JYLDSOge0K3BQ//Lj0YR1+9GWyBo2ddy/tlowmxaRzpvKUWImPuGOqRLt+6
	vmdsZSJ/hMDapKUjCq0uwxLvi3Pg0+eKQ7sNDF8mZeYh+Ivzt84WIkc+ajhhCs8OyE7ZYbVBiwP
	ICGd4wCZZdt3tLSpnAKoaP0I/JdhnXnSb9eQWaP5WEvWYT+OvH9zBSvyyn+agkykr75ZDbNs=
X-Google-Smtp-Source: AGHT+IF5o7MsY/7di1Syx2EkRYGotHHFJz3EjXekBBptiHMX8QMKY8RAgGzMhfi8YFQVNtPQp29NcA==
X-Received: by 2002:a05:6a00:1255:b0:77f:2e62:1e3e with SMTP id d2e1a72fcca58-780fce9a124mr2974997b3a.18.1758790102952;
        Thu, 25 Sep 2025 01:48:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023ec6aasm1321867b3a.46.2025.09.25.01.48.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 01:48:22 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Thu, 25 Sep 2025 16:48:04 +0800
Message-Id: <20250925084806.89715-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_014827_800900_BD9E04F3 
X-CRM114-Status: UNSURE (   8.85  )
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

After discussion [1],[2], hardlockup_perf cannot be completely replaced by
the hardlockup_buddy approach, so this patch is still being submitted. 

v1->v2:
The contents of arch/arm64/watchdog_hld.c are directly consolidated into
kernel/watchdog_perf.c.

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           |  5 +-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 81 +++++++++++++++++++++++++++
 7 files changed, 98 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
