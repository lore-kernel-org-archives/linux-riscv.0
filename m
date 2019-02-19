Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A466C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:20:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EF92147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvKhkDJy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Kc0qe10u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EF92147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIKlZPa0aeDc5TeMWtOz53yDSxDFphSGUFXO/AI81PQ=; b=pvKhkDJyXFxUVy
	ivYuadxMYeBzRGRfQbRSbMulp6BIrZWks96X7wV/FgMxi917iJ6syI3nwh8LU4N3beUM3FUCjPa8W
	jcEbZ4Lt5whlzc/GuvnzkU+0tF6+Ubls1oqZ48tIIDrQwHsLMwtQ2jIuMSZBfqv4y8Se+Cj50DFV8
	5Xs1RZGWT/KNEQsUQUGYtAby7WtU+StIFLYi6GpdeG7ziFS02HmksK+x4rJfpt5rpQ7anhI5aqwx1
	/9LYWDuNT8LPxIcSIFiVLZyMoP82VRZY3b5BLImcH18Jlg91/aSg00rA+wcPd6uwc8pMvRDpBgPXq
	EiA3L6nuzhe9LSIyAfnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwCob-0006Xb-Cn; Tue, 19 Feb 2019 21:20:33 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwCoU-0006Wc-Qf
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 21:20:31 +0000
Received: by mail-it1-x143.google.com with SMTP id z124so9972371itc.2
 for <linux-riscv@lists.infradead.org>; Tue, 19 Feb 2019 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Uqg/xYPEomUxikesUxTYEPTAFgGyOfSI+TIAf2ftQno=;
 b=Kc0qe10u05pcZIEfmEVDoAd7hILi0PQQM8NUSY2jRXtD0K3V3PHGrGRAj+M0FToP9Z
 EX1feDIY665LI7sez4XXdn25c366ydZYfcLo7z5ro4bQCgKRIjtap5gmYI0EOX1oSA0h
 24SmS9I1eYy3KgQe9tU8kIzskXBXG7himuAIh30RYRJp/xCd4Fmdi5KCZ5dw3Bkxb9Ur
 D82KasAkYIVETEAy7EEdZKHWAC4dJ687WuqtxJV+TQ/CUWNpIKITK/dzgqy5lJoXHhgl
 58t3PziKEiop22MQjV7H3kYq/982HWSh3NWbgRlPCBxgyGtqUPNq3Rb66R4PKJxXDH67
 n+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Uqg/xYPEomUxikesUxTYEPTAFgGyOfSI+TIAf2ftQno=;
 b=NFxIUklZhAcVODf9HVufj5f5DWrF7Kl7PFxPzDO6fuAecuIEW28Gox1HAzjY+Zaab9
 8qziOgjV4WB0jd6Scm/SRo/Ok54aZZyoj0+QbuZIUZtaHNRV9JojfEw8j+x8hun/ZDq+
 KJyEIS2LZMHjGUtOEZJVwDbOcrLfgSv9ABn//hmnU38btB5k54PTkrlU0IbrkwrhxOEI
 Yu+a+D0glf709NFzCHd0as75zkLqx5uV7bH61SRPRwPxryfCMMNmNWKWWy6759Kp3o2z
 YTDPwJVTNEJDT7sRDPzbtBqzIinA1Ywuj2eDAIDnDeFUR+8HJFDjVU66+laFQFxwtqDO
 dSwg==
X-Gm-Message-State: AHQUAubw2bvlFqWIadVUHYBmqN7drihxWc2A/yxleBLc6dJ2NUeLTeO1
 jrc0SDHJrRZwAXDRbimsQF8lqg==
X-Google-Smtp-Source: AHgI3IY1uNVNzABy08WGld1sjIBciGkufmuS5oFks7K4seq+uKNdkYeTcp39KCn5WRPltLcrwYsBSA==
X-Received: by 2002:a5e:8513:: with SMTP id i19mr1911171ioj.21.1550611225842; 
 Tue, 19 Feb 2019 13:20:25 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 140sm1823908itv.32.2019.02.19.13.20.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Feb 2019 13:20:25 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Tue, 19 Feb 2019 13:20:23 -0800 (PST)
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] arch: riscv: fix logic error in parse_dtb
In-Reply-To: <mvmr2cjy7xx.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1902191319390.6518@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
 <mvmr2cjy7xx.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_132026_916779_59630DB9 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: paul@pwsan.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Thu, 7 Feb 2019, Andreas Schwab wrote:

> The function early_init_dt_scan returns true if a DTB was detected.
> 
> Fixes: 8fd6e05c7463 ("arch: riscv: support kernel command line forcing when no DTB passed")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 45e9a2f053dc..84f19ca6d88b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -140,7 +140,7 @@ asmlinkage void __init setup_vm(void)
>  
>  void __init parse_dtb(unsigned int hartid, void *dtb)
>  {
> -	if (!early_init_dt_scan(__va(dtb)))
> +	if (early_init_dt_scan(__va(dtb)))
>  		return;
>  
>  	pr_err("No DTB passed to the kernel\n");
> -- 
> 2.20.1

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # FU540 HiFive-U BBL

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
