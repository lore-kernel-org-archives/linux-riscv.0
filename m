Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF582606D81F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0M5jO7Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MYLGErlk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=963JUfs694Jl9Rr45RuCw8i2zR4lWUTlhalexVuaJ5E=; b=T0M5jO7QmZjuHAv3sWjbHAfueK
	5xgmBhqxQkenLLHfIAkZmPV/md/afzZmdkxoEsYr3Zyazk5KagnwRXSoYZix7fTZeQFoV8HLpQFTq
	7RN2WfPkvONsb7y7NhCTFq6IPqVsnfJ7rmf0JACSp0LBDruxI1E4nAmqXOtK3w0eb1whgg5f3ajq6
	xKjSLwdYS2LcImoSPDP2ourX/CIQK1l6uyjPm7Fxb7fg3jnQoWAaKELmmKaIxflKQIXmNMq0z5YO0
	vmth4TRwAHlCO5+0jaG4DXDg7hiIf1OAFSoL5HILOh0PCvz22tIJWWPaoQUepsNwx7K7memB7i+AZ
	PxUt4ecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Aj-00000009ZUM-32G7;
	Thu, 05 Nov 2026 16:18:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0A4-00000009ZEr-2Ges
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:18 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so349719a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895480; x=1794500280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=MYLGErlkI/IHjVeS31zMjsEyH9LrDNFRfI8x9hJSlV5C+yFiZPitWfHdzBgMG8iWZH
         f4qSaB2Oco2rBuFyyyjQmV3Ur3bLSD2yNtkzPeLghO7IRVRaBOxwfGmH2r4wNOYA1nJ3
         W9ZtN+rXk+uJT5wEjs/ThwHJRS90PxmwUify9d8pX14iGi23qOh+LxYTLrzn2G77foOZ
         oTOXByT9bylKv45u9v0gOu+Xv7dMcDpJWM9eQf8K4Ar/HhzAIBjDfQWaLbzS7eEkKWGV
         V9jDdm0BWgUjm6bWDZzGCWATgL3eQARHsaow10y41MNStICPzzaLKjpT75NKAjAfK7Ji
         YL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895480; x=1794500280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=qKOmDRX0I+w1sQIBkWRfoFoBUQnFsbrDTJ3wDWw8/RJTOfYh42OitwS9mKJVT8nVqL
         CdPQ8us4ezfxz/PEKI4glI2aQ291ytVR7b+KD289BnoL3hiFDz8TU+uY/WCO7wCA1qS0
         fENTtzs1poBQxAKVwSPAM3Ey0smR9wBA6OGTdVjVM1swkHDeCTu+uJpPGs3hQzynIaRz
         j+oBYwGPMBn1WoZauGIHTcnfrv9LicvFpukU6KwZ5SbZYYIn64oe8823ImvHcY7ZO6XL
         PYWKr/Q87CL97Hp1fBLyPROK6IwBv037335mM8wWdLhkg0W13aWhxZRnt5wOYQgVYna0
         5j6A==
X-Forwarded-Encrypted: i=1; AKwUvBxjuMMGn5DpTYvt0VLU7qL3mZlVccsnZ9jQnfuXJU9CisW3VGWFktNeUb8SWVeMoaF68TdQeIee/g7nvQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lR1XM0oEIqN07m4Dkn/auBjWiKgRUAyRjOKha3GayDxJ6m3Eh
	ty6qE6sSutSTXn1+SgrZWJXRGgVCVxMGi4Tsmc0Wcn3CTevMj3k5ZgZ2
X-Gm-Gg: AYBFou3wvzJfJUx9ur1yBo3ktXil3DQSMmoiqlD57cXhuT4HdN4PhHMHELxDoB3+pPv
	6uA373dVRl6nXWgWRX2O+vKXy8VRDAyRXH/092scu6PaJWeFs7aZeI8MNl2y4E3aIAT0H+2LC5A
	Bdlov3y/9z03v/f9ZL2kj/vYz4G1tK2Me0p57OjN3Q7HyQXxy1DRcXEOzqh9s/qReQdYgP4lJKU
	dmAU8CkwfOHUXHsjcstDdoWFZ22wBEqTrWoJciHA82P8MNgBzt4gEjvRC8V/XWbteDDgYQpDNEX
	uEUSc/QtqeC3L68E6OCl7uWDpwSPcLt67cZ4CsyrWtxl2FxnjKm7HS1rSevBn9Vyq8+9OUkOm/p
	1iC+k/2jbVWmJH7gTD4lXXJgl4jM+G+Vx8VAN0QO3CAsDs4u/QlCN5CcmM+nhjjFwzN+fAJvx81
	Vx9bthgzSqOaFPrEd/Cfz1VgF6Zzn25S9cntR+xFWzdU8PiNudA6glMZSjlZTgtdySrCkAJP+bW
	5W2RXLMv1setujQOCNuSVzuMzZAaYW/RbWwLAi5IzXiDfWyXmioDVYFg3Tq2ZC+x4N8/LqeS5hg
	ITj/zzAa6QZcG+BwMDTKwkwTevuIZK92vAOmd8RaK4qX/YfyeGylb9MY+foWL3EruC+3ozgTRpB
	Q3F8yHWCltNxLAABfv/gWo3s5
X-Received: by 2002:a17:90b:4486:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b0afbf69a0mr1776647a91.8.1793895479717;
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
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
Subject: [PATCH 5/8] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu,  5 Nov 2026 16:16:59 +0000
Message-ID: <20261105161702.3515900-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081804_938823_140317BD 
X-CRM114-Status: UNSURE (   7.88  )
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
