Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C595FC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQYKJB+kUzWxsOs1RMoOu0jqPyDAjdojCk2DG4DGDaU=; b=NMQa/Wd+vU49fd
	RXZRrtQprz6iol6HT7J3VgX72o7f3ZN39jcNnWcDky4V32yHeekFiZ0ZVrNv4ngtKoIhHkRvBSTxx
	gGWBkYd3fC+a7iJCd1mZ44CdkrOWVlIYo3VsXxvGIJPs74bW+NO4uC5kZTLPNThm4+9auAcL0swEW
	MSkrNHR+BRNEMZKJdKEy6GVHo6xW0CBp9tRtOlTer8u2q7R61obgKHASCB+E9wIaJkkS/TcRLdNVC
	CYzqkGY59dZOV7Yn29YaeLeZmMGNPIk6cmi2/EI6BnnGJFNP9aRlR1JdJ5WAD5dt0rpdWnryZb++h
	Nky+/8kLi3E5/JSBa3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fG-003xY5-0k;
	Thu, 23 Nov 2023 06:58:18 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fD-003xWR-3D
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:17 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b3f55e1bbbso397636b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722695; x=1701327495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy98WgGNwj9rOwWzhsI6VzEfMnk+JFUolM0E3kCQh54=;
        b=Y49/9YszNULlgacYQss+yKarlq9NRaE0G56W5Inluh0hVlzmsqMN4tyqzQFpgdOm0c
         QLPUA7BkajpxHlb4+0+NwKU4SfwfLUIutnv0TE04NSCNrGb1FGKgHt2AKHOUa2M7XepR
         Dsl+LuGO2WpARfhzAFMpOvWJcv0PhRYL2L4qDu45wMahz8e9w9rCMMTq9aXVcqcVHKye
         imNFIXwR+w1uvQCjw/jTaeUEdZQyfhM7ctQpugV3psQDKeIb0kszBEKUGOyiWXIuD9tQ
         7xGAmWkkT18slXYeEHrFN6d21b9M62nD8KzqcDtS0qZlt7I/yJ+FW6ZbVd8N8vRGakdP
         zS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722695; x=1701327495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy98WgGNwj9rOwWzhsI6VzEfMnk+JFUolM0E3kCQh54=;
        b=aJMMcvQtRbsrGW2SKoLFijzR7XIP8f4UHOgyLtcYd1syxIRH/s18SpSrtPwWQW8aJS
         aGY0MBrxpq67FkUrbsZbYNUHoiTI8TisVvU7mSlEiHMEYvTbDMqehHigQ/bmYHfcdsRA
         vYNszbWMQuEnk3wJsk0lmmx/6lkbotriV1KxCGiZ+mJPFu/iMx3otupfPgTxYfKIaLay
         KxDcmSkchatsl63hko399d/G9vLwDoiWP6KwWwKNTfPTQJNLBsKSgfjS+OUzeKhTKIRy
         QkzMyKf3g5Qgm22MGcwM8x1cKD8pcHTzH8DiuFR43zokxFFDyIUVQFbAp5T1qXF9s8oE
         MfsA==
X-Gm-Message-State: AOJu0YynEvAqfi0+eRiLKjwLyKv/9/KR4nfoE3cQIPPRz0jh5zhr3dPY
	pI4sYecUrEu4kY1E0V3KL6Nh7Q==
X-Google-Smtp-Source: AGHT+IEh9UjPGyaaQjuaIBLcYWiSd7ay7EOeP118dTtKlJ+CAM34oaGt+k986nYAGOfCpnNSdObjog==
X-Received: by 2002:a05:6808:ab8:b0:3b2:f557:666e with SMTP id r24-20020a0568080ab800b003b2f557666emr5093225oij.19.1700722694829;
        Wed, 22 Nov 2023 22:58:14 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:58:14 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 09/11] riscv: Adjust fix_btmap slots number to match variable page size
Date: Thu, 23 Nov 2023 14:57:06 +0800
Message-Id: <20231123065708.91345-10-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225816_034970_74E8AD2D 
X-CRM114-Status: UNSURE (   7.92  )
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

The existing fixmap slot number will cause the fixmap size to exceed
FIX_FDT_SIZE when base page becomes larger than 4K. This patch adjusts
the slot number to make them always match.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/fixmap.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..17bf31334bd5 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -44,7 +44,8 @@ enum fixed_addresses {
 	 * before ioremap() is functional.
 	 */
 #define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
-#define FIX_BTMAPS_SLOTS	7
+#define FIX_BTMAPS_SIZE		(FIXADDR_SIZE - ((FIX_BTMAP_END + 1) << PAGE_SHIFT))
+#define FIX_BTMAPS_SLOTS	(FIX_BTMAPS_SIZE / SZ_256K)
 #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
 
 	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
