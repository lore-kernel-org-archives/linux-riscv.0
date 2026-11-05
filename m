Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0750606A33C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OY6w6lB+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1LHtZg8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Whit5TO3nnTtnrPOm2zxH3vx2Y3LcXVPP2SPwzIclMo=; b=OY6w6lB+n+DGkjGkbBIi6dRcQ/
	wG9FlRkIEq+aXLkC9fYxo8gW5ZWmMYj2I5wipYC54rHmsUMh+OL8IPsOvUJp1lDiknoKe2wl3fupV
	4p84MSFbCgSZxJhGnjHerNsz/e1BW/TIkcJve3MCTSvA2mGT8aImIZfIFTsFtzQhxvOuQCmadQyEQ
	+dqI9H+nwttQKQeiEAcZc7RvJo/kYV/LvVYbz33CM2lcluXGsXAQ5pyL2eq5hpdQfvMXSVX1BVKV1
	5J4OlUBaOa6sYe6qU5KT3FVTofAXj//zvWj0JsaGFKC+cIPrwqmfTpCrN5VeDNv/invriWySbOGxW
	vnGRo66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0An-00000009ZW1-1Opc;
	Thu, 05 Nov 2026 16:18:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AA-00000009ZH7-0S0I
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so700495a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895485; x=1794500285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=Q1LHtZg8jYsm+bYJ2kw+Brx6Ssfm9ZArjFmYIRLOq4XesYxoBM/kKAFOYvoTsMd/Bz
         nm1kcRclRjxpRhprfnp22MBdtovTlcSc9chlwXGJG7uQDK0dfWkyPDzW4ptk14t1yWOJ
         /VlLad27Yszf9G9Z/5DLyUTThuayNryhT7RBqxh5ToN6ui0zbhPXvvE638onGDDXy2ak
         7GFHQok7peqqQSmRQpSOys5KYTMGKXNZH4CNUojuHYvHPoZRd07Mfw6tR/WHbq7vqn9V
         mRA1vloaZYNx5EQTS5QQ1XvsY3CbVq82PPINZQ9qmhcEJnL7D2RideK/8uqzraWoPyOl
         iT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895485; x=1794500285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=gM/3Z40lJ8us2FS7KKF1dw51ik3hYGfOD2oUbNYisDY124Ym5ytNKKlr0arxYLoGvw
         gbFZO23ePRwfmONAtCkJXoj5haC6EvwYhdybPPdQE31P1GXjBZdqae6CZz7zUpDDXU73
         BxYZy6uLAFU9YTQ5ooIxyw3ddL+SAYq+N93bpRvzVcvSqyK3zDaXGSBj1Hq6cOaKB83F
         HMOgrbNYu3sFIxISnocnHr03CBK11ek0YBwx+AcjruYDrz5g7BzvOAaeMOuk8dKJFWXr
         JQhsC/FCHgCXZdaD6Ng5ML6bO+XaupuOw5y2+JYL75aH5igtmNMJYKUKD0/ZyCOjN9Vu
         T8Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwgWw+bD7zSoUG0jzqWVTCC+G4aFjq5DjW2va0jUcVIENxq1g17855A356KdFKP+rg8hvDppXUK70+Z9A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9sktF0ZhUGOu4ztIqHnEZudSvK4S9G8SpZ/RSWdBnntDfCzyFe
	UADvMVuVQfbh35JcPdv+bemO0QCRsdFnX6giW0kb5M+JcXVOT+hbJj+B
X-Gm-Gg: AYBFou0e3WFlqNI7Afc9GsCET8Gs+fU2oDvonVhYdUj7+w9Dm/vDdV4qQvBZypFaEBd
	2AQZbCzX7JtfUBC9pU4J/i4dM0/gkdVdeKKiXI/k4TidimMh2Yt/VHggRQlio4CjidlhbSJraQQ
	UXjA/c8aKpMlKWMPkyYpO+eObIjNjq5eZRAUwpuPCfI/qIt6FImGrIm6fLxZNQjcv/eX2JQiyb5
	uIk4PAbFuUoL3YqQG7sMuDmbFogVmp686Nd9UWCUkgYng+m6pE0j1sHWvQrHHIlYu4Sm/AbNl0u
	Rs/HHJn/xtNZ3fVN5DzRdM29lzS6U1wdSmjWxyGRtXPh7BYmuEfghgww+ubGxTzd8ePPi6jTggp
	eyyQnE39Qf+ho1m43JDrtVNQIqbAmlC8Y3ypJtgDyONld98xP2EHtu3J2TVXzshQcK5POABCPtW
	vLcU3Xuv5jk997CyQSVpTErzUVzFSngrew3dGSq+yJD+Hdy3yl3PKT+yEplFmm4I6spKQj8N5yx
	jGKld81a5oXkc4aOGJtCWTC2N3QED+BNGqbXg4u2qkDAT7v2Asdv1s8V2NodZPTvFhcPXwUocM8
	CqkOBHclHUwL8bT6GCTXTHgIFPVKTqL1iKoIKEnlP7tl/bOMX+wgSoHw9H3YAHAJhANwCUGU41H
	zIMWXdIySepP2boNAhE2Db8A=
X-Received: by 2002:a17:90b:184c:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3ae897c4ea4mr15905533a91.55.1793895485124;
        Thu, 05 Nov 2026 08:18:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:04 -0800 (PST)
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
Subject: [PATCH 6/8] clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
Date: Thu,  5 Nov 2026 16:17:00 +0000
Message-ID: <20261105161702.3515900-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081811_069381_6F96066E 
X-CRM114-Status: UNSURE (   8.14  )
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

Leaving timerdrv->ced.cpumask uninitialized triggers a warning in
clockevents_register_device() when num_possible_cpus() > 1.

Initialize .cpumask to cpu_possible_mask.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..208b80c46193 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
