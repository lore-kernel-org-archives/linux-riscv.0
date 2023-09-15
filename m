Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35FFEE6442
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yoYh3gApJiGn9vfjfRtsyhKppHPQInKTi12SKjB2ueQ=; b=0jhJVF+ncywqp8q9d12PCfbLKl
	tGTxN9F/MMDOipEONKL/D9IfnSTrjtHrT9sF/d9KPOthEI2Tt07GTtti65Amu8raNNy/n4yP4vq3n
	06CA2Vkf310R1yf5cXqedPX9KBKui1nepAT51fd/rBZQsBtrTtfJnRSrEF2+Dj/rVU9PmXz1GH2BT
	6wcU5bmaVJOnEeGBkp4I51wqbVqM71vkniySsL+5g9hxRVlM6wZ7NzL2C5sLtFr2WglSF9oByH00M
	ayGVL9lX4oJspZ21Nn3JduyZ6mG9aR5jdKfbFN+2+pjLB1UqgPL3gSv08NHk4bITgwd85IrnIuCtJ
	Jhde3lbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Ac-00A9Si-10;
	Fri, 15 Sep 2023 08:27:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4AZ-00A9RS-0b
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 08:27:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c364fb8a4cso17244385ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694766438; x=1695371238; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/d7/3Obm53ZQCMrVF3c99mLRUxxcGODrgFkkmXmmWh0=;
        b=g05lF/zvrftVPI3hJDdqerK3P5LPhY3cKx20WoYNtN4TkE/LjEslZNRd1IUjwI/9dW
         ZISG5sL4XM6MUsDLB0vnqKmyaA+EQ0TltCuvlX+7EOnTrAWU6J/1u/PK38KuM2TI4vLX
         +tbJOFLFgBKzHh2SO1iWAPUgk4qoxjzzLnQZwlYifw1DSdVv6AYJhIap8DmF78vHB9/f
         oTWEZKxwiGTn/CmbWBDH5dCShuFyDEFgZe4puqFsml4aUCrWIiISNSXOoi+zheI+upEE
         CR8arVWyS3Bd0QzB9WUBTRoirVxW0O/J/W6+2DtFaJ5hY1QJi4Y4swHbqzZXVEA75LKn
         BsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694766438; x=1695371238;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d7/3Obm53ZQCMrVF3c99mLRUxxcGODrgFkkmXmmWh0=;
        b=EUEvEO2P71hJxkp+V6bku4XbW15LCulwURivFB2xz5QXc2E+upFlWJXlxLgyn8Au/q
         vai24gIwzj3s8DsrMKSRrap2EFRIjvXnL9bMGl7VWr6fPvT1PB5uLI32JRFNpTvNhWgj
         AjwpLkYz8q7diHSvWKZljFettZ52dWGWYMNIMYeYlIbVJ3E9u8NHKWE31rfUTOQDR+CT
         c31DJC+YvVA99qJPzEh6W+8tsdblY0tcBQE1Wfs4ghLnNOfYQ+XhHaZM6wABHbeCKjZb
         RuifIdTrUP/QCSFYPnLkxt8SbY6zCBBIIkUEWl1oypzSkJ5Rx7GWV8HfjDE+vWutqlOe
         6M8A==
X-Gm-Message-State: AOJu0Yw7NXQLYmwxVmkaOC68hw6ENg1F2Yn8/q+qx0frZTwpkqW0vkTL
	uzFDVzhfkrG7xluEQvk1wtVxbY6Ym8rNzMgleDOohnb9Os+aZgSMByWU234eEPxoRgLS1XaySJA
	OiUaBPIf8QtOJ0nKM2CZxsEzgE+Jsg8FiNAIT6JBJLieHNErZ8JMeziM4Oo9JAYQEqIJ2Bir4gv
	1JSDDVT+Z8H8J8XtEGdMqN
X-Google-Smtp-Source: AGHT+IHb/zp8g1xE9ziKFa7Tv818CMTUMg4AfS9OmCA5Lgzj6xUNvLbPabyCw1dijiXKaviQ0VILnA==
X-Received: by 2002:a17:902:d2cd:b0:1c3:e5bf:a9f8 with SMTP id n13-20020a170902d2cd00b001c3e5bfa9f8mr1188084plc.19.1694766438315;
        Fri, 15 Sep 2023 01:27:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ab8400b001c0af36dd64sm2912806plr.162.2023.09.15.01.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:27:18 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 1/2] RISC-V: Detect and Enable Svadu Extension Support
Date: Fri, 15 Sep 2023 08:26:57 +0000
Message-Id: <20230915082701.3643-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230915082701.3643-1-yongxuan.wang@sifive.com>
References: <20230915082701.3643-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_012719_224833_304AE636 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
extension is available.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/csr.h     | 1 +
 arch/riscv/include/asm/hwcap.h   | 1 +
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 arch/riscv/kernel/cpufeature.c   | 1 +
 4 files changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..10648b372a2a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -194,6 +194,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_HADE			(_AC(1, ULL) << 61)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7b58258f6c7..1013661d6516 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SVADU		43
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..f3d077dff8ac 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -629,6 +629,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+#define arch_has_hw_pte_young arch_has_hw_pte_young
+static inline bool arch_has_hw_pte_young(void)
+{
+	return riscv_has_extension_likely(RISCV_ISA_EXT_SVADU);
+}
+
 /*
  * THP functions
  */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..ead378c04991 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -178,6 +178,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
