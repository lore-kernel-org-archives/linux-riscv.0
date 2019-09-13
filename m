Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30916C4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D902084F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LTN3CMYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D902084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=eOCv79bTyZfOZbWahoUYkmKeLHIzGNlASHR50o+5aPQ=; b=LTN3CMYgD0xpBBX2K54Zz03+L
	Nr+UYj5fnosPTK/pPx0bHlafZlSk3RZ/wGyKGCzwoUXUNXw7mY/qClgmp3bLR4OC7fXyZEBbI4HdF
	FPCMAw5Zy3jEKPoGYWSlainseit+9hbpn6baWGihgxAbTRRBWYat3Rpkg9yzII0Ivcxxbnx4KMGmi
	xlDWeG4Pn+PWiGJBM5ByqW3HZiX/YXHQwjvE9SV9De8B2ThKxQyRVPz7YhyrYfXNu1r7uuoIwaKEe
	YlJ93qYvOJlHDruVev74jBSk8OE89XeizPKRxipawMhGVMlSby324lKXpqiL0IeD6d2cQ8Pg587No
	+Tf9bZOZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8qs2-0004Bn-Id; Fri, 13 Sep 2019 19:04:38 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8qs0-0004BG-10
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:04:37 +0000
Received: by mail-pf1-f195.google.com with SMTP id w22so18646863pfi.9
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=J8WZu8kPZWoeeQELgw+yQTV+q40PZLs/qmgDReqeZXk=;
 b=CXpUQjiG9Ac2gBLoU0W4mAkiKF0Cr9Gq9sxAkWiwQALKVpAEVMfV4b5NVGH9sdA/zM
 MWG45eOyCnDe/9NrVSxS3CW4esGs4O/jGdMPgeC0jOyzs4bjulMqkj/QbBt6OYD3sN5+
 qp/dCqoMXdAF2yunM3GIpqV7fT+zQHV9gEbn7VhtXe3qj7BpAe/Jln9HGbbQ7Sskc5gI
 c+cPzStheaDnHrVpmzxMlAl3GzQhNPfyQtTzdn8KYdo8+iBa9BbkbYGkUPSeKwkkzTLm
 HNQy7ljqgWTh4sOYkha611q9sqb0eFwWnl+jWQNsF9BWYlhgjWcgDtXcgtEnoK39BQGG
 WjKA==
X-Gm-Message-State: APjAAAXYR4/Dp68n9akCqO5DDSGzm7cHmrxlYmccYrqFqiD/ldMTfh3Z
 9/rhkL+clArK87qp9KKHUOI5XA==
X-Google-Smtp-Source: APXvYqwJvSZDMasTEVNh5WsVDJxEBgwmLv1wBQK4AVmpBtSBRz7G3lmSplJTYG6MBOAci2cPyDA12w==
X-Received: by 2002:a63:188:: with SMTP id 130mr44264209pgb.231.1568401473606; 
 Fri, 13 Sep 2019 12:04:33 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id p68sm56933518pfp.9.2019.09.13.12.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:04:32 -0700 (PDT)
Date: Fri, 13 Sep 2019 12:04:32 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 10:15:26 PDT (-0700)
Subject: Re: arch/riscv: disable too many harts before pick main boot hart
In-Reply-To: <EUNbud4OiUlulXZR0_kXWEOnsI1rm5JrQehjVFXdgbThdfwL5mmYxRGI7pwlf9tpuYhjjGSDRj-4jL1CtfzuOxhY62TYGw-d9L05FQxi7N4=@hardenedlinux.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: merle@hardenedlinux.org
Message-ID: <mhng-0a85b4e9-be39-469c-9a50-4ee1310f6e8e@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_120436_067458_CEB016BD 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, citypw@hardenedlinux.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Sep 2019 23:51:15 PDT (-0700), merle@hardenedlinux.org wrote:
> From 12300865d1103618c9d4c375f7d7fbe601b6618c Mon Sep 17 00:00:00 2001
> From: Xiang Wang <merle@hardenedlinux.org>
> Date: Fri, 6 Sep 2019 11:56:09 +0800
> Subject: [PATCH] arch/riscv: disable too many harts before pick main boot hart
>
> These harts with id greater than or equal to CONFIG_NR_CPUS need to be disabled.
> But pick the main Hart can choose any one. So, before pick the main hart, you
> need to disable the hart with id greater than or equal to CONFIG_NR_CPUS.
>
> Signed-off-by: Xiang Wang <merle@hardenedlinux.org>
> ---
> arch/riscv/kernel/head.S | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 0f1ba17e476f..cfffea38eb17 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -63,6 +63,11 @@ _start_kernel:
> li t0, SR_FS
> csrc sstatus, t0
>
> +#ifdef CONFIG_SMP
> + li t0, CONFIG_NR_CPUS
> + bgeu a0, t0, .Lsecondary_park
> +#endif
> +
> /* Pick one hart to run the main boot sequence */
> la a3, hart_lottery
> li a2, 1
> @@ -154,9 +159,6 @@ relocate:
>
> .Lsecondary_start:
> #ifdef CONFIG_SMP
> - li a1, CONFIG_NR_CPUS
> - bgeu a0, a1, .Lsecondary_park
> -
> /* Set trap vector to spin forever to help debug */
> la a3, .Lsecondary_park
> csrw CSR_STVEC, a3

It would be better to decouple the hart masks from NR_CPUS, as there's really 
no reason for these to be the same.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
