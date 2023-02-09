Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14052C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxECq/6HB07srRNiI0D3/62TLkkt1UFteSDdwYdax8c=; b=LQtHuwlVK4rN7d
	O75cGczzSvSxp110ERljF53RnnNOL6iwxSHeuyq6ni0c2Ew3YLqIjgioOZ56D7jgFenYagc/C3ydT
	HyTjmckv0WgvD00nbG8S2GTqLFRwXsXOpw+wrg/sH8Tpw9hP5oiZxQ7PC0A5IoNpWn83VWSqaR5Y8
	Jr0ltrEXRZijyzkHk7hMfxJ4scdfDSs1oslUXaS+zpy2yfJNJDvlRKl+40JCCRnVysI3j3evzVTsn
	P/mP683TMzp8j7TSyvXeTa3lHtwR9kmKABz5toFJi0GKuBMOYIyItwV/a340dGMUlf0QVPht1VulX
	buDffsf9rJw6PPn+y2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGHY-003VZy-Hb; Thu, 09 Feb 2023 23:24:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGHU-003VYe-LM
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:24:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so3832759pjb.5
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=B3pPfVMpUiPSyCCzmCrD57AemmKpys6aCeZPw1vQkzc=;
        b=jgWwWwa7nwguVHP8E/H0kL40mtIJGHHQz64K8tE8/mv9uI/opH6H6e97FUaas0zr6f
         dr8+LAiVB1IFEqTn8CRHISEMxueB9PE/dctAB/0i6Pxp/8ZSJTVWiwBwd8ZcREB+t8bl
         Vuvz0dzZ890xH9YUzXBgVmR6nBlqgx8Z3n4m5/l4HcsHAADYr9K5MsP1E+v76RlhA87A
         iootOfpzAYK6GzPDIfn3gLxYiUOpHuMFSP4ZwgehL1mHbkpnuUe6q34DOnw2bZ6Mt28I
         lWUvXcevpy0UyWSB50Bm8EWjNlV2ITTlux2jSbPEa0gmjU5SWwpb0o27kEP3v76gFV4s
         jWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3pPfVMpUiPSyCCzmCrD57AemmKpys6aCeZPw1vQkzc=;
        b=HK47g3afnRhLzl3weoqXaNx0HP8oA1HmwQ32+FthKj5QAuV55Mf97i/paypDwH/uLN
         A1pi2FZk0WaI4wKeCgcpT5wN1i9qyewnn1K7Cs3sBygJLsNFo9VeTpCl+DgGUuRI+Jp4
         obX7hq/MhQc8smavbL1QBeTntxCDqvDNKnK2ARuWqfBRBEPNXXKxB4lEx5gaXoJzr27E
         r4Fnh/CAke4DPx+K0dstOTtSnLq9+YkaS3AX695B6LDXsB7treTTq5uqqJ0CeOEt58x2
         Tq/lFuuHeMcbvi5K4XbNwCxAJV65FobAv254NOfAiBDk1GJ2eYhqB0JEL5YRpVSq0G2R
         S5bA==
X-Gm-Message-State: AO0yUKWXb0qVWC0ExQ83Ii/jbknFWDKL2zFmu2yzk2WhD6WMp6q6BfFp
	9Goip0BxSf3CLJ8vI1Quy50dEg==
X-Google-Smtp-Source: AK7set/Q1MtO27htVLVMwKNv9osyKF2JaGo6dqafw5qA+gpYJFRK6skDPE8u0sHqFzi+/+dJlWJ1mg==
X-Received: by 2002:a17:903:2288:b0:19a:5939:51e3 with SMTP id b8-20020a170903228800b0019a593951e3mr5594520plh.24.1675985081800;
        Thu, 09 Feb 2023 15:24:41 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e18-20020a170902ed9200b0019904abc93dsm2043766plj.250.2023.02.09.15.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:24:41 -0800 (PST)
Subject: [PATCH] clocksource/drivers/riscv: Refuse to probe on T-Head
Date: Thu,  9 Feb 2023 15:23:02 -0800
Message-Id: <20230209232302.25658-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux@rivosinc.com,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_152444_949218_5620C464 
X-CRM114-Status: GOOD (  16.36  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As of d9f15a9de44a ("Revert "clocksource/drivers/riscv: Events are
stopped during CPU suspend"") this driver no longer functions correctly
for the T-Head firmware.  That shouldn't impact any users, as we've got
a functioning driver that's higher priority, but let's just be safe and
ban it from probing at all.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This feel super ugly to me, but I'm not sure how to do this more
cleanly.  I'm not even sure if it's necessary, but I just ran back into
the driver reviewing some other patches so I figured I'd say something.
---
 drivers/clocksource/timer-riscv.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index a0d66fabf073..d2d0236d1ae6 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -139,6 +139,22 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	/*
+	 * The T-Head firmware does not route timer interrups to the core
+	 * during non-retentive suspend.  This is allowed by the specifications
+	 * (no interrupts are required to wake up the core during non-retentive
+	 * suspend), but most systems don't behave that way and Linux just
+	 * assumes that interrupts work.
+	 *
+	 * There's another timer for the T-Head sytems that behave this way
+	 * that is already probed by default, but just to be sure skip
+	 * initializing the SBI driver as it'll just break things later.
+	 */
+	if (sbi_get_mvendorid() == THEAD_VENDOR_ID) {
+		pr_debug_once("Skipping SBI timer on T-Head due to missed wakeups");
+		return 0;
+	}
+
 	domain = NULL;
 	child = of_get_compatible_child(n, "riscv,cpu-intc");
 	if (!child) {
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
