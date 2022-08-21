Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D64C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7boC/NBOMYdIk1XBw2HRcAAt7B/IWNGQ1ps5mrSIZH4=; b=ii+uajFFmSdM0q
	JtqI9JPL8CGEOFfi/I23mTfyTFHrG93/aFllmDgA60u4rn+alVwEEFRQDgSw1GfQH14uc1E1afY0W
	luIrY5HS3wFZZV/CyVjCYAHihcEM/HTruSDkitkgVPXzwYkSSjie7/wFeo9Sr8Ie7ueHNVBn2XX86
	cmS8iBVxlLw240lzp2Cp5W7ZFwfmUN2HyWQlhbMtoU4ouUDtNB4pvp6/zjPR6hNDev5rr1vqJdi5q
	w0OfSGI7SM/lrQKuC4+4DSM4xItZPKDzZL3F5h1JFXdrh5yd5blCWR0NZwnAozClFK0mSsOXENX93
	Lcd9qKJafrmDsSI+kutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFs-009mwi-3y; Sun, 21 Aug 2022 11:36:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFj-009mmq-C3
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id k17so4275213wmr.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=JBm3JbYzVZyjjb4o90s9QqDUxEn4h4q/mRrSSGBV0DA=;
        b=Ndo3cUOFcvU9vobg4ECMxbbBto0GCzZXLsi58Tc0a+aRUV5xaiUrQ1WE7WGMGonuyM
         pWjbfzMTxC3WZgc7Kd0dzvv55RE+rugIoVU2gm2JxNlyXxX9JvbfPqO3Wty5HComkoNy
         z/FrSVdRGmSxD9J/eeQS+gl4LKuNcnIyYhmaQk9x7zmNI/cHYJ6Crrta8wcLAAZP0Vvm
         849bGJo2CDf1HG1GvbOSuL5QodydxN1S9/JynQLmjaY6zPYxKiVXg8b4sMMwqt3psm61
         gyMTlAo4Cdjc4j6KyvB94c1XgT2tVCzfF/EiZnUD3iXReG81rvWzDLu4vp4rZTEsjGL4
         ygbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=JBm3JbYzVZyjjb4o90s9QqDUxEn4h4q/mRrSSGBV0DA=;
        b=5UcZhlyuCUUOjVsyNLoYS2Cp2Cy0MIpJjRVaYFA6BiefORh0+GjfbdR/OtWjIc3gWd
         PtX+txKaFWPbTBBSxQbcz2FKwCEnx55Cx/BCpuaXCZEu2HzU79VLWinp0Iiub50DzzEO
         IkzNmcxXw+qkkiVcSY216Z6TGXE2zuhjPd4VFExr3iLTO15INWNbx9DrSnV6cxbPIg6M
         YR3mMw1hFWtxkDtpOl88SG+fptmjCzocJVzM2mk13MIx+D0YYjDSep/G9xqOzWcYZAer
         TeCEhETfQsayK0G7RZgp6LmOKGgK85CcuNYgMTsx7mzdJZKipZzBTV31axAePsvjXDc1
         iL2A==
X-Gm-Message-State: ACgBeo0MK04rWu5v9bm/Md+K95W5xlPNxRlI2B7jK3Em3RFVGmNyEHV+
	oqknbtwrqPGLZ2sD9uW9yuuaVA==
X-Google-Smtp-Source: AA6agR7fUuguxyVoajzO5r2IzhUFn/jBjXj29sCwHWGo+An40pD5GMxu5Abtd+UzorNvMppKEiQWPQ==
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id n32-20020a05600c3ba000b003a5b73a8773mr12497956wms.64.1661081785402;
        Sun, 21 Aug 2022 04:36:25 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:24 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 5/6] sparc: use the asm-generic version of cpuinfo_op
Date: Sun, 21 Aug 2022 12:35:12 +0100
Message-Id: <20220821113512.2056409-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043627_534864_7CAA4FF1 
X-CRM114-Status: GOOD (  10.80  )
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

From: Conor Dooley <conor.dooley@microchip.com>

There's little point in duplicating the declaration of cpuinfo_op now
that there's a shared version of it, so drop it & include the generic
header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/sparc/include/asm/cpudata.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
index d213165ee713..af6ef3c028a9 100644
--- a/arch/sparc/include/asm/cpudata.h
+++ b/arch/sparc/include/asm/cpudata.h
@@ -6,8 +6,7 @@
 
 #include <linux/threads.h>
 #include <linux/percpu.h>
-
-extern const struct seq_operations cpuinfo_op;
+#include <asm-generic/processor.h>
 
 #endif /* !(__ASSEMBLY__) */
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
