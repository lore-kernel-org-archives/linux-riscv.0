Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F69C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 00:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WB8CRBIR+tR2NzQnh+qH3jEAwv0fnQDI+UZgBvgZCu8=; b=1KohX5DP/zz46M
	KtZ9wmb8mK2KLyXmsK5pSlEMbDVwRmhbGBijGEhvBIXU6MDURjzP+WfXXNm7jnjcTQWyayOhOf8Dt
	qNG3npN4D2lbiLh8/wl99LmfBjjlcLSjFDBkUja2Gm8s2Xmv2w0gz19AR0o2FxmvSOQrQnsjkEm7x
	LcMdZfa2NUadgkZvHMNo2Lskmu/cBqMj6Iq+jQp3VufVayARfQD7PqKPUcDUY890e0NSYLGUrwYcG
	e/K2eIaUrCc1ibzbCguxjKfSzpLDDQZTDVwqlekybvNnMqktdPDLpLcK/ZRwg9kyCk/JwRQcg1O/Z
	d3U9eJSu5bkyRM3KGeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbr0T-00000006f63-2Zv4;
	Thu, 08 Aug 2024 00:27:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbr0P-00000006f0R-3hvH
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 00:27:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fed72d23a7so4472705ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 17:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723076869; x=1723681669; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMCnmdcZgvzSJd0o4YZGau9nL4J4n+yPR6pjHiIEuKs=;
        b=qAmZ5ont0KFJ0jWyLG+N7VL5Te5xGzhktCt7KOWTc9hmOqDC895bfQPXnwicVjeck2
         U8KDpJvuO6bRuMNHTBpPtxZXdnj/XWLgJPTyb2gsnkZiihFrO7Lc0Qq7L7Jh3UFznMF+
         4gVw273oMwZmzVz5zTVNp62BxJgNPUj/fYiwSs3n1fROcwuSdmBGXVtFe27l/reZGleD
         +7AQ0KHevO8jwV1wg+JXSEiDeISQz3yp1qfWIPbAgr9HOA2bSuEoiTOPYLDtQA9IcGoZ
         472dnoNXsbD5U1gOoIdLXS/xULd5c1Jc/erc0B0An5RQ9mud44VqM9zXwZCECWaGcEug
         X7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723076869; x=1723681669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMCnmdcZgvzSJd0o4YZGau9nL4J4n+yPR6pjHiIEuKs=;
        b=vkkzeotTVlTSu4i5DMh4ZmYzZOX2/VynynJlHbRMJWJHOtGO4f4ZXzEKAjODCRnk6h
         XEmDzKptDq7BinhlUR8XbI2zuObmIll+E5DkVsw2iGj4Feq4DOqr95F6JGKKLMcymjeC
         31q4TH/4eSU78XfzhD6z7ouVR8UClYFaOwK5/77Q3FUn1Yzi4a4QX1LNN9HKNkcQnPHA
         K6rwno6/ebDZ6ufYqYEU8cszyuYHvdbuRv6+lXsumTArA5S7LG0nL3GBUkYnfCEsVQVr
         Uv7KsbbBqdxUwaA1BA4LkE22iVfzb1G4+1fsccI6xxeubkEQn8SG7xBsuh2rRS5mXVut
         AruQ==
X-Gm-Message-State: AOJu0YynUrSfJvaP7vYOwZi+CwsY7ks6BIB13pE7mmJKa1qWQPqA4gYy
	96GclmymiOwcGJ2l9B5go7IBHxf816iDxKTSdu3/DpOMHsYvb/1jO+eIbk8wnFZAcXf/I1Uqcxx
	o
X-Google-Smtp-Source: AGHT+IF6WhApaAmTvQg5R+K6rlrg18SJbE+TpPymw85NtHx9975p3ORyi+6PJGAGtq5rUai5pIM1Kw==
X-Received: by 2002:a17:903:1c5:b0:1fb:3d7:1d01 with SMTP id d9443c01a7336-200952e51bdmr3299615ad.59.1723076868899;
        Wed, 07 Aug 2024 17:27:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f2172esm112242445ad.5.2024.08.07.17.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 17:27:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 07 Aug 2024 17:27:42 -0700
Subject: [PATCH] riscv: Make riscv_isa_vendor_ext_andes array static
MIME-Version: 1.0
Message-Id: <20240807-make_andes_static-v1-1-b64bf4c3d941@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAP4QtGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNz3dzE7NT4xLyU1OL44pLEksxk3dRkUyOTpMRUI8M0IyWgvoKi1LT
 MCrCZ0bG1tQAwN9pGYwAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723076867; l=1059;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=DQwLqUHrTK1JlrmD8XgoTRvGDFVdZClo7VKPzlh1pR4=;
 b=yjn0YLa8jHNQbhhGJyhPs89KWIRTKOoXHsaOaN6uGWpNTVy/6gA/3PERl6LtmukFHt+s7s/oh
 YZk4FVrOb9NAoxy5OF/zwR0agBR5GObQPGv9xdo0mIagRUDQhzBOlHU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_172749_960600_C0EBC3C5 
X-CRM114-Status: UNSURE (   9.70  )
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

Since this array is only used in this file, it should be static.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407241530.ej5SVgX1-lkp@intel.com/
---
 arch/riscv/kernel/vendor_extensions/andes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions/andes.c b/arch/riscv/kernel/vendor_extensions/andes.c
index ec688c88456a..51f302b6d503 100644
--- a/arch/riscv/kernel/vendor_extensions/andes.c
+++ b/arch/riscv/kernel/vendor_extensions/andes.c
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 /* All Andes vendor extensions supported in Linux */
-const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
 };
 

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240807-make_andes_static-ec524bae21f2
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
