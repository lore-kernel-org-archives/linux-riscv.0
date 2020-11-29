Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB83C3E8C5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 20:12:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2533720756
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 20:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xrORgvbL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfZegQuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2533720756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w2KQgeBWA0TUtqKtPGfwQXKcLVj867bVKR+S/NApSP8=; b=xrORgvbLd3wrfCZHu4NVWtz+i
	vNtkpVYq5gMlwUfXUqjn9GEfjOxA6T2wtco4MH4pwjz43F/9NQeJC0rl7pInKE6OvXERQ+VJRjgbW
	Z22xJ9acIXng87lJv164xgTU5zk1l09VNniFO9QdEIFD2qeb6WI1DycSsnEYRAiicX6POAGQq99BV
	T0D8nd+XuOk71dHaw+4CwYElPEu3/z+BFDHBPotz3EB53CbMxuex/b8boFQDOZUkgZUtD/AQBMNoU
	bCLKatm5D85yMOdxoT7T0Dg4WeX9CBigxv2MfXMQVkJOG/7TTz5SjIpymY1KY7MvtkOtndU+iIhah
	g0/kc0FYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjT34-0004wO-UK; Sun, 29 Nov 2020 20:11:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjT32-0004vy-GD
 for linux-riscv@lists.infradead.org; Sun, 29 Nov 2020 20:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606680710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zaOiU6gv3Cl3SmrnFPxyyv/QzuHHKMlBz/t6xjcea8E=;
 b=gfZegQuhWJxQfKYSv5+MNUUuRAHUw6pdb7RRtJtevkghn5Femo1Kt4Spcz8yjXnSlywxXJ
 Z59t3CExO1SKa0dxHcnRYtm41c3/smqAlP0hCBINYiIeFymth7Bltc/4D0SE7WOJm11IgQ
 UET92/18MDEtNZJfatt+rztZCQ+0dp0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-iF2qF0CPPR21iCN5a_T6gQ-1; Sun, 29 Nov 2020 15:11:47 -0500
X-MC-Unique: iF2qF0CPPR21iCN5a_T6gQ-1
Received: by mail-wm1-f72.google.com with SMTP id a130so5980206wmf.0
 for <linux-riscv@lists.infradead.org>; Sun, 29 Nov 2020 12:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zaOiU6gv3Cl3SmrnFPxyyv/QzuHHKMlBz/t6xjcea8E=;
 b=UR1XFiNJ8Z8ALg+B6Vrsr3fDT9llFm9L8jqsV4RSAi7SHn/XB2AzMPBV6OB7r4UIQC
 jRq8CeQ7Wzr6VaFOpcbG9oFl/uh0VleBq8k2cGAxjPqGfGc+F0bIOg4ffjNwgnSP+ZZU
 SeGUxRbDYhSqrvIItwsCsiM1rKmxFB8jMoam0iRX672zQuR6BFXtkV1BBNfafNLvvMhu
 QXrgG6DtBKcwAHLUpNv57k4wWAx4niEdDuS0+3M2fWO17nCLRS96RN3kG1VaPTmnOeaS
 vZQeIlowC1+CVjTk8iVQDmcYqaHCuT0B0Dik+54m7Qco9dp6HBPCUtKGvzc5PgHOwaeF
 RxNg==
X-Gm-Message-State: AOAM530vMrRFLzHUPqvaUWOtwRo4z85RDLmxyyobwgSYR5IcIh9P0FGi
 ITrM/cQGsSUijiHrGBHuvlgmMc6NdeDHkbpIuq54iajeHl1uPtYc/HvImN81EaoVOe6IpNHImnf
 khFYgrsdDxHuUiGpAegGDrqLFPApE
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr18151671wrx.164.1606680706163; 
 Sun, 29 Nov 2020 12:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPka2aHaDPPX0PTgwDnAG/w5i0WrMz+FyjrUMAbM+Qjqz54JODofUJr+22IVyBqFlX4tuyzw==
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr18151664wrx.164.1606680706012; 
 Sun, 29 Nov 2020 12:11:46 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 34sm24071900wrh.78.2020.11.29.12.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:11:45 -0800 (PST)
Date: Sun, 29 Nov 2020 15:11:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201129151113-mutt-send-email-mst@kernel.org>
References: <20201127183003.2849-1-info@metux.net>
MIME-Version: 1.0
In-Reply-To: <20201127183003.2849-1-info@metux.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_151152_623065_B02DE8D9 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: linux-gpio@vger.kernel.org, jasowang@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-riscv@lists.infradead.org,
 linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 07:30:03PM +0100, Enrico Weigelt, metux IT consult wrote:
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b052355ac7a3..85772c0bcb4b 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_GPIO           30 /* virtio GPIO */


Pls remember to reserve the ID with the virtio TC
before using it in the driver. Thanks!

>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
