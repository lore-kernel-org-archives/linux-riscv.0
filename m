Return-Path: <SRS0=HO0W=26=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6317EC33C9E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2020 03:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391E820705
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2020 03:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4KhHe/V";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ult0k0kk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391E820705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YAVuBvxPDj3I0LzDLXvbDmZHEsCRtjT+zj2tEj4Y5o0=; b=b4KhHe/VKmxIkWpUerx3crTvR4
	j/RiZDTEMhmRpPtWGFX/V5ZsA8HR9bp1tQOWNWdFrt7l4oHLEvJy4EmnpindKPk4tLYubyaaJ7IvL
	WdIt359yBQkvmCTvWHBBgsYnPqXJPbVePDMl+bdibRFjAeO1/WNp9qHT4X1acsrtox4unbSjBpvWK
	wEgrmhN4duqAwmqxASeKBiPlqOIc5GIY31X7bBkQy1w9wVayj6Ehjkqz4ZPiUqirXbTXn2LTkS9qA
	i7HHTFlypIQdHM8kvVl20OuaD9awzhaMB/k6A8RK8/Ibc5o2NBeYTnOJMB0j/uSb4kIb87+Fh4Ewy
	/K02N9Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipOIC-000384-5J; Thu, 09 Jan 2020 03:15:28 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipOI9-00037g-L3
 for linux-riscv@lists.infradead.org; Thu, 09 Jan 2020 03:15:26 +0000
Received: by mail-pf1-x444.google.com with SMTP id p14so2637907pfn.4
 for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2020 19:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=YAVuBvxPDj3I0LzDLXvbDmZHEsCRtjT+zj2tEj4Y5o0=;
 b=Ult0k0kkJTdzTW7MQ2GB1DtZ/BwbBoQJYZnFMeFwRUdhno2QaZhDYehMBi4l8xQ4R3
 f6Vm5nmIaDNm2WpxS01DOacFz49NiURBiTnRtRa+yeg5dnQNWUf2FuxbkUVqOtSd4xWI
 8oYfnQBDKuN71FVKXC8P7Ad67YejehhO17v91J1MSZLvwLXVOi312WrVuCLyIodAyJnM
 R2LMkT2jpu5hhkItShDv5+G7pP0T+bZ3EYaVj+sy1D4l84JAKBZaa3xTIBbr1ukakADH
 DE5CQcL73WKZeyKjOePXBsAKa5KTu1mgMuEeCtRxxpW/l/NOda8Sy15FWQj75h3NqC1h
 Ovjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YAVuBvxPDj3I0LzDLXvbDmZHEsCRtjT+zj2tEj4Y5o0=;
 b=FBj6L/OQzI5bCjTsMXLB4scqU3dqhaV117/Gjxp3ySsZ9wUVB4h/WcxWTAPTMFDlCD
 GVL9bIxA+WYyvthcD6IKZYfQe/ZAvXow06veahEXWsfVFmgk8NpUZmRtB0UGQ3cMNt2W
 e4DLbup624jbtbcxFHvd+KdZg8TTAQbuaWgsHFAFFWWdUYDkH+SZn2O2n9W02km0pFwz
 uDqfgiMe7Rm5CYr1gcYPQmYRk+MPyc0L2ykdPFHhmQE4KFvfdbx/WPK2QWx+W1ssIY4D
 r4ikyYv8GnF6GJ6hcdXmYQY4Da51c70xXNrRQeRdcAtQ+3AyCxucGMhykESAQoNshuPc
 VVPQ==
X-Gm-Message-State: APjAAAVaQ050bJs4pdhp0+KBWXPq35MdJ5Oev9dGbKaXBdsUICNQo1ze
 d+og6qNDOL+4CQRE7vtWB2aVLA==
X-Google-Smtp-Source: APXvYqydsNvZZ+4d04dshB0xKPGYJ0NHxQ8mRvKUVS/48HKHAQTkdf6GZAGY5kr62oy7BxMXc+WPig==
X-Received: by 2002:a63:ea4c:: with SMTP id l12mr8592315pgk.174.1578539724837; 
 Wed, 08 Jan 2020 19:15:24 -0800 (PST)
Received: from greentime-VirtualBox.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id 11sm5473527pfz.25.2020.01.08.19.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 19:15:24 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: green.hu@gmail.com, greentime@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, schwab@suse.de, anup@brainfault.org
Subject: [PATCH v3] riscv: make sure the cores stay looping in .Lsecondary_park
Date: Thu,  9 Jan 2020 11:15:16 +0800
Message-Id: <20200109031516.29639-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_191525_689828_5806C950 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: Greentime Hu <greentime.hu@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The code in secondary_park is currently placed in the .init section.  The
kernel reclaims and clears this code when it finishes booting.  That
causes the cores parked in it to go to somewhere unpredictable, so we
move this function out of init to make sure the cores stay looping there.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/head.S | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f8f996916c5b..276b98f9d0bd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -217,11 +217,6 @@ relocate:
 	tail smp_callin
 #endif
 
-.align 2
-.Lsecondary_park:
-	/* We lack SMP support or have too many harts, so park this hart */
-	wfi
-	j .Lsecondary_park
 END(_start)
 
 #ifdef CONFIG_RISCV_M_MODE
@@ -303,6 +298,13 @@ ENTRY(reset_regs)
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
 
+.section ".text", "ax",@progbits
+.align 2
+.Lsecondary_park:
+	/* We lack SMP support or have too many harts, so park this hart */
+	wfi
+	j .Lsecondary_park
+
 __PAGE_ALIGNED_BSS
 	/* Empty zero page */
 	.balign PAGE_SIZE
-- 
2.17.1


