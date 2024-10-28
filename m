Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315E4D5B847
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 23:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09e7mV+cCsE7w6ItsXY5xTVmjzYagfD8n8Dn6/sJTqM=; b=H/M9uLz0Yvk20B
	l7syu/eclahpa+/RxII2Z7e3Clf1NFKmcblgyd5yukPC86EaoBs8HqYRpiPt/5MjfMmLMyLEIKOkg
	N+4Jp2tMg7HCzo6xmnBe051TOS+SFyVIaMcUJvGk8JxrEBbMTkeePwrJE/DDR+iAH623188FWvMlq
	NOB4woHLCC7U3/KZSE6URawDFngtscRv9/gxtNf4FvyZCK2wichzc3YaMft+y8vdxe1HItjeeHP58
	48mnsVWOgKXRajQ+Dsy5ATf/hw+ODZYN/E7d8+hyLHizPjSIFcy2LAalHG6j+hxe9qzMTVpYutkhk
	IcfIuS3kJY9zIZ262Nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZKk-0000000CeTp-2OXj;
	Mon, 28 Oct 2024 23:39:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZKi-0000000CeTJ-0qm0
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 23:39:37 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e31af47681so3868263a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730158775; x=1730763575; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7DyiDjyvXKkTuu2TcoYINH5EQOQB3jH39wxFxqTGVo=;
        b=FcqOZtjjH3eurMUA77uqLd4Axtlbc7fmAGkSRFECtDfkGUn9XopDvJIf71NgHr95b/
         0gdFWWYfAPQ9KSiAXBS3UBmW1LKReMH6psnqm4I8UGFCY3Q9rsZJPRuqW4+XffQRkC3w
         77nwVVRh/5blD51JwB/FNNt/uNj1/hOC/vWsz1oghfYFuVCcV6RullFCOBhiwCBk7pMe
         Er3twANkb81gOUuhQN2gjCAFWejdkzuCcu1lU6e6T4nl2j0Kt2dt+JHwhcEl/mspDfbQ
         cq7BxjykwzBsB8uouItKEAEaJ5KcViIGA/UcCEjvoTMklgx5Bn5uO+cnD6pzMFQImRcp
         I0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730158775; x=1730763575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7DyiDjyvXKkTuu2TcoYINH5EQOQB3jH39wxFxqTGVo=;
        b=PeOBHEH8HZga5WWN9f5ypvHM1/SAjofyu4JLQHOnXVdgnKtIsaNo0nlYO9107cEFp5
         8ReYVmyigGcqRutBFHVxoFRGv+ScWEs6tWMDnT9qHd3Zx8E5HGYO1b4GbMxqwsVwlkKz
         TzBwSePfpcsAPQ2xdvun6F2GcKjljr+/4ijLGJHzHOTZn3rDVbU0soIKtzPFHkgl85tV
         2/xlASIR5LIKXIx9Z6UjBsm3sxIKnafryV2BgYuhl2QBjz6HWXZO6vI4YvrKnWi1mNxg
         iQbN/yrWBP2s0MoKbzB0hWLJaifz02P/S2zNEckZ1fG+fKhUSkGtCOa/8wCG4taowAxC
         HKjw==
X-Forwarded-Encrypted: i=1; AJvYcCW2tEV0nt3JadNiqQC37BA5VdfijFvZ7moE+4nCOByQDycVfAPQC6nmEvS1SIFp6UTgtPurXG/xt4eLtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkmj4nJ3OP1bokkEVzupSvkRePLZyxYOQw2oW1PMH2qD4ZRd7
	h+FkKn8H+JAg2G9tFfDn06Td8LLR3rs3/uReT9APiHFLkxRK+6VL
X-Google-Smtp-Source: AGHT+IEfhvwRKDrINSpj1Q3RCdtGX1BnVmQiUxZygsBUZVuGX/l68vRcrLgWoyyDQ62Y5H8AfjxL8g==
X-Received: by 2002:a17:90a:ec12:b0:2e2:cfef:86 with SMTP id 98e67ed59e1d1-2e8f104f0b1mr12631047a91.4.1730158774747;
        Mon, 28 Oct 2024 16:39:34 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e59d826sm9925575a91.52.2024.10.28.16.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 16:39:34 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:39:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
Message-ID: <a3licezlakpgqsvi65i44wbndvt7y3jalbebuxevuz57ctj6ox@aovdt36w7yeg>
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
 <MA0P287MB282284A77094A096573A23F2FE4A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB282284A77094A096573A23F2FE4A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_163936_261422_E6B2F44C 
X-CRM114-Status: GOOD (  12.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2024 at 07:34:41AM +0800, Chen Wang wrote:
> Hello~, Thomas
> 
> This problem is introduced by this patchset [1], which is still on the
> sophgo/for-next branch and has not been submitted to the main line. So I
> think the right thing to do is to submit another version v6 with your
> bugfix.
> 

It is OK to let this patch go. If we want to keep the patch persisent,
it is better to apply a fix than revoke the fault one and apply a new
version.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
