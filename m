Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E830C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GTfGIXirJnpuY+xiwkLqGx1dOMeVHlrDsFJhJ7KTJGg=; b=AJKUNxM/rpmVTS
	SKXS3pJO/helS6akOyc46v1ELUhPa/YWSLtuwdp4KxCKRwZ1Y9VVda9VqQX3CZaKbQjsWaGmEPa4U
	zrcKGkYt9sKbvn9AT/jR+1GKfkta+blUBkh8mvVONrYtrDmPIW27EYtcjZADyXQfF2JJT5B0RVAJx
	feaTQdi3xBj7yt1kBbFfWW6G+UFz6qSe9DyYIEkv6YjXwpr5G959dYXurT4cs630zJfJ/tloeSyMO
	B1z/ih8FYwGtihpZU9jF+BzV/X9SUeIC2Zq4naNT2ngbDRUOkrf62K0Ui4+RjP1s6ivp4bhzQmxmO
	RK5SisQzSpbIGvCtTX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5vrx-002rE7-HC; Mon, 27 Jun 2022 21:02:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5vrv-002rDZ-GT
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 21:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656363721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P2ALvax4QLHT/PRvyeFgcmdY6fh0+YOux9iV3/Np/Vk=;
	b=hXbxlaj4Ow0Al/PXmeeUd6s1R1YUrBQuDmHDDjQbbnTKn6/rLq6vq2mQxpWDgHTwLxbubR
	F4RC1tDicrlLOu1adnzGzR3eplBdbOUeb4gtRZcaJcArfAsbmTzlsTzN5wEAA6kYkLYLxK
	TF2yHy8fUoGWVvmSMBVlxLt/ygu/pe8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-XYD2oU8-O0qtEheYxvbtbA-1; Mon, 27 Jun 2022 16:59:52 -0400
X-MC-Unique: XYD2oU8-O0qtEheYxvbtbA-1
Received: by mail-qk1-f199.google.com with SMTP id i128-20020a375486000000b006af454d52bcso1779007qkb.8
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2ALvax4QLHT/PRvyeFgcmdY6fh0+YOux9iV3/Np/Vk=;
        b=E3Fv/abgt5TBQzTIM5oZdV2NnVjN7DfeplXXoccBZSiWfQInADQGQ4eZfZ5CPvbGZ1
         qvBOi9gB1fWFOYri+0jtSF6AUOBBe3XuaT5kjIwrk2wgzv9jlNQlCYpUSKZq2Cm4J2iY
         Bm4HPiS/BQfRnvuAfvvv6R8jeCoUGMzOlcYB58dp1zMmj8Q5WV1Ap1kPdhYjkj7wAqk0
         FLQ4srNiHSY/L0pMwD4UuUfSKFMuCfU0QajWwRVSmOndgguSOM83eJgrw6ZcdsxgP9ol
         gRNjnkNH4tvC1eqWthrnmkOhXMVwGeN+HrARr0+Tijr8afQcjsThLNIC7KglGjz1RxBZ
         soJg==
X-Gm-Message-State: AJIora/zDbrm/mPHnoq4yIgVeF90i5FenYVxbhzQtyGuYySzMSdBGc2Y
	EPlyWwKVZoNWP2UPovtuO+PUMxJ8zLj15oFQXYnO6r/MZqY4bG4eTIvypxi0chn81h/TCSWMqml
	EbDsYy2mObXbSPQlu7062+hOUZ5/q
X-Received: by 2002:ad4:4ee4:0:b0:472:7778:ff86 with SMTP id dv4-20020ad44ee4000000b004727778ff86mr1162019qvb.109.1656363591545;
        Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOGQ37j2Gu0CzjFIVikcF7haS9EBEvbksI9EbPMv+s+mbkvrI4aOi6vEzPyMNbkPK8eNqn+g==
X-Received: by 2002:ad4:4ee4:0:b0:472:7778:ff86 with SMTP id dv4-20020ad44ee4000000b004727778ff86mr1162003qvb.109.1656363591235;
        Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x9-20020a05620a448900b006a708baa069sm1787831qkp.101.2022.06.27.13.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:59:50 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lewis.hanly@microchip.com,
	conor.dooley@microchip.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: remove 'pending' variable from mpfs_rtc_wakeup_irq_handler()
Date: Mon, 27 Jun 2022 16:59:43 -0400
Message-Id: <20220627205943.2075043-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_140203_742410_67ACA431 
X-CRM114-Status: UNSURE (   9.96  )
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

cppcheck reports
[drivers/rtc/rtc-mpfs.c:219]: (style) Variable 'pending' is assigned a value that is never used.

The fetched CONTROL_REG stored in pending is unused and partially
duplicates the functionality of the later call to mpfs_rtc_clear().  This looks
like leftover development code, so remove pending.

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/rtc-mpfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index db9c638e50f7..f14d1925e0c9 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -213,10 +213,7 @@ static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
 static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
 {
 	struct mpfs_rtc_dev *rtcdev = dev;
-	unsigned long pending;
 
-	pending = readl(rtcdev->base + CONTROL_REG);
-	pending &= CONTROL_ALARM_ON_BIT;
 	mpfs_rtc_clear_irq(rtcdev);
 
 	rtc_update_irq(rtcdev->rtc, 1, RTC_IRQF | RTC_AF);
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
