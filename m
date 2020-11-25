Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23013C56202
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 19:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4753E20663
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 19:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="unnXxOBi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="bkwK4VpA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4753E20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UvZnlSu3CbuU6Nebyht1oPVVQNgPaqOkyt9GLne2St4=; b=unnXxOBiKa0T3V5J94DhfHarYP
	r6CgxWwv0IDH+aCdmbInXSAXwzLj5IzAkfGamYG4Jsi/PG3B12dMRPpwSI4oFBAMtkhpfmX03iLW7
	lNf/D1FO5CzKW+hKsF3rMuJ5URi+m4IJR47LmBBsB87bMoad6zrUjITDvYbGM1PM3hVPUKfruz6qS
	4CTfsh4blqrhYvGO7B7ZBBgUaNhRBdeslo3Z7lqL6vQ+n7jRr187VoqUercj9yBdR/5LEyNrJftvN
	xTHO8asvjrEC9q2wnq+5VritsyfOfxbvudyRqqxc7SPvhmTiX7e2DsLd+tnr39pvjSAshtIdwJHZo
	9qSOziQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki0vr-00030d-LU; Wed, 25 Nov 2020 19:58:27 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki0vo-0002zt-Hq
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 19:58:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id t8so3340462pfg.8
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=C2+gt+4Vla//T43iYMds5MwFx2eq1rtnxCXvX+Fkws0=;
 b=bkwK4VpAVhpMM3mZ3JJJcmL343wveYoNrYyuIlWQmGg4j1plhP4wSFrAjNzOMXDQpf
 m9ReO05eTylIEKMQzdbdymApGYTOt67PHKpv90bOeeO7LAqz72AyLZMAXtv5K05cmAxg
 BlJNe6X2Qs21GzTvsOSikAiT0nzcvLY+AyG9hCAILK2jwtaXD+6PmYeJSN4+uzwRmTkn
 criW1cjl3xrjB2HxAFZOguPwlA2pOXImWlekQjswDHxG1v7x8sFO26vLpBNzwR9+N+tn
 bHY6sfMMfEOXuDhZh3LRbzgLsy66nQDxlFB9dkJXMO37YnRoM7qOD0Ff0lRQHnc1VgbH
 R1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=C2+gt+4Vla//T43iYMds5MwFx2eq1rtnxCXvX+Fkws0=;
 b=YEuBZ/CoY+01ufUBIhJ9+mYOvK04V2NlTU8CYm6gg4cadg99akGYCnHAqaGl2WeAI8
 3UWD08T9QwF4OnHLciYOAwYgBwFMYVs3FgiFHsagFlhUI+TD6zSSKlA4Bo/XYqiWtTXj
 jXUdq0FzfMZQEyikUw4h/oy8zZdycYPI0FaDsXTOplxyCwGrAQqK89LJd3uJYaJg05P1
 SmfinFvk+TgobjTaQb6gkL1VBYhQoe+2ZBC8COv5q+DFQGtk4j7QczBIf1VGGu8RPSCt
 KLHoXe22AsjE6bg6EZqjA1xiCJ6LjkoGVndjL9+xrZSlmVMlLsVfRSUcNXRS6Z0vA6+I
 XhxA==
X-Gm-Message-State: AOAM533vG3tFHYOtO8apB+oyIQTCFdvYcHOp9jpSbyrf42uG7suXPpe2
 qUPZptiGrQQWPqW+FDOjRPuLpQ==
X-Google-Smtp-Source: ABdhPJy0oBUqJ5zTUZSRrrCi7ojhyvNYwGOkozXDmt62EACijfKH/cgNzMmUvBT8QbvfsLJ7X71ZVQ==
X-Received: by 2002:a65:6401:: with SMTP id a1mr4400231pgv.149.1606334301571; 
 Wed, 25 Nov 2020 11:58:21 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id cu1sm3626192pjb.6.2020.11.25.11.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 11:58:21 -0800 (PST)
Subject: [PATCH] drivers: clocksource: timer-riscv: Depend on the SBI
Date: Wed, 25 Nov 2020 11:58:04 -0800
Message-Id: <20201125195804.3780975-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_145824_635372_DB0F300F 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, tglx@linutronix.de,
 daniel.lezcano@linaro.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

Fundamentally this is an SBI timer driver, so it cannot be enabled without
support for the RISC-V SBI.

Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation for M-mode systems")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/clocksource/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 68b087bff59c..3eeaf0efba8f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -655,6 +655,7 @@ config ATCPIT100_TIMER
 config RISCV_TIMER
 	bool "Timer for the RISC-V platform" if COMPILE_TEST
 	depends on GENERIC_SCHED_CLOCK && RISCV
+	depends on RISCV_SBI
 	select TIMER_PROBE
 	select TIMER_OF
 	help
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
