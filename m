Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E12C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=42QQ40pyZKY80Y/Pm6AQxwc5YfhaAHc+E7qkmWFvQ44=; b=E+go1i4mCzNJhZ
	7c7Q3gMMt7o00dPTaMQhMwq/lislHi/u1iFAXB2eFP/HZ6OdLHMy90Skzu+36tUtUNKf4lqkxBQjF
	AVVcVhtawzU576dvucwkvQgMilVw8SoIHwQtzE4uumt1ZuVuiwXCySqzzFHHTYi7K0HDA3zv7eSxI
	zR8vwgQPl96sRQ74v+dafh38hYVVY5TwVdzKuf/TokMhnMIvTuqFxgSpQ59KlbcQsgpx2KxaigAEm
	Gcqz56Xdo0csmdCCm68s7YmceBdRG8YpH5zjTs8JOA4JdlwinEnkwUAo+V/6ncuHTzf46gVaBuZ6f
	4g/QGDzgZ+BR8WHrBrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIp7-008Kzf-1D;
	Fri, 31 Mar 2023 17:46:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIp4-008KyT-1v
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 17:45:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id cv11so2576015pfb.8
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680284757; x=1682876757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoHEj/XaVMrYODDwsIv3pUiYWBKTCAt/9DW5FF1yPGU=;
        b=lH/bQ9n9gJdd02yFVctKPMa86VHkqXM8Ocliwa6VG+FvFHiYgR5AAZt11nq31SwgZP
         O7EgeY84Ar56xdrVYLkB7bIs6ZpHGXA4CQB7i+ZkeNbDoKJioB3FXKIY35z1hKrpT/r0
         Ch7QkjOtaqVc8mvf2LgY6cCPM05vXWSPjOGyRfPSdbvbMlI5ZOdbSw3kMwhUmaeJUUQU
         4zT7bEn29fjEU7/C7BsieueLxeezVbV/BwgJaW2HdbKD2O+a5EuB92fbQXT2M3oVlyoD
         x3v9tEhCjru8IQlPGWVhUfnKwwGdmNm+5e9338klW4+cN6L3WPAuAIjpkksZcCAeWVAA
         B2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284757; x=1682876757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoHEj/XaVMrYODDwsIv3pUiYWBKTCAt/9DW5FF1yPGU=;
        b=G2QEBDjN3G6GB/TBwZdtVK28YLVNiB2ZJoAR7BmRZHmwKFzIXJLtR+V7S8/R4FYuB7
         WIAtVvB4HJmuqT8nwaHsXDLWsF7uFurjb5TX6OP8l/Xsrso8EBaRjxnXuxZ/rCVPjlkg
         c+P7l9OVV2ksiD9LwV3tkbtFWo6/bC0E27QURysngYa+BMQCTrQNKp5vTcG7YR0geTwk
         6Z+hCfD+8dYQZpNFk/FpPWUg59WK+QMIRysd5I2hT/JRXxLvqy3OZx+jc8uQ5TS0UcBv
         Vjn5cCokkG4S14JwWuns+uVxQt2ohmNpw5AP0Cz6yKuJCxTlNbD5QA8CRooi2L8dtmms
         WyQA==
X-Gm-Message-State: AAQBX9dRfu+NUOUNPsSoXQKXNoTtbnq5/CxpYeS6OtxKLpjBEngC43dC
	Rumd6DQ+v7h7YerNNC2NDZLEMA==
X-Google-Smtp-Source: AKy350YhbyoJvszMMJ4xz2sGJ4p6nihEv5ylZR69ZEbPfkWDlUNtsyg1Ouc5zPXjIr9MMcNF7WElow==
X-Received: by 2002:a62:524b:0:b0:62d:e95d:51a0 with SMTP id g72-20020a62524b000000b0062de95d51a0mr2439275pfb.13.1680284756986;
        Fri, 31 Mar 2023 10:45:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id y19-20020a62b513000000b005ae02dc5b94sm2043143pfe.219.2023.03.31.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:45:56 -0700 (PDT)
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
Subject: [PATCH v4 0/1] RISC-V KVM ONE_REG interface for SBI
Date: Fri, 31 Mar 2023 23:15:41 +0530
Message-Id: <20230331174542.2067560-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_104558_632219_006AFA9E 
X-CRM114-Status: UNSURE (   8.46  )
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

This series first does few cleanups/fixes (PATCH1 to PATCH5) and adds
ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Added missing switch case for KVM_REG_RISCV_SBI_EXT in
   kvm_riscv_vcpu_get_reg().
 - Return a bit mask of disabled extensions for
   GET(KVM_REG_RISCV_SBI_MULTI_DIS).

Changes since v2:
 - Improve ONE_REG interface to allow enabling/disabling multiple SBI
   extensions in one ioctl().

Changes since v1:
 - Dropped patches 1 to 8 since these are already merged.
 - Rebased on Linux-6.3-rc4

Anup Patel (1):
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  32 ++++
 arch/riscv/kvm/vcpu.c                 |   4 +
 arch/riscv/kvm/vcpu_sbi.c             | 247 ++++++++++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 274 insertions(+), 19 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
