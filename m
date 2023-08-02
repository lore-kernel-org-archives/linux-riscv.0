Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55083C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ettnhZXTwVKs/JQHcj7/Lqle8D3Lw4yrnO6mBPBiQlY=; b=iTTifhMM3g86Bg
	1tmAhOVKEP+jU5fP2TIA/BQX95gffSzl0tpGX3hoslFgLGJ26nY1f27IwfAw934KPHW5ptcxBs5ZU
	7vwJwPMM4XVUzR+btt2pLLkmS+OT5OO99/AfJivncq7jJlGEDgYTW15kXYSX/jcIaopZ5wZz+jKbV
	rxvhLsovP5zaUArLVMf+XnWW1sz7YNxPlUKqSFLHL22EUvIsl8OSMd6J04cdCkEMSuBYChKJLwtlj
	cWILlUeMGw+IV23BNDq+MUeo80kNf2KxzxqHYOezUzoHOOvrdsAmLt2GdY09GrUH8sYatw+6mOBjn
	iH7alpzur9KpYsq3orfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6qx-004Jrt-2X;
	Wed, 02 Aug 2023 08:05:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6qu-004Jqs-3A
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:05:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so6611124f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963503; x=1691568303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=HVRel3iy2TysbHNmKF4T5Uc3LTv/kACnAUG0vRC18eZOb+FeI1/SOHRmzMrSR+0iuI
         zDSbXxGB8+I5Bj84nZnHIsY5j1f3zfytixIjpQZ0XXvZ42Zh1JGpuf+WZFKW60ASGN/y
         qd4szV5SrGTH/31OeXNSR0NV6dLD4tGXg69e96dpajfG1Ra/LqcsE91RhgxmeZagzl3T
         BH9jEmGUgv3fQLVzMGa56NgW/7UvTP4h6CZNJ8GZ8ti1rX0X/k246dJ9TBssCz5nml5Z
         HOnKC8VJQXNqZwOcT3RhKkvFmFqokaqSfTEn3fiDasyYFpiigObjmz5O1RwSHFAitIOd
         OOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963503; x=1691568303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=A4glWGCMaMmXv0yeH6sHoMiECb5aQAeYoU5KD7sf2Cl8kNbAGcwrDjINukJhCFMwsP
         9tun1MIE22Fup5i2IFlHDU1u5+Nk9C6rpAstXi7vsWOiiESobgvFB9nF5z55cSfiRCyl
         sNCM1GojHUmrtSlJgQhVV3+o/Ado/halo1tElzsI/AXhjroDeiZVgU1pFVJXZXWCt4od
         lOLdx4JaN8d6goPVzbNjeoMVfO2hFh/MMFxIgRFViSrWkGE9JFM+LGoS7iraulPLvQn2
         tC3NPxbgrJ/XQHLdTUXac2FBllNjZDHSwmDrKPOg8IAoV0vdhpKBs0LTmn/23y96bfTe
         7R3Q==
X-Gm-Message-State: ABy/qLbf06iLkUPjhLkwvJrtqfK8FaHo3rpnRvBGxKoovDng7kyKzC0t
	DtoFXgK4s1pjpJnpTr81L0gwCA==
X-Google-Smtp-Source: APBJJlFE+SO+E2RoYaNPf89zAKWdsBk3k3PC+ResQ8x4nsXktdgJw+DTaJ23RLYKJxMarQDGRsabsw==
X-Received: by 2002:adf:f4d0:0:b0:317:568d:d69f with SMTP id h16-20020adff4d0000000b00317568dd69fmr4264622wrp.12.1690963503254;
        Wed, 02 Aug 2023 01:05:03 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000050100b003141f96ed36sm18369977wrf.0.2023.08.02.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:05:02 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 01/10] perf: Fix wrong comment about default event_idx
Date: Wed,  2 Aug 2023 10:03:19 +0200
Message-Id: <20230802080328.1213905-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_010505_024637_D4D053B1 
X-CRM114-Status: GOOD (  12.72  )
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

Since commit c719f56092ad ("perf: Fix and clean up initialization of
pmu::event_idx"), event_idx default implementation has returned 0, not
idx + 1, so fix the comment that can be misleading.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2166a69e3bf2..1269c96bc3b6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -445,7 +445,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
