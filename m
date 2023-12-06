Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F49BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uBPtTr7ItbjbKVZ4IFOrBeK96LKDLctxNXNy72C0xO8=; b=ZCnPyauuGdiNDLk42gGmU25WcC
	alocYPoBUruwUQ963CNdGA2A7NsO63kYBV6G1+uOWGZs1Gn5toAhz+3M6LWgOx4rRgASIOBw9rfFL
	WkYqYFrCfwfL6kjP7iwKlgelRneuDMQpluLfctt2BZV5aRBWrjIihU7F2hp3oxF2D1O+KgBz4irsh
	/ofamws89MqJ2PVryLFj0pSEcA+Gp+Zsh2KkejO+EtmcHGEpw2GeNYAwbSSLdwI+GQGvMWccqKe0f
	1a/a70GU67Id+5cRBWAWgFBpPal8vewvbamR1eokgcQ4alM9gER0WXNsBZkUX2VrRgZ16qOUfQomp
	8u88lecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rArjV-00AMqZ-1M;
	Wed, 06 Dec 2023 13:14:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rArjS-00AMpn-14
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 13:14:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d04c097e34so6913725ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 05:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701868467; x=1702473267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m8NNJ96xoL22f3J2mj0pcMGx/C1e265J+kyF1R2z8o=;
        b=dbSYdWxEePb1FIfEyyzfq+LTw9Q0JOVaS+ALS35+VC1vXOWGhd6V1SvDSxAMgMAmxV
         WlhGvKkbksvqO1stz/fARb7qqBZSrQ73YRjDM/h7F2eRiDGOetVxWhRzMxLYZAtjqmRI
         O3QiJRL4n1Xa1TlnUg5+AMlseH+KFe8KdCqZl2H6QYauu/dybRBlUhDAWFFCxi87wQyb
         OeeFcSMsE+gfRrF8+l3ECcj2E1w/AaE/QZjUTqOjVgiMzNPi65XKKhOmgNk8RpxSX2eK
         qq3H/udT8IxYK9d3ZDSZZ8JF5IRR7SNGJ/nq1a87EVHJq3TuatenWoWARJTi3mHXr2tR
         bhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868467; x=1702473267;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m8NNJ96xoL22f3J2mj0pcMGx/C1e265J+kyF1R2z8o=;
        b=vxo4kIRVimL8oKkbg5osNuHgAS0qA3yrbPigJU+6lcQnhAJlLAQhwVZVEBZSbNAH/I
         xd0TDy3eDSgeQaYsn5CBrNnvYzijEmQ2naD1TvYdle9/9C/mzrv9lDQIN7mzYhjFzem4
         PvolkyCG2UPmRNzzBzIH3HEoihF1VCLyldlAMd2QzEXK/EG0Lg6SDNU0Urp/U5mEFpFl
         IXKo48IrHYqGD0xlnFdAuz0hb8RkkFR1L5SKtbBHA1F0g2GH1KJyqJd9EjlQFsMUxkz6
         PSzGToNXgza0OHVUBFrzkK7IeQNqaNv+kXykQPdomAhM31a/C/E+0Pg4lOl+hUn9WCJy
         7IxQ==
X-Gm-Message-State: AOJu0Yy6uT0R0mJ+tINQL+tJBExIxwqW58vR1yuPKjpnPEN2XlGA64Ps
	ZFXoxnfSeRcnBMS32ptbts3HTQ==
X-Google-Smtp-Source: AGHT+IGta2bhw+7qIoVXmqExA48kB41RdGIfu5QAI9yipmpTWRjYPKmvmMdYnIurBqPfmflvyEFyTQ==
X-Received: by 2002:a17:902:dac4:b0:1cf:59df:23e with SMTP id q4-20020a170902dac400b001cf59df023emr1270027plx.12.1701868467222;
        Wed, 06 Dec 2023 05:14:27 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id p24-20020a170902b09800b001b86dd825e7sm12082582plr.108.2023.12.06.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:14:26 -0800 (PST)
Date: Wed, 06 Dec 2023 05:14:26 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 05:14:24 PST (-0800)
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  akpm@linux-foundation.org, keescook@chromium.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  llvm@lists.linux.dev, linux-kernel@vger.kernel.org, samitolvanen@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samitolvanen@google.com
Message-ID: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_051430_388806_0C50288E 
X-CRM114-Status: GOOD (  16.36  )
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

On Fri, 29 Sep 2023 14:11:56 PDT (-0700), samitolvanen@google.com wrote:
> Hi all,
>
> We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> even if the hardware supports a larger virtual address space size
> [1]. These two patches allow mmap_rnd_bits_max to be changed during
> init, and bumps up the maximum randomness if we end up setting up
> 4/5-level paging at boot.

Sorry for missing this, I'm just poking through old stuff in patchwork.  
As far as I can tell this is still relevant, the discussions are just on 
the mmap() bits (but we'd already screwed that one up and have since 
fixed it).

So

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone else wants to take it, but I'm OK taking that MM patch 
with Kees' review.

>
> Sami
>
>  [1] https://github.com/google/android-riscv64/issues/1
>
>
> Sami Tolvanen (2):
>   mm: Change mmap_rnd_bits_max to __ro_after_init
>   riscv: mm: Update mmap_rnd_bits_max
>
>  arch/riscv/mm/init.c | 6 ++++++
>  include/linux/mm.h   | 2 +-
>  mm/mmap.c            | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
>
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
