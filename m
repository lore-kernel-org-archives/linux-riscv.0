Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF865C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2EqWBUjPiEZ0z9TKeBqTcLY5YTijqPkL5tdR0wi/Zg=; b=MN6PjIryvx6S29
	4qLnEvDYfb3dRpwL068B9m+yB9+46F59i4RYbZ6drbf5dQVJiEInaTjSheeVbTIHb9D+LAQuuImj6
	liXrOt29x9coAc9Lu+QMTS2n2MXlSuRRpJm12yrMLdJrP0ZbyzWnYXNNypVa8G917ZLX76qAOnn32
	9nw/scot4Ix1b2xbS1+yaVN3hz0MumeltHLkuxYWSpOb2UsQWN+ULdAaB9sHeCVBuDtSkyjHSWUkr
	mdVRJgYKpIsJCtShnrNxlpoJXGqgV4t8aBXZDz8MsUQLmEDvF3HlCB5HdkfPKVImvCrYhv9bA29Sr
	iAiz22dnkO6ZZ/7CEtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prfty-004AKl-1g;
	Wed, 26 Apr 2023 14:13:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prftv-004AIk-1M
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:13:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f086770a50so48401035e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682518422; x=1685110422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WSmttwJVX3xHmgPFgVwGjOknrUn/kz4jodrd3gkVGY=;
        b=nUpENRZPbJ9VRxbq9YnAUcZ6Qhfzo+u1GDzlYj2gNjV+STs6mihMbTCdz1BPNtUcEc
         R+pXlCm42X5G6HyWFAbvmeLmSaqdQLFqDFZC/mUG/XveQdsNlbe/LUifKdNImKDZBV4M
         Ftg3CYV6BLDjE/IN9XLqUcecsc5MuWT2IebSpdzFX0JwaT2pH9Z2NjHgGYyC0TyJUquO
         r+UMjp2xOMRncMTDaOHj1F3EX8fs5/6k7HJqXzSEs8FZYY2Z1XjHtifMbcxpPCg9yuH/
         vv8AJslX8e1s3H4RGYtDG2eR4LbBeT9CxrVl+S9W/x999CMUGql4ztZ5r4eJSeEHIv2x
         K/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682518422; x=1685110422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WSmttwJVX3xHmgPFgVwGjOknrUn/kz4jodrd3gkVGY=;
        b=Pyqut87Y4WCfM+IbBOqsisZ2Vvqwmw1NkEuZVe7VnXZbTctlU7iGNXt46NRKsmVSGC
         o/QOdlLSLlaoxq3W1MdRd0kj/y9qBBOMriV9O82/LbXfCAwVQ/o8JiiMwmIuuig1Bzb1
         r5sZbWhlW18P5ZMnaO8dzySFvAb4CO0DWAWpkeOx7kMApmXLSHuwhQfLHR0VDXGVoa6j
         e7pYI9ifAM20iQDrvKI1V8p7Bm6PE0IOY4simxDbdH1A41C8ipyifoqwBpyCAUNBJBPW
         CRyicUSGQIzaH9f92LiQQFO+OLxvOoQHTJ7td4ISiHO8EaoTry+DCMVj+02R8LVPG/g7
         +m4Q==
X-Gm-Message-State: AAQBX9eeYTKTBbkaYdpg0WzfHDw+DIFQH0Q7lyzMVzgxSgh82/tgZxFr
	5l96j4Rpi5ausFbHnykk2tc0UpPvDH1rs5hpzL0=
X-Google-Smtp-Source: AKy350Y00mvkCw3mh27kYW5avON2Bz8Wp5ol2PSDJr2jV6aQ9MNNYgrOntorTOuMciiCLLw+Q1HAHw==
X-Received: by 2002:a5d:5222:0:b0:2fb:db79:7364 with SMTP id i2-20020a5d5222000000b002fbdb797364mr15837483wra.33.1682518422015;
        Wed, 26 Apr 2023 07:13:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d6646000000b002f6dafef040sm15932439wrw.12.2023.04.26.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:13:41 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 2/2] RISC-V: hwprobe: Explicity check for -1 in vdso init
Date: Wed, 26 Apr 2023 16:13:33 +0200
Message-Id: <20230426141333.10063-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426141333.10063-1-ajones@ventanamicro.com>
References: <20230426141333.10063-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_071343_483941_59B79742 
X-CRM114-Status: GOOD (  11.51  )
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

id_bitsmash is unsigned. We need to explicitly check for -1, rather
than use > 0.

Fixes: aa5af0aa90ba ("RISC-V: Add hwprobe vDSO function and data")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/sys_riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index c569dac7452e..5db29683ebee 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -282,7 +282,7 @@ static int __init init_hwprobe_vdso_data(void)
 	 * populated) or any value returns -1 (varies across CPUs), then the
 	 * vDSO should defer to the kernel for exotic cpu masks.
 	 */
-	avd->homogeneous_cpus = (id_bitsmash > 0);
+	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
 	return 0;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
