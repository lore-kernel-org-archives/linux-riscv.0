Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC864C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q2Rx6BeAREuaSuF6DQGsXk6YLL5VDrVjTj7IVHX7GqI=; b=nNzHDELBKI1H+l
	3ZYQ14DJzdIkZhZSe2D18PfOob9JDypL+MH/Uqr94dpB8CnONj+3bcE6kgOXqPJUTCHWDIgbTqB41
	6fz8QnPVXSCRwL7FsnNWYkPbhjALmYwQWmDLpYGR2QGCjqVqAARs1rZ48nlY5zwt0eGpOBu6kh4Gu
	KulpsrqhPbqqQv1Mbw5WNTjyMYwNKTMd9dFO5xJErdjCyAEPpc5pmlDtxTTvXsdd+68/rk0QNQu1J
	rF9+Jh+azrAHfmIv/tRCIIe1zTzZ2vAWRuxOa6LQkMniJbBr7gAdqSHlGm0x/Y2gMcEQwQqRUMg9/
	g5cT88D5VBrKv0K0pRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoRx-00BVwf-P5; Tue, 01 Feb 2022 08:23:41 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoRu-00BVuw-HY
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:23:40 +0000
Received: by mail-ed1-x530.google.com with SMTP id r10so32735183edt.1
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFZBlP26iSCuq9pcp8AO1ebVNfyJtN9g48o0eg6YeUo=;
 b=G3B3ewFELNCJK22vhw0g+Z2PMKJnRMsQAO/hHyIzUQh5ZlrFJ5omPuWN5VX0uNvNE0
 EXmGj7q2qs/Qn4+WKa5VtdFR+Xt9d8n40Dv/yCHz14Vyk3lRh6yxM+M9LUrXiFkIeHeb
 ZQCK0qrFQHL+eKagfOP9ECzMyNaPvo672BM1oKLuu+bycdx5S3NCkgPpfyLf4WqOYf67
 AW76rtTOE5V23OXmkTwWvTNsl6R8atv3kK6w/Piw2vK4M22HeNpaqXvrqTJimLZiwGzH
 +fzf4JeDVUBmnVW6jFNFd5c+LptJrQ6VIESRg1DIz3YCvu1//jdcQyqVyP18anMZ+lxW
 wkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFZBlP26iSCuq9pcp8AO1ebVNfyJtN9g48o0eg6YeUo=;
 b=3Dv5iPitQVFPt88OXSg7IJsWnxtwjLIpXwf+kA3b5pjkSqSNIHkxFssHZbN057tbBg
 yWPGPQk53GnSDda5MlR0QfA5ea1LWXhqzCMULluq01L7kZlvGcYJIj5z6AUMubEUtrPh
 7BMEH+yQ70TWZ+J9ved9dHB5wmXeAvEXKRYc+8Xs0aKaOJgRlmhZlkm3HAu1eUVNTVLO
 ZkEcndOIvcoA4fXoY/WChzL+2WNNOBcArPWi7zEqjeoV2EQB0k99VO9aTr2icQ1TIWCX
 PAeEoLUABkPIQGmgHsOEVjkYFu3jpAGW0HEMRoh2kPKAi+a2PsY6D9Xxzu+gD24ZPN75
 QK/w==
X-Gm-Message-State: AOAM5321oCbNhEqGLwMV5v6Z5WDBJ9HYN958wFcz972LBAH8lCpaTBvb
 DkYSC3aiz+fsKj/d6JpScwvfKA==
X-Google-Smtp-Source: ABdhPJyAQHIh8pxpRN/DzJhAGdHM+TPIjVRpgsk6BLPGFiShHIF8n3PXkg4A3GBNfSU5h5ety+T+Dw==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr24015019edr.93.1643703816963; 
 Tue, 01 Feb 2022 00:23:36 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:23:36 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] KVM RISC-V SBI v0.3 support
Date: Tue,  1 Feb 2022 13:52:21 +0530
Message-Id: <20220201082227.361967-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002338_618541_9C29BA25 
X-CRM114-Status: UNSURE (   8.90  )
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

This series adds initial support for SBI v0.3 which includes:
1) SBI SRST support for Guest
2) SBI HSM suspend for Guest

The SBI PMU support is intentionally left out and will be added as
a separate patch series.

These patches can also be found in riscv_kvm_sbi_v03_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (6):
  RISC-V: KVM: Upgrade SBI spec version to v0.3
  RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
  RISC-V: KVM: Implement SBI v0.3 SRST extension
  RISC-V: Add SBI HSM suspend related defines
  RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
  RISC-V: KVM: Implement SBI HSM suspend call

 arch/riscv/include/asm/kvm_host.h     |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
 arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
 arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
 arch/riscv/kvm/vcpu_exit.c            | 22 ++++++++++----
 arch/riscv/kvm/vcpu_sbi.c             | 19 ++++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++---------
 9 files changed, 125 insertions(+), 31 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
