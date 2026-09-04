Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B233C79F82
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHIC/a5CERPxILlRzugjrWORA4l8NW9jKPXTtUXUbEU=; b=1++LFEPCwRPn8n
	RW1/zA/w4CUH/b56sBYWTRWSOSeaa42ZcPypXFCQIr0QYLR5kPbu98EAMk0KipRLaBQahoY2OAx3W
	eDVPUmHNEb6oPOzsR8WD/hcn/C7y5UNyG42/gA1+Xe9JXvkv6qwVTifT2zST0TmJypay1EYdi3flw
	z2trCAoxQYfPeJGokXPflxyZHmm3tQqMWh3J49aQBEVC5Gcdj5yUB/9aG1TpMXlqoI1lI+TgvGRlG
	GBcesket7yxd7Jdw3E4PEgq/AEXOI32XQ3nOwaanEwCLgYKdwC37kvjuJ8jUoEsx3BL/WHqLajnfI
	VsKvAxHVgXPX+oP0aL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwt-00000003DA9-0aHY;
	Fri, 04 Sep 2026 19:51:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwp-00000003D7q-2ZvW
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so954937b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551498; x=1789156298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvrsiIV2Lldx5aqamYQifBQ5Wmg+CQWdeLatZB+qlSs=;
        b=oDydA3HoDsJyHNAMevOT8vb/vx09W3CanfEdcmeIoFQxcBjbz9QrCN3NYwiK9hXb7n
         QW+HZWLmUcvq8Mxf+DnhzuVzQGNKPWgXI1dqzzH5yy2O9fbv5FlcRx4q49lSv1PQuAYp
         YxyvEXGUp2GFLcJjkUy7afmf5knrZgqkBRWpd6lUyBjg//BNVQuj07FP3wrjizwmOCMo
         ELKEFNkPFFOqhk/dbY/fcukWd8tyamsW2SW6BEIz6qTwWzEoBS3pAgF8seqxaGqpJgZq
         0ezU4TkCcOdHyTYXLdKqZ8qBby98IjwzagYVj6gYPfHQQV9Y8cZPLowlFfmU0RMULVbp
         BKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551498; x=1789156298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvrsiIV2Lldx5aqamYQifBQ5Wmg+CQWdeLatZB+qlSs=;
        b=N3P6bqj+sAOp1Jy9THLQXxNnHs4ISTdyO00gOy/j6FTpEpOheIwrajIxcqq2iREu4U
         xdeLCfm32JcE+zceNlpjoIx4PymfLwPR97D2MIGfjx1dtY2X9B9k230/h9TzN+gLWwQN
         7c3POpP2n34jHCD5aWR5GicnsRWhS23FTQozNC3Kw7lem5AdE7ff3RmTyfx2R6v8ViI2
         34ACUjZAs3xgtPUY+9f1ajEjdl52yOQxz/8xho6VRBzh9UREkPF/zlYIXNSOG/uMlnxK
         bTktMtrc6wCeKv2gtsijNBEM+2azS6T/7LUe7Z4piKCyctmcnbw3F523u8a/rWmQKNyN
         SiVg==
X-Forwarded-Encrypted: i=1; AKwUvBxVZgEGPu1mLMpZHpCJncjW75qlNs0+16iRcdQ5fNBb6uANA0RxabdYzeNFsqnc86ZHbx+1HHfiBG+WHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lusUWmCNZtBgdcUvjk1GbFNxtll7c2Iq9LAvYvUXwpJLmpQ1Js
	GFwSskZEpljkF9Wfpa57xVLOmxSbOwyh6bxO77AnI82O0N/052dLkLsm
X-Gm-Gg: AYBFou063CeKpBa+O6sIvrMFV+/wk/BPNxVsbw+f1bavSi91eJ55ExigjiC97vKNtEr
	cyjlS60pa8netdLB6Hrbr3CpynqGDD4gqtJrFRVT3IH+b79Ig8rbI6V/ZlM7w5/HtHt6+D8DBek
	a+wcKBmgWHh7reIJGPxmAL0jL5/z7TXFEIUtxJ81HyFNe8Wp//rEP7lOiZAe8S9DLgFMY6FsM5f
	SfqZqtV3lSR45t59/Qaw2V5s8A/mINNmSOdboFo0NlN6GdZcvQQtP/uq1VL8YdwSJ61YRpT6ruZ
	itbO6u8g26OADBUGMmrg5GWhCvB3aePIiMNaSiKI0H1toBTWmwn3NrBYgskheVsfqAAsOBqSaBD
	wKzZlUE+EYl1Wqu/5DOqvJjq9lkCWqNwOmy894f/2Uek98WRoebSqpiojaTC4tJnWAotX1ijf2r
	BepVS1Z8BSDtQSNARTLGSOYH+DyZgOdQeLuSzTRhsPTN1M8eE02wzi8lpzve1CfuiWhntQUHuPX
	fvDuiFSCvCWaU4hTcjYxOUJ+x68ahs/TGbwilSQUYI2bdrvaQV/mPC8Yi0gwairwNA8k6+Nje7E
	Mpfv9PNYuCqXa1KWrshQx2TcLYngP7PAvvi3J47idaAuV/kkNH0WnqYBaXp6CtlZepJbAzxJt9I
	=
X-Received: by 2002:a05:6a00:1151:b0:85d:84a5:b7bb with SMTP id d2e1a72fcca58-86168d8c2fdmr11042192b3a.18.1788551498348;
        Fri, 04 Sep 2026 12:51:38 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:37 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	apais@microsoft.com
Subject: [PATCH bpf-next v1 3/7] bpf, arm64: Use resolved pointer for timed may_goto
Date: Fri,  4 Sep 2026 19:51:28 +0000
Message-ID: <20260904195132.141068-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125139_651832_713BAB11 
X-CRM114-Status: GOOD (  12.43  )
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

The timed may_goto fixup now passes the resolved counter pointer through
BPF_REG_AX instead of a stack offset.

Copy the pointer directly into the first argument register rather than
adding it to the BPF frame pointer again.

Fixes: 16175375da36 ("bpf, arm64: Add JIT support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Assisted-by: Copilot:gpt-5.6-sol
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 arch/arm64/net/bpf_timed_may_goto.S | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/net/bpf_timed_may_goto.S b/arch/arm64/net/bpf_timed_may_goto.S
index a9a802711a7f..53148c9a1c58 100644
--- a/arch/arm64/net/bpf_timed_may_goto.S
+++ b/arch/arm64/net/bpf_timed_may_goto.S
@@ -14,16 +14,10 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	stp	x3, x4, [sp, #48]
 
 	/*
-	 * Stack depth was passed in BPF_REG_AX (x9), add it to the BPF_FP
-	 * (x25) to get the pointer to count and timestamp and pass it as the
-	 * first argument in x0.
-	 *
-	 * Before generating the call to arch_bpf_timed_may_goto, the verifier
-	 * generates a load instruction using FP, i.e. REG_AX = *(u64 *)(FP -
-	 * stack_off_cnt), so BPF_REG_FP (x25) is always set up by the arm64
-	 * jit in this case.
+	 * BPF_REG_AX (x9) contains the count and timestamp pointer; pass it as
+	 * the first argument in x0.
 	 */
-	add	x0, x9, x25
+	mov	x0, x9
 	bl	bpf_check_timed_may_goto
 	/* BPF_REG_AX(x9) will be stored into count, so move return value to it. */
 	mov	x9, x0
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
