Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4D3C02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=we2c2PEKUOTXvH95rfrdOsvb0m9+w8jFoyVQEtxvh1Q=; b=XrpqI1LQQZLkpa
	JSIbV5kZ3PK44PViG3rmdYV6kS8HkvxmTv7WS3/D2vWPEgyQUbXVJu9cm0pmIx806kA4tLeAC2z+0
	czCKXQAW//T5BZ4/cgvrBMCVkGXjTDOUsmKnes4ti4JY+O8rBTH8nz6tIk5czEK2DAPobTkV83WVC
	+ieujStpjum/q5hDY8xcZoDiEp2CijtD4WtzCWIZ/jCIXtvLuVKEpATyTSUMzSyjh/CSaUNrMetpN
	xxG0FMxa/cdO7Sy962X1j7EfMUfu/frW3E8vmQmj97CUM7VvAPn+GIx/H9Tjswl1xwrFmYGaiD6cU
	UhUhbWSex13naltoVJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgRE-0000000HA13-0zTM;
	Fri, 17 Jan 2025 07:06:40 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgRA-0000000HA0N-2qMk
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 07:06:38 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3ce873818a3so16226315ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1737097595; x=1737702395; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LfYpH+Y1jpQO12PadF3pL3zexhSFdkqlBmV2LuVWqDs=;
        b=IteFj2OnGxQ5+RDLkepopzn8H3rBb7LBsXGE7nmCkthwfvA74w/vmAo0q6W9MyUWtO
         Ox8dP6tr0D+2nbe4PQ+CesJEseT6Dopp5Ik8z69OPo2Lg4tsnE9h5stkOLUOJqv6xC1L
         u+fnnME8XQlD+tL/2Xr/3gc9QpfqTrSupfMCVmCV4wnUrCIGyquSsnmyFtVKMPlhpZ0E
         mQsdOeqPE/nhrNeun5NM50Ey/sAiknOHCNXEzVztT8XzFrWsg99uw3PmPpEHqPi7EPQy
         RMeHxk6m3OOdFRfd/T2xGm5AXWbMBc5bALtfsvwzXXgJMJsJ/Pijf12VEx02oqkfqCZq
         9VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737097595; x=1737702395;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfYpH+Y1jpQO12PadF3pL3zexhSFdkqlBmV2LuVWqDs=;
        b=bbFdH4c7o5Zq1FYLEA9XlGBEpdj7M20piQP5XqrMZ4KrUL1J43IQ/NHyth87eA1rU9
         rJZDC/1/WOHY4HvXCdyQbs6Bwf+M1feYE6FbKKjRZV8+hiL7pYMsNexMPAbJZH5gln82
         88K4xbDLXWoLWCBkN1lYdE+uEn5t4yXOLrkjRe3tnihgg2SfC9gmDtDDplRjcb2NphKT
         W1kaXqH1G2fJtZWyHEVWV7E29mzIgD7YZUZv8Y/IzVoDuZsDreFFfS2hw7i7d6U4ZBmQ
         ulpH/5w3JiV9C3LnpMH4zvhshAiYflzbLoMOHmdRN7zgdpGzp0ham1oMQ4e6/yN8TW19
         /cBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA5gk/YGKQMNitm/KITG6ceEnzp+BFyUE/9IpWGN5dT2uiaZ9JXlRWqx5Wym2Y3YzZYi+OyaPPJP+2Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrPXwJDXKYo9AJ/8QovuGHLBzqYfwzFWKp28VL2XDRCsN9PKzB
	fjKbQ6YYYIFNJEgmmX1iA6Nss0VrkqqhtT/GuGxKduhW3lXmwquAtTLOL7s31OyiGvY4Mw8/Iwt
	lCawlATc+sdQqYgSeLjP2wUnR00rsbWnM/M5PQw==
X-Gm-Gg: ASbGncsXu4GUrJj/RcqG35FA+irrXLUxjtUJw5yqrzZT27AU6YcrrflJZMhSFqNg76w
	Ls/amqWiOj2AnZVojDamLk0ycSn97k7e2Jer+zxE=
X-Google-Smtp-Source: AGHT+IF+AL3eLH94oddazC6IWMSZ5U/suLVNW1B+QIp0pFHRGvcni4BJzwXCFG3UMDaASPRqHB6/9Ut3S6E7Kq7eQYM=
X-Received: by 2002:a05:6e02:2402:b0:3a7:e0c0:5f27 with SMTP id
 e9e14a558f8ab-3cf743df906mr16474775ab.2.1737097595136; Thu, 16 Jan 2025
 23:06:35 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Jan 2025 12:36:23 +0530
X-Gm-Features: AbW1kvZIPS-DR3om7fqXj69kIV9exvX1qxrHBy8YHvK5NBpiQJVs4OBbEUSSQSw
Message-ID: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.14
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_230636_974270_900D9A19 
X-CRM114-Status: UNSURE (   5.81  )
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

We have the following KVM RISC-V changes for 6.14:
1) Svvptc, Zabha, and Ziccrse extension support
2) Virtualize SBI system suspend extension
3) Trap related exit statistics as SBI PMU firmware counters

Please pull.

Regards,
Anup

The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.14-1

for you to fetch changes up to af79caa83f6aa41e9092292a2ba7f701e57353ec:

  RISC-V: KVM: Add new exit statstics for redirected traps (2024-12-30
14:01:02 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.14

- Svvptc, Zabha, and Ziccrse extension support for Guest/VM
- Virtualize SBI system suspend extension for Guest/VM
- Trap related exit statstics as SBI PMU firmware counters for Guest/VM

----------------------------------------------------------------
Andrew Jones (2):
      RISC-V: KVM: Add SBI system suspend support
      KVM: riscv: selftests: Add SBI SUSP to get-reg-list test

Atish Patra (2):
      RISC-V: KVM: Update firmware counters for various events
      RISC-V: KVM: Add new exit statstics for redirected traps

Quan Zhou (5):
      RISC-V: KVM: Allow Svvptc extension for Guest/VM
      RISC-V: KVM: Allow Zabha extension for Guest/VM
      RISC-V: KVM: Allow Ziccrse extension for Guest/VM
      KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list test
      RISC-V: KVM: Redirect instruction access fault trap to guest

 arch/riscv/include/asm/kvm_host.h                |  5 ++
 arch/riscv/include/asm/kvm_vcpu_sbi.h            |  1 +
 arch/riscv/include/uapi/asm/kvm.h                |  4 ++
 arch/riscv/kvm/Makefile                          |  1 +
 arch/riscv/kvm/vcpu.c                            |  7 ++-
 arch/riscv/kvm/vcpu_exit.c                       | 37 ++++++++++--
 arch/riscv/kvm/vcpu_onereg.c                     |  6 ++
 arch/riscv/kvm/vcpu_sbi.c                        |  4 ++
 arch/riscv/kvm/vcpu_sbi_system.c                 | 73 ++++++++++++++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 18 +++++-
 10 files changed, 150 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
