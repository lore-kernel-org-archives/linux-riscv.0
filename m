Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6506EC43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B7C21D43
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7aiFjB8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="tpgF9Rnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B7C21D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=q+uajtlqr0b9pGHDnw0cyohH64W/9d+ZivmNlppHZB4=; b=N7aiFjB8nTLyMvIDZuZjOhuuK
	HwUHafdPGcKgUci/q7b9xOeosPey/Wg89gtl9V3/2+4Z0ILgD1fKYrKjoDYnOKjWDuQLV312/ubl2
	Sc2+492Eng/HfqLxR6xfYKZBj35PmJaRqwBUoyIUWoEFsHjzv8lhQILK+VgI5HySyvyL7UbRCHtuT
	ACSFO8rFu44MgW+8Daxg+LfmanO2il7hA1S72K67CIykPXxgC4t4S6JqPhvUc8vimAPhXEAn3Yqt4
	Qp/b+8Wh/x2+7AhI/xpCw51OjGWSi5nnRyf4B4mVekzO/iaLYiLen/FhXcY2bg/qMnGn7GuxWBiCd
	LXiKIHW4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFsCk-0000PL-Mu; Wed, 09 Sep 2020 04:59:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFsCi-0000NE-1c
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 04:59:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id l191so1184524pgd.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aMuaqipRQnYeqRzhZrGBU6gZzBaakoxqT2EsHc4LAkw=;
 b=tpgF9Rnjs582RVO60tHFuThNeDv8r1D7N4z/7UTKHgifa+meHjtSqF6MmXDAlaZiRY
 nqqGXLS2Xx7cWbQmv2Tsmxav1QwUJevwRHbW/8KUyfLigIRgRiFxMOMkdVqiiwNzxsYx
 HZv8VX4R32LJJljOL4S9tDoE7X7QugRVxE6gWmn/rNX4xGHSm34XkIKVGyFUcnqj/rVJ
 MZCqNIjU3Xb7c67+Vd+6NMkgv0My+pdYPoAV1fN2XSlFAnJcs7acyWbru7ghUBDihK+n
 HA3KkD9a8MMJ3mptyenmxRBX4VAJkBNGBzhWly1gBbZAze1ERi77A0PrZNZBUWYQavE1
 4llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aMuaqipRQnYeqRzhZrGBU6gZzBaakoxqT2EsHc4LAkw=;
 b=ra8vC8BB0do5WW1E1DSm/Pcb9cHMNQS1R6Ks2DrhSVILhzo4+yn42csVzvpGP40B9o
 2H4RsAO0FMC4f356vo3OBTHpVXqPHdG2+UoxQqbhJK5Qqf0lvSJdMsjNxa8yuNpAJLxH
 t9wHjQ8aI61SjkUNQ1rQuttggjYda5KxSRnbwi8JbeeeIIVQoMUiAq5du81l4qdvy2dn
 sohd1D1wD9/cgMWzUGpYb7PK3t8Q/KXY/tlPR6WsGjU3YAw3JOyu8A1rJtsa+1CvU7E8
 lfFpMEVJ0XsmNjpSBQmkoaKQbtbEEWqUpEVjzsW+xUsB1XYekyT0krTLEEhXodTX/lxo
 xsoQ==
X-Gm-Message-State: AOAM533aNFrMCzeSmEB6ME1WmUcev1A2cF6Ua0ERX04nkIUPP0l3nzau
 7dyqrCkBCmvbkjdzklja8yRCGg==
X-Google-Smtp-Source: ABdhPJxDDE5ivT8UmvibDFe7q7gQD1F1no9tzfg8hTFhxtCkA6fy7IjVUDNFMcPuNzrxEIhllR0ZfQ==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr1997808pfr.96.1599627570285;
 Tue, 08 Sep 2020 21:59:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e17sm1043445pff.6.2020.09.08.21.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 21:59:29 -0700 (PDT)
Date: Tue, 08 Sep 2020 21:59:29 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 21:58:57 PDT (-0700)
Subject: Re: remove set_fs for riscv v2
In-Reply-To: <20200907055825.1917151-1-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-5fa86587-c404-420e-a4c0-43d197d1cd27@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_005932_152506_3A63BD47 
X-CRM114-Status: GOOD (  20.99  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 22:58:17 PDT (-0700), Christoph Hellwig wrote:
> Hi all,
>
> this series converts riscv to the new set_fs less world and is on top of this
> branch:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=base.set_fs
>
> The first four patches are general improvements and enablement for all nommu
> ports, and might make sense to merge through the above base branch.

Seems like it to me.  These won't work without the SET_FS code so I'm OK if you
guys want to keep them all together.  Otherwise I think I'd need to wait until
the SET_FS stuff gets merged before taking any of these, which would be a bit
of a headache.

Thanks!

> Changes since v1:
>  - implement __get_user_fn and __put_user_fn for the UACCESS_MEMCPY case
>    and remove the small constant size optimizations in raw_copy_from_user
>    and raw_copy_to_user
>  - reshuffle the patch order a little
>
> Diffstat
>  arch/riscv/Kconfig                   |    2
>  arch/riscv/include/asm/thread_info.h |    6 -
>  arch/riscv/include/asm/uaccess.h     |  177 +++++++++++++++++------------------
>  arch/riscv/kernel/process.c          |    1
>  arch/riscv/lib/Makefile              |    2
>  include/asm-generic/uaccess.h        |  109 +++++++++++++--------
>  include/linux/uaccess.h              |    4
>  7 files changed, 166 insertions(+), 135 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
