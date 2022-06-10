Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29EDC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 05:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FrU1iLBgO39qrG5zaDhW07Q1yB2zTw8hAK/Xxvw1Sis=; b=yir+jPy1cc3KXJ
	K0dGMrJBFxD7i6p6mFi56pVDT3MQT+lx2x0yduFNq0VGgJkzSOUjcHng2isNZqgkLWLBTPaoRY19p
	cTjzUwZwfO1DXs57s1bTYWV68tWgLKSLijC8iw3AhVzHJkRRqb7RWy5EWe6UqCN8nKlR1oiW2b4aJ
	GhM9BfxWR28m2gVorowwiU1e/arawg/fae/87TOeB4hU1nAlYbTapCGqiTTE1bgrbADoOA1ntlAzy
	s3Snfh6WRgzGwsbzr9+KrwLFPT942LOy7r2CICYA8M0K9eGgJPNMaevJd5mj4Zd37kzNa7JvOWKjy
	FR3rjP/NrGBuwu2O/udQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWqm-005u2B-G0; Fri, 10 Jun 2022 05:06:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWqi-005u0i-2c
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 05:06:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p8so22890041pfh.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 22:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbnBF3SupX16h4V+L32e9kicSqU8X+l6y02dEeIHSV8=;
        b=hMpBl7S+khoWtaiMQH2q/PpiPaJ82+mNbitAXXVEZKEpAzp6w/P9i+Tz8SqjP2NbU1
         3QokBo0J9Zh/4cstHvaL4422P/JKlZ8yaQWxBbUHNjvJ8pS8SK4kYrvZPRQZ1O/pW6Zg
         RlK/kF3qmfQn2UGk92ZceMqqO63r6UNW2u9bVapSbt3p7BDq4/p0KPWX2ciaTSJ9dUB7
         Vcu34fK49AuVuvm6+khJnKJHI475tXU7Uvp3PfJOsVWCem36l+Gz82/9wZXa0g/yAWaF
         0kQFS9wXXddKPLpEzXcVP8Qe5GjhjUpipMwNmSxFVoglQ/MpM726Rg8NHFXKVaN2CY8J
         8xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbnBF3SupX16h4V+L32e9kicSqU8X+l6y02dEeIHSV8=;
        b=QdkEjcTMdKXgMQxh2eMRtZlA8q043TevVEomiFviPBq6NGXazZlqRu+xQ3iSbV1v/u
         tmYVXV52O0rTMcALOb7iEh9GHhsOXg6Bie+207w07NDoFH4L87rhJY8aOpckF3iEhAvp
         SEYMwXBf7I7GfXsMKxloHTHsKEvUwgYF518Gbx2qDAU6VlnNmbJ/iOJsF1XiANvzzXmK
         EpsEWi+l+1rsi+sRRhkra119y/rex9ncdED+LGYg4OIewJmUtzBxzzDcSNRn5zhqnmlr
         eX0kwO57a2XBrYSh29C3BR1e2av9T5Tkot4P0NKjZJycnGey3LgXHt5yCFocjCZkxyF2
         Jovw==
X-Gm-Message-State: AOAM5316YjvSj2RXde8KqGMnEmwrGwSIvXjlbYsPrFGiTTJRVA8K6xop
	wtAWrXqKeXdsJl4BPgOL38lOhQ==
X-Google-Smtp-Source: ABdhPJzM/qCodL1LGXRkBY0EbWv8AZW9XZ61+8sHljtJEtEXgCIs3+vGyLmEtFdvzOOCqXXtf8NK+w==
X-Received: by 2002:a63:3c3:0:b0:3fc:5864:7412 with SMTP id 186-20020a6303c3000000b003fc58647412mr37096930pgd.138.1654837577990;
        Thu, 09 Jun 2022 22:06:17 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([106.200.250.139])
        by smtp.gmail.com with ESMTPSA id u7-20020a056a00158700b00519cfca8e30sm12429424pfk.209.2022.06.09.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:06:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/3] Improve instruction and CSR emulation in KVM RISC-V
Date: Fri, 10 Jun 2022 10:35:52 +0530
Message-Id: <20220610050555.288251-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_220620_159429_57DD7858 
X-CRM114-Status: UNSURE (   7.35  )
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

Currently, the instruction emulation for MMIO traps and Virtual instruction
traps co-exist with general VCPU exit handling. The instruction and CSR
emulation will grow with upcoming SBI PMU, AIA, and Nested virtualization
in KVM RISC-V. In addition, we also need a mechanism to allow user-space
emulate certain CSRs under certain situation (example, host has AIA support
but user-space does not wants to use in-kernel AIA IMSIC and APLIC support).

This series improves instruction and CSR emulation in KVM RISC-V to make
it extensible based on above.

These patches can also be found in riscv_kvm_csr_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (3):
  RISC-V: KVM: Factor-out instruction emulation into separate sources
  RISC-V: KVM: Add extensible system instruction emulation framework
  RISC-V: KVM: Add extensible CSR emulation framework

 arch/riscv/include/asm/kvm_host.h           |  16 +-
 arch/riscv/include/asm/kvm_vcpu_insn.h      |  48 ++
 arch/riscv/kvm/Makefile                     |   1 +
 arch/riscv/kvm/vcpu.c                       |  11 +
 arch/riscv/kvm/vcpu_exit.c                  | 490 +----------------
 arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} | 560 +++++++++++---------
 include/uapi/linux/kvm.h                    |   8 +
 7 files changed, 382 insertions(+), 752 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
 copy arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} (64%)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
