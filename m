Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C99C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NPEA6AdAqyBGnoqLj2AUNWD2uopKvkdPXQeh5cvJGJA=; b=lUohLbni0GDr1Q
	/8CUvjXxDPXJx2p/gLOX+F3ynH2+1TWHQoU9C3KayaK58Jg9i+w6b5TqM0+BgCqIZF7YtkZ1idX1J
	xP5NMzldPX7+ecYmZowupSGU+Zux/0V9WA+GL/o/4WyhXiji206PjdteH96lB5oGnLCxPaW/JBYXj
	OIYtFPsr6zVLvhm40r1m4Sz6iO7jFfZWfLDxXQWLQjk/BvZLxXvqOEASN7UJWiy18UyuadrAn+F0d
	lRv+hHZvzSEqvDvt4QmypLocibRWXumJW72LSTTDcPYFG9WqXOLkEG5TSstFEypAso57nNNipJMCQ
	eAS00uBv+lpSZ/fJrtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMF-00Gf21-Oo; Fri, 27 May 2022 05:17:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMD-00Gf1Z-Uw
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:17:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id x12so3036831pgj.7
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo7vfeOGvTqy7+ek2jm2BgVJNmJVKnDylnVmJnH5dBQ=;
        b=A0e0u/vU8sFpcECwKUCSMHshNFrNpB5C7Jw3L6/3VzvT/hnFEoZulzlvFpSjOuTwIo
         woirevymLuyT0zzsHC0l+19jSxJcQaIT5idqdWueuzzVVvGUAIBu5K3/FCqfFAWH3IyX
         fIyzG7ztJFLkiouA7HSviJpPb5KAmCc1aP+iZZmDsd1zW3WZDNaTRcHRSPMq/rwPaiwd
         dyHIbFS1gBFAOJVAjD7bc1BAJrtMydXmQm6DOJp2MCIUb6kQKp92U2PuTdt8bWQTe3+k
         eLMZJZeJo/F0AlGZP+N3SHc0MW77t1iSbQ7kY54mVeDKJeTCpZwIZ3kWcSaQxHQ8wYEC
         P/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo7vfeOGvTqy7+ek2jm2BgVJNmJVKnDylnVmJnH5dBQ=;
        b=219jC88iAK79kWqPDmMfZbhZTSfJgRA2RZmZq36WQZ1PmbbGhNBMhucYIvcpVL43+u
         rKxuroTT+Lcr1bqzKwZAZJUDoOHjE+8vEHFs6BmX/8jSikgjD9BmAfg7EpkIRap0yZ6P
         /Cwkz3gXqyCpT/s2PggzqeI1aOay/M76gx0G4e8CKvqyGKb+h7PsJme8EADfUIBCNxht
         te5MNp0KGFF8lVfcmjqrnt/8cSDc+W3GV7cIzZZwJNI8lKvixwJQNhqo1aIsgbevvGor
         zN3rBgA4OPK3swzK+e88xjbVskc4zKOxYEPg2/FKN1KFRTS6lduZJQwJuy1Vcv150qy1
         DhsA==
X-Gm-Message-State: AOAM532pbiuKw9MQjGPC5GprYnFciwRXQEeRwWARjTOr8iQwGltLnR77
	yyKY33BG3GUji9744/pMajIZ5w==
X-Google-Smtp-Source: ABdhPJxVlb+cwlsnxtpW82xCW2ZFvh8bXchHJ9vgdGIceBcAGSwcVX6HjV+NMWc5hDe7LkQbcjvr3g==
X-Received: by 2002:a05:6a00:1487:b0:518:b952:889b with SMTP id v7-20020a056a00148700b00518b952889bmr20154031pfu.43.1653628670792;
        Thu, 26 May 2022 22:17:50 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:17:50 -0700 (PDT)
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
Subject: [PATCH V3 0/5] Support for 64bit hartid on RV64 platforms
Date: Fri, 27 May 2022 10:47:38 +0530
Message-Id: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221754_036892_3DA1187F 
X-CRM114-Status: UNSURE (   8.10  )
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

The series has been tested on both RV32 and RV64 qemu platforms.

Changes since V2:
	1) Modified commit messages to mention RV64 and add RB tags.

Changes since V1:
	1) Updated RB tag for PATCH 1 and PATCH3
	2) Type Casting NR_CPUS before comparing with hartid in PATCH 2
	3) Changed commit message of PATCH 2 to provide details about
	   the bug it is fixing.
	4) Updated PATCH 5 for unaligned 64bit read


Sunil V L (5):
  riscv: cpu_ops_sbi: Add 64bit hartid support on RV64
  riscv: spinwait: Fix hartid variable type
  riscv: smp: Add 64bit hartid support on RV64
  riscv: cpu: Add 64bit hartid support on RV64
  riscv/efi_stub: Add 64bit boot-hartid support on RV64

 arch/riscv/include/asm/processor.h        |  4 ++--
 arch/riscv/include/asm/smp.h              |  4 ++--
 arch/riscv/kernel/cpu.c                   | 26 +++++++++++++----------
 arch/riscv/kernel/cpu_ops_sbi.c           |  4 ++--
 arch/riscv/kernel/cpu_ops_spinwait.c      |  4 ++--
 arch/riscv/kernel/cpufeature.c            |  6 ++++--
 arch/riscv/kernel/smp.c                   |  4 ++--
 arch/riscv/kernel/smpboot.c               |  9 ++++----
 drivers/clocksource/timer-riscv.c         | 15 +++++++------
 drivers/firmware/efi/libstub/riscv-stub.c | 13 +++++++++---
 drivers/irqchip/irq-riscv-intc.c          |  7 +++---
 drivers/irqchip/irq-sifive-plic.c         |  7 +++---
 12 files changed, 60 insertions(+), 43 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
