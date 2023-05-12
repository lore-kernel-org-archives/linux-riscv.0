Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F6C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVQcXGqew+ibHoRsVkm4CK1nvJ9Ir4O/c0xwvIRT8GI=; b=lkdZJQgXIrNaaa
	HshYt4OjdKWWMtSqYX1b8Ped3UaivTinRgNoMqV5C6rqZ5bUT6I2WOWGjBOBnOOCL89TZkYVeKPh6
	jDTLHC2izk1xw4BfYpiuc8zEMU/nzon3ecNCvTBnSN6ZPwApU2cxMnp6bU42wVP+EvXGwzPJz9n2O
	XhT6E/M/khuc30tBvHodZnT9KukRJAmuIaA3z5GFt1ByMYF4F6u0+Yh81eSyPSn/QdBQgfuIAVJ6M
	lRdvuiWFt0PubWiK2U4jnFzKVIN/haFDhaQpgEZ/c7wKNr2tpHY79dml/7Phj3qdcB1T/1acQAmF/
	lYyTFk5R3xBn9f3w8Ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOhA-00BPgA-2j;
	Fri, 12 May 2023 09:04:12 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOh7-00BPdr-2E
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:04:10 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3063891d61aso9231794f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882246; x=1686474246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOQ/DlOGIctkGIcCTQtutRYPiw4IXxyRImNc8aVkxjk=;
        b=pcba1+uq/tkvdmjmQc1k0s5XhFgG4/E/TIRDBO/sNR/P0n+Jypo9JpGOVUOZ1sYhpc
         K6DC7rio/DIg3AQJXqk/986STBuCuxctiX4PNpQOLvkIacGSrVTXHP3EEyncOM8Vt44t
         ckOE/rnvkxumONDZCzR0JJpYANPA5nwuzFgcztVSCrQ26H7Ca3f6VdvMoH2WocjmPD+2
         JQSpRPF8k0RlLkD1F0jdx6eT6thzDHFZbt4Xj/2DhUCpu+NZvQZwug+he17lHM5b1Ui2
         zTP800qCwgEHjUNKHvYLUwVRHmntT1rwrUwoiQVQG8fL3/moRB8byaY8dRKm2w9oE0gz
         bfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882246; x=1686474246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOQ/DlOGIctkGIcCTQtutRYPiw4IXxyRImNc8aVkxjk=;
        b=QTUwRDfAGICbPAqpQijSLKRoFzJnja8gzDKvON9HX8BEsOLRtrTG1e/RSDwMsreOrY
         mL7fXeVl3WMs/JQftg99us746gdvEDJ83e++sUn35Q7fzH+0YhOnkQYrqu9iqfluav0z
         ASeLwFvh4B16uSk3nJ6inysFSa1hAdsnnhfFSRbFuoUR5vCu8ZCCwUcI3IF9a+lsPFgo
         d9f7FVkfv/CgEFHY9r8uSvOGV47klE0UbTvDIeohUMAegqXFWtKBbK2n9DzI0QdTlKMk
         cG7RJ8jTVXKia1Js7LylBsdcSSpCZVUbgJXuORT8SHx7w20BK6Kt2gugxT+DeRK6jXMa
         coTQ==
X-Gm-Message-State: AC+VfDzjqSn2+P2PFsLWvUFl+4hAYAydO26ZMme5SHkxvr8tzsPleOL3
	FZAMhbqxL8pTDe/waeZTagnKmw==
X-Google-Smtp-Source: ACHHUZ5goOCUzTjChWxdDq9l5hFZBiYUR1vs3XG/CA63CCoohpET/2lu8oGivMch6urud3hl8eKx7g==
X-Received: by 2002:a5d:4b02:0:b0:307:a33d:d093 with SMTP id v2-20020a5d4b02000000b00307a33dd093mr8200432wrq.16.1683882245915;
        Fri, 12 May 2023 02:04:05 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003f17eaae2c9sm28149299wmb.1.2023.05.12.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 02:04:05 -0700 (PDT)
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
Subject: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date: Fri, 12 May 2023 10:53:21 +0200
Message-Id: <20230512085321.13259-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_020409_728286_DBAD37CE 
X-CRM114-Status: GOOD (  11.37  )
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

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
