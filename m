Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68D8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qh6rM8taXBl9eLN45D/5kJrJemJj2ZOD3pI5zIIO1fc=; b=NKyfSe8mxf836O
	tTJu4SJ8NExhMNuTSStQ14o05WKX1rTW+sFiOe5cLFdp+mXiWLS8Re4YzTOs497mMqaePbK9tjACv
	Ukrey9HTmO9gWoWCP4mA/1G6gHX48CUqe3aJf977/Zj819F9JZiWpT+aIqm6Obd0RVJEJSeG/9piu
	s+7cds1T7PN1YjyuhF0eeefvFA0AJ80zNF+cf29s28Mprgp9G45thXPEAA+btZ2iPwx2NiRZlgSRE
	Yvb8rkNxfpyoFkQbEob50JXFWpLO32fIjwUU+2uNJF+ghmQbP2M7s8qwygXBumZC4hBIq4a/bT9Mr
	d9w4e+2U4EHamkou04Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSk9-00FXxS-0S;
	Wed, 13 Dec 2023 17:09:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSk6-00FXwT-2N
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:09:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33338c47134so6562192f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487393; x=1703092193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc0AaVk6rjEZPljvJap0IyABSUMZPP1S5+BzdVFbnxs=;
        b=dolUPncu9kv9UOOwGm3zwvevT1szCX5BgyDs+8/ukdagcaIsQ4GxQACB7oaBhxUAAH
         21V3Z9QpF3NkGvS9Fdms+hRiuotARDNrSXiL4y52VtdJYopm2LnFljfAeljAAUYqoieN
         Gz0T21xvIr7vJrLMZh7+mszzv4n59y0OvaAUHiNSA/CI4M/tXt4vh1xLmtDg7jDaq2OC
         LwpavN45X4uayssHP5CCaLc7R8wu2A/e9hmTp0HtNpokHIC8SkL9hx2I5M20DcyN0/xi
         DApXdhqqQFrwb/ogGN8A4wtF1rOKV/38Cd9RIlkBs80HFjl3stWTvWNwZLde+D1fov6L
         h9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487393; x=1703092193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc0AaVk6rjEZPljvJap0IyABSUMZPP1S5+BzdVFbnxs=;
        b=Vd1m/Nk62iGRAdoi6R8KJS//tyM/9nu0VQHtB5gkeyfjsCB5qIpZsbBVqJTGHcckmU
         hP3NcHUtsiqDeDQji/v7eyOtii40XlkEOJbpVQZ3MBtJD19dxGHQ9KmCI/dZj8N/EPIT
         Z6JypwPLibL8jy0216IPkwEaglEr584Z5x2J5maEgqKEKtQVa/yhvci2yF6/M3BGdRwn
         C5ncgg8CTQsYbO2c9NMf+nsCEZHpgwQtasS+1JTbKwyvrMfikZ5QH3khd2zc/cKOvxpP
         KIfSpo82EZaL5MBxBq9v/4P/jSHREEer9jlZT3UgMHfRepEAqRL+HfLF5sYVZlShAmPJ
         oqXw==
X-Gm-Message-State: AOJu0YxdZh2qR2ojRMlo4vbwfhdI0DEtaw7L+lZKNGDRYiiyCxSO8p/9
	N/d6Bif/575f8F9CbE+ivS/eJg==
X-Google-Smtp-Source: AGHT+IEmdcYaePAF+bLyUIKESzXqVxPc+HwpjqlnW9BbDQQSQApeW6dXtJoYmcwiwnNdjj8SKWPkCA==
X-Received: by 2002:adf:ea8f:0:b0:336:4194:1d0a with SMTP id s15-20020adfea8f000000b0033641941d0amr558045wrm.136.1702487393091;
        Wed, 13 Dec 2023 09:09:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4ed2000000b00336421f1818sm1319313wrv.112.2023.12.13.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:09:52 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
Date: Wed, 13 Dec 2023 18:09:52 +0100
Message-ID: <20231213170951.93453-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090954_800694_9D077CBB 
X-CRM114-Status: UNSURE (   7.65  )
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

SBI extension UAPI is currently almost the same as the ISA extension
UAPI. This series closes the remaining gap by ensuring when an SBI
extension is not available that its register returns ENOENT when
accessed by userspace. We also drop the SBI multi registers from
get-reg-list (ISA multi registers aren't there either) and make
several improvements to the get-reg-list kselftest.

This series is based on Anup's riscv_kvm_more_exts_v1 branch.

Based on kvm-riscv/riscv_kvm_queue

v2:
 - Rebased on kvm-riscv/riscv_kvm_queue which is based on v6.7-rc5

Thanks,
drew


Andrew Jones (6):
  RISC-V: KVM: Don't add SBI multi regs in get-reg-list
  KVM: riscv: selftests: Drop SBI multi registers
  RISC-V: KVM: Make SBI uapi consistent with ISA uapi
  KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
  KVM: riscv: selftests: Use register subtypes
  RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  10 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  53 ++---
 arch/riscv/kvm/vcpu_sbi.c                     |  75 +++---
 arch/riscv/kvm/vcpu_sbi_replace.c             |   2 +-
 .../selftests/kvm/include/kvm_util_base.h     |   1 +
 .../selftests/kvm/include/riscv/processor.h   |  40 ++--
 .../selftests/kvm/lib/riscv/processor.c       |   4 +-
 .../selftests/kvm/riscv/get-reg-list.c        | 220 +++++++++++++-----
 8 files changed, 254 insertions(+), 151 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
