Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8415C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EePOl5AYj6STcrNI9f0vxBAt7PjTv5KzbWA1jhKQ+nQ=; b=fjZgzHqp5aP9LT
	Q6pj5JA5byyCPyVdtsSdoPOUkriAp5gY/jrQmBVvJWln0rY9zTW0jSKYFrUxG0kdO6Hmnnix3ThLz
	6mPFZg1AhM+E7EWwKDBr8cvJnPeql9f9lNghO1Y1DYHbTtBrGyP4bj1JEr1CUTRSac0W9cd5yBcm/
	cQYd963U1j7vbIFxtOB55bQsX3wsDveZqcU74iIvDdwShNeqE3Rd85F+FHljPj+KrIsxNSW81kics
	6DRyqklr8Y6p6LQ2ecUz4KbzeO1F/V0EdDL3Kb3x3zY+RUu972u4EVnjmqnM/cWTZZXcRJ8CIloyo
	qaiLdxkl3QmhBbyu8wzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGg8-0000000CLxe-2brZ;
	Thu, 20 Mar 2025 14:15:24 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGg5-0000000CLwZ-3Opp
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 14:15:23 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d439dc0548so2631515ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1742480121; x=1743084921; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pOuUOTjtcVbSe8J5UUkNu5FVmT0qaTxwu9FnCnOOamg=;
        b=b+mFVcj2Oa62ppvz2QktsH/anSjDt2Ca+nPvn4ryNFBk+VZiQQlRPGN4UtFxj/gHqo
         nxCwyMAsMiPleGEthb5U9LuRE9D936ZgKxoJpW1phqRK2YAHbxleAPoTP7zVtn2B3hEJ
         XrvZceKC1oypi5nBhzG1XufgYLlPo+iw8rBrwU+AJAUaq07idL7Siujau64VAKT1Tcf6
         +cZhaQNGWdRX/z18Z+pLyFGNw5mVJDuDMcMWFddU2ZWmn3I+I7riZXXy3TQC/2ow4PPG
         3l+iCHaZH6OIO32FhG0YQk7EiZ7sBphvhEV0Vlxg+TX+EYwjx24P9zJGaOJzp9GKTb7G
         usPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480121; x=1743084921;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOuUOTjtcVbSe8J5UUkNu5FVmT0qaTxwu9FnCnOOamg=;
        b=EKddqjHTYyivYDyp6Jy/CqmkMYA4xTyDrFiF/t526Pn1qCfUg3mcAlOim7X+vpltdQ
         xS/KnsTbGwhvbiSeW3NeUv9PoNX//fQjui3fT+AnbxIS2fZq36T8gDmM4be3JSnuvzG3
         UZUD8ePjBEGdG0/QIagxL1g7BpXgVc2oaR6Rsr14c43wV4WQ88xNPIJgbd4RJ0qZOhdH
         s6JVnvzFKdfQv2p/aZ54PiOC1y3zvcMOklIOPVX3o2z5L9akpunURKdpjrMNo7wqys3G
         f9utw1g7brtmv0ZvHwAAA8gZF4YBo69YRjrI/oI/8t3yEIALCwa+Yx88Lh9lkIj0bvGY
         f7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVodN9/kl9/blp4mS0aJM9YKGnT0W7lTsPnTVWuvoqtDCOFkw/EbddVOdyVoTT7GKSwixO71Ko6uwwFzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp7AM9Zx+Mu3qKU6mLv0VQ64GfP0ieO/TXN1Kw4VBes3OgFxlP
	VOspbQ4xzA4PJTQGArO6P7XWTVRO70qc4vP68JzFrjyr/c6QTi5p6Vvvsp+GcAVqX5ZDUmrcUTB
	AZAhmT7U3wrsLbeFTocL39M64mPXvGp5wOWZCEw==
X-Gm-Gg: ASbGnctoNxdvC3HffQmdCOr56rIiEMnuWac2XnyjJZ3VLEUpWDT7BM/kaOpnX1p28ue
	aZXqeOgjSbkwp9o/6GyMPSn9NUENp0WJ95Rf9q4TQYlbP9KhLNFjFpaCuq0eZ6BiRFIYyUFEiQq
	PZQ9wO2VJ+RoITZG2Hj36xxyQWyRw=
X-Google-Smtp-Source: AGHT+IFK5YVWMg7oHmMx8fPJHlpZWuvdFWhVDFV08fjTW/MyiiCgPNx7YiNRyCTVAurBTzb3xFeOlwvq/fI1K8EDP74=
X-Received: by 2002:a05:6e02:370a:b0:3cf:bac5:d90c with SMTP id
 e9e14a558f8ab-3d586baad39mr81833385ab.18.1742480120521; Thu, 20 Mar 2025
 07:15:20 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Mar 2025 19:45:09 +0530
X-Gm-Features: AQ5f1Jrt7GwUjf0k1HKl9UBx8575Wok6_pgNuJLSWasl2rfXma4VEBXKWaRUvPU
Message-ID: <CAAhSdy380StEE03G=RPjKoxtY89nLeufpXbjYwbRypzzrkQN+g@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.15
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_071522_114793_E96502C1 
X-CRM114-Status: UNSURE (   7.13  )
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

Hi Paolo,

We mainly have two fixes and few PMU selftests improvements
for 6.15. There are quite a few in-flight patches dependent on
SBI v3.0 specification which will freeze soon.

Please pull.

Regards,
Anup

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.15-1

for you to fetch changes up to b3f263a98d30fe2e33eefea297598c590ee3560e:

  RISC-V: KVM: Optimize comments in kvm_riscv_vcpu_isa_disable_allowed
(2025-03-20 11:33:56 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.15

- Disable the kernel perf counter during configure
- KVM selftests improvements for PMU
- Fix warning at the time of KVM module removal

----------------------------------------------------------------
Atish Patra (5):
      RISC-V: KVM: Disable the kernel perf counter during configure
      KVM: riscv: selftests: Do not start the counter in the overflow handler
      KVM: riscv: selftests: Change command line option
      KVM: riscv: selftests: Allow number of interrupts to be configurable
      RISC-V: KVM: Teardown riscv specific bits after kvm_exit

Chao Du (1):
      RISC-V: KVM: Optimize comments in kvm_riscv_vcpu_isa_disable_allowed

 arch/riscv/kvm/main.c                            |  4 +-
 arch/riscv/kvm/vcpu_onereg.c                     |  2 +-
 arch/riscv/kvm/vcpu_pmu.c                        |  1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 81 ++++++++++++++++--------
 4 files changed, 60 insertions(+), 28 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
