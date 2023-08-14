Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B10C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 04:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8CWonNI9BzUUDHOOJjv1QnKAVWrx0guttsjQVxWxek=; b=wAnWj1Ag4ckR+B
	AGWugC03zdsSzSG9slYygFW6vS0w8sprrCfCNdZ1oGeOwvrbdw1Y3m14gq0Dm6O5+FN+NkMgN7mzT
	xDioxh/asFAEEYQk0nDV6mOzaL9x7KC9r0vRI+xiwvusO82eN9YH4qs6r0+FenMWMjMIeeMwtXBl5
	orbGxxypgUWtjfB2mHEVFZS1X3LJWkzPWLsQNNjxH3PjFldiv5f07UHrw00Wa491L0rN3cCr+gEH/
	iyznPlR4polW3cFlyxGKFguS/cmnKbUVIiGn6mA7Xo3w9BOKeUk/zDAvVc+JFiO8PMZH+aDHswQ2r
	rwpQ7k4hc/xRpEYhY4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZz-00G9cd-1p;
	Mon, 14 Aug 2023 04:53:23 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZx-00G9bB-05
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 04:53:22 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d62ae3fc7f1so2819589276.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691988800; x=1692593600;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuEMRB9XvbEbzX6uB9ErlyLpREyB8Dr00CoB38DVpTk=;
        b=eRcLuyNexWhUfmRHQ6aBHdEEn/P3PQ9TXU+My7XH90+bFTsaWofpT5uZgWquDzlbSC
         xjHjbkdLRNcnN9EcqHvo92W+kQSya6ZszDtAvofWE5Ad9hzLV3YvvyYiAb5hNXzi6HXE
         umeG+9HKAUtqKYzyhTeCv/l34u+TOsGSw86EN7PhlzsidFkLESQncae055Z7f9K6WosO
         Bpzha/Dg0xhk4wlVvVvHTVSM3t70xArWTdKRaaJEX9pac1ErMT/SRZeIfzFdzIGwfDTp
         AKhBnuyE9WFXggaDRfya+40tK4oqmpClEsdYE0AJcVuIj2wo98AgWkCpmuVLnPRnQJ2V
         PkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691988800; x=1692593600;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuEMRB9XvbEbzX6uB9ErlyLpREyB8Dr00CoB38DVpTk=;
        b=Sr+q/SwhZbgrMcB8pDLKO3sUYCmbD9dyea/quYTu0YqA/xlYDsrMP9UXJ0SjXxagwp
         Bdrztx0TfSnZMrlmfXT+zCZRqgV6MQKGSE/s4njwaznfGfglGhoLIBcs8RxqFKhVM8VN
         KsjxSurMWOVPA8IrL9pbRqEae4A1TUpZSK5PL9zTqOlNYVpGAvQak1dPTvXjA41UALZq
         ArMuA4iL+jG/K7v6lWVwMThoOf23MmZA2KnahyI0kyQmX+Grt6iAQuQmxyhfkS2s/nFT
         cDUpXlzvH/I6FX2Z/qr1qFMTz4MO0mvnFF6koL8aq1iAIszDwBm1KFObl4N2cotdzcUA
         rNXQ==
X-Gm-Message-State: AOJu0YzoHQByfeUsxTJ0gBxauC1OawBu8JF0vnztqvdGWEfKL4l/nKZd
	xWm7m//Zeld1/dTfj0S63X8mxHO483oGuJQqKXaBdQ==
X-Google-Smtp-Source: AGHT+IFcOeiEmf/Ox5kLzmgw9Uxu6yFAko05JiWKaKn8n86RE2PQRh5HYe2SOt89A2mNEqW0gPdWuw==
X-Received: by 2002:a25:d711:0:b0:d09:d428:8284 with SMTP id o17-20020a25d711000000b00d09d4288284mr7267522ybg.56.1691988799683;
        Sun, 13 Aug 2023 21:53:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 7-20020a250807000000b00d145ec9f495sm2246460ybi.46.2023.08.13.21.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:53:19 -0700 (PDT)
Date: Sun, 13 Aug 2023 21:53:17 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH 2/3] arm64: include asm/cacheflush.h in asm/hugetlb.h
In-Reply-To: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
Message-ID: <bd77cc1b-e83b-f276-9e27-c19e7c9119aa@google.com>
References: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_215321_063219_35B5EF66 
X-CRM114-Status: UNSURE (   9.44  )
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

PG_dcache_clean is used in asm/hugetlb.h but defined in asm/cacheflush.h:
builds rely on an accident of that being included via linux/mempolicy.h,
but better include it directly (like arch/sh/include/asm/hugetlb.h does).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm64/include/asm/hugetlb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index a91d6219aa78..f43a38ac1779 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -10,6 +10,7 @@
 #ifndef __ASM_HUGETLB_H
 #define __ASM_HUGETLB_H
 
+#include <asm/cacheflush.h>
 #include <asm/page.h>
 
 #ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
