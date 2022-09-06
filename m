Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D0C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMZhP438AVTfh3MRIoKDLI9KgI6pvSSAdtXYqBb2ZFU=; b=jDRnRg6ZEQYyOg
	GTYC4nGr2NzLbwQnBnvieeWvvWQ/CHxbJibAK0jbWRhkTvVmc9ksZD2DpPKST/43mkHa4N/YzM2FD
	ytmZQFbtuK3VMjMoACaRMvmRwqcQpUCvJfb1zxU8tZ8cwm7MFjXoxuf8msEX1fn55zGQC4QGSBPo2
	4YNv47TrK2rgFVHmiKOSXrwGStfpIjRzTHtaMuCtYF84+7dNZMJLaReqMewtCfOaXgus/4F2Xp8Ua
	O3xWVphgpqxCVzQwsdvrskLFnNtOKCjmqAo1b2pTcLfzY/e8ZvK3pAEFh6JZvXu9QDhxZkfzDgQ+a
	URRTcsjOfAqX4Br1RtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4I-00BJVU-OV; Tue, 06 Sep 2022 08:36:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU3s-00BJGe-TQ
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:36:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id t5so14108450edc.11
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b5AgkkZuu39oqgpGoAg3+xya9yGInCBwG5bCl7KWK4o=;
        b=o69ti+UC3tq0qYtxG/aTtA4pPNFbM+UEtrEAOvjzIfSnOQ+WFaNHeJIj2gXBiJQR9u
         pRqTMKxld67geyxft8CJpqcyopkBA1zeP3FSYNgLYi06fJyblOlBsH+GgAyPnWA7+5p6
         NzIeJ3kNy+blC7sKRCrvW6E7OAsB1d/GNieZJhL9O6RTgn56cXsS9PEZmXIgxFMhr1lU
         zxAkRR243RvMNiQ+KSowZjZHLw9ki8dCjjysq2jr0nqqBFczFqbMxMDurvU1lm71qn6v
         tXK0KCQ618VIxXPe9ruaaOjh3XwdQerIL3+f8xoawbK2xwqBSnAnqPtCTrmkXMMjt8Bk
         +PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b5AgkkZuu39oqgpGoAg3+xya9yGInCBwG5bCl7KWK4o=;
        b=YZqo6eRuolaoHrSkICV2Z7BXctN3s2E49hFV9mPF3xQIyiOM/13tORSxebpHulPygL
         w7Gxz6BbBlz7SvXFUr9IcFFHHoDrLe6+OzVUYWs2UW8QrHEWvq+Fx2O0WgYo+u/V4hfl
         0q4G3Q0tE2JmYKiuO+emJY+su1jonT5yvMG2YO+hFTefjjbG87d9Sjcjr6DZyWgwphQC
         VqbneIy7ZQ9E18VWF7uZEQ1DKUnqX+ggS7RuYsH/ObeP95DCUnbv0hH0NkEhDC2NDoVS
         eJ9MAoH+jOvsi18PShpeuoCg0Zuj6MG6/LTdl1YuXrEAkL424FuSnA5BxFXHnrjJu9q4
         /Q9g==
X-Gm-Message-State: ACgBeo3RoA/J8AuBG041N7fBsmixsEWi8soCVI/2reQ15Pkuvb2WnBoZ
	dEXMAr9iFwRHCQkYZTC/VG3fXiXIxZlGEA==
X-Google-Smtp-Source: AA6agR7LLBYdf0ekc/PqIrscBwg6XoOPac4XT4jqzG8W94jDRAosHbc5RLHPX4pY/EwtrBaecY4DMw==
X-Received: by 2002:a05:6402:54b:b0:44e:ac69:c617 with SMTP id i11-20020a056402054b00b0044eac69c617mr4851073edx.64.1662453358265;
        Tue, 06 Sep 2022 01:35:58 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm6163235ejx.160.2022.09.06.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:35:57 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 1/3] RISC-V: Output cbom-block-size
Date: Tue,  6 Sep 2022 10:35:53 +0200
Message-Id: <20220906083555.931806-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013600_986916_C2A02169 
X-CRM114-Status: UNSURE (   9.92  )
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

Provide an info message with the block size when the Zicbom extension is
present and the block size has been determined.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index e5b087be1577..8595baf8e403 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
 		}
 	}
 
-	if (probed_block_size)
+	if (probed_block_size) {
 		riscv_cbom_block_size = probed_block_size;
+		pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
+	}
 }
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
