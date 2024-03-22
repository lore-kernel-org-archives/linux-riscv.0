Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7694C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+2DwqHEUD0nqjtSUDIyBkaH4fpEjvWfX/Q/MHUzNrA=; b=qhn17mxR8Hcx2p
	Tpsi4kT4+Ka8g3HvmGZ5XtJ5ZfVRVR2ghyKpd0rv/O9d7Tbwkz6sQey6klQnRyEvqeJxGHl0waNjs
	TSZ2Cns52QG6ADVJaaO8tcSiBO1zltPZ0UpbDtUnE7NJxrGxKfF6ChWDakMMyG/9HC6vNPBGyFTX9
	PJtKqkrZzh1nWdNamYA323NZQjiCRHQ4nnC7beMES+4qtUxs9iZ6b2joyrc4YgwNgHX9DYEsDhvZv
	KdgjABE691nUfJJv/g5vPWYvknXMmyHbZT3Y5vnpsQCJK6w31TOqVODsDvIB0iWXwYGfm5Ggz73Hv
	hEPfFAv75zz/c02Y3UyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnalD-00000006Shv-2sei;
	Fri, 22 Mar 2024 09:00:23 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnalB-00000006ShC-10dA
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 09:00:22 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so957728b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711098018; x=1711702818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLBtKAVMx8UeOXZQaAlRR5fkQJeKEswMH4lt55EITFU=;
        b=Ogt79b+k4dDgYTUiKacxoD/RjWrNiLO0HizJMy0PVuF7Aykew0BGIoz5Ht+FncPM29
         yVIcjPiGweU2Wzm2gPD83jLWwT/moWcLqOE4FJo/smwkcytRuONbyh1v8yLpxeaSyB9O
         2+4hKowc/Tm7CEvbZQ/Pc2vaGg+hsZbdnyaWzOJYzq5bCmEJ0Os4R9Txl9zFKkuj3Az6
         ut6LNg2Dg4tzYbApQz8ksGxMXwHj6l/qoevrGzMnOmW9xtmADmlHewxqZYagfqCpCeiV
         q+jQhEl4pBq8+7mzkifHNI/i71F+ZPyNP07Mg3RMpZ1mWIotkXSjUnbGDc4M2QE6Ihw5
         BGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711098018; x=1711702818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLBtKAVMx8UeOXZQaAlRR5fkQJeKEswMH4lt55EITFU=;
        b=lr3m3xDxU1VCYJ3J4p85GjmVMkz1BySJP1NjQvlbSgr4ssWBDrFC4QfrEp/Ma+E8Q5
         EjKUxguqhn9vG4YfhbAlM/oed8inUnhUEuqivvKgcrPB4ppw18IhZ4NNfhDP9myJ7fZB
         YtKKCHbyqxo9LWkAUGSDC1MCZXChTzmjjr96K+KXIf4WCAsiJKeHBEgck5YQ5dePEY7U
         uRxp4snWquLwtsapVqrGtDPBLGtyXubW8F8rFc44jY6GYTE3Pr3IrBHmYHS7g/qTX501
         LxxLxhteDz4KFsw1ERjDIwQuNdKuMzXidLtTaM5iViaMeoVwrzZr/f8SK6+jevb3iIZh
         ws9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkWOLmses2/TQBRRBu4Uc/s+sF7kYF14UWkEmupXjfDonGFpJrcUMYAsx4HWreue+Bf1wCLiWSNsNv0ue6hc6UGYBqTlDHmQ/XfrieCJ0r
X-Gm-Message-State: AOJu0YwATVHEPvkNEPQI5Yin3oQ3Pw29cUtdLqVO/FU8mO53kzysO/K/
	gd9nYLPcstzekq7cpz0wkIlVX4ka1u4lmZCXqKsR9U+3KtApHqUix/Xd9aTIcLioqA==
X-Google-Smtp-Source: AGHT+IHMirPgQkP3KLpcCux/Dh+nitiliB4mwcW6qcn7NeTd3JjSGKRsUEbm+KaUNCin7isX7P46cA==
X-Received: by 2002:a05:6808:2017:b0:3c3:a000:50e3 with SMTP id q23-20020a056808201700b003c3a00050e3mr1844795oiw.37.1711098018531;
        Fri, 22 Mar 2024 02:00:18 -0700 (PDT)
Received: from DESKTOP-4R0U3NR.siflower.com ([2a09:bac5:6249:183c::26a:10])
        by smtp.gmail.com with ESMTPSA id y9-20020a655289000000b005dc4806ad7dsm1001373pgp.40.2024.03.22.02.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 02:00:18 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH] irqchip/sifive-plic: Fix error handling of of_property_read_u32
Date: Fri, 22 Mar 2024 17:00:02 +0800
Message-Id: <20240322090002.311645-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_020021_321322_CF0A8EF8 
X-CRM114-Status: GOOD (  11.93  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

nr_irqs will not be initialized if of_property_read_u32 returns an
error. Check the error first.

Fixes: 8237f8bc4f6e ("irqchip: add a SiFive PLIC driver")
Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 drivers/irqchip/irq-sifive-plic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4fd9517..f436b61d74b0 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -428,8 +428,11 @@ static int __init __plic_init(struct device_node *node,
 		goto out_free_priv;
 	}
 
+	error = of_property_read_u32(node, "riscv,ndev", &nr_irqs);
+	if (error)
+		goto out_iounmap;
+
 	error = -EINVAL;
-	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
 	if (WARN_ON(!nr_irqs))
 		goto out_iounmap;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
