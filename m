Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F74DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Raa7rpaa4cxEKw1c+fJT7+o/HAceBT96X5kohS6SQDI=; b=LecjbBhh7yyz4eyjnWAEjb3x1D
	g9QrhRy+DJf27LHuDOE/GDAZhT0DR7NuRF1LfW5n5p7KZVc8UgUMdw1b+hZ40S0UpZLMHddy88Ifh
	/59m72kr+cOf+vW8wLaBeRi2ZbvypMeN5CfN8wLVPHIPou2nym+iED7QWa/TYyaKiJ379iounXa8n
	UmcvaF5u/qzpO1ZMYe2BDhCaeR83SS51RFipiHnTtHT/VZ1i113QPxLRu6C1xbxZb9Om1jCaaoqBo
	cCUKepClHRW/TXOfeGdyTivMePDbo8VwCSalVhDOqgdl4KpAfznJ7boeX8nSUmdcKn6vgzr3EhqYv
	ng4ChQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns69K-00Dr5f-4c; Fri, 20 May 2022 17:10:50 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns69G-00Dr4R-Nl
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 17:10:48 +0000
Received: by mail-pg1-x533.google.com with SMTP id q76so8240355pgq.10
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Ap45GKttvVsGHFS/wF1zP7BioIstLCNnThX5z8X39SU=;
 b=AmOqY9EMw1Vy/sTkKIDmT5u+NbEkfEECcVzTCYfHt1+EsYNs1KDAfsDDSb97sGDqGW
 UEZbQZugt8DSxdMawFK1dsJ7c2zocR1Bc2wIizJ8rwkCelDZn/Fl2dqtKZGSnaTZ5LkS
 xizF4lU1YqhV+n9Wr4wFn7r/IjaGbZ3TV4WO7qDkaVa/+fmoUnWRys/0pE22Ut6ueDdV
 atGJ6pHtzveANT05O4WNemXHNihuISkxdSczPsU6ltS8YSGBxqrv2HQ8sKUlLm9zTfbn
 KV3oLxQmEJU2Rw+FIAxXVe1SOdjZA2k9B/mPZOJFK98JYmZ+LQu/Ud/hufkS4hXXaRL6
 +dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Ap45GKttvVsGHFS/wF1zP7BioIstLCNnThX5z8X39SU=;
 b=xUyK/w9OMg3xKQWDPeAsSGqaZG1R3lFZTfEOIE66UqOAMOBmsP540cbZjmit7EIj16
 Pd+0MQMLRq5VfMnBy0BUaf+wvRcNwXYa+0edPrVJdNj2i765KifY+KJjlE9uZcqz5h4m
 nm4bFm/t0K3fYL7yT1kjU8i5L0YxgfhgdSCg2ioVzfwLrvJiVQaSGlzYO0J2wR5pjmdl
 Ejpe0hBtV3/F7TSKPJnnZPi9Va9OoZFFu1qLRtSgcAa/wYxqZHoiJ9YJLwUEylh4hUGi
 8jXpXRJUxYTnFCJ34miu3yDUIniKripD4gKPsuMBG12W4CZDOOBqGfN49HjC3Urf7Stt
 D6Mw==
X-Gm-Message-State: AOAM532vsVjCz/yfj1BpmcW6wUOsEkVZ2jdShtAiwzVDZq52LXprT8qf
 rAhN5iCu61meaqQzCOqVxsHs+A==
X-Google-Smtp-Source: ABdhPJzxaDauczGNGH0lmX+q48ilhwnu+PuxmQKFEk3pa9D7WxYcc+R7B4WChKOzpwvaMrZYjX97Cw==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr11220235pfj.32.1653066643652; 
 Fri, 20 May 2022 10:10:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 g25-20020a639f19000000b003f5eb31fc4bsm15092pge.11.2022.05.20.10.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 10:10:42 -0700 (PDT)
Date: Fri, 20 May 2022 10:10:42 -0700 (PDT)
X-Google-Original-Date: Fri, 20 May 2022 09:28:20 PDT (-0700)
Subject: Re: [PATCH v1 0/4] riscv: mm: add Svnapot support
In-Reply-To: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
 panqinglin2020@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: panqinglin2020@iscas.ac.cn
Message-ID: <mhng-5b55d692-8996-4ae1-9a83-a28b09c108f6@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_101047_035200_0ADE824F 
X-CRM114-Status: GOOD (  23.33  )
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

On Mon, 11 Apr 2022 07:15:32 PDT (-0700), panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in Linux Kernel's boot process
> and hugetlb fs.
>
> Since Svnapot is just stable recently, and there seems no official way to
> determine if the CPU supports Svnapot at runtime. This patchset adds a Kconfig
> item for using Svnapot in "Platform type"->"Svnapot support". Its default value
> is off, and people can set it on when their CPU supports Svnapot.
>
> Qemu support for Svnapot has been accepted but still not merged into master.
> So the qemu which we use to test this patchset is current in this repo (it
> contains qemu Svnapot patchset):
> https://github.com/plctlab/plct-qemu/tree/plct-virtmem-dev
>
> Tested on:
>   - qemu rv64 with "Svnapot support" off.
>   - plct-qemu rv64 with "Svnapot support" on.
>
>
> Qinglin Pan (4):
>   mm: modify pte format for Svnapot
>   mm: support Svnapot in physical page linear-mapping
>   mm: support Svnapot in hugetlb page
>   mm: support Svnapot in huge vmap
>
>  arch/riscv/Kconfig                    |  10 +-
>  arch/riscv/include/asm/hugetlb.h      |  31 +++-
>  arch/riscv/include/asm/page.h         |   2 +-
>  arch/riscv/include/asm/pgtable-bits.h |  31 ++++
>  arch/riscv/include/asm/pgtable.h      |  68 ++++++++
>  arch/riscv/include/asm/vmalloc.h      |  20 +++
>  arch/riscv/mm/hugetlbpage.c           | 236 +++++++++++++++++++++++++-
>  arch/riscv/mm/init.c                  |  29 +++-
>  8 files changed, 416 insertions(+), 11 deletions(-)

Sorry for being slow here, I got pretty buried this round.

This generally looks OK, but we definately need dynamic detection.  It 
should be super easy to do that with the new framework, as we essentialy 
just need to check for Svnapot on allocation.

Aside from that, just a minor comment: it feels like Svnapot is simple 
enough that we should be able to fit it into the generic mapping code.  
No big deal if it doesn't work and I haven't tried to do so, but I think 
it's worth a shot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
