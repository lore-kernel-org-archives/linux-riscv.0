Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454E5CA1012
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 22:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3sNLqGe8soAAS9fw5aNFMeLI+zMsdpu2HpBjsprIc8=; b=CUCHBMcdc6x5S2
	tGwycNOuFWRHdjsovuZmnQ4CG+nm6mYOxX28gG2prxKi4o3o8WAJXeUJkGT1zor/6d6+bbPKrlIKZ
	40yTiQ6N252RjPJDrh307Gl4UMPup033/sWEeXTF5txYIx7hFE8cRs9knYGNtwln0WY6+9aHJjsIZ
	ZsikWKy81OouCe4ehYfGNPnVWKNvC73xTFnwk2WKvG59PBn+USwafBUqS1Pq5OWIBc+hIE1N18Ex7
	iM6uinNdJ3L8IBYESyt+d8Yb/NGPxrM3I+yfD0yde12S2XcgvhdrqBQZ6S0AXfKjOrllzn9cxKX3j
	HV7eD5AyhSW7k2M7zHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwNw-00000007qVq-0MJZ;
	Wed, 03 Sep 2025 22:55:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshm-00000007NVt-1Oda;
	Wed, 03 Sep 2025 18:59:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24af8cd99ddso3801705ad.0;
        Wed, 03 Sep 2025 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925977; x=1757530777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p96JFKpspRPKBmH2rgBynj/gu4bh0EGooQeUZ0NhcIU=;
        b=bJQv1JPymvJ06leS2lA2+BM0ZmFLrzNYd44eFFviCTjrQ/JyyESogXexmzc28MtSEH
         KIVsPotO39nDs+th9f0YALYeQGdA1YVvrYx2PRWFAahJeWjrf4OhwkYVK1MhrsbolX9e
         a4zEfNuXOl81d2Ku3pFlF3QVV8YVoILlYDRwy6SCcfxhn1jsVjpVUi8orPySo+Uoah5S
         j58m0TTNNEPqYpDGFRpph6NQmGwKXxncAPNmVfJfXHKuFPsOr4p4AERNrbFRTi76+Igv
         +X66Ocz9QluGyx9w85WuIp2HI/gFxLQKpTbnTq3T8CY8SyYtzTuam0t7G159gHcEegrH
         Wv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925977; x=1757530777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p96JFKpspRPKBmH2rgBynj/gu4bh0EGooQeUZ0NhcIU=;
        b=B2lEEPBSNDyH69EEwg2XnLNAqacjrbYvXL1tygBlVukzafvOI1IDKyL7VQwjxFx1oa
         Aa0Kpz2L4muzXYXn/cuNiJymb8ltTZ69BHcdxTQnG3s5h6TmOevgghKhv5dwHvTvbKYi
         It/XSgnDcjhp2H2ZylGjLmS948ZjI7JILMmo3QesT7hY1xy9I2VFmw1kOdFauYCwiy31
         cWC4QKLxYrOiOnGqs4dezcPObQFeJerSQItugcfXZOkyG9T0e/ow4DkuuYcJGUUIxoMn
         xkXp0L8ZNX3zZtz+umxzOzPz7erMnCMud0BcoSIKqcNh8uXBHTN+W45YtDiD/ijwo+cp
         YSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDkdYxU4oOFUnwNlMER278scsLEpmMzj703vXDujxo7ldSk2y65RRZETgdsSZTwgwgAMt4vRjTmJjGP4U=@lists.infradead.org, AJvYcCXo1pxS8xOEcKSPYSuM1qGw+IXSkeXBu9joFmB6Tv22E3R7jZF8SwG2CWA+TJAPgjq6T4RQyEoLhTHu9IZ2CdJo@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMybeDowr3PiGZ5YkAsMJc+qniKWcjq49iXynyKk1rHFf3KMi
	FbO4VBf2tjMz4NGLH/zoKzwZvtRKehsjEDhE2pKm+/VrkHSScd5IXfDk
X-Gm-Gg: ASbGnctMPPME0YHO4RLO27oF8fyTe5gq9qqMtMkcOHpjAwvznt/IVFUjbD/fc5NALRn
	iEUPmhKuBLxkB1qZaTNmDs7IgD8vutQwYH2RoFTKvG2vFNBM71iZrL/ORQCuLutHiCIvDc4JL3t
	S/rMfVH1jhNzAFXwUr/MtrDKzWEpErywvLKhGHAJi6lZAA311FZvkyDEyQyEZgZ3YgG09k4GlZZ
	bQck0QnVlXYBUM2EhoK5KNAXv/c/7myNBO/PcbvuHm9K9/8h56XPslj6IQeyDJ9al7GpcHoE6jy
	5cpTmZ6t/GYqol99ej3VO5nbI4EzjF+K9f6kW/Mk/cAhzP6EmDu15BQbWxtKAOsTOeFe9HSRqCn
	sYR/1PlVhm1l/BH4l7SVe9m45SGpB7QtUoKdJenYCvPCozTIWWF3yx0ukjBbg6+LKMeQJJa43Uv
	U=
X-Google-Smtp-Source: AGHT+IF6bU8SPLeBKOcF3DV0pz3IKcU2SprGWCJIgsDwHZ4utP76U3dUm2BhH0lDWIsPOTFAl0TAFQ==
X-Received: by 2002:a17:903:2f8f:b0:234:b743:c7a4 with SMTP id d9443c01a7336-24944b19ea3mr233283115ad.38.1756925977585;
        Wed, 03 Sep 2025 11:59:37 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Justin Sanders <justin@coraid.com>,
	Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH v3 2/7] aoe: Stop calling page_address() in free_page()
Date: Wed,  3 Sep 2025 11:59:16 -0700
Message-ID: <20250903185921.1785167-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115938_365543_21A6421C 
X-CRM114-Status: GOOD (  12.10  )
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

free_page() should be used when we only have a virtual address. We
should call __free_page() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/block/aoe/aoecmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 6298f8e271e3..a9affb7c264d 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -1761,6 +1761,6 @@ aoecmd_exit(void)
 	kfree(kts);
 	kfree(ktiowq);
 
-	free_page((unsigned long) page_address(empty_page));
+	__free_page(empty_page);
 	empty_page = NULL;
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
