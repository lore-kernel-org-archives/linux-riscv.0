Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED98C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h6+AmPfbtr667Hom9YBX54F2n1iizoZuaBXbX6x6GUo=; b=THMDhsrWDN1AF8
	b0dZHfDWqPwSMjNBi0VfQjsGPN1XLCMohgNflnhHtCGGyYmW77iANCyenD13j/Dx/lboD1xEXeL4U
	4UWK5yw5yLgYiw19HqbOWXRbwEw1xZXGeLAvoRlNMhJmLAb9Yg5cVr5QD5RMP/he6Rduy0BucgFYn
	b3HsJfU1aWKJPSUWKuaTF1nByVNkFNFYkF9DKJvMw13rjdmTwYT/YRz8gd+ZqcTvKA9Goa33zcgIA
	A/ko27k8A+spgWFRoaVt7Ns6mZIOS11DgnEgysKk1jyuSwzfp0e8+8fA2qs7xJgUZv8apSJbbNIkF
	zez53mSnvae7633iWIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNv-00000004vh2-1z8j;
	Wed, 24 Apr 2024 16:22:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNr-00000004vfz-3VHp
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 16:22:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ab88634cfaso93201a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713975730; x=1714580530; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNIeOZiS9nBIx/zhnBQ64j5+1y87GOcgImJKTHZXk3c=;
        b=VHma46yOTshlfr5Du6v+iMbuRjF889mRtNzoTmdA+ps4co1ixTjGU/xwsYjN3z0Rij
         v+jVZbUN2C41up0Lfk+VI0LcnA5IYbpw1iYj1oVAybZ9DuRtTdMyWVC3uoQeMpjJAFQF
         UhiF77Es315jPabLJBhH8F2/c+QNKCYW3y9cPQ/tHHNDrs4KmzVgjGHW7laliqBWLnVy
         ymE8pwSFtjCx8+SnOk/MYvhEcAQ48pXl343d0emcFVbUqqHg8byp/Wl1IFXFrOUxbTOV
         1oK9TSyYVv0Mw5S7aes2iPd3J8voWHsagW7Y2DSgAvqdYtqhi+2PMNNc+FuWV3P4b4w0
         trnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975730; x=1714580530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNIeOZiS9nBIx/zhnBQ64j5+1y87GOcgImJKTHZXk3c=;
        b=au/z11ezFnSYyAHB/Ksiqz2zEU++c8vW9hAqH/V1kP2xnUY8GAAzdD5Kb6M7EQJS6U
         TDJpUH/N29NXBHviuyY1eIzBiIBSM/vEBKfdHPTyWCNjuVKhARoIBOoRIXv/6jHJNGd3
         ixs7b0dvhpmokmy2TeoKf4CpGmX1RV6r5Q4Fot/QNA7e5nkyrv4Jgv5kNd2PDTM/NXWP
         XxpItQO0JsJFVTKgMUjayU7pzLQR+2h16RDlp18CHUNOfswo9BZijWMIW3UylWVc0/R0
         PqB1SeeGdjzss6jVsaksNWB2WlKwGE6RtAjzcyslr8wA3SLHnPrXcR3NJfylcELJ0knF
         CuGw==
X-Forwarded-Encrypted: i=1; AJvYcCWPnQdSrITT2sj5wjuU4LbPrK4i5WWRMec6cX9SJetgXpzIskeo2duEGH4PlUA/tpyl1Kfkc58eBMNQ64FY9NzxnvBPbXydgcw76b8w2TmX
X-Gm-Message-State: AOJu0YybHxoHSjHLtuYNx/jRZY9mGNmThhr1WZxD+F6Q/hK0VvfB0+Ko
	OpDrrIQnwQ/ttgAdrY8I17RS+yxifpZL6t+Wpk0bGlEoJYGIJanzL2UP7Lu+HeA=
X-Google-Smtp-Source: AGHT+IHGXdidgi2yVqRH2s5g5jedXlF5Xbr+JP531Jndv8iVqLWnsM7Pli5LuTsPhKZYju9fYWCceg==
X-Received: by 2002:a17:90b:1e03:b0:2ac:7a05:183c with SMTP id pg3-20020a17090b1e0300b002ac7a05183cmr2600490pjb.10.1713975729905;
        Wed, 24 Apr 2024 09:22:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a1c0800b002a610ef880bsm14505760pjs.6.2024.04.24.09.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 09:22:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Extension parsing fixes
Date: Wed, 24 Apr 2024 09:19:53 -0700
Message-Id: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACkxKWYC/x3LQQqAIBRF0a3EHyeYCWJbiYiyV/1JiWYE4d6Th
 ofLfSkiMCJ11UsBN0c+j4Kmrsjt07FB8FJMSiottdLC+bRiulLAuPKDKGwzw+nF2BaGyuYD/lC
 ufsj5A80LfcFiAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713975728; l=1536;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BBjNbbZnrij0HVdKgO+X2yPDVxdOBtm9/R4eVQuo8fI=;
 b=vuBH8zqF3F35tZsdXWL7gEJ0v5OT6H3bR4Qv3pePKjdqxmegKpYuAYsfgUmDUffPVsIHQhgh3
 Z+QOxdKNPlWBtMXQifiFp5CZjY+NzuRCZu7zsrPTMG9CKq9JUQzugwP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_092212_020222_CAC8E635 
X-CRM114-Status: UNSURE (   8.53  )
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

This series contains two minor fixes for the extension parsing in
cpufeature.c.

Some T-Head boards without vector 1.0 support report "v" in the isa
string in their DT which will cause the kernel to run vector code. The
code to blacklist "v" from these boards was doing so by using
riscv_cached_mvendorid() which has not been populated at the time of
extension parsing. This fix instead greedily reads the mvendorid CSR of
the boot hart to determine if the cpu is from T-Head.

The other fix is for an incorrect indexing bug. riscv extensions
sometimes imply other extensions. When adding these "subset" extensions
to the harware capabilities array, they need to be checked if they are
valid. The current code only checks if the extension that is including
other extensions is valid and not the subset extensions.  

These patches were previously included in:
https://lore.kernel.org/lkml/20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: cpufeature: Fix thead vector hwcap removal
      riscv: cpufeature: Fix extension subset checking

 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 14 +++++++++++---
 3 files changed, 49 insertions(+), 7 deletions(-)
---
base-commit: ed30a4a51bb196781c8058073ea720133a65596f
change-id: 20240424-cpufeature_fixes-91bec4d793e7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
