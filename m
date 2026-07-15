Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ABEC44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pwrm1TEEeogKUZTthDsvCwdRA4qzqkwAeiIFWAgeto=; b=WqNFyo5aEDh+1x
	yHzrHZ0iuyr6kl8aF9EDZ1unCIfLqkh4rkSZ1rgdLBpIIc+P74JCwU5RRvxW+8F5Sqs37HdNJaNTp
	/gRZwpphOPPE52joB0UZAhcvpulkTsFTXbex5gRvVlqXpKvAwt2e7xxsF6B14EtsB1SO++u9FXD2l
	9Zo0mlmnr0VJZhSlrvfjQqtkoLURr/Qruzj7zJGFqDhKfPRg4LXKBc37ePGjkaSTYb4qapDUmfT5Z
	//z1txqYvPWqtWhD4eK28FsJkUXOUDZHfQI2ljlMQEBZPx6eoSETo9blEEWLFUwJJfW8pHSIUoTul
	OyD991vMubzP+Q2q2aeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzBD-0000000EsJb-1nNe;
	Wed, 15 Jul 2026 12:57:39 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzBA-0000000EsJ8-49qI
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 12:57:38 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-737de52625cso2516674137.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 05:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784120253; cv=none;
        d=google.com; s=arc-20260327;
        b=QG5QjBSp5xJs212ekhbp1tMJOSjtf51m6ksQ0TYCg9MvZskFOE0Udrc3GV31FCBQJl
         8VFbsG1L6lNhbDGdTfVkU8LtDowBLJrALBhZ+p6SBV8GBaUAiE10orHN6tXunVdbaHOy
         6NEHtuYmWFt//bKS87u+qNykK+vbGuow3G5vzmI4REOeZMcL/oCuDGlnXBxSsIXAZg1M
         X3CFN9zybInocNcRBkBFSTwAB3fRwHZpAZoo9lDzLE52uRHx6vmCksWvb1M3SXNxeWTv
         sPyt4pBQgqUmbEd+Tf5995OiDJhkSKq088jIc+L4ucsAe3nNcGd+6dcJtKrroS2DXmP7
         NgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9H0XuRVlEsxWOSXa2jKa5m2j6f+/bLtY4cyYhqTfTDk=;
        fh=LTGAhH3tBJcCwBz1GcbtgImkjIcx0rnLZbIl/2Cuhcs=;
        b=jGBxPgMYwGFQRAjXU+6cM7LUEMQ0KUxgJkct8NQ2DSvNaghImk2r+JGcJx2CLNmzdR
         kKmCDpSknQobnVKzyT+jIQqYVGdQ6drdHg55q+eSmSUEANaYWKafu12SDxFbV2Jvj0d1
         UoKQdcRCVKdH/0trMu7KXumIzmQx97Apy5TPLZlouAwDRqGF8E9CTgvdCMR4Y7MJOCkg
         OeWI0NtEh9jTJnGcvI8DPx51XP3I5urovjlQjqLkonDCihnT/o3jmn3fXa8hWwlOv3vx
         SQU4EylXr5dsnkvMFlstNL9CbxVvgSLYBD3yQxeBLPMHsaNTsj41cD24FXhgJyuOxGuF
         FFgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784120253; x=1784725053; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H0XuRVlEsxWOSXa2jKa5m2j6f+/bLtY4cyYhqTfTDk=;
        b=iWVKFVXHxFR2MIyvXOxTk/QrbXsLWRpGnJuvF+/cCrTJ+iY8X7vR6J4CF65AcZYfSF
         guxcEyLYJA/FfKjrUuw7B8KP6Gho9YlR3Vrvor3WtyNclj9uB9ldYxZQ1ZsMVoXNfg4x
         nYNQNyEGxDkaglk4H9JGkdGFzabio2nxbTgJ7p3xS4Y70vYkGpVYK6tk6/w2qWGalkPd
         NX40Zm5gIS/vEqnBm9Pr5Y/tZh3XiWtie4T48y9xyVVLcbxtCL2rKv/QWRHAivg9jiXH
         P0fF3g9ZGCCG1O0e3bMlCh5DlGr6immPjcYChD115//X3X1qQzAJwj9Ety7kbt6sh6CJ
         igVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120253; x=1784725053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9H0XuRVlEsxWOSXa2jKa5m2j6f+/bLtY4cyYhqTfTDk=;
        b=qQxqi0WfGCeOebQsekg4ZLdckLGmnjDaHwyjoxC90KXmuhxlMgiWCIMwPKMRIF3IXW
         lF4ITJpQ3qX/yc9MtmiYykCJZT6ZBWPclcAPPzdAe8Wjr9w1THqZChP+ujxOQV3QIh3S
         7dvOYvJKx+2Y1OmT84HDXg47n+xOXvolKzLQ+GPDljSebtbjH8RRcuqIanKZA0F6ow5J
         J+QnJamkwTg83RTi0q3Mv0nBD/lf04V2V6HlKbe/2s0/7LUTEbxp609qozFrWfzy1Ygy
         BCI7BbnhqV5RXAAacUROAE5VW+MXtAGrNl6BfopiZqjNfOc8AM4TSBA5DWhjnfwrfse/
         xUDg==
X-Forwarded-Encrypted: i=1; AHgh+RrgpEy+puHxrrsKtBfAzYEHm/7tVGNTev6TkHXMmftqAgsxpEGd1iIMiGB/CJcuTOvYj4qp3p3Rezu1xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf3uQU0RRvn4DI02NeHSuYhq7Yp46JurZHjIlcNOwrnf08tas3
	UNgtIOsjm/syS1AeFQOt2gHnRE8QKXZ+UdwknBxDrYXI+pTuWJJes68qgOATYKJQKzbTAMp7Ih3
	EEPogluQGmWHdzga9s40rQfc+gw2dzPniTbQeHUPYqLe/X5uwMCN8PHk=
X-Gm-Gg: AfdE7clCfEJ5EBBANyGwJZee5qboQhL81CdKrCAdZtiS4rC54eCAXPn6RerF/x1SYY0
	RAoKkhpzYqz4SMn/Xm0Iswsn+y+QyClZyF6z8fGQip8d41agm88LJBOAPa9xozyoQkoBx+p7b0C
	jj/RKB71TnW2ydxT1U0BRNW8VYGGNrb+ZKtB+qGWGp6ataQ8/fE5v/bMvPr0f95POUyttGwBRdD
	yM2Ck1I9VjD36veUGBTBhn64VwKDEVT3eE/sj8M81MGY/izhxXzF14YcAUMmMo2gqZZN52mZhUh
	K6OsScZh9lf0SQqQVpoWBg8hHaMDmIKCazYD51vuZA==
X-Received: by 2002:a05:6102:d87:b0:737:9edc:36f6 with SMTP id
 ada2fe7eead31-7458757b204mr3810424137.26.1784120253173; Wed, 15 Jul 2026
 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
 <20250901114141.5438-2-luxu.kernel@bytedance.com> <albbQtulrnpOmmBp@soda.int.kasm.eu>
In-Reply-To: <albbQtulrnpOmmBp@soda.int.kasm.eu>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 15 Jul 2026 20:57:20 +0800
X-Gm-Features: AUfX_mwi4ZGyTY9hzEr4eHldimfWXlRLPotdJuLVydh1afQE-jQnOZAmgocRYwI
Message-ID: <CAPYmKFuUNgr-+SMH=5pHYKPiQ6sB4DqTwf4ge+vg83YkpXb6cg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in update_mmu_cache()
To: Klara Modin <klarasmodin@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055737_435652_D7288DF1 
X-CRM114-Status: UNSURE (   4.38  )
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

Hi Klara,

Nice catch! Thanks for your review. I will fix it and resend the patch
series later.

Best regards,
Xu Lu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
