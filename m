Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B82CFB42C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mReX+Wc+Z2/INcx+XY/6y09QcC6HbkinJJ6oFXIpYCw=; b=xRpEdHvS31x6Av
	7O9viuWjDAuEvfePtbjzc7ihHZvCgkTjytRMgwBLQ0KJ1yGef0v3C75ryS6Rc+pN+J0cCUuM0CAGB
	s3sf4EjWgpAdqEi9osdC3g3U6DveJvGSRCGp7IIofH23SueCnINiL4cV6XiYsORR5m2Sy6SfEK9Cd
	27cjx3nDh5yaBMHiXBxtgVamCpyduIG73acjUqZUe5IrsJ4j6SYnWMZc1WinOlcdcY4JNJeqRKW+G
	DM7tOeJtr6f5ZltAlBd1ROAJzGGbJYTQducHR/mjNngPKF8r24h/bK9JK5DEyAaAyZ6WjsuOQ8gS0
	S0rzj65xNCg0h7ym1NMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAZ5-0000000FnyI-2AmV;
	Sat, 05 Oct 2024 19:35:43 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAZ1-0000000Fnvz-0SWZ
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:35:40 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso1922042a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156938; x=1728761738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB2Efzb4PfNe8Kk04ZtI/HUIlV7fy8A7d3zUOzv2nEY=;
        b=Jwz3pRNthbh15BjnSFjfkt6jgeEmSepNeI2BBq/dWO1ucq/ltjouBjbK4LgLpCDWI0
         b1o3Blk2N1xCaIztsHadjCQcvl5d1+6VSErEsh1nIC24cPIq1TUBLtLGj/d1uGauQVeS
         8qRMTjQLFcm0ICqkxPpvomlwOKTKqZZ0n9siep2B3Roi+4mPd1JP5xomdMje/kt7O4iF
         3LQpL7cE963VFJhSEdiDwLlzoX26mm/fpIPr2dAjgNxPlzDmJ5mW7rS4fhZmTpcTdhUO
         w+Tcx9/KcOv1g9+prpMyPsha+AEVF7n73z5BI0VwYcFhxnF6Ld6G1xB4Hra5SrmbQTu/
         pdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156938; x=1728761738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB2Efzb4PfNe8Kk04ZtI/HUIlV7fy8A7d3zUOzv2nEY=;
        b=QvWoW7bWd0qthX7ymNFd3tta7kk1V3VYQNr2k7gT/mAQbvvHqYkWo/kVWGMrv97TYj
         ORl7V9XbbfThHOlRYp9GZrudsXdnRuHKysoVbj7Kf2h0RYcv1n6MnzfpewcU9sw2RRu1
         dKjxCJvUwL+hijSLMewoy+MbBi7irBX757YC3GbwvdgdYv4LU69BAS4Vh3OUsOzrYYR4
         ghMAxH8qithOa1qzOYYsh/j3UFtPDR2cjd5jzGPkZsmHH8QhE9oOOTRoOlTSMG0Jj9/o
         Q3XBhpZRjVGncrVVdt/NY23xmtTNKKPCb7B8lk75ZKnAkjWstNR5p3depNUW1r9VKamP
         72FA==
X-Gm-Message-State: AOJu0Yy5X85963iMWUPb1PmabqGjR99w6n49A2Fc+rWg89H8Ve7OGmnS
	BiQfs67h5V0iyPmBBie9Lf2/gguWqaQzQKeiiyR7jzAP/prZ2mzrxArFkeV/4I4=
X-Google-Smtp-Source: AGHT+IEOkp++mkE9wG5kj6OwARC3IfLV+wMXPUcPDx2A5yXrs5mQUofUYyfpuNdJVwdTIyJVMrft6g==
X-Received: by 2002:a17:90a:e2d5:b0:2e0:778f:d774 with SMTP id 98e67ed59e1d1-2e1e6213064mr8573006a91.2.1728156938138;
        Sat, 05 Oct 2024 12:35:38 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae6dfa4sm2208372a91.2.2024.10.05.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 05 Oct 2024 12:35:28 -0700
Subject: [PATCH 2/2] pinctrl: th1520: Fix return value for unknown pin
 error
MIME-Version: 1.0
Message-Id: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_123539_185836_BD43691A 
X-CRM114-Status: UNSURE (   7.76  )
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

Fix th1520_pinctrl_dt_node_to_map() to a return value upon an unknown
pin error before jumping to free_configs.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index d03a0a34220a..92834b6718b3 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -499,6 +499,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				nmaps = rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
+				ret = -EINVAL;
 				goto free_configs;
 			}
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
