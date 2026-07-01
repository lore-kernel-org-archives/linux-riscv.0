Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A84C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VyfFlxB7X8waf0wuW1xlL7FVVslvn7UBt7L4MFpWkmM=; b=cWXeZsPi35Hlmw
	se9o3zwbAJvujCvty6LDA/qCE4JIOJquG6CxJfnRB6OdHPVCo8zZtyLSEP4EOx+8bT4P/vnxwDP9e
	DpUq1xUCo0cqFZTVlQQ4u2kaCJdE5wT5RD/36LaccxwOQ5jEPBfZUG9MmXc4jyMOlCWbtl5lCggxd
	5oVVEC5zxP0ZTMw2GJRp/04wpIeDldkmMgTTUOQUKNfgijijoHJM67Rh33B15yjvR1ZcSKC/C4opv
	PGTxehXR4FSX4RA6Hstngrz4YxbTOyAW2Acrh8QAlijMaB6puim0d8tFn/Y5xzNVsNFRyZw68pmsz
	w952BbQ/TJYl52s0zXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemRn-00000000d58-3jI4;
	Wed, 01 Jul 2026 04:21:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemRj-00000000d4Y-0Osm
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:21:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c9f44ddf26so836105ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782879669; x=1783484469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIXJacBAyEaKz61QqT13AHUcLwATDSXxJV4uZgWwmww=;
        b=bB/xGoO8Pj38ARQ8B9DMulfc0nvZqiVO9gHtt23CW9rLDrMkKA97GYS73LvINLE6iZ
         aaGrIOeaPH4fSkfA8h7CvxG42WYB65Xa6Vzn9BHXW7clqsOBXlGtCPXYDG6gvAjo+UuE
         OijYE6RUnMbuM79lJYO0ycy9Z/ydV7FcEjKMaA8HQ09tD512bDU8QALrZPJ2KK1faYdm
         +WMzgXYPw4ET5RGkHUBAk3NpAU8ROQtG7GIdmkRjfgFtWbqRSqN1DYl+ngaNyqCCqvqS
         G48+FnORW2Ss6kFbdDt/PxIK2zZ8U25N1T+RnNOr2PJUB5LWFyGAH3L92i42DJtHxpro
         gJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879669; x=1783484469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIXJacBAyEaKz61QqT13AHUcLwATDSXxJV4uZgWwmww=;
        b=GHfrWT7quzZc1mi+iqu8vOWg6kXHtg/zwZK+pW8BCWNP5SYj0+8YMvUM0j9z172khu
         XpBtKcFW28ezBxTmMvDmXkH2tGHMZB5nSLKSU1/nygYu9tMA7EZO7ZmGwF8Uo5/a8eqO
         wrA4bOaGlQaicQrDs1xJ+XgcG8lGKk3z7nIarq0lFsHK+cEpLn/nIU9U2Gq1LJs/Y/4a
         fzkJ6uj4FFZQtVvHOom7bDCQHCnt5eKQ2If1Gi9ZOVWlCKGR1AHTIQmFb4gUNK3nKlro
         dDTAUS1z6x0spW7affIF+j8P7MJ5CsxT7m1G+NYnBxhJlqzA7nCvB6koFCOXEQe50fiO
         yo/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoKq6gUTruYz/wAagP4XVqTNvGbajY3mMKa1PlGHDR/JFJC260ysEuAEfr59RpNcvNr9DCwf7wk6aqepg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFlFN8O/DmzgSFhPmYksoY8ZB2oUa4FXbMJSJoKIQjAoIHKvr
	mXqYMotoAaTc7P5rWjEcxSNjlOCPUysvbMMZjNCECWAYapxm6miGf7sleSCaG37feXY=
X-Gm-Gg: AfdE7clLUrYhjHDdxvuDa5IGPm5hS3I7NVbPvAH7dizgef4p1Fh6+jNlIpAvi8dDURY
	vJv97GPdSwvEvViddLMTso8HqeN6iYw0nrU9PusxG4B8p/0FfPCGESkhoz6tTdtHJIYUoRYfJYY
	UZuwOAUXr3Ai9/I00BAb1Z0v0p5LoXJcUSGV8RZi+rptS7vxvcsE6oSy3OX+fNHmhEdaoWCFcRa
	E8/HnlIFu9TOOgPzi9jraHkOfIqWGd+MqozvLLlDzTSnufJ48LpDL0s83wjfxESkbhKSG2jlfYb
	dnwjgWKSXBURACyY4YufeiDyhQMmgcEGs+NXvPmShqdEwqTGPPO8qlVcFOPHRR6H7ydOgCs0n0d
	/0XVA9U5C32NCarvn5GJpZ2Oi3OywNeyFkFE5Yjn19JWL993qm/qnTgm+W5jbiDvP0zvCKCuI84
	VbqNG6A3KaxshsUPomMTm6D9S9r3AvCof7lt10QrA66v8UxQ==
X-Received: by 2002:a17:902:d54f:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2ca7e73b1bfmr1201915ad.21.1782879669155;
        Tue, 30 Jun 2026 21:21:09 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c73a9csm24450865ad.21.2026.06.30.21.20.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:21:08 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/3] riscv: improve percpu helpers and PIO mapping
Date: Wed,  1 Jul 2026 12:20:38 +0800
Message-Id: <cover.1782877663.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_212111_535863_89B4A0F0 
X-CRM114-Status: UNSURE (   8.37  )
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

Changes in v5:
- Keep the PIO helper fix local to RISC-V: drop the generic
  HAS_IOPORT_MAP dependency change and the generic ioport_map() change
  from v4.
- Add the missing linux/bits.h include for GENMASK and BITS_PER_BYTE.
- Fix the 8/16-bit LR/SC fallback to mask subword results before writing
  them back.
- Use early-clobber constraints in the 8/16-bit add_return LR/SC fallback.
- Fix this_cpu_and_4/8 to pass the intended operand to RISC-V amoand.
- Initialize the secondary idle task pcpu_offset before starting the CPU.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |  26 ++-
 arch/riscv/include/asm/percpu.h      | 287 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
