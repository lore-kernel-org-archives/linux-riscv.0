Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A887C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58836208C9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwFjsdxZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GkihBHMi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58836208C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yK5doHj4uotTMfVnstPCKm8N1BQK2rTlOniaesAIFu4=; b=kwFjsdxZVmWIGFJ3CA0ObOIgyV
	oPhlSYzmAEBt6hPMwETmWD5c8Trcp/Jj3lXMuGea+OFifLF8on23KeoTXv7bY2dw2ML6b5Q/Gdk6A
	clOMeRgm+gWzbVa6qPus2OTJwFpmibJ+/WoYWKrqXWiRE95g3Re6/nkfUoo0/35YczNo9J1sBdzms
	L+Cd2V3EuQOBl4sle2cnYyKRCLFkaPqPqI7r9R9h0j6qdr4hC/cKzC4nsokALEzxiFWi5UazezBTy
	o2ki1wMrf+WamUDG6r0UKmixRyKBW3sRZ9t2p8cXFfLMxNAFgspx9DpHXUMws3h6ARe375N0vLa8z
	8Y6fY7DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBYVh-0004as-Bw; Fri, 28 Aug 2020 07:09:17 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBYVd-0004ZH-P0
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 07:09:15 +0000
Received: by mail-pl1-x644.google.com with SMTP id j11so48114plk.9
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 00:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=00tHBY+tCae86zJA9u8natH/+4zIXXYCZ45d5NLgLfg=;
 b=GkihBHMiec5eMP8OBax8z+XGlIotQbtSLdAk9+CKKrSigh++uPLy3NE9fIHGHajhKs
 hepKEyC3Fdjd+VsvrGyFoSGKa8gNH4CPiTt7s9mgbEtuLz9UWo3CuHdcxNFiiksdzGQz
 MIVSm7hpK0Upa1rStmgqygQkNzx6CQay1LhTHHz1l2vMYdM06/OyRIKMZG1nlxop1yLt
 3oIEKzgv9Ha/3/AdGRdr2IEUTYUNkvmDJwOe48gTld/aPyaBcJHwNKUK5XdOxarYXqaf
 AUerArzoGkJTP9A2AVjhYhZDudLr5EEiiWTrEUsC5GWCEN/wAVVY1Skodx/YMh2hY5fQ
 56LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=00tHBY+tCae86zJA9u8natH/+4zIXXYCZ45d5NLgLfg=;
 b=rZINxWTqk8XLzwt8/x09o9tsTsGzFKswu1HXYq9WmD+hOPff18XAclGvPP9rDojJSS
 ahaN+HKrb2qwKwtOrcHvSDXkmvgM1rawpbuvQMAc4p6aaIQ2KIxAc3Qp8A8T5EHhbFF6
 ncM/+C88gKB8oDw2TPD/20MAwwEzP8SKrzxUbhSe6qu7omxlFvUMBFYJz/g+jZ4B5hK6
 YOqBUljGP0QgZrKkg8eL5uZjre/v4wGldjHY/vK+n4a1c8A0wPT6OuzTT63bJj98JXYj
 WrlH50U1E/DE20BAPzV/J9ZlUtV1PggeJXlChA4sgl6gSKkJVqPEdE83QERe7lu8/PVf
 +EaA==
X-Gm-Message-State: AOAM530ARf0umiziymPv8KB4CvWidHwmgALqfJOEYtbUv9OYh/iBrxvA
 cMLETAM2FvHoTRbm4p6xkVQipA==
X-Google-Smtp-Source: ABdhPJyZ4o7THBO7qI2ndy4SmPKgzdv1mWtlbc51RdLvmXIbDlBctm5ebi+0sr6GtXbn15DXvmPqJw==
X-Received: by 2002:a17:902:7e4b:: with SMTP id
 a11mr228346pln.325.1598598551032; 
 Fri, 28 Aug 2020 00:09:11 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b8sm434158pfp.48.2020.08.28.00.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 00:09:10 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Get cache information from userland
Date: Fri, 28 Aug 2020 15:09:04 +0800
Message-Id: <cover.1598598459.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_030913_995784_8466C7A1 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are no standard CSR registers to provide cache information, the
way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
could use them to get information of cache through AUX vector. We
exploit 'struct cacheinfo' to obtain the information of cache, then we
don't need additional variable or data structure to record it.

We also need some works in glibc, but we have to support the function in
kernel first by rule of glibc, then post the patch to glibc site.

The result of 'getconf -a' as follows:

LEVEL1_ICACHE_SIZE                 32768
LEVEL1_ICACHE_ASSOC                8
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 32768
LEVEL1_DCACHE_ASSOC                8
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  2097152
LEVEL2_CACHE_ASSOC                 32
LEVEL2_CACHE_LINESIZE              64

Changed in v3:
  - Fix sparse warning: Use NULL instead of integer 0

Changed in v2:
  - Add error checking for parsing cache properties.

Zong Li (3):
  riscv: Set more data to cacheinfo
  riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
  riscv: Add cache information in AUX vector

 arch/riscv/include/asm/cacheinfo.h   |  5 ++
 arch/riscv/include/asm/elf.h         | 13 ++++
 arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
 arch/riscv/kernel/cacheinfo.c        | 91 +++++++++++++++++++++++-----
 4 files changed, 117 insertions(+), 16 deletions(-)

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
