Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AFCEE49B7
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4pUKDIV/4aAYBVnJDAJ/C2Ausywh117fmKs30cYIe0=; b=ZDqcvR2P7IDT0k
	+vKjca7B2ccHHDPCUROw1UXAU7GGswM8HaKIjbFuLNom1T4Om8vgZdM8b4BEQQeJqLf++tY9c+tic
	PyKzkNvDMyI8RaTqxL5xzKXWTfD38sy3a07h7bbzW9+6rchj1+JaWe2WBjmV1ZefgSjRKmgEbTc+B
	p0tscceO8GRZ65+pkO5uooOk+KEGYsO50QBIdjhKLnU2JG6fTHAYXt9jLog1IThc9mwmp5CeWdveg
	Dp8M/rIfv29OfV5+xw6l1EQkkRfb35So4n7zuMcrPSCOWmW3KLoneCtK012dW/j8z8dcawNqTmk/L
	WhR/2ZoXz9cWeptBUX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9w-004DGF-1B;
	Tue, 12 Sep 2023 22:47:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9s-004DDG-27;
	Tue, 12 Sep 2023 22:47:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-403012f27e1so42464985e9.1;
        Tue, 12 Sep 2023 15:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558817; x=1695163617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vapbmpx4kHHnDeZPSymjWm+kxhmkjrMGYPDoYN863/0=;
        b=e7E+VJrw5xJ9kMqZEXLyobYtLnCIhJiXHchoMAG9s0rAJGPpEMsDngAqBy6RE8qJpy
         zp3pZ0YRWte8Q+G7VS253/r6ngLRk/9EQ/3y2e/Uguq4kQ4p2eEXYp7YZOhOSLwjzF9H
         5cdGkU2FXm+WeeKwRgAjE5N1SxBgaQ58KG5T3ZF+geBb+PX7TzRfn73DJK4RBFZUVU+l
         chZee94a44vi4d9YaRsO6PuVk3eXVRD7ucxIsUockv5b5OCadtblM0TxUcpgi7w5fw4j
         BXjWRHxRYrcS3sxzg2k17gKPwg5iKcXGxMVN2TmiVrvrCDVg9XB/d9I1AqBEOu0EFrku
         hNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558817; x=1695163617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vapbmpx4kHHnDeZPSymjWm+kxhmkjrMGYPDoYN863/0=;
        b=JBV8kWftXGQVo3S53bXgmu8+tt9d9Y6nSlkIUqG7MOMMBwOFVe0RzznL+rXxcsc0CY
         O9ETbBkSnCaW7VtpNSPB35UQ3q/oip4Kt5dfmrUYfFFUxmvx5Tw/3Ylv+xke91cyRYE9
         s5fVg/h44Fj0hEfawafwd5Mw65jyouGD6bLGXELZQs6Y4VKRUORWpESpT3ro7vBVABcK
         isj8JKd8MYADRMtoP29rr9VH2aouTUJIDewU5SN3UM4Pfe6MtWahjUt9Izz3Pf9MwM3S
         hotn3N9my81PLhonSGFtxkHldOsPABTUoVCflyVtdQobUwUfaHFpjpKMHgEo8wcvHYHa
         6ceg==
X-Gm-Message-State: AOJu0Yz7hHyOv499j/qgcxmNqKNAqEGl1T5Wp8QllftN8Wlh/5CitLdJ
	79+sAfiI2oOhGSzmFaBKDAU=
X-Google-Smtp-Source: AGHT+IGYaSde42//e2zWhzE0pBMJ3eH7x1xRhsn/tGbjooCPwkOeTE3BOytCJBgEeqN+vRwsYu0ZSg==
X-Received: by 2002:adf:f302:0:b0:317:ddd3:1aed with SMTP id i2-20020adff302000000b00317ddd31aedmr616529wro.68.1694558817139;
        Tue, 12 Sep 2023 15:46:57 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:56 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wang YanQing <udknight@gmail.com>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 1/6] bpf, riscv32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:49 +0000
Message-Id: <20230912224654.6556-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154700_712511_A1F0E348 
X-CRM114-Status: GOOD (  11.77  )
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

The JITs should not depend on the verifier for zero extending the upper
32 bits of the destination register when loading a byte, half-word, or
word.

A following patch will make the verifier stop patching zext instructions
after LDX.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 529a83b85c1c..8f8255519ba1 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -847,18 +847,15 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	switch (size) {
 	case BPF_B:
 		emit(rv_lbu(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_H:
 		emit(rv_lhu(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_W:
 		emit(rv_lw(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_DW:
 		emit(rv_lw(lo(rd), 0, RV_REG_T0), ctx);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
