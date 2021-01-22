Return-Path: <SRS0=nHLU=GZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F0DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 03:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4442310A
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 03:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4442310A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0tZNmH/sHaTHKMeXOOI6GOaY3F5kia/ON6itBwecjiE=; b=mNvNGL8CLogIlagz9mr1oF59Z
	+OeyiybwJ0lJ9O/TfuZdUBdmarhV4kzFhLtdTM9Bn+kpnYRmW6LeLnWzrQXmkKLKOcIU4BLvjgl9g
	i+6yUW1ieuE21+0TQyghDfGzqYM3FH51QpQBnQoI0Lv37ZaCsls9bnGT3IvP8FBInEEPjEdaO/C/S
	kghVQatidbVeR3an+PGjPC7ys9gJG6HWMq5PXCFLhEtAsxp6jjONi7mDOqc8/PC31rVujIHMJCjJM
	xGV2FBgpewLSLPyI8xdiTGhbSpPt9ljGXXarM2+p7U5LPdElgozIag4lsNYEbl2V0HfA0mbVtVjWe
	E63FSr6eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2nWz-0005BR-5d; Fri, 22 Jan 2021 03:54:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2nWw-0005AY-DI
 for linux-riscv@lists.infradead.org; Fri, 22 Jan 2021 03:54:39 +0000
Received: by mail-pg1-x534.google.com with SMTP id n10so2782829pgl.10
 for <linux-riscv@lists.infradead.org>; Thu, 21 Jan 2021 19:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jOrbIBu6GQL9pFgpjOIIqB0ulg2pJUW8VotnW9CheWI=;
 b=a+FPlrUqH07Xw7zSLfrtqPr4/oMoRYPNtUoUuQ/mhMmzhqk9sPSmwz69p8HWFTDNDk
 3QjAuNo3dt4SzvfQaCHY8nHRQrOmO7bTPd4Oo8K2G4ZVnNgJGk7ipSNXX9mJZTUi3c/A
 HZP2yQQ0MxUjPPUmKn0VGrqn4C8pMXVm5b848bUHYThYvyGd0UfZjw0rm2y7hhq0d6zX
 8b8tPZzgCdAe/pYTbh9GDq0wEdMiOaWBHMrE8W++NgUUl8lSdyi72znTSlVp0JnclMC/
 YyTUH46MPcb7X3LKHo6R74xtUaw3ftrXk9OSmR9mlJREEVc2y5sAHthkz+OlRULNEplh
 V8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jOrbIBu6GQL9pFgpjOIIqB0ulg2pJUW8VotnW9CheWI=;
 b=ZUCsOcGjwTR3FvPZltv9+Jxwx+2tjBXaACluWXrCUvBAc574TlZ+nGlcBKVUFqEFE4
 MdyW07EZiHwG03S8ouokwdq3XGpblBaXGmd1fuHn8OSgu4VY+DsJqGmTCeKFARqqofb7
 zjP2CEyj2XbTa45YcjarXvHAY+ysQhEKsPgktTa3YLmwi2kAJC1BhgR8C1D/zvAdM3pb
 ddrk2JR4B9ShQDgJqAXAA6WPasG1Nf9VIhIXDpr4StMi5pP3piBLXCZ2K/RfIgRh/kCj
 wg6yZgttDc5qqPbY8/l9EFcc4OjK0g4wvuTkBGGl23+ZS/SnNVvgBdvNxQHve3G/lcQL
 giRA==
X-Gm-Message-State: AOAM532lziGAAYqqtb/iNxay0dnrDCy1AVjAebNdL99G3Lu9va7V8Ww6
 nJL9zuFNWaucMgirfb2sRW60ow==
X-Google-Smtp-Source: ABdhPJwyahO1mByKlqr7MqMrNLRMxPvHpbz4q2orBvyt6om+odZWj/zQQHqyK1i2ehWqy71Zeu7Wxw==
X-Received: by 2002:a63:5720:: with SMTP id l32mr2771710pgb.64.1611287676204; 
 Thu, 21 Jan 2021 19:54:36 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p8sm7471230pjo.21.2021.01.21.19.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 19:54:35 -0800 (PST)
Date: Thu, 21 Jan 2021 19:54:35 -0800 (PST)
X-Google-Original-Date: Thu, 21 Jan 2021 19:54:28 PST (-0800)
Subject: Re: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
In-Reply-To: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-a296f73e-1f6e-41de-8e6d-73d21049acfc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_225438_516581_DF01E1F0 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Atish Patra <Atish.Patra@wdc.com>, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jan 2021 21:46:02 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Use the same implementation of initrd reserve to avoid duplication.
>
> v3:
> - split into four patches, suggested-by Palmer Dabbelt
> v2:
> - fix build error found by kernel test robot
>
> Kefeng Wang (4):
>   initrd: Add the preprocessor guard in initrd.h
>   initramfs: Provide a common initrd reserve function
>   ARM: Covert to reserve_initrd_mem()
>   riscv: Covert to reserve_initrd_mem()
>
>  arch/arm/mm/init.c     | 43 +--------------------------------
>  arch/riscv/mm/init.c   | 54 +-----------------------------------------
>  include/linux/initrd.h | 11 +++++++++
>  init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 95 deletions(-)

Thanks. I have a shared tag with the first two on top of 5.11-rc2 (the start of
my for-next), which I just merged into the riscv/for-next.

git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git -b shared-lib-reserve_initrd_mem

I'm happy to take the ARM patch if that's easier on your end, but for now I'm
dropping it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
