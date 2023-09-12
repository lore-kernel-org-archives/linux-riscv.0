Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29AEE801F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvEqVGfZbkVaTNyGFjV/K9N3k1wYCcI6dO8LMkR44iY=; b=pkqjmj9C69B9Ye
	89fFJqBZKWetGV2Pjx4CgmLAVmomnkl4s4Ry96oG4EvisSIQ9qhA/aFsFkTNaOjxHNmle3mTzKQ5P
	Dc6nWSvzdUBxCk5QqVsJbM/V5BoD5YyNYCRd4+48d1QppLiIRc+ALsEph86kO4gkbEf7u9SN57UR4
	18JhRL1Vp+tJKPoGRek1c8Wro98V00qREve6Aa9gXB5OhoonUDG65JQUAfrlLRIulRcF2p3Q6/Ypm
	TCRlBepWvS1luoK7/qBUV+rLZm6lqF/Rt9PbmhBEofz5CXX3HXPg+prB8LvKaOpqEzNE/bOE+mjDd
	WWNGO0EXyBMRz2I/mR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCA3-004DKs-0c;
	Tue, 12 Sep 2023 22:47:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9v-004DET-1O;
	Tue, 12 Sep 2023 22:47:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401da71b7faso72322055e9.2;
        Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558821; x=1695163621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kqE25xddEGWdkAd5IJWaOPr3bcznXZB6DbOZ/MzuKY=;
        b=RRxzcUoGSEc9HhmTAzx4TIGy4IsMb45Qkd1kf/JlGPDR01cc34K52Cdjhsop4r6oCt
         VIKX4ueFdaQMzN+HcV4dhAj0Fb9P657gjexW1QsHPSd661mj1gUcsOEUbLSuh0Fq4FEx
         9dKAYrYi5j1Oq+yVwrxSYUx/TvQ4FPy3ty1ac4YOVVrUYI5LGIcolT40vilz7U0ZAfcy
         yyL7oSRRrzHefzj5xztRh6ww47+IzvN5TlilxeyJQAgDKiNkIZ8/GO8nJYJH0QpPnCsZ
         E3LhcBUct3NJbz549OjoNW7mqEDLsZWMzY0y1yvjHlhIfzZBVUP1j35KhoHqOsI7eEYm
         eofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558821; x=1695163621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kqE25xddEGWdkAd5IJWaOPr3bcznXZB6DbOZ/MzuKY=;
        b=WIwlg0zZm/kbgUR1kFQzv0BjpP2dJOmKxWIgtxDOs08uwM/LhGqKZCFfoNd0/1cypZ
         zIRbKeXfiXcphsl2FGwYfKzjx4mRjvR4szAuz10KB9dUdeUEdeljsAIBqT8h+3Y40pns
         cDv9Ce8PXHKMnEgZkmDnVezhnblvAJoM+v/QLpkP2L7uYvAokhfBjCF2kPlnOpO3aLzA
         UfZDiH36JmRUtYh/mpeDjNXqHff/ubrEF9Zz87Axe6523TGkoDnE27IBtU+KaE//pKYc
         aLVCf6RnDyYVdpktUg0j9CHLUUsODn1O0hQACT07u5cxUn07GHE6381pXzcWNlCLMWQh
         BIWQ==
X-Gm-Message-State: AOJu0YzWNbZX/HJC9RuF0gj4zFlc8iK0+BlaSZd6jxd086pk7MP92yyd
	KC1K6E13u7W0UBoo6o92ux5uejXgF50wbW3PjMKYLg==
X-Google-Smtp-Source: AGHT+IFtRPmqCA45qZeOfe4gap2/v8LgzERhETar42HTdZcTU3NFDWNWl1Q7ouaYhNuNBRQewOmqOA==
X-Received: by 2002:a7b:cbcc:0:b0:3fe:db1b:8c39 with SMTP id n12-20020a7bcbcc000000b003fedb1b8c39mr604002wmi.41.1694558821453;
        Tue, 12 Sep 2023 15:47:01 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:01 -0700 (PDT)
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
Subject: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
Date: Tue, 12 Sep 2023 22:46:53 +0000
Message-Id: <20230912224654.6556-6-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154703_484068_EEA56061 
X-CRM114-Status: GOOD (  11.91  )
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
 arch/arm/net/bpf_jit_32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 6a1c9fca5260..757a99febba5 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1081,20 +1081,17 @@ static inline void emit_ldx_r(const s8 dst[], const s8 src,
 	case BPF_B:
 		/* Load a Byte */
 		emit(ARM_LDRB_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_H:
 		/* Load a HalfWord */
 		emit(ARM_LDRH_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_W:
 		/* Load a Word */
 		emit(ARM_LDR_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_DW:
 		/* Load a Double Word */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
