Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B1FC56201
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 19:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E7E20663
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 19:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AESPYs1V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="NGEK7Rhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E7E20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rUymWPaYTO1hkftsueuqIZW/ODF3CRaiomolNsVlbFE=; b=AESPYs1VKMCgujCs4yPvqpGD5l
	Cvc8e95e47DYBpo+pW4EPFZkne5jnFfEqKIrSwGaBvyyj43bD5IetsOHpAEFVGHdu2mexfONYtMug
	i0cildM1PvElvCkq5IbRxFtSuwAMEudnKd8x6vU1xVlEeDlnn9b+SPX3uHgj02uuiDwA6zN/AQt1I
	BCiRyXB2IvScWqiuuxxa9va524gdvdmWAyK1WEHETeGl44tHnUxu/bsgoPUC567vpndFSx8fX4H+Z
	fTZKBDg1xyYaoyUazQm0kYRLbA5pbVy51sUNC3jIqRBt5E0ZfwjDWK95c4ZswOTjlaWeAXkNbPj4M
	QvX3XrUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki0vs-00030n-5a; Wed, 25 Nov 2020 19:58:28 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki0vo-0002zr-6d
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 19:58:25 +0000
Received: by mail-pg1-x541.google.com with SMTP id 81so3378420pgf.0
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=A6GqFZlfnfwQpVbBwycgYvuUf87ws0MJU+ShxbokfgI=;
 b=NGEK7Rhc1Uf2RIGyMm824jQ5Cq1mA6jJb1MR4xXvdz3pal6VBHxdSpy6MROb8D4JcY
 kXvrLYN+DGUryRZsH7REq2rNe4QC3tFjXhq2w0OhkHB2tzARQkGKv9/zks3JILAwZbam
 ziuLBVCnnlWm5dTClDgppeTTZvZaOt3devMd0NabDIaqEiBqrFJN8r+mIEvFpanPBci6
 9IYnmio8Z7/DQ+G6lk02BK3Nls+lDmisOcHXzJfDj5brKcN9E98UP4SD13WnJGatGWAs
 7gm7GxeU5g0EmDqj7E2JrF630JWd67rKeOKzuPjnyqjGYCLj6d277kIv2lKygnQt6pn9
 OGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=A6GqFZlfnfwQpVbBwycgYvuUf87ws0MJU+ShxbokfgI=;
 b=TmDZ9qMnwKmf3ZcPg/hNcPHFd6+NpEujCBsvwzLMiIRenBp7onZzoUSGqEWtxEbUBe
 Usa7TEd8eay30jM2hjF61m7no80EXXZhN37LNMldZZHuSl75XihRhqLO+lqV/MTlN2ct
 Rd3ReIRS/11rxiKkg18pMKBFcn6VmxX8WvT9Vc46xiM5KInXGUwmeMUVp7c66l8Jrr8k
 IqiundN9NAetVcapoFjULmDSouS+RKhmo0ygax3G7eNmQF2YsNChJmLySJSIihZ2a6tR
 mz2MbTVtyJfGuo+HiLAumypra95DlAxv2iKRHB/pcNMw6iK3XvimeyF6u8xYnWjyvjK8
 os5w==
X-Gm-Message-State: AOAM533DcFlICXyI7U1MYc1ON7Tl310XNP3PitZFEyBl5WANdix62Xru
 zmNMB16G7HIkrf+t+u8eL/6M7g==
X-Google-Smtp-Source: ABdhPJzp7Nvm7GiqyReS6Ir0Kb9GhSUuI4szAqtmh5rAnCAosX9h80Xbk6PWFsM4IhaPudbij/bRgw==
X-Received: by 2002:a17:90a:f195:: with SMTP id
 bv21mr5733533pjb.63.1606334299933; 
 Wed, 25 Nov 2020 11:58:19 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r15sm3844651pjp.51.2020.11.25.11.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 11:58:19 -0800 (PST)
Subject: [PATCH] RISC-V: Define get_cycles64() regardless of M-mode
Date: Wed, 25 Nov 2020 11:57:03 -0800
Message-Id: <20201125195703.3780383-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_145824_278668_2413E0D7 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

The timer driver uses get_cycles64() unconditionally to obtain the current
time.  A recent refactoring lost the common definition for some configs, which
is now the only one we need.

Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation for M-mode systems")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/timex.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index ab104905d4db..81de51e6aa32 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -60,6 +60,8 @@ static inline u32 get_cycles_hi(void)
 }
 #define get_cycles_hi get_cycles_hi
 
+#endif /* !CONFIG_RISCV_M_MODE */
+
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
 {
@@ -79,8 +81,6 @@ static inline u64 get_cycles64(void)
 }
 #endif /* CONFIG_64BIT */
 
-#endif /* !CONFIG_RISCV_M_MODE */
-
 #define ARCH_HAS_READ_CURRENT_TIMER
 static inline int read_current_timer(unsigned long *timer_val)
 {
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
