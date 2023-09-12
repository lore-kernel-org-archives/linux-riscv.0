Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81887EE3F39
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxg9xwxNZk1/N5HbBzRyjz6NPFcaCQ1Z/t3H+5rAKnw=; b=Jq0IQhr9vbqV5w
	QW3/fALtrBVlhytT8ty306wZSjThEELDDKdei0xcpR3+HCfPwYD9fYwfi5az9nH1GLph1jSNHCx5l
	J63dBqTd31L89xXy+7vdlKSNiGfAJRNlee2Rsa1+iVIIM4ymGQNkD1gf0Pi4cgBBFOX/fZj75eVBk
	2WbL7qWvq92k5jtl1zciBTEFxxBs1mtDktBwjidVYATn/7AcMP/9ipAcg4XSJF+sjECPlXg4l/xKD
	fQQn4vavrzlxAMCrJiikc5cQymhS+uY2K94SdeLTvu980GPNqqA9zrOmBMRzcEqYkT/ElzsHVH0In
	8aYm1MixulPv2d+Sz23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCA1-004DJ7-2k;
	Tue, 12 Sep 2023 22:47:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9u-004DEE-2s;
	Tue, 12 Sep 2023 22:47:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31aeef88a55so5761582f8f.2;
        Tue, 12 Sep 2023 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558820; x=1695163620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhUNqTKNJ5t40WxcJkQJJc6NwQozn+LNI3JL0/ULous=;
        b=OzrJS7uruqa48TL1qlc8nBDnkD+UHN6XYFr+w+LmQDn8m9dDoG3/8+GjVk//aud2qV
         zBvTns7ykKTbRejviWw1raHmw8Cl0YoHwqUaj+RDMYNr/b11xQ5OhIWubHVMh0oZ7DWP
         ABASUHfEfmhIY7C2nEsD/Us88TYh9XGp2cIM7gXbU2vEAy857fWN8C+JmVdyCV8GdNGB
         xijsJe8KsUedOXtbs3d/p/oAGJgOwTiWWPymT7j2FigLfdgffMg/ak4uvvNBgAGajXd3
         4kg1F0FVVCvq8FDONkEVuCAQQw0q+zxc1E1jZSahDO18fMt88VChCOBj+vvq57hVOUJf
         I1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558820; x=1695163620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhUNqTKNJ5t40WxcJkQJJc6NwQozn+LNI3JL0/ULous=;
        b=FBxX/R637PMeg05bt4rAxTI2fRtWX4DrBC2IXCStJJ9p1rJBPlhzzimlT+hNYc7FUB
         kxT5qN1poZhLgo2niM3mTMaYAlTQ1ndIeITPX3o5rhx7Q5TKZy89ihyv9nSoE29PTEi9
         E/AI7VIoPfIy0lhywz5s5vVaj8IH38LSoXx1lbnH4nbHpZ5XdSh0i4/viHmKt6xz+sTi
         32T5tJPi25woqDNN5cnnG+/BAx8fynTRqnoxKX1NtErD/rG5py/ZWTjI/9/ovl0lCxSL
         llv9VV9ArHXFXjxDZExPc85af67UiZ6VNcRfTP94nDs/deGekhEXE2ndW/N3aXLp134h
         HmQw==
X-Gm-Message-State: AOJu0YwLmD7QMOi8Da48fEgbz2ol1tOL1n6j35tc9GlpK6wCyRHvjS30
	43WCQkKwi6PRPf3gQ3e8m7s=
X-Google-Smtp-Source: AGHT+IFgAH0fOtyaF0ehV56I8y/PX0drowIs04cM59dILrqCnUI/euGHNvJaohPj3FXuSexhWOZw7g==
X-Received: by 2002:a5d:628c:0:b0:319:7a9f:c63 with SMTP id k12-20020a5d628c000000b003197a9f0c63mr718103wru.50.1694558820430;
        Tue, 12 Sep 2023 15:47:00 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:00 -0700 (PDT)
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
Subject: [PATCH bpf-next 4/6] bpf, powerpc32: Always zero extend for LDX
Date: Tue, 12 Sep 2023 22:46:52 +0000
Message-Id: <20230912224654.6556-5-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154702_927830_E917184F 
X-CRM114-Status: GOOD (  14.88  )
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
 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 7f91ea064c08..0a952a2cfaac 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -936,14 +936,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				PPC_BCC_SHORT(COND_GT, (ctx->idx + 4) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
-				 * For BPF_DW case, "li reg_h,0" would be needed when
-				 * !fp->aux->verifier_zext. Emit NOP otherwise.
+				 * For BPF_DW case, "li reg_h,0" would be needed emit NOP otherwise.
 				 *
 				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
 				 * if necessary. So, jump there insted of emitting an
 				 * additional "li reg_h,0" instruction.
 				 */
-				if (size == BPF_DW && !fp->aux->verifier_zext)
+				if (size == BPF_DW)
 					EMIT(PPC_RAW_LI(dst_reg_h, 0));
 				else
 					EMIT(PPC_RAW_NOP());
@@ -974,7 +973,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			}
 
-			if (size != BPF_DW && !fp->aux->verifier_zext)
+			if (size != BPF_DW)
 				EMIT(PPC_RAW_LI(dst_reg_h, 0));
 
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
@@ -982,20 +981,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				int jmp_off = 4;
 
 				/*
-				 * In case of BPF_DW, two lwz instructions are emitted, one
-				 * for higher 32-bit and another for lower 32-bit. So, set
-				 * ex->insn to the first of the two and jump over both
-				 * instructions in fixup.
-				 *
-				 * Similarly, with !verifier_zext, two instructions are
-				 * emitted for BPF_B/H/W case. So, set ex->insn to the
-				 * instruction that could fault and skip over both
-				 * instructions.
+				 * Two instructions are emitted for LDX.
+				 * So, set ex->insn to the instruction that could fault and skip
+				 * over both instructions.
 				 */
-				if (size == BPF_DW || !fp->aux->verifier_zext) {
-					insn_idx -= 1;
-					jmp_off += 4;
-				}
+				insn_idx -= 1;
+				jmp_off += 4;
 
 				ret = bpf_add_extable_entry(fp, image, pass, ctx, insn_idx,
 							    jmp_off, dst_reg);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
