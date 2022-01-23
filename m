Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF5C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8jENWBWIOH4ncrSyEbICZeLBihLsEcNjUXeCEUpsU8=; b=mL7hdpgzC1oKfz
	9wlrBy0eeWvIYkrlBrYVnfV2mR/fCMf+9Q5zbM7rMiferhQZSt3Zj6qnTnmfkSnAHHz6VTQQWD7xL
	ai+OYSUV/KVFtMVhek2KPlf446s9sOQVy8686p4G1FptMcqhO1H8UJSvzmCQbVn6ITYmviDoo4Cbq
	v4B7M5uTE3Q/B8M0ajyYeHOyy2kUnI/3Axu+pic/K2mvBe6tV9Z4wZU+Yr82JAEc4ZHSaCMOWdlMW
	xWDY1VD0EcS6BOnbfFsn4FMnlUJJlYStjBF3VyCuCmQaXmvlgxkrffcBRoI77rGDDEFst65u3bOGp
	olI9EiVH5Gd3zxTqGg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBbl4-000mGh-CA; Sun, 23 Jan 2022 12:14:10 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBbl1-000mGE-O5
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 12:14:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso13676684pjm.4
 for <linux-riscv@lists.infradead.org>; Sun, 23 Jan 2022 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+nwA3oOBPSl+TR4uiv9U29jJMpa18dwqdePmhgB0Fc=;
 b=G/86rcsOAna+iKygEHKojz4SFgYh6d3wQRAHI3RUb6duWAYiki8ojLgw2G5/e/0k6F
 4XrosM7Ak+WBL1dIE0b3uLCUn10ijpmSphLGBJgenOrXL/FqcpAtGxVdRdVPoNuj+3CK
 cD9rUfDQhEZVczsEwALiRkVl1L/Ab+fXzRqFZQ0a74bmoZd5IgaCaMmH0qufE3pu+obY
 C1DwCcVPlOdWNyavJhhSsL7KmYmnrE6bg89cawOFwft7b9zpHcRck4axbFuuEi4wi08K
 aVb8aWj+NwP6U/N0RUZb5Z0c6GpnkwWZ9cnQLt/I2dT7cwuCjsPf3uiHjOPflNFvesDl
 vccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+nwA3oOBPSl+TR4uiv9U29jJMpa18dwqdePmhgB0Fc=;
 b=avEnuW5VRnVyVq7Hh1ccBUbXRyIyzdeYk7Q5QSfCfDh1HmYE1XCU0jtFBGnp5ttbKF
 gYwji2HPf+Gr8Mn44Vuhph58z8zswC21w+yyArdwMI77N/1DFpyyogChleO4ZClNZCKB
 Uf06FGENzRJsa+A+ew6ga7F779ObWJenM1ejqCBaYpapL3Su3b0kCsA7q/1lD56yacM7
 AJ/WhfGL2oRGzaXIkjRMjMZopvJuczfQ9FSCfeg8khjyQHGWSDzakrfpr3JOuOYjI0ga
 F5bZ7/xY7EWBbXlC6F4wo5SJiJkyQvBbNJhgQnGwngnZGd5f+dHVRvHJ5sj485jAU5NA
 duPg==
X-Gm-Message-State: AOAM530IHmLo6h5beblV8GFSBpVUWLb0ycGt5Lf6tJ9ttgmzLypL/7KT
 5Ja4swumdF0gcta7N7EWau+Ns8uxmg==
X-Google-Smtp-Source: ABdhPJyihuFEJ2zI0x/nyZmL4dLx/2PhwLYF3IdrXxxK4owLoN9Mzyjh+sedfzn47ZdtC3OIUMsmmw==
X-Received: by 2002:a17:90b:1646:: with SMTP id
 il6mr8769063pjb.153.1642940046359; 
 Sun, 23 Jan 2022 04:14:06 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 14sm16621138pjh.45.2022.01.23.04.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:14:06 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Pingfan Liu <kernelfans@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH] riscv: cpu-hotplug: clear cpu from numa map when teardown
Date: Sun, 23 Jan 2022 20:13:52 +0800
Message-Id: <20220123121352.13199-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_041407_815376_D64E28EF 
X-CRM114-Status: UNSURE (   6.19  )
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

There is numa_add_cpu() when cpus online, accordingly, there should be
numa_remove_cpu() when cpus offline.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>
To: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/cpu-hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index be7f05b542bb..78d156a359ef 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -40,6 +40,7 @@ int __cpu_disable(void)
 		return ret;
 
 	remove_cpu_topology(cpu);
+	numa_remove_cpu(cpu);
 	set_cpu_online(cpu, false);
 	irq_migrate_all_off_this_cpu();
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
