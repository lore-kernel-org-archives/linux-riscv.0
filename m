Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FE9C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 02:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jWWck06hTx+vSFvhZWLaky4Hlxw9OxUx094cL8SISh4=; b=r26HFO5E25aswVSn4CGpXCBghb
	yhZgzjtk59Td+DeBeggMYsS2UlWey5OxVj8G549I7nZ+uAx2OCmgcUu0X95PQ7uKlvkkYBVDXGQAK
	GZztcu69D+axC0aPcA3seuyYfsZlr8OOYnE9+tLCAeu8NOd9IJm5mDKN4wrkHwSHhM9r+HB/0kQdX
	IY3brYOZ4J0vfbCvOYooqzpkDCpQooHaRZb/+HIj1B129OVN1KySHm8soSAwgp7fxBTXVJ73LNVqf
	JcSx9xFMa8mHPWmnvJJovgvOOHBCn0oTtC7wIdzh7EcQVbBV8OLOyrQ9iyZOZ92wAaQsoEK/9BwLt
	QlVs0SMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjv-00GzX8-6h; Thu, 06 Oct 2022 02:35:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjr-00GzW5-9e
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 02:35:56 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 129so651395pgc.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 19:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzYCuMJ6p+Lody3rGbmn8WF2xPwU8C86ya7mCiVZOHo=;
        b=oIjVV9ZHj4GGDi8SFJItsfKMgtjpJSgxw60X0FYAdYvf7jqkgI65Z98amBNxp8soae
         K+5ZTBEq13ODrr6UTPo6jX6Owim8nKWDAhJyBhOxBN5XfAnb3BwC1YXyYdsCM5e8PkeP
         gu3viXESvkKNYbbFdtZk4app3Ffm/3r/u8KmK79sBWK1eEMPBYvuTgKEq2REicgQcNsI
         fvqr4FDFi/KnC3eGZIxIfNK6Eq0MRsev4Yue8r4q/rUXA9JWRKEsfLRs/lG8LJJ+l0bk
         OA0KS2W3PUPVyidsbIJfayH1mL02jGMIg40xYE03N9GwITGdxyLBrJGmB4nijz07RIf6
         /bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzYCuMJ6p+Lody3rGbmn8WF2xPwU8C86ya7mCiVZOHo=;
        b=hlIDt7TEL6boRQbU+O6jER0dnnwOiiUEx03nQLviJrt7EDURP9uTdN5GEN1o2OOcEu
         /yZXsi3U/8mYAIdMApyZCWTipkrY73v8KsT1+5re+u0pwxBqxBleugmx8ko9XWcTVooh
         hQuDi6LPg9tQO11wI3MRD3SRXamxyHURp6+iVF5L9ZD7Jt5mLt/lzGNPTCOW70VdAtGr
         wiE8pbG8CQkoo9n5Nthyd4iN9+B0QXDxmWB1Gu6OHDbqE7iiCVmKJ/w6wE3uFVFDZ22c
         nMVnr0voM2gPO//yKvVsLvT+OyqB2LYUYWll2+/7kGpsGEXjCfVGPvVbMbZFXsAc0gaj
         WnVg==
X-Gm-Message-State: ACrzQf1Q02RBXehm5MqRNWqfgfygv1KMdDZJrI5FOwG8s4FrIKgZP8pj
	958rQMh1gSDa3/pRALGt399szA==
X-Google-Smtp-Source: AMsMyM5lKJe5/EDcakfW1cb65IZbvyiGCALsJ4uURnN8IQRDtOZwNGHl5ZhIhZsy+D4e62Rn7ocvVw==
X-Received: by 2002:a05:6a00:124e:b0:561:7fa0:7307 with SMTP id u14-20020a056a00124e00b005617fa07307mr2746316pfi.5.1665023754319;
        Wed, 05 Oct 2022 19:35:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f80-20020a623853000000b00562362dbbc1sm1939327pfa.157.2022.10.05.19.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:35:53 -0700 (PDT)
Date: Wed, 05 Oct 2022 19:35:53 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Oct 2022 18:09:45 PDT (-0700)
Subject: Re: [PATCH] riscv: enable THP_SWAP for RV64
In-Reply-To: <20220821170559.840-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-a75e502f-0324-44ae-92c5-e93864fbf1cc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_193555_353575_48E92C2B 
X-CRM114-Status: GOOD (  16.35  )
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

On Sun, 21 Aug 2022 10:05:59 PDT (-0700), jszhang@kernel.org wrote:
> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> memory optimizations such as swap on zram are helpful. As is seen
> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> swapped out"), THP_SWAP can improve the swap throughput significantly.
>
> Enable THP_SWAP for RV64, testing the micro-benchmark which is
> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> shows below numbers on the Lichee RV dock board:
>
> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
>
> Improved by 382%!
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..19088c750c7f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -45,6 +45,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_WANTS_THP_SWAP if TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
>  	select CLONE_BACKWARDS

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
