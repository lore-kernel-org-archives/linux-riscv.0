Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC4EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mBkSkIPDuNn/p4I7fWR9u1M00rqVxOCThwfR/V7KZtI=; b=0jp2NJNxdnMUfh
	ac31oWx7OK9ItowcNHLrhMtdLCRtOGmLc613+YS78cPUxKs3RToeNj9vLT4vd5d4t+jarXuxw3a+B
	Pq5xdECldOstl31zh/O8pQQIrWeCeXwPBZ5Sz9PWCnZfHMSptZmmq/qoFTziE6oCo32yksAiQWBgu
	l43ohnsjvmD3g48piqp2v8fASB5/uIf2H6581LquB6mEcGtPefHUF2QBbu0KUmSwv+LmHqFa+vp+s
	OPzzdbcev8BP3pFtfwMJi2/ECuV+fdLmWouDwApaLgljtiRAxLwp4s4FY3R0rcpt7ruKExKHE5mjF
	fFQi1/lQTJaVvFLJxYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8lxD-00Bdt3-21;
	Thu, 30 Nov 2023 18:40:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8lxB-00BdsG-1G
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 18:40:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a132acb67b5so182444266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 10:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701369597; x=1701974397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nhia6K5aLQRR557d4ZDzOHaiy3rxd0nhpPd3i0+7724=;
        b=EN56cTk1HqANwS5ut1frKdyAiYDztPvsrGWu0Kb+/SVL644lmpXqhAgv7vUWMhv5i7
         t71eKfnjinPZRBTby95GfLCc32VVKOczwfwvlGadJeFKeVYM9x85oiGZAEfazvuKKupM
         x1LoHmR8jhYrABw1FW+gxHm9lqM6Gg0Je5v00wAoy9m/FcBjLEM1VqfZLX9BG8sFzoVV
         /TI9o8xzHqsEzQMXNF7OmSHmeWDDaQmwg3BN7NdR4TPTXtM7J4iXFNR8Ufd/vBtwj1hM
         ox91hLBMbey4WjkbOG4uaH/gHkZ3CbAYPjOdvag6cVYqMMFjJhhmWqDHbkXux+O2kVrO
         0EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369597; x=1701974397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nhia6K5aLQRR557d4ZDzOHaiy3rxd0nhpPd3i0+7724=;
        b=fofTAOXLnIJo3sXfw5pPvxa2LH8CJtsx9wpkQPbPJW8SYHWuxW2ndjKIb22PABZT8H
         AJ1VvKPs6s6VyAfIyWTmrNEKKmcy6S+zGw6UI+ZT9qFkrqfl9bxrG3eua1R7MhA+Qlgo
         8JTqVxJl3BrOrouJ2r9SdlmyHdX7lyHfy5j9sTx5eZxQ0JUlTg3r7/T3Ugfs/5zoLNWm
         QseidlDK77i2IVs1UU93jWaz8Ebh2bNGURNIuhjOgYgN40FkrQiklqWpfG6aN9Awx4gB
         NOwO6+eoSSxBcvqc1Trf/aCGfJJmcCMkxOK5ive7HqrCl8btuaaxzUNiicQLS+mjnJY/
         UTAw==
X-Gm-Message-State: AOJu0YzHJQuikWvQo3YNBObktoYpi+4lsum6vcpwWWqfZLF5P65W+A4X
	WKr5DpRhVu8NGdtfYmRzrtu1UiFLaejzv8pbTjY=
X-Google-Smtp-Source: AGHT+IGoZvFcj85iblw3ASG85+Ia9ouF9OOgZ6SvFjH4u8myUHjVQX8K94445x4h/c3PGmHoOlbAiw==
X-Received: by 2002:a50:bae1:0:b0:54b:3edc:194 with SMTP id x88-20020a50bae1000000b0054b3edc0194mr36325ede.26.1701369339115;
        Thu, 30 Nov 2023 10:35:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w17-20020a056402129100b005401a4184ddsm808812edv.27.2023.11.30.10.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:35:38 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
Date: Thu, 30 Nov 2023 19:35:38 +0100
Message-ID: <20231130183537.55203-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_104001_431258_2E99EF7A 
X-CRM114-Status: UNSURE (   7.55  )
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
Based-on: 20231128145357.413321-1-apatel@ventanamicro.com

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
 arch/riscv/kvm/vcpu_onereg.c                  |  53 +---
 arch/riscv/kvm/vcpu_sbi.c                     |  75 +++--
 arch/riscv/kvm/vcpu_sbi_replace.c             |   2 +-
 .../selftests/kvm/include/kvm_util_base.h     |   1 +
 .../selftests/kvm/include/riscv/processor.h   |  40 +--
 .../selftests/kvm/lib/riscv/processor.c       |   4 +-
 .../selftests/kvm/riscv/get-reg-list.c        | 274 ++++++++++++------
 8 files changed, 281 insertions(+), 178 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
