Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876BBCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LfOpRBGuPPxyVUDo0tY4Ba0lhgJjUz6i/RwEbqRYa6U=; b=gDttrpzA5WOrIV
	kRMTkKxUDp9khX7Z3u1+mUPKpR4iuZxDN/bDMoK4V40513OOXLw0ObInCE80H2aiAv6qaIW9YiX5m
	qaaCHhVICEYjBtsC/AX3MpXrenH9kJO4rioBxKEPuDlfoBlJ15l8LymFYxmGS9vdxuUVrAloniIFj
	d+/eJHxKQRxi+6yixFiF8Q3rEurqsiLZkvMwTtAqXfpeseVftk2u7+c8TQ0kM+3QtwO5wGgAZ+K03
	2puhBiJELiDyj4vtiMGwS69NJr2NpBoRFzaUXRidYOM2T/Q8doQDSnNN78tj1lsIepZAJq2RhhRbh
	GR2Pk+W6QZ4h+NmsmYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC69-000000057bM-2PW0;
	Mon, 15 Sep 2025 16:30:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyC66-000000057av-2zG4
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 16:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757953832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=90J5I7tDJWuTtR4pzepvkTqrxkeGN9PC3IPf6m4g6yQ=;
	b=TNpMK0Xwfwt7W3ni4U82FLuB0P1+Rr1kgLfqead2kn5DbZEuv/rtkEXHzyHHZuMaI9Zlgv
	m90ITD8HTssE8ckWsNZBNNfaWtwLQdrpS5EEkXzlMsFV/ezx6uQAQQcl+zUpEFe+p4S9j9
	CRtY7BoFjlK4JYRIEjE1pvLgJhMEQDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-oB5SOTJDMTicGcT5d6RiAA-1; Mon, 15 Sep 2025 12:28:59 -0400
X-MC-Unique: oB5SOTJDMTicGcT5d6RiAA-1
X-Mimecast-MFC-AGG-ID: oB5SOTJDMTicGcT5d6RiAA_1757953738
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b467f5173so30155675e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 09:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953738; x=1758558538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90J5I7tDJWuTtR4pzepvkTqrxkeGN9PC3IPf6m4g6yQ=;
        b=j/ymx93TgKC0MXkfKfd2RInh22ML5xlMQJtv+ymEYLV4LToR5vZWgMx9wS9C/+h8v0
         wKKOW0Kt3D0vchQzRzg5ItPJXiA0HW4X197IazwYnFC1gmAdjr7cn1r6xEb5lXwfA1J4
         51/624TO9iu5nsj59gp6rC6KObNmjJHRRCAfZf9ei6gH9aNoxawrQvdk9sJH4T2AwzIN
         a9vMk5nEfkx9FQs1h05gxrezMRAA6VMJfX2ogwMA+BAn/B6svPCogVbJn3Zgy8oT7Prq
         8SeGnKghbvBvRBZx6Hq8CN+Hwwoy1WjigSgFSyNMQEnrAy0+xy+6L2kNTz7sCdm7cJtD
         6gAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+mAv0TQDjobFMDa1hpcVPY45X27NvmQMmhnr1sW+EP1Hk/Xidu208jpjxPzofUJjRt8e7wX4yUnBnJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOay441th9DOo4dVIQI1oQy6lkcRJcg7balBkPafXxm7cp88UF
	Az0J2OsYw85urdjYeYk0TfHg4pPYZPVnvbP+zlzSUd4MKhX621IeTsmaYpiPvU/eK6DfThIWCkH
	y+KmnLRbdHEf7EjC7HDbN1/rizhQX6vG1/s3UCwfZrg//bIJumjGR6fIr3n10VWkb2flLqkvR14
	lGT+rJ
X-Gm-Gg: ASbGnct5R8FLGdWElFxUfZEJIm4dZlumIuYylMXJMBB8p6CgS1CPK8RGIY+nEUjDOdL
	jS+DbtnsurECu1S1CUKfn3IiqUYX6HxvTysTlM/Regm7ItkiX4dlnNh/5QlSGXHTCjX03xelsLS
	pjJhs+qzV0bcRT+D9DI1pB353p1WtWrT78svFM2xqkQhVfJluuSLGmUjqoznQrcCd1edPKg/2vk
	T24s3MQCr5s7tFx2vjTs4+/nthwTDXvcryq55Y6YyjIVzm72ElpBPy322Loy+4kdFhCSieiS1IB
	f4l8+4rQloxeq5VGctUWJ+pX78AIpn/uXoAfUsyubl0J/gEJ4tE0Qs0=
X-Received: by 2002:a05:600c:1d22:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-45f2c422f88mr52741725e9.33.1757953737861;
        Mon, 15 Sep 2025 09:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGcqLg89RzAzIylVbUAdhxQnrbuII6q9BMD4UeHPPpyAnAih60GUdiWlXGIqVqjdTWEN3ljw==
X-Received: by 2002:a05:600c:1d22:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-45f2c422f88mr52741475e9.33.1757953737422;
        Mon, 15 Sep 2025 09:28:57 -0700 (PDT)
Received: from holism.lzampier.com ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7cde81491sm12840179f8f.42.2025.09.15.09.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:28:56 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH] irqchip/sifive-plic: avoid interrupt ID 0 handling during suspend/resume
Date: Mon, 15 Sep 2025 17:28:46 +0100
Message-ID: <20250915162847.103445-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IyUYaxoTMzryzFiAH9J_ifyjFOwNTLYZNp0O0SRpby8_1757953738
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_093034_817504_D3EEEC46 
X-CRM114-Status: GOOD (  13.50  )
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

To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>
Cc: stable@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>

According to the PLIC specification[1], global interrupt sources are
assigned small unsigned integer identifiers beginning at the value 1.
An interrupt ID of 0 is reserved to mean "no interrupt".

The current plic_irq_resume() and plic_irq_suspend() functions incorrectly
starts the loop from index 0, which could access the reserved interrupt ID
0 register space.
This fix changes the loop to start from index 1, skipping the reserved
interrupt ID 0 as per the PLIC specification.

This prevents potential undefined behavior when accessing the reserved
register space during suspend/resume cycles.

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Co-developed-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>

[1] https://github.com/riscv/riscv-plic-spec/releases/tag/1.0.0
---
 drivers/irqchip/irq-sifive-plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..1c2b4d2575ac 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -252,7 +252,7 @@ static int plic_irq_suspend(void)
 
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
-	for (i = 0; i < priv->nr_irqs; i++) {
+	for (i = 1; i < priv->nr_irqs; i++) {
 		__assign_bit(i, priv->prio_save,
 			     readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
 	}
@@ -283,7 +283,7 @@ static void plic_irq_resume(void)
 
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
-	for (i = 0; i < priv->nr_irqs; i++) {
+	for (i = 1; i < priv->nr_irqs; i++) {
 		index = BIT_WORD(i);
 		writel((priv->prio_save[index] & BIT_MASK(i)) ? 1 : 0,
 		       priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
