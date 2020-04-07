Return-Path: <SRS0=q7Eq=5X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E87BC2BA2B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 14:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82EA2076E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 14:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YOZ76zIp";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Rgrgkl7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82EA2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HUCjo9QZAUVS89qJ6P7brNM+fVg1xR17iXj6Oki2mTI=; b=YOZ76zIp6fEexd
	/TaFaZZlIlJagZEOacNrNM9VAgEJ7BNqm7OXiYLTjnO1Qe4ipdYbCnOSoJyOxDNi717+qWz0dycVD
	rrWhfejQf4WhBVVyd3My7eCtV2u78dEuTnccfm93yWaGjZgip9IGJKwOhr2hs8QmMa2XdBGFFg1Ku
	gEIKj7p/7BSE4IarCaRV/5IGB4UuDhwm3Vz35kNBDksJozKrwMgZe3o8AOOS9XoJ9DYSa4VDm3art
	TYUcbK4UQQ3kndxvdV8loBshRaA6vMh0ubtNPc3VjNt2TjkCY8dQWeYKrgNtlbvVU1q5NOcYAI4tz
	P6WvyHN33Z/AaCJLWjMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLpVH-00068h-K2; Tue, 07 Apr 2020 14:47:03 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLpVE-00067m-88
 for linux-riscv@lists.infradead.org; Tue, 07 Apr 2020 14:47:02 +0000
Received: by mail-pl1-x643.google.com with SMTP id a23so1344984plm.1
 for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2020 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUCjo9QZAUVS89qJ6P7brNM+fVg1xR17iXj6Oki2mTI=;
 b=Rgrgkl7+XZSy0uaZKgjq7G4b5KdnzXQYp6HNdVeqnaMt0SPjON6QS8lZgEQ3VNpXdN
 2fuuAR2XIKM70S4jIm2LgVnImFpZXwdtPCre3ZdsjQCHPemtGjD3WEBM4hprGIpcA4ab
 uuCtJy2jl9FC7VuKj4aSAlyCu4011jno3x9mt+BBa6M0PxkKfBDSgQn/+XwJJbJusaSH
 cvmybpw10vvkDh3lxpjZTepa3zugIDIhm4fUA1WVEg0JqLowLkCOPu4PqaN5ePORfjke
 WW2v0eF2/bulJybL9eD9RcLraeScTA2KKLlKdicuOSbduojjtBIn5Y7aYGfImxa0Qq1k
 Os+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUCjo9QZAUVS89qJ6P7brNM+fVg1xR17iXj6Oki2mTI=;
 b=VOndJwbgJptaidJNpnyd6DS7UHOug0t69T+N2pl0M1lyAiudHFrpB1ktvfm+YJUvap
 Tf4X27a4RCGI6SOJtBhnTEbizCJl2z4ODtLDTVqpm+xzeP4oWTPKq8E4SXSuYVT7VxWY
 Mhdq44jK+ZsCc4YdK9hF+6uVCAe+Bd9sFbRcoBQvNqYVPFOtDmCcmvOr63KAIpK+613B
 XVD/4zKgVHmu05oTog+uQX+m5fMGwCtVb4xrj3OtqrxKsiN4MPiWNTb5JG+gwGY2S0h+
 3E03Ij1u5osFCio0E4AiItC6a1PWcu1TLNo5da86maQIpOGfRe9Tp+b4JgtV9dTFUDBR
 fe0w==
X-Gm-Message-State: AGi0PubVv769h0xukHNUUsIQ4kuI6jiAsNJzDhyB4jd8GT6FU5SiusFC
 lB5OlO4TlBOttyJPnlZAhuSdCg==
X-Google-Smtp-Source: APiQypKu9CFmS/qJ++0L0X58ZipmpZ0VvjOdNEzfVfwpm6RLPRR1u0lRH2HMg/my/AEQfHGgAfYZhA==
X-Received: by 2002:a17:90b:3547:: with SMTP id
 lt7mr2992619pjb.96.1586270818816; 
 Tue, 07 Apr 2020 07:46:58 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y15sm14190093pfc.206.2020.04.07.07.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 07:46:58 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] Support strict kernel memory permissions for security
Date: Tue,  7 Apr 2020 22:46:45 +0800
Message-Id: <cover.1586265122.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_074700_807743_D87ACA92 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The main purpose of this patch series is changing the kernel mapping permission
, make sure that code is not writeable, data is not executable, and read-only
data is neither writable nor executable.

This patch series also supports the relevant implementations such as
ARCH_HAS_SET_MEMORY, ARCH_HAS_SET_DIRECT_MAP,
ARCH_SUPPORTS_DEBUG_PAGEALLOC and DEBUG_WX.

Changes in v4:
 - Use NOKPROBE_SYMBOL instead of __kprobe annotation
 - Use text_mutex instead of patch_lock
 - Remove 'riscv_' prefix of function name

Changes in v3:
 - Fix build error on nommu configuration. We already support nommu on
   RISC-V, so we should consider nommu case and test not only rv32/64,
   but also nommu.

Changes in v2:
 - Use _data to specify the start of data section with write permission.
 - Change ftrace patch text implementaion.
 - Separate DEBUG_WX patch to another patchset.

Zong Li (9):
  riscv: add macro to get instruction length
  riscv: introduce interfaces to patch kernel code
  riscv: patch code by fixmap mapping
  riscv: add ARCH_HAS_SET_MEMORY support
  riscv: add ARCH_HAS_SET_DIRECT_MAP support
  riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support
  riscv: move exception table immediately after RO_DATA
  riscv: add alignment for text, rodata and data sections
  riscv: add STRICT_KERNEL_RWX support

 arch/riscv/Kconfig                  |   6 +
 arch/riscv/include/asm/bug.h        |   8 ++
 arch/riscv/include/asm/fixmap.h     |   2 +
 arch/riscv/include/asm/patch.h      |  12 ++
 arch/riscv/include/asm/set_memory.h |  48 +++++++
 arch/riscv/kernel/Makefile          |   4 +-
 arch/riscv/kernel/ftrace.c          |  26 ++--
 arch/riscv/kernel/patch.c           | 120 ++++++++++++++++++
 arch/riscv/kernel/traps.c           |   3 +-
 arch/riscv/kernel/vmlinux.lds.S     |  11 +-
 arch/riscv/mm/Makefile              |   2 +-
 arch/riscv/mm/init.c                |  44 +++++++
 arch/riscv/mm/pageattr.c            | 187 ++++++++++++++++++++++++++++
 13 files changed, 458 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/asm/patch.h
 create mode 100644 arch/riscv/include/asm/set_memory.h
 create mode 100644 arch/riscv/kernel/patch.c
 create mode 100644 arch/riscv/mm/pageattr.c

-- 
2.26.0


