Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D05C07D5B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll4xGcIR5oBIqRPZsNI4DdrDw4pk23fFeFXRgXTbE7s=; b=g0jzSWESXfrWve
	GKtmtYCZ04NC9MhKUJRdnj/cNgqGJ8KfeKKJiS+xYvGd3J8WQuVyyxXbehshEM4l7WMKxOx74pqNa
	af0WsmXlsY1bo/VCv7ipkoxsnEMATzKQ6el2aQSnPCEzE/unEwsTiN72L0iGqydVIsxakS/RT9R95
	05F1XllQynVcNwBwlvH94jRbOkebDfFD8Khw9As8fh7OZ7DwaEN0Cl3K23EfzY9MK5YTE2ZTu35pi
	vqNJp5lhDPj8Hdbc4C/ZuZJdinxv1FxgTqLEzf6Cwq7+BTG0ACP6LTesVPKA1l10cLZTvLR+P2gGC
	er2lKeBq7xBARieyN8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViQ-001esA-22;
	Mon, 27 Nov 2023 07:07:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViM-001eqU-0V
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 07:07:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cfc35090b0so6525645ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701068848; x=1701673648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9NcydlPjJuZdBvk47SliSWRPXO51iH+ClRWgIXdngI=;
        b=BcJrbVspd9KKZjBqq9xWXD4lFxmOlG/vOEioIassLVAbw4yVjLI8e4AG4LHc99k0qu
         dUV9xGJJzNHM0PtbM6DZid0m04wK/Px/V9+fJgppcLvtfbpgyp3ai2PF13XLXqDzh+Sm
         mQS6buDRDCtVfoP+rTkh5GXGFIyxYB4RqRhIHaOhJCTCm7nS8PsRIpZRUcM2VUQzwq0m
         HUsI0V60veAWOjm4APiaA0LnSjZA1yiWPrl7Sv+nJwAMU4hpNCqs/X1f2Jy/i491oUbh
         /9Zb0aBjJAek/KNeSCbHgc2al9a0JiKdU3Wy7uCEqa4zaBdJG2h4E53+mMhiKAN+daR+
         IUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068848; x=1701673648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9NcydlPjJuZdBvk47SliSWRPXO51iH+ClRWgIXdngI=;
        b=Y/LopBQbiiXCTcZ6ErIrPwcs0Qc/IxzAR7ZXHO8TDyGIUUK6DHRAqHK5vxGNuQ43S7
         UJ217bEMHiTKCCbZeQYTyfvFlbd08FwgBoZhFH4ADd+GG+qBKoPrSXNxpqx6LcXtAanM
         pnvjtmyosK7bhc/K1u6PSvtx3LYhSQLX0HGWDmoCJMV4GidCP1OELL5pDNVgaXbBp6l7
         +N6ZAEIHl4vBfWXLTMYIa9yJeGo84KTcftxFVEO26nX2REm66vcz0z4NScteOYT6cs4G
         uvduGo8AAEQCmiA39Tk2f1kvhWpumKMcWjCLXQ1A7Q0ciS2UNRXCOKiZ1YFw7WHm0fmr
         OXsQ==
X-Gm-Message-State: AOJu0Yyc/ovPlhNUXgFzZopKrFkJ+p9m4dXMTDZotPA6gRANc9ZSkJCa
	qK/CQcUVXhAkTM60NQudlKb5Bg==
X-Google-Smtp-Source: AGHT+IELRS3hxE4VCKaoEswdjN2LTSxsJZBADubHAmIAofnrpOYQED6FfVAgy1DMUxcK/odvBEY6yg==
X-Received: by 2002:a17:903:1d1:b0:1cf:d58b:da39 with SMTP id e17-20020a17090301d100b001cfd58bda39mr1135943plh.64.1701068848370;
        Sun, 26 Nov 2023 23:07:28 -0800 (PST)
Received: from localhost.localdomain ([101.10.45.230])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm1340134plb.77.2023.11.26.23.07.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:07:28 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd skcipher
Date: Mon, 27 Nov 2023 15:06:55 +0800
Message-Id: <20231127070703.1697-6-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231127070703.1697-1-jerry.shih@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230730_207280_A9E14715 
X-CRM114-Status: UNSURE (   9.02  )
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
