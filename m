Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83857D13596
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 03:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIbne5KEfv/OteDtZYGk1BgoB3cAvq3nUsebMu8tjgc=; b=Q/Q9t+bf0HlKcF
	viL3kXXf6MrxfMepG71ySE/5tvWwnDbn+GFgIOvJ5Ynz38YjKIKEq6tUSvx/NDn7EDP53Mf9T7bYa
	Gd94eoL3QDHZoiVdlFJZLZK90hq5KUCb/mGb+vum5hOgIVOBR2K6gNvbM3F4rcRYkxqxVAjW3ese/
	ok/PJBr7yS+a2gZNnyjYgfflF3WSxM1QJ7viJPZqMCKzRfHMI5Rgl+thsLQN1+DdOrqVVf3/b71Wx
	bzEg0OXUwfE20RZ7WxP4HVJChP4uncPY7ddw+wgRWBasw6az6TDHU4hFmu+nhqvseaxtaMj++PDc1
	cHgust4hsEWWJTDWC3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GcQ-00000009SSz-0Z5K;
	Mon, 28 Oct 2024 03:40:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GbQ-00000009SGG-444R
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 03:39:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so2834611a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 20:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730086776; x=1730691576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBmgyqeKJRCn5Gf659C9Da/WJZdShhgowczCYBYs4bI=;
        b=Up4XNwI2RVw220H0svhOgkp9Q0AuEZNMEc79Ws8G6fSJjt1ZQKEwurvJkHM2CnUSgU
         XweSTs7n6xwZPiG1MZxIx2JuLD8EaEcdIR2xfAFzBvoYJ0b3QDDf/XNZhGcAL+CzUU4m
         dkBUSYQiqtLd8UK5BnTWsaIIgZTGgnwPF1sB8I5i6V9jxvemj8C7MvwonMWGYKajkuE9
         eUzYwoh3ZjGEyqVJKjj9BoNX/jVDksVmtJex0Z+tXqH4fcBhJ0P4knUeJBPpgyr/Ouqi
         +fJqGu5gkxf2PW1CUBtrImg9QnDvhULi903Kw1xdISCCgIGin9qJzWtoeVe5sxUB91OT
         L6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730086776; x=1730691576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBmgyqeKJRCn5Gf659C9Da/WJZdShhgowczCYBYs4bI=;
        b=T1Ni6XsCeRy55UXVensRrlsM14UsmdcRP/ZgrWPA8zuOFECDFPsmnJKTvPKsJY84cP
         pKHUyefTDRZ2+jzWj5LXQmgX0WR5ZZH1KucvupQeLsp7CsB7LR37mh7luvPyzdVARU25
         GjLSan7+8oFBzlfoel6Um1RmjcDlcMv73YohEPO3pGHrgLKZ58RvZoBea3p2HjMtj1GA
         V1dg3B9QTit1ztxtjOqIRm3cZxGP598kTsVBB9hUMsjaM0uB0qFsQcKb7eAv525bVL7C
         5ZM7aLd7l7Si/LbR1wTG6nV26Zk5WRXPdov27xGV6Xj61GjKHoycCg00wF5cqREnhEvk
         RgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXNGeUHnLheD+vIf97+V5hU/xxgcJXQ0WTSPNN1lEcZV+8sdUwIn/17WTgVBQk9o8ZGQFsPFutVOE/GMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCge4BuJvIv4pJrNlb0JMFKOdvy1JghLzccB75DM/YtfmPnXwr
	l3YVE0pbgeQzHqhhW1Pt9M9sllLSLvj1fL2RB48H7/ux4jA7Pvg+hHVsSVYeiaA=
X-Google-Smtp-Source: AGHT+IH453sffjIwvItRxxv3mspXtf+xzFnYsZ51wevVQNfZjTNz0DmZquqPZegSnXNUg/j6R7elmQ==
X-Received: by 2002:a17:90b:224b:b0:2e2:d7db:41fa with SMTP id 98e67ed59e1d1-2e8f11d1e8emr9087013a91.33.1730086775647;
        Sun, 27 Oct 2024 20:39:35 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e340e544sm5961888a91.0.2024.10.27.20.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:39:35 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Hu <nick.hu@sifive.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Support SSTC while PM operations
Date: Mon, 28 Oct 2024 11:39:24 +0800
Message-Id: <20241028033928.223218-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_203937_090916_E1B524F8 
X-CRM114-Status: UNSURE (   8.32  )
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

When the cpu is going to be hotplug, stop the stimecmp to prevent pending
interrupt.
When the cpu is going to be suspended, save the stimecmp before entering
the suspend state and restore it in the resume path.

changes in v3:
1. Update the commit description
2. Remove csr_read/write_hi_lo from the previous patch
Link: https://lore.kernel.org/lkml/20240926065422.226518-1-nick.hu@sifive.com/T/

changes in v2:
1. Add csr_read/write_hi_lo operations
2. Apply the suggestion from Anup.
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u

Nick Hu (2):
  riscv: Add stimecmp save and restore
  clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug

 arch/riscv/include/asm/suspend.h  |  4 ++++
 arch/riscv/kernel/suspend.c       | 14 ++++++++++++++
 drivers/clocksource/timer-riscv.c |  6 ++++++
 3 files changed, 24 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
