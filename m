Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DBDC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 19:00:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4044D207CB
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 19:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKVMtl7j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CzViUaly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4044D207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LTvPICSr4LSDIG7aqbd2RPywMPKXC1JMO3dT3GcuL7Y=; b=RKVMtl7j2t4OFf1WKcpKUwPD5d
	74tavAwYJ71YKNZ7iDLrnQByov+++Q9dXTnX7dcKCVozfmfrS8DVvjSERPonADUgKLg3Zlv2wcfJy
	cYgWxcyDR8aQK2vSpJUs5c+BCOyb6HetSnuIh7otn215QpFRPvvYXqoU7lx3QSHCY/b0ud5rjn8uv
	sB0edFIcsAFB2FXDr+P2I3IUJRUiPZ5VD223IajNWPBYCYdcC1QN3dMZ0IQvL0torqLFeaCqi33sV
	rzcH3nr2cY066lJNK8qKfRp1Pqkl2rk5gQ9PvKOZdwHzB5E/Og3+KQPEPqm/MBUJs1zdAer82GS+I
	QwXvXkXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw971-0006kD-9g; Thu, 16 Jul 2020 19:00:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw96z-0006j1-CS
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 19:00:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id d1so4265815plr.8
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=fyn164Bdkj2irREyDrQ4gDc5FoH5Th/YZJL5rirObpQ=;
 b=CzViUalycgyJI66C+bAXJH1eKoiQkPq4xCBH9/uRD3hCLovh+QcoMylR4dvP0EfoEb
 oSy9cMAAqktDCjg8hSkZwPd4Mlm7I+D3DVwSKU+tqko174F7hbRmZNh8Qp9DONXvyiSC
 gBC7hmINrqnRcYkJZJYyYUDxs+qHI9Dlnc+mW6YAwKMef5hKMU9Oi94yU5tIXAd3yKSm
 zfsIZGftkQdJ3VO+Mnk02mLczifvdhCieuZpkY8B6+vty25KyVZ+gFfPnDNyngUPwdr3
 L3lxCYu6O1tp/3gwyWha2bSG3uKwWltstdD0ctRaOAF90n4BXoX4RLbj7iZXiwN0B599
 Sufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=fyn164Bdkj2irREyDrQ4gDc5FoH5Th/YZJL5rirObpQ=;
 b=eGDmVKIXf8iu5DtmSTxrx6aDYrZSx4fqpNzUoDeBrwnW/h4C2CB1ThF/CCkyUKFwAi
 6YIafNAxKvXnDrtLD3fnwfmLguomKx2t7t9OZWrBKibsqwBwEUbtb/s05TcigrgEohvl
 aE+Eojp92+22gbXfB9sieZZWV35H1KLkzt6aa9CFpxhtdONTcDqwLHSdjagqTF6i0MmW
 wgFg8WbAc4R1ViWjkd03m5ZrSYSAGXnJGqR1mVnGHi+2LDH72RQgzfiAfwhbt5hQt5+E
 P8EWURRe2pvfhSU1IjV6y2dlwtsjJkQRsTtWEClcq5ZM4/XAYa1flr9ymY0+6YIlwVNf
 Jzig==
X-Gm-Message-State: AOAM531pNbZq3OEz8Ez1FMxZgMC21MEgjeWQDRZXYE67G++E6f32sMzu
 kG8+n+TMNyNp5yUGR0rAm+3Dhw==
X-Google-Smtp-Source: ABdhPJye0EpnoE0w0J9W8b7JjHrTpR03+uJl1O9zgNxNw0u6soZ0gAMlI4xiQfRuW/ef+k45T28+kA==
X-Received: by 2002:a17:90b:1a86:: with SMTP id
 ng6mr6415455pjb.88.1594926001154; 
 Thu, 16 Jul 2020 12:00:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 82sm5413563pfz.151.2020.07.16.12.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:00:00 -0700 (PDT)
Subject: [PATCH] RISC-V: Upgrade smp_mb__after_spinlock() to iorw,iorw
Date: Thu, 16 Jul 2020 11:57:26 -0700
Message-Id: <20200716185726.1133113-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org, Will Deacon <willdeacon@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_150005_480450_B54E9FC8 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

While digging through the recent mmiowb preemption issue it came up that
we aren't actually preventing IO from crossing a scheduling boundary.
While it's a bit ugly to overload smp_mb__after_spinlock() with this
behavior, it's what PowerPC is doing so there's some precedent.

Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/barrier.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 3f1737f301cc..d0e24aaa2aa0 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -58,8 +58,16 @@ do {									\
  * The AQ/RL pair provides a RCpc critical section, but there's not really any
  * way we can take advantage of that here because the ordering is only enforced
  * on that one lock.  Thus, we're just doing a full fence.
+ *
+ * Since we allow writeX to be called from preemptive regions we need at least
+ * an "o" in the predecessor set to ensure device writes are visible before the
+ * task is marked as available for scheduling on a new hart.  While I don't see
+ * any concrete reason we need a full IO fence, it seems safer to just upgrade
+ * this in order to avoid any IO crossing a scheduling boundary.  In both
+ * instances the scheduler pairs this with an mb(), so nothing is necessary on
+ * the new hart.
  */
-#define smp_mb__after_spinlock()	RISCV_FENCE(rw,rw)
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
 
 #include <asm-generic/barrier.h>
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
