Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D069C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:30:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35024610A8
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35024610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=clkYtT1k/aJM4qMU3NmgdWb4pT4g/f9e/rMfTxbilSE=; b=g8XDJjDpI3+Uo5
	iepB/noEGf0imQGb0qKOWEoHkLC3UaeLtSoGvMCkcEDY4DWz5bT4NxuTX/Vtfi6InKKfNihrb3635
	YU9ZH9FL2BYSK899B+9TlIm22Fyh/j4i/49SUaSl8fzgW5uu/5+9lxYsyaxXPK4xGqx1V/2bIo2vz
	M0PBOkuy/lRMjSsRh/xLppuw0XxUD3V5HUvDekd3Lr8ChTqszolrCsVgoVMG6eBtWQdWHX6yMIkXA
	UHXR2ytZR2GEUGZw5k5Slf9cbY+WHgZxuyflzmLHmWWkwN2BSgIrHRUuhZ3VBfoVKEryNRLEbOW7p
	5cBSa3Egn0BJXBSU2CUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEOi-001HNp-JN; Mon, 24 May 2021 17:29:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkwcq-000b0B-MB
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 22:31:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id g24so13726001pji.4
 for <linux-riscv@lists.infradead.org>; Sun, 23 May 2021 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=+FTCd/E9+D/v9pj08p//Aqy6nNW3LB39N4vUAFoo3Bo=;
 b=mhDQ7hWyipi7j3K6hE+wR+s0ZRf7BJ3qQCGV0pj5eXSWbZh4OSErCGpDCywoieTrhr
 G9Ok9EG1kbmRfzIepBTVAj1VJVubudIdQCuBlONK/zwkaezXleRQONOMuJ/7nCnPwCou
 H8ZXMTOhU/O8cvjOCIdXVHiqOCtVFmGGaEYdptJsEzcYSmrcBkTHIpB7Mrlsrv30fPiw
 qZbvgdX97K0wfjHHcchg9JIr2SEoO3Dp9+7zyUwN+2IzHSqlzGZ501w998MoEZBTvMHM
 516iNYZO316CJNjIQ1W+YCAIlhz4ceraLmiOXRZFiv2tadxDsdef9HhD+hsHo3Rh5IFJ
 XJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=+FTCd/E9+D/v9pj08p//Aqy6nNW3LB39N4vUAFoo3Bo=;
 b=Hh9BIk9rS85Bh/2xVuXhUJ6aYvK1sEVkrfNMnc9meZBmqSTmogNK/J2frh+rKnUBQa
 Pc6w5KF1lfcxrjcnJ7xnbtp6+invKrzUvq4axtdl5ceaL1VrqkFJM+1TLi2vHP5+8YNf
 8mOGbtpPkH8GhvzKkFcu/jONJMg/TqU9Uj8cTh+fY8Klkj2ntF3e0OJ4WPH+ATCn51Qa
 JfoS51H8EB0e/q3TRfOxLXZinSamoqcdcylu1Xyr9DurVG7/dKC/H2TZcToBbOLg57EV
 zU1aqe5pmB+tryopbdKlOgAU1qSN4Rb/hG+iWv4dXwlqt5k22jTnci15Xo4AKWuWSZF1
 x3mQ==
X-Gm-Message-State: AOAM533XUx6uQf23AnEQWuMECIuNawKhAPXgfakVVprAMo1AVG3V6Bju
 t2eJJGTHMa1C50ue6u7gkAhqhA==
X-Google-Smtp-Source: ABdhPJw25uvez8+izftWBXI6HTWVGgorVDAE9WLKGoErheO+xW42GZZYliLH1Ga1oMwDG1fzc1YS0A==
X-Received: by 2002:a17:902:cec5:b029:f0:b123:44b2 with SMTP id
 d5-20020a170902cec5b02900f0b12344b2mr22173863plg.55.1621809067034; 
 Sun, 23 May 2021 15:31:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c191sm9360016pfc.94.2021.05.23.15.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 15:31:06 -0700 (PDT)
Subject: [PATCH RESEND] riscv: enable generic PCI resource mapping
Date: Sun, 23 May 2021 15:24:14 -0700
Message-Id: <20210523222413.990829-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org, kda@semihalf.com,
 david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_153112_770417_4372C5DC 
X-CRM114-Status: GOOD (  11.47  )
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

From: Stanislaw Kardach <kda@semihalf.com>

Enable the PCI resource mapping on RISC-V using the generic framework.
This allows userspace applications to mmap PCI resources using
/sys/devices/pci*/*/resource* interface.
The mmap has been tested with Intel x520-DA2 NIC card on a HiFive
Unmatched board (SiFive FU740 SoC).

Signed-off-by: Stanislaw Kardach <kda@semihalf.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
David, who was CC'd on the original patch, pointed out I missed this one.  For
some reason it's not in my inbox, I'm not entirely sure why as it landed on
lore:
https://lore.kernel.org/linux-riscv/20210412111012.675957-1-kda@semihalf.com/ .
Given the discrepency I thought it would be best to just send this out again.

I've put this on for-next.

Thanks!
---
 arch/riscv/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index 658e112c3ce7..7fd52a30e605 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -18,6 +18,8 @@
 /* RISC-V shim does not initialize PCI bus */
 #define pcibios_assign_all_busses() 1
 
+#define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
+
 extern int isa_dma_bridge_buggy;
 
 #ifdef CONFIG_PCI
-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
