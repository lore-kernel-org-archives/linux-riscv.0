Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33EBC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6966661A54
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6966661A54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3BHiw+3ubLlpb2HhOrkJlo6DmoUSSV8f4iWVqX67zc4=; b=Zklx3il4TvZ6SO9CCKBX9PdNZq
	3aeK37yPoph8xCm0cJkZkEX5RbydnhAqpIjgqd24wtpFon+jkyVojDTiSbrEVwOB0Sm9hLi2Y/Tq+
	Bkz43oJnu/h/H8aXnbz8zfAyiTNTP5Htx1P/x2OTQcBDoUV1SEPAXCiuWll6k/tqyqoySmXqKnnX7
	vJZehDn2pMXFeLLLXbIOZu4bgJRSlTh92VAX3eoSvTvPB9HyZMuzvzTaVQIlxfryZHsT37q/j47qq
	D361oKMhdL0Qz1SV7m/5wftcHOIBmzFNRDyTTp8uMI9FMb9xj0E4XNMvct/ntSwu9K6Ui8FzFKeC0
	jqcRoVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX50G-0048fe-60; Sun, 03 Oct 2021 17:10:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX50D-0048eE-0h
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 17:10:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id y1so9539442plk.10
 for <linux-riscv@lists.infradead.org>; Sun, 03 Oct 2021 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OJdswbT3ZqjLgBifGpj0LGkCKXP0UYWP5Cht8DvndvQ=;
 b=VVxXvV3ro+D5TyClKdhgFlN8qhdxf04ShtskLFYnbArL8EaNvFkXJd2SkKiuK6cryV
 9XNy0FGOJUXgI4KEkuFgfrHcog6RknEwKcujCt59wNmwAtUgQcBxKPBI3AA+3VDkJKLO
 Hg9JRooWIRRY6J14uiD28mAaBMIaThQCek/BvWZGrJsqEkrQoD9v9v/V3sL8biu74MKd
 16egOo1IsMJiBvScovr/eSnXbaUFGl++9eW81Y9HRVcqE7b7bU9s1S/WUbRsGAFzGUi+
 1tZ3PUuQLJUGGjpGM37StetsEw1WlJuSNcqiTRRcVAaA7vLEVeU5be49vo8ZF2fWlTkF
 bKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OJdswbT3ZqjLgBifGpj0LGkCKXP0UYWP5Cht8DvndvQ=;
 b=WBdudtyEXOXC5OVAsoBjQB4nvVaUt5FypfJ+HAI9HXIj6StgaiVLv0Xl1IB6hpGuKk
 INV1sZ6XBRV+0mloMUwky00PIpMkWPDVQt0jqa3Bvw3y/XgQwXnLAjYmDnBTfFeWcIO0
 FuSRoDRDmCOc4ujLLpfq8acgTpbVu5CwwmY4mOMaGGi37rQVfqXDjbOri+axja0v9hWW
 JLkRbOJRQSDwfxePan6VALm8UHBUwnZyIdGfC1CjMTpEdNf0uqvPzgjsYtrLXScdAKCa
 es1isX/6VWp/IRbe+tBkVgHA7E7FZCPzjAXC0ow+tfu2ducgPRDVGivVDjgpYSzTwbFC
 vWTw==
X-Gm-Message-State: AOAM533Ko5ZJ4Z8CgjE2BwKmaVL9yNk+Xh94DqH2/dQkCbtaozGj+Zjv
 6ovYv7/h+BLZkvmjZNNt1sv7UQ==
X-Google-Smtp-Source: ABdhPJzSbGehakM8MZhnYxpRFdvHcXi0hnC5QqYw2v0jmiYMRhVoU5wwJX68eqbE8FY69EH9lBZ1Rg==
X-Received: by 2002:a17:902:6804:b0:13e:38d2:cdd8 with SMTP id
 h4-20020a170902680400b0013e38d2cdd8mr20739983plk.54.1633281008691; 
 Sun, 03 Oct 2021 10:10:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id mv9sm1969552pjb.10.2021.10.03.10.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:10:07 -0700 (PDT)
Date: Sun, 03 Oct 2021 10:10:07 -0700 (PDT)
X-Google-Original-Date: Sun, 03 Oct 2021 10:06:47 PDT (-0700)
Subject: Re: [PATCH] riscv: config: enable default defconfig to boot Hifive
 Unmatched
In-Reply-To: <20210907235315.567614-1-vgupta@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 bin.meng@windriver.com, 
 sagar.kadam@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vgupta@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vgupta@kernel.org
Message-ID: <mhng-8685d7c9-0e74-42dd-9ce9-8b369e1c41c4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_101017_081718_805E5EC1 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue, 07 Sep 2021 16:53:15 PDT (-0700), vgupta@kernel.org wrote:
> We need just a few options related to NLS when mouting boot partition
> for Unmatched to boot off of mainline kernels.
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
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

Thanks, but it looks like someone else already sent these same config 
enables.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
