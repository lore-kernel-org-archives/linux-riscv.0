Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986D2EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf4+LXfBbC2aJ7U5eivnTe96fldaXXOoIORkzoXsxX4=; b=q4kpQ+cRTsVcfR
	2zyj9LU6bPCMOGKJy6Qwr82TEJx4QvrX0OaOCGrW4mkr1IoUk4flGhUmL6pUpYUrt3wGSoTbSuyIO
	bkJ0XtxFpR2nrNuulhXq/CrMLJdwdsSWcfUMZngY9E5yrIx29Ne4rpbyci2H6J8f3VZgl8gG6Knwo
	jCG6+dbEu0pmRN5BJpLrU9L/RrkPyXeZN/avL916QnFSIUH7KCZh3q1T1ji6Qssbnt0X5qKbYI1Sk
	sS66+fQzQU6T3H/9Zq6hs8F3NB7JfbSzoqO4z7ZQy4p6u99cOopdZa3wnfPM3EnnX+5nN7tIjTSfS
	4kZfRxF9xjZhGlhSswWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeeF-000KVr-0w;
	Mon, 14 Aug 2023 20:58:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeeB-000KSD-1b
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:58:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31781e15a0cso4207501f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692046719; x=1692651519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5L1+5yGpSJI+g1yL7XlfKIJOzrf/CQQnYIldi3eBMU=;
        b=Qo49m5X1YEOdSr9l4PyPwEgCC7X2A8WO9sZYNEyf78SlhLbu9rgFI0IQ6GRfnn5zeN
         ONYKyDvu6OGRWjdN6punKlDdiEBYH0FRbXO9dSOJl76lsH7PFUqrTJWfnN/nVxE+J335
         af91eo4ZkMm0S+8Cs21pojVw3yeH9c+0zmxZCvoqUzVeQHf43TkGWXEz+bpHy6YrNtmW
         XswHMzi4fqFrZyz4tghmtR3/lq9kc1KRykF+FGcPZJ+TG53UAZIwLZjO71H6GbC96lSg
         8nCQ0bgizdCI1Rvx9A9EzQB2pC4EVOQUhU2FEoynKmpZC9ceD+aBNHE6eBt7vkhlmRh3
         aKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692046719; x=1692651519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5L1+5yGpSJI+g1yL7XlfKIJOzrf/CQQnYIldi3eBMU=;
        b=W0DFcQ9qur3OfrtNnr/nahYm+u/B5gZO6ZMxTpyCNgrZsaPhD75geW1YcgJSkp4V6V
         Z4jFqCrZ536nEwEutuV6a2FDY7SExuCFCcvn9EiKXy+YQd0R7LYtLeLAQsle69L4dRjA
         Q/k3ZYkKNhC9ROEfwlBmwQII1hvmlar9D8AQa9YDZe6O+l4rnWJdEMjG6TDEwTy1LL4z
         u0NNRBPWjrmfz0alg7LUCvw4Gb3OUtxADIwhtnBYscEtBxBWp1lmWIZ++e5hwq7Z1KRh
         77G/fFzU7gBnAsU8YLG4GTBDd3BV0dsS9FMHjbKJ7G5er6G5JJJL6CgRhwVu7x/D1CB5
         lreA==
X-Gm-Message-State: AOJu0YwTgk7UkxyK1WremO9d/4P+qXHvsLLLWqKcCgbljFrYtSb0fKRp
	vA83qCnmHzCu601wAuGdhJ0=
X-Google-Smtp-Source: AGHT+IEGUEKllE6snxZ0ydVaACU86gYvyO801qw/abUe/oKyFe/KQsWgHCpE56aN1XWFayfNJZOUoQ==
X-Received: by 2002:adf:e784:0:b0:319:6d91:28c2 with SMTP id n4-20020adfe784000000b003196d9128c2mr4963676wrm.61.1692046718732;
        Mon, 14 Aug 2023 13:58:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id h5-20020adffa85000000b003197efd1e7bsm2161806wrr.114.2023.08.14.13.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:58:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v11 1/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Mon, 14 Aug 2023 21:57:14 +0100
Message-Id: <20230814205719.79647-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_135843_550506_FA9F048E 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v10 -> v11
* No change

v9 -> v10
* Included TB tag from Conor

v8 -> v9
* Included RB tag from Geert

v7 -> v8
* No change

v6 -> v7
* No change

v5 -> v6
* No change

v4 -> v5
* Included RB tags

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
