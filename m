Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685DCC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 17:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m46Dvhb6sEmfoUb3jYymvZnt8xL7hox73acsxSDknL0=; b=mika4FJULR0y28
	fDLW36ybdZ1WX8826isMVvU4o3HQMv+cZ0QwKKegQ7oITEigWvq+wDo6fmA5/ZbImTuXayR120V6A
	1RIgb6t02C/iM5QX6a452gzJZq1Zu2j2I/rZwUGw+1HBN277dDWe8PSIrig97sdGynfZc6A0jyayc
	h6QqFE6X1zcES81ROafaPFKe/+SthNldVtral7CxqU1yr0POOh9LduoSwOzF55Oj1neyUBmkNPIge
	oJqTbJBkoEUQQCGy5ysW/B8J08Gjj/+RBU+FjzhYiVWfLdh6n8fHYQnSgmdpj/ht22BaQ0OPVvi2k
	FINUVZ8vR/HXQULTr9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtjh-00000006ZEH-1Lqf;
	Fri, 01 Aug 2025 17:40:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtVE-00000006XUK-3zUZ
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 17:25:10 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31329098ae8so2210771a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Aug 2025 10:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754069108; x=1754673908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02fkad4eKiB6xVcDH8lydQ14lNJppnH2NwDAfq+kj7I=;
        b=HI5T9dh3xb9KvDGZi5HjsR504SgDRNZYogs4cfw4wajeiQZ28iP60lL1pILhy3djPF
         loJ0x4ZCYoBDlL3t+7RzhIMrN1HMfv3vFkHRjuq6WMko892ZpLhGcu/RsGGYytFf5ndU
         rfW2Rr1R+fXpmyo27kd3ZcsLauOR+TvR+/fDmRPYEvkx+rUqwEosOz2Ln8iF5BbbR5qA
         P2yfBufNS/VSgMUBENMWb0jDMX67up7QDgOASvTjMKfXFv91xCqhH4kMlz7Eb7RL0bnR
         C05S28ZrAt/gkUB/tV936w7aGwzbBFugUP7JOiVTQpQqC0sIwoD97hlQj0BLWk9XSSz/
         t9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754069108; x=1754673908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02fkad4eKiB6xVcDH8lydQ14lNJppnH2NwDAfq+kj7I=;
        b=SIfhydjiiX93JQhWnuieWkmrD6BIEcUu1V5lvkmOfYo+lZof8kWmLYB90/9lMG8B+1
         0On+40A6SYlxLn1Olv23taxR0pIj33ySb6V6X2v255XR3IFywW2k7N0iPbqK15cDxPqz
         gmYoPQnWtyegrOqSVe9sopRks47E+MfqXJWYukaKjsQ96su4uaYn/ZOgawcnjnTbYYbL
         1PWcI7Vq03iluUxmL3jp4EJn+zqG4cciSQLcHEcATUoMd5tHhDIOqu9OPap8q0QnQbp7
         8U4cYeGHgBROZK1iggsLdmpAJa4BeQnDgx/YRBsgJK48xAb//l0bn7jGkt+iwIUc06aS
         cx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBcMmi7vNmjres54ZwbhS7qubBL3qtxClgQEkVh2Xbc83CjYDZYCGG7SmS551bfsFuRDg9urzwNhzgiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZNjhJSZ2fXoEWwi0X+optD0k/6RWunfYdfNjqbkFwQF+gOrkk
	HZYgjjXl3xKkGPSwHJp3cZIcq+BXy3uE4+y8Xu3eZSYDtT+0c9suUVQK
X-Gm-Gg: ASbGncuPLikGI9u6N4Xt/+WcfrtnzOEVyWrFNpcGSadNkR4Iq+MBUNnQuCJCKXB+0iL
	70VydIhGMnsHciP0O+Y0xT17KuPX3d9T9BvQD5k3b0yawtkpCEM5LWkDTIv8iNhZ7Ytu5w2aPAl
	ziwQwK1IORMWB+zQnTXgs4SoZe8dWzjlks17hJfwwnsa1tTo+MOPiZ7UTI2TBoCJ4a3MymgIudR
	NkAnGmCGbxdCF7GcsB4/hHcrQFLG1XfTabjb70WZ8CEK9zTcFcAyc0+J4D+JjzL2Re102vARgRP
	YRnzoBKRcdChcm5izxM1RZmBCtLx0GNnjrmrxC6nHeniZ3/kxNh/Agy5brrphy/65lB2sY5Diq2
	z4wQ6XthpiwzPXzVrkLOEvq73wgWs60fdEDiz1bYhLN8HIhlu00YCymK0ixg4v+xcuwcvnaDn/Q
	3Egqjk/Pts
X-Google-Smtp-Source: AGHT+IGOvEL/v0KJNKqTgoWnSa8t0f3UojSYww4el0ye4wJCFD+wfbx7lRNSwg9E2lInbee/teiDxQ==
X-Received: by 2002:a17:90b:58e4:b0:320:e145:26f3 with SMTP id 98e67ed59e1d1-320e1452b4amr9666855a91.8.1754069107844;
        Fri, 01 Aug 2025 10:25:07 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-320f4909b8bsm3171514a91.16.2025.08.01.10.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:25:07 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: anup@brainfault.org,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	maz@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] irqchip/riscv-imsic: Fix 'imsic' dereferenced before NULL check
Date: Sat,  2 Aug 2025 01:24:59 +0800
Message-Id: <20250801172459.94708-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_102508_996690_8BCD5E47 
X-CRM114-Status: GOOD (  10.46  )
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

Smatch reported a warning in imsic_irqdomain_init():

drivers/irqchip/irq-riscv-imsic-platform.c:317 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see line 311)

The variable imsic was dereferenced before being checked for NULL.
To fix this, move the initialization of struct irq_domain_info after
the NULL check to avoid accessing imsic prematurely.

Fixes: 59422904dd98 ("irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202507311953.NFVZkr0a-lkp@intel.com/
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 74a2a28f9403..04037653f274 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -307,11 +307,6 @@ static const struct msi_parent_ops imsic_msi_parent_ops = {
 
 int imsic_irqdomain_init(void)
 {
-	struct irq_domain_info info = {
-		.fwnode		= imsic->fwnode,
-		.ops		= &imsic_base_domain_ops,
-		.host_data	= imsic,
-	};
 	struct imsic_global_config *global;
 
 	if (!imsic || !imsic->fwnode) {
@@ -324,6 +319,12 @@ int imsic_irqdomain_init(void)
 		return -ENODEV;
 	}
 
+	struct irq_domain_info info = {
+		.fwnode		= imsic->fwnode,
+		.ops		= &imsic_base_domain_ops,
+		.host_data	= imsic,
+	};
+
 	/* Create Base IRQ domain */
 	imsic->base_domain = msi_create_parent_irq_domain(&info, &imsic_msi_parent_ops);
 	if (!imsic->base_domain) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
