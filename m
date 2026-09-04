Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F25C79F89
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKvrApOf9jgXHh+kIKbB/lxHw8T6wciYNAI3UcyL4Jg=; b=z60vZcRYIdgn1K
	I1eQR/MFwDJup4/Gaf74eQTpwuZ+rgmbxbrzWri5x8MX14PY8vCOi0/OJfiKtKkghMG7YGOLALlBb
	pcE28wQbmTZEgIvDi9zsN21cDi9cUKpMxQTT1IP+YWSfyb8ADUrYFBRg6iWa1K1uzN3oJhfb5ujpJ
	Q2OKrFhYC4jjR+tUmN/X7uM04rjyiCvDlIRLS87Dy9TWrC2mKol8k831sIKREeMT/Yq75ty0Wxe8N
	D9hSgUbNsab/ReB4na//pBFaWMdyoPHZkr8pP7V3uB4zKm6kBSEl3ef5tVdPWLXr98Fe3sqBmBj8i
	hxmlHUfxbq15MsrEi/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwt-00000003DAn-3BQd;
	Fri, 04 Sep 2026 19:51:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwq-00000003D8L-14ww
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-855d2bfae95so3070608b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551500; x=1789156300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQVUWoA7x45iUD9G/BjlX2mTaB7Twjm1Fp1QyKVPw8I=;
        b=mchpmFS8r+tOp0C31rW9ULeo8uMYtrQfTZnRhdfLNdy04J58iLbpopYGE1+0ndfREc
         H/hQhLe9Vv1gGWo6S+xGsTCJrEEHbyDKPfKsdXdQk0T65m5qJbGm07ITWNeKYYcazqMU
         GpZcnyAOnTDV/ryzmEwjjNKlsLXy1wrbvVj0dKUd9BBNnJ+X7R7c5b23Ql62hoye7hsL
         SDUYsGGrE3A5oc9elZq3G7H3Zewf5T9I09+pxsmyfvenfy1FA/ZxjfrQFhCNpDHXmHF6
         /5tEgcKEDGxxSkDs+nfUDoiZsuPKg3AwIWBq7P7ZvzZpdIy27ZGKHqkmiQfaM/jm+vQm
         e5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551500; x=1789156300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQVUWoA7x45iUD9G/BjlX2mTaB7Twjm1Fp1QyKVPw8I=;
        b=izN1gEs2vzQmcBvlymq6dQ2117C1xYgGmL5WJQONzzNkJslC6p1ZgA7DiHUB8derH2
         M9qA6j77+6NUDf85ml3XpNwwNl8X5yH68k35NK/7zskPJ9ACb5vAyQl4fnuu7xQzpWMH
         A0JdvymZUZG3NFSi75OSwB1ek3zp5/4zuCBlFDryFT705kjp42wgyC6mhzlJH0EKwYYB
         Qg/9xZI57ZhZ2wacdOhfO3md0Cr6pZeeJYn13HhQ9bgV8KtA34cP/N7tj6CzwS4LfVr0
         AHYpDjU6H3fnx3tJuZeIGzgujAGROUmjXx+x0pLbCoxFxCXzYk43VKhEGbI+sKGF+T8O
         YYFw==
X-Forwarded-Encrypted: i=1; AKwUvByh1qGPv8ud/V/WF3JBgyW9Cr67gq47cPlEcUGU/QYMdr0wx2cSDZcjbT3edwecPbY5c03jNw4aev9aYA==@lists.infradead.org
X-Gm-Message-State: AFuF++lwvdhlDanR/qTmckxjAaKI+DB22br4PKmR0EtBXgtDq68Bti1k
	wRXfkyPWwu4BpgCktrgaGLR0t+HeU4eATIdA1SmCMh7pEO0698JziCNH
X-Gm-Gg: AYBFou3Tivnitd4htDbHROudz6iBVJ6p6/YlTK0U3IeOYSS9Vq+TEQKPKtr+41fGisv
	hsH1GCGIxEihTWc8Hb25m4YpFYQ967cBl9GdmvyEZQZfmn7+ZPKqxvgIp/FSz3BH/zN8q5qrj0Q
	pLaWcsz9+lquvKU1tA1FNueyITDe1dopTvRpKtTapRWNz8RvQIBGXhIABV/Cheycwo9Zhi12H+W
	yLxem5oazhREwMNKDE1YjLW0dABHK7eQbRtJLm5uGiB/bQwP8cFQMvGLIg5pVr5ed/eATwd3c6T
	UsbB3aLPTvqJqeYpXQ/Q1B3/CdR7FIo4/N0sPSjVUvYNajzfREPG0ufqlI7iXVZqc4Y1Pn1BaQW
	2Kq8LQ02zNQ9GyhhMMzlxrLbA1+iIXNSoL7zcNwuerdn3v6M1edO6wlH01z8OwepViNNbOYvMbx
	BddlK1FLznw6bAxZLxuhf+xXyvAnAFaSroROnzQCBZ/S7GY0PCPQsLFGtKuT2Q4Ueb/axxOfaVO
	A4JWatNnbQaWVTwow4jx5g4C8WalCIClySvOEHIcPvj14JmqxffDrYqhPa2kkQa+gnYlPEVio88
	hoR0DpG7dLarCr1uTUEyr4g/K9BNJS/3sXcrGQzlrQuxjw4NE1OTN7tDk76ulKjLndoOctO4UGc
	=
X-Received: by 2002:a05:6a00:159a:b0:84a:65e8:137e with SMTP id d2e1a72fcca58-85ffe1099ecmr11049338b3a.17.1788551499491;
        Fri, 04 Sep 2026 12:51:39 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:39 -0700 (PDT)
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
Subject: [PATCH bpf-next v1 4/7] bpf, powerpc64: Use resolved pointer for timed may_goto
Date: Fri,  4 Sep 2026 19:51:29 +0000
Message-ID: <20260904195132.141068-5-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125140_295611_E12AC2E7 
X-CRM114-Status: GOOD (  10.21  )
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

Fixes: b55b6b9ad76c ("powerpc64/bpf: Add powerpc64 JIT support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Assisted-by: Copilot:gpt-5.6-sol
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 arch/powerpc/net/bpf_timed_may_goto.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/net/bpf_timed_may_goto.S b/arch/powerpc/net/bpf_timed_may_goto.S
index 84ecf6fa7f5d..d88825dd34fe 100644
--- a/arch/powerpc/net/bpf_timed_may_goto.S
+++ b/arch/powerpc/net/bpf_timed_may_goto.S
@@ -8,7 +8,7 @@
  * arch_bpf_timed_may_goto() trampoline for powerpc64
  *
  * Custom BPF convention (verifier/JIT):
- *	- input:  stack offset in BPF_REG_AX (r12)
+ *	- input:  count and timestamp pointer in BPF_REG_AX (r12)
  *	- output: updated count in BPF_REG_AX (r12)
  *
  * Call bpf_check_timed_may_goto(ptr) with normal powerpc64 ABI:
@@ -32,10 +32,10 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	std     r8, 72(r1)
 
 	/*
-	 * r3 = BPF_REG_FP + BPF_REG_AX
-	 * BPF_REG_FP is r31; BPF_REG_AX is r12 (stack offset in bytes).
+	 * BPF_REG_AX (r12) contains the count and timestamp pointer; pass it as
+	 * the first argument in r3.
 	 */
-	add     r3, r31, r12
+	mr      r3, r12
 	bl      CFUNC(bpf_check_timed_may_goto)
 
 	/* Put return value back into AX */
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
