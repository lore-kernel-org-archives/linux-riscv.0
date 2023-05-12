Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD25C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyDIdUuH2/CKSu5FDTaLpc2C3JBC2zvegWTkO0HvWL0=; b=ZRVDQDy9XrOwXK
	Olq/ny5w6izcr1DB9GC1jG+X4YVeE316W/Ar11ZZ6/PAUu5O5SVdSIvZztcSBcTBn4PtbwqlZwBO1
	nNOBq1Cgtj9C/ix2uQl+TyLcGl/lw+K3yhAVoDnODh/3PYkXbdykRw0/ZM7I66+yOdp+h8uRdFNIr
	UU4vjVA+al5zrDO5ycTlu/TlmRuDajnpOjBIJbAvSFXTn2gjO+2I+1OPdBqJtaGWy20N7jQ6ysWU2
	RNZDkcDThFkdZOaHRv22h6E3FZ6o4Uwq8FnBn1m4BXpBWFGEFg9bWZFLVPCIIbZlEcSECLsbuytpL
	V7BpmFpLldGqqI6o96lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPov-00BZh9-0N;
	Fri, 12 May 2023 10:16:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOf6-00BPJe-1V
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:02:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so37083455e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882123; x=1686474123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnd8gr51X8/5uF+3rCtJjAEchITyuqH0kTrDbBmZ9i8=;
        b=BP88QC1bhM6e6lKhDv4DvB5IhPrAhRpa7/EMuvDfBK9ilVoXmFBPXJUv7eBZFXmzeA
         pnY3MuFsQG/Vi8of/R7SxCeVy84BBl6Kp1magUzy5obpB8MTplmqFtJ+UgoUCcKHR6m9
         UwYczpC1Cx+cXBzZGpkRFIRi/arSoVntIWcSkPr8Uz7fI8PTIaU1AmU3/fMWlJvtE84G
         vEGkUYx4uqolizKdU/vvmYS0xRNcR9bjpIc8poxfmhpbguk7A2Gc9CwCubqWiDgmeF5g
         3turrONwbQmgL4fwYhBq0v/Kxt48W0IjtCm8J04PJG0yCm4qXFEa4nSI1/4IOKe8BxDM
         dsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882123; x=1686474123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnd8gr51X8/5uF+3rCtJjAEchITyuqH0kTrDbBmZ9i8=;
        b=EnbwJiHSyu9/TmgO6kt4XqjA65agc2rMhS0GkDyyOi3vCAHW5KonLPR804ZMlkuRes
         uxGgwdCOv3nc0wQU51zoPxOL4bGJVpxWIEhjTS3Kqmow1J2bqSEAg9qiFlNZoaVBM4SD
         Fvh0Xm1evZOa0Jh1a7oPhulTiyCAhOgFApvoCMzi5HIMTw2PWruVV4LsyBkvbqwofIft
         YLgDMkxEkVNWppHTNMRxH6cg1tHdHn3k9Xjo7yEgpzoaQ+e513eqGLtLP5KX8wvFI+sh
         +E9V5xCUYObe4KavmWZNEQutuHH58skgb73b9Za7WUdTHjdBVcCXXTDH9u6EIdrBUd8K
         LLmw==
X-Gm-Message-State: AC+VfDxlcswfLQT5wCb2Hwrl4kkrVHFOlEjiJ+SMaKL4Tw6+2S5xlIOH
	xz/JeqX00y0bxw3I+kgqlc23Yw==
X-Google-Smtp-Source: ACHHUZ6wQtyhfMD1SVoC7OKEuRXw0kePRb8pgqENummmVDOdZUd/NuSrYUFy+ElWGRaklL1BYOPKaw==
X-Received: by 2002:a05:600c:228e:b0:3f4:2174:b28a with SMTP id 14-20020a05600c228e00b003f42174b28amr15724552wmf.15.1683882122838;
        Fri, 12 May 2023 02:02:02 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f26-20020a7bcd1a000000b003f423f5b659sm15364363wmj.10.2023.05.12.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 02:02:02 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date: Fri, 12 May 2023 10:53:19 +0200
Message-Id: <20230512085321.13259-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_020204_530563_5373A71D 
X-CRM114-Status: GOOD (  11.71  )
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

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 24 +++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 4b7bfea28cd7..93cd518ca94b 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,32 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
+When set to 1, user space can read performance monitor counter registers
+directly.
 
 See Documentation/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user access is disabled.
+
+When set to 1, user space can read performance monitor counter registers
+directly only through perf, any direct access without perf intervention will
+trigger an illegal instruction.
+
+The default value is 2, which enables legacy mode (user space has direct
+access to cycle, time and insret CSRs only). Note that this legacy value
+is deprecated and will be removed once all userspace applications are fixed.
 
 pid_max
 =======
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
