Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FF3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VOW+wZoQTzR+PTxkOG2ohCnA1ysIrkhPAVeGHvpg6ko=; b=YHrPWelcxDFRjOevN9Z51RN7Az
	McN6a8Bo3bIqF0H9qyozaXUPmSKn9mxjwJgHG3sKvnchJUuD4Q6WcXMc5lScgJaafLS9Ybxx71Ohy
	01QT7N7Cd8vHNvS0WG7kXNUJaDGyxAwejgXC4sVwMnEM6NDdz20zuuWeJfEO38tLoAqaLH8Qm7Sqz
	ZwRe13NRXmje8dIeNzsr7MkkpFSSvc2dRPqNDZkXimaKN2jRNXJyLjE4bZyHVN9oztPULI47Xlhe4
	KhFlYoMn9rSKyr9ssHk1R9SJB/nfLR9lLFQtENIxrA4E8WEtXNbUg6J88NroC0q+3Ydu0/V41tk/M
	vQeefcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ipZ-00AfAR-9X; Fri, 09 Dec 2022 19:14:45 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ipV-00Af7P-5k
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:14:43 +0000
Received: by mail-pj1-x102f.google.com with SMTP id fy4so5462510pjb.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UB0YOGyychK/2QqsDbt3+Ytc2kYn0bzS2eLbN1tkGw=;
        b=k9OnBKq1FrKRkzxdBmOluPdfXgUk+ZttA1oRPSB0k7hL/PgYajzWyOCKC3omah3Hpz
         wsPxlKZhgtVvn0Mxg4lLheqOQHILrvkbyToqsRtttAQzMDQIpYQs8G4XqXE6hKf+l7Dj
         0MBwTjeK5FPHjDp7HX3wszEuJ9fRCCoQ9Pi8EZ6NZEjpMCVh681h2jPwTPdzS5By61Hq
         bOxhGMf4F1eNvvfv9zzWbzv9xjqLhxmirSjqOiOBbxPr47QV+X0rA38OF1+wntPtLRd+
         ISyXkgxMufrh60ATQzHo+7zflriYtrs+vUf/oGb9BuaCQtYQJ05nVdHF5FQUFi4pjlaX
         1nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UB0YOGyychK/2QqsDbt3+Ytc2kYn0bzS2eLbN1tkGw=;
        b=BiyC3nzlb+8PFQ3GpDal81TwHHcJWihBpaKDwEKdvNek9FAJbE2RJVyPFcqNiQGyti
         sKCDwo2dv9nyHLe97G+jTeZtCj4dQntAQrDQ2YFTKxORx86PpY4ormYqzWDf/qgG+rPN
         PwFMyTcHJABpZaqF4C5p0zwLf0DkLFMe3BGhk925s9mdX4eCeFkOeStKuEFJSmo6NqJx
         XbpCVTQQE49U2J/6h14ng39X6oLXb4TiGOoF4SOYBA4+npayIrnUJWV5ilcLPnBDatdv
         IVX/3FvuC+3gCijBB6i9W9JJ9g+fsbJ7+ZjrXjIDfu9ijqOAmf5pU49vLBRy3TJOEQeA
         R2Kw==
X-Gm-Message-State: ANoB5pncXMiM+LTjD/8za527svY1KMt9ZXDuJlpKYhobySLSUFT71eVc
	M9KPmuQ5otj91SqLuTuxdlzNBw==
X-Google-Smtp-Source: AA0mqf79ax/sypRX+Pt/dn9MwObJdpQ/HTx0JxroKJSRPDqpuaoKM3EM2YzwhZiK6awwCfm0O2FR3A==
X-Received: by 2002:a17:902:a70e:b0:185:4421:7300 with SMTP id w14-20020a170902a70e00b0018544217300mr6830199plq.69.1670613279485;
        Fri, 09 Dec 2022 11:14:39 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b001871acf245csm1681062plg.37.2022.12.09.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 11:14:39 -0800 (PST)
Date: Fri, 09 Dec 2022 11:14:39 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 11:04:46 PST (-0800)
Subject: Re: [PATCH v3 1/2] soc: microchip: mpfs: handle failed system service requests
In-Reply-To: <20221123175652.327859-2-conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, jassisinghbrar@gmail.com,
  daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-fc50aea2-a2ff-4d2e-a906-0892ee40ca2f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_111441_245130_35E720E3 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, 23 Nov 2022 09:56:51 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> If a service request fails, a non-zero, per-service error code will be
> set. Since the individual service drivers may wish to handle things
> differently, there's little point trying to do anything intelligent in
> the system controller driver. Let the caller know that things went wrong
> & leave the details of handling the error to it.
>
> Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
> index 6e20207b5756..539fc24b397d 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -52,6 +52,12 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
>
>  	mutex_unlock(&transaction_lock);
>
> +	if (ret)
> +		return ret;
> +
> +	if (msg->response->resp_status)
> +		ret = -EIO;
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(mpfs_blocking_transaction);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
