Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA8AC433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0B321D40
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yoCXreGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="JLdEHyMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B0B321D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FFBwFj85x4XU0RwDJ9vtQ7LRw2+0OND2tJhd4RKSlGM=; b=yoCXreGjDFtPGMZFq6+451fHl
	pOavCTRQq9KRioEJaKubgBtqR2PpIFtLl+if5qjGzXm32zBPG4fukTBdlYWxexgiTg9IdM8/bbVxO
	f3Oeof5yx60vhiVSWuBhWebN80lsotKVp9FFWhOO8mbrXrDkgm0P18aIIa6XBI+gNECZnNl4kiGI4
	wa/UFRGSPqPzfseg1y6kFqvuh3EYLnf+CdLgOaC24PqmVy+akgR93ZaYH2SFDdure3wds0Zt/KgJo
	H7VuCXPw9UEib10nNvs8vqM9k04P6hTAB+6lM8XINm8HkXIjZQYVQAu+sE4Zoq+g4hPik4friOIDD
	VkssxEuQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFsCi-0000OY-JS; Wed, 09 Sep 2020 04:59:32 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFsCf-0000M4-Nk
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 04:59:30 +0000
Received: by mail-pg1-x541.google.com with SMTP id j34so1181062pgi.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 21:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rdk6qUroklOezfjw+3dsA2Gu4Mz4XSO7jbxK/CWDMqk=;
 b=JLdEHyMNpt93ohv4NKJl4ziWIkVTXyKDXL23hqJYtMGUwYVaCFrN0D+e4FEGsUwX6w
 Q6ieMcouBJy1YjgP3onPlT8k7nXF4bBWteYTZIy1rNDVeU9n5w63TXKmbdT+vaH5xEfe
 8h/7gF0OUTKShx6D8uy6czh+MWyjk/uq2bkYoJZToXb8+w64AYVEsmx9+Cx4HBP4+FqI
 G/qsuKVYv6ma70aopXEJDY9VLsGF8ErWVyshKumui1bHfHsHjDVKNSSUevajiUUv12K9
 G16hBntoZRqrzfUSck1ceDayhfa6dUs3bilNqzPIQ5iyTNwbfmz1Prd0wFf0Da+BjAbt
 ub9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rdk6qUroklOezfjw+3dsA2Gu4Mz4XSO7jbxK/CWDMqk=;
 b=XBwv4J/Q7jBqAAODf4q0BC15An5aLl6/fZYiGNLAJqvpt6Boy5Y1nGq7WgBCtS+Ezj
 Xj9UcgNjcI/lURts00x3PWBuObHFw597kvKEARZ/JddJEsbOeg27jpvnOz58vqjDRTvP
 8JsIZgaC7REvvVvB0Q83A1ROqRsn3GA9cGbFMXu+dKIXN8U3gDyu5oz20aNAMvV1Q/Tm
 vQZFjk9d/IDhmRlD4hECoMueJyox17SJMOR0j4zC+Z1BlxYncP+dHQtCAQWIi0FmCFlR
 59H8LxyeWaHJEyRNh5NKhXgDtixptXwnbHmNJ1QqrFfT1NHHCzBnV2q0JfUgcEkqRfVP
 HG2Q==
X-Gm-Message-State: AOAM533ns4/VlZcOO6C0yNO/ztF2/jBl4shhyzUQHSQes/PdNbBloj+f
 jgeeS5Y/7ggzJoPeggmPVdahVQ==
X-Google-Smtp-Source: ABdhPJy+mcRn9gBxX26OAJWUpRkuRfLoO0RKY/cwXfFGpspac8HvpMtXj5XV/6ZXVEST2GvI7VaEVA==
X-Received: by 2002:a63:cd49:: with SMTP id a9mr1595915pgj.277.1599627567758; 
 Tue, 08 Sep 2020 21:59:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gb19sm705987pjb.38.2020.09.08.21.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 21:59:27 -0700 (PDT)
Date: Tue, 08 Sep 2020 21:59:27 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 21:44:39 PDT (-0700)
Subject: Re: [PATCH 7/8] riscv: implement __get_kernel_nofault and
 __put_user_nofault
In-Reply-To: <20200907055825.1917151-8-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-c08d96cd-2db3-413b-8e5c-cc159e12b507@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_005929_836428_3FF5CEFA 
X-CRM114-Status: GOOD (  18.41  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 22:58:24 PDT (-0700), Christoph Hellwig wrote:
> Implement the non-faulting kernel access helpers directly instead of
> abusing the uaccess routines under set_fs(KERNEL_DS).
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/uaccess.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index b67d1c616ec348..264e52fb62b143 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -486,6 +486,26 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>  	__ret;							\
>  })
>
> +#define HAVE_GET_KERNEL_NOFAULT
> +
> +#define __get_kernel_nofault(dst, src, type, err_label)			\
> +do {									\
> +	long __kr_err;							\
> +									\
> +	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> +	if (unlikely(__kr_err))						\
> +		goto err_label;						\
> +} while (0)
> +
> +#define __put_kernel_nofault(dst, src, type, err_label)			\
> +do {									\
> +	long __kr_err;							\
> +									\
> +	__put_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> +	if (unlikely(__kr_err))						\
> +		goto err_label;						\
> +} while (0)
> +
>  #else /* CONFIG_MMU */
>  #include <asm-generic/uaccess.h>
>  #endif /* CONFIG_MMU */

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
