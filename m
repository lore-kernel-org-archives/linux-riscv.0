Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762AFC433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:02:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6F720720
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ybs+UjHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VsRIyxfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F6F720720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=g9cS9231tYtsdtcjiOVEAq3yUW0PSBLVcCMQBNTa6JU=; b=Ybs+UjHtay/s0qoc+AAvnR21B
	rUPEAQFr6bIjiFdbHbVSobQwRjyI1wgWbWPZX8EoJ3cDLLXK+CVjfcK9ItDiW07LO05Kgw8RWgixO
	Juc/BPRIFeoxI2adS+FM4Oywjq8HcATms6g/euMQYkPOGHNyfjifRpjlNdKdi5vKVUuMKFXyuN6ci
	ylzQLX/v34pXCbvvxgQI5dFYGKwEX6XoO2NMZppogoJGR+6sEF+UpmFTfDz7MaP9goPWfWTktt23Z
	rOZlyLg6rFkjfAThvtpUcPBF7sPJ6O1aO1pnBM1BB7dH6M6vyDt856lTMETzvBytWrew6hXGf7w+x
	bjHBPg0SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy1H1-0005vQ-E2; Tue, 21 Jul 2020 23:02:11 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy1Gz-0005um-34
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 23:02:09 +0000
Received: by mail-pl1-x642.google.com with SMTP id w17so12152ply.11
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 16:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mcZTtXUZTypejTnIJ7xyZOrF3R3Meo9MjDufW96ubz8=;
 b=VsRIyxfZipyELzOOGXyC7A/mMrs+UsFQWvACDHx3vXVYKIkhRxZ4HCXXsj+7S+fOWa
 8anGBr/9l9CTXmpXhjjwZDPLxC3QwvXVFO4fexy9cxiQ9QGAOZubrWcoyJrYzkFEcKhg
 DQfT87xX2ICUsY9dXTAkQomNrlYlkjw0bzglLl/Rt77B2gvyJFRTqmIpTrmQfZTNcyZU
 J7QEyhCszj9q01oOxEerSe8+dH3gjgZVdfPLQDb9wAmSmlFaWx8tbS9p7hRlSXdx9CDn
 BVQEX7q+Ojd/1VHPtj7SK7vB8A+BOP9YRPzy0d3WSkrnyHv2vHTqXdKuZg2qi+faBXnz
 Io5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mcZTtXUZTypejTnIJ7xyZOrF3R3Meo9MjDufW96ubz8=;
 b=sBsmYKJhu8c3OjINjKUxCY6L9dZrEmU9H3IJRfZBY/Gxcyjqdavg5C2rqO3YDadKH7
 mjKNOmbiK2M6LBFOq3C0sAR/zFgXGmKW/RSykRiaBlOV+9m6EYbGUKW3Vy0s4kFfWZfJ
 VPMQSuY6/etrq+kiZIu5dC1HSxuxvyHAhNgAdV1JPISj82824jFrHmBC1O51/ZtGFfyI
 AzAF9s+3zTwMG4En38pAUw+UiRBHjbr2S+1vlwK6dM84f5Q9TFcoPmXOeGcG9bnpqJuK
 vj4OCiGe5VqtOmUr2ktvSPeIzUViDex7rYc6aBUWWTQ59VkFwlyEzpYTD60VCVkpynSd
 DTQA==
X-Gm-Message-State: AOAM532ce4msySWvVSg86TI1GDe7CSvIsiqQImSQjRpxn3A+/cELlYLE
 AIt6BTrJAs4HsSBqrJv8nFW4LQ==
X-Google-Smtp-Source: ABdhPJxNB+8714jhZkFUMp5+W+T+nSUMhVdE5+kOrwpP1g7VL9v49row44RpOFy391TezGadZfINuw==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr24478726pla.288.1595372526421; 
 Tue, 21 Jul 2020 16:02:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t19sm18386515pgg.19.2020.07.21.16.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 16:02:05 -0700 (PDT)
Date: Tue, 21 Jul 2020 16:02:05 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 16:02:03 PDT (-0700)
Subject: Re: [PATCH 3/6] riscv: include <asm/pgtable.h> in <asm/uaccess.h>
In-Reply-To: <20200710135706.537715-4-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-2e6d1568-076d-40fc-988a-9d035d54af79@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_190209_271853_C8045ACA 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: linux-arch@vger.kernel.org, nickhu@andestech.com,
 linux-kernel@vger.kernel.org, green.hu@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, akpm@linux-foundation.org,
 deanbo422@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jul 2020 06:57:03 PDT (-0700), Christoph Hellwig wrote:
> To ensure TASK_SIZE is defined for USER_DS.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/uaccess.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 8ce9d607b53dce..22de922d6ecb2f 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -8,6 +8,8 @@
>  #ifndef _ASM_RISCV_UACCESS_H
>  #define _ASM_RISCV_UACCESS_H
>
> +#include <asm/pgtable.h>		/* for TASK_SIZE */
> +
>  /*
>   * User space memory access functions
>   */

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
