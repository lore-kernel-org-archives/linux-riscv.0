Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AC9C25B6F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDnOGGhHO1/zVIVSmg4Fc48Vf+ApevGCKpXqmBw2SFA=; b=IxHjvM9fSgTxQ6
	V0AHJ/xZzRYMT85BO0nWg7XTfGY3MScY4/t7Rb6/D+cIGb1btmozLpErHIQq8XQ/00B04xtfBEDep
	MTrqiruHa4zw6rf9DBVj5RrIgEQHyIrfsAu1piOD2Rbb5mNMBKm8xvTLeJXf2MD0yb0uFW4bDqgza
	5UIrIxdHf3itDQrSThUkDbXs8PEoWo3obZAbwFnc+fhe6H8HQE9kQrev1wosKEtIYEo08gIrwCVyg
	YduvlwzbcekUKP23CtgYsiplZXJPs7YQFBo0F30o0qLVIsbPNnbLS1x2a9HKQNPf37kzgmYIbk6N4
	W+Q4fX0mhSIUGVnu0QIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qviks-00CsJw-1j;
	Wed, 25 Oct 2023 18:37:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikn-00CsHV-2t
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:37:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-27d0e3d823fso8502a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698259036; x=1698863836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWDZyqBJhOVpYqYhwbudR4lRinTiZ1fIB/oQ8fHi3tg=;
        b=VEp1S1sLCzeMm0J1VURnOxSNW9oPq7KILN3etnJbuuu9KFwo+fRMRevX400rge/fg2
         97TxyTzO0yMabaqFT3a4alfMrtJG5fq+mfl0TGGMF8S8xBAFzjmOO2SU3v9bUcAaKdUP
         ID30W9jiCJgACOUyR3vhqqyGBUQHen96Fm8rVLrWIOSb1ZSJfT9rQEbeSqCD0rhSGSMN
         VjJDKyqV8Q/VdYoolUOJKKAheZNxNyB386CI59JdlCheG1mdg9dri5ORziKUaJhi1744
         PrSx1FmLDX+wthlP+HS75zB/dZvLLaqkGsCYAoL6oanKGW5IQkz4uN42S6yec05WmjLL
         JVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698259036; x=1698863836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWDZyqBJhOVpYqYhwbudR4lRinTiZ1fIB/oQ8fHi3tg=;
        b=uJSJZaQwFvDbdW/Rak9z0DS0WOEVuj6cVorgMkkdaEogafHcu4XbUGt71AE+iKFyUB
         D00JBF13PriJNg3QDLfGAZU/7jkZ/9ga1XNRYJCUQvPPeRH3470HhU8KfRlPoWrMLX0P
         cBogVcD+RrFj8Lx+8LLm81DP50lw95Z958ME2AKxph1qpmD8dHVOC0UQQxTDCNvMS9f2
         Cc7LaEMRf9Lo5uWXXBYpUPV29W80KMbOg17tXUcND7LnU+Poq6BQG+H6PG6d4xYlt6Eo
         aO33epfWPLWK3uMD/2cBf7DsZXPMULkM6ep9VFix2gScvJD66/r4LJ7or18qnqgTrdjn
         1W4g==
X-Gm-Message-State: AOJu0Yx/47otkek98OcN7hEGlRYD1IzLNnsz7+aCkIW3s5MeOrrkXV6F
	1lzX/efPAWsnq+0sMW4S2mlY7g==
X-Google-Smtp-Source: AGHT+IFOJxOczYNy9csjaf/jWys3suT6WH12pXc8zs4hoIeoK9YHwvDMemywNi2gacyq+/6UAnDc7Q==
X-Received: by 2002:a17:90b:4a8f:b0:27d:b885:17f2 with SMTP id lp15-20020a17090b4a8f00b0027db88517f2mr12749747pjb.30.1698259035682;
        Wed, 25 Oct 2023 11:37:15 -0700 (PDT)
Received: from localhost.localdomain ([49.216.222.119])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090adb0300b00278f1512dd9sm212367pjv.32.2023.10.25.11.37.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Oct 2023 11:37:15 -0700 (PDT)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	heiko@sntech.de,
	ebiggers@kernel.org,
	ardb@kernel.org,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH 05/12] crypto: scatterwalk - Add scatterwalk_next() to get the next scatterlist in scatter_walk
Date: Thu, 26 Oct 2023 02:36:37 +0800
Message-Id: <20231025183644.8735-6-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231025183644.8735-1-jerry.shih@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_113717_933910_ED211D27 
X-CRM114-Status: GOOD (  11.82  )
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

In some situations, we might split the `skcipher_request` into several
segments. When we try to move to next segment, we might use
`scatterwalk_ffwd()` to get the corresponding `scatterlist` iterating from
the head of `scatterlist`.

This helper function could just gather the information in `skcipher_walk`
and move to next `scatterlist` directly.

Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 include/crypto/scatterwalk.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 32fc4473175b..b1a90afe695d 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -98,7 +98,12 @@ void scatterwalk_map_and_copy(void *buf, struct scatterlist *sg,
 			      unsigned int start, unsigned int nbytes, int out);
 
 struct scatterlist *scatterwalk_ffwd(struct scatterlist dst[2],
-				     struct scatterlist *src,
-				     unsigned int len);
+				     struct scatterlist *src, unsigned int len);
+
+static inline struct scatterlist *scatterwalk_next(struct scatterlist dst[2],
+						   struct scatter_walk *src)
+{
+	return scatterwalk_ffwd(dst, src->sg, src->offset - src->sg->offset);
+}
 
 #endif  /* _CRYPTO_SCATTERWALK_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
