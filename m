Return-Path: <SRS0=4NHM=NW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5781C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 21:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713FF20871
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 21:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqn5KxAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cpsZweah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713FF20871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kzcHB0/7534mdV5fgVhCLQrOddHW85h8V3cIqYqb80Y=; b=aqn5KxAHRvdkDjrCzpzkJ9zjs
	N6a2a0o+qO5ZYbCMVI3mq19Dc5Oq5AZEsBft3BoJBpBJcbCqSnwqFi5X/xIfLtSDg5boGV8DpfPUG
	8sO9q9gY7GLaddHkI6IaE/Vk7NOyMqgkVOoAC17tiZ/ix225jA2ioWjQonZ5IxsLaME12u7ytN8Il
	2eyciish/hrWVxa9H6/GvuVEcvas9BqDyH/RN9BFbOtOc4fFZONAsKTlnyJ6tXLpYqSDMweoS9UKW
	x1UQyEOJ1upVfXCakoS4WQr0Kmz1xeoRSn8Cpuipw7eavyPH0wtswxdwBSN28frPH2BYlpS/Vg3hA
	6oDxA5P8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLxeX-0002fD-Kr; Sun, 11 Nov 2018 21:52:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLxeU-0002ej-Ed
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 21:52:20 +0000
Received: by mail-pg1-x541.google.com with SMTP id 17so2865413pgg.1
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 13:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pa0hEIxl80Lg8LiGW7lRwmLmO9JY6STPnZQeKFVVC+U=;
 b=cpsZweahW32h2wRz91j8iPMHCgK9p8GGRPhjsHw5jd8zM6DKB14ER8CXBTLzalkkTA
 6rfGKWQQdTt6VsJ4fCjtMrkR8iPGEh45dxmkZdXkVFvNXL4J1i4l99fr2dX/SWPyYo9S
 AnB2gTpPuYz/fJHyNPOSmf5Xc+D1obzy+A6jE7QmTf9q5W+sCEQ/g3aKDrZq4cyE7P4/
 YWoM93KN83jg0/RrVywrEMwI/IUHvetXELrTsvLIq5OfFuWdZADBMyHEtnNmNsi0Jhpl
 x0YRjAV5KBoYVr9GwDuxVM0e7gQO62KTiMa5efPj0oEdeXF4oR+KckxhDa2s3jTRvjOe
 mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pa0hEIxl80Lg8LiGW7lRwmLmO9JY6STPnZQeKFVVC+U=;
 b=aPUzjdtnPZ6YuCeTTLtYO+KZH0+YPjwB/XF46oa87gw6PzzKjswIR4reNIGHwdfzzg
 vGC9Y/1CswruDI+BJVs0GiHPXbTZHKP5r8Tl2JrDivVOtcB7LLu419OZamkrna1RruEV
 aXa9+vbdilnwg/ey4fomAEQk8gVvjVgc3KPqTPh57HZeIKuewn+kZ1L1PSiHJKRvm0Ol
 QLayya/wmwC8svSdMXrS4ZV/aJiX4+K6SSfDwcdDretNC0eTJOA07VmaNnWYWapJv1WA
 eRcME4OWdz6kGScHsQUkBnu7K7iojyGFV0q5TtUNtQP0ARsm3/XBP405x436wcNMVhf1
 8mzg==
X-Gm-Message-State: AGRZ1gJpkrrbJXYNCIiWpRvEE8ZCUchGb+VQcCr1AltWQLF6YQMGovWb
 j2rgU66P2JoKGaEKCXpigI2wIw==
X-Google-Smtp-Source: AJdET5eR0TSoFPwHq8Wt9iBTKGgpCWY/nr2YWJLi6Zlzx4ren5s0U9d0ArHS4svbjB32mrmg6VKyKg==
X-Received: by 2002:a63:134f:: with SMTP id 15mr8769175pgt.19.1541973127624;
 Sun, 11 Nov 2018 13:52:07 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127-v6sm2191435pfz.135.2018.11.11.13.52.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 13:52:06 -0800 (PST)
Date: Sun, 11 Nov 2018 13:52:06 -0800 (PST)
X-Google-Original-Date: Sun, 11 Nov 2018 13:50:21 PST (-0800)
Subject: Re: [PATCH] OF: Add a warning in case chosen node is not present
In-Reply-To: <20181110005317.5631-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-e3979636-81f8-42d6-b810-eeed6786d4bb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_135218_498574_7F2BC4FE 
X-CRM114-Status: GOOD (  18.34  )
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
Cc: mick@ics.forth.gr, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, robh+dt@kernel.org, frowand.list@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181111215206.24bp8_F0SQhZX6_6oX-xJwfCWOy_yzulokrSFK5EiLs@z>

On Fri, 09 Nov 2018 16:53:17 PST (-0800), mick@ics.forth.gr wrote:
> On architectures that only get their bootargs through devicetree's
> chosen node (such as RISC-V), that node is mandatory. After a
> discussion with Rob [1] I'm adding a warning in case chosen node
> is not present, to let users know about it.
>
> [1]: https://patchwork.ozlabs.org/patch/984224/#2016136
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  drivers/of/fdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index bb532aae0d92..7ff67bf1f6d6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1200,8 +1200,12 @@ bool __init early_init_dt_verify(void *params)
>
>  void __init early_init_dt_scan_nodes(void)
>  {
> +	int rc = 0;
> +
>  	/* Retrieve various information from the /chosen node */
> -	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> +	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> +	if (!rc)
> +		pr_warn("No chosen node found, continuing without\n");
>
>  	/* Initialize {size,address}-cells info */
>  	of_scan_flat_dt(early_init_dt_scan_root, NULL);

Thanks!  Note that in our case we actually ignore the built-in boot arguments 
without a /chosen node, which isn't clear to me from the message.  I'm not sure 
if it's sane to warn everyone of this, but it was decided that RISC-V should 
have this behavior because it's all standard code.

In other words, it might be worth adding some sort of 

    #ifdef CONFIG_CMDLINE
        pr_warn("Due to the lack of a /chosen node, we're also ignoring your builtin kernel command-line\n");
    #endif

though that wording is, of course, a bit poor :).

Either way, 

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

as this is better than nothing!  Now I can just point users to the error and 
tell them that, obviously, they should know what it means --  I just hope I can 
remember :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
