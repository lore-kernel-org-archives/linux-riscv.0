Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83DEC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vc7EKuVMzkcrsL1jAWRQyDOPDIkcdoZFw9ch8FiY3Nk=; b=Sa7mMUB1nIYHsA
	7fLWPrvXbZlfaarCz94nNkqB4HG4tU011xqZDIHXPmy5cnXZ4A5+grEPclRXUHwFqaqXt5+hptdV2
	rxqvw+MoxNCU16KnfSPr+fabGYS/jon5WYNmic4FHWmL5fDjqbZVWnXI9YAh52mtCFAXBt2ryh1oJ
	mYo7/2XYtpwktsHZkEZiUqGlfWV9t46sm7DdwMFzb40uompWml2/J41v0FIhy/9G/v0w9OYd+fnCk
	zuJ74pZSzZC7GCr4AdNEBlpzPfOt29imNcPMbEzmU6koXAvBOY1oMmXOl1WCXjR+DTHCt6VH5ETir
	iSfHKDMBmG2qVRbi3C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f0i-002nkR-1D;
	Thu, 01 Jun 2023 09:54:24 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f0f-002nip-12
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 09:54:22 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba827a34ba8so650564276.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685613257; x=1688205257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zaH3llwLH0tAOqLtLRXczT3GUAsS7Y/IWF3335BIolY=;
        b=hjXp5ZbI1tlJjDcPbCXmNufvqRSSz3s4oTdiksj4GKMDFAgA7NKlJNKqPq194EcYFX
         agZT+MCKNKTvwbDDwgys8q4pNgJYLaP2eDUbQI88Z+CVwNKP4TDaXJXoBGW12S4Ves/b
         8vQuXF6i8vcvWMuu/FwL9oVdtr8Kser1Q+PoN7o9Ww3DJZIpXh0OEHwbWM03uxW3T/Ne
         1aomh4hVxP7CLPShRYeWyyzWZyP82SY6We9BVv6KE0NdgF5qfQad4wZpddgFXMsu8TcB
         c0MOhAsYNk7ot4/OGY5EsRvtKUMtTdaUeV0r7LBot3cxhXCePo2qDw2j3lrYjh0cpS7r
         4Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613257; x=1688205257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaH3llwLH0tAOqLtLRXczT3GUAsS7Y/IWF3335BIolY=;
        b=CedvzaSJorU7xAX+CRY7kp/xXH1S7mEfrQLTSpS0npxV9vhcFkdfQ9e/o38Rkd+p77
         OO9RoYAnhHX+eHftYlVROSkSsxWMXBInnPMJJdBU8jyD23ieULandLjVQ3T8g4yHYY21
         GBoysNlcu15nASGFCfpop29kXomjI1p/QwpZvLmNk2+vKM16chaGIhuQkb4Lr12s//Ce
         TytRxVXh0hWuFs8RwiyppB7DX7gOSQ3HCgEcMQGjsYjyprIx/y2hr65uYt5yiHK6qJfe
         J5MKrVj0BuPXJcw7q/qD2GWXR+b7FQO6T1Sg6D6AN/yowUtLZwV5dlGOyOHy/JmoNGqg
         VyAQ==
X-Gm-Message-State: AC+VfDx6xaIWBEi8w33z5z/W8yl9k30lwN63KA+QrwUugJQZG9CtZHis
	2RrAPiLKSmHSsVowLAhBzQ8=
X-Google-Smtp-Source: ACHHUZ550rvMwrfRHsgbKHeknHaOLsAcymRaAlrrMsiLxm58P0Ro0s262Yno9vUoRwSdC02V4Zp48A==
X-Received: by 2002:a25:db83:0:b0:b9e:6d83:7bcf with SMTP id g125-20020a25db83000000b00b9e6d837bcfmr8351546ybf.27.1685613257117;
        Thu, 01 Jun 2023 02:54:17 -0700 (PDT)
Received: from ism-manjaro.realtek.com.tw (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090276ca00b0019a5aa7eab0sm3030356plt.54.2023.06.01.02.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:54:16 -0700 (PDT)
From: Ism Hong <ism.hong@gmail.com>
To: ism.hong@realtek.com,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Ism Hong <ism.hong@gmail.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: perf: Fix callchain parse error with kernel tracepoint events
Date: Thu,  1 Jun 2023 17:53:55 +0800
Message-Id: <20230601095355.1168910-1-ism.hong@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_025421_357288_4123FA31 
X-CRM114-Status: GOOD (  10.92  )
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

For RISC-V, when tracing with tracepoint events, the IP and status are
set to 0, preventing the perf code parsing the callchain and resolving
the symbols correctly.

 ./ply 'tracepoint:kmem/kmem_cache_alloc { @[stack]=count(); }'
 @:
 { <STACKID4294967282> }: 1

The fix is to implement perf_arch_fetch_caller_regs for riscv, which
fills several necessary registers used for callchain unwinding,
including epc, sp, s0 and status. It's similar to commit b3eac0265bf6
("arm: perf: Fix callchain parse error with kernel tracepoint events")
and commit 5b09a094f2fb ("arm64: perf: Fix callchain parse error with
kernel tracepoint events").

With this patch, callchain can be parsed correctly as:

 ./ply 'tracepoint:kmem/kmem_cache_alloc { @[stack]=count(); }'
 @:
 {
         __traceiter_kmem_cache_alloc+68
         __traceiter_kmem_cache_alloc+68
         kmem_cache_alloc+354
         __sigqueue_alloc+94
         __send_signal_locked+646
         send_signal_locked+154
         do_send_sig_info+84
         __kill_pgrp_info+130
         kill_pgrp+60
         isig+150
         n_tty_receive_signal_char+36
         n_tty_receive_buf_standard+2214
         n_tty_receive_buf_common+280
         n_tty_receive_buf2+26
         tty_ldisc_receive_buf+34
         tty_port_default_receive_buf+62
         flush_to_ldisc+158
         process_one_work+458
         worker_thread+138
         kthread+178
         riscv_cpufeature_patch_func+832
  }: 1

This patch works both on RV32/RV64.

Signed-off-by: Ism Hong <ism.hong@gmail.com>
---
 arch/riscv/include/asm/perf_event.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index d42c901f9a97..665bbc9b2f84 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -10,4 +10,11 @@
 
 #include <linux/perf_event.h>
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
+
+#define perf_arch_fetch_caller_regs(regs, __ip) { \
+	(regs)->epc = (__ip); \
+	(regs)->s0 = (unsigned long) __builtin_frame_address(0); \
+	(regs)->sp = current_stack_pointer; \
+	(regs)->status = SR_PP; \
+}
 #endif /* _ASM_RISCV_PERF_EVENT_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
