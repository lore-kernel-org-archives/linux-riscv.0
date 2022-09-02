Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D23ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewClqxhkc12cbjrxM0IEla6ZCSv/N2OamEr8jDD9g10=; b=GFufTz5ryutn7e
	W4Mrkj6LeXoh070Oq+Ugk8Nqf3B//sJr3IhsTpBPB4yXcTNkm5A5K5gbe7rkXi6YVhrfbjFpfRiir
	a8/nyieW319BvM+nMtaK+DqAsqcVT+DLh4sLIVdhyicxTs6A0Quy+i4dR0Ie/RadhKmq5nEsEmQ7E
	Z06U4SULn9jjQxQJsJntF7s/m0n5eORALuWx4BnVlnIbJ1y2PXJun0G2//ZtTpXV88t8GBHAIFsiY
	tx4/g1ojsLz50xX/kJqhtqz4iCXfD+SVgX+0TseBLRSKyHLFxcqDwEdlFE/aliYhHF1B9yPCvB4VT
	HKaN4BcWo7DG1v5Ft6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3A-007bLg-Vo; Fri, 02 Sep 2022 17:01:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA37-007bJf-UF
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:01:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v5so2427752plo.9
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YUxOFpnDcuO1JKcZKoGOLhBh9DhGvttoN1H+IidO6hU=;
        b=ETyEOM40mL6WbpHYxawQkUwUqftcZOHasqHn1N2MV2Rmdifn+azsFcD3L9Rxm6Doob
         KYKtL5G1u+PGSpFcQzCJF45Q5LUQncBQ6sVZTFYRSSSe4ZUFdv+TlhW4j0VscznpqBUo
         F6U7nVgYJQPVJh/ZY6rKhO+k44vgYS5SomlukJn9HGDlFRnXaCUd+tjNHVxXGjPuOuLe
         +AQp7LdDBBYtvZd7rmDBvIXhdSEqXN7RaRVwjdtHGsvA7qcXu1QF3Vrjk5f94CgG6wpY
         mygpMiQRHmDYNrMLkbxZR4V333iaCvozt1+UiBzOmnN/ff3B3zQu8D8NQmHVTeej1hdF
         FE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YUxOFpnDcuO1JKcZKoGOLhBh9DhGvttoN1H+IidO6hU=;
        b=OxJQLd6HaGSXDL3Wff0/llZ7KTmY66R/ktL+5Uxjw+NJAQaJK7MthV8gqOo6idBL1N
         Ic7p+ffeXnuhpIh8IS+skiqes7pbb7RkBEKPNAIy8lyA0QQStS3UUR36vVe/8n70aZ3m
         ZM+yLfoHKSJUjMMELGZ4d/kw2Suo/K/4rnCcwBKcuPg7kNfkRadTECC5VvzeB3xoHiht
         GO6P9x7GPTWIKhczlqXi18aFzn61stpZZd8fsmQZJGv1uD+j+NdbzMqBG+01dPDEVUfW
         59HYrNW1V1P3ABoegRJFha2n8ltaCvnhaJp8PBUpXHtKyjJNId1+/obonCfV485wvT+8
         Jo7w==
X-Gm-Message-State: ACgBeo3cFu0pbE+wSH+rleZ+2yx8G9/2ghB9yAjiddj52vBhSTh86FF4
	9ImnZTxEZWg2gfOMRBhDjRy76w==
X-Google-Smtp-Source: AA6agR6AZOMgkiY+i1WsWPOVMnHoXdP3XF2/SxVDcMtustilH221mFiL8FiGhx5WwGV9f1MOs3htnA==
X-Received: by 2002:a17:90b:4a87:b0:1fd:f44a:1d9e with SMTP id lp7-20020a17090b4a8700b001fdf44a1d9emr5731358pjb.241.1662138104265;
        Fri, 02 Sep 2022 10:01:44 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.83.155])
        by smtp.gmail.com with ESMTPSA id w10-20020a65534a000000b0043014f9a4c9sm1638800pgr.93.2022.09.02.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:01:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/3] Svinval support for KVM RISC-V
Date: Fri,  2 Sep 2022 22:31:28 +0530
Message-Id: <20220902170131.32334-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_100145_981574_E88FF72A 
X-CRM114-Status: UNSURE (   8.29  )
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

This series adds Svinval extension support for both Host hypervisor
and Guest.

These patches can also be found in riscv_kvm_svinval_v1 branch at:
https://github.com/avpatel/linux.git

The corresponding KVMTOOL patches are available in riscv_svinval_v1
branch at: https://github.com/avpatel/kvmtool.git

Anup Patel (2):
  RISC-V: KVM: Use Svinval for local TLB maintenance when available
  RISC-V: KVM: Allow Guest use Svinval extension

Mayuresh Chitale (1):
  RISC-V: Probe Svinval extension form ISA string

 arch/riscv/include/asm/hwcap.h    |  4 +++
 arch/riscv/include/asm/insn-def.h | 20 +++++++++++
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kernel/cpu.c           |  1 +
 arch/riscv/kernel/cpufeature.c    |  1 +
 arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
 arch/riscv/kvm/vcpu.c             |  2 ++
 7 files changed, 77 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
