Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA43C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 21:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA6421871
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 21:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JHyJBCsa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AI00KNTP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajm80HsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA6421871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JdnKPbiMwBljgc+kYpMG8L+Qjaz7u2NO1qR+0V5hzr0=; b=JHyJBCsaCoaho+IdHkyx5EzFgS
	s+DvJrJ1SaRAp5B4tGZqCR+ppvxEvJNPsOBcBwOnLdgoegHTT1ufJ1CKOPss9zz/546GDAQKeQlkj
	9/ts0NLd7Lbc28NqzhqJfJseqo/w+q1ZYySS7jjhxtmf0fzxqs5PVIEHtufBUwBeEwP80DdCzcTdU
	V2mNiXcXqVp79C7GmLqQLLBvXHIyph86ecHomBJLJAhc2k/X5QkNiHf+K5gcx8RVXCiEDRGuCUEv+
	OKs1DlrYzlRleme1p+tcKceXa3DmrTjSIC0ZfTF3E45LKFkenzkhrA6b0HrvkZg+dkH5XGbYNZKmJ
	KDuMo/kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZMxY-0003vY-4Z; Tue, 18 Dec 2018 21:31:24 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZMwE-0001Vf-P3
 for linux-riscv@bombadil.infradead.org; Tue, 18 Dec 2018 21:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EQh4Wy4xg4tu3G5mjMUe7R/MpSc7Nf6V6BJXMW/ceAY=; b=AI00KNTPTJAUbN8XpHwl3CPd9
 FXIXZQGBKhivUbNKb2rwJw/2sRcfiYn9AtpvCs17xD0ZdxL10xaJ0uXosaNpxFrjPR1LaCCtKHAGA
 zwryFxX9vnIV8V7vdEFsQonl4QO40YzeJ8PzkF8grxgaHr9bNgO8O1hlPMNWc++C5lNfXlcU3aN37
 y8E6BdTq8H+E4j9sihKuiTkSCohsrwkewG80xWoxMrr8PAaRP3MicGWGhkr01PgDvSOY651eHebm2
 mPRBKk3BfMOxv4ZnUv8vg0YTPuIMQe+HQSrS/hWDcP0qzC0P/CbCFbg/jINrOeBG9+G1PWTaa7VQa
 4DY35gZTQ==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZMwA-0003Jv-Je
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 21:30:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id u4so16445037wrp.3
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EQh4Wy4xg4tu3G5mjMUe7R/MpSc7Nf6V6BJXMW/ceAY=;
 b=ajm80HsTJBcYde6kD2E/K93Z5DSEXUyveMyk6h4WVckfa1oMMpgpNUb7krISJ55Ymd
 6q9LKIcsSxFrsHJHOiJvfnlDsvvm+JUdbbhsOXYRARddHpD1S+r2ri26df8ASWn2eykQ
 sAJJl8zuVYaiAfjhwmULDtBsp1lD5uE57AeeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EQh4Wy4xg4tu3G5mjMUe7R/MpSc7Nf6V6BJXMW/ceAY=;
 b=PGDqvRwAA05AyUhlB7nGihyb7X10X84MJVlgevpkxzGFyJltBoT6z8buojCEf/k1Fo
 Ta9sb4alYZl5PilDaeTzCTt8E/KtPGQyQum5KG+c+jFYdQB9V/9udUehhDLqAAlV1OoT
 l7VghsqJlftYu5/Aw07vhn3iFluAb+7KkqxkALOSICzdboFXPxvgYogcizXwteWWi0UK
 UnIiol2Ipq4GSgAM1RDZ90UJ1q8bE4XF4pxMT99/6HAUL7SzAZpklG6F3uwMR0l/+HoO
 C6sWKgz1R3RFOh/ntnbDDdKuUs7BRI4B4RupIfLfIHQqeWO1SvHQBvfyuLO77oAmNgLp
 vcdw==
X-Gm-Message-State: AA+aEWY9Jla8oq2G9k/w49wt+K7FfbUo16UgXcFlTxYO6R2bZ+1oOzic
 FglxedZPTL+4cmR7qaLMiSUX+a3I1/s=
X-Google-Smtp-Source: AFSGD/VyqwbC2xqjFW3tthDUqtEugf6f53B083zDSHZ4ZyjS/4jBP6oWxJ3k7g91vU96RxB1UARsGg==
X-Received: by 2002:adf:ab51:: with SMTP id r17mr15990488wrc.62.1545168580238; 
 Tue, 18 Dec 2018 13:29:40 -0800 (PST)
Received: from localhost.localdomain (105.50.92.92.rev.sfr.net. [92.92.50.105])
 by smtp.gmail.com with ESMTPSA id o4sm4153485wrq.66.2018.12.18.13.29.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Dec 2018 13:29:39 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 20/25] clocksource/drivers/riscv: Change name riscv_timer to
 timer-riscv
Date: Tue, 18 Dec 2018 22:28:38 +0100
Message-Id: <20181218212844.30445-20-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218212844.30445-1-daniel.lezcano@linaro.org>
References: <d3f1255a-592d-13d9-5d3f-bd3ec7a36742@linaro.org>
 <20181218212844.30445-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_162958_657014_6D3B5637 
X-CRM114-Status: GOOD (  10.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In order to unify the names in this directory, let's rename the driver to be
prefixed with timer-*

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Makefile                         | 2 +-
 drivers/clocksource/{riscv_timer.c => timer-riscv.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clocksource/{riscv_timer.c => timer-riscv.c} (100%)

diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index dd9138104568..ddf697b29df9 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -78,6 +78,6 @@ obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
 obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
-obj-$(CONFIG_RISCV_TIMER)		+= riscv_timer.o
+obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
 obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
 obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/timer-riscv.c
similarity index 100%
rename from drivers/clocksource/riscv_timer.c
rename to drivers/clocksource/timer-riscv.c
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
