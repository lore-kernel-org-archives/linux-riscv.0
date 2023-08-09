Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B85EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUDOYPQW6SRzqA/e2Yn26nmdSzgt7/behOO871gtMAk=; b=s39iaofRlF//G+
	NZ8W8bgrzImhUm8cpSmd93bga594A1zYqHGVg0nvnaK/HZYneoMsa3DnItEkyE3nTY2zJ8m0MUh1W
	wyMtL3dAoR6L2yYT018DXms9XkePo0JtCd8Dtef6ps4WnL5iFv4MchB2jQHV0AK5Hy9AbTDO2rIGs
	30foOAuMhTNPSL6HmKNRZHB+zjIHjVqeRl7FM+RV42foCHMsRi6KjR33jHLc7Hb/mGMkKr3Xloy/I
	UhTP8P4YyS7wPIvh8Vo6Kaxvwd/8jPBPuPzikg1KzNQ+BXhJNhhK3MEdDty26ur0qUWvpk1RLe63K
	XU1bPK6ZWe0sqz9n+Jag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmd-004pZg-2p;
	Wed, 09 Aug 2023 11:55:23 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmb-004pYG-12
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5234f2c6c1dso1250831a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582119; x=1692186919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYc3fGGvlRKPoX1LJ72knH8Iv56hmasdsXlRut7wO6Q=;
        b=LRG57w9Y/MmsS4q7HT160Xlg3Rb8vF2qudRqq5Khw7IaOXghz3BKQrl2wgvM8Aopn8
         SkrdPXQqd6cg90lwCv/UNFU27Hw/4nwj8NXMgKmR+bnUR2uZ3B5fEgIGyDxW9Dz693Tb
         FWvdaqodU91QclSpA5rP8kN3KQtDQTBRMhl8G79D9cypDosT+lcecpfqbXmpPbM71zZ1
         Lv0Cc/bNsDTofIjJ1mUE4YSswsrz92PKJlGHZ9wcP05D/daXDeqIn+jUyVr4o030AHHi
         0BAjuhI5m+swRoYBTFqiMWQ0wBuRyiI8h5dQyl7feiXJa9qBWH8y+rsdfV2akvY51lqJ
         5k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582119; x=1692186919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYc3fGGvlRKPoX1LJ72knH8Iv56hmasdsXlRut7wO6Q=;
        b=i452VrosL2yRNpqa7cel0GVwuvHYnGw5qbghuDNDrn73H5GL8yIK1JOflWvt8zVZec
         v+0HXA4DS2MZ5KvuPXC8B+By9fh5fS94kRd9UxPQLS5GywZZpKnIWm+UvK3Zy8rU4hdN
         hP0OLwVluEVzE+KcTDAowuytKnJj6d7UWcioBu/N0F/6i7cXLbmTPGP2a+fVTmBJCuWI
         pa36JTe+rXJIZUpw5Q3LIAn0VqcoXXzMHc6o9OK65YHLhoLmq4cTSN6nMlfqMbtyU3nI
         BKChalqdemYgDeG26ISbTdokSk7g8ilqU4cOe+bc00FPq4EHdicsmwAyQjHJb5t7qXZU
         BDLQ==
X-Gm-Message-State: AOJu0YxdpoWQ8hc0tZvFzJ/Q9VETiLBKViOWRKIQDy7HtJh9qmsuKRwl
	+Ab/pdeQync8UOsj+757z24rZj236kM2RjxRjg10xy/E
X-Google-Smtp-Source: AGHT+IHQHrlm4h7gtPPSuIZoE1yHojByM6yl3SveiLBAGX0dofO0IAR4Q4qyqZxbnHHjLQhOLWqrBw==
X-Received: by 2002:a17:907:270c:b0:993:d47f:3c84 with SMTP id w12-20020a170907270c00b00993d47f3c84mr1939338ejk.7.1691582119015;
        Wed, 09 Aug 2023 04:55:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ka21-20020a170907991500b009882e53a42csm7867181ejc.81.2023.08.09.04.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:18 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 1/6] RISC-V: Make zicbom/zicboz errors consistent
Date: Wed,  9 Aug 2023 13:55:18 +0200
Message-ID: <20230809115516.214537-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045521_374857_2B94576E 
X-CRM114-Status: GOOD (  10.62  )
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

commit c818fea83de4 ("riscv: say disabling zicbom if no or bad
riscv,cbom-block-size found") improved the error messages for
zicbom but zicboz was missed since its patches were in flight
at the same time. Get 'em now.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..31843e9cc80c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -87,10 +87,10 @@ static bool riscv_isa_extension_check(int id)
 		return true;
 	case RISCV_ISA_EXT_ZICBOZ:
 		if (!riscv_cboz_block_size) {
-			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
+			pr_err("Zicboz detected in ISA string, disabling as no cboz-block-size found\n");
 			return false;
 		} else if (!is_power_of_2(riscv_cboz_block_size)) {
-			pr_err("cboz-block-size present, but is not a power-of-2\n");
+			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 			return false;
 		}
 		return true;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
