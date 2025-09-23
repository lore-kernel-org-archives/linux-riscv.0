Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E2CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YA7Wq4j9GZYYz33vmgLopVw2MGoH+ClmOnpuvpIloY0=; b=JMEt4MrGsvMoH5
	g6+v8cOkbzkqyJpgkHIZmFurAlVNhuGWmsKum95mRBEeUVmgXnOmJGShKsp7dFrCVwcW73D1n1ocy
	5+j9wJL1xP5kjlKDyj4HThARuFU40jQuaonPViye2wnH3ZjHSD/c4hyQe9viEie4v7sLPbY9byiu1
	fANJ9ag9SUPCiPJ6ekdY9N5CvfgOgUfWIeARGuhpJMge8Lpah+6q+R95wBIE3VeZvaeiwZrIek80O
	gyAE/pAhomuBjug0hap69kPI8i+3lXC2aUR+iQ87JfrMJ7P3JRTlU2SzyXxgA9VOjaW4Dfn1lXOfH
	uSnwzXDWlFqRBQZHJ69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14FZ-0000000DshL-0FgI;
	Tue, 23 Sep 2025 14:44:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14FW-0000000Dsf1-1sB2
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 14:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AfHkQLmJzDaguPM1LLGZDRbh3ErHlcNdVQv+rG4OVec=;
	b=gevbr1KHzsYfKmg1giNSjae/2jYZoY/tqocOGLXcmY/mi3u7ycyFKKSrBp+LFXFN+1SIkC
	KJzt1InC1lu4ZwpjvKDi5OOho3t7QJOpeAVqMveT1Z3qVb36mfgH4yX7VuJW/JpCb6NyU3
	to7XkU1Qqx4aYOevCMC8lDY70k4ocQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-McGUwglxMWKaKbZeS74aJw-1; Tue, 23 Sep 2025 10:44:06 -0400
X-MC-Unique: McGUwglxMWKaKbZeS74aJw-1
X-Mimecast-MFC-AGG-ID: McGUwglxMWKaKbZeS74aJw_1758638645
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45f28552927so47866525e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 07:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638645; x=1759243445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfHkQLmJzDaguPM1LLGZDRbh3ErHlcNdVQv+rG4OVec=;
        b=vvFGsP4VnZxoCBmZZifmn+Q3QOdUz8TTYeESqFD2Amq57O9nLkNazr7HzzB/LedQQu
         jwPiECf42hoyTWAQwJbnSXOJ/JXkwP52ZzhMPyLCz/hrxgOJpt/vLBeNrSFVU6M5takh
         Lgweezpr+H2M/XXdc6eveI5O4Tz5RXgXedvyefwXtyCJ6ugCqk52TgP7F7xPC7lw5PI/
         WfLPEY2DUXP8tHZbEOQTZKq6JdqDOak+C603naDxUF/fl7TqLsvp+NCcYE8dc6GER1Ts
         eVnNeXmR/xfCsBYffEkiofklpGFqVl7NQqcfkbUiTgEeGUL3Wxm38+O9yDzzDFb1gDvi
         J5aw==
X-Forwarded-Encrypted: i=1; AJvYcCU4GSyyl2N9l4BQvQ8Py/R5+BHcl1JtqZ9ARPchGF2ppnCZjOALuYwmpmeChFRfYNZKAHRKm/eJnYDzLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY+LeGAX3KCcM9GIAdps7KWiuha3eNZf8KiS30bHsP4BS6r34p
	3kEHJjXbfvgDeZSf/hrDeNPaOJJrCtT8CUOdGTVrXe2yY2iSFihfvGTSVpjdPYJgV6IUxUU6xiK
	WJDRqOziwisftWELdEryBxnuLtWBEMi/QdsKyYtemNEF+SJSmsBKK8mR1apTDsj0v76Hg/w==
X-Gm-Gg: ASbGncvYujc84zGaXzBpA2Hop8Rrzswa8Zm0kZ/xANziC1Y1kOr321IwHoG10udydUN
	AmZXhlqyV/SbWEjKtHb87HB/0eXBGJR5eIQbsnnyLNyZn3G2K7+cXfc7+np8ukvPW1Nspu+R7gp
	mllKZZQqLHR3J+B3EGP8h3+3Lhkv38r+PBq0WVbGGNJnZr/sDtyn6iThtckCs5UdLIB06C7Nljl
	uoJq9BsHVg7fXM3MaFWPyi729wbfCKdxtlbb82eZuoNaVvF4usONBAzjBe/agBb980DRdf0ISKj
	c91GiQaKJOqps6lNfFy7owPCm2/wkbWRDn7ngQeIDrH7yYx2kg==
X-Received: by 2002:a05:600c:4f42:b0:46e:1afb:b131 with SMTP id 5b1f17b1804b1-46e1d975235mr32497675e9.6.1758638645186;
        Tue, 23 Sep 2025 07:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtR/o9bQUXEdS+Oi31bQdhk8BctYD1m5Uah5+e9/ilwUN9948r0etgePRaDlcvqrdV4w3WVA==
X-Received: by 2002:a05:600c:4f42:b0:46e:1afb:b131 with SMTP id 5b1f17b1804b1-46e1d975235mr32497385e9.6.1758638644622;
        Tue, 23 Sep 2025 07:44:04 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbd63a2sm24054261f8f.48.2025.09.23.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:44:04 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Jia Wang <wangjia@ultrarisc.com>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v2] irqchip/sifive-plic: avoid interrupt ID 0 handling during suspend/resume
Date: Tue, 23 Sep 2025 15:43:19 +0100
Message-ID: <20250923144319.955868-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FQ08fn3xsyeNhP9ehXCP2I3Mh-3Rldc41SF47NJSMFg_1758638645
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_074410_557379_61D36419 
X-CRM114-Status: GOOD (  12.54  )
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

According to the PLIC specification[1], global interrupt sources are
assigned small unsigned integer identifiers beginning at the value 1.
An interrupt ID of 0 is reserved to mean "no interrupt".

The current plic_irq_resume() and plic_irq_suspend() functions incorrectly
start the loop from index 0, which accesses the register space for the
reserved interrupt ID 0.

Change the loop to start from index 1, skipping the reserved
interrupt ID 0 as per the PLIC specification.

This prevents potential undefined behavior when accessing the reserved
register space during suspend/resume cycles.

Link: https://github.com/riscv/riscv-plic-spec/releases/tag/1.0.0

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Co-developed-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Co-developed-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71e..9c4af7d588463 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -252,7 +252,8 @@ static int plic_irq_suspend(void)
 
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
-	for (i = 0; i < priv->nr_irqs; i++) {
+	/* irq ID 0 is reserved */
+	for (i = 1; i < priv->nr_irqs; i++) {
 		__assign_bit(i, priv->prio_save,
 			     readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
 	}
@@ -283,7 +284,8 @@ static void plic_irq_resume(void)
 
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
-	for (i = 0; i < priv->nr_irqs; i++) {
+	/* irq ID 0 is reserved */
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
