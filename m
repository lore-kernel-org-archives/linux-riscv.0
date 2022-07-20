Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEBFC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExPTRC2emc5hL8EhKbMId1zmMZxyqQa+9YE7W+4amOc=; b=xt/bXK7R6AuSsP
	DCCO1DcgTouEDQyOjgGkUPnfdYpVJFjvHhrFcfFr2cRYHGS7Zda6MegjJf8OrM1nXZ5ifuzu4HQlM
	cBW1K7NqMhJbOI2cfnl1YTTxaPkU1hhE7lA2zoH/SSgilqsTvEYUpYVBZf82yt4mj0JfLI9++Gork
	KGqxQzgSSWQY3WhaDDaDXH+FJ56IJtJsC6P4hWHzXefXr52LEHPnPcLwHssHslFiQhL59cAu7tlHx
	Tr0fFum/Zp/4omYR6R9WKxHRrmExAt+Stb119IwvyBV3OWbtCfdHyLVKYnzAsabS3u4J+jWKEfOfO
	qYmB8DNoVUVFMPHhacsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIh-009oRW-E4; Wed, 20 Jul 2022 19:24:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIb-009oE2-7P
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 19:23:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q16so14167813pgq.6
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=F5LLa+fti1ldqbN1oggUaGJdciAVFKbR5+6Ynx5vr02UiAXfBtaiR4TNUGh61mbiif
         5vLxqOMia10VhbKdBKIqxy5sEblKTJJa4VtjsiXYkFii4Q2uPdNcDVRb8KIeLlsHAxCa
         WZ4KsxXyIDoAk9i007nAyz7siGGxTWYsNVDVysgUKylfM7+DsiV8DJldr1DNH8gO4eez
         hHS3Su1nTW1d7iJMrIj02pzOyhUa1pMBjPAzaRxryW+O3nl9sOfCld2s35P+jvNRDkyL
         R0mhnBEUokGFEg/RTzciQ8x4Ob1he5KkVZPdBqu25kRxIW4gXnW8VV6BQ47vpAsuwvQ3
         H4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=LnNzN8D2vD0yq9v9zh0Hza0HKYuL8joiP2uxrRWsfb58zrdSZE36SEZBnY5EayHjqq
         GAvj9Wh7Kfj5W9ONTFCYXNUQn6oAXzY+M4GZ96t0dBisZu5GhzL55eBQj0BsVwzGQiiQ
         t0E0i1X7fH40RNRsyxZR3oLTavO3B1UCk67BFOlnaVm/e+/JTuS/fKoaxbKRAhEc7psl
         IDgn9iaoCKd/PWhdo+0V/1ao5XzhkICNlT3OH1d4fUqSJ65hik1ABbJw3MY/kXY4GNR6
         ibsrdMemOHUw4y19WEi9R/EX4yhGheIxyG/+Vb0goWKvMKRxJJ1H1br+iCp1Eszv0/mX
         APOg==
X-Gm-Message-State: AJIora8wFwBKAseh68I9kXwhsv9FOg/odAru6IE6w1pUIwYwxkNIOrOZ
	wb/T2fRg2nF4CO56BwuavqjduQ==
X-Google-Smtp-Source: AGRyM1srE6PB4hYPgFpjfbQll7ccCgxCL74nS8/5jSzOtV/Dpz4OwUpbO6UtkrHOiR37g9OoKefmtg==
X-Received: by 2002:a63:f91b:0:b0:40d:d291:1555 with SMTP id h27-20020a63f91b000000b0040dd2911555mr35543371pgi.399.1658345034349;
        Wed, 20 Jul 2022 12:23:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b0016d2e772550sm219902pli.175.2022.07.20.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:23:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Liu Shaohua <liush@allwinnertech.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v5 2/4] RISC-V: Enable sstc extension parsing from DT
Date: Wed, 20 Jul 2022 12:23:40 -0700
Message-Id: <20220720192342.3428144-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720192342.3428144-1-atishp@rivosinc.com>
References: <20220720192342.3428144-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_122357_308672_098AF38D 
X-CRM114-Status: GOOD (  10.48  )
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

The ISA extension framework now allows parsing any multi-letter
ISA extension.

Enable that for sstc extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4e2486881840..b186fff75198 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@ extern unsigned long elf_hwcap;
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fba9e9f46a8c..0016d9337fe0 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -89,6 +89,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 12b05ce164bb..034bdbd189d0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
