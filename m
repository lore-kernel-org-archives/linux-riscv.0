Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF6C10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll4xGcIR5oBIqRPZsNI4DdrDw4pk23fFeFXRgXTbE7s=; b=DHrWQJFbxtWgVE
	eKcrcw+9X2ZMtd+zINuQkzH99l5MPCm3AcInLwrXNckb6XtVDjEVTliVMvupFNHGXaaIllzo25bQU
	/P07W/E3vcGPjW1yZH3S6kQebFOX1635vytDiqM0vjrnR6PHJrrdD00cVS9FAQs4Nfwk1aJWSc9e4
	R2Nply2RhKVF05m9u764/nGzyxo5UMMfuX41hdnfoQNVYoxgsIcViZblINyngsHkBWgrsqLLHpZdE
	aqokgmgeVX3GAyQYXMxudnTrDCqPcqOY6UQbrMS2U+1TEq3H7FhSF/eixvQzObQB5V2TdpB3D9Q9A
	ViHR6O2RX4DA6Jax8Zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARjE-006njA-32;
	Tue, 05 Dec 2023 09:28:32 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARjB-006nfM-2i
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:28:31 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b84e328327so3073681b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 01:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701768508; x=1702373308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9NcydlPjJuZdBvk47SliSWRPXO51iH+ClRWgIXdngI=;
        b=kMWlO9IJsNXWjRWr+dtnbgktw4khdpDy9KGw3xMmCLqS40e8BnaAfAd4oSjnbVq8Lm
         QxlIivwJUkT0Lt8mzbHdHwSqLcf8VHntAIfgjlE9ji6XU4YJO6601l+zRnPL2AAIZ4zS
         0UPRTUcmnKBvD8di7Uas0/XxJmer53F2THlfsbYpeEID4sfzvzFkkK+CdFRxEsrvn/dq
         8FcsC2y6rXvmcctqiISGUV1Ajs8c1ZZkGhw5iPWJKa8hEvgFM3Nn3HJ8CqvKm9jDGiXS
         wUEc7kzt6QU4uPcaJ5Gtg+NrYgdFoCiqYSSfHvB9SxZ9rYlHMW9UZeE6xHBPXa3zXC59
         3okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768508; x=1702373308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9NcydlPjJuZdBvk47SliSWRPXO51iH+ClRWgIXdngI=;
        b=cv3a9TR79IANT7zcxlcKePFPf2cGZaNczqQrnxtxVPI4sw6/AKaMh8eA1kARg9U2x4
         ssyj+oZO8PGe5lxJFP0iDDztw9njpSKUMnTUJ3zB3uDsN7+vKPUEN+f6+5/ip0Dj0Ydd
         mwPywqz37ZjheT7wjE2BL9Zfj69PrAz+4GyBVwEV2LvWPfMLo9gE6QEz27mUDi+2sN94
         DQ/MI96VPmzorTvVaZazKwtgIEb686P0RekcpZZHoCLGkjeHiQ4/+jjzab7MHwRjJjQO
         aDI/BoPL+z9Fh8ndtpXRts0QWZbuOSVHA2Gkjv0echRbjirFh0mcuNSdtO6Blyrv8m14
         ObNw==
X-Gm-Message-State: AOJu0YxKC6hrKGnHyGIciAVN/B73ylGl/K0EmlB5EneBPfWluqfq+8xG
	m+QN5AWYPDYRVHuH18vU0dgoGw==
X-Google-Smtp-Source: AGHT+IHZ3EK+AWz07LHe5BsDXoplI+8JX1FVHrlgMUB8wBmoWXqufxaT2Ka9FS50Dim4x8aDAfAYQQ==
X-Received: by 2002:a05:6808:16a7:b0:3b8:44dc:7ce0 with SMTP id bb39-20020a05680816a700b003b844dc7ce0mr7330943oib.2.1701768508622;
        Tue, 05 Dec 2023 01:28:28 -0800 (PST)
Received: from localhost.localdomain ([101.10.93.135])
        by smtp.gmail.com with ESMTPSA id l6-20020a056a00140600b006cdd723bb6fsm8858788pfu.115.2023.12.05.01.28.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2023 01:28:28 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org,
	conor@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v3 05/12] crypto: simd - Update `walksize` in simd skcipher
Date: Tue,  5 Dec 2023 17:27:54 +0800
Message-Id: <20231205092801.1335-6-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231205092801.1335-1-jerry.shih@sifive.com>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_012829_895453_60D8F757 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

The `walksize` assignment is missed in simd skcipher.

Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 crypto/cryptd.c | 1 +
 crypto/simd.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/crypto/cryptd.c b/crypto/cryptd.c
index bbcc368b6a55..253d13504ccb 100644
--- a/crypto/cryptd.c
+++ b/crypto/cryptd.c
@@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
 		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
 	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
+	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
 	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
 	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);
 
diff --git a/crypto/simd.c b/crypto/simd.c
index edaa479a1ec5..ea0caabf90f1 100644
--- a/crypto/simd.c
+++ b/crypto/simd.c
@@ -181,6 +181,7 @@ struct simd_skcipher_alg *simd_skcipher_create_compat(const char *algname,
 
 	alg->ivsize = ialg->ivsize;
 	alg->chunksize = ialg->chunksize;
+	alg->walksize = ialg->walksize;
 	alg->min_keysize = ialg->min_keysize;
 	alg->max_keysize = ialg->max_keysize;
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
