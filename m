Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC42C5B56D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNHhlAfPDCdizCTOOd5jTwjXYp80mMZEIsBxyupU5Xc=; b=vocR6do08Yv94e
	8kEe2oGfXaDq7bAC0/vQHEDcTQA8RyboD5Wjla8GcOv1ca7TzFtfWlf95lql7x1ZKRqFnluWkl732
	YfekrwFsGDsYTudBittJQjQdUIVj50p9PBvLr8VtGjKZyIl9KSEUJ1dlnk+AnoAHdN+MLMhrxHAhE
	JSXALHSAKrgpVDsyIV1O8BHsUxUEqn5I5u6VyzksF89pPUdqGDhkgj2WJjAdosvWrfqYnCI7VrSLy
	R8sTsFQdJtUJT9meyZabNpo+q6hUX5RzNyEbmmH1Z77ifxPWZwwMraIqVQDqC1mmQTKv7A/nxSylY
	57vu1AGYVnCwCfV3P/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkG-0000000CVpx-2fnR;
	Mon, 10 Aug 2026 17:25:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkE-0000000CVp2-3tto
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2041393b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382702; x=1786987502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEKcScQKYwpD2ZjF7rByElSaxHA/EpxXkim3g5WtdzE=;
        b=OUHqA4gMfA0bAUsyg68lbmXd+Zb+cnwJuqpDCChMrTaBZgZWokUr/IMrAf/RAtvE2A
         D0Xc+gnyAJpvntjXQovXL1rXXCR4kRH69y5n+LTLVO169SX+nMk4jVy8x5xZ4kzueB2/
         zS9yqwi6PBf77FWQyprDb8e3LUIjcWEHwi6vPNALYhMaQ6Yhjr1MmVEuDhW5bNddapI8
         EP0CqcHdz+Z7/InQT7bg3EuWbFxrIYCTSluIL7b9vsSF6FNiQ9Ax3ZyiQG1T96sGAaZ1
         2w8+qJMIfH049S8zC1/ubyybg4VN6B2Iv5EwHUCClvOCTXIQd/TkSxiMs2yOm2QNtHxt
         XSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382702; x=1786987502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEKcScQKYwpD2ZjF7rByElSaxHA/EpxXkim3g5WtdzE=;
        b=RJyh2W0imShR+53ihAyBokXsu8KL4Hk5AdH/7iTNNXpFnJ4VswcBDyDMQ0OSkth9hr
         xjwzw0YOHPH5LqHzmV/fpQr7jLifa+jm6Hq5pulqlUo9BkX9hcv4q0sN1Xox1DrNYXRi
         TTh1lyoIbFBEcEPFnMQ+m8foOWIQvlWRJNNhMmGKEXyQJwJuImm15tIMpgaKXyWrj/tC
         JKk1xHiI1/Nq//bEE42WuYA+BjiTVcYyZNkmd5g7C6xtGJJrr7pN3sIbL7njoblhsjWs
         CB5EfPerR4DU7su1eqxmKwZcKwoHJzHCr0FisIIjCsGvOWpxwR9qf035awxCH28TLOoz
         /qKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYRd8dZQzUKgePcAgEZepeAUXmg3vrrjuO9E3iIuABBaaaaFUOTJl/EF/bZ9q23IfhM9+gJnAzDd6PRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cYLqiwgdCOk33Ir2+8+sZhDwPAcXVUAskZTlQCkGqLvXf2Kr
	uZG3+t6rCogYhFKKB3GG4chZp1piZN89/xtCw/r7e7jbnauOGvkJ8Ty1yqMPHjg25mo=
X-Gm-Gg: AR+sD10SEyC6kGGNPh5j/PMrcWSw5ieEidvvmZmyFRR2Pd9b2WZ5/OIYfQjciy0hair
	Yaxn7ZGlNKzeCJLJDDwtQhT3vHMHAd92QTMzPJF9dn4pKahY/ZudqX5VsxLsds+WQiM4BC89Y5U
	8nnsAisuuFfi69lbTISPakCbdxdWNnBK0Djp9YIPkZi+JByRPoNgQWbfE7kYLPUYf5iSnaf63+t
	J41vr1g77Gud+s5LNZFniQCLbrFbDlPuvy1aJ7NtzaVt5fd6+Umnh/WRggFrjezzUGc6T6cgkSm
	Cem3bgPd6UJuYI5n4YAMA0JJJ9COTYxd9t1C05aoknTU8esFtNuRRFP8uPXgDT1/EMP876yfdKf
	ZMsDAh0r2FothUeh9qnbq1IQw7tRbGXHwoJ8zhDyqirCz2mXqExfuJa/Kq5EpZOuB0YT93NrYPt
	EsekV1XCqForfV5U9yS1fBckRmyiysY2urDw1ceS+P4JFIyIceK5YZNWaZ61GafGbtKUqylgdaz
	208JmKKT+bh/QjxpjZ3lR4BttqJZwHWW66Iz+CFd43OWGgghG6HqVBqsusYSYjkMw==
X-Received: by 2002:a05:6a00:658b:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84f2e0ed95bmr34474449b3a.37.1786382701947;
        Mon, 10 Aug 2026 10:25:01 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:01 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 1/7] riscv: do not read csr in vector context switch
Date: Mon, 10 Aug 2026 12:22:28 -0500
Message-ID: <20260810172255.1532787-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102502_973457_E48E757C 
X-CRM114-Status: GOOD (  13.05  )
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

CSR operation can be costly as it may introduces serialization. Instead
of reading from sstatus.vs to the detect voluntary context switch in
kernel-mode vector, we can read the context depth from riscv_v_flags, as
it is always non-zero on a trap-introduced context switch.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - new patch since v5
---
 arch/riscv/include/asm/vector.h        | 3 +--
 arch/riscv/kernel/kernel_mode_vector.c | 8 --------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77208..fccf9edb4e6a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -377,8 +377,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
-		if (riscv_v_is_on()) {
-			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+		if (!(current->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK)) {
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		}
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 77e98b504485..5ad93ddf6a10 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -182,14 +182,6 @@ static int riscv_v_start_kernel_context(void)
 	get_cpu_vector_context();
 	__riscv_flush_vector_context();
 	put_cpu_vector_context();
-	/*
-	 *  A voluntary context switch caused by put_cpu_vector_context() can
-	 *  raise the NEED_RESTORE flag if preempt_v starts too early due to a
-	 *  failed risv_v_is_on() check.
-	 *
-	 *  This causes the next context_nesting_end pollute the v-reg from
-	 *  the stale context memory in kernel-mode vector.
-	 */
 	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
