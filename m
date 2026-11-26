Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C83606A32D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJq8hXtb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7nNyfNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QDJXWRaeYucvtfSVYCmoYleCGga+9rmPs/tkzo47+tU=; b=KJq8hXtbAjENBMzljdhibNhKzx
	/HnHU/EzBL1bjqrAd/uDJuTDk/wN/LaEXZ/M2ZCi7MUbXKCoWD0EltLXawTwP7mV77Q/Gzjh7glP9
	C4d9rhVnH9MbontPj3OSRMqvrNYSGcCZaWpWMT+5CWZ1qejShlHpJzLEnVXNEuGxScVj8BN+vF1SL
	t1U3zb9CUvWq2dnKZxNFROuV0Mr13QiiBUQonKno6Wdsml0Hj86hrfSzQ7yBK+fUT6RBGORSzhiax
	1nTdu5P3u36KamnavXc9L7Dj5+9I4hNAsBV/O6EQXceSFr6VhmGZQrKKhpIqGW13SbkWMbeYU/JDf
	z6OmkxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwk-0000000E93B-2QTN;
	Thu, 26 Nov 2026 18:11:50 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwg-0000000E8zI-2MjW
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:48 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b3acec6677so11066126c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716705; x=1796321505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=O7nNyfNqYHRYJxH6SdhrL7Jrp3MUOdp6sqaZxvWor7DXocz9Ke8ut60O/ljvqJim+u
         FuBVNl/euI8YcsZ45M1fTe2VG+WaWoyHjfUQrF8A+PlB1Ur+J48FRUFI0saIJmLOdcnx
         a4ssRxE4iay92XS4X2Lh22ol3B765BUudvZ9hzZ8Q2nCD53pGSFXdD2wpaAsiYvm8BpS
         dAN58rjLuInEPpGm0bgv7n/vGaVGdA6EXuf8mYB1CjOMQk4rYnJji9pO8sipkTvb1kaq
         sr49O1rARy5/U/PnJHW6je6IxnZj8zBuWtQ6oR02ZWwFjWcfbPDrjXzJlLpmMPunmYX/
         XYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716705; x=1796321505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=dsRtlAmLaGXGw3MT8MZjf+am6XLr0OOmE7/AI9A1+hQLsazD0q1xllQYif0B1Rp+dq
         CbHTuljVlDlFSh0G9JzdEl1wXPbxjPybhesEI/2+fAYOarmmBuOL3qnFJHB8mb6x5fC+
         6Fteef9KtBmOboIpPJj8MFJqq+9lRw0q8Vnydh+VtHsQJ+xTwXcDVF1MRBGD3K6/XoyE
         mMXA8hnXV4odzpYnvUpIRfx0ChKvtPDvHrBKSxUMa4pq+exMqzR7b3Zbiod1CaICVJYj
         zJD5w6nYUfDtltPBktCLD1eqJwGY1r7GCXRL8kcD2sC8BkhxnOCmW0RXve7IRQ3ojWzs
         cqPQ==
X-Forwarded-Encrypted: i=1; AL+hErHZshMCMKTVpAVhrhDzTdAPpUtH3ZccTD1f9Y2c1JyOnvwCuVFQ+FVbvpmZf3aAirhj3cqbKMGVrH3FuQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z87rvyl4vE7b6OginKATiAQuEHWCuPdMqJOiW53dhnCJRTtfJqu
	FvKJqrUC6VurBcJ6X0ZaUKnWtVgtNqJvzcPYmuVy9RXPMSMjCdx54Nc2
X-Gm-Gg: AZFdTZdIUudouOBY5Xst3KLgO4yP4wBot2itFki2o1C1K9Y2NcGHDoMhv93UtDA7FYl
	z+KmshRCY80BiRjr2pLwzmsZ5NK5F+k2NW8A6HcJ8ExU4mSWqDb92HNKlB+ehAUpNah75Cp5Vnx
	Oo9nMfj/8h1u6qp43GSoW84b+ENlGjswtoC6Zp0W0WXis+g9fJ9IaMrdOmzNR/8LJWKhdUbfJ5Z
	BakP5Xt3LmOd05Bg97X0hXWP7wUg65+IqNV1OyJye4a4Z736wCytVcx8Y5ySfRLR3I78aMD2JMp
	ckvjL3uGklBqdA6pYFJR/R/Um45JFw7FpnyvOW4tAt1CudNzKksiB5/xCtV2abdd4dzITcK9jMd
	8Of/nq8HI9mcPutj/kStEa5dMs83kjQoeWGE1Bdz8GBuFodOAXpZQ7MUtObZxXoixmtcJuGKcEJ
	pqCPFiynCWeuUuC9uMPI9F1jVcLMc/sCa0qhFUWYiCHJ38UhK8/zwheson25t8S+P1Ddxv9pkKZ
	3KyHAOLy1wbzBox4BUPCpbLbVuKBsxcpcWGGb1qYGfKPIXH26ZAijLGSR2/l+qJJ9u8ERc9EYpo
	mEnp/HQcanexJW8TcWW4TsRt0/fCqStotmBG0k8nEA40LBAkt/5sKoDQfvjMFijPwdp8zmHe/sI
	RLKZXAkMVKs+QBZHKisKTr+U=
X-Received: by 2002:a05:701a:ca09:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5568cf673mr23372420c88.18.1795716705591;
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
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
Subject: [PATCH v2 6/9] clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
Date: Thu, 26 Nov 2026 18:10:58 +0000
Message-ID: <20261126181101.3715754-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101147_481810_25CD1010 
X-CRM114-Status: UNSURE (   9.56  )
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
clockevents_register_device() when num_possible_cpus() > 1. Once
.cpumask is set to cpu_possible_mask, leaving .irq zero-initialized
causes tick_check_percpu() and tick_setup_device() to operate on IRQ 0
instead of the timer IRQ on SMP systems.

Initialize .cpumask to cpu_possible_mask and .irq to irq.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..93a92a823f8c 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,8 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
+		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
