Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41669C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ln4Ou4Am3rXeJiBgIR1s0U/yCP+r8yKyymKWGM5w1Nc=; b=k51SM0/F1nEv8X
	QgiaVplDCir3DzHLWRC162xeAnGvfFecevwR70sYp5W63zKVQO4LoetbUj8W/KRcobQX4lXw5Jv/r
	y9iuI5pRt7S+fev7g7Xn6KbJQjhvAJGXq7K76efnhg1uu6cTdxZJ6OzNeGEzf8JHo8xaRdt2VxaLM
	nvp71IL6EbOfVT6z8JCwdTHVg/GGuc6CTL2wpXBB4U2u8cQM4gGLOpHJT4g2dlBbLeAF+P+Mu6dRk
	X81WdU+yO3SigQXedeSALq590Co3n1w2QHQxOOZbTn40dh4GW35d7LIjGyEp0ueDvx9CxGkjZoUy3
	PoPPw+bOmAePdYyUDFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTe7p-00000009ovF-2mXk;
	Tue, 16 Jul 2024 09:05:33 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTe7m-00000009ouK-3r24
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 09:05:32 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3dab2bb288aso1704667b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721120728; x=1721725528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fur+9iY39EnHu790PCA6BLD0AfhClKqjFPG8SfLx3b4=;
        b=a/r0r9tIsOttu7uXQOoQU/D5jQ12Xc3ZuKKztYFZjrek90Ne4Y0YCAxmlekTR3xnuf
         aUgcqYlEwPJiohVoLh3APzcNPWRyeT/yjMF6WUn+VnGdD4cpdhdLILnFHR4b+j86C70j
         a4fmWvkQVJoiEBNCkOTsUkA9bdCsYzE+TepOiWYb5dCanP8sBQmn6k1c619PJ5B1TlR0
         52sStYzD+mOquOwYk77uGhEl9RECKnaVXMTfcK6WKlfNs1ZEQvVYflwDj5MZFFuvNs7d
         B5M+lPEjz/kgHCU9O7P3BPCY4WRv6TGOXl0CUyNotrUhskzvFDPbPvb0wMj4zUJe2sG6
         Xviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120728; x=1721725528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fur+9iY39EnHu790PCA6BLD0AfhClKqjFPG8SfLx3b4=;
        b=VdR0ar5f31Q5iyTPTt41Jf6tXbRXhOycbLEqKFI1ZjyqUYh07ffl+atwTiRxGFJkxD
         mv5RmATJi9oldsUdLq6CnTAio5r/T7gYbKF0/ztrvIW6TU72jwzjWBmjPDWZNNo7Sj5p
         pg+Cl3uVsYxq2Eu11/WYYpA+5FJN6etABqtkR3Feu4wxiIX1G6FLbnCoebX1OaGTR4HM
         dlnseXWt5BEKTeEdsxvK0lhPB5l7hNvq7CtMiimvJQdboXFZOpMM9mCO0uVgZgVN1FCx
         BTOG5rBQuuOW4b8Nb6iFGeKqLwmpR5dJs1wfJeq/ogLqO9mdndBPGgow6jd5pWIAJPX3
         cUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa9OpFMOJ3UZZu9VZknZAH2lC3AJ5C8ZerBi2HdWx719I034mrsNCy4TIT1s5w+myNDZjus4/ZOjMavFA3WY4SGhWaeAmjO3kZp+7z2LTj
X-Gm-Message-State: AOJu0YyLQUM3+qSuV134Wql2CLKQyNC4tuwY98HuiwKTmb4h1tNvh7ZW
	xAOaMUdGNSH0zPWQ7a21Pv0XaFVnMOOB87oY5QP2z6Dp6JtNGXYWPfr8mOQ+o/k=
X-Google-Smtp-Source: AGHT+IFUTI7bRK0GiRyBdxnIcwWFeziW4Cg/oaSJr7SOONPnOwSkImxAoJVzGyTprsvzWvSALI90Yw==
X-Received: by 2002:a05:6871:294:b0:259:cdf1:b8af with SMTP id 586e51a60fabf-260bdffe1efmr1191734fac.46.1721120728055;
        Tue, 16 Jul 2024 02:05:28 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eccc48bsm5770157b3a.203.2024.07.16.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:05:27 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	peterz@infradead.org,
	anup@brainfault.org,
	samuel.holland@sifive.com,
	tj@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com,
	zong.li@sifive.com
Cc: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH] RISC-V: Enable the IPI before workqueue_online_cpu()
Date: Tue, 16 Jul 2024 17:05:21 +0800
Message-Id: <20240716090521.1752166-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_020531_158300_72658879 
X-CRM114-Status: GOOD (  10.81  )
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

Sometimes the hotplug cpu stalls at the arch_cpu_idle() for a while after
workqueue_online_cpu(). When cpu stalls at the idle loop, the reschedule
IPI is pending. However the enable bit is not enabled yet so the cpu stalls
at WFI until watchdog timeout. Therefore enable the IPI before the
workqueue_online_cpu() to fix the issue.

Fixes: 63c5484e7495 ("workqueue: Add multiple affinity scopes and interface to select them")
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 arch/riscv/kernel/sbi-ipi.c | 2 +-
 include/linux/cpuhotplug.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 1026e22955cc..e05e68de8871 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -71,7 +71,7 @@ void __init sbi_ipi_init(void)
 	 * the masking/unmasking of virtual IPIs is done
 	 * via generic IPI-Mux
 	 */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_SWINT_STARTING,
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 7a5785f405b6..57dcf1229b27 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -147,6 +147,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_LOONGARCH_STARTING,
 	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,
+	CPUHP_AP_IRQ_RISCV_SWINT_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
 	CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING,
 	CPUHP_AP_PERF_X86_STARTING,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
