Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDCDC6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 06:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559DE60551
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 06:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559DE60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qZQxZQKMhICRpXIREWOg4A0vzX7xDw0xXHD7NAii88Q=; b=4QQQknGiibJ85KukKqecDgiDol
	kTOj+2yChLUlnoEopTHdDVAzAtTN+AlvP8HBpE0Nh8FkZla3QuSsTjzKjmDpFpCrjCm+FHXLyP7MV
	IpTy2u1gjVgFw4F7GXmmng8KoF9tSe0IqEpKRhJkp93pImpC3Jl/tOSj6TeFCM/0sxFNiGvKJfMXx
	QfmVmHi9lZJv4N/NvH2Dy0Ul2Z8Oms8td9amN1DBfQr3+YOgLc6U8RHOzVBFgmerUjb09VVsUoMa5
	+IIbRbGLfIqqg8/eulIGJVA4qcAWU57ighO1P8XWmt2iDCWich5uPNqs5T1vepDV9UwgEKdpWom9V
	DdOCDh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6RwW-000KMT-Vx; Thu, 22 Jul 2021 06:12:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6RwT-000KLP-Sa
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 06:12:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so2814783pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xYn9TThM+ZWcAUslBNCtRAoUyc+f1YV38quHS3ur+h0=;
 b=e4hyMVxoP7Mk4CxoR/e0msaMox1XC/iLjHKH2aLwkAtuyB1KBkjsGBYaqOVf9H9h6G
 iTfvQYeUsmepI1tAirhqX5+R9fzaoNiPLPO9h+z2OgtZh81Ses9TL5ud6GKwyK0NJt2r
 BgOIfa1GMG5k4ARHSbXQw1MeKMh/tDrDMhhp7flLg71hQUFKPt1CMtbnUJrlcK5gb1uV
 7QDLLUFkPyUgOiZ4SvtlIkiuzgVxR5buXCLbwgfsFIDoAnkBcA8MjlEfXJLIGZJnmk6k
 eaweuGg0DLmJnNUHPpUZYCW9NtlO/tOsfoZmbRmUPf1x101sm/tK+LLgDKUWpxd2G+JJ
 y28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xYn9TThM+ZWcAUslBNCtRAoUyc+f1YV38quHS3ur+h0=;
 b=e0L5qpW0/uO0TlvaQiSD4FFqnaBS72kIwYyid4oA9jVjT5yrySmFqshONBLQOU+Dxf
 obduHT7s0ZfQtrFUFrPL+IPcNHwUZoMnRbeEH7lkcqP/X1AvgUCt7uSFqYx17NFhVaXs
 WIF/oGOqYY4JlpT7M3eByVUIgi3ZprjpSTEPJhCm3wau0pHkLZa0j1uwQorUsTCXq+S2
 +WKHoUiKcdL8hJFptOQcksgCPXnVbE7Xj42wulNrl1pCuRTwLC+6qE5q0wPneZPyJgSg
 rugn6u6OdWfQAl0yFcipXV6CmYoafeKFqMSFRVvwKmsw+0yr/2gNuXGmCPirpRD3rZZj
 igdQ==
X-Gm-Message-State: AOAM530mE3G0RkvKQ6hL1KINlk53evE+8tCrOFPg7zxy7tqt8HxuR4eb
 1n9/T+pvoYsYh/p6eYT/9oEcAA==
X-Google-Smtp-Source: ABdhPJwl5nH8LRTLVmuwt3jjEf6u6wAk+fk7F9e5/kwdFuIWmjEVCSm55fbiwlWUNcV9cfrrwSJ1wQ==
X-Received: by 2002:a63:34a:: with SMTP id 71mr4572323pgd.289.1626934340483;
 Wed, 21 Jul 2021 23:12:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j3sm29949764pfe.98.2021.07.21.23.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:12:20 -0700 (PDT)
Date: Wed, 21 Jul 2021 23:12:20 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jul 2021 23:12:18 PDT (-0700)
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
In-Reply-To: <87bl6yrcmd.fsf@igel.home>
CC: tongtiangen@huawei.com, jszhang3@mail.ustc.edu.cn,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_231221_987361_06F057D6 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Jul 2021 00:23:06 PDT (-0700), schwab@linux-m68k.org wrote:
> On Jul 19 2021, tongtiangen wrote:
>
>> On 2021/7/17 14:55, Andreas Schwab wrote:
>>> Please use
>>> https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
>>> and run it in qemu with u-boot as kernel.
>>>
>>> Andreas.
>>>
>>
>> Hi andreas:
>> I used today's latest mainline code and .config provided by you, and I
>> can't reproduce this panic.
>
> Did you test it like I said above?
>
> Andreas.

I'm getting this on and off, with just 

CONFIG_VMAP_STACK=y

on top of defconfig, when running on QEMU.  It's not showing up right 
now: I'd thought it was an issue with that initrd patch, but it went 
away when I re-ran the tests so I'm guessing it's something 
non-deterministic.  I'll try to take a look if it comes back.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
