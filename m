Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEB0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Mime-Version:Message-ID:In-Reply-To:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XThC5hRCXYe7gcNBDWfsp9OEaeboRAWM/8lr/iPUI7c=; b=LIP18Y1W+yltDAVl4YAKxDZKbA
	mCNsl6W2PoCCgtQWiof9Qus7yEe8uUPmNvdJFi+bKxEkxyQbaqsjRu6gEk6R4XCSSz3I4KVsQRDky
	9QCb/utAD3HCwDOSrrFAnsjxtBcqFPhJ8DW+YsDBxIixOwvb0S/9ErXU6zUYhkuurWXE+r9Yi8wWS
	GdQVvbtuZQKrKxGcuTKzkZPUIHCaLn+07Ewo5w0si1K3apZQtCJcHCCr9iEoWxYv9jPrPrXYDwPF/
	SMKVjtcJqDTwqxSbRSUBpB2G1m3KdUazVWGdq4uANm4uXC5XOth+SyElvtOMYrBpPtptriVVcRw7K
	qjTycXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjw-00GzXX-FS; Thu, 06 Oct 2022 02:36:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjt-00GzWQ-MJ
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 02:35:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso3066511pjf.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3HrW3IjLHsw8Ny5S11VaJ5Ejs585FkN2Z0H1NwvIGA=;
        b=yK/GJ5ruQgWlB5dFamreC3orLDBicoelCFEwEilNVMZCkpAOF6AZBIlB+EdJSTQmai
         q7MqHe2OyRv4ZY9LSYFC79NuJ2qrEFmjK+BbDf/nRDj0xg5BMdZZ2z2gfsSNYRO4In4P
         nsPNDh0kCl5ngYHygHptuE2fJccP88YZuncyaHXxMNrGtFVfkfZ3gGloneM+X5mTPKow
         /LlScw9jdWoc9LCWgfgCaNR4hLpoWjoO5DtcA2n2XXOWrMDitlyROB7IJfcoZJwj0ngA
         BEE0JXX9SBVQH8Ryz3kx23UvqOxHDYibB2Y2AI3u9GtInrNunm6886rVF8+Dz7mLpxm/
         tPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3HrW3IjLHsw8Ny5S11VaJ5Ejs585FkN2Z0H1NwvIGA=;
        b=x/tYoywC7bjamCypJ82XWRojUTcCj12vS9JWtK+Az1bU+8kCuQa/8gSJWuR9+QUVzH
         W0gZRGsIanJPcy9jWqy85dFDzL6rnNVZp0Anor/ZToqPGbRPW6wVRJLmrY45++D1aQup
         MpWqCKScbw++vl6UVLiwm6C/YQpr8zXksPSaDIomvTl2QKdwvwLKQRxhEJzeoAIwbbmJ
         bmJdAKCYmNB8P+pqOS2JUKkgR2WNDphWY2NG+8Xp0flWAdRqPNhIIvkgkO4nWxl/HJ/w
         QENbCxySXtXB+KNy+8BBV8RcaBaoslhbCNJx5u0fS4QeiJwoEV9nqrUlBjHOuckX2zIQ
         Wtxw==
X-Gm-Message-State: ACrzQf0Mdvki5dN3iv9SjupBRG2wXH4l3yeW3h59GMp8l8ewhXxxkO6O
	4n8vCZS3EmHyrwMZM31PsgWatWC9mz3wEg==
X-Google-Smtp-Source: AMsMyM5ooJvjHA4vYiMvX9kT1HkFwB0mL598ZzEhpk+CSu6cWy2b2ihfiVNO0V/BO24EU3HkeV4/Pw==
X-Received: by 2002:a17:90a:a788:b0:20a:20f5:4f15 with SMTP id f8-20020a17090aa78800b0020a20f54f15mr8184188pjq.91.1665023755452;
        Wed, 05 Oct 2022 19:35:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z3-20020a17090a170300b00203ab277966sm1788946pjd.7.2022.10.05.19.35.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:35:55 -0700 (PDT)
Date: Wed, 05 Oct 2022 19:35:55 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Oct 2022 18:32:50 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Print SSTC in canonical order
In-Reply-To: <20220920204518.10988-1-palmer@rivosinc.com>
Message-ID: <mhng-6ae7c731-a879-4874-bf63-6af6ec8a5b59@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_193557_961090_71B9659E 
X-CRM114-Status: GOOD (  17.95  )
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

On Tue, 20 Sep 2022 13:45:18 PDT (-0700), Palmer Dabbelt wrote:
> This got out of order during a merge conflict, fix it by putting the
> entries in the correct order.
>
> Fixes: 7ab52f75a9cf ("RISC-V: Add Sstc extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 0be8a2403212..87455d12970f 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -92,10 +92,10 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> -	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };

This is on for-next -- jumping the queue a bit, but I'm looking at the 
Svnapot patches right now and those also add an entry in the wrong order 
so I figure it's best to just fix that during the merge.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
