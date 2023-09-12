Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E7CEE3F39
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYP6gMexYOeZfmS54QuXEWKD2DhwUCOlEjfjFsdmchA=; b=IMD83UXG0eZIhu
	L+ot+f4lqt/GVey9uOZV7b2+8d0eu26Q8SJza5AeTpFECSXFMicBWuATVEPFOik2xy8Ans1zfa1yl
	2hPuKbEP8fHHfmEg97uq38IkPpq5b3W8H5qMTlh6ScnVWK6OujtiViBrCVWv3mQBhBVy8QAA9baBM
	ju2TWb4+XgBw3+4gjcECgKNtf82H+d7GTzr31/sbRD6pRi4/ydEQ/sbp/kWk1Wyb9GJ/PMAYXLbBs
	aJfut5Ikz0TQVq45MfxN/QFEZdWtsWTXaCW5Fe9cWaROKaINAm7wxn0lt82vKAWOI91f5L6isRO04
	h/Ln0CumY8Cz5MMPWpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCA0-004DIf-2W;
	Tue, 12 Sep 2023 22:47:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9u-004DDL-07;
	Tue, 12 Sep 2023 22:47:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31aec0a1a8bso205527f8f.0;
        Tue, 12 Sep 2023 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558819; x=1695163619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oda7cl9iVFTkbJ1PzPqgjhpi/bhkWFnkRBdUJ5tFX88=;
        b=jvlmWVLduXvlhjSI72Ozs0XgjOTvZvGVBbn3D0Cr+SrWk1Aqdrav9nSwlRv+sMwypx
         cnSRwR6VCcAV0EK4XjnJXnF6pLSFwv6QaglcYVaYxVjh/k2WCYGM0gmneXXKPzWQ4rew
         hKzs2gX4E+4MDjqMyzqlYkqGktIbq6mVOFcA+lorLT4M6QPmD8pV8aQOW0B03OQF5uRk
         5+TldeFGFDv87HbNc3a1JHSa2k8y6RSfJB0pxeWjhGViZxhe27oXyRO0G96jc6yC93LE
         ggGB8gibW2dnRb1v27l0u3nALprgNI+2s97lQw6OdLCskHPms/qcBc29UmGHYOqKGsan
         E9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558819; x=1695163619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oda7cl9iVFTkbJ1PzPqgjhpi/bhkWFnkRBdUJ5tFX88=;
        b=KqD2epvx8yIRDx1uDZHjQD1keDbpgMAU7FhXVZltE1Jfs9ZU0w32txFYdCy388voBB
         mtkmM624/A2AppiQ9GYTILz/t2d46O9AL7VUypvmSiyVh1s33XHAoZQ9pKj3HTtIWPZh
         nrHmhCVeuPezj84p+chtselTaz80CA9JMvXH4XBxPhSurLngn9B+cP/xOiq+4vhHJVnC
         88NYgM4M9FTkG8G+dT3p/GEurMic1rVgbSt1iTfTCnf3lPTOI+zlYtmheQ1/RkPqFIz6
         yRWfLpOmtX5RYdoTUuz7rqUJq17/t3BFsbxNDnaXpLwHnr/EMzFhm9TJ/HhsbPH1ogZH
         Uq8w==
X-Gm-Message-State: AOJu0YzU+s627FcqYS+/cVmlru3ZB7k1l4YzUKZ/Dl6Rf8t73+sG4wgN
	Vp8dGpO09vsrJtQdrbd2OTA=
X-Google-Smtp-Source: AGHT+IHcd9xLp1ws84Is5QLcU4SiUEHRnEtZ9HHHFgMinXaJVjwni/sneatzZERdYAHhMylr9POa6g==
X-Received: by 2002:a5d:484a:0:b0:31a:cca0:2f3a with SMTP id n10-20020a5d484a000000b0031acca02f3amr3150339wrs.0.1694558819326;
        Tue, 12 Sep 2023 15:46:59 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:59 -0700 (PDT)
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
Subject: [PATCH bpf-next 3/6] bpf, parisc32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:51 +0000
Message-Id: <20230912224654.6556-4-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154702_081050_1EFFE294 
X-CRM114-Status: GOOD (  11.67  )
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
 arch/parisc/net/bpf_jit_comp32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index 5ff0cf925fe9..cc3972d6c971 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -1026,18 +1026,15 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	switch (size) {
 	case BPF_B:
 		emit(hppa_ldb(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_H:
 		emit(hppa_ldh(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_W:
 		emit(hppa_ldw(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_DW:
 		emit(hppa_ldw(off + 0, srcreg, hi(rd)), ctx);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
