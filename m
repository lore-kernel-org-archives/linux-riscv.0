Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A6CC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sPhasXkHpvWMJH5zDBI3k2OtWZ+UeitIoZbxbrRHe5A=; b=DXsQdPasVLpfep
	5+ZYH+/SsPHR5rbRqwbXbRvIHVvTsL1eGQdNDtBJ7mAEo/iFYqYVyRwZyPM8l/LyjfRQHu5SDDq/y
	AoAuBkKIhR36KCqRMzfOSS03nyMNKQKKY1AV5CQLrADPAQ9RwWPV5phPv1QO/7EoChgKUmi8o8vgj
	bd2L0h0YH9asYoGeG4IkfYQSe17Or3OwO92b/As8mDYMgiIFsJu9r2mdNdToL85ZEiszx1KXY3uex
	eUy/6b+txx3uyqU4rR0hVe8DkrMwdiTSU3y97L1iNCXnN75E+HLDX6vgoJiuaTpBSwMODz9bKxak1
	e7CLZ2x/+Ek9rHP0Q00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSF7k-0000000HVr7-0zjh;
	Fri, 12 Jul 2024 12:11:40 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSF7g-0000000HVqC-2x1d
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 12:11:38 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-37613975e20so8178245ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1720786295; x=1721391095; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q1niRraCjqeMyr5cX7PxOFIQ0Sj5Bx+cbn9dmwhfVKo=;
        b=qxUPNZWEhV2QOpl0+XXrpzUeEi6UIPvbbsdm4R76NIjwYgJYe8doDFz0u/+fZy8HP9
         /NZ81CFnQDiZCWCKUlX3vpJURXLDrvzkB08PoKFh+fTpiRessr8TThwXk4Hfpsl+f3Ce
         tTZ1ch9QxqKmOHR3db2Quy2EyM1R4+uOPn1t+tXVHwJ0NRnHpWN9ueYGodNfjJm9iDTL
         XgtTE2bzl1z1C9XauiJHDD3xfYfDhYu46ybt6figrQJIygRuMeZVB7r37VMSUH0VtApn
         AMybmRHpJMVUXNjAdKIKUsEzUVdMYG7TrO+UFipDGfeT++McI1/zMEWE5yCYkNvzqI43
         a0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720786295; x=1721391095;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1niRraCjqeMyr5cX7PxOFIQ0Sj5Bx+cbn9dmwhfVKo=;
        b=c2mB9ZQ/9x9t5qVOByeEfq7ojJ+7eV/y5Gmv6/a+9popbhJ4lwrzCYcLf7KA3bfrJW
         RdLKOWgIjH6piFG1AtNfuXnalNBUBhhOW6BoUZ+jPDl/kJKbR/VnRbuBx4iqmFOkGM66
         ZJiyyMWualOyCX24z/NEF6fQzRmmCubbi2Z3g1bjQqlGyuv5Qc0vxI2wOyxGVkzXPDIO
         qLTDrzl7ky9ARB1e6s7wW3dzyo6CTn7Gdu4yZx/AiCNGGMjdZJ3ZcY8TaAGUwEGDglih
         C0IwD3SAN/95r0KuRQgkfvrGhiniprgfXiTSp4HY8EAcw5/PNaGRiU4dqL+CQcdjVsjp
         d+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfOHa0YP4Kis32dCfSofqX/f6XJ1+90G3KrSOF13WfgImv+QLEZvepre7Wq4+d1rrwgmVz+Vlu6rJ5ASfLsDIaYcQ4JlSzJh/LOxXKva7M
X-Gm-Message-State: AOJu0Ywennkf+1NMhS0VEajpUanFQEuvytcKU28ON2sMUiTvDUxsttvP
	5993AQzIlJKNCNuk+mP3JMGX50Er/FTFeNw5d+Ld/IHSz4nQ3yKzkNJiKQ/1kiw/mlkU7Hzzc8+
	9T2LWrr4XR1DfpMIdUL4SX2C0L8Smh0WuCe7Yrw==
X-Google-Smtp-Source: AGHT+IGw1561bmQ8Hies93tHQqB5Q5PqXZjp1CmRpstemMFKZKHlxBTBLx9rL+qxO1iavYhxYJ4+gikZG1emGlfAd4M=
X-Received: by 2002:a05:6e02:1aaa:b0:37a:a9f0:f263 with SMTP id
 e9e14a558f8ab-38a5910a9dbmr139026545ab.20.1720786295403; Fri, 12 Jul 2024
 05:11:35 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jul 2024 17:41:22 +0530
Message-ID: <CAAhSdy0jae8TYcbChockXDJ9qL+HnA1p3YJQi32NHQsLUtCGDA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.11
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_051136_874288_1FE52929 
X-CRM114-Status: UNSURE (   8.57  )
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

We have the following KVM RISC-V changes for 6.11:
1) Redirect AMO load/store access fault traps to guest
2) Perf kvm stat support for RISC-V
3) Use HW IMSIC guest files when available

In addition to above, ONE_REG support for Zimop,
Zcmop, Zca, Zcf, Zcd, Zcb and Zawrs ISA extensions
is going through the RISC-V tree.

Please pull.

Regards,
Anup

The following changes since commit 0fc670d07d5de36a54f061f457743c9cde1d8b46:

  KVM: selftests: Fix RISC-V compilation (2024-06-06 15:53:16 +0530)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.11-1

for you to fetch changes up to e325618349cdc1fbbe63574080249730e7cff9ea:

  RISC-V: KVM: Redirect AMO load/store access fault traps to guest
(2024-06-26 18:37:41 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.11

- Redirect AMO load/store access fault traps to guest
- Perf kvm stat support for RISC-V
- Use HW IMSIC guest files when available

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
      RISC-V: KVM: Use IMSIC guest files when available

Shenlin Liang (2):
      RISCV: KVM: add tracepoints for entry and exit events
      perf kvm/riscv: Port perf kvm stat to RISC-V

Yu-Wei Hsu (1):
      RISC-V: KVM: Redirect AMO load/store access fault traps to guest

 arch/riscv/include/asm/kvm_aia_aplic.h             | 58 ----------------
 arch/riscv/include/asm/kvm_aia_imsic.h             | 38 -----------
 arch/riscv/kvm/aia.c                               | 35 ++++++----
 arch/riscv/kvm/aia_aplic.c                         |  2 +-
 arch/riscv/kvm/aia_device.c                        |  2 +-
 arch/riscv/kvm/aia_imsic.c                         |  2 +-
 arch/riscv/kvm/trace.h                             | 67 +++++++++++++++++++
 arch/riscv/kvm/vcpu.c                              |  7 ++
 arch/riscv/kvm/vcpu_exit.c                         |  2 +
 tools/perf/arch/riscv/Makefile                     |  1 +
 tools/perf/arch/riscv/util/Build                   |  1 +
 tools/perf/arch/riscv/util/kvm-stat.c              | 78 ++++++++++++++++++++++
 tools/perf/arch/riscv/util/riscv_exception_types.h | 35 ++++++++++
 13 files changed, 215 insertions(+), 113 deletions(-)
 delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
 create mode 100644 arch/riscv/kvm/trace.h
 create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
 create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
