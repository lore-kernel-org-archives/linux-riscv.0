Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE6CCF9E9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtl9Gdha4d4YOFdxK+wtl4SS8NVSx9jGlMlQ0w1kkPY=; b=JDwpxT+lK5dbf6
	sydFu0gv1dGFR4+xMiL2jNvi+80ONwrs5oK/o39UAciAN9yF1p9FhERXpEZUurqC7nmr2nk9h523K
	XamQe693n/ZApeyoIAYM4ClgaV6gL2Thfz7ExOtM0mQ87BdhnBFshxPt5EaGh+JvwIqlRRCKnTRxa
	g8R1WBg6qFKpb5lkqlRYWEwoACVM4FWuI274Txvu2O3Y7YSnwB+5X2sgP8TUPnigWaeGFWXRwLGOq
	jV0+Mtb8Vp1bbB7Z4l+Zl/zlFlQ5BXxZja+prlm6pufNpyd1O3dF+ly9KITqlhELC4OMUVGCbD6IT
	OzVn1tIbsdwNO3MbDApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiip-00000007TO1-3d6U;
	Thu, 26 Sep 2024 07:15:31 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiPg-00000007PR1-33sR
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 06:55:46 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71100987d1cso364644a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727333743; x=1727938543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzHfWrObFTebylfAMReMmx0H/fNyKd6EWjjqrhs5YS8=;
        b=LyRu7nOKucOdeAEU6L8iRxo7VYNzIyZW/WWdhzf7SbR1wq1b6o7jwii0gbI4Xb7xgC
         9jAS/WtEMPzNL0LTAHpbwGzUOkYRSBet6hOvglO93D2nzK4I05CeeYuivvLkgsPHFJ6i
         /8+JNed90sNJXerZatiFILZ/fqUvzdDGhmFkSGCIBsXQ9Xjz4cdcCzW8mjWuTLKBi6iw
         EsxAliyfVkW2c12arD0KN7zDdh355YQPC9/3PrYXmPgs/PCxCoLxufUt7+vPC1u2nNj3
         TPBYYL4Vv1b4opZ1KorToTNGzdaHjjAofJVfMLy/dp/ue6GV1n4ug5q786oHo3agNbPe
         5zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333743; x=1727938543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzHfWrObFTebylfAMReMmx0H/fNyKd6EWjjqrhs5YS8=;
        b=g9WPi+iPRu4XpJ/nkvjnrmb8bDNBjPJfFUxguKj/8tji2X7KPyoXV5jwIR5orGLc0W
         TFdF4QLQAA9gg0fhE27Xbr3vRcGnDFryXbNGav8voCjBBruE2wnmVTROtiEURX0Ngrrj
         cGCdzsmyE/pgbqkg8yVvoIN4FvZBxAp82XqYyDm3/5xPJVMdnAzNZPUo2mrhNA1fTqpM
         dLpeNiO2z6Y1+yDgAMzUZLAo+BGcwfRc0dFqUoh2DfmiAHnQrJL2kqwQrjW59K5fRc1E
         Oi/3XE4kQU1aDZmefyKYUxbml2C3USAplOlxmmQKj70AmA4fiMsEVT2WcEPN+Np2HMye
         p5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/dVJvSlEaJL+sZQmHI8o2JKbd5/ro5ldom7p72rWwJWK7O9R65TBRVTjfSNXg2zs1atB3cDIlRYLlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1/nd61u+TxCqNJAIzWXk0fmCh7tht5zpXsa35wb8uskBtWfZG
	KfnoV3tTim4gvRdz+bq0xjv3tg0A0qs1I5UKzIfKrYkUJd1hD1LMneaVYVAQPgE=
X-Google-Smtp-Source: AGHT+IFJjm9aCyo95+9/VI6IL66etpFOV0OLThx3WyZZ7tnWZyAbNEO+PfCso5aAFQN+3KjsS0OA1A==
X-Received: by 2002:a05:6830:6e99:b0:711:c8:1a39 with SMTP id 46e09a7af769-713c7dc1258mr4573597a34.16.1727333743142;
        Wed, 25 Sep 2024 23:55:43 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73120sm3592352a12.68.2024.09.25.23.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:55:42 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/3] Support SSTC while PM operations
Date: Thu, 26 Sep 2024 14:54:15 +0800
Message-Id: <20240926065422.226518-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_235544_802717_00BEA649 
X-CRM114-Status: UNSURE (   7.82  )
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

changes in v2:
1. Add csr_read/write_hi_lo operations
2. Apply the suggestion from Anup.
link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u

Nick Hu (3):
  riscv: Add csr_read/write_hi_lo support
  riscv: Add stimecmp save and restore
  clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug

 arch/riscv/include/asm/csr.h      | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/suspend.h  |  1 +
 arch/riscv/kernel/suspend.c       |  6 ++++++
 drivers/clocksource/timer-riscv.c |  6 ++++++
 4 files changed, 35 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
