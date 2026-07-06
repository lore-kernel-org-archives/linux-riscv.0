Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49677C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO9u+PEgM6Ds3DqzblrasnWAsa996XfK4JRzuBIv/40=; b=SguDhRDkvYdCfU
	7cdJ7Jw5KCdCE5/ZpD2K00gGBRRG1sHDIb6I5kyNrE/kYOwjMSs7nei0LBpTPudw/j+7iho2dYQnp
	uvZk07OKv+j1rZDE2mfMYmNunRDjtwo7PBH61Zb1DaOAaFSG24wI2fTA8uFbTi3Om0yQxdC//Hj74
	w44/cA7fUzd3S7CiLV/KgtEKs8uAv8VzCE3aG4PUeTDdXW7UnDxryMAtdXFwWfalyKZBxDxTlCsJe
	g8Hm/cfgE/AGZ0zG6LsV3mA99Hawyhkk9mRT6ZhjVWpujWAPRkrrg5qBCzb47jmznKMuEWiqUnb0u
	uVMbBOhpsj+BgvDZQfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn8K-0000000DCNc-3ygg;
	Mon, 06 Jul 2026 17:29:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn8F-0000000DCM7-1zPa
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:29:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3519124a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358962; x=1783963762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EpkLMFszm/nPT49Xmg8gx0H7X2O/Rvk7vOoUDq2KHI=;
        b=biIhmq4e+X0ct9IxzpfW5J2mVsH3n5A+RUw02ZILncgAW2/jFVFd5ZWSyqTsxVkgsq
         7YcqLoc3QPUOpsnrjG1s+RI9NbDsvEwRWevtszt9cSEtmIgNOEK+w8K7GKZAGdN9l6dm
         S2VcbMuapG4+KRFbbWwq+KFF+z8qIaNAzcJPVex8RTIvVH1UtgBgfD6+bh9cxj4cdcg8
         EIJvLFoIRYzugCvgDe9KrC9qeVV4+Oqeq//7hPiowAL/Q6tJvmk+zk2YfKhfHaezweuN
         hueX7ZKjrb6PfkTDwcqJuThLPGJK8g0nV7WK0chE9rui4/u7hSRZVpIlsLUc8f53sin2
         87nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358962; x=1783963762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6EpkLMFszm/nPT49Xmg8gx0H7X2O/Rvk7vOoUDq2KHI=;
        b=c3XE9qfNodO9kyry/UI+KgazdqB+UoX9yBtheSVDh5vqvLbt6+cmg2CJQ/+2OPGPPH
         pMw7noi45eSBtwOd3g1RjZmFthV4FJ724oXmI/cs26ct6AZhcxthngCPGobh4d5evN2Z
         7m+G8AcCX7bmIVG4L15krjr0e0ANghEPme6TIed13mU72CS4UvzMgdRgwXZb3RoPVeMp
         G8n3dPbdSt2w/hnIxMnv1lH8ZciLdGOAWkj73D0vPpkmf/8UgZ9Y/6a03Scy1c8QHG9O
         1GtsS31WXhYsByPPSKs2pG7H23zHIvp79PUfEEUWp6xDyH/Q9/yvGNzcOf8XvbJ+5tOX
         JsGA==
X-Forwarded-Encrypted: i=1; AHgh+Rpaa/bgTnpQfTTfAQrn33y4oQyA+59F6nxz7757nZCztaRibZTBn9ryAsajgKemKo5OlmNqlxU/IxpbIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyENc3jL8iqu6xRPVy5oPpm+QgHrVUSColsYZ480GsluqURqMW
	2eiZl6Fxsm4ujyL85TnhG5Q04LR2TokmeuzsKliPP/eytL60+J7XD3Gy
X-Gm-Gg: AfdE7clu6ZP2+WezjO5vjAzPwEtrg/HEnauDzlL+ok+fHap8voiFDmS0hb6k+nVh2t6
	lsJAZT/pH5/GZ5Qu0Og/iZFBaoCPgWHjE4LkQlIer2G7ynw6ZYNZctsxBechmGVsnwvV9xlWVYo
	VPrgTN5EUJzuFhABxpUNTDA28Ljo7JCaFtYHBGCfZ2P7GQFDOi5wlRYt2ZxWK73IFC52usV/V5p
	22Z+U3DUF/Hna/9nx/en4CU7c1aFPEOkRkw08xhsZW5ejGWmInS+NWKD37NWoLpo5HQdAbuwY4l
	G1r8t770LXH1v5zQfe2vsy8hbJssGxAD0rw9W7Fu9jgvhq/6dAzcctiB91Nnxt/S5Px8+iLCM1d
	s40s38NjS8BLC/u4JD2v7/OUk724g6oHg2KG8iBaTd5nLJFJKafYVyQ0oMfNvYwYFEaXgkSxG6K
	YLXKzyJBE7L8rEouklDFSnXp+ZgWkn+DNvO+WTD6H+Tl6TGBppN3WW4Ly6T8oXji29xC0P0Cgql
	pGuWZm3Q/yG8NUJepswxhw=
X-Received: by 2002:a17:902:cf0b:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ccbe7297fbmr15392495ad.20.1783358962288;
        Mon, 06 Jul 2026 10:29:22 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e54sm54667005ad.2.2026.07.06.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:29:21 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 2/3] riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
Date: Mon,  6 Jul 2026 17:28:45 +0000
Message-ID: <20260706172846.3876436-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
In-Reply-To: <20260706172846.3876436-1-visitorckw@gmail.com>
References: <20260706172846.3876436-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_102923_522066_B8FDBD79 
X-CRM114-Status: GOOD (  10.48  )
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
2.55.0.rc2.803.g1fd1e6609c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
