Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFAEC10F04
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 20:49:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A242147C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 20:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klFFQcE/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lLQgQe9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A242147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WLu2ctLIOKBBJ5D4fldnIvNTRlbp9eCLTDk6d1cDrHg=; b=klFFQcE/2w+d8GwmCmol5y8A/
	Hwkj6zrnZ523kjq5dFNP0jpRIl14Toi3wDeSpZtBhpaTrLx6x5wy+VCz4CDTDIxwD8AdFG4fMr5JV
	JGhwxW0F/DDNzUtsxtldFYtlNzpgUg6PW7qius5XsIH6SXw4zU3kCRz1YTzEske+1RghJ7QA6rFeH
	4f625WK2F2VTocGDpSIcFxNPT8HS7M2uUq6ZAX5bs9apHzcgekryZ0W/pAjcM10/7Yy4DAPir+ZiV
	WP+Tq5Cid4HiwgRgJWb51udf86YcNfGO8b4n1vcIQIUJZqRI2cFLN3m+TzYA/1SHL9tyRPLryOmdF
	3NZ/s8DvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guNx8-0007ZT-88; Thu, 14 Feb 2019 20:49:50 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guNx6-0007Z9-1f
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 20:49:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id b7so3678984pfi.8
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=65fCph2wVQLYLbAYl3Kh/IhOwVLd3uOG3Na/8tJTTl0=;
 b=lLQgQe9BdP6L/KKozxCy89gHttaXJ4MA/yuhOBLCl/O1eO8ekEikoBlRb07TggKmfT
 VEnZJpuB+R0alfezZ07DaC4KjxaWVhFw87+QptUw3Qfceuu+A4AqmvxsZpbt9TUicHg0
 pIp0nAUSBY9GINxAhjuu7lkJv4M3cJfYaDkCYM+E7KxXxeADn7bOhq3P6BdJtOi9Set7
 geGOodJQ42skGi7BhAPn2OSrGFUbhESwVHmVG7K3mUc/QqnryZ1A1g4gvHOsa+GHi8Wr
 7v0wAKu9AsvGvisJ9miN0oRC+7goN7MaAvA0WXXEqzHznU5rKaZN10qjHoUKTWZ9V4Qs
 vxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=65fCph2wVQLYLbAYl3Kh/IhOwVLd3uOG3Na/8tJTTl0=;
 b=uYEwUtGgE7bZnhnE57XNJtFFpgw7RQlNh4oevM/tF1Bf8ip6dSK4Zjs72jHEIO1xGL
 OJGqGH4YmozXGzaDwP5YzZXDXgxn03Ct8CGMsE1eDwsgz5cWYASGXRngbEJTh74MhjBK
 HmqTsL1AR25P8G7F8lRWHQfZLWSdMQgGzM25CxdBwOpwSBSrhn/x0ARQQrLmj2bBGCmc
 tdn3pFMwJO7nlytON1niaTP3jmME9kUwsJjiDrWAPT7iYiPHggAGIVcVyk0R5uhRmyA1
 GUiy5dms+redR5KUp27FfRMzfXJBW4Dy7D9AsQsWmAx+489c/D7Y90Lnc/+rm6eJ1pXz
 zcTQ==
X-Gm-Message-State: AHQUAuYwUPhcJPgkln6CcpkZDCOQf+k+dgZrPdqoweir8mo+FP7w0xET
 1wCU22i0EqpbAFjTbNJeRPlffw==
X-Google-Smtp-Source: AHgI3IbLxG6jNbV4WqQPwhjvqV2Ffx3+iOXl0AxSnfqcM2rbVcz5nyD0wlnlMZsqhHytPuQm2K5IYw==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr1788701pgr.333.1550177387393; 
 Thu, 14 Feb 2019 12:49:47 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l12sm3035910pgk.40.2019.02.14.12.49.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Feb 2019 12:49:45 -0800 (PST)
Date: Thu, 14 Feb 2019 12:49:45 -0800 (PST)
X-Google-Original-Date: Thu, 14 Feb 2019 12:47:37 PST (-0800)
Subject: Re: [PATCH 4/4] riscv: switch over to generic free_initmem()
In-Reply-To: <1550159977-8949-5-git-send-email-rppt@linux.ibm.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: rppt@linux.ibm.com
Message-ID: <mhng-e6dedfc5-937e-42e5-90d6-4ce400cbc6fb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_124948_119332_4106FD76 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 rkuo@codeaurora.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 rppt@linux.ibm.com, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Feb 2019 07:59:37 PST (-0800), rppt@linux.ibm.com wrote:
> The riscv version of free_initmem() differs from the generic one only in
> that it sets the freed memory to zero.
>
> Make ricsv use the generic version and poison the freed memory.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/riscv/mm/init.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 658ebf6..2af0010 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -60,11 +60,6 @@ void __init mem_init(void)
>  	mem_init_print_info(NULL);
>  }
>
> -void free_initmem(void)
> -{
> -	free_initmem_default(0);
> -}
> -
>  #ifdef CONFIG_BLK_DEV_INITRD
>  void free_initrd_mem(unsigned long start, unsigned long end)
>  {

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I'm going to assume this goes in with the rest of the patch set, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
