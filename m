Return-Path: <SRS0=zhGB=7D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E3FC433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5827F2078B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M52iCxg6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PYZihS92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5827F2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RSyLfeB8dEV3z/y2+gsh4gqtdB6V3zK8f0AJi0FU88c=; b=M52iCxg60OcxvD
	RRkouaY4iCa42tSWHwpkQb2n5xNESb9YgScJ3Ztj8cFcmcaUdCo0816ZYpgYTNrPYo9iH5j46BmZ1
	z1fXK3dNFTFu3kRILcC5Lht7ADuUbGwrUv7PXoGSjI02kzWjV9G7/hFTUgKmEIRC5tJMmp8UWrgcl
	c25DtAF9YW4CeJ9jricNfHqhVHGm70mq4o30nkF78WVbQ/yp/4bkzeBX7aAyJNL07t2F1n6yEH11o
	NnRoURhMqUa5kr+1X6VmrHloJBlDEbtZre20z9jEdwwt9F6cucSZSoa8avNnUbpf9T3dRW5Z/wBtk
	q6HdUrB6DTPJyK3g6S/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbtKb-0007Sc-4V; Thu, 21 May 2020 22:06:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbtKX-0007Oq-OZ
 for linux-riscv@lists.infradead.org; Thu, 21 May 2020 22:06:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id t7so3539312plr.0
 for <linux-riscv@lists.infradead.org>; Thu, 21 May 2020 15:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RSyLfeB8dEV3z/y2+gsh4gqtdB6V3zK8f0AJi0FU88c=;
 b=PYZihS92UbncqYg8RENTRyepp1+gJxWWtrvM8AQ4PbNw4yze3AgQe3kX7lTgECAt2O
 E1PyrVTytLesvJO3C1CyhdX6TyW0fg768gYWdv0HKnY93uPWTs3QD1UA92Ie6M9aRg3j
 W2vXXHNROHn0lDjrRXVbOaIZ+M5cFMJV655YYjr/5j1OZi9ZC1+IxBrfIkxq7hiQX/YV
 Ns9NOX4cYCLH0CndzCPCuoS59MsoH3TRVF2GS0paDkj8ClPQGDTOG8kmOO/4KHJTv8lK
 Kg6aVwtUdzY/2X5yqoaNsHZ/t3EweovVsXmht1qQYqrU8OTV7TfqTm9i5xuDff7loECr
 +UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RSyLfeB8dEV3z/y2+gsh4gqtdB6V3zK8f0AJi0FU88c=;
 b=mWifF8r/xHJ5odp0ed6rZAYISBhp+X7xbWd3R3r7K5kCW7e5MKGahsgCUscZrEMD8f
 gPcmEanNCC2DPe6ZosyFugtZk5YE0SM1dL39KKB99qkypSmnHD9XcX7XJsWlwIBzXzIE
 zMB8Cfr8Mia844/7DyZlQMWwIfOg/duIMtep/F7a5BQFVGelLnwnaDR0HHJP1ZaSbvYC
 BkmTDoPb3TFxOJwJs/aOI9cZDXvWCu22q5B5wGwcBYIoIublQrt+5LdCKYG5JBOTK1/m
 DiSKdCBvzOKnEvAO+BYc0KFmuRfZ6SEk+mQhQq4rrzv10R9wS5FbySlSfgKgdgAAzhdh
 V6dg==
X-Gm-Message-State: AOAM530FKCIt1o1EbS4yImRudlz0s6Y6FARTD+bm4K6RQuqFbhMMWVpO
 8AD5gXVan7Rx0GqJu4Ka7g89aBAriTQs9w==
X-Google-Smtp-Source: ABdhPJzlvinwMq9zxQPR3NnO8SjsL0onlz8PyEjH3sglw8mhSJzduIZnAHkgAy/OgBR+Zv2cLgKc3A==
X-Received: by 2002:a17:90a:1c81:: with SMTP id
 t1mr595819pjt.177.1590098780793; 
 Thu, 21 May 2020 15:06:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id mu17sm5941296pjb.53.2020.05.21.15.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 15:06:18 -0700 (PDT)
Date: Thu, 21 May 2020 15:06:18 -0700 (PDT)
X-Google-Original-Date: Thu, 21 May 2020 15:00:02 PDT (-0700)
Subject: Re: [PATCH v2 3/3] irqchip/sifive-plic: Improve boot prints for
 multiple PLIC instances
In-Reply-To: <20200518091441.94843-4-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-552cff49-648e-42e9-850a-50d0855fc9f4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_150621_798982_796D6CB5 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: jason@lakedaemon.net, Marc Zyngier <maz@kernel.org>, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2020 02:14:41 PDT (-0700), Anup Patel wrote:
> We improve PLIC banner to help distinguish multiple PLIC instances
> in boot time prints.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 6c54abf5cc5e..d9c53f85a68e 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -380,8 +380,8 @@ static int __init plic_init(struct device_node *node,
>  		plic_cpuhp_setup_done = true;
>  	}
>
> -	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
> -		nr_irqs, nr_handlers, nr_contexts);
> +	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
> +		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
>  	set_handle_irq(plic_handle_irq);
>  	return 0;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

