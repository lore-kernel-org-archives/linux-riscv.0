Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4E9606D802
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0JMPrgzy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPgn5dk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J2wqKVDSnJQ0bYaGo5O10H6L05aaDxZnCMuIvyzEaSY=; b=0JMPrgzy99LXsUSn4vsHbN4Dsu
	DokL1j52hccdAtdGXo1nGxPTEx6yupY/aCezEXQYtAxM+/TAguSadrltKWOY8FXL4JpgJrBTbDSz8
	gdsKidv5RosPKoAVWapnmbt4Y5s63TFPCG+LpoqVlGWVz4E/YkIv8jXly4zm2Hw6uFIfPH50XLx41
	+B+cln6H+JORa+peSZiMp1Ti4jgsoUZQ0ZlO5BrZn8c2RI6F0/ikSiIVhGvJGB5v7JZmmht/lWp0w
	8/KG9L8GOyLiazAvktZ7l9o2dfnCaDjzxUoxmxN3M5Gol4O2dizKS9jbiaoGXhRz4q3eaoUaOd8KB
	/wgqEHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0A9-00000009ZH6-1RPa;
	Thu, 05 Nov 2026 16:18:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09q-00000009ZCV-3lQa
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:17:50 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdb681de50eso156682a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895466; x=1794500266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=IPgn5dk430jOpPixz3mglit6FJILobGPstUFzao9k8tKTMsyokDcEwfzePTSjrsd55
         r7fx/6kL4ftnAaqFe5FEYwDYf3CkPmDj/pubvbe0cLeyQT+oMncsoXdOXDMJXnYeqxI5
         Wom3Adedl9Rl6fJ0Yb4QaTq5CQBrjrwRTe6d/u3oeJMdJzCTSh+rvpYWjlQCTLHFggj4
         FKALK/lM6qCTLNCd1jKKcvTObcyOzt+t6eEHcYcmn/DchmRKfP42ezFHsdpeIySrjAUe
         82MrE5VCYsCa6poTDvtA/LaL/k3XLEcr6dQfVBpOZBMKK9QorMvYDODKAN/hphrEPtCx
         8P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895466; x=1794500266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=NpUBRCXb7E/t6BwfexX0EwFuyCrABtQ0WzjD/4Mpys15gMp6bjmJEhVGa2EMr1+pt4
         YPQfd4tgesR6Y//jnZAzRNce5hRhBE+7Yufn7WB2c0/7XZdIRCcs7OzR3+Ur1sRqeAcl
         e5GRlIwxbDhLfkz3Y4y4zx+Dum8Df9flPCFPNf0/rUo7KYwk33MmM27pNUriaRu169Yh
         4w0lhGXlNqqYITG4JHKWjIcpeIpqwiKZxNfjZ3yVRbGnvdEKr7L07nqhG5++e4AGMkHR
         u4t5PY2zcSuH3CF9zywTE7HIaUC3uKvNoFLCSEPO7QLiRJT+aZEf1tVIez49qn2/Tafq
         aAYw==
X-Forwarded-Encrypted: i=1; AKwUvBz22VG0/gPGkPR9KVAN3lnpRoxOCkzU6+Cj5lbL4CMxeYSMSINcVKH9fL3JeZU5PdNYwZ4SBv0lfZ0mPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/EcaKDKvNRvG6HdDZsTnxxALzHsU12ZzLVHvabq8qlPChhqaBD
	PINChx+D4WsX2va+mFH2gb6x66tuhBthWZEU3uWLLdQ2+B9z2jqjPYQE
X-Gm-Gg: AYBFou17yGzGLgrF+vPBimCXystjw07RiimRdf2jh/VDV46u4Y+BysIxabbhlhej56j
	t/oH9pnDKqo/5IX68OpgPGhh4xxWMShqcH74hbNidmJy5xD6Iuq3Z5gs6avyWz5HoqwCFaAaEoX
	ttzYyRhH1UgmjDFuV0KW39+OgDJhqbhT/GZJiFUHUPUPGzcEhZoSGRa8i4EkGySauiWru+Xhqqo
	SM58v9sh07GkFDLtO7pHR+7Hv26Ma4Jfx0WIR9I84AUhq94GO44xQXz9P1uBXFI/vlXIMJKPjvE
	/J1ip37X1m5XNH3pY6OgbtE1ddJEFEilCi+Wu8d4Ziu/951QY80p7A7TVTDF9ovEoG5Cf4dOwEV
	S3Vz7CvhpPi1VCCnuwQYX6eqEkJ5DfMeGy/OPvWjjWv8BUeewBuAGM9JHs6aIDD81br6jJcozCw
	ox/rK6uTpJUyuWkpYgIbC4G+e/yHtT2lj2F/hldaSt6/ZRSmvmii9LXEP/VtTgWtQOgYJ+ou/fJ
	tj47W+V1uoL0qE1SivfCmpdMFDwr3GigK8MSCXAg7Z6BpNHOAUPaK70Y1+pz25EeCjckeaRAya+
	7qRK6ySwPQp96TA/sjmPRL+OSNqscHaMFw3omBEu01gza+kv8e95R1nDQtVFMEo1O6N9oDL2s3J
	nLV5IMsEyCy8tyFpKmwcZsKc=
X-Received: by 2002:a17:90b:17d1:b0:3b0:9941:8d41 with SMTP id 98e67ed59e1d1-3b09941917emr5299410a91.28.1793895465780;
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/8] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu,  5 Nov 2026 16:16:57 +0000
Message-ID: <20261105161702.3515900-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081748_555845_6D63DE50 
X-CRM114-Status: GOOD (  10.28  )
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
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
