Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D1D2083D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIiFOTtK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DNt6cZ2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D1D2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BO0kIKv6Ee4wn5Pygmp+/wgmMCkC2tbOXGVKhb4d3g=; b=cIiFOTtKGpNIMr
	Kazxq9CeVScE2uwIuDtmF0IemGPU+wZQ3BY+J1GJsxjhpdjqT/3t47VsbaC50lZ7DhGuflPRO7mvV
	1cxZWqsG261TEBr8O6RAwtwCJwteWp19C/KAvhVRwpjTDf8RQVvPXB2ihKjEzYhpeUs7jrg9hT59q
	1lvWDC54yASQnSthqPJK5SM/GOpbuZnoF0aouq8sVmIELBavhXNYNVxrm36ClKDXXfyPy3YnAMBCt
	hk+58qog4rDP/PObwdabBk0HMZUbWnGYADaYIiutLHTuvM1s3JsAex2mQYKoSKRA61PgLxvNPfHV3
	+7FcdWvq0oRLFAAOyHDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3kJr-00030U-3Y; Tue, 12 Mar 2019 16:31:59 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3kJe-0002rm-1G
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 16:31:57 +0000
Received: by mail-it1-x142.google.com with SMTP id d125so2845254ith.1
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IbgbBi+8n3MFHsUq65bw1T1rwYayxXQqXSiYF0JhQfQ=;
 b=DNt6cZ2DTEUJAQShjH93uvUcBOI2DjxRwyy3sIIlFSFJUYCDOZfJqvX4T1526qLZwH
 nXL3JwmOoo+/3JZTUAwbBSqtEmBI6gtb1eI2qZ36us6Uq1pvIQSvmWvvq3WNV5AmYk4u
 35WiV9xD/mRCE7ygpVMnnLmduXK5Pnq4ix9dfe+mm+ww3ibb++mfs2PS+hPXfGQUlCe7
 BQHqTbJkBewvr05turtBqAbSWrhD52CiOj5vdz5hW3WsUAcVYk2RcJAZSqXSVo8SSNKj
 KYPpVEZcgrlEJXollTmMgQwElDTTA4SviNEvwUeAz6UpgkWIxWytG4T2xp7mPSzpaVwO
 WDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IbgbBi+8n3MFHsUq65bw1T1rwYayxXQqXSiYF0JhQfQ=;
 b=D0EFVr+SCmHI9nKWni9MnTULlzc4dqEZ9bo5KFIvyPFjc39uxVKdf4TLsgSY2ZvXXi
 W9HUY61XPJ5zyJy1CheepgtnSSlGv8kmBJY00WFrNgL0x01mPRK+7kkn1oTTflxTmY+C
 5k8lKH38Pq35iqUttiGnJOiwfEnhPqzwGG55m/e5whY7yIFjY+QFp8FAht1tqd0jQzyo
 g9bK9IHxR47OHinWWvjWogcgsXM000UKI7Uw0MYcqdl+tfusAziMiCSYZde1JKYW2KDF
 d81qn+1KEbkMP8DUwm74zsnyx09K4t3VpwiVbrsdD4qYCLB3axJy8WqXd56hjEWEVhpz
 Ef6g==
X-Gm-Message-State: APjAAAVQKXYDFM0v61cNQEm2yzl6u50uqtoabux9tmBFa8MEag7Yn4rp
 0ffD9ZjQqVjF0NHWEvG5n6k/0A==
X-Google-Smtp-Source: APXvYqwYOg26ugumoEGWODgzph3ouM8fQofOgdLeW9BQmVCQMF4UcThFlh9BhU3lTfSw10nHhU9bkQ==
X-Received: by 2002:a02:59dc:: with SMTP id v89mr21644578jad.98.1552408304931; 
 Tue, 12 Mar 2019 09:31:44 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z4sm3747331ior.27.2019.03.12.09.31.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 09:31:44 -0700 (PDT)
Date: Tue, 12 Mar 2019 09:31:43 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
In-Reply-To: <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1903120927450.26459@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_093146_547978_FB6DA2E0 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 bp@alien8.de, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Yash,

On Tue, 12 Mar 2019, Yash Shah wrote:

> Add driver for the SiFive L2 cache controller
> on the HiFive Unleashed board

This should read "for the SiFive FU540-C000 chip" or something similar.  
The L2 cache controller is not specific to the HiFive Unleashed board.

Could you also please describe in your patch description:

1. what features this driver supports - in other words, why would it be 
used

2. and, if this driver was written based on any other drivers, please just 
briefly credit them.  For example, the use of the "teardown_*" function 
names suggest that this driver is at least partially based on
i10nm_base.c, skx_base.c, or pnd2_edac.c ?


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
