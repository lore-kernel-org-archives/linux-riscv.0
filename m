Return-Path: <SRS0=IMUx=3Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B0FC3524D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 11:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E7F21D7E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 11:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+mlfP6o";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XHj9kamA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E7F21D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S0sn2VhDaSlBdO6/hxwyAATfpjRIgtKr4eI5rHpW6BY=; b=i+mlfP6oWdx5xB
	B+KXp1M1+7nG/MwCdCvH74vwRncu7V9Y9qhNJdNLx0Wa5dh3NLuwsvqwZKlptp98wmEm9RdzynVnd
	pQKt9EfvA3hRrlbsUeSD/quoI6HECRaccL4JGgcfk0q4QThcMC5bi/AN9+gHzzVkQJJ+VoJzbLlOD
	uq9Ts2LVm5FYBQNCYY6Q2YURX7fQC7Dx/KC0Xf2VYTMTackyc7TmfaF4MjCHGT0kqQIS9E6eBYfQU
	XQGQs/aZCT5YLuMrT0U+rntMBDhRP/WcprcbjX5AgpMTzreTseebciDKZ3LP69WTfsiMnWF7jX64I
	0GVnqpTLS98UaYn2ytgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iywFK-0002S5-0F; Tue, 04 Feb 2020 11:19:58 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iywFH-0002R5-Ff
 for linux-riscv@lists.infradead.org; Tue, 04 Feb 2020 11:19:56 +0000
Received: by mail-pf1-x444.google.com with SMTP id k29so9287683pfp.13
 for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2020 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0sn2VhDaSlBdO6/hxwyAATfpjRIgtKr4eI5rHpW6BY=;
 b=XHj9kamAxU3y6DaevYGZO2vV6SIiubPdQTqrOhs7uwBCAYEGvo+CYTN9Zi8ffJgoxy
 HL8pr1f9Oh/7y++g/nTNz+62SzBXfpy/7BG8nMBIqR7GFErwfB1Nn6Wh+7U3r45I/YGk
 6NzeJLNyWTxG9ouR6GKvn/dS7jQrUV5bZ4MAwcH0dbboT9R1/fG8utqhZjgvMbqz3de2
 q5J0KsBiUC98JJLavTk+JuL3vkhSY6RIQSjzQ2GhY4Mh16QT3Z8Ys1E+iFou7KMtyl7I
 45J8G4LgVEyWMEDIlsxMFOR0Q0EuIA5wq6wJLhQhbyBplLhwL/dLnLw66ei3f6kD90ry
 CRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0sn2VhDaSlBdO6/hxwyAATfpjRIgtKr4eI5rHpW6BY=;
 b=rbYR0KQP9yU/F6LyHE5M+6A0+DRN+NiUxUyKadRY8GpWGNRbXYVgQKvdpLFB7a5HFr
 hSVDwe3K8KBRLHiXO5wNKOR/3rNUyumJWDho1j22soQSJSc/xvbLWdSkraAEyu/mbJ9E
 ky3yJrEEjT6SbnaRpRVzB1W7BoYi03RMXDY/9BVaELZt+jCXj75O27ja9/WF3fV8PnS0
 SxXr40c12MajIRV6VAoJErR3WBFEfcIdj7nENb0sLIq7QqlpG2a7hScBJKm0nGU5L3aH
 V87sPcNnyFRTo0HFKrHM35ZgRWxLnwphbkF9rWla8TGFF83NgT/DF9wbWOr4RkldWi7S
 5W4A==
X-Gm-Message-State: APjAAAWcylq2cg3GO9DrvutT1zjVsQRxCjDwqSBQ1/vXtg2QoPokHCZc
 lTcp2Ronyeh1KL9SadYudwuoHA==
X-Google-Smtp-Source: APXvYqxOjzEdbGfSwOwI3RT0iFYGGpdAur+XBVHulKFF4/Gs6mnzBVTL6oLQ3zIqry4T7r4rKaEVrA==
X-Received: by 2002:aa7:8618:: with SMTP id p24mr30917171pfn.3.1580815192429; 
 Tue, 04 Feb 2020 03:19:52 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y6sm23774977pgc.10.2020.02.04.03.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 03:19:52 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: force hart_lottery to put in .sdata section
Date: Tue,  4 Feb 2020 19:19:47 +0800
Message-Id: <20200204111947.52013-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_031955_559595_BB6982FD 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In PIC code model, the zero initialized data always be put in .bss
section, so when building kernel as PIE, the hart_lottery won't present
in small data section, and it causes more than one harts to get the
lottery, because the main hart clears the content of .bss section
immediately after it getting the lottery.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 22b671dbbcf1..45c63dc06360 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -40,7 +40,7 @@ struct screen_info screen_info = {
 #endif
 
 /* The lucky hart to first increment this variable will boot the other cores */
-atomic_t hart_lottery;
+atomic_t hart_lottery __section(.sdata);
 unsigned long boot_cpu_hartid;
 
 void __init parse_dtb(void)
-- 
2.25.0


