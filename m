Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4D1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 05:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7v3OhSOLfqBkMGkpelZUOyg9FQyxKNtVSA6NnhtMEdQ=; b=ALz4SkRLtmuCDy
	f2G6xg2ywB55Av1LybAyjYTQH7C4419Sr+ykPXXFFgaFWjGxsMl1LKNO/tVQvx2nVvriRNFrgQbDa
	ddke6N+rrmzl2sQvev9vqUbzXOXuBEFmrKLKdLA45GrWTOth9D4eFzuZQoA0Pr8QjzjCrNb9/L9yw
	b5M01+VSXNzqCfYEA6LV/lBgddmgukjF/XbSZWQy9OB8VLkLrUMdQQm0Jb8CQ92tO+w6EdnlFJCPH
	Q/2o8cgKEMeg08EY2rnGjjrYfbmzAvNnk3VFmUsSoY8xgBhIkuUWtOfzLll16fO9Vw+3jzJtfNMkn
	n9S4HJh03xsj+p2kCc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oS-00000005poO-205R;
	Wed, 14 Aug 2024 05:44:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oP-00000005pnf-37cU
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 05:44:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-201daff5461so1582295ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 22:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723614285; x=1724219085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7//UyL4OxAxRCQ/u8WgruiMwE8g6st4KW8tP9FVdOz4=;
        b=do8nd+L/74z1agT3gWMsw7THXgEAaB9ilurWNqTnEPMOZ8/d5o6EQjc1zmQt6lYCsL
         ZGVKyI5EAlG69nbch5ULbjtKXsxD32pdYySx53shIy+Nk4idaBVcfIzqtAjNvgDq6ZoC
         iAweDkEzmp68FM4OAavl9C6AezNP5ZYDoHb6UckGRBZkKOCkM+DxpeCLEujppMwA6ofQ
         tRh0Zdbq0XinvtjsoLZVjYdCmpUbfywLLjh42w3GUV0yRESUAzIOmTQGd/lRicbWjuWc
         TbTtDiMaqoJ1Bq2HVJyR+cGgSuqW7Yvce9nPFHEkJO0/ZUKVLvrW49LYjDCw9WMVBmz+
         HsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723614285; x=1724219085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7//UyL4OxAxRCQ/u8WgruiMwE8g6st4KW8tP9FVdOz4=;
        b=VeMqLguy1PVRTcEtH1/avCZOU9A/Oc5FKAEoOlgyi2Ud0eqnouEq+TDYwj4+FV+HrM
         Es3d09nQZiwoUeIryXjLwN06CzlcizYUnN5xV3AeHTm/ZocVQiO74kN3Yltdh43X14gf
         WSU+V61r3a+szVnMeSZAzkiazOZiiqDNr6FwXGmc48COsyZQDHXr9YlTbttaYr3m9nY5
         26ol3Rmpvl6/CrD6cCbXdGGB/n5S5DRhe5ibWRc1ojGlVtXwRmYcMxrxyoCxEWXjLMQ6
         22KeXYmxnC1WqM2sMMWX4ToLh9g/GcYKithTdOuevDW2c9+zPc8bpr4KhoYZV3Q+7bw7
         bYVw==
X-Forwarded-Encrypted: i=1; AJvYcCWKrWIwrivaDNDrB4S25rAbR/GloM+9cvzDVKRyHqtug+uW4TFoef45R6IXXtgJAu4w+EwI8yCZlj79xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWgz6DmzTB2LTJHkDdk6vPubKjOsQ+hMw9yEwoedP0u2DcA9Tp
	87yI88h/JG71SpZDgnur74eiYGlzL7NRg5ArmNJK1kWuNGKnlrEXB0P8uWF2rWw=
X-Google-Smtp-Source: AGHT+IH2u5Hy7JK9qr9NzQ+z/s4QL68RKujwQoMl1KYw/4mDtUdaVsYGJsQISTuL1RB+J7X1O07FeQ==
X-Received: by 2002:a17:903:3607:b0:1fb:8f72:d5ea with SMTP id d9443c01a7336-201d64a5b20mr21592635ad.50.1723614284535;
        Tue, 13 Aug 2024 22:44:44 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1ab486sm22062085ad.150.2024.08.13.22.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:44:44 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com,
	zong.li@sifive.com
Cc: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/2] cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
Date: Wed, 14 Aug 2024 13:44:33 +0800
Message-Id: <20240814054434.3563453-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814054434.3563453-1-nick.hu@sifive.com>
References: <20240814054434.3563453-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_224445_807598_2D7F1949 
X-CRM114-Status: UNSURE (   9.64  )
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

Move the sbi_cpuidle_init to the arch_initcall to prevent the consumer
devices from being deferred.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Link: https://lore.kernel.org/lkml/CAKddAkAOUJSnM=Px-YO=U6pis_7mODHZbmYqcgEzXikriqYvXQ@mail.gmail.com/
Suggested-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a6e123dfe394..98e7751dbfe8 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -592,4 +592,4 @@ static int __init sbi_cpuidle_init(void)
 
 	return 0;
 }
-device_initcall(sbi_cpuidle_init);
+arch_initcall(sbi_cpuidle_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
