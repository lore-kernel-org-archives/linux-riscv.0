Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF6DC43460
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:57:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB0C6138A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB0C6138A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v/MPMgwHMyIyvyjfkU7Ii5g/vgOCUyeGImEHaj/baCU=; b=XXN5+CR4Ygq1ysIe6feHosCN7T
	mRNyblQP2epoPW1kpAxxJCCACT7LFw9rJ6mTRwgvjpeq/hnJqwzaKSWFTRU20fJckolR+aoQ1wv+J
	wnzYN+37H4oHDoay3Zx9qgLIs7cCMRnmNTDFKtite57xMvbRGY3XXirxdeG7PtFQIIs2Cv3X7jI37
	AuVTmXywrVQHoCK6krrxk6pkRLxc77tMN6zBtpV58cROZA4Qcr23bN/GkgFTZgfPTRu3ZXo3FnELs
	EM9lWzFJgpMCf/wuACOkqGKI6RQNSVbrurzSn1EOkg5HVQG3kDogZoaRJO6C/7blJ+m/wAondyxRi
	CVOHio5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTL3J-00H0Ha-Ig; Mon, 05 Apr 2021 08:57:45 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTL3A-00H0EC-Vl
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 08:57:40 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1358vW3d079892
 for <linux-riscv@lists.infradead.org>; Mon, 5 Apr 2021 11:57:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617613047; x=1620205047;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EfKmC1JuJT8Zu2DDNgq2xg0tTemOVFs2FYglazg4zNM=;
 b=LD8mGRYATXub8N7uRNlngMhpde9Wv65ySPWbYJjSpTaoRfRatLFPabOycpTq8yoc
 Yvg5gfQ6w7bs5A1nRXY97iDJhC3M3pOews9QJqvzU46nixj+nWs1eGo2HoSOfgNO
 C87ai6HyNiO0uOhupSXyEpL1ETubOnAjmeQRytwYUhXEiEGuDlQOxm4jGeewCZqy
 zpRjvJLzyfn4QmrRIDDWoJoYvL62ei2gtlGOKRBVrYetWMTcYLbq6ts9zmyteN6Q
 OGn2Q4dkqce8J3Mer2gKssqJDE2kny/ewtkhMtcpf21QJ4/UUZjoR7kNEnbFNL+Q
 /oo5xHIZSm2wm1QghREYiA==;
X-AuditID: 8b5b014d-a70347000000209f-d7-606ad0f75597
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 77.77.08351.7F0DA606; Mon,  5 Apr 2021 11:57:27 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
Date: Mon,  5 Apr 2021 11:57:07 +0300
Message-Id: <20210405085712.1953848-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgluLIzCtJLcpLzFFi42Lpjp6urPv9QlaCwYd5khaXd81hs9j2uYXN
 ovndOXaLl5d7mC3aZvE7sHq8efmSxePhpktMHpuX1Htcar7O7vF5k1wAaxSXTUpqTmZZapG+
 XQJXRuPm20wF2/kqnp9Rb2Bcy93FyMkhIWAi0d33gbGLkYtDSOAoo8SDCWvYIBJuErfv72QF
 sdkENCXmXzrIAmKLCJhLNM98zQhiMwtkSBzd94sdxBYGiq+e/44ZxGYRUJU48uo2WA2vgIXE
 /50LWCFmyku0L9/OBhEXlDg58wkLxBx5ieats5knMPLMQpKahSS1gJFpFaNAYpmxXmZysV5a
 flFJhl560SZGcCAx+u5gvL35rd4hRiYOxkOMEhzMSiK8DxuyEoR4UxIrq1KL8uOLSnNSiw8x
 SnOwKInz8upNiBcSSE8sSc1OTS1ILYLJMnFwSjUwOW9hCXKIsGKuPzo37mG4kbmnSnr4HsP0
 11uWZp0IVZq7K8he9OU0GZMAxusLYnwez2E+1Bx5wdPtx0w+y8Bybf/+WwLRezLfZVuzLuid
 Zsy1t6hl+9H+Hpk0uadX79yXUWHMmi24smT/49uxFdP3Pav7vf8Wd8SrPzJLO6f3bHJWybV8
 q3XKfUrj+5hXZ6af29um3Neyeao9+4NWI8dZkyMyFr5wbeBgij0zlfurVUTLP/nzm5ZVb7Nc
 NfV2TI3b8Yqw7uUd5uv/zqu/sVTmsKF8XYuxwRkbpV1lBpqZ01YZSj7h5chsN7jPoFT0vU29
 dFdGpHam/86XSjnXOkr3VOzxuCG09EqIlv7vKAslluKMREMt5qLiRAA1iB7CkwIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_095737_416876_DF1467F8 
X-CRM114-Status: GOOD (  11.49  )
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

This patch series adds kexec/kdump and crash kernel
support on RISC-V. For testing the patches a patched
version of kexec-tools is needed (still a work in
progress) which can be found at:

https://riscv.ics.forth.gr/kexec-tools-patched.tar.xz

v3:
 * Rebase on newer kernel tree
 * Minor cleanups
 * Split UAPI changes to a separate patch
 * Improve / cleanup init_resources
 * Resolve Palmer's comments

v2:
 * Rebase on newer kernel tree
 * Minor cleanups
 * Properly populate the ioresources tre, so that it
   can be used later on for implementing strict /dev/mem
 * Use linux,usable-memory on /memory instead of a new binding
 * USe a reserved-memory node for ELF core header

Nick Kossifidis (5):
  RISC-V: Add EM_RISCV to kexec UAPI header
  RISC-V: Add kexec support
  RISC-V: Improve init_resources
  RISC-V: Add kdump support
  RISC-V: Add crash kernel support

 arch/riscv/Kconfig                  |  25 ++++
 arch/riscv/include/asm/elf.h        |   6 +
 arch/riscv/include/asm/kexec.h      |  54 +++++++
 arch/riscv/kernel/Makefile          |   6 +
 arch/riscv/kernel/crash_dump.c      |  46 ++++++
 arch/riscv/kernel/crash_save_regs.S |  56 +++++++
 arch/riscv/kernel/kexec_relocate.S  | 222 ++++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c   | 193 ++++++++++++++++++++++++
 arch/riscv/kernel/setup.c           | 113 ++++++++------
 arch/riscv/mm/init.c                | 110 ++++++++++++++
 include/uapi/linux/kexec.h          |   1 +
 11 files changed, 787 insertions(+), 45 deletions(-)
 create mode 100644 arch/riscv/include/asm/kexec.h
 create mode 100644 arch/riscv/kernel/crash_dump.c
 create mode 100644 arch/riscv/kernel/crash_save_regs.S
 create mode 100644 arch/riscv/kernel/kexec_relocate.S
 create mode 100644 arch/riscv/kernel/machine_kexec.c

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
