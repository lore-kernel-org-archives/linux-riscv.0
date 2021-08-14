Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275B3C432BE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF12860ED5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF12860ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/x2+g6xjK0Xq3OOenErTW8SJjZBurkRdrRDas84cDww=; b=N+R25kxDXXWbwo2bYT0QEB4JYK
	UAffrQyEtVMK5EwWYcu+W4l1K0xFnEI0uorgFCE4fICW3U2BSepeGy18/Ko5m2lwRIHM9gJ10pxp8
	pE6152cUNN6QFmJthL6ZXd82FKcpczSt4q59UKRkrtzFSoRNncN9zUFnRVFS4bcrW4sF50r2zLY2Z
	85i7SEZQ3nf9bQGbe4sq5mi/GBJ8mJjx5dHQjbkGwOleL/PHckUHpIdk3SCNEsQXh1fm0Q8tmUaSL
	ylxga+hd2vbG3xLE3taQdUI3dSHzfjm9HVrNssFps/KmH5t/GQyXakC1iAbsSC0dzskDSlEZQUuwq
	zvResqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mElmi-00DqrP-U7; Sat, 14 Aug 2021 05:00:40 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mElmQ-00Dqpe-4D
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 05:00:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so3361339pjz.0
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 22:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PMObwOlvSNSaU90kBCrPAwCHgfnYE5sYfv2IhA/+RWs=;
 b=kIySnCyqtQ09NVjmlCQzxIopejzYXGJbDXct1X71S2dyztjBuBNsTFb3YU6tZ6azPR
 5DXoNmqVGbS652x1gpH/f8/biDBpGV38TG7bIKHvJM3FYCca62qbcnkUbhJ3p5kFtu+U
 urf5EiPvpmgdfAaItCUnZy8sBi1v5BVeik1sh6N7FwOFJePzhBOHODwS1FllnuXLq16h
 zwlRX/7zqXCM/LzjUZ0c5iEel0d3/dV2WtfUkZX0tHxk87Ndr2CT9z+DQ5+gnCLHlQoE
 YI6nTsiBJDzIl8Wcd01iDrvMFnE2HawwLPzgiwO2KWff+H1Ox86BthbCLTrFWQcGwZlD
 fKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PMObwOlvSNSaU90kBCrPAwCHgfnYE5sYfv2IhA/+RWs=;
 b=Elc+O3gsc9d1QaBKEqgvBlysolRQkZ4DuKWwWD+KRweCWKsv6jnyKDlymtBeE4EKuy
 0qefcs2h8kE2dDeEELjAaEu2swMzI0kUIaa2iXFowyETeXu3wqzJkxjvYZdqe9sbQSRH
 r/fFXIn5CTiDb0noueV8jCKKvI2DHeQoIFFGyamNl4EYwqsUChAvnoFwIW6UzJ8ZoTa8
 M+ooMIz6ABn2Fq0NY2/OJjuFeThRRPYYUhXjVvQgA9Dlh4Kh6dPC1RUUv2dCjXQB7ycb
 RvdGUtrA2HSS7tUTs7Dlv0XQqwpzIsLpWVWxJqzNPb+1vtBjr/XYoIjGyycvFgw8ozAV
 swAA==
X-Gm-Message-State: AOAM5308rl5GOUOhdBfVEMDuZTUdNi9j2q19IxsjTonHLAOLCb1ifVdp
 XToRtcOAbIrzeuiJXb4xntf5kQ==
X-Google-Smtp-Source: ABdhPJwyAA2J67ZBfoCBKh9dBfOoNC9vxHF65tPWQ38IEbKdxSQIFmpHor+Qado93tqoMKYkSJNVWA==
X-Received: by 2002:a65:6653:: with SMTP id z19mr5349188pgv.394.1628917221360; 
 Fri, 13 Aug 2021 22:00:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j25sm4023098pfe.198.2021.08.13.22.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 22:00:20 -0700 (PDT)
Date: Fri, 13 Aug 2021 22:00:20 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Aug 2021 21:53:20 PDT (-0700)
Subject: Re: [PATCH] riscv: move the (z)install rules to arch/riscv/Makefile
In-Reply-To: <20210729142147.445593-1-masahiroy@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, masahiroy@kernel.org,
 wangkefeng.wang@huawei.com, tklauser@distanz.ch, 
 vitaly.wool@konsulko.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-fe558e10-6cee-4e55-b975-8c525c2bcb02@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_220022_210310_A404127D 
X-CRM114-Status: GOOD (  17.66  )
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

On Thu, 29 Jul 2021 07:21:47 PDT (-0700), masahiroy@kernel.org wrote:
> Currently, the (z)install targets in arch/riscv/Makefile descend into
> arch/riscv/boot/Makefile to invoke the shell script, but there is no
> good reason to do so.
>
> arch/riscv/Makefile can run the shell script directly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/Makefile      | 7 +++++--
>  arch/riscv/boot/Makefile | 8 --------
>  2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..3c437fb09a07 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -126,8 +126,11 @@ $(BOOT_TARGETS): vmlinux
>  Image.%: Image
>  	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>
> -zinstall install:
> -	$(Q)$(MAKE) $(build)=$(boot) $@
> +install: install-image = Image
> +zinstall: install-image = Image.gz
> +install zinstall:
> +	$(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
> +	$(boot)/$(install-image) System.map "$(INSTALL_PATH)"
>
>  archclean:
>  	$(Q)$(MAKE) $(clean)=$(boot)
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index 6bf299f70c27..becd0621071c 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -58,11 +58,3 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
>
>  $(obj)/loader.bin: $(obj)/loader FORCE
>  	$(call if_changed,objcopy)
> -
> -install:
> -	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> -	$(obj)/Image System.map "$(INSTALL_PATH)"
> -
> -zinstall:
> -	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> -	$(obj)/Image.gz System.map "$(INSTALL_PATH)"

Admittidly I don't see a reason to do it this way either, but it looks 
like the other common ports (I checked arm64 and x86) are doing things 
this way.  I don't really care that much about which way we do it, but 
it'd be better to keep everyone aligned.

Are you converting the other ports over as well?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
