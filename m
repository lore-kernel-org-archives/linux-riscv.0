Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C9FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6Av6otIDkdhPZhumtvjhYfBYVxQMWg7Qq0k9K7qHuQ=; b=Qjf8F7WFK2mseg
	VAHt0c7lxMpHGDbE7+MDdy7wQr3NKzWddKCJEm+pv/a09AU52FKMyHPr2PucemsRf5BrGJsP63H38
	lNb+V1LKmVFWlHEEMga4jpXMhGmBlv+pAxpGmAosrW28hHa25mdHjARtawg81yHi0dgyt70l6ik9h
	bW7vqHso+Tsu0pptXH6CJaDdzTOP8VWOhRO62MwYt1ceTxfIau9RsvcBwNEONVISXl9Brn8QO3mcq
	QUHxFRAZCJ/xqlfEROnJUywYsKerx3lOVxMpowbencHl/iFSZLHUM6SHxb1e5Ckilukc+SjgFJbRU
	Qc9cwFUZcLNKCyIicGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDil7-00HRJy-39;
	Thu, 14 Dec 2023 10:16:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDil5-00HRH7-0R
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c41df5577so47518955e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548954; x=1703153754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=osF9PtT0XneIHaK1AbmcqNBCF71s2lHM1BpRF0PJptY=;
        b=UbzCgC9pDiUiLkPBQtUt25eOedvCVb21h5ApYdWhy84CbZaaS4rFfzWIWGAmvpKsxH
         rF/J8nTUJ0g0PC9ozugB1PWLHTon58dCVIKSRLFTqVKXYMkkwkgWELY9XNxzTC9w6bG7
         Wvy/uaUOurfrF4XpCc3wzjeHajbYGTiqw2Hotovq5joeSD6gigKhPE08OFUSzqmTjixX
         Yj9yzobHigl2qR2R/gCNMeFDDokLaFT5e/EAgHVKQzKuQxqbi3xKTSN/6PHJqQKVc5Qp
         mBC4W2ljEvkOW2K2NtdNF3pYW//qOKIL28xJncRc1M+xP/tWFKT09JV2aqunj7u2SkpV
         2C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548954; x=1703153754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osF9PtT0XneIHaK1AbmcqNBCF71s2lHM1BpRF0PJptY=;
        b=r9f6cIMYKXvdqj6PZvbI5LVtd1Q2bMZBQvgignirOX+EIzfIkhct+y8cfoogfwJON7
         fXnvV9grcVaf0KTwJID2cq9krJB4vCxnyiWHmLtKYUpgwChSp3+A+y6XD+WYyFJLe2iu
         EVDpjq28VgTksRHbYm1x5Xt0YN3qO8YCGuj14Oj0YkUhHMbmH15wyZcm70Py9awiWXoc
         Tb5f6zovWlNNJkfQEtDu+7Sqx8tyYSLn9guSIII3NJW/1SU5Wd0wumsOjbtMzSMe4KpF
         hh97opf36zyMfXo2TZhtmaq14P2obJ2iUVbbqkARoy4g7FmKx7M6oFSvWqa90K5se6tD
         f3PA==
X-Gm-Message-State: AOJu0YxizolAM5mndV8uzl8wt4rNBp17qJu4+TN82Ye8f2rAlfTxEjLB
	hX8h/xN4yN9AdPgNa+v5pOe2eV1EG6gIlbftPpE=
X-Google-Smtp-Source: AGHT+IF3W4UDaTU9TkmFl4OfPOr2R5VlDkPBD79hepfEio3hAZAvosVlYJ75fB+u130xi70fmXErGA==
X-Received: by 2002:a05:600c:138e:b0:40c:4b4e:959d with SMTP id u14-20020a05600c138e00b0040c4b4e959dmr1661065wmf.167.1702548953649;
        Thu, 14 Dec 2023 02:15:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm14134218wmn.13.2023.12.14.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:15:53 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v2 00/13] RISC-V: Add steal-time support
Date: Thu, 14 Dec 2023 11:15:52 +0100
Message-ID: <20231214101552.100721-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021559_178668_4A77579B 
X-CRM114-Status: GOOD (  14.29  )
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

One frequently touted benefit of virtualization is the ability to
consolidate machines, increasing resource utilization.  It may even be
desirable to overcommit, at the risk of one or more VCPUs having to wait.
Hypervisors which have interfaces for guests to retrieve the amount of
time each VCPU had to wait give observers within the guests ways to
account for less progress than would otherwise be expected. The SBI STA
extension[1] provides a standard interface for guest VCPUs to retrieve
the amount of time "stolen".

This series has three parts:
 1) Patches 01-03 - Add paravirt support to RISC-V and implement
                    steal-time accounting support using the SBI STA
                    extension.
 2) Patches 04-09 - Implement SBI STA in KVM so KVM guests, such as
                    Linux guests which enable the paravirt steal-time
                    support, can be enlightened about stolen time.
 3) Patches 10-13 - Add RISC-V support to the KVM selftests steal_time
                    test and the SBI extension regs in the get-reg-list
                    test.

These patches are based on kvm-riscv/riscv_kvm_queue

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-steal-time.adoc

This patches are also available here
https://github.com/jones-drew/linux/commits/kvm/steal-time-v2

Changes since v1:
 - sbi_sta_steal_time_set_shmem() now maps SBI errors to linux errors [Conor]
 - Squashed v1 patch 4 into v1 patch 3 [Conor]
 - Moved kvm_riscv_vcpu_set/get_reg_sbi() to arch/riscv/kvm/vcpu_sbi.c
   which seems like a more appropriate file for them
 - Rebased on kvm-riscv/riscv_kvm_queue which has all the dependencies

Changes since RFC:
 - Rebased on v6.7-rc3 (plus the patches mentioned above)
 - Added defines for the -1's [Conor]
 - Added a comment to the steal read sequence [Conor]
 - Only do the steal read sequence for 32-bit and added READ_ONCE's
 - Check for SBI v2.0 implementation
 - Rename set_steal_time_shmem to steal_time_set_shmem
 - Add get-reg-list support and test with get-reg-list kselftest
 - A few other minor improvements
 - Picked up one r-b from Conor

Thanks,
drew


Andrew Jones (13):
  RISC-V: paravirt: Add skeleton for pv-time support
  RISC-V: Add SBI STA extension definitions
  RISC-V: paravirt: Implement steal-time support
  RISC-V: KVM: Add SBI STA extension skeleton
  RISC-V: KVM: Add steal-update vcpu request
  RISC-V: KVM: Add SBI STA info to vcpu_arch
  RISC-V: KVM: Add support for SBI extension registers
  RISC-V: KVM: Add support for SBI STA registers
  RISC-V: KVM: Implement SBI STA extension
  RISC-V: KVM: selftests: Move sbi_ecall to processor.c
  RISC-V: KVM: selftests: Add guest_sbi_probe_extension
  RISC-V: KVM: selftests: Add steal_time test support
  RISC-V: KVM: selftests: Add get-reg-list test for STA registers

 .../admin-guide/kernel-parameters.txt         |   6 +-
 arch/riscv/Kconfig                            |  19 ++
 arch/riscv/include/asm/kvm_host.h             |   9 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  10 +
 arch/riscv/include/asm/paravirt.h             |  28 +++
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 +
 arch/riscv/include/asm/sbi.h                  |  17 ++
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/paravirt.c                  | 138 ++++++++++++
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/kvm/Kconfig                        |   1 +
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |   7 +
 arch/riscv/kvm/vcpu_onereg.c                  |  50 ++++-
 arch/riscv/kvm/vcpu_sbi.c                     |  67 ++++++
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 202 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   5 +-
 .../selftests/kvm/include/riscv/processor.h   |  22 ++
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 .../selftests/kvm/riscv/get-reg-list.c        |  43 ++++
 tools/testing/selftests/kvm/steal_time.c      |  99 +++++++++
 23 files changed, 778 insertions(+), 35 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
