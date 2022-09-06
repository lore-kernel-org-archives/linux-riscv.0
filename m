Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D7C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEyXY2hFY8gw3bxWZX3+tMp3mTMdk+UkDraM/T4i4X4=; b=bgZ09z5igEwc6V
	rJ7MsFPU5IS+x96WD4oc64L/mr9oEJdyMmAK97NG9sbRmKp9Z0+5mXWmpxqwqHPIfcMa5fGpJkmh/
	vXUkoMTZlA+90VYrHaXj8Ycb0j/4FtULOvx0WulYl17KS0y3IKyiskzSIv5PIzyxto9HmVngUYUS/
	L7iFonkTdqYIMIJEDsWXJK5rUxbLgZdmOTVDOGPYJu4DQuHcsGicpmiqghsYowAkX86B3CrwOQBGJ
	4fTanjt+CNHAQ9BWMSUnyCKQy2DxrUhOOQKGPVeFwi3j6TqAez1WfG5lzzFNdDPBT6XCAPVE69ubd
	yvU1wITmw7qmne/uconQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGm-00Atst-1J; Tue, 06 Sep 2022 07:45:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGj-00Atpa-42
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:45:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id qh18so21236077ejb.7
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6Oh58MzUHj61qPkwz3pVxIKsCejD9QBCoio9MLu2Rx4=;
        b=aMAdcV0dZEwhX4TaOKV/2Y5CpWlngVLNva1VbfWB75ZtHPkerF1d9xjZe2aSUbCa0Q
         G0Id/UtUNYKNx7AFqRHU2vop9TF1dHD0b5hOUJrsdq1zZtrkhyQFZq8cdLTxPnSTXmAs
         pK3T6VSb/KKTRzcYUqJ/2cTS9vJcMhTUq5B6rb3KcZhHSJD3LUSJtOl+3JZfTFHfunBw
         0HaqoubrTVzbfo/mDL71XjrH79gMjc8GeMtYZIQw44wJCzBpPk6XWRRtvR30qqw1XbwX
         w9qE4bWjTHASRW8mN9oTWyTGuLQK73GLG7gN8MD5ywuf7964z1hxb8pGfoFwSmM7Aqzd
         q6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6Oh58MzUHj61qPkwz3pVxIKsCejD9QBCoio9MLu2Rx4=;
        b=n8wUjTcBwGR6CWDgtVN/xxDgoAOL0CAsOlDt5HT562mAfaBE+6biHnfZVuymsgwM+o
         S2sd25uhyeZqWyN5Tz2aCamau5RvAo4VR3gf+eb6n79f029HGhS5cvf/qjEaTkw+yPf/
         vtkw4fjJ2jbL7AD8DCEP9gYTu7q9RXNDqpkR2lNZX6BNabp+g2Wv66hvD2x2pPSITKdg
         Wjm6mo0SlSBRo3JVAPZvkS+6VhB2/6CRQ66qn/M+bem1nUeOlvm+cff4+5wdgzJIQONA
         5AYqJ+F4Zuambb32TLRkoFK5NHl8aGbUrpxu2BJC6RwWS/iy7I1vbshOkW2VXKQvT7UP
         rAqg==
X-Gm-Message-State: ACgBeo05BE6WILW/iFMOvNo5EatN2MPKSYgCdrK2fR2NcrrCuXp/QjsG
	O9iR29AcURVfrsjOySiv2OHbXVDy9Op5mQ==
X-Google-Smtp-Source: AA6agR5CnBSX2Fhtsdqd/6Rh0i5PUuD1hKDHGkRkVBGxz7YX8QKH0BLHUcZvQbukiqDgX8CCmPJr0Q==
X-Received: by 2002:a17:907:6094:b0:73d:9c6b:35f5 with SMTP id ht20-20020a170907609400b0073d9c6b35f5mr36991144ejc.140.1662450311150;
        Tue, 06 Sep 2022 00:45:11 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id az24-20020a170907905800b007385e929344sm6126242ejc.55.2022.09.06.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:45:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v3 0/2] Zicbom block size fixes and cleanups
Date: Tue,  6 Sep 2022 09:45:07 +0200
Message-Id: <20220906074509.928865-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_004513_217207_CB1A75A4 
X-CRM114-Status: GOOD (  10.13  )
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

I collected a couple patches that were necessary for another series.
Since some changes were required to the second patch I'm posting in
case it simplifies things.

v3:
 - Applied Anup's move change first to ensure the second patch can
   compile with Heiko's change.

v2:
 - First attempt at sending a fixed-up version of the second patch,
   which mistakenly included Heiko's change without Anup's change.

v1:
 - The original patches on the list
   1. [PATCH v2 2/4] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
      20220829125226.511564-5-apatel@ventanamicro.com
   2. [PATCH v2] RISC-V: Clean up the Zicbom block size probing
      20220812154010.18280-1-palmer@rivosinc.com

Anup Patel (1):
  RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c

Palmer Dabbelt (1):
  RISC-V: Clean up the Zicbom block size probing

 arch/riscv/errata/thead/errata.c    |  1 +
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/cacheflush.c          | 40 +++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 40 ++---------------------------
 5 files changed, 46 insertions(+), 39 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
