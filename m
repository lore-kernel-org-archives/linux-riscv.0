Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F26DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzTlcfT+9fDPZvgRYQWjiPK62gJwGXzdgPwcjKwiAoA=; b=Oxidh3+m8SxoVe
	dKD079pvaDs7Jwapu5LcMKunpwxiPF3LwNlzso5h5ApcloGa55c3aAJ/sKuYxHjjTfR/iIdXoCgkP
	qCycgx43ptX4FRRFGQUkfS+YPYulNrGZCMYMbdd1zQK/JL5j28lRPQH+19pKP01akDQLFLLU1lc4E
	Y2RLlBxuuSRs3mCJrsp/3jFTqKHnWsSax6kowHSr2MOpK2mwHHYynipTABoZiFbG5UUdZwA1OqWt4
	MNG7y0But2HGUQNheBt5x14MylPzaFJncz9GDAF8C9/Py1enGrVT5CAAl50fJtFC67mQlWiE3E8cf
	n7PzXdb6f5zFc/fHoc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAT2-00ELRX-WC; Thu, 26 May 2022 10:11:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuASz-00ELQ0-N2
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:11:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id f18so1103886plg.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbrC9viuiEeW+uauQj8WIm89oteJmbW6JLoMguTugSc=;
        b=n1tlol/XpCiFEfS35l5rjijwg4/uYJ7U9MDrjL2y7sQad9b2Gx/Anu2oswESXCWZfd
         DEaLurPWlXY+iTlhl+GwrL2gvQfB5oyIxpPuLHfGaHtU1Y+7arw1Pd6nQf5Aiqi4kqYj
         B6XYxw5p21vJXiPEM8+p8Mu+v0hnX1QCno2lQ8gJK7GoBpS1IvPXapBLJ5//C28agcLN
         LZGHaXJ2tx+8B9l0tqZyYQf+CnRVlEAq76lOoNMXcoarjy0Mt+DtYlpAZrUzIAf9m2g3
         NdrLi7TAmT+9uRXXV+I5T7ha65tXXvT96hGl+LrbG0pbjmovcBsbs/tWDxBFe6/T2dz/
         XvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbrC9viuiEeW+uauQj8WIm89oteJmbW6JLoMguTugSc=;
        b=sxON0J8IYDQwyR+Ay1Wzw7vwrtv7hZRaY1GnlttoPIzIePeel98rhKfzNG2MfonbAc
         rMVwPkIW9asi8nf0Oa6qHxpPdbFweDqV3FUseirPxwLZPqYfr2JjVwP2dt/4hVBZ55zn
         Gl/BWkWlMZX6OjToBrDFHpBshiZGofKzwlDylkDS5oW4RgizMHOPahE0DIkQKOF+R3nY
         oSLQ5RjDn6SEeZo57XiLMWUTNDUQ2EO1tUInOn5L6hA7OqT2FXcwhexubDBJQvMNa5R7
         t5y959UsrBL+O4cWrY/BaXo+1ErtS1N3UBF18qEmB9YDpCqec8ipQEjGmAPlpWDjnOPF
         bWNA==
X-Gm-Message-State: AOAM531vVYAAJ5qHl2pouFni/nx1bDXV07R0+e5HXEyCG1PB7tA9LDZm
	1Rebs1NVS45iwcy4EiYyxZlGVw==
X-Google-Smtp-Source: ABdhPJwngscKF0Sla2DrywGR0AnX4WF8e0baEvHwkduL7GDyUFbJRTykeW8a50dtGoiNMzsjjD40GA==
X-Received: by 2002:a17:903:2586:b0:163:5b96:d901 with SMTP id jb6-20020a170903258600b001635b96d901mr7254897plb.151.1653559898794;
        Thu, 26 May 2022 03:11:38 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:38 -0700 (PDT)
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
Subject: [PATCH V2 0/5] Support for 64bit hartid on RV64 platforms
Date: Thu, 26 May 2022 15:41:26 +0530
Message-Id: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031141_785450_CC9EE71A 
X-CRM114-Status: UNSURE (   8.36  )
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

Changes since V1:
	1) Updated RB tag for PATCH 1 and PATCH3
	2) Type Casting NR_CPUS before comparing with hartid in PATCH 2
	3) Changed commit message of PATCH 2 to provide details about
	   the bug it is fixing.
	4) Updated PATCH 5 for unaligned 64bit read


Sunil V L (5):
  riscv: cpu_ops_sbi: Support for 64bit hartid
  riscv: spinwait: Fix hartid variable type
  riscv: smp: Support for 64bit hartid
  riscv: cpu: Support for 64bit hartid
  riscv/efi_stub: Support for 64bit boot-hartid

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
