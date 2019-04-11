Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C493BC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3F22146F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gjGioP34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fAyjEW4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3F22146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vFQPsfNhp+AabHL3aEEjzduHUl+9Ls/MTcw4z5B6zg=; b=gjGioP34UAraGl
	sBEdX4EHNVb74bAF+GlOnK68Jxlrc7ooTRQCTwpaZn+l618PBJqtgIQW/774ZV8mMvWb0enl+VNY8
	lbJ7OsRCtQbkYpKHqiaXnCch9ma3/ZiJ0Ze6O4fH5RmOdVjFJdO94I4cgt4o1E1ckeAzB8GlicF0C
	6a84NnyCnWb+1c/TeJbzzJNzOpnlULjBfTce2OhmggRpZHYCFVH6R+40TU5QqgYbEybDFWkg7AxU5
	KYnK66b6wwtCyzssLY50AR83NPvUlZ3fXt0Ik/ZJAQINJsGtYr2L+RyHdnlfdccwVpjU+rmttgZmo
	2ohbL46rMCKyin3oBucw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEgzK-00080L-Je; Thu, 11 Apr 2019 21:12:02 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEgzI-0007zs-73
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 21:12:02 +0000
Received: by mail-it1-x142.google.com with SMTP id y204so12202447itf.3
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IkuarGGVKCQsG79ZJK4mrZNMD40jUbFO5RJo6N6EJrQ=;
 b=fAyjEW4Yx1t1hT+431iRw8huCVDlNbsu9i1y3gQX+1JtUn6uB7Zp3/6/Q+D7JR9B4f
 4UfpJ+qTSuENZH/fEPTdb8ltie3rmYv48KE4cuNUd2lpPaHq84Ri636NG+73cTurJy8P
 d0TlWUcYY3Bz5Tr+uUT5l6JPzB5uFUi0Lx5JKgf05VBHygvm8ZemOzNHIYPbZcdacyiC
 7KyOxUqgATenkn0ZmLMtn7ZWbFVjbZbhk02O65/kLKnRLNPrfIZBV/QbJAY3dLKiy1T1
 7vWPSAwfJsA6Ic9ZvyBg6mtbVXW9JCDLjAgBGyiFbeLOG9S2FW75EAZOn8wA2koVyouh
 My6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IkuarGGVKCQsG79ZJK4mrZNMD40jUbFO5RJo6N6EJrQ=;
 b=Egw+U931LkaDDVDa7EVePsvZhuntkN0oVsYs1uOuREyrRCf5cnrmS+y8SkRxqBdkXE
 xJ67pIGp4xIYGNGHcvo07bo6Xy/OwoXmXdhEowdY3XHGluXJqFrX8vVPCr2RuVw5xam+
 5yI3epcaD7vJ70AHgJ65GeGvpyiM2QYNSAUVLWW9gxpV9Yc+70HFLW+D6pGLgDjUawqm
 kkGM7/kyxpM8vT2MDc9O0EBZNjfRes8nmEkKA1nEPDPdE4Lsb87an882NxG/1K5o2kTv
 vxhLAybF0AtfIgxV3ISCwfoBfBy0FvVGUVzAMsTSXV2lRE50QyCtYFzjbOLl7/3onoJw
 UZkg==
X-Gm-Message-State: APjAAAWloEwni3aeNv05qeU9fvbqFFn64fTLMIykV6XvXDv0LzRleWpR
 XztcoFMB6bOzUDtgvYr7YE6Veg==
X-Google-Smtp-Source: APXvYqzeKBXYfT9mMVLuIyeUJKPRizOio6KDDbYBXQhMeGA/MGafpAUyZqe721Bbp1rdLANQyR8wMA==
X-Received: by 2002:a24:80c2:: with SMTP id g185mr9042453itd.11.1555017119267; 
 Thu, 11 Apr 2019 14:11:59 -0700 (PDT)
Received: from localhost (63-238-229-145.dia.static.qwest.net.
 [63.238.229.145])
 by smtp.gmail.com with ESMTPSA id l68sm3080312itb.29.2019.04.11.14.11.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Apr 2019 14:11:58 -0700 (PDT)
Date: Thu, 11 Apr 2019 14:11:58 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
In-Reply-To: <20190411114616.GA10032@infradead.org>
Message-ID: <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_141200_272537_13BB69F4 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019, Christoph Hellwig wrote:

> On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
> > Similar to ARM64, add support for building DTB files from DT source
> > data for RISC-V boards.
> > 
> > This patch starts with the infrastructure needed for SiFive boards.
> > Boards from other vendors would add support here in a similar form.
> 
> What do we build it for?  We'd really need something like this:
> 
> http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
> http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1
> 
> To actually use the DT files.

Those patches might be useful - I have not reviewed them closely - but 
they are not necessary. 

The FSBL already supplies a DTB to Linux.  I assume the U-boot port works 
the same way.

I haven't switched to U-boot yet for these driver tests, so I personally 
have been using the open-source FSBL (freedom-u540-c000-bootloader) with 
the following trivial patches applied:

https://github.com/sifive/freedom-u540-c000-bootloader/tree/dev/paulw/supply-fsbl-dtb-v5.1-rc4

The fsbl/ux00_fsbl.dtb file can be symlinked to the kernel DTB output, 
e.g., ~/linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dtb.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
