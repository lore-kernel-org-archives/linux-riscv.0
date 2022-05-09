Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E37DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 01:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQOyK2KB6RTz1AHWB/M9clslGO7naNa8ZHlHt2TAvQQ=; b=rhcBUJGgDzvUF1
	QeiKsVE32ukDCTU/yux+DJZU4yX0Hiy1W6AEdHOv1W/YY6/My24IsXlCIkZSb/FEKt2+d2S0dPhrl
	qQNQpuH8eVZ/MNxjMCawE+yRIakXinuWgRTZsbjz18f6EiRn/sp5e8mZRDKU0UBXNExKtEN8f8Awc
	Tj653hPXR1AanTYqCM7tts957Amm2TG1X/LPPGcBtUGCU0E5JacZDbBUZvIU7oFw58QMfUEzQM6hc
	FI8zFo3lF5Fm1Tu/2eqYizghDfB48K260eqhgeXZOlNoK9IFi75hLlaRNU4N860Ri44gnIFoaSjy0
	teW9EnxwaXKqbCg0tvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nns5c-00Bvyf-OI; Mon, 09 May 2022 01:21:32 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nns5Z-00BvxC-7Z
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 01:21:31 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B92D15C0037;
 Sun,  8 May 2022 21:21:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 08 May 2022 21:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1652059283; x=1652145683; bh=ocfO726Kgd2oGw0Tv8/aji7U+
 imgHZnPcKK9GAi4KlI=; b=d+9NBS2sBLLKEL2qcU/34D6uosjdcq9dBliOwCGFW
 TEU+O+EMDSKf7zz+BN8GSleUoPs2F+tUKhTUngLrZbSBMJN+doFn4svxQ3O2WPF5
 VpI2BKMOH+vEwYAnfB9vlP7F1SkQonpebKjjhCbPt48EWZQhZfDNhYqUwIeHG8Yv
 JfBiGp4kLgHHZa0F1j+UpclI7+uL6MpqMC+pV8ewBwWZwMvp3lGG6SG+lirIovrN
 l+rfoEo32ulilyStCA431Ey2z1Qb42pN7ptrLO6itrGcphAR9ydnetg+O8MGuagX
 SKjCZ5hf3R6aBCPOVwEbC2V/wTnAQ9V7iCNJEFbaHOAOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652059283; x=1652145683; bh=o
 cfO726Kgd2oGw0Tv8/aji7U+imgHZnPcKK9GAi4KlI=; b=dO3GHKZMgU11UaHc1
 QEpGIP2jbuj/Tq8wFi4xsnDNa/1nCTFn7oBzY/qczvca4MVqMccEkLE067BjE7fk
 iscbjIOTlYo/sgzMh7Pn5vpORWNOzr4DAt3Iu6iHER0/j1UwO07Qn0zEat/sENne
 dnr8fzFzkCIEmpFwwcnZUrfplcMx/HG4LZhqROIcIFyvnQniLeL4fqw14oM48w9l
 NJ1WOxP40lCeeUCmjxXu2+8YfnZC3ZSIIooqkoGeZpuQSDaO4Pb0QGJkTkstlmgn
 PVchO3fBF83UKDSlQ3pjW1JzHz/fdGcRF6F+n+8ojHddjutJsA58zmOj/mSjQnOf
 k68iA==
X-ME-Sender: <xms:k2x4Ysn70GTH1JovlHEbcp26RUS1-4ZuduHQlb2IKnisUuHDj7rj8A>
 <xme:k2x4Yr3mc2KBBIEce88Sw7l7n2y12T5jxJQJ9tamdYP-6NTsVyoAT2BTdnMrJw9PA
 u9yjELy5aorvBUJ5g>
X-ME-Received: <xmr:k2x4YqpkQ6Cvb54l9UqgmOOsZfG7JORdkYtb9_OEMeqD1o5L46reCQk7eYZoyhr8J5hqcdErmYCJwgaUt9ukKOOULCMjxBhXY1KQefOanDG8TXqtLc3mBny9FLvl0S-nV1cGMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
 keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:k2x4YokEvkaTQfzTENfDRfAmV0SrrrP3NlUPcmEYuNhCXv3aOPLKWA>
 <xmx:k2x4Yq3Iig-cH0MnLWMZkppJEkW_sBIjCxSFwFVp8yGts_KOcwKi6w>
 <xmx:k2x4Yvt7xdRQidW0bA-lxRUTHmouqU4BMQPF0aCRilhuaefTCkpqTg>
 <xmx:k2x4YrLLnMwTQsUGyAtn9XgI8PMkvW_CrbF0SzkJm1I1RYKl5ZQD4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 21:21:22 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] clocksource/drivers/riscv: Events are stopped during CPU
 suspend
Date: Sun,  8 May 2022 20:21:21 -0500
Message-Id: <20220509012121.40031-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_182129_820614_269A29BF 
X-CRM114-Status: GOOD (  10.84  )
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

Some implementations of the SBI time extension depend on hart-local
state (for example, CSRs) that are lost or hardware that is powered
down when a CPU is suspended. To be safe, the clockevents driver
cannot assume that timer IRQs will be received during CPU suspend.

Fixes: 62b019436814 ("clocksource: new RISC-V SBI timer driver")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..593d5a957b69 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -34,7 +34,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT,
+	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
