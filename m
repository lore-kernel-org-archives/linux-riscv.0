Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1D7E77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGwdlhSmj53o4wvxlALbhIBQHVTue/xYFCeRn3m+fKI=; b=ebsSGnIImQqI2O
	fu6NniNKxfBuuC3GKoW3tD0wpEMaHihAOpZ2OOcA4DQjTRWBa6N2d0sVcgSqpCyr3muuzsEn4K/6t
	aZzLioVBUkcqkkdyxl5yIo9fa8tIc1NSpQXE+La9WKuNnJYQ0w2POLKAcSz+r2di9ahJUEfOCUPRJ
	/NFK+dBClBHZxGTAsIJ7pOkOXxWEvqvjPVEVf64NeAuxzPcrWqlmcPcZ574y+Lhkk2ryg+1+94piu
	OVANWAaKt+vBP9SqHSuIW6iqhDq23k2SS5quj+RsfmxFLAnuZEnckkwYWvB5HhIyg5LannIEK+LgG
	eKRhzUkmBsflODWUFWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN3J4-000000094Hf-2YMf;
	Mon, 16 Dec 2024 05:06:10 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN3J2-000000094HE-0fI0
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 05:06:09 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b6f0afda3fso409399485a.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Dec 2024 21:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734325566; x=1734930366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyAlmSIue1yI2x6sqSoYtePgVLtgmXfHaAKBgrqewBQ=;
        b=SI4c0tZYtzeCkaL6EC1Brs8IU+V/sjGuu2mCNfD7HdoEuF2R+/iQQAecky9iCYnys9
         5u2yUiBHUDXv5Sgl2FTw8k2AvJCJu5S3ZUIE1w5CABVXC8bt4csCHjPCT7ggqU0eEx92
         jgLjmHxm6pIpgS75QJrm1fTGs+HOwXw773yg0Bl3+0ZnAGFKSHGgQ3bEFPiuY0hL6SAV
         f3GeEgnb1NeZL0OKey46iw6F9FTauouIBRJlmukKU6oGsU0bZxQGo3/Wt/jUVuJm61U7
         /Mq2KckiNuQGgcvvyJlfT99MWR3LJh9vlmTjee+OrjesNd28Si9yIo+vYuVrnwXlkTVL
         B2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734325566; x=1734930366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyAlmSIue1yI2x6sqSoYtePgVLtgmXfHaAKBgrqewBQ=;
        b=B0Ace54yk9xSW+N13gsJaZK26RqlNPl688E8vXXNIVxCtQy4GjRTW71OWvSvwFRHiC
         Tgdv69cTrlOQSbPCkVUM2ZtnPpiVO/+QJPSOwGBkgM0SoZCxgznRVaigA1peUehjddWM
         QgkhA5d9x3//vM9cgSonL2yte5VHdtrVO6+Feb7Ezo5qww96Y3+YQ1sEQ/0IJ+DwKVJt
         sCW9Em0V7ZYus64PGH+iP3w5/0YUjYzrb1LN0HKWSINJxPAtc2Vnbi4WccnH3GxRS8Wa
         h5TgeIc8JAhU+OiTq2eccqse0bWIxcuup5Fu/8WF1l41445UlcY2CWYcKmjPeIZZwJdy
         qL6g==
X-Gm-Message-State: AOJu0YwBWaZWaokeMShh3zrZzZXpq5yPDtVqMiKTU69L5I5k0tPiyZV3
	VJdDPLNZrnLEF4hRLhjbd4MYM3afl4zsQGirZ2QwhWpSbYBTQUD/
X-Gm-Gg: ASbGncs6FrGQWW5zwWWp9A+3wBtbweaZHrhH4eZblsl5OdfhP1M8elQvof1ya/lqhtX
	hkZBsXjRoDitVqB5dReb7QANCuHNnw8Olp9YKZ+ExTy6vczevfw3IDqmE5DEw/kVaSxGKyIp1cn
	K5UxATDNxmsO2JLnxcsIhxch2xkvIrb5xKJxpnEccnj/HYQ3aXcQDd/47L0pUM+L08fJh0tX0+J
	tm2jjSw4YfilZSHdTkFkH31GKmZTDuM
X-Google-Smtp-Source: AGHT+IF1V1JDBT9DxBXnKsSb9FGOSWHTVrkLz4gC4NnnVANUPFlFTC911pK1N5+IlhRrLEkQEQ26SA==
X-Received: by 2002:a05:620a:46a6:b0:7b6:dd7a:9716 with SMTP id af79cd13be357-7b6fbecc698mr2294512685a.10.1734325566242;
        Sun, 15 Dec 2024 21:06:06 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048ca76asm191276585a.112.2024.12.15.21.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 21:06:05 -0800 (PST)
Date: Mon, 16 Dec 2024 13:05:48 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: guoren@kernel.org, conor@kernel.org, alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, leobras@redhat.com, 
	corbet@lwn.net, peterlin@andestech.com, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 0/2] riscv: qspinlock: errata: Add
 ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <ohjfp2mwenkmm77t3iwtd6xhuhiykcmumujknqme3yd7hyac2p@j6mi542lmbeg>
References: <20241214143039.4139398-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241214143039.4139398-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_210608_225963_D3B9FF7D 
X-CRM114-Status: GOOD (  13.99  )
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

On Sat, Dec 14, 2024 at 09:30:37AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The early version of T-Head C9xx cores has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> The orignal patch is from:
> https://lore.kernel.org/linux-riscv/20231225125847.2778638-5-guoren@kernel.org/
> 
> Guo Ren (2):
>   riscv: Move vendor errata definitions into vendorid_list.h
>   riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
> 
>  arch/riscv/Kconfig.errata              | 19 +++++++++++++++
>  arch/riscv/errata/thead/errata.c       | 20 ++++++++++++++++
>  arch/riscv/include/asm/errata_list.h   | 17 -------------
>  arch/riscv/include/asm/rwonce.h        | 33 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/vendorid_list.h | 18 ++++++++++++++
>  include/asm-generic/rwonce.h           |  2 ++
>  6 files changed, 92 insertions(+), 17 deletions(-)
>  create mode 100644 arch/riscv/include/asm/rwonce.h
> 
> -- 
> 2.40.1
> 

It works on SG2042.

Tested-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
