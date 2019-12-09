Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07597C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EF32080D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iAWygKjL";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG/Fdtoa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4EF32080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYazlit0M4yBFQMfwCbOmC5g6AIzkoA/91yiEDZt7b0=; b=iAWygKjLejcquJ
	4hoH2PS4u2ts6HIuEKs4w3L3z8WI6Pemtg8nozMLt4GvFWq59cdsrtkY/NvMlUGcEiBxrJeHLlLLf
	BtaMkQ1CG0US6yapwIRQP4FsK6GO8kVcNlHNdkIbS53U3ICPgIRYR6s2ujewLbFLghmhRKNNsS5rY
	YRuNAFoeH9XA+/RI3WNIQdJ2xSX2bSzmG0QfLXsURXxbk7oI2LjeXiJ7t54jVlE0Z2t4cqYj3Ccu4
	OntSYjmITM77hJCprZHn9uujXwXXB+dgKWsBx97D3Zswj4yKjCekqdbgU7EshvREPlaxpHwuCj/9s
	45PnbU/wkcFLpQN9uczg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieMt0-0004F9-HA; Mon, 09 Dec 2019 17:31:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieMsx-0004D9-Q2
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 17:31:53 +0000
Received: by mail-pl1-x644.google.com with SMTP id o8so6086507pls.5
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYazlit0M4yBFQMfwCbOmC5g6AIzkoA/91yiEDZt7b0=;
 b=JG/FdtoaT1PdHdeb1nQSG3n58INhw4WAwPx4fgf/iNqq6+YukonnT/Te2EfrJCYbwS
 BA839prSyM9HNh1zIq1Y6mtGIkk9Hb+UVfTCxDxX7jXyY2CwmcHbybwq+G5REvSl/X40
 P9Rh91X5SyPVRrqmh9uS5XjMdub94pM7M0MD5oQtO/gb4wKcvuCcLgwXIQ2VOyXkAC1b
 q22mSGWXKWS6XeieReZpy5r+4wkmjv+esiy9JZkyXkCJRjbFGxTYAPCdvNaLN6VVjfK2
 0Gua8XtVNUIyFq0HqEyNqTgudqrWWL9uHE+hGO7h/IaBfuYzgCqRMBV0akFCO4kKU77v
 2YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYazlit0M4yBFQMfwCbOmC5g6AIzkoA/91yiEDZt7b0=;
 b=HxptjIYzifoCvi/RC6y+l+Al3c1rA/pRHct8zUxfNuP+YWTSVdd0AJV8Q0q6vz75Kp
 n09EUysSEF70+6sweplc4L/pipwfAxpMXuXeZCIy1qZt9HC001zhpGeMOkmchONV498H
 fhXV7U4cBI7zur3QGcroMYr5yaRvbV9G+OLO2FnNJCZMKy5jTxRgIvJv3oVXMDuCaIqz
 0b9DCoAYe7BB1yLcgXsinGHdyHWW+L/m2yWDURyRw7JDOFH5h2AmLdnhON7rkkkLKXVY
 sgRhzS3JUfWYT+w3KdHmwY/Uq0Ra8RkGBxMPqxR7V73L/7mJdzDxfibBGlWumxyg80kf
 WBlQ==
X-Gm-Message-State: APjAAAWXvKWtY4XD5p6fHcS10Om4nfuKPSK0jvNG7OiYmOOEarZyl6mp
 GV8Xg4SxILnxBuRKFJ4xn2Y=
X-Google-Smtp-Source: APXvYqwrSC1AJl671lj66BCLyGpEOq1PPz3mWlePEUYhbgIUczUyAsdnUS2TdGA2AA3b+CVw6LGv2Q==
X-Received: by 2002:a17:902:6502:: with SMTP id
 b2mr30307947plk.182.1575912710989; 
 Mon, 09 Dec 2019 09:31:50 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id d23sm54943pfo.176.2019.12.09.09.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 09:31:50 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 1/8] riscv, bpf: fix broken BPF tail calls
Date: Mon,  9 Dec 2019 18:31:29 +0100
Message-Id: <20191209173136.29615-2-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209173136.29615-1-bjorn.topel@gmail.com>
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_093151_855541_65183F43 
X-CRM114-Status: UNSURE (   9.63  )
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

The BPF JIT incorrectly clobbered the a0 register, and did not flag
usage of s5 register when BPF stack was being used.

Fixes: 2353ecc6f91f ("bpf, riscv: add BPF JIT for RV64G")
Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/net/bpf_jit_comp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
index 5451ef3845f2..1606ebd49666 100644
--- a/arch/riscv/net/bpf_jit_comp.c
+++ b/arch/riscv/net/bpf_jit_comp.c
@@ -120,6 +120,11 @@ static bool seen_reg(int reg, struct rv_jit_context *ctx)
 	return false;
 }
 
+static void mark_fp(struct rv_jit_context *ctx)
+{
+	__set_bit(RV_CTX_F_SEEN_S5, &ctx->flags);
+}
+
 static void mark_call(struct rv_jit_context *ctx)
 {
 	__set_bit(RV_CTX_F_SEEN_CALL, &ctx->flags);
@@ -596,7 +601,8 @@ static void __build_epilogue(u8 reg, struct rv_jit_context *ctx)
 
 	emit(rv_addi(RV_REG_SP, RV_REG_SP, stack_adjust), ctx);
 	/* Set return value. */
-	emit(rv_addi(RV_REG_A0, RV_REG_A5, 0), ctx);
+	if (reg == RV_REG_RA)
+		emit(rv_addi(RV_REG_A0, RV_REG_A5, 0), ctx);
 	emit(rv_jalr(RV_REG_ZERO, reg, 0), ctx);
 }
 
@@ -1426,6 +1432,10 @@ static void build_prologue(struct rv_jit_context *ctx)
 {
 	int stack_adjust = 0, store_offset, bpf_stack_adjust;
 
+	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
+	if (bpf_stack_adjust)
+		mark_fp(ctx);
+
 	if (seen_reg(RV_REG_RA, ctx))
 		stack_adjust += 8;
 	stack_adjust += 8; /* RV_REG_FP */
@@ -1443,7 +1453,6 @@ static void build_prologue(struct rv_jit_context *ctx)
 		stack_adjust += 8;
 
 	stack_adjust = round_up(stack_adjust, 16);
-	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
 	stack_adjust += bpf_stack_adjust;
 
 	store_offset = stack_adjust - 8;
-- 
2.20.1


