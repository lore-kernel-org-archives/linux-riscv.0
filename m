Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ABD606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V6KWWGFa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZcK1UYN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rcqCQ3TAyavtqWavrcYY1+FTk1uZbmQ8cAOHrdSXvf8=; b=V6KWWGFaHkSfiUiaUH4Dg36CY7
	Z2YEPraNiCvdZYsOQoH+3uGJ5CyGz+/ONlZRqYs3Fr9RfPqd9nmM47f+cAUPkHShWEocEmNrepV8p
	erSxHefbQ8mQ0NTVBg8m8JfvIVGPY/G8ozkQz8zUYWMwBexHnqUyCoBR+0h7bVlzhI49LS2mhHXXl
	Fv1I6Slde6UNZR3aeyK2OdgTjyv+y5dipdNYZP0t9QmBXen52xYRAr+rUy0GM1mv3qVjjAvTBoJc5
	XTzPCKw08WMDu3KyM72AgLaifEWjPS19MuqvBw07bnNvTTyREV+E65LeChE4kOzQ1J9f+3c8eb18F
	RghKJsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwn-0000000E95w-2rfi;
	Thu, 26 Nov 2026 18:11:53 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwk-0000000E938-1ym9
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:52 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1a2761c69fbso9971525c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716710; x=1796321510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=ZcK1UYN4CeR3BkB8+Rp32vVBF0BlZePmvT9I42/PA9crnKbk2uLXmfxoc+tER4jVQm
         6ypKZQ/kTLzYVHXVnjlWz+lwHd9pZfn9z5PNt5GYZ6lzguLMwWCEJFmvPMl53n2Tda7v
         /KAPXLJyIcgkqJn3Nunxrpq13FZDGHXdHdDeFZ39xvQb/sFkHnz2enL2R/8mpHXmPJMB
         Tqnlca0lYxuwR5MNcA38/x2VrlKXscJWPCo/MD43+xivMaiGOymmtG9Hcsqxm41F6MrI
         D5qApVoKQ7PD+1fMuwfBZB+7T34dnk1MDQsGzUvtatTitlbTheu0MLjOJkanOVAX833Q
         fMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716710; x=1796321510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=JzihS9wjTTiKNKvH/wjQ/AoExJxnVDkqjAMW8xSRw2fPrZOd74h+514YA6ovJtGpaZ
         Td7iod00JTzPMEYMNe0rdRKvuSgh1K1Ow8UyRSJ75DBCXNqac9ZZXmb+Kv33wg8IUtvQ
         Om3fhplFbeGLpo79cPf8vlNlRWujsVvhrlzAIoxDXCDRIExfLx8NAzuPze4y42TyHJmS
         +W9KvPP6EPK0x/4Tg3zFMbt9l6nUI2aTsHFYxSNErmaCKPumLd/IyjEK/TIs8R7dKs/B
         gvowhAMLPWXP7xYaiwon6Weg1HQPFkpWVRuLxpg1QjOzMlFcR3ziW0LUe4nqJxoeNidJ
         cP9A==
X-Forwarded-Encrypted: i=1; AL+hErFwFEiVSYBzHmCF+U29qWNgYNO/u4LEr4XJkIhn57ZasedXr7zPp3cpMI2EMSh0HPg0jlYnyHMYflkpDA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fi08yW2y7dY8E0MZOYpamlPmzEKgpGWisu8Wgj2dtVocSS05t
	2YgWi2qGL2UEAwUgCGQ6eRu4o/Sr+K4YP8qJUesS9FJfNTXyl2grc/P4
X-Gm-Gg: AZFdTZe8D8iKQIHw2Ei1lZCXU912v5DqUFSw9Eq8kkD2L72GGfXzM4ScSi38YBwA1dX
	nH6Jv7U2SmMZB2O15bilnyEKZlwY7X0nGcL/jTRgt+bU9WfbbG+4U61b1twNNszQwieYLuKyLoe
	PO+8rcPPMQ50guFYI80UMszszqPZv3oGfeYVQxY3lwVqqllPtO7zENSxqU4f88iX29UxADm+OAw
	00+AU0n/CgJwbRBMKGaxy1WKxlQcntZnLB9oz0Oz3NjPM9fxHQobiONhnjkH/ZfjJlh2jJewK35
	enuhdRUPCLOYWqz7qcva7z/CY+BYqqSuRZWQpBpHQ31wo8qFBHs9YRJN1074TV1XDDthsOdDqFV
	zXRteePLst8YdenApCqRZu0XQy8W/wRJuDvvUOSO28V85+FYHDz23r990teeok5blVLralc5VhA
	eMHzkboX8am9xD8pPURZ7mt229xnbuhtvysrllKpdZy/hOXJXZEkeijUOv/sgC3yvaVLotltYMf
	HUkt6TtDd4MFOZnLZr+QZ6Z9Yo8KO1/i+bwQ8eA2vI+soRwaCJItqybRNOKtIm6KgdckaaOHcBm
	/pEYa9M1vTotVMS7eEPtJnrNPJsaNrJO8/fQpUejVly/Idfsgx5kjAW72KbfNdJFpLwlIcPWxMo
	HS5fUZgXGeiC03fxHfVKqzwQ=
X-Received: by 2002:a05:701a:cca1:20b0:1b5:86f9:69ea with SMTP id a92af1059eb24-1b586f96d38mr6533120c88.0.1795716709806;
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
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
Subject: [PATCH v2 7/9] clocksource/drivers/timer-goldfish: Set clock_event_device rating
Date: Thu, 26 Nov 2026 18:10:59 +0000
Message-ID: <20261126181101.3715754-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101150_518635_509A19E1 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

timerdrv->ced.rating is currently left uninitialized as 0, unlike
timerdrv->cs.rating.

Set .rating to 100 so the clockevent device has a valid base-level
rating without overriding higher-rated or architected timers on
platforms that already provide one.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 93a92a823f8c..f5019a6bb340 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.rating			= 100,
 		.cpumask		= cpu_possible_mask,
 		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
