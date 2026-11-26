Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DB606A334
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U+hxTn5v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaiAEW+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VGTbt7D7DIprLwxs7f9ON+uNB6bjfgEPwPI2w3PmVIo=; b=U+hxTn5vPWMTNez7Q+kVFCInvt
	24pvrWYhy9bdhvrywAYhOLwV+YY0/gA7FyR4OqucVtefOIH56BROlRfwg2EtPZGrk1LB+QROK9wyV
	SXQjLgaOPjOj+n2Sp4MLQ6alSyP/oNvG5tjwNTHPnDjEqtvGxg8Abzwc2GS5TWLXismELlRZfA+H+
	zPy8DVywcP/e2R1MsjQLjOiZ88zqu5BDNPXkVuGNnFDfkllyEBj0m/LM2aMFetcAhYaKQ2QbXmnO/
	AtRSt5kKijWcPL6P6kVATIUAMh5EmjTC27qnxj2EeQpAhNC7QNk6E99Xm3ATkqH190HDOCYA7FmP9
	mZIFuZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwW-0000000E8rg-08Zc;
	Thu, 26 Nov 2026 18:11:36 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwU-0000000E8qN-0lDZ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:35 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8174505c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716693; x=1796321493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=xaiAEW+qq9bLyBJ6xZLz83P9wMrKYuV0hz7H/7/9G1MrXNEZOdoXsmRqiV4b0A0sTz
         9jyKoi0qVHfqXgVuWlwIGNOFIWh1Ox7iv9/BMP6dj5JOxvKyRf1w00xHu2hwMKyFgQht
         yV8Ihry5rGK/SsxOFXfjh1DTuNvgewBl9/towEhPBQdo2awULLkypcOj67HyB4Hyvmx5
         U42DY+JMst9KRhUKOMnhgMJYDvp9GSzSBLxlv4ZqVr52vn8n/qOMp1raZg5cv39n1UR3
         JM8DCDleKIqpi0YpwLit4RdMu/iehWDCMrmqbMLXHpG/Frnt9zECekB7QzDs+L2q7L3T
         +tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716693; x=1796321493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=yBWsTmiz9fRnvM1FFqeJgLD1hk/FrqtjBLMnLwYBahp5Yv0XSa8sqUEFOFLGhMIpRU
         dhLX0h9buywsW9/k8PfyNwjo+hMYxOQocBbbDvQvtKCVlwHZdwT0EBiI9HwNEiD2VW7N
         3okM4kOxiqybSwGoT/SvxK6FqVXwfu8BjuBAPST+sEBp64lpBn+i+/yH4EN8ljc1CUEV
         /nCF919/9dUBQWfzMKYL9TUCfMx8NjuZXq3Y75I5hEelwHqNK3jUW3sRqpbFl5c0/i3y
         ySETuKF8v3thwfXq1Nx0AtJhhUv/zO5CG3nAkVs6DYNT6uQFZV60PTMIspX9NGe5wsOB
         WjSQ==
X-Forwarded-Encrypted: i=1; AL+hErFozOYbo9n+gftICRIPHv/8lYUaaOgP9COz9BV4lmtpNhMKUfvoNHpFfRQO5wqd/6ye+J7V3Ut5lvz5OA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Sfpps36+Fe//xHnK0K569USvUMiPHgGNK/lQUOACrjWHcxyT9
	OFaej2sijKojq6LdqdmGGld+TdGYXVZXrJdhNDmxOgNHZZ7CKpmlAbWV
X-Gm-Gg: AZFdTZdFGlni5BLc5tbZFiF/Yye+MkIEHXL5xVcFomke1Q1Z2QJigU+xfWeAPS7cx8h
	umE8IKg3bN1QSJTUkSs96ywuNLHRm3lboY8e69OLWlmX3Tj4RpnQ2tZGVuuqQvl/3VCQaE6i8me
	j988OCWO9FD+9F/MmglMrZLSqM+XalK3RrY1DKZkbJ1/bGSXjKE2YftrB4S5NN1p9hK2Q3zA69k
	l6t2txKHkEHWwG5msNaM9VmKSFPBh6oEOiYWn+N0zb0n4UjikbSxiq3qdVPzafVPLdOjLdU+YBH
	c82uo2KmWCFBY87R8w3Q+MwF9nN5X93+OEFi5AM7XXWwJwwxK06/TYTRf6giCyF478a8yjXpZRl
	hWzcZmUkp42PKa5PLNTWGN+AlPQIGnfnBaer3qbYt/v6PtwknkSGjdlN2QLZV2Lk44r1EGfgZfK
	upIJvxgkJ00KSNItxxUYeBH6EhWS58UwSQ/R5S2/5SiKa5Biw26WUURAja7rSheMAXJlBmN/mIl
	sCU4hjId4lUK8kl/z/gl3yprt4EB+N8uhkFlkjqi7Ht/l920g7L9uy4X8cz2ex0wWeIj5ewEukD
	hAybr2QJO39OnXvvcst5oL9i8MUnSdVCtG6BZFOUW1mSMEDWVD9c2CqNWRRQpoWIuMScZ3Q2vYo
	8zx7b6z+JsiAYH1c3CKx/UXpKd0xWtkmdm4re7e8EnxEH
X-Received: by 2002:a05:701b:4588:10b0:195:76af:b810 with SMTP id a92af1059eb24-1b5972b4691mr510797c88.25.1795716692917;
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 3/9] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu, 26 Nov 2026 18:10:55 +0000
Message-ID: <20261126181101.3715754-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101134_220708_A27D680A 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

goldfish_timer_init() ignores the return value of
clocksource_register_hz() and fails to release allocated resources when
initialization fails.

Check the return value of clocksource_register_hz() and clean up
allocated resources on error.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index b1dc8b388470..8c312c3a64a6 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -131,7 +131,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = request_resource(&iomem_resource, &timerdrv->res);
 	if (ret) {
 		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		return ret;
+		goto err_free;
 	}
 
 	timerdrv->cs = (struct clocksource){
@@ -143,17 +143,29 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.max_idle_ns	= LONG_MAX,
 	};
 
-	clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	if (ret) {
+		pr_err("Couldn't register goldfish-timer clocksource\n");
+		goto err_release_res;
+	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		return ret;
+		goto err_unregister_cs;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+
+err_unregister_cs:
+	clocksource_unregister(&timerdrv->cs);
+err_release_res:
+	release_resource(&timerdrv->res);
+err_free:
+	kfree(timerdrv);
+	return ret;
 }
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
