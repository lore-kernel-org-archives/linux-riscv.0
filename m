Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61856CD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tje8lhBGkYYwBEKbBdfV/qZb64fKT/jQU86pjfVYrF0=; b=h2c+8jVfeFMau5
	6oBGNVRMsQn5Il5ox5n8AAvpfIqD1ucbmL2A52VP43/PVqr7khxGcvWSV9TDJpuBPfbz2z5XbyNJp
	vUGAdbkP1eaF9a9cGAOUwcfAWkKJU3MZaqOrjFhek6ZsU1tP/ghxMQAe/fWhBRFNkFChl8ME78FbG
	iy+IWHGlswVvQHRpeA1TtogTRPmz6I5yyZNS8lj0X6akVLjXICm6TI77lfz2YlFggIJHs+ez+EWrH
	iw/HZpAxkC5l6tmon0gbjJbLSesg9kqN3GR99UqI7r5MGnIOVhlmwpKJkixHvUDhav+c7n0L2urr+
	arXcG7AGj7s0cAMkiFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1KO-00000006CvG-1sbE;
	Tue, 09 Jun 2026 18:37:32 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1KL-00000006Cuw-2tyL
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:37:30 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3074adb8fcaso10370695eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20251104.gappssmtp.com; s=20251104; t=1781030249; x=1781635049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdOHteUJNIy2B7lyR+vBNUMnD70R9uG7EEStj3lwUYY=;
        b=NQWIGEELBfp8Aqmn+Bj76coYzB/EVO544KEo+QEJGyW5nVbampeG2nvYx3tW6e/BS2
         OXD8sIDH6hfKG6h+8xlMfUdK6EYdaB5sHqgk0yhyM0wJNHXM1X45/7xiECXOVfOG1EZ3
         7BDe7nDe70q7Ry3dixLTV+wMy5J/M/uhYNF2U6mXYax+Yd4VPu38zscMJJgFxvfWg5LB
         SCYr7WALwph8TyAUUrhfkHWfsWN3b1TOWIN26vtl0f4UJ9PMvzOdGtHQNKKmWpPtBmp9
         zY3WiDJ21T7i5bRUEygml5UdsBQaJqBkUHu2o5YdcrM03yGtfjjeNwX8M5d0/zDuYj9z
         Ng5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030249; x=1781635049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdOHteUJNIy2B7lyR+vBNUMnD70R9uG7EEStj3lwUYY=;
        b=AWTpjrHba6KLv+xi9KQPGPJ4mKSFBHQd+8g1zt+0drg4dIX1pCRw+r2Xse99ftinEQ
         /KvWgMxr0KTz08jvIqyMqIbRPFritImHP/4z1WJUu7Pk+2v5vmdL9gQfMwyjuiiNs3EW
         FB1e+/WmKvKipn9lBD0PpmiFDVv7Fpl2aEDljsLaJ6n5u4Fj8R+JM3XCcceiRk/doQMT
         F/SnlH3mzol5ArsAU9IuSDxppWvpdZis59rrloxpu5nI6RNf+Cuh+xFNXs2qDE1mmCI8
         jqgWeOqUE7SlkQGwSadNYRUIBfrcGKjS+El3SAtuQcSRLou/LSFQ+cRZ6thQwKTh8T4R
         LkDg==
X-Gm-Message-State: AOJu0Yw6rLSjsV4ZahXiHcoHYkfOyTgKK6HczkJ8pPDdkZYHN3qVkh1p
	8l1sxRBW+fOcrCCeu8ht8kOBasNCEwuwd9zfdB5j7I5trBYCbLKg8Pxz9oiwoiSjaR0Kt35eaHb
	bnaYyHg==
X-Gm-Gg: Acq92OEAIKOl9MkZJ6mG+VIfBOT759heizXPSV0Msuz+egK2NTZYnYWFcnIfUZUhKF7
	0PxM/KGqpXvpAghDyOXZdKTDgRxT26pQak0AT9gqEDUoy/royjynMDT5l59sqE6xE2ooGd1G3SA
	VpdqKCnNs2lG/Env53+4g+H67Zl7qYfO3secNLbaKs/nhXBo6McYD+m8uxDl+fLYFYN2Uf+p6eb
	53XBqaJEJvNTz80E2S/vlXMKeI9BHEi4da7AdkiiQ+Iz81G+3UJlNl1RmndRy9KT9RBjnn5XtDy
	Tqt+fDOMzted2AxITH157h1PKv0I5+SDfhWcYVO+INo2YJBVA5FomfFXc+3qXzX/dHI3YfLeut4
	hmWSW1id5cTXFJftr8WZnfqzbT34FbhHJp/+of/OYg4fhJMoa6v6qf1sMQXSQhAJVOdoGBeNaJ9
	BXDbvFM5GOzOeyghThoUjTglsdUiOdXEJ07B4Ab6sE7sHn2hwq6ibVfQ73GcuEcsAF1fwr+WDGr
	BenyBlO4lSSiXVsJ82bQxal
X-Received: by 2002:a05:7300:3b06:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-3077ae6f51cmr12695427eec.4.1781030248769;
        Tue, 09 Jun 2026 11:37:28 -0700 (PDT)
Received: from ThinkPad-T14s.localdomain (c-174-160-255-66.hsd1.ca.comcast.net. [174.160.255.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db5610esm22129869eec.4.2026.06.09.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:37:27 -0700 (PDT)
From: Jun Sun <jsun@junsun.net>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	junyan.lin@spacemit.com
Subject: [PATCH] KVM: riscv: aia: use lr.d/sc.d on RV64 in imsic_mrif_atomic_rmw
Date: Tue,  9 Jun 2026 11:37:24 -0700
Message-Id: <20260609183724.41974-1-jsun@junsun.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113729_730707_D384BD9B 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

imsic_mrif_atomic_rmw() uses lr.w.aq/sc.w.rl (32-bit) on an
`unsigned long *ptr`. On RV64 this drops the upper 32 bits of every
guest EIE/EIP write, so MSIs to EIIDs >= 32 are silently lost in AIA
EMUL mode. Gate on CONFIG_32BIT and use lr.d.aq/sc.d.rl on RV64.

Signed-off-by: Jun Sun <jsun@junsun.net>
---
 arch/riscv/kvm/aia_imsic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 11422cb95a64..933292683a05 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -221,10 +221,17 @@ static unsigned long imsic_mrif_atomic_rmw(struct imsic_mrif *mrif,
 	unsigned long old_val = 0, tmp = 0;
 
 	__asm__ __volatile__ (
+#ifdef CONFIG_32BIT
 		"0:	lr.w.aq   %1, %0\n"
 		"	and       %2, %1, %3\n"
 		"	or        %2, %2, %4\n"
 		"	sc.w.rl   %2, %2, %0\n"
+#else
+		"0:	lr.d.aq   %1, %0\n"
+		"	and       %2, %1, %3\n"
+		"	or        %2, %2, %4\n"
+		"	sc.d.rl   %2, %2, %0\n"
+#endif
 		"	bnez      %2, 0b"
 		: "+A" (*ptr), "+r" (old_val), "+r" (tmp)
 		: "r" (~wr_mask), "r" (new_val & wr_mask)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
