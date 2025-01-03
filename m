Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C03E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWiFjcH+lkMmfM0xrtRosmpbQQbfT5FY7F+ghlYABgI=; b=t+VdzKFseN4NR4
	dZLJvpDodP+IuwnChOhe6yODVtBn3Tw6mkhyZ2h9Xv+NI+PjlLZvj2xJOYHcI/dis616rHmnv2UzD
	tu5itqlKznleHen7XjRZESG2yvExgn852gLjZoDpc4MEHRDgk5OZ4kg/IWMekpwrlQRXj1v9mWa8R
	YtGqEasCzZKBmtw+eeKAEeWDsFCjDE0rkuDkjq3u90Au/3hTlIL2yOAck2nRJuC7KHB5sF+sZ7Nwn
	WV04ZJjp31Gcb9dpwTYB2hKSTZkUkwzgeRJNHmvknMD2c6zjnnpihnhEh2h4S1bwJ8ISf4KFyvnDq
	L2lNGkqQRA6n47Ptm1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2t-0000000Ccms-1gJJ;
	Fri, 03 Jan 2025 09:32:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2r-0000000CcmG-3lAU
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Jan 2025 09:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LeEQjuKWeFN2ZDkGY720uCzhuIIhCR6ezIvsDMVpnR4=; b=dTzebGzEQ5S/LyWeK6RiKQUPNn
	4AO2Z2Rymkj7SD8W2/k44Cmjnd6EgbyGjEGwSb3xwjtwTcj+7V5UdSdcUUJXGhp1C5CbkvWiemYO3
	PWd3i1AviL8qtpg3VM2ZxHhD2fPeaDdsNRb9flFzsiswFtz4ZsgydAG/atsFE3r4Q7pO5kOuxweSE
	baxFL++Hrlq0Czpr7bwCnnXGAUo2PCz+NJfd3qceUng2BIEcrk3+8uKJgIMnW69Vba8s45gY10h3h
	b2hobnlKkq+rnjujhkJ7GCB2Od/GigIx61scDDCl1NndMOTeMxaLRja5Krqj3IED8z/7S8+Tt5dFR
	/TaLMdMw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2o-00000008Lr9-2jBd
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:32:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21628b3fe7dso163063085ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896751; x=1736501551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeEQjuKWeFN2ZDkGY720uCzhuIIhCR6ezIvsDMVpnR4=;
        b=B7L3ynhdu3k8eooyP0ltv/7o7zGfjgGhWOQtjn8DrJGvGODpIfdIJtpRgAzSGifVwX
         zxjwI8Z0e7Ngbys4evZBLXYuteWHjnbZP8yF51ddcbxG6yY4qT9WXAUy3CQHnprJ8IgA
         CXc4Peoaqh7B194xyA7K7EPpPnXPZyWTgmkRuexvL2T9sIr7FeZqYh2PnQYnU/VsfoUr
         k47HaZUCXmEQr5pt2hgl3ed/uuG6/4xcBqizslxqvDjP9mLm+Ctl3beSxdrDPDjil/WD
         EaIpLLsDH4VZ10q97nQ3gAynq+y0H94azyz2S7utvE3NE9719NiNflCRgUmD4PzKStJ3
         OQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896751; x=1736501551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeEQjuKWeFN2ZDkGY720uCzhuIIhCR6ezIvsDMVpnR4=;
        b=bJquXDJBcFqRGB82LBW1zLAcr0uOuS4jNQwuLeXdTF3eouNwnKbCzVMUy4/GTIMlrg
         9Uwyq7KUTJLlvOfKboI4M7rtVxXkVqnoEFuFNf8pETGC5zDkykvKz/2/VpZCHcTRAar7
         TwPc8xzl82GR9AS3x7b0FFsuZ/X30UjAi2CKiA676r2WGnlV4RpknwV6xz6Chjjd0SjI
         RHmoMKTfEwx+sgdtmPFb1Lsp1gyCCij3FyxLIgHfCrom/T8HWdAYZL6Un5ioZc6+rePB
         YDxx7qeJhg+7rrnqew/kiuxj2wk8jdQfpFrUth0ImRCQiMKVrrM+fEkDEU4Sahxeb4PA
         YOMw==
X-Forwarded-Encrypted: i=1; AJvYcCVwRmZs3W23RlGDV/RzMlu350rCdE2ggfRYEn5AaOtW2gh0wJmUKotV3VVQwW0Cmcd3healAiXF6yyxNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9wcYB+G3+2ENuUtK6h8TD+zyRXKJrJ7NKKCSjLPh7HfJXBa6G
	JExx+p5JES/YciQCLTwkrdca2qjYAdoFaoseFMg6mDjEInk6I9m4VAlhaLEBxWs=
X-Gm-Gg: ASbGnctNm1WNbb04Z4cFQ/QvGv+9bSlr1Tz/DZDgkKB2DAV55jbcwcRuL7f0sFTt7Ot
	u+I2R+W1HuCvgELbAJ73OmL8aXAu4qsUO0S4YEYlm0ImOGnAejVbrDYEfa0E1+JTQdvWhP6uPOG
	K4/A6xhphe2kE7vJlzDA9a3tfFqvzwZt6sQDohG6CYD8t+VMHJyXQJIvtRS/cZNgz+gDS2V4eVd
	QVZwnalcO4fO6Nq3O4co9+ua1bx7IZaG72aJT/x0gAOYu46wW/+tSyaFyvHtfowBj5q0FC8vA9y
	UjbLEHaYTAOgjCrcnRB0TcdyAx2CU7D9SfRq6/c=
X-Google-Smtp-Source: AGHT+IG4QJX7EAklgM5+vW3k3M8U8TM525HblsN4/w7dza4jbpmygtOX60zOg0aNJpRf3CH/K14zmA==
X-Received: by 2002:a17:902:f542:b0:216:2426:7668 with SMTP id d9443c01a7336-219e6e9a26emr700703695ad.13.1735896751356;
        Fri, 03 Jan 2025 01:32:31 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4a2csm242227395ad.175.2025.01.03.01.32.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 01:32:31 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND 1/2] iommu/riscv: Empty iommu queue before enabling it
Date: Fri,  3 Jan 2025 17:32:19 +0800
Message-Id: <20250103093220.38106-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250103093220.38106-1-luxu.kernel@bytedance.com>
References: <20250103093220.38106-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_093239_152831_3B3EAB59 
X-CRM114-Status: UNSURE (   8.72  )
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

Changing cqen/fqen/pqen from 0 to 1 sets the cqh/fqt/pqt registers to 0.
But the cqt/fqh/pqh registers are left unmodified. This commit resets
cqt/fqh/pqh registers to ensure corresponding queues are empty before
being enabled during initialization.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8a05def774bd..84806724f568 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -240,6 +240,12 @@ static int riscv_iommu_queue_enable(struct riscv_iommu_device *iommu,
 		return rc;
 	}
 
+	/* Empty queue before enabling it */
+	if (queue->qid == RISCV_IOMMU_INTR_CQ)
+		riscv_iommu_writel(queue->iommu, Q_TAIL(queue), 0);
+	else
+		riscv_iommu_writel(queue->iommu, Q_HEAD(queue), 0);
+
 	/*
 	 * Enable queue with interrupts, clear any memory fault if any.
 	 * Wait for the hardware to acknowledge request and activate queue
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
