Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD15AC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RcajbZsYuRhW1rl1kgYorPCgkQEj3JWr9OqtSAp1nfw=; b=S7Rhs6yuUe8jqH
	6lPc0kcjT2KTj619pjS7vpzFTcFtSm2sHH7J8b1sv5PDuNxCEdgSy7gPvtzISDJAd4nZp18OpOgRl
	sbXRI/E9LCUNek2WapDS344+Zk+RWuElNnDWPg8SQFWgVPng2AjYWMQzmvGXiUIXel0r/I5DivLXF
	Uu0mkD4Fr8GQnpSFIJvn7R0BtDDU4zU/A7PlVTtfmH0/jTW2Mh7Ni/q3NJUMZAa35OL7fOhxq9J2x
	c+88sno3056yo/p+9g19uI/y8YAAPAJgOf/SmTGzSGaInrQbWdFqdBaikS2Qt45Z2Vr3fTI/WeUei
	YteaGnLcPE1DBNCBWZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzT6-004avW-GE; Tue, 16 Aug 2022 16:31:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzT3-004ary-Ko
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 16:31:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gk3so19913197ejb.8
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zQV/5VT7wDalmkEhlghHzSuKJXiFKNeXoOeTjzFLGpk=;
        b=CAbU+smotGSq8NH4wYkOstoaMnYiFDhJwY6nrngetrdZ/mJm6/jTaIqqLaGPW30O10
         ZPMiWKhTp58dBD5Ntrss1tFjKNz1xRr7g4dy+jzKSqTJRl+51VJOqZBH8d4xKgUoIpN+
         AiJJ/PX/V4eJsxt2SYRVVb3V+v70ARkV2TjPDAPUqu4ckg5GXKtVRH2X/JKOEc4DnukI
         Ei+99QevtnywDfNadIB1PROfUmaw4YB6gXB8/gFcqzbJbl/GTx7g80v7RjN4FAeXb9tx
         digxmK7PCQNHpztxtFJDj5ro22pMCBNqdy7F4imn3cBFP4p3HZxrPqEo/MEgEC0m7QtA
         2VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zQV/5VT7wDalmkEhlghHzSuKJXiFKNeXoOeTjzFLGpk=;
        b=PpAoqgf3Aw+ggelcuHL56539JAHUSP/ATnGPvw+c0aNXdOanC3d7P3hH5rNWUOm6l8
         2MYv12rabim6E71VB1hn9yXQclqESCCiKYevAGj5zMRMugcUODZOjxQ2bTlzLl5IhzOp
         fVUyzNXBJzv9JColZegWqAzccYYSJaOgDXk1dX9E2sGH3i0MdzGZKcJt15lqZPC3gjeK
         VxyUtVDjmzjRr6fWn1DRyIigDr2UFSJCdVFOpTE5+eT4enyzdun5dcTQB75SWGSxRy9L
         U1tQOY7ablIiXk5eohz5kOJLozwoiUv+6VPSSiQEuaovl8YeId7JlauJSd6zH/z0Cy/G
         syYA==
X-Gm-Message-State: ACgBeo11t+ViFhDoSFBXoOqcdCKxFjnIqH7EFHlY1HFV5Rh4TUDszyNx
	sVP/mOFsiTZF6X+pn08UlL+HzdXhHBVSxg==
X-Google-Smtp-Source: AA6agR4GtDno2qO3fgrQ9XAPgCZKZowFbrnnmPr+RSngGYDTP4QSH9ExK0n5/ZwnuuaI+FgJxxrvhA==
X-Received: by 2002:a17:907:3e21:b0:730:92bb:7fcd with SMTP id hp33-20020a1709073e2100b0073092bb7fcdmr14039523ejc.170.1660667459930;
        Tue, 16 Aug 2022 09:30:59 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id r30-20020a50d69e000000b0043bbc9503ddsm8730819edi.76.2022.08.16.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:30:59 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	daolu@rivosinc.com,
	jszhang@kernel.org,
	palmer@dabbelt.com,
	Conor.Dooley@microchip.com,
	re@w6rz.net,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] riscv: Ensure isa-ext static keys are writable
Date: Tue, 16 Aug 2022 18:30:58 +0200
Message-Id: <20220816163058.3004536-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_093101_709095_5D63E72E 
X-CRM114-Status: UNSURE (   9.49  )
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

riscv_isa_ext_keys[] is an array of static keys used in the unified
ISA extension framework. The keys added to this array may be used
anywhere, including in modules. Ensure the keys remain writable by
placing them in the data section.

The need to change riscv_isa_ext_keys[]'s section was found when the
kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
add Zihintpause support") adds a static branch check for a newly
added isa-ext key to cpu_relax(), which kvm uses.

Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..3b5583db9d80 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
+DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
 /**
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
