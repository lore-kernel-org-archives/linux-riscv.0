Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2D5C47081
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:04:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2055610A6
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2055610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5H3CUt2KYEYUs1SRH+M5bE4CNRCCGBQaC9ZPwjIydAk=; b=HTDU7v58ToXEXshR+Wb7UPbSuX
	QLDgC47tVR6TtqwIRM6bHZi5jh6moqGYA2tJgcTujgKQwoD5gz3cl8Rp+p2QNuc34o1v4hDg8GDF4
	Nxx0GYYYRgIiN5RHMl3jyiZrKvmlZWWWxgMmFt6ai8YyPc+LII0YLrMQnT5XQz56IpnyJtpJceG+4
	wDoIEhNAua0mYbTeSp5SsnkIHWk0wek6iNRJ+n/l4ABMlwbFq/Fq+hOWESZ1hIDE5wnL2S9YE+HM7
	bTxzhiuLMp1pvY098oqRseAhOdhZHaQAtKde9RT3oxwqpdBjWJWto9Ge/GI44HCmtr3Z4gPxpNk+G
	51C9Zz4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkdTU-003W0V-JV; Sun, 23 May 2021 02:04:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkdTR-003W05-P9
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 02:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=IX7NCKYJpXERCuX8elgjfnx5ipULGLuFcd5z/JFrTFQ=; b=pe02903sumv17A+JzWuuE00plP
 vKW6i/i5QLcOws51jPIKEKtpsB9/hpCymU3wHe2eZmuqbNFjNAvSMTuRXmpdNf2A8XJZDYrsV/ccP
 OJe1+U7d2Y1RJdGCBG+j3u5Y3SHFWgIPwA25SQ/IyeVRtk6BOd5t+JFi2lL48E4tRCpaVclmBBfYR
 MIT/ommTjx8MbwSjAP/XnqW1t9VUmVnebnGbUh/cmWEJ0Mhope1ZtxuUvwdpzWSZlqeiP9EO8tHZj
 LDOC7tBdxanUYHaRtAkQHn/irg4uTdnJsdu2LzCcMzd4wyFOs20L/Uqje+7QuVuc8fo/FVMsFipOh
 pxhrDe7Q==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkdTP-000HDn-6p
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 02:04:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so9193250pjb.2
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 19:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IX7NCKYJpXERCuX8elgjfnx5ipULGLuFcd5z/JFrTFQ=;
 b=AYmAJME8aIDq+SqKs07Ajillkmf0Gm+Q/o1iOq2K7VJoZU7O9vwvPyEyqW0Pml85/w
 CR2Dtu1E2czeGZp1UepSzDZusZQxYb1Aoi9KQ6pSaoKB59Y2MTZ2rMR5y9P+X495MBEi
 3k5scjCL2NYfVjFFHdqoRxB1Zc49IfQrwsfLxz3pkGBf9PQ/aIqAOv3aheU5qdTzMSrO
 idGbN7Kczbfp9nC8mYTn+KaKXVoUsV969lrrqYVoJERRBwRTUIG+wKRDlwFS/TOsiyeA
 NVyU7ZFztpT/izJfa9fqn1pO/+CLLYRhd8sHGG0ANWywfWgevoT1CeefwhMJIio02++i
 2IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IX7NCKYJpXERCuX8elgjfnx5ipULGLuFcd5z/JFrTFQ=;
 b=FZ5qN9WcmAcBtruLM9FbYq5UIu2tJYxMziezQhVyBZOEbfS3kDoZOlwXw+tGY0M3qW
 h9wAofpGvBp3fNlYtPxgaI0Zves7TiX1vIZPdfYErDfkHZgyJ1kU+vqa4GW2cr+T7DWg
 98ZliMIj9tCmRfLGKcfXwLxh58yQikx9KrJ34q+8/imQv27KRKUwnecSLoalg99SVRMa
 xAVAjB9F1J2d9aV0Mvaz8BjC4aJ7j13bmuQCRPeyzty4/VTha3Oh7jPAPOVRANYzlXLn
 2vkwoRg1Z373AZcJGLT9mFsTVfY+82Mou+QzRFKVA4gIT8YeYzfNsOh/3lxwRn9lWO70
 LlXw==
X-Gm-Message-State: AOAM531JS5m/wqPP6W+2D9x5UEeg6w7Bey1Ko9t+f7lGLFyUErEBNp0t
 wrzxnOv5ZHmcsV5Z26LVZW4hVLmVbTL3ig==
X-Google-Smtp-Source: ABdhPJw3MGX4WSpiPPEGwwRObRAbE+BZlNBo2oLitzxhSdsTDQE46I0jvn9u05gxg5mn8mJQBQvRGw==
X-Received: by 2002:a17:90a:a2b:: with SMTP id
 o40mr18365083pjo.214.1621735446451; 
 Sat, 22 May 2021 19:04:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x187sm2183432pfc.104.2021.05.22.19.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 19:04:05 -0700 (PDT)
Date: Sat, 22 May 2021 19:04:05 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 19:00:46 PDT (-0700)
Subject: Re: [PATCH] riscv: Select ARCH_USE_MEMTEST
In-Reply-To: <20210507094715.113411-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, anshuman.khandual@arm.com,
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-17c67721-064a-4119-bacb-098e3104d380@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_190411_360272_4D33A168 
X-CRM114-Status: GOOD (  13.51  )
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

On Fri, 07 May 2021 02:47:15 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> After commit dce44566192e "mm/memtest: add ARCH_USE_MEMTEST",
> must select ARCH_USE_MEMTESET if we want to enable CONFIG_MEMTEST.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a8ad8eb76120..c5914e70a0fd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,6 +34,7 @@ config RISCV
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_SUPPORTS_HUGETLBFS if MMU
> +	select ARCH_USE_MEMTEST
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
