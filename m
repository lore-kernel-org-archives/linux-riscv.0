Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qh/BpArpdlg8jtrCtFxg6jGvKj+ZlxjCiW9gbwkg+RU=; b=qCFyQqtPoKBlqf
	XJAWeicI+yib7pcf4w07VJR4Lhps9zPonzLw85npcec4UQ0O6Mp59FqjCfwAELHBuLq+LrKCLqXX8
	4RB4VEswvhM/D03LwqVY9ABp0OkmU2Sx7t9Cz2R6S6r9umfSFKoAV50gq+yQrDamgq7VouAzHI1M1
	011vRUJSq9hSPvox6TD7KUmhCicmsnq6+OEOTRG7JYJIZyE89YROUvz9QrA5bOJFOr52RXyajU8UK
	NJZrYMexLl6wV6MNBonJzOWsLUmnEsLn2ZEnY+xPpQEOf8DIUG4Sm3ELmcHE6LmVN43dkkPO/AjAZ
	ujTdvzZN1SyX2AdlmuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfX-00BWIr-Gp; Wed, 25 May 2022 15:11:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfT-00BWGQ-VJ
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:11:25 +0000
Received: by mail-pg1-x52c.google.com with SMTP id h186so19126249pgc.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+qNACW8/gTTgXjb8nsD8aEJ/snZ/Vsd31nRuBosZqE=;
        b=D/ZoD/NZW550gq+SNsQc5HqAlO4qKmEDbX5diUWDfpBt3S6JVTn7Tctqj7fqVUecAV
         BhbQjWZsJf98BatSFTVFTL3Tuz8VKEkuT69uxuIUqckG3nHWF7njiCSEGRV8LH3gmznh
         R9JlDopIZWyydGnZ81fCa+ZJymIOtVp/JsePQgRRqzB+i9J1YgFKhxxmaiOHPxvUBli8
         sx+Bn6K7jXfRbNaImf7sRcwAIlgspr+7L7cLY2xbLgj7i/piYsQSvIRxNXWWMVVYfPGj
         WmF6rIqx7XwZHuj4Y8Lg9Tdv2m+q4uRdQsFKBqJvgQlIp25bRqBbV0PrOHaYiPDgtmSi
         nH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+qNACW8/gTTgXjb8nsD8aEJ/snZ/Vsd31nRuBosZqE=;
        b=ffTcr/NeTiTuny30vMG7JUlT0lhRHtVa4siXAdTIafgUVZ+4cyZHpfsibf5juoB158
         cIMNDgwvHES88XZXQURZxhYQdA1Id6UNl2YgOfjzSz9nHToxI4b0acUF5L7qzP5T0sKB
         EM4jOcGmLss5DQV8s6zcMgzwflB4inN5PgLKsNKeY/jhT65sv2eNdnpKq40Y7tdG9BF9
         q7/kGeWgjXg4mVenvzIhXJZOGn0J7aI8KjhIAHzA4OBM/MEi8db/xNF1Zg/jMPg+VCBf
         z7rM/6WgIVIay2iGbyeOLYbdDyX9MhBeUBpaKJxVcFxDb7Pu0T1cCI+7+e1qi8JnVnHI
         YXxA==
X-Gm-Message-State: AOAM530+cmzkLkBFVq3u7mxMty/gAyfl0Hy+HtclgqBxIVdzyDlWagTq
	Y7qH5L92OZrc8NTJiLmXFJoEEw==
X-Google-Smtp-Source: ABdhPJx3IwZYrY86b1qfCcLPlI48g9BeGyMlMqabnTBv2RlI88lYcTF73oVq4UyivTmlj1ejM+nHjQ==
X-Received: by 2002:a63:6c0a:0:b0:3ab:8716:3d04 with SMTP id h10-20020a636c0a000000b003ab87163d04mr28671293pgc.507.1653491479389;
        Wed, 25 May 2022 08:11:19 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b00161b50c3db4sm9383129plg.94.2022.05.25.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:11:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 0/5] Support for 64bit hartid on RV64 platforms
Date: Wed, 25 May 2022 20:41:01 +0530
Message-Id: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081124_048542_AF9C7BF4 
X-CRM114-Status: UNSURE (   7.11  )
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

The hartid can be a 64bit value on RV64 platforms. This series updates
the code so that 64bit hartid can be supported on RV64 platforms.

Sunil V L (5):
  riscv: cpu_ops_sbi: Support for 64bit hartid
  riscv: cpu_ops_spinwait: Support for 64bit hartid
  riscv: smp: Support for 64bit hartid
  riscv: cpu: Support for 64bit hartid
  riscv/efi_stub: Support for 64bit boot-hartid

 arch/riscv/include/asm/processor.h        |  4 ++--
 arch/riscv/include/asm/smp.h              |  4 ++--
 arch/riscv/kernel/cpu.c                   | 26 +++++++++++++----------
 arch/riscv/kernel/cpu_ops_sbi.c           |  4 ++--
 arch/riscv/kernel/cpu_ops_spinwait.c      |  2 +-
 arch/riscv/kernel/cpufeature.c            |  6 ++++--
 arch/riscv/kernel/smp.c                   |  4 ++--
 arch/riscv/kernel/smpboot.c               |  9 ++++----
 drivers/clocksource/timer-riscv.c         | 15 +++++++------
 drivers/firmware/efi/libstub/riscv-stub.c | 12 ++++++++---
 drivers/irqchip/irq-riscv-intc.c          |  7 +++---
 drivers/irqchip/irq-sifive-plic.c         |  7 +++---
 12 files changed, 58 insertions(+), 42 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
