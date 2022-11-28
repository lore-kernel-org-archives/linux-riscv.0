Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F96C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QsJkSP96E/0v3Fgigz9s7kaV9SNpY7Kk2GfxJNOvtlU=; b=M9Svw2XEJAJT7j
	6pBkcBQrpkPLUeTWs6FFCPH2tzg2YJLcjLCdSw8HOH0DGtFT5gOardlRYbeWvlCfV89X+vXQTgstQ
	TVJxJ18NnJrvaUju69MZ7Nntr6E8HrNXb4KVfylmq1ulelT7qfBVLVXpJMshfT+QO7B77KhG9ATza
	TjrmOEd+jcTBDzNQ8g7freRJ8/ZcXtsGaGm0pT/4FJV8H/ckMbK6QxcXzSaOFBxEVFd2bPMjh5qI3
	WyGjnv+1RvoG6ncD5Ielr7Bdnt0tWdL+vssjq+o+t9pH/tzWp/cb72t7gCOp0n/drI53sjJE/CTG6
	7pypgkRcE9DsJo44C7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmN-002ivM-Pc; Mon, 28 Nov 2022 16:14:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmK-002it0-QI
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:46 +0000
Received: by mail-pg1-x533.google.com with SMTP id s196so10351945pgs.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jl4oXIilI+U2WdbMINVvxsI3t3kOFF7gSAjgWRgHySc=;
        b=e7h4lRGktftITaQLTFzJ3h3z+b6fKmtXgpcRtyQhPTmm9uRphG0oxaHiHWzgzLtviL
         eUIhtUYdUK0r+OYubjIc3jg8LG87sY/9qZkb1iajOrwzz4MsCw4n4O5WgbrrH9bE5ZqQ
         T+rtaLeWg3Hqwd3D9EvQx2fw/hZqf+zpfUIyQulIdVGjrRKXPFXHlvxx0y+yVLwdj2QR
         XRiUEP4c7u0nG0efttC7ROnQgmzXYNy5eSMIySr3SjKmlejYMgwmgGYiu8fJiVWBoQ/F
         M0B4dPCBacWkxn+baKI8GzQQdtzCiEFH6t2MteqQmQZCxdCGeCCqUJzI83Lmn7imf+i5
         11Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jl4oXIilI+U2WdbMINVvxsI3t3kOFF7gSAjgWRgHySc=;
        b=8JTHi4df25Iu8YFA0U/BBMrV0k+ACRWoVF45oyrXZeT54Pnq67K0EDqRqvLWKfeRp+
         dDSq6MzFrUodMLEjVTP1exU3vnR6q1PUGYUhytgeoNi870d0cdlhtD/scOAsvvgjpSSU
         pmdEpbtN0b7H582NgKfO0Y/dnwrpSDx9JDwo7LnFiILCsQjbNlCRva2+FmFzbvVNXZir
         oU+ARrf5wHJW6MelxZ763BP7/Yw1eQfJT/FPe8CLwcdHN7jU9B7pIPI9OzI9TZ0DCPCU
         DSlrkyNUrla3DS3sU4fxFKrw+7fEJLsf9PCg1y3af+wqUNbE991oBff9lVYuzA18wKw5
         mNFw==
X-Gm-Message-State: ANoB5plIl/Y7gy7WVaVF3yjIDrUEKLrMabS93iD1NXO3jbHCZfs5eNMv
	pM3hIWLmVZFINHjzbjD8pqEE5Q==
X-Google-Smtp-Source: AA0mqf4ALS2HgbUR5r91tr2m4UVS98vejcncYu6PiIk8G5B+Ls0u+YcI6binU/jGVUW6pDRGwzRq2Q==
X-Received: by 2002:a63:d18:0:b0:46e:b0e3:ee46 with SMTP id c24-20020a630d18000000b0046eb0e3ee46mr27574846pgl.622.1669652074732;
        Mon, 28 Nov 2022 08:14:34 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:34 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/9] RISC-V KVM ONE_REG interface for SBI
Date: Mon, 28 Nov 2022 21:44:15 +0530
Message-Id: <20221128161424.608889-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081444_874336_F96E3042 
X-CRM114-Status: UNSURE (   8.17  )
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

This series does first does few cleanups/fixes (PATCH1 to PATCH5) and
adds ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (9):
  RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
  RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
  RISC-V: KVM: Remove redundant includes of asm/csr.h
  RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
  RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
  RISC-V: Export sbi_get_mvendorid() and friends
  RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
  RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_host.h     |  16 ++-
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  14 ++-
 arch/riscv/include/uapi/asm/kvm.h     |  22 ++++
 arch/riscv/kernel/sbi.c               |   3 +
 arch/riscv/kvm/vcpu.c                 |  82 +++++++++++----
 arch/riscv/kvm/vcpu_sbi.c             | 145 +++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_sbi_base.c        |  15 ++-
 arch/riscv/kvm/vcpu_sbi_hsm.c         |   1 -
 arch/riscv/kvm/vcpu_sbi_replace.c     |   1 -
 arch/riscv/kvm/vcpu_sbi_v01.c         |   1 -
 10 files changed, 244 insertions(+), 56 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
