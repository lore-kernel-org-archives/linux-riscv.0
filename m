Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9AFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 12:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lvT1wlyz5GzhAxipXEauSkGLLsBn0Nd+5hmvQvH+ygo=; b=vnvYfax7LPRJ+u
	iHngQkMUFogcVJlr+6lgGccI9j7Oty7nKrVIes87J1Jw6i7rnh2H0EDKC3goFfl2rUil+sbNuHpnU
	3kvkWBHy/6rb3JLrbXhIqu44pV+atg/uWjHa5x5WOtx9zLCGqFSR6LKt9rsyxfMHvubJr2IMkF6X8
	g4s6H+OABO7lkAq4DPr2DkD5dUQgfI0CYIOUVAye84F39jI2U8claAvUBGly0uEJzla8DY/RdcppA
	1gbkMTkrMFVlYzh1cQY8wjWIWlmA1//3Re56XE1MB2bynjLMh4vKvgLMOlEpgYYPJOxsAgraddm1C
	5cSA+BuuWk0ZrgTdWDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0BS-00AmmD-0h;
	Wed, 03 Jan 2024 12:17:18 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0BP-00Amle-0V
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 12:17:16 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35fd9e40039so54984285ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 04:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704284232; x=1704889032; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ewh/BdXDi64xQUw18Azf93G3ctRpPshaW0euXjl3EM4=;
        b=mdSQslnfN21VbAd/Z4reO0wCAgpx3j+jhhuC0neTJA3YDi6BtZaeZi8Ft193w3zrov
         R9GAXgNmlZvZiezySe/UvhQgLK79eh5LHiMoG8Yk/rMaCpB0QY6s1OB3Czaj4va+whu3
         lx1jN9UlfeBsUql8MpH2sy34FomobwW+amEAtbprcCdVWnuO77bEPKoDxEbLNUoldfSK
         TpjJrcaSHoCGCsQPvEG1w9mHq2pCM1v3b2MqJ/c0b4MWdmLLbdQumhFwr7KiJ2CY5rg8
         k8hkWEmkmCEUrol+a80p6bt/hpqoy43o80T9/+cqgtmtxYAS5ZP3cGu5XFE0/7YBcVYN
         ZWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704284232; x=1704889032;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewh/BdXDi64xQUw18Azf93G3ctRpPshaW0euXjl3EM4=;
        b=XLrzleVB9wVVS5Q8N2c/m95Flhc5QphkLmfb7+5zgDazeZP93TXU9fGxhgvhLyIX08
         Wz3+cwa/8mg0/9QuengTpzA1Fwa+ONgjyOpgRPj5rjpAdr1RilAXCg/txT0pibDh7jFj
         5L38XDcHdsxXG/Hf9udzT8rFiLNlz8EPw65n6rnvbHaTw52848lRqcFL7HBqbTRlk5Vq
         DOrdZpUWtdQeYUIc4130meLg5jkssbKPHGPZgoDbbMt1qVBBDt2ZOgYxywxzjv3otvDO
         5zeqZHGZjSKQXt691C+5yr1TFW8ZnzNkxyz22pLe7Byw0Rg4Dx/JcVb1xq45e68XLcpG
         LuMw==
X-Gm-Message-State: AOJu0Yy5bh+xLGKcA1yB4BXpHlgo124bgc0kE3Wm3GzOEGiXihBwYreB
	orScP27BQMMK88KKzug6IgCEL+MgY95wfWtNLq4hvUSSQE8=
X-Google-Smtp-Source: AGHT+IGjXoCtXY3xEur+zJxye1UWMXmhOCAKtlSfY3EbmT0JR7j3KfjrIzS3nQ2+dqOjHFGRN6+1zQ==
X-Received: by 2002:a05:6e02:12e3:b0:35f:fae1:793 with SMTP id l3-20020a056e0212e300b0035ffae10793mr26299669iln.43.1704284232009;
        Wed, 03 Jan 2024 04:17:12 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id n15-20020a6563cf000000b005cdf0b46fecsm17772881pgv.81.2024.01.03.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 04:17:11 -0800 (PST)
Subject: [PATCH] RISC-V: hwprobe: Check for the reserved flags
Date: Wed,  3 Jan 2024 04:12:20 -0800
Message-ID: <20240103121220.26506-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_041715_511496_0899864F 
X-CRM114-Status: UNSURE (   9.30  )
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

This check got dropped when RISCV_HWPROBE_WHICH_CPUS was added, but
we've still got a bunch of other reserved flags.  So check for them,
just to make sure userspace doesn't get confused later.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index ccf61b040536..10d72893b04f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -347,6 +347,10 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 			    unsigned long __user *cpus_user,
 			    unsigned int flags)
 {
+	/* The rest of the flags are still reserved. */
+	if (flags & ~RISCV_HWPROBE_WICHH_CPUS)
+		return -EINVAL;
+
 	if (flags & RISCV_HWPROBE_WHICH_CPUS)
 		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
 					cpus_user, flags);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
