Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03479C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 02:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IeqHVocU5GvF3DmO8tHYqnMeW2llUtjjnxM1SJ9CTdg=; b=4Pb99fJMZMbzdE
	NZgarl/uhlBMGNJXv5Y6iRh0+h94FDgqncnSIS4vb1zGgYdM8XNN+XsHBKo/giq1B2RXE83ZRJKZj
	oovUnIe7/rDJ8XcIKLEAH2aYdblfGBFkrgXBfF+fF8I6VJjtR1nlrFwO/T1pAmlW3hnLgtiywOOS4
	RT0oPda2GGPZXGb1hiDEjRrLS7i2GTF/O4gvwdyypR2NBRiLRq63sAgO6blnte84tLOtOFb3HFnKA
	jGtuhFRlgUTLp7i4G029PRFgWyYrpeJkigLB4hQ+Ux3pwgunlzY0PHo5Vqh1+iomBGgqu9uwSJ7h5
	QphCtZYtF2YiWiXoiBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVOnn-0036hO-Cs; Sat, 19 Mar 2022 02:26:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVOnk-0036h0-3l
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 02:26:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id i11so7797346plr.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 19:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z6eVLjbCCzQnrifSU+qXua3hIy1Hsiblq05L2N/W6qU=;
 b=oW6d4xOYJZktL13Ik9ahp/Hls2dgEMczQG+9uS2nXySPcqJge+jJPwP386oo/HIlq/
 r3ayIM/42Z/7cjKraa0UfRegh47kntwGtxK/fgmQzA3g5pgCTi5kF0/VwxJoWLfAfT9G
 XC3qgLWTyUFeSsvtS7hDxgXlKD9OUUNIN3x+0w25yDlqRETBc4hE1n1TdybRuyAkUpeS
 ziFsrxoGyAF9BhlfpNVpBk9NwC7cvovFnuIdEwE4RnUu8x4C52zthZkxZss8z9HIctnd
 C/8pK9RAR/CPed0B7hXOFvXy78U0GyWfUIYRXM3XrHpq/aqYjrg2FkNMe05XvtwuHU4O
 21Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z6eVLjbCCzQnrifSU+qXua3hIy1Hsiblq05L2N/W6qU=;
 b=oYkqxqiS3RH+KkWxfSDnJfJo871icUUqClvEHFcjuySoSb405oZGBf5bj54tRbyNh0
 1nbqFiLW2Me2bUFqpmCw6Db7kKVmgbIejfFHTPCX+tyP336+oqsCIF/3Us2dcXGAC2aL
 mul2qjoTN0xIrLB9y7yRxfxfEH7PUO8mPjPFzvGI+8Vt7TUliA59jYEOM/tF+chbm+op
 CswmB7z+9FhgTcS2WvPAY9cqwxwn7srEXe6c2jRtWs7OefR49kE4OiWT3CTSs0iOcqrq
 iFn73jFF4BpCoVz3n3863O+VDZ6vYG7Y6A7o0Npso1BJ87bSWajikXE1HtP6BUgJuKGn
 qr7g==
X-Gm-Message-State: AOAM532KLmp1tcO4Qyogqixtq4GmSgd4yF124FRmtXPeIQn/n7LGps+1
 GANZl5OFeDnMZN159jP/n6w7XcHyeNzRRA==
X-Google-Smtp-Source: ABdhPJzgtHeS5c5VA2lG2x72gSeytJNbzQIUq6dTBMwTauQWDvD0CD2l2jvDCKjf78q1PM2/42g1pQ==
X-Received: by 2002:a17:903:3091:b0:153:9dcf:de71 with SMTP id
 u17-20020a170903309100b001539dcfde71mr2457590plc.7.1647656801840; 
 Fri, 18 Mar 2022 19:26:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ip13-20020a17090b314d00b001bfaa1f060bsm14127946pjb.5.2022.03.18.19.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 19:26:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] RISC-V: Fix a typo in the comment
Date: Fri, 18 Mar 2022 19:26:33 -0700
Message-Id: <20220319022633.988597-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_192644_268460_F78CE176 
X-CRM114-Status: GOOD (  11.19  )
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

This is just typo fix in comments introduced by the following patch.

commit a9b202606c69 ("RISC-V: Improve /proc/cpuinfo output for ISA extensions")

@palmer: This patch is on top of for-next. Please squash it before
sending the PR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ecc2a09a66a9..625e3185bc13 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -73,7 +73,7 @@ int riscv_of_parent_hartid(struct device_node *node)
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
  * 1. All extensions should be separated from other multi-letter extensions
- *    from other multi-letter extensions by an underscore.
+ *    by an underscore.
  * 2. The first letter following the 'Z' conventionally indicates the most
  *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
  *    If multiple 'Z' extensions are named, they should be ordered first
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
