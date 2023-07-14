Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A636AC001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/unGmUJ3gRrqQEtJyAbkNjh/xaPYa+OXAiyVoDUdbas=; b=f3iQWFLGrrh91R
	dKywQD1lrJJEPM0MAbckQHRmk0YaRNj7ck4buJOWMtLdPvhUB8f5w+JDCjjP7xvRBRl6VH3Xnd0FF
	GdOh+45GeFoHp499jDs1DDWRSwHby81F5gu+BzmbPOUki+98lHi+pC6hH4zi8MudnaVgkrYE2/Lct
	bPdejdPWz+DYSkdqp/uAzAmyrgqhcY6VH3XmLrHo6Kni4TLqZniQ3Pw2/wWjC8PX2MGN6kucdO/qp
	889/gp+ZCZ70NqfvCO/fk5CHdVURlRvuH0hbS8Kc/tmmpMIBGfD/6eu5njWU5dGJvAxupoU6wnHV6
	EpvB7X7hgk+lpc//Qg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmj-006mFN-2m;
	Fri, 14 Jul 2023 17:40:53 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmg-006mDr-2I
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 17:40:51 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-345d6dc271dso9676985ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 10:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356448; x=1691948448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFT9PNMmBztDXyn5rk0S0F3jD8xFge6alwT8Dw67VL8=;
        b=bIPj2qDQgGYM/EMRKBZMKxrIO8LOhGVZwHeGEJTRQQkAGIkZK/eynOqAIysRy/FxaP
         bd7YkEMOGYdUzRn7IgTDF4VRfubXQUuBU5pHA7NjusKZw2VwfUZl4gql7djMQYYvdSB5
         2WZZnycwSlQ1NMEPEn2H1HguZ3Gcsr20OzSPcSCKWW9H/KAnPn89K09zgisHy6LMh5NM
         wE7T/NyWpW1Pe/FVvw29xM9oPja0Bk5w5nSF9jiCOwtvc9STVII0rdi+kmP4SrfbenA8
         jSRb6g/axkWdP88xQ5WnxuDjlGJ9X6sq921mByJXFTJ5+1gaRIVEv71vYbGC/h6LuiBM
         Y8Fw==
X-Gm-Message-State: ABy/qLYsJxzWXhYCBJJsXRJ11YEnFZO2nE3bfAthCt3FZY7GTkAMu96x
	NUN+i+kCi0y7Uff0aAOx+w==
X-Google-Smtp-Source: APBJJlGrW4Xkq9w+FZdPIVXMOKSnncY2lY6BFJdgiocWd1cYlyqL8tnMFmiSkP40ud3r7hlTdCtMag==
X-Received: by 2002:a92:de0e:0:b0:347:70a8:1749 with SMTP id x14-20020a92de0e000000b0034770a81749mr4817126ilm.24.1689356448356;
        Fri, 14 Jul 2023 10:40:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w17-20020a92c891000000b0034233fd80d3sm2889354ilo.22.2023.07.14.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:40:47 -0700 (PDT)
Received: (nullmailer pid 4040658 invoked by uid 1000);
	Fri, 14 Jul 2023 17:40:46 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:40:43 -0600
Message-Id: <20230714174043.4040561-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104050_747778_0022E444 
X-CRM114-Status: UNSURE (   9.87  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..d75941be9826 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -13,7 +13,6 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
