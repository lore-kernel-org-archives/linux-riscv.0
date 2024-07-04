Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E7C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eUSTT1Cz5nP6qMt9Fn+Gqjk0fM6K+jr9QZE72vTG1Go=; b=S3Di8LTCIqnvCF
	WdLrDIsULalwTbDuBTJvElMjJjMNoPmN5ya9dyQR7YUDMyFEUWb39xLV1VsOrp3srIyuEJ1kplrPB
	IlO40ryTbKRlaJUB6WsZSl8P3uQQvkxRcswhG+6uMMyd663hxdGtyqc8ON1H7klD9tQwJDvWgPx82
	s7S3nYK0gXCFDPZZfx5tn/gqSq+RypbUPf904f9qzN5xKaZSdm2tqid6d8PLyYfd/wcl5NRGtTpjC
	2TC8eD7UG+aQLO4Stm9Z0rmlFeACfNSen6eN+CJEDYLAzfqqJYuuRvHIPhwyBN6Xh1oVr4PMJG1NB
	VwVOhuy/mImsu9jXvpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQxR-0000000E7m1-0PZK;
	Thu, 04 Jul 2024 18:13:25 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQxO-0000000E7kj-2ocV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 18:13:24 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7034d975f18so364175a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720116801; x=1720721601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1zfXTojJsKe3wzSJXZA6AZrGX/lJFvmn/u+9Krof3k=;
        b=nI0K9mf9E4qaFKLplwlbAPavbO6bJvAZBgI8dC467RjaXq/RJH9llyxGqrVPqd5t7D
         J4uemXGL+5p2zpXv+XV1WhGMZmQapbkUKYNXNI0Q1w4tkW871oLBrSe3DdWpGlHQzkc4
         Jaa1gYH//f/9hViMKKB8AlCuQ3RHhHrEh2TMgOvGXvm5CHo2aBdJXbjaQJ/TjGQrZaZr
         Iv3LJOTmcr01j0SwDtX1Ev4MCkkEqefw5aseUc6tz/J+Z1rzLzubhj6Te3fUI/c/G5NO
         RNTnDESNkaLsGB7KNEk4vAuiUqj3506fvGfnPrES4MnvXkisncysd7bKUPa0ZHI0X8j8
         dkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116801; x=1720721601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1zfXTojJsKe3wzSJXZA6AZrGX/lJFvmn/u+9Krof3k=;
        b=RzG6sD1NkCKmU7bbpEZKhw1K/G4M+IiLd4Hc8VKJw5XDHoRhmU/scF0TqpGJ2pk6gt
         sKkxRfxqPAUeqP7Zr6JEPK5Ub6kNS7NhTGDgxPeoyO1tSnlUzliwVCpRaVcdFWA0Xh1C
         PYTKiunB0loS1+aeFlGQfYmRkNdWNW4xOJ2R7GkYcAzY+ILU4EQhD0Qfc2KeDh+PG8Tz
         e5lRXTp64LM8ZlIR9gpLiZE6A4XWK2RrcDH7cZwAG/pnDL9oQ7yBQl852wCmyedjP48W
         bjM8FBLNxeOxMC4YsQMl0ZwTmgwv/uDYp3VTiTjYSBwslIymB5X9YjMtCAv7Jax0U11c
         keCA==
X-Gm-Message-State: AOJu0Ywlt3IJQx4k719N+ZobrJmeo5dmb92YPp+YMWR97uf2Fte6cXnS
	fAn7FPZBaPhAMU9t6xKnlQ6pHAdn5IIpGwpJVCTJxghfkNemQqwi20IfXkR8jfqmWI8ePUmtmtX
	8
X-Google-Smtp-Source: AGHT+IECInmMyw8Royp+E9lIm6aV35f6xO/4XHeeEgDRWi71l+BBUa5MaOnn/GnWrwUqYtT3LbrnHw==
X-Received: by 2002:a05:6870:b523:b0:24f:ebcd:6aa9 with SMTP id 586e51a60fabf-25e2b8cf1f8mr2162512fac.1.1720116801683;
        Thu, 04 Jul 2024 11:13:21 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d100ea3sm10049195a12.78.2024.07.04.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:13:21 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH v2] MAINTAINERS: thead: add git tree
Date: Thu,  4 Jul 2024 11:09:17 -0700
Message-Id: <20240704180913.2516959-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_111322_729034_CA8CA926 
X-CRM114-Status: UNSURE (   9.78  )
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

Add git tree for T-Head device tree files and, in the future, drivers for
the T-Head TH1520 SoC.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Changes from v1:
- Add exclusion for thead in the RISC-V MISC SOC SUPPORT entry so that
  there are not two git trees covering the same platform

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120351e41ef7..503d2bd5caef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19306,6 +19306,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/thead/
 
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>
@@ -19322,6 +19323,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+T:	git https://github.com/pdp7/linux.git
 F:	arch/riscv/boot/dts/thead/
 
 RNBD BLOCK DRIVERS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
