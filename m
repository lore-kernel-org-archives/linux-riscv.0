Return-Path: <SRS0=+8gn=2G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A218C2D0D1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 09:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D416022522
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 09:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3AMWay8";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIUfuvAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D416022522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rd0ylQkfUXD47lMr1COolacBtWcmBE98gO//niHtxXI=; b=H3AMWay8ppkH8m
	sRE7XbbJPldA/p+q41pIu9iqIrhvKW5hlEj3kAJOgm4RvGhSPluZkAdlF9nupER8GqFAj2Z1W7TGK
	BRZTJnF2FhwN5blXdy/J2Mh4MW7BmnJcSmukKG4kT2lJAWa4GzhusPpEyziJUzAB7UYFx2xo5IU45
	Ml2N0+zZZUDec8O4ycOTNsoZphLOFOkbj8/TeZZ9jC9QIkmxCSnSanpM8gQsVhRor5eHGJVC1Db9q
	e9rk9NWtcxqFj7b0Vdw/QOKv/WOnJKvnteLl5BLRtrHDQejNXAuC4aKGkwZXpXVI6ffK0JzalMx/b
	lqBCTUkQqv229rJxCaMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igmSA-0003Vh-8J; Mon, 16 Dec 2019 09:14:10 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igmS1-0003OM-4j
 for linux-riscv@lists.infradead.org; Mon, 16 Dec 2019 09:14:07 +0000
Received: by mail-pf1-x443.google.com with SMTP id 4so5236031pfz.9
 for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2019 01:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rd0ylQkfUXD47lMr1COolacBtWcmBE98gO//niHtxXI=;
 b=qIUfuvAf5plY9AdGHbegpurFDTmDKuRlVF3Lz0ZeeaL8aWA07KSjFUz5a4g3OkJJl0
 7sbcqLQyJc8jhoPW73hcA42kFw6TJBw8xoN2xOZ80LkhaZbBFFE1384G2YNKLYH7cLvl
 QjT5IkEKFLuNPoPbfMEzv/19Yt/x7PznYObaS7/cbRag8ccccqbCFYY2EhHR0mUtvjXX
 REtJ63n76pIK3I7W2la1dJE4GhvFaWJDifDnthNlm55cutG1eDhWBvphwKnzV23yo/7W
 gq5R4rR4ItY/qmIm48K0OthXZRU6AH2lqdbfKsN8cClVt9DIc9CB0VIrlfZxalpMo6lH
 daHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd0ylQkfUXD47lMr1COolacBtWcmBE98gO//niHtxXI=;
 b=Cdt7686wse98/X/J8zhNlgVrnW+SfdAyH294ecCtrYEly6t3Lg3VbqtZPmHbxSMqLs
 H601xQbxTmw7oclpd9fU2xDRHG8BaLYEVXQj38KxpuFkf7dT3GJJYaCpglm8Yjq/Rqt/
 tPrvENxXLDLY2m2tobNqfcQdgbMQoN82tIUZqbSEoqsSHQxODzZ8ZdGHEzGplXjV7RQZ
 D3eJNjaQ51TnymEfQ8yWJuRHM5aCB2F+4Xumzp+BaFtvrnPisXhvF0u79wyn8lri6pVH
 FtfihIj2JLg2mFa2/6zN3oA93YrDhFHt7GRN12XW3eMkPKt2XHGGz3TZzUi43m5FLKt2
 lSmQ==
X-Gm-Message-State: APjAAAXUNJVgnUjYJPJrLrU4sxjwct4j9+gPKN4zTIj99u2y8q07vpsr
 yHMHTqXyXcWABe6aKhW527c=
X-Google-Smtp-Source: APXvYqwvlSWpPBFZbhR83GOWOvhvx/HkAxTGzSWuJq1dD/CdoLWHqImIZK+iC3ThDTzoYJwhgDpBeg==
X-Received: by 2002:a63:1f0c:: with SMTP id f12mr17305605pgf.247.1576487640533; 
 Mon, 16 Dec 2019 01:14:00 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (fmdmzpr04-ext.fm.intel.com.
 [192.55.55.39])
 by smtp.gmail.com with ESMTPSA id x21sm12505033pfn.164.2019.12.16.01.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 01:14:00 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 3/9] riscv,
 bpf: add support for far branching when emitting tail call
Date: Mon, 16 Dec 2019 10:13:37 +0100
Message-Id: <20191216091343.23260-4-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216091343.23260-1-bjorn.topel@gmail.com>
References: <20191216091343.23260-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_011401_222587_1EDF072C 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Start use the emit_branch() function in the tail call emitter in order
to support far branching.

Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/net/bpf_jit_comp.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
index e599458a9bcd..c38c95df3440 100644
--- a/arch/riscv/net/bpf_jit_comp.c
+++ b/arch/riscv/net/bpf_jit_comp.c
@@ -496,16 +496,6 @@ static int is_12b_check(int off, int insn)
 	return 0;
 }
 
-static int is_13b_check(int off, int insn)
-{
-	if (!is_13b_int(off)) {
-		pr_err("bpf-jit: insn=%d 13b < offset=%d not supported yet!\n",
-		       insn, (int)off);
-		return -1;
-	}
-	return 0;
-}
-
 static int is_21b_check(int off, int insn)
 {
 	if (!is_21b_int(off)) {
@@ -744,18 +734,14 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 		return -1;
 	emit(rv_lwu(RV_REG_T1, off, RV_REG_A1), ctx);
 	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
-	if (is_13b_check(off, insn))
-		return -1;
-	emit(rv_bgeu(RV_REG_A2, RV_REG_T1, off >> 1), ctx);
+	emit_branch(BPF_JGE, RV_REG_A2, RV_REG_T1, off, ctx);
 
 	/* if (--TCC < 0)
 	 *     goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, tcc, -1), ctx);
 	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
-	if (is_13b_check(off, insn))
-		return -1;
-	emit(rv_blt(RV_REG_T1, RV_REG_ZERO, off >> 1), ctx);
+	emit_branch(BPF_JSLT, RV_REG_T1, RV_REG_ZERO, off, ctx);
 
 	/* prog = array->ptrs[index];
 	 * if (!prog)
@@ -768,9 +754,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 		return -1;
 	emit(rv_ld(RV_REG_T2, off, RV_REG_T2), ctx);
 	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
-	if (is_13b_check(off, insn))
-		return -1;
-	emit(rv_beq(RV_REG_T2, RV_REG_ZERO, off >> 1), ctx);
+	emit_branch(BPF_JEQ, RV_REG_T2, RV_REG_ZERO, off, ctx);
 
 	/* goto *(prog->bpf_func + 4); */
 	off = offsetof(struct bpf_prog, bpf_func);
-- 
2.20.1


