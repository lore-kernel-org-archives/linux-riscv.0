Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC0CD8CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HiCh9wdHHCe+owrVPJeyzBIfjgTx1O5aCN4dOBzpZR8=; b=eI8ffrvq2EV8IL
	X4ATxZmXSnHJOzDKELazn5fHRAINzJA+L88Et522dtRWsidOAOYgDbamw605CRquXCgNhw/A67T7v
	KA2hHI8RhIbhL/fNCzWYTlJ56BRqdirDgVCDEmmfQcKd2gJ+sSqTpZZXSWebCm9ffcT9awIr6V17A
	4fzd8gFXXMuMFFLZfQ4yr9p9hpTjkcNuCES6AoDlSVlxPBk0f8RNPaM545d9AjUlrgq4FAxSz8Jy1
	nDJk1xFr7Hd0/SZL6mgkgITj2+XeRiBk1eF509XQ5mc6/vMMFLYEFSAV2mn1MhafNizI6F097O5ra
	7a9akks2ZUIyQ4n/m0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAd-00DoII-1b;
	Tue, 10 Oct 2023 17:05:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAY-00DoGM-0T
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c5bf7871dcso43884155ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957514; x=1697562314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPT4Fkg+ojgLC0XZKWvgq9PlzRbEr2TYZf8y6H1Pt5Y=;
        b=GrKnd3H4+8HpDqLOwAmB1fwAvBoAajq0mXSo5qo/pi1Z97UO58giMKhjpoga0h0tbU
         DgBEPLZB5FVQLmz4IvraGrcvGVYHSLnmW35vaf14rKQnkwa0S5lAERaE4o5oX4kNyL5M
         YFEHCeM/AjBPl7tV6n7/8hva2+w9/m8VoPghzOmyFSfeip1N3nT0+/EuolTwoUCXc/Oi
         AzYmF9AEW66j8sB/4uUEeWPf0A7SqTn9QKsv1NMqkZDZsjQCSCtUCC1THiKaX2duQRqa
         58737H18XMoRHHn10X+arI3HRPfV2yw9jIY2hlnMVhkrQpTF5K1+HRuZ3WNKSvpHfpF9
         DhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957514; x=1697562314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPT4Fkg+ojgLC0XZKWvgq9PlzRbEr2TYZf8y6H1Pt5Y=;
        b=Cy6IkK2F7Zc5stvFS3Yyd0K1X7C+bRipHtAqPG6cLnfQhHB6K8tWXGaZlNFLB3Qquw
         isnO93seqmnXPHc9i1SWcAQ+udp+mvMrfAiFsB0tbhwY1LfyG/VMbJ+owNZczqgAAiDg
         9flJDBbcNu109RHMQzybjqdBUbRRy2AzVKp751OekUj3Y2t0xDWOB/L/ICE4TGvFLe8B
         ZiDQhss5+crnN+Icb15oHpSla6S8HQUMGoXZ3qOubturaMb9aHtd2bVR1s4sLZkvtt/c
         ERQhlS7KVuEqf1fDbmNuIX7a3rW38z2loaSoQpmNnNPvgnvzMhatZeeu1kB3mfhl1khG
         Y6lQ==
X-Gm-Message-State: AOJu0YwonOXR40B8Tjv65VJicVUQs7h+gIlDUG+kju9EJGYO99Lpbh29
	w7ItIED09EZBL6c9BjsUUfCmGg==
X-Google-Smtp-Source: AGHT+IFym/OscZjdiaKnZudFAiUw/7t8pHDcgobeGgruKdPyihzD8VGIHQ5tw7zHoHGLJR6WzQgjAQ==
X-Received: by 2002:a17:902:eb46:b0:1c9:c5a6:1d00 with SMTP id i6-20020a170902eb4600b001c9c5a61d00mr895380pli.1.1696957513651;
        Tue, 10 Oct 2023 10:05:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] RISC-V SBI debug console extension support
Date: Tue, 10 Oct 2023 22:34:57 +0530
Message-Id: <20231010170503.657189-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100518_185114_FF3C5373 
X-CRM114-Status: UNSURE (   9.15  )
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

This series adds support for SBI debug console extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (5):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h   |  3 +-
 arch/riscv/include/asm/sbi.h            |  7 +++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/vcpu_sbi.c               |  4 ++
 arch/riscv/kvm/vcpu_sbi_replace.c       | 31 ++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 80 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 35 +++++++++--
 11 files changed, 153 insertions(+), 14 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
