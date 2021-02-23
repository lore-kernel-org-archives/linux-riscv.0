Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0895C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:19:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7754C64E00
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7754C64E00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cXTZLH/gzn4PHEJHmhvSupO4g656FUwhhQD/stZW3AE=; b=1ilJmh4wnEZt5IQ31QrWEcuIBn
	WUWRwtt35WHf6UqM4ZeovqETrejf3U7n0TZBxGIp2YaaZIeI6WbxhrSw5Ufu/tVisPdAZTxJ4gRtQ
	y2ijapyyJEznOhFE4zqzh5ujPrVwHhiizryVhsgHJZunf3cc46KQJ/gcM85rIvBR6H+U+iNaEbvAG
	w27jv7veAWEio3A9a31EmQKw1NttI8iyh9TjwqjOIBM/fWnHkxJVK7VHji/Esda7cjk2AN0RpC3ms
	yVB0NRdLo7LdaKwUcon+YgXIASrkoMAL+mQZa7g1IX61EBfETbPbGkGlkxnAVOvdkjmeROzi+DAjh
	pksw71xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENIR-0005P1-BU; Tue, 23 Feb 2021 02:19:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENIO-0005OK-IB
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:19:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id m6so7856120pfk.1
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 18:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=Znb49U0fEt0CVCPRv4tUDB1WYbHL9iuhJS+GaAXOMNA=;
 b=Rj/m5ZFfwQ1f/T0Vi9kLqmBt/MR0TOYP+fKuw9rcp9XRaoBzE5+WcqRg/+JxF0iNRs
 7xc8vGrHd8hBe/fPKpG0bOapoF0BT3/3S+RfnEveMawDi7awhF/VQeKhh1EtBiO+00ft
 F6q0fLe3fr+SUbUetY9INIfhUaehK/Sda1ut2JsQlQkolvwg6aGN/NRjGCuBDOKbePDb
 oRVhRGcADOFHJhn8sus+41yjVnKi0Ej1ufr1i2Zq6nyvdEl05VkOZgN8vUHYSYCbvdgX
 f+dAMkVsGiWY/IhpnWBIEXMzWSb7bwabYs+LrV3N/k5Xz0mOFatVjjK8U9+XI6Ul/nmy
 4kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Znb49U0fEt0CVCPRv4tUDB1WYbHL9iuhJS+GaAXOMNA=;
 b=Y4f+gZ5rTSa5PaVEE4jDTuKtPRdZz2aGk5CUuwYMSOXjbX3phS6w7D6xKcjb+sxS6u
 euRcchaM5Xw/i30EXY6hx1IauZkg6GylrdHs9GY6rBHMM3azN0uKUhqR7JKJu3LwxnrV
 7oNcJgbXVTvGBrdckEkNvA2D4zVDQ99xFM6CRnv48AY01NJw6tQxS7lCM9mT1iaCz5sm
 R7g44JhbLzLXY2A0h+WduuV30W69gh2cHynAShSfG20XQLh/p8bXebPRzulOPR+Jualy
 W9eGvrAqwXVqIp9WxeMFtsXifMzibRMn1s/0wetdjuCo3OnNHxzCyKnmGuIUQSt3Liiz
 FXkw==
X-Gm-Message-State: AOAM53009TozAnvjHUwo2CEnT0rG1oIPBKViCGNFImCLkLGJy5gXEt0t
 qWNStZtkn7Cjnr1j+9QvFtQcBQ==
X-Google-Smtp-Source: ABdhPJxQ5J5mg+pdwIVFC652E8gocwCjkQfWfKRwdZOI4Y5d1+XfWa9b+leU5Tkke9j1v9g2lzsUtg==
X-Received: by 2002:aa7:961d:0:b029:1ed:c1d7:b57d with SMTP id
 q29-20020aa7961d0000b02901edc1d7b57dmr3790657pfg.9.1614046766151; 
 Mon, 22 Feb 2021 18:19:26 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z10sm846730pjn.11.2021.02.22.18.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 18:19:25 -0800 (PST)
Subject: [PATCH] soc: canaan: Sort the Makefile alphabetically
Date: Mon, 22 Feb 2021 18:18:58 -0800
Message-Id: <20210223021858.3809234-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_211928_709626_27EEA01C 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, peng.fan@nxp.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au,
 pczarnecki@internships.antmicro.com, leonard.crestez@nxp.com,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

The rest of these are alphabetically sorted, and leaving it this way
causes a merge conflict.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

---

I missed this when reviewing these patches, but happened across it when
test merging from Linus' tree.  It goes back a way so I'm hesitant to
rebase this one out just for cleanliness, but if I have to go back that
far before sending the merge window PR I'll squash it in.
---
 drivers/soc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index fa7071246546..34b23645be14 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
+obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
@@ -29,4 +30,3 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
 obj-y				+= xilinx/
 obj-$(CONFIG_ARCH_ZX)		+= zte/
-obj-$(CONFIG_SOC_CANAAN)	+= canaan/
-- 
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
