Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8F3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:45:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BCB2071A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eb0WAyzA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Tfr4vWWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0BCB2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GRjxiHmugFDAmaQG/JUAzlRNmY5JoRyhVzNSxumw3rc=; b=Eb0WAyzAj+BejIFJ0m5TFgUXc
	hTa4o7nLCYyWJQrNtM9byzt14lDWzfALDCXEyYTAkW9K4WMIyb0m6ghpL7OLozsliG+IOJXwp5wI/
	poZb7vrMLbS0UIYaK9/+hFzDXi3telWVnwSv/87WPd5+Do76u8hzpJe5rnBriZI6rttwFx+2v9A9s
	0MUXgJx6HXdHi+NtQsT9m1Iwbxi+8Hr5k+4iKANfV+Si4df42hy2Me4MYKHRaF0LtfleROf6tBqkD
	0imIJY3hpm9QzQUiWD+TOutj1W04HrFU0J6eJlyzDSR1ki3aRvIyA4F1CUV4qcFn/f87Hbuf/DrkR
	/4oOorFFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawQn-0005pF-PE; Fri, 06 Nov 2020 07:45:09 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawQl-0005oj-6A
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:45:08 +0000
Received: by mail-pg1-x544.google.com with SMTP id h6so314336pgk.4
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=K54S4tmdbHgMW+MVK8p9l4H5bicSeAudRQfjdTGyLmc=;
 b=Tfr4vWWXNyo+W8LEk1g+3587ILfmUu3wbnu/yPBAXpP7i5mJoiIn6WZ6n89yu2Zc3F
 +QpGeeNJwUae2BH9aDxV7GfuIj2Mq3LkJuhyUh1gceU6Zc9s5N+gVJd+HA0qOqFqthr6
 Gn8N7u8dMKrFEUOzR/Z5OA0NUXkxFKEBHXrIsMffgTp/haZlZl9NBYbpzQk+E8GR7Z5/
 c0/xfYc69dXrfWOfxSHLpbnqf+bSUWmirnk6G3zGybE7JsrYKjIZeitxKwDXNUC+eBo/
 G1M3oWVtS3VWJZ0F8GNHYTZvJSY8JYAv+QDNAVeQYSD/SYTrN2w1ev25G+zjpg9HjxSk
 nrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=K54S4tmdbHgMW+MVK8p9l4H5bicSeAudRQfjdTGyLmc=;
 b=B6lhHhNWRjzo4Slnz4qRfS43ulDqYNQY5eTDpvh3zPSz3b3na+Sb0sVu6yTD86sUEW
 RLSAX4GOSE49zewmaBfTLiPpqQXR1gHu72iBsk5VQ5utTSVtnCSb43HnQ0yrKv0Yj99f
 mgeoFE83WRbmAvdER72ZaISh6vh5Xp5g0LRCv6fQokDdMVDsoy4fm5Heao71J2gEFIml
 LBqWx3Kh4Km1iQZJEuItVL8KudHCMa0V1LXgAxKkYSXoZjSEZrsaqoB1JoT2TZ7qhi1T
 +CWOO6feYndv9Nm2te51sjffLNvKD1dnk3PEt6jwPu/CGONDBtpERW4WGX/AGic+XHRa
 k+4Q==
X-Gm-Message-State: AOAM531z33sP9dy7Pj8ZQdfSh0XLNGrt2L92ASW8R8RANoCorajvMuPg
 6MHQ6xuJTS4z0jckRro/gBTKeA==
X-Google-Smtp-Source: ABdhPJynR1+zk4zYU4UhoL7YmxIbYRJ1mpvelbP8x/YimozLjQ+nfno7quluYOXj+rrg2uLvyysNFQ==
X-Received: by 2002:a17:90a:ca91:: with SMTP id
 y17mr1022137pjt.205.1604648704549; 
 Thu, 05 Nov 2020 23:45:04 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s17sm1088651pjr.56.2020.11.05.23.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:45:03 -0800 (PST)
Date: Thu, 05 Nov 2020 23:45:03 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 23:39:34 PST (-0800)
Subject: Re: [PATCH] riscv: uaccess: fix __put_kernel_nofault()
In-Reply-To: <20201102073052.199638-1-changbin.du@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: changbin.du@gmail.com
Message-ID: <mhng-21386a65-a083-4346-89a7-0b8ac583b9c4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_024507_309064_B1192345 
X-CRM114-Status: GOOD (  19.41  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
 changbin.du@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 01 Nov 2020 23:30:52 PST (-0800), changbin.du@gmail.com wrote:
> The copy_from_kernel_nofault() is broken on riscv because the 'dst' and
> 'src' are mistakenly reversed in __put_kernel_nofault() macro.
>
> copy_to_kernel_nofault:
> ...
> 0xffffffe0003159b8 <+30>:    sd      a4,0(a1) # a1 aka 'src'
>
> Fixes: d464118cdc ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index c47e6b35c551..824b2c9da75b 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -476,7 +476,7 @@ do {									\
>  do {									\
>  	long __kr_err;							\
>  									\
> -	__put_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> +	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
>  	if (unlikely(__kr_err))						\
>  		goto err_label;						\
>  } while (0)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
