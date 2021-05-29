Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349E2C4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C994E610A0
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C994E610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=m0kfxiRjQbIwGROA/v9RjrwRddRCBhukV20zC6Ffb08=; b=aR7//nSgevXJNaxxsSy9cNDLQj
	w1C1nw+3qOfU9fE8HM70mF6gmAlBowJj1dBx4eLSpcBe+KMXW9XBZc5AWVsD05R6QhMeWWBt/3MfE
	oCFUOIl+UrG2KqhkNa4HgNBsBYmvi/xHzqQEiT5QYbsYJfqPACqrGntUowoRvjkKTbKnkzn0QeTCc
	46XQCYfHiVL6+QuQuessyZ2CPXbrfqpVsLBgnS3Ir0YIFDpegSzy/4WxRaVeDxOkmBVYkmS8e3oQ4
	8F8IIZAfmyaZAaLq+KniojRBWPPADwZ++sTsdYC1utetT1fPP0SeotsufEnFAdrD1Qq7sG4FBqyRd
	bUICJBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln842-008Y19-M6; Sat, 29 May 2021 23:08:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln83z-008Y0I-9t
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 23:08:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id kr9so4537250pjb.5
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Oz6WbJIayPIPGEgF0T14UBd14Ee4ocMxtgGqOTktA4o=;
 b=KkpWKZcffZcA6m9H+fXFRQbgNJ2xVyY2yM/oi8uvoLZ88Sm4F2PfTII7WcT0nRsKY+
 pOzth+EvBsbnkMU/7FsKJNeGnnE+MPHYX9zMwUxxbiFjmW15s6SIgaD2kSD5Sxlm98c+
 0Ut6A/hCrZP4XuKM7ScqwTc3HkcM3ySnB8RZqE/KekxvT2V2eQjQP4DoHNWQDFDW8Foi
 GAZUcxdVJE6eUDQy2xE8k1qI+OjpF+ghyL2C3ANtFfhNgAD+Q8/utbPrZo5wwloF+grQ
 5sYhwpAJmBhS9ooGbt8sX07/CRCmLceDwEz8YlbUa90Kcbm1oohKX2no0qNse8uivjqO
 MzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Oz6WbJIayPIPGEgF0T14UBd14Ee4ocMxtgGqOTktA4o=;
 b=BXi2abJpXo2n1Bp76GOM2JgqhH9DUffqOsqU3tidZgvu0UuckNOSX6IaLjCJKaANcs
 oSDJv//XxEvo32QReL9vZmqc/7fZ5C3hcG4Bl+kkJJP7nyYSzzsoTijLbhBBV+9Ui/D7
 Ne+8gYWm8z/BI6Un6uCDCxf/MrDwO2c+dMBi0Nc/a/ogRZWqsQPMsW2iEbcNE/0EbH9n
 z8f6TbVIfJrYSmOd4T9dFH2JLQLBTyMQt6gitWTh13JZdEwqrGe/mUddPeocPcBvHSi3
 6pRCNDoRA1PJzUQ+C2u2xBhjzBFbdiolScQXq6z4xc77OwreUZgxSzp48o2m89GC3hi5
 FA0g==
X-Gm-Message-State: AOAM530rzPpqhiLv/1F2n5sBoPdgm02YuvtXwQlC0MjpbQCjgPJSrm/F
 3PVqZ33EPnxc0ub4yQ7JeH0D255rHjj2Xw==
X-Google-Smtp-Source: ABdhPJxy8tTHJfiR+q/sQ1ZwCMi35M9UJBnTbnM2neGccG4Oq88chDZdi8Kkd+rmosgqHiIedpMQfg==
X-Received: by 2002:a17:902:9b83:b029:ef:4dd5:beab with SMTP id
 y3-20020a1709029b83b02900ef4dd5beabmr13846708plp.76.1622329694231; 
 Sat, 29 May 2021 16:08:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v4sm2066778pfn.41.2021.05.29.16.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 16:08:13 -0700 (PDT)
Date: Sat, 29 May 2021 16:08:13 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:51:03 PDT (-0700)
Subject: Re: [PATCH] clk: sifive: Fix kernel-doc
In-Reply-To: <1621851730-32287-1-git-send-email-yang.lee@linux.alibaba.com>
CC: mturquette@baylibre.com, sboyd@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, yang.lee@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yang.lee@linux.alibaba.com
Message-ID: <mhng-5e882346-b7ef-44de-ae79-af3873f0ffb8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_160815_365669_A893F06F 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 May 2021 03:22:10 PDT (-0700), yang.lee@linux.alibaba.com wrote:
> Fix function name in sifive-prci.c kernel-doc comment
> to remove a warning.
>
> drivers/clk/sifive/sifive-prci.c:573: warning: expecting prototype for
> sifive_prci_init(). Prototype was for sifive_prci_probe() instead
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/clk/sifive/sifive-prci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 0d79ba3..80a288c 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -564,7 +564,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
>  }
>
>  /**
> - * sifive_prci_init() - initialize prci data and check parent count
> + * sifive_prci_probe() - initialize prci data and check parent count
>   * @pdev: platform device pointer for the prci
>   *
>   * Return: 0 upon success or a negative error code upon failure.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm assuming this is targeted for the clock tree, but LMK if you want me 
to take it.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
