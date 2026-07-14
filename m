Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A705C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDhMEWtO4pvxJLH2Qg8yVIGJS6aPk0kX62SN36bj6iE=; b=WYz7gRalCsuRWL
	YLdSO9vdGIGq8+BU6chx8lExZQQV4cSliEkV/jl8QVW2j5H9UBCq84yFpFCtDVPdafezvJU7QMtsQ
	nFz4xgUgMCq/ttJKcCRIycWr3FI2cWdD0BBnOswjzTQnUny1a9j6hAwE8oGv8TSmXa9LA0xlhKXV9
	+LnQYL77fzPikYrTfAD0WcjXXnqDxfDF4rpw885sOP9xn7Sz4OXMtsepqx2JnLlTWEACPoCPyrCo/
	PIxMvVY2gKwNcy6Vvfdbo0n6KKF912IdRJDkHh/Aut77ZOuF1C5Mqhv1Ky4QQKmxR6KuVoN0ffWzV
	kG4mGkZWeaQVpbKDHYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQz0-0000000AazX-1wub;
	Tue, 14 Jul 2026 00:26:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQyx-0000000AayW-3M2f
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 00:26:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caced6038eso5607545ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 17:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988803; x=1784593603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcmn/mUzmVUL+DoQNyIpH9sLS8JVVLYSWdiiiJ0QKdQ=;
        b=i1rn0BpwzwEMeozoCCPZVsRHDzXlbgPsliFFkj5VdvtYdrUFHKZCrscHbefNXOl9SW
         gJxYdIhRVvZ20gMcONXbNuakNOfXcH6Et/Z57sNgOW1zm3788fXi07hK0buPBSOhkbAw
         E8UyRb1nM/cmhaZPHRL2Ju9yRyideOE+lkg09W1/QSNx4UjruKghfdzcwmhGa2BD2FJG
         vLUlufhSWa9n7YzUQRnCRYbGHyYUv0UG4XRNr+uSMC7jYXpWFJcpCe561m15cwhPq/ma
         jbsgTVDySP99nZSzUklrnXZp0mlyxx9lG2DAyAQaNUZ0P+d+cBr4+aGHYj7GnmSgapzR
         AlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988803; x=1784593603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fcmn/mUzmVUL+DoQNyIpH9sLS8JVVLYSWdiiiJ0QKdQ=;
        b=sKJXm498FUXC7UMFspP062ypPZt65zAbf1e30zwIe8l6YO1iyjkD8ydLC988To9Quq
         IMnVrJRU/cmCmpyAGjhaS6SI4mFomtibLnuOxhwKB1cRro4DIucuzm+MZYXGticsr4IH
         SnZenvuTibybVo5S98JamN1iNzLxF3mlcbSQo+h9lt6kH1s5tdtc9Z9x6l1hf6edC1yc
         NaGLCSV/V6xWqZGNC5Z46A1brpuTlOtLJjWW/8CSeQ7PE1BvAKZWlkeMK8zmTKbYhNW+
         LZ3YoWbwIVVQK6Yo9D08jbYLlNYlLlDWP4YT+l89gyR5DhMLfjsFcCN0PZZ5ItWreTqF
         H3nA==
X-Forwarded-Encrypted: i=1; AHgh+RrVIQIWp1OW8z5ZhGr0HQQSBdtAyzEzltCV9BfZOMQMqbWkYXvpX6L0tEeEmW8MXNj9hNpiTgUOxbE4bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFaU13id/1bUzW/ngjwEWWfipQAJo8XroBekQ7vwydv7/xmhP
	a9kjVjbQUch6sVjJBtsbzJQnrS+dMGjFO/YszNXx2r2YO07KvFiUP6qM
X-Gm-Gg: AfdE7cmrjmH0MEhsYubYnZZskM3bl3n4ETHDJz20wPUE/jP0hK5IEWtI5t9j7VnIY55
	7xYWi7RJG/5yNjwGjPkdKCeuM7W4eH5jdhhd0HUL7biF06dvP+mwjkSF+fulgU8ZDz9YWB9N7qi
	HAa/PMAmqpxjmM405MW7B57BpG2aQa1TbzLl145LorVkPjVIMBgPPSk9FVNyQjdcheCqrNLNRpv
	IgnMda5STl6zifP7jSiLd0USzLb4YB/b6M5tO0+AWicz4II9O7zdzFLzMR1xQfVdr+9cu8ONIMO
	0DEBztkPTb+aCK5hp4F7fL9RTaYRJ/o1/SLicOmYuICtSBgVe8kpNV02lnKVsNGgU1BgYFf42Jb
	6XHIWUxslrrsXtNF0PVo7WWLwatU5C0jY5hHTQBUo22W/cjgx1qvjlW/pVt5nxfi4/uJMuiPb/C
	oTgi7WpF3SAygEVgz5TO9gawfD1hOVBuHGeTlM34cnaNd6AKFPChbKxKeq+kFyqXfBjtu9foGsC
	Ziq9DHoP63Hi2o=
X-Received: by 2002:a17:903:2406:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2ce8297869amr137544225ad.26.1783988802746;
        Mon, 13 Jul 2026 17:26:42 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm105796545ad.53.2026.07.13.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:26:42 -0700 (PDT)
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
	aou@eecs.berkeley.edu,
	pulehui@huawei.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v4 2/3] riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
Date: Tue, 14 Jul 2026 00:24:50 +0000
Message-ID: <20260714002451.4091139-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260714002451.4091139-1-visitorckw@gmail.com>
References: <20260714002451.4091139-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172643_841896_593DF00A 
X-CRM114-Status: GOOD (  10.65  )
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

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 89153946a4e4..39e2b0b907dc 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -972,6 +972,24 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
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
@@ -1022,6 +1040,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
2.55.0.795.g602f6c329a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
