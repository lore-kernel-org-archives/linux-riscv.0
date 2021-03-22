Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0962FC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:44:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4783B614A5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4783B614A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SaiYvQpIEebKdjcRGRO0f7kOW6CVihSacEjbK3oi7XY=; b=TFLKGVJMJocoH6Phu1tmhgSOy
	hBcqB2cbjELeMe1ksJxnyvmKxp/4cpm8wv7Kgtxz2StKHbyL86qvQfCOZL3mv244aqTKVQ4ZcxNjI
	zl7V/3Yz+7yrujUtA1MrX/5It5eXwCuZZhmBSHaVEW6FRFicnbYExy5q//WHyEjpFIRiODm1WGkLr
	LbxPwPFblLbEfm5DMS6zcAewB/XxS7RQ76+jCKfNKCy3kd/yRnMaB5waiClfYSMoy6Nj5QQ7hZPz/
	9B0Q55PUvahjTA6rO7gr5INSOK2S9NMBFkYWDdxb4Sce8Gf7/6QUQc531OqwNGJ3W61fGr/9DcBTw
	chhYndzEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOEI7-00B2Yu-PR; Mon, 22 Mar 2021 06:43:56 +0000
Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lOEI2-00B2XX-1N; Mon, 22 Mar 2021 06:43:52 +0000
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 12M6hOLA021274;
 Mon, 22 Mar 2021 07:43:24 +0100
Date: Mon, 22 Mar 2021 07:43:24 +0100
From: Willy Tarreau <w@1wt.eu>
To: Randy Dunlap <rdunlap@infradead.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 colin.king@canonical.com
Subject: Re: [PATCH] tools: include: nolibc: Fix a typo occured to occurred
 in the file nolibc.h
Message-ID: <20210322064324.GA21253@1wt.eu>
References: <20210227224435.21315-1-unixbhaskar@gmail.com>
 <3a9e310f-2a5b-9fc2-cd5a-222e2ed353e4@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a9e310f-2a5b-9fc2-cd5a-222e2ed353e4@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_064350_519656_841271BD 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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

On Sat, Feb 27, 2021 at 02:58:18PM -0800, Randy Dunlap wrote:
> On 2/27/21 2:44 PM, Bhaskar Chowdhury wrote:
> > 
> > s/occured/occurred/
> > 
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Oops, seems like I missed this one, now queued, thanks to you both!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
