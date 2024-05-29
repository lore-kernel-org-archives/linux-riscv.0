Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD32C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W4rRfmQ0OdJqrLjt+Jmg4FEZDFlULTk8V9FtgwDZV+s=; b=T17HtZIx8IG+N5
	5YUVoj+80CCFdnyeYfJIXG+I8FxjslLOsZTjLGdk0UZC66qEoPhsd6NPHUERvECPmLIIrNOAAR04G
	Dk8+5tTawn6/RgCbFfEC1+TlLrI7v0raEU9BjW97JCTDfe/izZI+M/l9kXSO3CYRZTjKAqwFKm62x
	IX2QaHcbAAdt24U8hsGv5FDHvAxSILFGhZQNqvOLdaRaZvN6eI7XGwlfrpQTahqGzG+0Arv4On8UN
	s6vVKuWOeqC7OzzNFE9SSToGpkseMCmvhGvEsf1P29FaxFT1w1t9c5hxkcnwt+OZ4GVlxwvUFATHl
	ga7Lx4rOobcblAKh1cRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORZ-00000005G80-0Iu2;
	Wed, 29 May 2024 18:54:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORU-00000005G5J-3nYM
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:54:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso357055e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717008870; x=1717613670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIic4JMyc/4c63XW9p+6fbZplpp0iCITvAcX9Knosjg=;
        b=yaTjwpjfPvi95LjaGnLh/Pp/d+mZsFmuB8cIXHqvHaa90Hv6QiJNxd8BM/T8q6g4we
         B+OindwBXczUoYFWxdvrBZhVqyfU0ks7xRocWlBH4PlvODB4/1LNzem+21EjtixY+dYl
         MOU+Xy20kGepmqliUL2D2LBoWvYuqJYk5LLXYstVQvx1Mfk/JIhocdsQRTEVgdPFbew7
         45AErPnmXtPVxfahihNMUubxZwqg+/ik3DXzSQ2aa/o/Nk27iv69KoEUnXazwa8JxKkF
         7cSZC86b+CevkZSiLuRHpNiV+F7PDYTBaktpOypoei294OTC1moPqwwPhahB78x6qz4o
         +bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008870; x=1717613670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIic4JMyc/4c63XW9p+6fbZplpp0iCITvAcX9Knosjg=;
        b=Vf8wKevC+nUZTNYHE8yMX7JNAhMA+R5cuUIcvy+gU5pLk+WO9MjZBxT2FVK/XUKCM9
         0atsg5hRjgy9PQjjT8ntQrhJoP6u6CZpIM0WkGBUhvG+2Ulw5FmP0R0pxIzBuQu16i2A
         h8xqtIh6rCzLqr+A+inNgLiSjtI4zGNXMuRh1Ji2ZQop6MYfgfLW/hiiqrxUBo5ZlzPC
         1XpKwjOlzv4z2cvJUfBd+X6DQF/L3kR9E4xqXDe5yeSRhCL9oI0pGFfw7SQrg2qAuDg1
         jaSvu1TdG7jRlZZAC+p+9uRtnPDksBv0fCMJh0AuW2VTMNJNYfr21+J9i8s8kWIhD8FZ
         /Sjg==
X-Forwarded-Encrypted: i=1; AJvYcCWhyMLQF8LUJNAOblH4aSa27axB3u2SkE2iSpDPLn27tb28gLV91soq6LZtca9GqUS+IvB8LnEM3mYFETJ16j4CQSXtoIMEqB+e/maHbiCG
X-Gm-Message-State: AOJu0YypPLCxmyS9VeNgWdg5YfwIbDkCnsackL67CFptCu3wZR8P3KJR
	bU1hS8YnU0L8SWoLWPsn91ByPfhZBMWuUTJ86kjH3gDjoZPIlOgmjOB9oUqJmiU=
X-Google-Smtp-Source: AGHT+IHjVdn4dC57WqV/+1RRT5q3fW+n/nZ4ue2S8a0hdIxSFd8EjP08PNXy9B40Ht2SXbol1HVG6Q==
X-Received: by 2002:a05:600c:b8f:b0:41c:f64:2f5 with SMTP id 5b1f17b1804b1-4212792d887mr210975e9.36.1717008869932;
        Wed, 29 May 2024 11:54:29 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a23csm2787885e9.27.2024.05.29.11.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:54:29 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	tech-control-transfer-records@lists.riscv.org,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH RFC 0/6] riscv: perf: Add support for Control Transfer Records Ext.
Date: Wed, 29 May 2024 19:53:31 +0100
Message-Id: <20240529185337.182722-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115432_971481_A47EAC26 
X-CRM114-Status: GOOD (  15.53  )
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

This series enables Control Transfer Records extension support on riscv
platform. CTR extension is similar to Arch LBR in x86 and BRBE in ARM. The
Extension is in stable state but not yet frozen and the latest release can
be found here [0]

CTR extension provides a method to record a limited branch history in
register-accessible internal core storage. CTR allows to selectively record
branches using filter bitmask. On a counter overflow, CTR stops recording and
the kernel samples the recorded branches in the overflow handler. CTR also
supports RASEMU mode. In RASEMU mode, a call is recorded on every function call
and on every return an entry is removed from the buffer.

CTR extension depends on couple of other extensions:

1. S[m|s]csrind : The indirect CSR extension [1] which defines additional
   ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space. CTR access ctrsource, ctrtartget and ctrdata
   CSRs using sscsrind extension.

2. Smstateen: The mstateen bit[54] controls the access to the CTR ext to
   S-mode.

3. Sscofpmf: Counter overflow and privilege mode filtering. [2]

The series is based on Smcdeleg/Ssccfg counter delegation extension [3]
patches [4]. CTR itself doesn't depend on counter delegation support. This
rebase is basically to include the Smcsrind patches.

The last patch is in the perf tool to allow processing 256 entries. Without
this perf seems to consider that sample as corrupted and discards it.

Here is the link to a quick guide [5] to setup and run a basic perf demo on
Linux to use CTR Ext.

The Qemu patches can be found here:
https://github.com/rajnesh-kanwal/qemu/tree/ctr_upstream

The opensbi patch can be found here:
https://github.com/rajnesh-kanwal/opensbi/tree/ctr_upstream

The Linux kernel patches can be found here:
https://github.com/rajnesh-kanwal/linux/tree/ctr_upstream

[0]: https://github.com/riscv/riscv-control-transfer-records/release
[1]: https://github.com/riscv/riscv-indirect-csr-access
[2]: https://github.com/riscvarchive/riscv-count-overflow/tree/main
[3]: https://github.com/riscv/riscv-smcdeleg-ssccfg
[4]: https://lore.kernel.org/lkml/20240217005738.3744121-1-atishp@rivosinc.com/
[5]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-QEMU-RISC%E2%80%90V-Virt-machine

Rajnesh Kanwal (6):
  perf: Increase the maximum number of samples to 256.
  riscv: perf: Add Control transfer records CSR definations.
  riscv: perf: Add Control Transfer Records extension parsing
  riscv: perf: Add infrastructure for Control Transfer Record
  riscv: perf: Add driver for Control Transfer Records Ext.
  riscv: perf: Integrate CTR Ext support in riscv_pmu_dev driver

 MAINTAINERS                     |   1 +
 arch/riscv/include/asm/csr.h    |  83 ++++++
 arch/riscv/include/asm/hwcap.h  |   4 +
 arch/riscv/kernel/cpufeature.c  |   2 +
 drivers/perf/Kconfig            |  11 +
 drivers/perf/Makefile           |   1 +
 drivers/perf/riscv_ctr.c        | 469 ++++++++++++++++++++++++++++++++
 drivers/perf/riscv_pmu_common.c |  18 +-
 drivers/perf/riscv_pmu_dev.c    |  84 +++++-
 include/linux/perf/riscv_pmu.h  |  49 ++++
 tools/perf/util/machine.c       |  21 +-
 11 files changed, 722 insertions(+), 21 deletions(-)
 create mode 100644 drivers/perf/riscv_ctr.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
