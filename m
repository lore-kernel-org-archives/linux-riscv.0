Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC33C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D7D60EFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26D7D60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIOUli6YMPPWpbr6u3xYBjIJTTfVNa7k/PSXiEz1yOk=; b=BodtxKdvH/TffX
	FtRLKuuZGRTk5g1/eiZXTAJa6uo74uMlv+r5LTXDOpGdjUBcsQ0GvFMCwwZHoIVTpUvutlQ20Hp4L
	OS9nSPUrTJnkkV33nDmHla8SUtFDohEsY1fWQQIFfmAX/j2yxU/Ujo2ayLqIMH1MsKt934c3rO9JP
	vWgy8ICs4OrRYNdx2AFGyJ5T3aY+NHOInHz84YYZ0s+RFpld7AyohjfUJtq1w74qArQQyVwFZADo1
	EF5QVfey5LdbWp5czUQoNkpM26RLyqE2nJ2QHEvaWTCzYP3J56lu7x1zW2DmFvhna0J5C0aPIl3v1
	n8OCkZoo7yXeNcvpmnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNt8i-006Bwl-P4; Wed, 08 Sep 2021 08:41:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNt8g-006Bw1-8J
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 08:41:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so739719wmh.1
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=swzOBGGEeSOLbaV3bgBNypely5RCn/ltgg/Tjjz+7q4=;
 b=RoGmcJAUTIEbU7PRqkzJQfLbMY+zBD6eEYpzCVBJwNnDtKxdjXUH1yTFLRIc6YBLL1
 I/+JlJatTvpvAO1KUUXRevSZkberTqwho8gU0dlRc1xUh6SU6yhrCLYahK2/uKL9FwTB
 1qYpXisaIbevKBJ/6yITQKJN/yR/qiBeONOLCFyZ35N4H0LB21xKNjhWxkKE6bQlrjEW
 DIANhZn3wJUlfYGc5pAhfnCZmH0K2IaKcvof0xS1loqBzR4Ue4PAaN3px4nj0jqHAUbC
 xdm2bU++zK+2L9V/gMqDPlQAyKcQQhUSNcPK0vCUnxQyPvVeIS/0unnaG6HwyfYDfW9G
 Lq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=swzOBGGEeSOLbaV3bgBNypely5RCn/ltgg/Tjjz+7q4=;
 b=aV1YsSb8sFqJTBKw9BRZCAqyXfASMUAzP+BLfWiyS4HXb4Mt5Y1Vab2I7KN3NFz1XH
 Y9Hf+XyMPBXecjdwDQNBvWtJG2gcwPQYXbXTJHcGT5Zys1VDalojN6SXMSfyVAuQ/Jk6
 zQCC4mK6XSF0XnEDMQ8YuO0EOG+RMcb1jTOjvn4+H8mqZqZxpJqMNZgIhW3Zkte+6tgM
 BZy2I+/+Yvn54L1HDwWMmyKPF90MDIGCB/ZLaI1stKpp9bkFfQ8eNnJ4e5q9Tlzl984t
 QwBL9c3d7EVP7MhDwezCHrD3XTmHPiLTA+oOKjm6nXEJRtbHaC5c33uayImkHKOC79Pa
 bGnA==
X-Gm-Message-State: AOAM5309dsKJr2ogQXyZThuKCoVDgSyyW7Zw/1Tfw2nKJiCaX64D8m0w
 9+Je9E+ugd82DcsbzSEpwKStfe4jEE8G9sA/h7P1iw==
X-Google-Smtp-Source: ABdhPJy1oTHHq9WreaGjJg+1ajsF9aD03TpgwbXXY1CEyaJiEna6NBZwcIPCYOtnw+tRmnR7qekrF4d9uVin+sUJW1M=
X-Received: by 2002:a1c:2705:: with SMTP id n5mr2332855wmn.176.1631090458879; 
 Wed, 08 Sep 2021 01:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210907235315.567614-1-vgupta@kernel.org>
In-Reply-To: <20210907235315.567614-1-vgupta@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Sep 2021 14:10:47 +0530
Message-ID: <CAAhSdy3SRFkPmJu_2wQ+g9wi1i313np75719SXA1yNSbG2jupw@mail.gmail.com>
Subject: Re: [PATCH] riscv: config: enable default defconfig to boot Hifive
 Unmatched
To: Vineet Gupta <vgupta@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_014102_338465_C34EF2A2 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+Heinrich

On Wed, Sep 8, 2021 at 5:23 AM Vineet Gupta <vgupta@kernel.org> wrote:
>
> We need just a few options related to NLS when mouting boot partition
> for Unmatched to boot off of mainline kernels.
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>

This is exactly same as what Heinrich posted a month back.
https://www.spinics.net/lists/kernel/msg4041633.html

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 1f2be234b11c..fc9a4e0a9500 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -108,6 +108,8 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_9P_FS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
