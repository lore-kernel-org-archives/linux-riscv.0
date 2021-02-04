Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BC9C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:50:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5159B64FA4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5159B64FA4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/jbBAd72DoD/m9fs4xysp9Txf4h6LHL1yAxGLO4QWs8=; b=qE2cUWP6FHissfcVysquRx+Ua
	DM5UO8pcGWum63/FmBKMxhqMOtpXaDtWIkGBZl9TposkrbUoTy7I3qLenTq9c0fPDRKszDNCxSWQy
	yMWY0cN6LZMpshMsQsON8ELJJD34MCH4/7SrT8NBdbUWIPEbkHY7Wbr6bLV0bmzEyz4Ojl7eB+js6
	IfmG/wkPm55YPARKGXFTQ+wWoOzpxe1N8cUm7m9AEr3vjXGMp8cvTQNJO8TCqrDdftCYYn+jYve5H
	4/qZxDLEfuLkRKLSReWyCTnChNQxCbeA+TdG+U6Dm23d+Sfys5qgx9673ixaEZXuU+i7H6M1JOjKy
	kzQSWj7+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7oNt-00062o-Mu; Thu, 04 Feb 2021 23:50:01 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7oNq-00061l-OZ
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 23:49:59 +0000
Received: by mail-ot1-f42.google.com with SMTP id 63so5259807oty.0
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 15:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PMsptqYIqD5iZXmtta7YGCdRe1Xas5h7vrld4B82Kks=;
 b=ZfAsnQJCpOAaHdA7DuWOBYTdVvFcoJkWb6uzTed2fSz+BNDStmfEIYvqCBnnLNIocs
 BSf6K/0BRaw70zigkXvLMcvq+Q2jZ71aI6GDuiiaLRj3o1Xrbznd+ckrHIuYX1eySIgB
 P6rgQZLeAVQ5zJ3tR0rU5GnNtoJl8q9pslauYVWx8xJkKMvzOyb4euReo+6IEN4aySyN
 xextlPJerDWVbvE8+iv8xj2C3HSNpp1Gpu2LGsvCxeTJa+C645k4Oidv+GxAhaX2Oudm
 rwLv36K/E3ZWR4SE3jFJgpaAkHL0Pjlf8/wVdNxcdvuO6ir7zvbWO4L8ESOPU9oeJzus
 oHrA==
X-Gm-Message-State: AOAM530kE8nf+Sf9On/da3kIGsmsys9EfYctoOSNVJPr4pIgIlPU1S7/
 q6EI+5emeZZ4WCjwVnQqEY5lBLHcxA==
X-Google-Smtp-Source: ABdhPJyajLW+rMPwvk3zjI4HFUVp3XRUk0Cu/VdUT6woMy1fVYcj80m9+vKRhqB3S7n5fMiBfngW8A==
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr1378466otg.92.1612482598270; 
 Thu, 04 Feb 2021 15:49:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w10sm1458169oih.8.2021.02.04.15.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 15:49:57 -0800 (PST)
Received: (nullmailer pid 1354613 invoked by uid 1000);
 Thu, 04 Feb 2021 23:49:56 -0000
Date: Thu, 4 Feb 2021 17:49:56 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v15 08/16] dt-bindings: add resets property to dw-apb-timer
Message-ID: <20210204234956.GA1354573@robh.at.kernel.org>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203125913.390949-9-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_184958_832208_8F2EEFB0 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 21:59:05 +0900, Damien Le Moal wrote:
> The Synopsis DesignWare APB timer driver
> (drivers/clocksource/dw_apb_timer_of.c) indirectly uses the resets
> property of its node as it executes the function of_reset_control_get().
> Make sure that this property is documented in
> timer/snps,dw-apb-timer.yaml to avoid make dtbs_check warnings.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
