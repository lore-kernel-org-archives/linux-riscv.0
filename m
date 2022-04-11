Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B81C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmtMnKPtHBoInCSBRzcd4VuS7FDh+7tE2skRK/j9S28=; b=wsTniGLZk7fLxf
	DLIli9uleB9rWqVTZc+Kwept5qsm2ucb3Eot/fezSOa+l0Wh4ZwRG1VpZ8Tq8gEUyDgor8UauJK3P
	lB+VtVkExCAw9kAmibwa0GL04nHn8tKSTka4SihxgHR4955/V5VuvHCUI8XuMZCfaVvyXnsqqi7iU
	rkQxlxuXnHIdHkzhwpdoY3gvcC0woNaSNGI5JhzX6kz5RewgisEqwzNqbGkHRZWbLHiK44hxpUK75
	Eli9tlATk5KKeRxrcCqxM1OtBA7In5wTyq9xmfESaQtzBo2odTqAOn8Kyn2C6RIoRr5150qWQSgk8
	UdUqfDwrEmYplBJmX1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndri8-008XQ0-Gz; Mon, 11 Apr 2022 10:55:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndri4-008XO7-I1
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 10:55:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id j17so12801041pfi.9
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxc4olMcFemhUosxpLZMJRYJVIAs9QLO7H3uZTwv/Ug=;
 b=fggUObJo9DosRdizR6rxqIHDU+ijm4JyvHLzSkknOhcGpXc5MnKgFTISpxN14REZ5l
 3rqgkxaunu41WZ9TSKUuGCQfmKe3AArxukPB/zKzyKp/9sbljUy3bkwhw9R8lPtUIKOH
 7iYB7iiC+38TLGq5mFfcKo6QUymU5FacvYe0m2VUDZAoEoBLJ48k4z737tIdDSxky3yq
 2e6j4G9O+i+qgAD1+2t+RwhYp7tIlXoRDJ6ctxSkXeDIdbckE1Rl82cJzCSEcLwDL4IW
 nXMNkGBtYOroCd2HprdC8m3GiJZp7YPEZXLbojNUtX5o8yJXcd6s46NUByTFUwhCKWbZ
 f3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxc4olMcFemhUosxpLZMJRYJVIAs9QLO7H3uZTwv/Ug=;
 b=ztxLpOaKU5ytOc7HOV2Rxosg8bIm2tUkXWvF/iXg3kUSNl58oyvfMYJd9/mjtL05K/
 3Lbs+1t/AgHg2vLdXOrJmi8EUAgFsSDRUhy6bcYKGDkbxLRz9328bi62DPrEdDfpS53R
 H01GSHb0NDeTOoe0IkYHFV5eG01WqpwCtMFosVW+XboCt/0ii/BhAtgtMLIFhq+ZGO+b
 rhk0r2cv2a80OFxrW29e+1L9S9IgxCYjnsMpRnaQDPXsIrwUYfivHMq9JZP0YLLfOoKG
 4r90qJSuRf8e2sQCHY7BWPEWeo/XJwATe8J3doAdKon9s4GCHUjK5U8OfL5PMgfUijia
 StcA==
X-Gm-Message-State: AOAM532EDtmtil4XkDvDaFuQTZKm6/eto+21b8dL2w97z5LQ5zFsdOjH
 HsXOTs985IyVR0i/HDxydxvhKA==
X-Google-Smtp-Source: ABdhPJzCtBj8rSkS+qm9FKi7AHijI3tgutZHUHzS/kDYuq6jWXP1aJGRoPV+d7oQftSywD3LHuzP8A==
X-Received: by 2002:a05:6a00:174f:b0:4fd:aed5:b5e4 with SMTP id
 j15-20020a056a00174f00b004fdaed5b5e4mr32119192pfc.39.1649674550954; 
 Mon, 11 Apr 2022 03:55:50 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7809a000000b00505bf88a17bsm3496127pff.214.2022.04.11.03.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:55:50 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH v2 1/1] perf jitdump: Add riscv64 support.
Date: Mon, 11 Apr 2022 18:54:38 +0800
Message-Id: <20220411105438.21366-2-eric.lin@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411105438.21366-1-eric.lin@sifive.com>
References: <20220411105438.21366-1-eric.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_035552_624443_EE3BF0DD 
X-CRM114-Status: UNSURE (   8.94  )
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

This patch enable perf jitdump for riscv64 and it tested with V8 on qemu rv64.

Qemu rv64:
$ perf record -e cpu-clock -c 1000 -g -k mono ./d8_rv64 --perf-prof --no-write-protect-code-memory test.js
$ perf inject -j -i perf.data -o perf.data.jitted
$ perf report -i perf.data.jitted

Output:
 To display the perf.data header info, please use --header/--header-only options.

 Total Lost Samples: 0

 Samples: 87K of event 'cpu-clock'
 Event count (approx.): 87974000

 Children      Self  Command          Shared Object                Symbol

....
     0.28%     0.06%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal6WasmJs7InstallEPNS0_7IsolateEb
     0.28%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal10ParserBaseINS0_6ParserEE22ParseLogicalExpressionEv
     0.28%     0.03%  d8_rv64          jitted-112-76.so             [.] Builtin:
InterpreterEntryTrampoline
     0.12%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal19ContextDeserializer11DeserializeEPNS0_7IsolateENS0_6HandleINS0_13JSGlob
alProxyEEENS_33DeserializeInternalFieldsCallbackE
     0.12%     0.01%  d8_rv64          jitted-112-651.so            [.] Builtin:
CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit
....

Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 tools/perf/arch/riscv/Makefile | 1 +
 tools/perf/util/genelf.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index 1aa9dd772489..a8d25d005207 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -2,3 +2,4 @@ ifndef NO_DWARF
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
+PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 3db3293213a9..ae138afe6c56 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -38,6 +38,9 @@ int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_ent
 #elif defined(__s390x__)
 #define GEN_ELF_ARCH	EM_S390
 #define GEN_ELF_CLASS	ELFCLASS64
+#elif defined(__riscv) && __riscv_xlen == 64
+#define GEN_ELF_ARCH	EM_RISCV
+#define GEN_ELF_CLASS	ELFCLASS64
 #else
 #error "unsupported architecture"
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
