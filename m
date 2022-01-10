Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CRoBSPsMbDbOelXROMcyguFu0mxRC1urQ2GLEJFGXr8=; b=wtDx5aVY/OSM0h
	yyKZX7iSST76Wtg0hGjiNqb76nKv8tntOXWW8dNwe7LNm/c+uTgDtUjVxxr1lvrLqC2NcWiIDyXIc
	7qvNnGh+WaK4Rl3sg3QSssGqTQwNgjXVna/86he94M0yOGAyTG7yY7bPph58SwG1zN2dfiC7ig/i1
	LrsPSOb33PXbc3SB2tAvOuUGVaa2rIgSsHnSiP37unKNqaxamPOPi34LqbQTwD4YNXv2T8OXxFPar
	93onZbZoR81zRfRHY6mw+d00Ls5gYRX129AHQBYGMC1Zx7Ym3QzLWODVQlxGfJo91BHsTXfvY+aZa
	rW0Jp8p+dWqFnFH8wa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6y1H-00CRyP-SI; Mon, 10 Jan 2022 16:59:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6y1G-00CRxy-8z
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 16:59:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A45E61335;
 Mon, 10 Jan 2022 16:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D50C36AE3;
 Mon, 10 Jan 2022 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641833980;
 bh=dL5sJz14KH/MnFm5LiWq3OK9TibKvIP5py+qchPUekA=;
 h=From:To:Cc:Subject:Date:From;
 b=RDraMqr7XGnCR4woIVwGa1WdQQQwyYNS1cCiaqmGtWhWfe4/HCgvzb6GDiHK1vUuQ
 GoRLtJGFjk+a2DOwby5nTgvxOjLVGlSTI3N6TyP1Su6A6kg7+ZDEKbvLSzy+FYXX2A
 +kjSm2N/OomoHMcSLUyhPk1aiknBe8g5eSzKgX0VodiAJVhGsk/jnY5ku1G3OuOwxd
 Re5mTP75shNx1VpiEqTgyI0YtLcDK+iaK/6q4IDkBxIsyTpTdNJxrB/1OgTc0su7Rx
 aiXcQh2I2n+hCUetVHfe10aNDFXaZDyKgi1GfkKJ218OgVTbLbkrjlbFBW94WPGf1O
 etzmbZQfVquIw==
From: Jisheng Zhang <jszhang@kernel.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
Date: Tue, 11 Jan 2022 00:52:08 +0800
Message-Id: <20220110165208.1826-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_085942_396400_38A29373 
X-CRM114-Status: GOOD (  11.96  )
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

eBPF's exception tables needs to be modified to relative synchronously.

Suggested-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 69bab7e28f91..44c97535bc15 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -498,7 +498,7 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	offset = pc - (long)&ex->insn;
 	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
 		return -ERANGE;
-	ex->insn = pc;
+	ex->insn = offset;
 
 	/*
 	 * Since the extable follows the program, the fixup offset is always
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
