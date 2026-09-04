Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B783EC624D3
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlszZlMwOCkQpDUvWPmuDGXoo4k02WAwA1Yuc+b02YI=; b=haurBR+2T+gWUi
	Kt/pESq77ouxylOZXKZy8rCP9zZy9gv3rCJ8KmvdLrYuhsjqh3Qd+OtU7idALagEk+hool44c/WSo
	xVVpPCWOmfm7QxtghPtFfMETorWwS39oA1/BK/mDPG8XsXVKmi6T3fdRPsF3ka4aAhSiM5Q2ABTb4
	CI0oT7ZeIOj7K61ipGKQtOX6T/jMGWeMAE2Sz8WuXIffkyun67Gw5NJxsjg5IWy4/x9pQa8NaPzOB
	tKUzHy6w/VtaMPFFfYKmJMi44S4eJrM69+5apYsONGYxOMg2haCAG5VjMo5Q2JV4B7QWt5GUKcKIG
	bfsl09/5ggXJwfAFwVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwv-00000003DCe-45ZY;
	Fri, 04 Sep 2026 19:51:45 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zws-00000003D9Q-2Vk1
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1201485b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551502; x=1789156302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVBsoFTvre1N55biXZd8wIwrI+sXnvIOODIR/1bsh18=;
        b=HC7IbKgnRzKnLquLIHwFBFOxLQ4Y7J7YVcyxkjydFyG0QJyMHbqlO71Oefq9PH2rf9
         hErKvOVuX/Pd7lFxdVGjP5GmS8PnAIolTeOBeGLNl7+De0QQkqEztzjQkZmBE+VR0G4m
         jYhoschB6z4lytkO5UV3FboHBvUdkoKp+xTRIsQrsS9hrzVeRn2aroTxZ1Te9huiUQxa
         +DT2Nvjx6n3QfWxuxGpMscHAW1KsoCZva/hJel4rdq4BceiseGi9+mG+ADhvIyFimvFk
         GLWMsoYaJ9X/Pep+Uqr+edRUESAQ5UGxcFjRr/ijp86JXOUMVmXSKYHthQo7M5uopLul
         SpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551502; x=1789156302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVBsoFTvre1N55biXZd8wIwrI+sXnvIOODIR/1bsh18=;
        b=Kq3zlzB5p21LJFFthOCLKmEr/eHvA0d1Fv0IaAFf74mi8pyJMwGOWUm2xld1hkDuXY
         H14ODlm+H4bNnMoLxd+L/g7Kwni4+NCtD1BPzHGGWB7dNy4nmxZmzuBX20SOQ5HZ7Sp3
         C20pBa2sUTD2Ica3t0R/0zijM4WsAlEcDvYIy7ro+n+zuJtKyjk5P9/8AR8owG8RclKe
         GkXo8IAGgsHw5/fyxr3SOmddeaoCvgvwqQssG+j8SEvhdy9FRz4vnjqJaiuqlwZm6neE
         BVwKHtF+zcYbm8U4/1lN53e7cGo+VdBuY08B+vGwQPB/wAN5/bBUvmw2LWIDaVTNXh1b
         wUqA==
X-Forwarded-Encrypted: i=1; AKwUvByaiBOxEfulZvS0GV/3ErljLMXqwYidMKDTnByu7uQ5AoP4MGzywRN4dYlFfsC0BBvstmfNuUNR1RUm/A==@lists.infradead.org
X-Gm-Message-State: AFuF++l8NGqGbVX4+gCqMcn6pgKCOm55T9efOMfLz0tRHMXl2fPX91RI
	rVh9xHSpMGshqpT3q5+m7ymnpjS2HsSqgZShJiesetCMuUKgtpTYUR89
X-Gm-Gg: AYBFou2j1WhIsi6yjLrFK1BWrVWngRoe2FrVbFn8aF+Lxb8AhQPk2xXwnZk9zZyJyAc
	EwNOqHbN8CNhHW/UfL02TeL8C1Wmqh5gzcaVz4ackzmBKmbEPvazRA+I5ELUb3OTIhro5VR2OvF
	y5wTmHwaPNWEgaN9sCPNelYqQ3N/4XIpGSA7oI6kIq8P496hhqfEIQRWcwbQdxGDvelMdjFFwKg
	t24d1yEM5Es/0PeplGLnF0xwBdWtyhCDgjnhlJHXnIPbqUiLZx6xVvFow+SNj7jhsARnQMfPMEn
	wXupLkgrXPt0IZ5lYWIT52bE/ZX6fB9roc6N5b/UVIIJKlhN2S7P3uR1NQ3r3u1+otGKNw+YOsh
	v52mxsHQT9X79x973OaGKCWb5obG63ChMLlnL7Qbym4Yh2PFVvKjThLQgn7nELhUvaRxdp1V0jj
	awoxs28Q9Tn7Gdt+F0xK42mromAJYXyjr5xK2a8WrvPBQ7NUJFWipaw0bAeSb78G7brTiQHgTuH
	Vsi2GN/Zj1QwCY9rMppGAsEiF1Ki/20FnD4KdsWeObh+NB3TxUCSoFb/YZCjFiXZl/pxEv/Yg2Q
	DVGyqM2gJVGX/U8/om3jHgRam4Ufo4d6P3da/syRowz0oGtI6ZDXhjKuKxzC04sHvf6u6/Nr73g
	GAkETfmJP9gw=
X-Received: by 2002:a05:6a00:2994:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-86169f6cbcbmr14428608b3a.24.1788551501408;
        Fri, 04 Sep 2026 12:51:41 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:41 -0700 (PDT)
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
Subject: [PATCH bpf-next v1 6/7] bpf, s390: Use resolved pointer for timed may_goto
Date: Fri,  4 Sep 2026 19:51:31 +0000
Message-ID: <20260904195132.141068-7-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125142_642928_13B4D60C 
X-CRM114-Status: GOOD (  12.19  )
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
BPF_REG_AX instead of a stack offset and BPF frame pointer pair.

Copy the pointer directly into the first argument register and update the
special calling convention documentation.

Fixes: b8efa810c1db ("s390/bpf: Add s390 JIT support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Assisted-by: Copilot:gpt-5.6-sol
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 arch/s390/net/bpf_jit_comp.c       | 6 +++---
 arch/s390/net/bpf_timed_may_goto.S | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
index c46872b071ce..4098c3377c21 100644
--- a/arch/s390/net/bpf_jit_comp.c
+++ b/arch/s390/net/bpf_jit_comp.c
@@ -1872,9 +1872,9 @@ static noinline int bpf_jit_insn(struct bpf_jit *jit, struct bpf_prog *fp,
 		if ((void *)func == arch_bpf_timed_may_goto) {
 			/*
 			 * arch_bpf_timed_may_goto() has a special ABI: the
-			 * parameters are in BPF_REG_AX and BPF_REG_10; the
-			 * return value is in BPF_REG_AX; and all GPRs except
-			 * REG_W0, REG_W1, and BPF_REG_AX are callee-saved.
+			 * parameter and return value are in BPF_REG_AX; all
+			 * GPRs except REG_W0, REG_W1, and BPF_REG_AX are
+			 * callee-saved.
 			 */
 
 			/* brasl %r0,func */
diff --git a/arch/s390/net/bpf_timed_may_goto.S b/arch/s390/net/bpf_timed_may_goto.S
index 06f567a460d7..e34c99982c4a 100644
--- a/arch/s390/net/bpf_timed_may_goto.S
+++ b/arch/s390/net/bpf_timed_may_goto.S
@@ -21,9 +21,9 @@
 
 SYM_FUNC_START(arch_bpf_timed_may_goto)
 	/*
-	 * This function has a special ABI: the parameters are in %r12 and
-	 * %r13; the return value is in %r12; all GPRs except %r0, %r1, and
-	 * %r12 are callee-saved; and the return address is in %r0.
+	 * This function has a special ABI: the parameter and return value are
+	 * in %r12; all GPRs except %r0, %r1, and %r12 are callee-saved; and
+	 * the return address is in %r0.
 	 */
 	stmg %r2,%r5,FRAME_OFF+R2_OFF(%r15)
 	stg %r14,FRAME_OFF+R14_OFF(%r15)
@@ -33,7 +33,7 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	lay %r15,-FRAME_SIZE(%r15)
 	stg %r1,__SF_BACKCHAIN(%r15)
 
-	lay %r2,0(%r12,%r13)
+	lgr %r2,%r12
 	brasl %r14,bpf_check_timed_may_goto
 	lgr %r12,%r2
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
