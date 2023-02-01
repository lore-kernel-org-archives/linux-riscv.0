Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A825C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zwEDkKNgqFzSRWrOPGwRJLdejXGdBiQKDliqwfUHaj0=; b=NQLkHxkRx33oXo
	QKbPf7uB24StmA5Fe2WhC3qfdD03bQVMe92Ijmgm0NJWDYActZAaVQFMaibiQHoK7GLnwMmRpin7Y
	IT6L6a/0CKo/UwrEgITqVvg/+ljKWqLB0NAhynYzFFhNPwYqTUroQfOztehwb4IaczqQIabneZGDS
	WfqT/RGFoJa1ksGRcsnjDv3bZ6VGl3KTZvsr/ff20N+dGeztnadrAf9+QkqKxD7jhsrbcfWbYeEQU
	Tn04asTufE5HPwsgZ7rA/dX8/LpH25GItZjoF7pJqc/pOkrM8rZNwT0W5Ij4n9cSo1/dn3SSqoHlP
	vz1NkeyRKl3nzClnEyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNI3V-00DFlZ-2A; Wed, 01 Feb 2023 18:42:01 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNI3S-00DFkl-D0
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 18:41:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id m11so18196769pji.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=40TzvAkm/WVVRhYZ7HKFvihGGtisjuM2owcsthmeU1w=;
        b=wnXY3ioqUi+ynFbEZb2dz7inLAoLgYFMftoMMkhGCJWtqKZHJjTDOOii8ap7DEVpta
         PC0LhPxwakpHSWb0w9tu+QJ1Wy5yefG1VUMW42WRLgi2R0S8zmdCCLVUTFxhA9kiakAG
         ff8qUACNLzz8emizuFglmfij02OXdboVWJ+okOLAdhWV768hQzNaYD5SaVKtK/f88AT9
         ltQCTwGQrqwi2gf6RcAynHtO39+nMPzjT8G/edwULD1MAD7Ni2Jpm00YA7mz/80XhhxU
         9lbQFXwt/NEVeizp/fwYRTtppNeteS7fWrETg9SiIM8A6XnIqB91VDQ9EuhNUNa+050m
         2SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40TzvAkm/WVVRhYZ7HKFvihGGtisjuM2owcsthmeU1w=;
        b=1e+TZumGb1ecDMupNNENI6RZuBGRg3fw4AU+qNkzyds3r/+dAMCL37udbl4FYEQ3bT
         cCYJmK2q3IOM17bWxyX15UVOl5dQJ2Ws4aYdTQwJmiOLlxQmuAF50zlnjxZiZ3LjjJFv
         iYHxIZ+0Xr+RWG+jYu8LqR/PhK1KIf+Tcrp/+MYd6BuMDLr5Z7GiG79DkFfH2H8sbp1C
         zasNa+/P72aF5gSoBnJ7VXZmCLhmAJh+nmce9YfBt0T4FnKvgxYf4xeuj1SxnNfs1/vO
         5Swg96GOwDQeRcgh4mQ8VgG4ZcC0QXV0t23W8X1SAbOV7dSvLoUKdNKS4wCq03T4+waR
         +ZdA==
X-Gm-Message-State: AO0yUKUc1z6oU6qNd7rnhHNj/GOcofdt/8+90Sk7QkrkLvWGPd+fJ8Mm
	m2dAoaew6uaLLrEWBurIeRTRGLRYamgmzb1/
X-Google-Smtp-Source: AK7set9wLpFcR9LCj8mmRceSv/2BMiZjuE3t3SnsRI4wruZasU8fo0uzCwg5gftObVPdP6ld2hGQ8g==
X-Received: by 2002:a17:902:e34c:b0:196:3650:63e3 with SMTP id p12-20020a170902e34c00b00196365063e3mr3385123plc.1.1675276915497;
        Wed, 01 Feb 2023 10:41:55 -0800 (PST)
Received: from smtpclient.apple ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id i2-20020a17090332c200b0018997f6fc88sm12137834plr.34.2023.02.01.10.41.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:41:55 -0800 (PST)
From: Matt Evans <mev@rivosinc.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [PATCH] clocksource: riscv: Patch riscv_clock_next_event() jump
 before first use
Message-Id: <512FC581-4097-4433-9C3D-CBCB7CD61954@rivosinc.com>
Date: Wed, 1 Feb 2023 18:41:52 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_104158_455218_85DC7F7D 
X-CRM114-Status: GOOD (  12.78  )
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

A static key is used to select between SBI and Sstc timer usage in
riscv_clock_next_event(), but currently the direction is resolved
after cpuhp_setup_state() is called (which sets the next event).  The
first event will therefore fall through the sbi_set_timer() path; this
breaks Sstc-only systems.  So, apply the jump patching before first
use.

Signed-off-by: Matt Evans <mev@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..a36d173fd6cd 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -177,6 +177,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return error;
 	}
 
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
@@ -184,11 +189,6 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
 
-	if (riscv_isa_extension_available(NULL, SSTC)) {
-		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
-		static_branch_enable(&riscv_sstc_available);
-	}
-
 	return error;
 }
 
-- 
2.30.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
