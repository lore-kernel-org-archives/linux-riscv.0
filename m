Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75256CF6491
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kusZ/Ln5w9WpUrLM6AY86zZ2aGGzT/qovRViIT+iB98=; b=pcCVmaimxWx7KL
	D1s/Qkjg4pf2i+E+HCy86qOj/nJG6r0H6trT6ukOeJzZA+lMfWJDbdTEsbPbPxal3zwnlAU/VxUZQ
	/TLdpmgi6NptN6+FQjkTsX8TzcvBW10pYXHrDoRm4S0WeCezXeNxvN2QuFT/uBGLS06dSlbbEZbz6
	z2uAzh+vlP96LhVSFSEUrgLPaYSIDhXqOyorJce2KLdXAQPoq5n03AMhWqxg34hF34iytDFsx76ud
	cws0knf+JG019GOs9jTvLjrU3cM0EKcIILkwJ4CtQhVVerDaNI6lT8xUlXwX86Lf9AxuJG7WKNEoK
	Z4TbZ7iCYXBj6JkAOaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suZoB-0000000DINx-3cIt;
	Sat, 28 Sep 2024 15:56:35 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suZo8-0000000DINZ-2TmR
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 15:56:33 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-719b17b2da1so2285891b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727538992; x=1728143792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgzUbN9sOzdPJ8bPIQiUVA3fYBKHvaG5w8G2EdpDVeQ=;
        b=JWf7abd9uWfol23qz4XgMm/mCKIQC45Y5fOxaBgd20ZKou6pwx+O8IaE0YgOih+Fnx
         EX8WSb9N8x9muMfvZvO06/YSVn8W9HVKq1yKr6SLxApQALRa4krapzWcumt9pnhJvQYt
         VWHAXj2hYBBfqAXuFiinN7NNzF+sF6AOqkxjwFIc4ERHtUUnHl3PBFACF0VP/P2eseg0
         UkVP0JA0yI2PFbqjvsxqVAfiOt6Xh3Yaxfc6EvDXiu3xrcvcFTC20xrFM+c498H+JBuH
         2RbpmquUHrRkly9JiJyCIrL+BCYyWF7Oggg1RHVnrHAZDcWE4yjG93RnClMrXq3ppiNx
         aWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727538992; x=1728143792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgzUbN9sOzdPJ8bPIQiUVA3fYBKHvaG5w8G2EdpDVeQ=;
        b=hM11e2WP8PVy8yzI4PnrTq3r81xhGwHaCA7EIWf9Yp7scy+Sw0+HI3XXTtva4rSNp5
         TYt5XXf1ehC8M+44Ya+kruiE47pIFIlTlwR+XJRb7PbLfJZDkFPXYu9UIkXyiVxFW80E
         Ae2ciVfyxoH5GrN0r8xCHEX8r53S4Lpm3Kn3YCZS8Q8x3bFAe7qKFWMZU+40q6v+BpDj
         cg7a5M/eZUFllOwerwAM1kQSicRWXkLLyBLLYI+ZIKWhTnQIQYP8QpJ/VUHs6uDhVi3B
         ZhcQMdwO5TIGQXBo6kDv9M5Q/sC4xKoIjtomIcg/fUb0dPLchDylR2w7osSCUTYRp81J
         ayIA==
X-Gm-Message-State: AOJu0YwWu26FqxptpnvyWiZz0xNubWIEVpCx2/qh5g3tXpGJ+Bfbvr94
	c7S6kKnTO4spqpFVSivAEoWyN6dZwrdAXAGBZEpAhF2JoxnXa80z
X-Google-Smtp-Source: AGHT+IEQteoyA0yQ8T5uGYGb3QXZQDEmWiaKrogEmCzQLhrbg/lIBTJ7KLxQriHPv5GSBqBB7MzWnQ==
X-Received: by 2002:a05:6a00:4612:b0:713:e3f9:b58e with SMTP id d2e1a72fcca58-71b26044023mr12664564b3a.17.1727538991619;
        Sat, 28 Sep 2024 08:56:31 -0700 (PDT)
Received: from localhost ([112.13.110.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264be276sm3265502b3a.81.2024.09.28.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 08:56:31 -0700 (PDT)
From: Cheng Chao <cs.os.kernel@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	Cheng Chao <cs.os.kernel@gmail.com>
Subject: [PATCH] riscv: mm: check the SV39 rule
Date: Sat, 28 Sep 2024 23:56:26 +0800
Message-Id: <20240928155626.267348-1-cs.os.kernel@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_085632_669456_ED24DADD 
X-CRM114-Status: UNSURE (   9.98  )
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

SV39 rule: the address of bits[63..39] should be the same as bit[38],
it is easy to violate if configure PAGE_OFFSET too small.
for instance, PAGE_OFFSET=0xffffffc0_0000_0000,
the FIXADDR_START will be the 0xfffffffb0_xxxx_xxxx,
bit[39] == 0'b1, bit[38] == 0'b0, when access the FIXADDR,
which cause the page fault.
It's difficult to debug, check it when compile is necessary.

Signed-off-by: Cheng Chao <cs.os.kernel@gmail.com>
---
 arch/riscv/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bfa2dea95354..82d112c02662 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1387,6 +1387,12 @@ static void __init arch_reserve_crashkernel(void)
 
 void __init paging_init(void)
 {
+#ifdef CONFIG_64BIT
+	BUILD_BUG_ON_MSG((VA_BITS == VA_BITS_SV39) &&
+			(((FIXADDR_START & BIT(39)) >> 39)
+			 != ((FIXADDR_START & BIT(38)) >> 38)),
+			"violate SV39 rule: bits[63..39] should be same as bit[38]");
+#endif
 	setup_bootmem();
 	setup_vm_final();
 
-- 
2.26.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
