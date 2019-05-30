Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F1DC28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 19:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186F526078
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 19:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXd2W2y9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZcXJqow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186F526078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zng3FHHgDbmMlJx6ax1ZeAgvhU/1x66xweS9wG4gx00=; b=TXd2W2y9Cx8pS1
	t2uIiVvrdg92iCozVL7+0D8LIWWFOKdd3yK3ucVCZ/ASxuBOwmW1C+/k40z/kkv6qJBR9FlfdwXW7
	d99ragEKOLOM0bW7QFGieLHaZKrSFYlpPJpoSxtXn1eaLXX0LuIujyz4SJmRtIliGOytIsJiax9xj
	0m+x0AutL4Na7/ABXiJ7L2KH5wKVzEiVq80Y7b93BsClzEegpj57WT5wSiiKwiIktKhLNky+RzG5P
	4Hh/gYbW+C7V2peapZ6WBSMFQMRfae7MVDyrjFxp2/1A1MBsUUqkBdnmZ/r1/6R3N557izkRBRfD3
	y46HV9z7dQ5fA5v+D+RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWQPY-0000gu-4B; Thu, 30 May 2019 19:08:24 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWQPU-0000f3-QQ
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 19:08:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id c14so2140184pfi.1
 for <linux-riscv@lists.infradead.org>; Thu, 30 May 2019 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7H9dDYfkG5aoCexFiQp3mrYF6mxJsKXlL4736u8wxiY=;
 b=fZcXJqowIrB3tNk9j2Vs6zQMB9vhzOEhXiXoNOT3C2SZUI/keXl5CUnUzXEOmdSdM5
 w0m8w4++FRlx5nmKHK+bxr5j4dQ1EyWaji8MJy8dKDfUl8eRWdKqTHJF+z3qw0Uuwa7y
 +NbvRl8AteuHJDxgBDqv0Zf6NPBNpNTkiZsLXP2k5JvcBuAIEhXrVRuBbQ/F0RyvCI8m
 l6VmoKO/75H1hmPw7JgQ1D/eaTBD+HQrL1veyMvOgi0dNM70EPDRwjlxZtK/chMvzYvR
 b0E0jLCRFaga/bnV3BCHwDCKF5M+XHO7AhVYOpH+/n7qiSgMMKXYKhDESgGA5iDqp8H2
 goNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7H9dDYfkG5aoCexFiQp3mrYF6mxJsKXlL4736u8wxiY=;
 b=acWpCpBEbewLL80eW4kcE2/Bi0t6/1wQ8VbicfMMJNDhSTSZDhVuTXY/pTdAGI3g0Q
 k0fkwknXZRWip3M7tm6rLYKKeErTJN75adrPubQ878F8j5veAFcnYZms0bmyhjxpMJHO
 vd1a6veTzH9QjCyidutF7vmvaL9ZD8ewfCLoAD5WCEttrwgBXQ2PzwDEO++WyNO/Pxk/
 Ei6fzLb/kvBNpIxHfXqJSBSNEAzkc9zFB4bfefv0BGhKjLYjCb/vlzNqfIOhEyi3CzHf
 9yW67bik+KqTwWSoOJkinGbPYXt1JF+t38omX6sDiG06jIC18fAMHlizoSqCgtsxN/iY
 nezw==
X-Gm-Message-State: APjAAAVRuytZjrGCbJs/R/f1LsxpdxMVX6r+oGOPNOyCtkwXuYJQ+EY6
 MqKR/glmt8tRSWJmmS+Xypg=
X-Google-Smtp-Source: APXvYqzw9JIF9TxBbFnD1DrZeGTUNq7drJnRoJjCnUUex5bRISoa/9IXRlVtRwwyYFDC9m7+TUscDg==
X-Received: by 2002:a62:e718:: with SMTP id s24mr5189745pfh.247.1559243300157; 
 Thu, 30 May 2019 12:08:20 -0700 (PDT)
Received: from kaby.cs.washington.edu ([2607:4000:200:15:61cb:56f1:2c08:844e])
 by smtp.gmail.com with ESMTPSA id
 a8sm3927617pfk.14.2019.05.30.12.08.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 12:08:17 -0700 (PDT)
From: Luke Nelson <luke.r.nels@gmail.com>
To: 
Subject: [PATCH 2/2] bpf: test_bpf: add tests for upper bits of 32-bit
 operations
Date: Thu, 30 May 2019 12:08:00 -0700
Message-Id: <20190530190800.7633-2-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190530190800.7633-1-luke.r.nels@gmail.com>
References: <20190530190800.7633-1-luke.r.nels@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_120820_859903_BB888DE5 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Luke Nelson <luke.r.nels@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This commit introduces tests that validate the upper 32 bits
of the result of 32-bit BPF ALU operations.

The existing tests for 32-bit operations do not check the upper 32
bits of results because the exit instruction truncates the result.
These tests perform a 32-bit ALU operation followed by a right shift.
These tests can catch subtle bugs in the extension behavior of JITed
instructions, including several bugs in the RISC-V BPF JIT, fixed in
another patch.

The added tests pass the JIT and interpreter on x86, as well as the
JIT and interpreter of RISC-V once the zero extension bugs were fixed.

Cc: Xi Wang <xi.wang@gmail.com>
Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
---
 lib/test_bpf.c | 164 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index 0845f635f404..4580dc0220f1 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -2461,6 +2461,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 1 } },
 	},
+	{
+		"ALU_ADD_X: (1 + 4294967294) >> 32 + 4294967294 = 4294967294",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 1U),
+			BPF_ALU32_IMM(BPF_MOV, R1, 4294967294U),
+			BPF_ALU32_REG(BPF_ADD, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_REG(BPF_ADD, R0, R1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 4294967294U } },
+	},
 	{
 		"ALU64_ADD_X: 1 + 2 = 3",
 		.u.insns_int = {
@@ -2812,6 +2826,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 1 } },
 	},
+	{
+		"ALU_SUB_X: (4294967295 - 1) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 4294967295U),
+			BPF_ALU32_IMM(BPF_MOV, R1, 1U),
+			BPF_ALU32_REG(BPF_SUB, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_REG(BPF_ADD, R0, R1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_SUB_X: 3 - 1 = 2",
 		.u.insns_int = {
@@ -3391,6 +3419,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 0xffffffff } },
 	},
+	{
+		"ALU_AND_X: (-1 & -1) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, -1UL),
+			BPF_LD_IMM64(R1, -1UL),
+			BPF_ALU32_REG(BPF_AND, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1U),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_AND_X: 3 & 2 = 2",
 		.u.insns_int = {
@@ -3533,6 +3575,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 0xffffffff } },
 	},
+	{
+		"ALU_OR_X: (0 & -1) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0),
+			BPF_LD_IMM64(R1, -1UL),
+			BPF_ALU32_REG(BPF_OR, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1U),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_OR_X: 1 | 2 = 3",
 		.u.insns_int = {
@@ -3675,6 +3731,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 0xfffffffe } },
 	},
+	{
+		"ALU_XOR_X: (0 ^ -1) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0),
+			BPF_LD_IMM64(R1, -1UL),
+			BPF_ALU32_REG(BPF_XOR, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1U),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_XOR_X: 5 ^ 6 = 3",
 		.u.insns_int = {
@@ -3817,6 +3887,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 0x80000000 } },
 	},
+	{
+		"ALU_LSH_X: (1 << 31) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 1),
+			BPF_ALU32_IMM(BPF_MOV, R1, 31),
+			BPF_ALU32_REG(BPF_LSH, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_LSH_X: 1 << 1 = 2",
 		.u.insns_int = {
@@ -3842,6 +3926,19 @@ static struct bpf_test tests[] = {
 		{ { 0, 0x80000000 } },
 	},
 	/* BPF_ALU | BPF_LSH | BPF_K */
+	{
+		"ALU_LSH_K: (1 << 31) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 1),
+			BPF_ALU32_IMM(BPF_LSH, R0, 31),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU_LSH_K: 1 << 1 = 2",
 		.u.insns_int = {
@@ -3911,6 +4008,20 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 1 } },
 	},
+	{
+		"ALU_RSH_X: (0x80000000 >> 0) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0x80000000),
+			BPF_ALU32_IMM(BPF_MOV, R1, 0),
+			BPF_ALU32_REG(BPF_RSH, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_RSH_X: 2 >> 1 = 1",
 		.u.insns_int = {
@@ -3936,6 +4047,19 @@ static struct bpf_test tests[] = {
 		{ { 0, 1 } },
 	},
 	/* BPF_ALU | BPF_RSH | BPF_K */
+	{
+		"ALU_RSH_K: (0x80000000 >> 0) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0x80000000),
+			BPF_ALU32_IMM(BPF_RSH, R0, 0),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU_RSH_K: 2 >> 1 = 1",
 		.u.insns_int = {
@@ -3993,7 +4117,34 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 0xffff00ff } },
 	},
+	{
+		"ALU_ARSH_X: (0x80000000 >> 0) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0x80000000),
+			BPF_ALU32_IMM(BPF_MOV, R1, 0),
+			BPF_ALU32_REG(BPF_ARSH, R0, R1),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	/* BPF_ALU | BPF_ARSH | BPF_K */
+	{
+		"ALU_ARSH_K: (0x80000000 >> 0) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_LD_IMM64(R0, 0x80000000),
+			BPF_ALU32_IMM(BPF_ARSH, R0, 0),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU32_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU_ARSH_K: 0xff00ff0000000000 >> 40 = 0xffffffffffff00ff",
 		.u.insns_int = {
@@ -4028,6 +4179,19 @@ static struct bpf_test tests[] = {
 		{ },
 		{ { 0, 3 } },
 	},
+	{
+		"ALU_NEG: -(1) >> 32 + 1 = 1",
+		.u.insns_int = {
+			BPF_ALU32_IMM(BPF_MOV, R0, 1),
+			BPF_ALU32_IMM(BPF_NEG, R0, 0),
+			BPF_ALU64_IMM(BPF_RSH, R0, 32),
+			BPF_ALU64_IMM(BPF_ADD, R0, 1),
+			BPF_EXIT_INSN(),
+		},
+		INTERNAL,
+		{ },
+		{ { 0, 1 } },
+	},
 	{
 		"ALU64_NEG: -(3) = -3",
 		.u.insns_int = {
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
