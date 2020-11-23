Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F8C2D0E4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:57:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAD3206B6
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mB4lSjAE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCoQxurf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FAD3206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=on4z/Xu3tntaI9dxL0lgU9uQA8lDTpCr881RcWtG3f8=; b=mB4lSjAEt10X04eKkCDJ6Qelj
	rp1HrsgavsUD5ImI8hgFKk9AWcYgSOwaDVPtKv7bT7U4g2nA1h6VsUhpl/4wKcdX/nfqg7AW+iw7E
	0tmD4/rYXx7cS+1o2SjNrtlnm3SHeXjoPSgP50eVMYcdXuBrbmQTIma9JhmDsA2z0EGOlbtsH65Od
	VNm12oOIsIYybXXVhyFL9MNqK/o3eAf4bnDZDNk1eqSUVKfHiENhrJD6BKUGSijQPHLDghDLV0/fp
	UNfo/Df8aKwrHfWdjZuT++zc4xmj6ZolBuBigephnaiig9i3QocTTwMwdDZGLDt0FjDfiUHQGrDZx
	mFXiyfp3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khEDt-0001me-1j; Mon, 23 Nov 2020 15:57:49 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khEDq-0001lc-3i
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 15:57:47 +0000
Received: by mail-qk1-x72f.google.com with SMTP id q22so17380670qkq.6
 for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2020 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oaD3pL1OtJi+9eSbHHJXjGs43nOeiSUGOxMkq8ggODM=;
 b=XCoQxurfB2CX4qQ8fUbEq7/y+zJhngDNSozPj8+SPn81C8i5+Eu4Mqg+5x85NfIfcO
 IDWD0Pubb3VAICx5GxYJo69VgBnBPFLUtU43TvoVuIC5Zme0XngCLB6UVq1QJhCeKsJu
 Vzd6trOsremvYZVNSNleh9ayXYLLKnkQ9KMuUokxumEK2Qxu8OS2zPLfjpj0ilDvhP/t
 ltXmv07fCoqwTavuxA9ayEoiz/Cy7UDBOccJuu2BBFYZx9kwLDgCJLiSe6dSB8rJ4mpw
 eaeAe6qTsauKxE72Gg0fJMpgA6Ci+0Sgq9zdqLneTS+5rLnteONMBR1Xn2Av9+G2lOwr
 9gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=oaD3pL1OtJi+9eSbHHJXjGs43nOeiSUGOxMkq8ggODM=;
 b=B9TsFJqN/HJuyBXaJMQyhwVtwgrqifs49Do+wJIK3BPZq1e+OKJS2NYlhyeYObK6gH
 pCDy2hgJ3qh2v26UxOUfy5KmT/TqAfwwr8YumjKcQyRaF4dKqin5aucXcii+BJesjQrN
 881uEDtNHUZQqSlZD3yyPn6NRKotTSMO32I6Z6zkG+blkhAVFNEOtzjeov03Ar8ltZ/6
 UZnuwp5vamNWAuyxCgjyo0Piql9r/u6dtbkuxNx7wjwk6X8BLol4eOHSZLlPd5Gp8C1L
 WwEPKBgHFVgdB0QncdWlYU3QAnoUqYnR5jCDenwJ4JjK47YZUVRLnc5lMll8vVkiB3PL
 yh/Q==
X-Gm-Message-State: AOAM532NPtOWysvX/ZgzISrNZZOEhnprN3NIGXgdja8sBrPda2ASu80w
 UPw/B8GZ9nduBzTRTlBIZHo=
X-Google-Smtp-Source: ABdhPJzSudN1GJrL64+G7FLrkQ9s9rYlRCI6M6Ui4ZE59xOdDhpLLxpyT7w8pvN7NpLFmAcj5D8HZQ==
X-Received: by 2002:a37:aa95:: with SMTP id t143mr73423qke.448.1606147062656; 
 Mon, 23 Nov 2020 07:57:42 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id c6sm10387865qkg.54.2020.11.23.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 07:57:41 -0800 (PST)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Mon, 23 Nov 2020 10:57:39 -0500
To: Sasha Levin <sashal@kernel.org>
Subject: Re: Patch "compiler.h: fix barrier_data() on clang" has been added
 to the 5.4-stable tree
Message-ID: <20201123155739.GA332532@rani.riverdale.lan>
References: <20201122192006.AC0272076E@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201122192006.AC0272076E@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_105746_216385_FCE8B67A 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: nivedita@alum.mit.edu, Randy Dunlap <rdunlap@infradead.org>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 22, 2020 at 02:20:05PM -0500, Sasha Levin wrote:
> This is a note to let you know that I've just added the patch titled
> 
>     compiler.h: fix barrier_data() on clang
> 
> to the 5.4-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      compiler.h-fix-barrier_data-on-clang.patch
> and it can be found in the queue-5.4 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> 
> commit b2a15cebf1822ff1ce0e390d45202f2231047ee2
> Author: Arvind Sankar <nivedita@alum.mit.edu>
> Date:   Fri Nov 13 22:51:59 2020 -0800
> 
>     compiler.h: fix barrier_data() on clang
>     
>     [ Upstream commit 3347acc6fcd4ee71ad18a9ff9d9dac176b517329 ]
>     

Please hold off on this. It requires a fix on RISCV which hasn't been
merged yet.

https://lore.kernel.org/lkml/20201117193053.18990-1-rdunlap@infradead.org/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
