Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C909CD484E
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdo9w6hv7YFLKOmJM9GhoOlhxyG8gbj/dPPqMsL5fyY=; b=ogWLtJ/ON1CR5M
	IdQCoxBiS+XouBThiZiG0VdpI4wah3XtIqJsDE/7F8qAsXHN2abxAyalUzZbPHjgiY8o0dcaP0tlM
	3IhI3v0dD3pcQK+zVboQ2Zk5BPNz0f7ukLLr/glAH+DYJhqLBRrl1DPnaIcuNjEgs3n68IVZNvkn2
	gIby0fgkEFJtHR/k4ewinSDSulcoOdikTU3ZXfzf7hhFJxid10yH4lQO2ZJmchW+3l3xmYY2abxDI
	VtFYK8dsw4oAAKDxiVZ8aAb4/UUwbQpyg34kIcMvt1X9FISHmuy6knjxa1BheHmEPvV1pnWgqEg16
	eY+/Jsa23U3talWswPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYwC-0000000EtEp-0wY5;
	Mon, 11 May 2026 22:17:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYwA-0000000EtDz-0mjg
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 22:17:19 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8367df48711so2217712b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537837; x=1779142637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHGA0pnULoE9zOAnQoCX1h4jacBv900xuE41+ziaiRY=;
        b=jzZm2j4iwFJSDZ2TMUGRlKt7VdD24GQBxCxapEcuKXbyNVxjhDJvCaTcBsTV67I8KH
         nUesdWEU8tvKXPtUf0P8Eyf5OeIkqJba1/awrY3n8ufI8K+u5CWW8CwNLkIEre5sHz8A
         XeRArw0ijmPtMTv/omW4ILzsv1DIUHYWY+lycoDTlxPcxBjQaxYoruL2/AwLWnQGXx0a
         JyJ2JMJvPpnKhK8lgoMj0X0V6dtjMx6/VtnMSq5PYS2ctR/qxqzQzBFZLwJADvQPubzr
         jbY7e1Sx+nwCg2UBPq3LeG8Q/OvQ2T2ap7RMPVhxd4VaYVIaLVBCY4D0/LNm4Gp9P6hF
         kmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537837; x=1779142637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHGA0pnULoE9zOAnQoCX1h4jacBv900xuE41+ziaiRY=;
        b=q5bUXgY/sbHwvSgKapon8Kr4r3hX+HOMQUnEwIlMzSpBe7hfucDE+r5UkasY1qctiy
         mN0Yv6jb86EdncjoGlvoQ6htG7F1yKA7EXuG+YqmfInxZZRg/QTK3eOA51QCzejQKp5o
         0gZGYYNCFXK8yyLmb8kbWrHAjyri8W1hZKVfwtVpWZtxvFW6K8099GWqEkrNonGSJ7ex
         pu1I2+zK2Z07e5q+1MTydD441xew1lg2wrLkaRSRPNB3+5dGtawdNlHEFJB2z7H7cFu4
         exh09KWZf1k6+OkyeUJrYX3DBqIGdkm1Wjq9YjU4XTuApd2Um2Je9V5I+aNsBS1mqMvJ
         gF1A==
X-Forwarded-Encrypted: i=1; AFNElJ8senUQNkeN4XKn+RRpFV9X/K6ZxCxJXesEu46bO2VvRHoUtKxC54ZuBQD4L9CHlXZf1S/+6afajBQrRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6A30Ccv93gjMLKrc97OmeA9xysk2PHQIFeQbGADJNECjNwslq
	yOou533Xhcy2ydmjSPtCtGIGwDWEKgXCHj5zIrLVutNL3ZIw6tI3HXPR
X-Gm-Gg: Acq92OH4oE1eNsK2ugrWB5Z/f0v+3Ccpzghh07ufpxjkp5RmPAZSUAEUZJslyTQmyeq
	NBmD4GFdeOa+yS28438SLiQAr5lv3b51aQUsZ6WwEibAz5zmgzVe++J48GOiJ5O2zrvwxQNZWpi
	SomVnGiOSLsXKvYVZgC1eyu4HhL1CZLrT28llnagwzjU5M7hRK0/r2bNw62sYC2OzgDld4z4xcx
	X90OTJ0sMwwCKrcZ53HOEv9slOoHHpzBI0PfWMdxowEVf4a0Iw5R+GLBrImFQzqghQ/0SoWHJKV
	jp/gz1kaWwRMcei3BZ5XbsD6+RjTOqkxFm4E+YbBHaERoJDNviSCzu0KJqraxuJFlbZXixErqm/
	4d5fTFq1s8wvFzTm2bwlg03ve2G9tMzen20LeRnDU3IA9E3PAGg+rYq2C4nsZYrDGWzqjbU2Kco
	vvIRgB7h/0koOxwVtzuffDSSaRrDAkYqLJyaaMSFVnXTSem9l483xjT6N43M0ZGc9UM4mJsV2vu
	Ehwpa7zCw8rWrJjYXXfzun6TD0Nhnz9OQ==
X-Received: by 2002:a05:6a00:2354:b0:837:80a:5ab4 with SMTP id d2e1a72fcca58-83eebf9e29fmr296684b3a.44.1778537837238;
        Mon, 11 May 2026 15:17:17 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm21943329b3a.19.2026.05.11.15.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:17:16 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v2 2/3] riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
Date: Mon, 11 May 2026 22:16:47 +0000
Message-ID: <20260511221648.3251464-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260511221648.3251464-1-visitorckw@gmail.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151718_225219_74D237C4 
X-CRM114-Status: GOOD (  10.18  )
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

The current rv32 bpf jit compiler incorrectly treats BPF_MOVSX as a
standard zero-extended move operation. The bpf instruction set allows
sign-extension moves by reusing the BPF_MOV opcode with the instruction
offset set to 8, 16, or 32.

Update the bpf_jit_emit_insn() function to check the offset field for
both ALU and ALU64 MOV operations. If the offset is non-zero, emit the
correct slli and srai instructions to perform the sign extension.

Before this patch:
[   19.549705] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.551354] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.552576] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.553542] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.554807] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)

After this patch:
[   17.931172] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 125 PASS
[   17.932198] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 124 PASS
[   17.933039] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 124 PASS
[   17.933918] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 124 PASS
[   17.934751] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 122 PASS

Fixes: 8100928c8814 ("bpf: Support new sign-extension mov insns")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 7396899ea276..f8509950fed4 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -974,6 +974,24 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 	switch (code) {
 	case BPF_ALU64 | BPF_MOV | BPF_X:
+		if (insn->off != 0) {
+			const s8 *rd = bpf_get_reg64(dst, tmp1, ctx);
+			const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
+
+			if (insn->off == 8) {
+				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
+			} else if (insn->off == 16) {
+				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
+			} else {
+				emit(rv_addi(lo(rd), lo(rs), 0), ctx);
+			}
+			emit(rv_srai(hi(rd), lo(rd), 31), ctx);
+			bpf_put_reg64(dst, rd, ctx);
+			break;
+		}
+		fallthrough;
 
 	case BPF_ALU64 | BPF_ADD | BPF_X:
 	case BPF_ALU64 | BPF_ADD | BPF_K:
@@ -1024,6 +1042,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_zext64(dst, ctx);
 			break;
 		}
+		if (insn->off != 0) {
+			const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
+			const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
+
+			if (insn->off == 8) {
+				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
+			} else if (insn->off == 16) {
+				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
+			}
+			bpf_put_reg32(dst, rd, ctx);
+			break;
+		}
 		fallthrough;
 
 	case BPF_ALU | BPF_ADD | BPF_X:
-- 
2.54.0.563.g4f69b47b94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
