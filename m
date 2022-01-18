Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6075C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8l+CHO+2Bgo7RpptfGjpH+zE1LydXixpJWZ+SnKdEGQ=; b=o2idCRZwc3JXqeZEr8CYnkGH9A
	zGqPn8IzqDYv/d5KKWPftICOzkqs35Xlo3ATyejJFw6rE7fp4KNqFrkSDS43ODz43gcjTfCMzQdH8
	DOmoVpQXd9eZ8HdIuuDYZTiJ88Ig+3GganXAmWHGcI9RMsl8+FQU8GAqh8IXisS0LbMTu2YjGzrR0
	AMP0/g6vy8JXXkoCNxCJfZO3NOuD1hij2psBczRChUUvRfEXO+OK0V4l+zNj1utSCRtETSOJGl6vF
	d+zW3B2kiNh0walgrFrVqwQkn3pSN35VcE88SZgORn/Tr6Mnkrr5sYhNpwZCAFCl9mFOFYptzgnxm
	oUECEkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9twn-002kT2-0R; Tue, 18 Jan 2022 19:15:13 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9twk-002kSN-Ig
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 19:15:12 +0000
Received: by mail-pf1-x431.google.com with SMTP id i65so207854pfc.9
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dpimc9u9mWkTK2A7AIN/PlilWYzlyB0scr3gag0ePtk=;
 b=CfkJVLW4r80ivRVQPJwJKCrpdoVWkBV++jB7iUVM64kpcJgpAALPeiIScDIO3d31ms
 lN6LoDSvcfC/9yTipXqEtuZ4ykX91Jut5J7rP3MMqXhgbeiKzNqVeV7/2gW1d2wwpn0z
 ndpBjQx1ABZI/B2dwtU45Tcy7zk6ZJunfbvj695FUZzzrhNKnLWZKozy16vEGHPZqZD/
 ZdmQmlucYW9dW+W7/uw+NiPNFmfJsIRCLJNKdOFVzDWRXTPo0NK6EF47jD0G7sRkmnMa
 Azf0PDRGSxYFwUPbUej0tAw1vpv4E8WPiZpFzMA/8us7qK7cEaMJQ7OXHSMxfskYm4Y5
 vH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dpimc9u9mWkTK2A7AIN/PlilWYzlyB0scr3gag0ePtk=;
 b=jk5KVKRvLnzhKdZ+arNMn0Wbo/qBLb1rfa9mQILC68oSrAaHM0DjRU218KiVkSojFf
 8/7npzQH63JSER4sBgp/8sOehTi93SoS57AaCshkrBNGtbZ8oL7t5XMzkZE9jQeFrp75
 xJ/cB4JJAcX4DTtkvweQNmSIL8UYQZ95+nlsJ2w0s8saGrQHK1WE4voOUajVxkcHDkyP
 HLnsFvszGSpCyVBtMrR+VImMUHrXrmqTXDhfsasoCv48l030xTv8BdDBv1rwnJfFX+FD
 jZCrPAgeJWb1shF1C0Le2F3jq6hjV/pBcDAPNNpykFPipyc3ROIDWFZDq2nxKlZwd6wc
 mhyw==
X-Gm-Message-State: AOAM533HFG+zXC4FBbDiF+5fUndnEid18GmSHSvcASFrA7hP3zZcJDO9
 i7CMgQkCGwXF27LEJRsj8YRHeQ==
X-Google-Smtp-Source: ABdhPJzt5P1Hi+ik4AbUuPNtdbsh5ykdqMC2K8UwzvX288Kd4zpJkeMi7TfOgZfnRVlS2NqHzscIqQ==
X-Received: by 2002:a05:6a00:9a9:b0:4c1:c43e:75e4 with SMTP id
 u41-20020a056a0009a900b004c1c43e75e4mr27279237pfg.83.1642533308696; 
 Tue, 18 Jan 2022 11:15:08 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id e18sm17402375pfc.150.2022.01.18.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:15:08 -0800 (PST)
Date: Tue, 18 Jan 2022 11:15:08 -0800 (PST)
X-Google-Original-Date: Tue, 18 Jan 2022 11:14:41 PST (-0800)
Subject: Re: [PATCH v2 0/5] riscv: mm: init clean up #ifdefs
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-56a04ad9-5ae1-412c-9862-071c4e1b8391@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_111510_693805_753F29D5 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, 06 Dec 2021 07:03:48 PST (-0800), jszhang@kernel.org wrote:
> To support NOMMU, XIP, the arch/riscv/mm/init.c becomes much complex
> due to lots of #ifdefs, this not only impacts the code readability,
> compile coverage, but may also bring bugs. For example, I believe one
> recently fixed bug[1] is caused by this issue when merging.
>
> This series tries to clean up unnecessary #ifdefs as much as possible.
>
> Further cleanups may need to refactor the XIP code as Alexandre's patch
> does.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html
>
>
> Since v1:
>  - collect Reviewed-by tag.
>  - remove the __maybe_unused used in max_mapped_addr declaration.
>  - remove the BUG_ON check of mapping the last 4K bytes of the
>    addressable memory since "this is true for every kernel actually"
>    as pointed out by Alexandre.
>
> Jisheng Zhang (5):
>   riscv: mm: init: remove unnecessary "#ifdef CONFIG_CRASH_DUMP"
>   riscv: mm: init: try best to use IS_ENABLED(CONFIG_64BIT) instead of
>     #ifdef
>   riscv: mm: init: remove _pt_ops and use pt_ops directly
>   riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL) instead of #ifdef
>   riscv: mm: init: try best to remove #ifdef CONFIG_XIP_KERNEL usage
>
>  arch/riscv/mm/init.c | 76 ++++++++++++++++----------------------------
>  1 file changed, 27 insertions(+), 49 deletions(-)

Thanks, these look good.  I've put them on a staging branch that will 
soon be for-next, I'd like to start from after my recent PR's merge 
(assuming it's merged).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
