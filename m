Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047EDC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 01:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E0RznW9joK5gkmiufN7dhblhuXY8FCO2RSk3E7R3WSk=; b=VmS10ciwvcbkIVg4lYFBm/fhZK
	u/U21XYzYwRDWhYLxOSmcEfItcqpbwDLam0B82ul1EIcXzqO6Lw1LRvUOFHF1qhJvN+puyGA0fTQ5
	oX6eFjt2E9UaKK7mRbbBq85hORBU5WbQukUaHOv0uodS3AsA0nXUMso5TXh61eF4qxnG0P5C9lnU/
	RTbyF5fyauGs9I2pPd5QW212M9JETW/3aK7tMpfwqh7XfVZbE6h+6BRw/twj4fCr72yz9a7RPFJzN
	ysESNk7ndXeLLGMAKeBxgwbzGZMoryFi6oX46LTFmPaI3RkmlIJGmIUFqfe9aReadJh239rHBXpZ8
	fibHOGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFKS-00GoNb-KL; Thu, 06 Oct 2022 01:05:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFKP-00GoLC-Fg
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 01:05:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id w2so710700pfb.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 18:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zz+HXUH9nJdRQI27LUzdzL5vjVdFK5hIVfPKFeeoWM=;
        b=W9oFKSvSZBKTpp5k39eldV09BnQECEr2wHfFrvrRQgGoVKioiKSxy5PDXDUUj/8Xt3
         9c1MyIGFLZTP7y2nr3TdvhWoyXOADfH9j9xQ1Mffq+LUDliHqXuYfkC9wcaugdvVc3ap
         TVN87T4LRGGzuRU7BxBS9fP9baNIjA2Bs2UoB08USts0LQbGyopR9+iqfXXj9TljNKj0
         tBqaUnJsmrbqMrzcjnnIVu1qJULfNRwpvDGGrse4+ZHPZrx3fTFFvn2uIbon9ESJJRxP
         QBhx7mCPg8xqajVIJ/0qq34dQRZI/iaUK1AnKSI93ch0R45vwIGOK8E+D/WWj6934tmw
         bBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zz+HXUH9nJdRQI27LUzdzL5vjVdFK5hIVfPKFeeoWM=;
        b=4bmbxCLYFYEOLNdNfRfPDJQ/lss85XhCqMNaREM7cVwU4iJbDvc9idqkvBiOOC9FE7
         oFaPgazrKZof0mrZt6MiIwpkNJ9tAu8+JRnuEo1ZidjZDSlhpt4UHu8dQwTCBduwz2Ty
         qAHccwa1wJnzWdUtbTvaWyuyf68JCcZiC/5hUAW5Rv563/gLrXpCFc3JY9dtKma7JWcT
         rhTVN+WOro0iWzBotTF0C9A30eORG3DgWeTWXc0KJMnoJXuAIlHjkOq03AXl3ZzOu3Kr
         oKki9bNEpFRCaXcLCvtc4pxwiTYT+aVQeAbGlehuczJZTGNZNxdljoxXm2D856n4ZUxZ
         13kw==
X-Gm-Message-State: ACrzQf1zk7nC324/g6YWS62OI39VF4uJtioJ5qjAeCUI0FWBCwKhIkeT
	0NhxMNUwtrJhEHvCFAxyA/x5gg==
X-Google-Smtp-Source: AMsMyM6867A5+juCRxIx5ivLWt/uRwuXH1Hj6A9x9CUunC87zaZwVIr1m2g/SEds/0zZtclFDhUAAg==
X-Received: by 2002:a05:6a00:a01:b0:561:7e74:11b3 with SMTP id p1-20020a056a000a0100b005617e7411b3mr2084194pfh.35.1665018331640;
        Wed, 05 Oct 2022 18:05:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e2-20020a17090301c200b00172ea8ff334sm11129483plh.7.2022.10.05.18.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 18:05:28 -0700 (PDT)
Date: Wed, 05 Oct 2022 18:05:28 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Oct 2022 18:05:20 PDT (-0700)
Subject: Re: [PATCH v6 RESEND 0/2] use static key to optimize pgtable_l4_enabled
In-Reply-To: <20220821140918.3613-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
  vincenzo.frascino@arm.com, alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-30c89107-c103-4363-b4af-7778d9512622@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_180533_786541_9FCA2681 
X-CRM114-Status: GOOD (  22.23  )
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

On Sun, 21 Aug 2022 07:09:16 PDT (-0700), jszhang@kernel.org wrote:
> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> boot, so static key can be used to solve the performance issue[1].
>
> An unified way static key was introduced in [2], but it only targets
> riscv isa extension. We dunno whether SV48 and SV57 will be considered
> as isa extension, so the unified solution isn't used for
> pgtable_l4[l5]_enabled now.
>
> patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
>
> Since v5:
>  - Use DECLARE_STATIC_KEY_FALSE
>
> Since v4:
>  - rebased on v5.19-rcN
>  - collect Reviewed-by tags
>  - Fix kernel panic issue if SPARSEMEM is enabled by moving the
>    riscv_finalise_pgtable_lx() after sparse_init()
>
> Since v3:
>  - fix W=1 call to undeclared function 'static_branch_likely' error
>
> Since v2:
>  - move the W=1 warning fix to a separate patch
>  - move the unified way to use static key to a new patch series.
>
> Since v1:
>  - Add a W=1 warning fix
>  - Fix W=1 error
>  - Based on v5.18-rcN, since SV57 support is added, so convert
>    pgtable_l5_enabled as well.
>
>
> Jisheng Zhang (2):
>   riscv: move sbi_init() earlier before jump_label_init()
>   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
>
>  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
>  arch/riscv/include/asm/pgtable-32.h |  3 ++
>  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
>  arch/riscv/include/asm/pgtable.h    |  5 +--
>  arch/riscv/kernel/cpu.c             |  4 +-
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
>  arch/riscv/mm/kasan_init.c          | 16 ++++----
>  8 files changed, 104 insertions(+), 66 deletions(-)

Sorry for being slow here, but it looks like this still causes some 
early boot hangs.  Specifically kasan+sparsemem is failing.  As you can 
probably see from the latency I'm still a bit buried right now so I'm 
not sure when I'll have a chance to take more of a look.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
