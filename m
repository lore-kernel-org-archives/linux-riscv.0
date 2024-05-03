Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E037C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC66BESg4GM8udEhAi85IgzpWSboI1d0M9uYyOvS4TA=; b=Sm9AyLacSxILJY
	XRO2q+QaymVfsf2k+H/Z9PGQRB1hDVBmYrS4jIvCx5tS7q7ICLz2YK3ue08GpTuOYgVWonPhH8Y84
	6EoOLch954mSSkHyOK4LoCKh/GKWLzAj1LrEYAp9IxBtTXif+cBBlXa+80YH9Mnc3UPoWnjAAok3w
	1Fog2zkPtPmzg3nxv2pxRGzCNpqzfgpS5ffQyQeGoGWphHHiRzZkVQSVSZJZR1U3A2rT+p1RHqsZr
	sfbCldlmdCt3a910sGt4WrW77mC+LUGVnFss/wTPJ8zj91tUyop6Y0oZzFkQvt/w3ZhMyto0QY/n3
	oGwaFCaXYt+zo5aygSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kt1-0000000F4iB-2fqO;
	Fri, 03 May 2024 04:51:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ksx-0000000F4ex-3mCM
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:51:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f30f69a958so7568802b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711862; x=1715316662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtwC5CithaOsyDnX18EUQqmgLnixhsZn53ghod6HD4Y=;
        b=3bmBUw+KsCSrQgpifnXe67wFf/VTuvM41XCg4oZWOZWmqlnEOGg9QKiAi5Dzm1oifS
         BSgPKgtsSx6T7xJJLB9rXRFO40ibv097GoJ1XW6jUsKYRWrpfgje9bkA6ydWJovbIWOC
         A8SHS0xS+NLNuH4zQqqicLpyvOA8f9oBXAOtqYlGnuCFxv+ebvLxC00kz25nLF02OG6Y
         EjkJFkK0xV/6OBbtYx35qQYwaBDnZq0Xld973yndND1OGePOUjM5CsnfCjdBiWZKcbbL
         fo+KuCciQaOET6ot6YhOJQ7d5YZAG0pBDIo8fmnS9tXS4DGPbbFLok1T9WvzBn6xvz6B
         19zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711862; x=1715316662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtwC5CithaOsyDnX18EUQqmgLnixhsZn53ghod6HD4Y=;
        b=ustwTa6vCEI2TFPWdSZK2RKbCWEpHpjJcD9zf6kfhF8/OrxJ7sQPF9k5m1DrJI7UcW
         JSWxtnhGGWdfQFAUa73S52PM+vdb15adshn4kRa30OddxMxS4eGmCFAWCJxjiEHYiCyo
         qHDx/tMtQDZKA1ZhEMHtHMf+x8bMqzw4aYNQ72rQfyEDs6sIEIzWwMIboNuuI9ixsqW2
         MNClsihQloUZuYsKd8QwEg7w1vd26JULnsVuTi3EI0f2t3drIPhHY56NKCLiUMvo+wTf
         x6gKGhkLQQlB5Rhlw3OwhzqyL5tVDObvsTzFBf+XA90569bF5eXqQKPvLc4aQTExtpGW
         j0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLGz2DAhFhJBzvHxBb/sslJ/g2bA+2s2MVO2SgYPtl9TgtX5VHGylhsHxN+mlQRKFh8/EvdONc3EThiemDVVzRFy8Wjpt7AGwl3jJ4Gxuo
X-Gm-Message-State: AOJu0YyVkczpoLYjs0MGGiygi/PmBylWt/7f99d2e8K6gWIHyxrLN2qp
	f829i37PF/NZ/XWABz/TMCI7SdxdjehyP7Cwo6KIKlWYerm9ELuNJuC11/LpYrk=
X-Google-Smtp-Source: AGHT+IHfmJLnWNlQ+jLqowVWeSehnNZwiNPlCiwptv1oonBtcaPkYBu1VzKgOUEcLWxXtlfYGmWvRw==
X-Received: by 2002:a05:6a20:258c:b0:1a9:ffa0:d007 with SMTP id k12-20020a056a20258c00b001a9ffa0d007mr1997150pzd.58.1714711861757;
        Thu, 02 May 2024 21:51:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001e3c77db2aesm2276384plb.88.2024.05.02.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:50:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:50:51 -0700
Subject: [PATCH v4 2/2] riscv: cpufeature: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240502-cpufeature_fixes-v4-2-b3d1a088722d@rivosinc.com>
References: <20240502-cpufeature_fixes-v4-0-b3d1a088722d@rivosinc.com>
In-Reply-To: <20240502-cpufeature_fixes-v4-0-b3d1a088722d@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711851; l=1173;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=aClvRhkni8+VngBib+tXbyLWgA3xiyhnWY6l4lDY2FI=;
 b=gwRqVJm01uxvkdlrQKBBOn3dquKs2d0HbChFUuQQkjkWjU4Pgd55dBFMK5u5tp3XbrAvXtJiV
 gG2bGvn4tcMBAHUDeEUo4MTq+EhGf2AyyVTIO2ihJ6xqFiTuHUUJ79s
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_215104_323957_016AE477 
X-CRM114-Status: GOOD (  11.45  )
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

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 13d4fc0d1817..5ef48cb20ee1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -603,7 +603,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
