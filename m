Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9109606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jofCjbZ/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=xuB89//u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gju+1HYYUbWDr0s1HtL6i9pSzLvBUQqDF1hcgqRlBk4=; b=jofCjbZ/KD2FUrgBCckrUJ5v8+
	j/lnvIupBYD6+FpNYUmiPN41zWLgA8BesI+mWrIlIflNG2vSio7XaReKhce7VVJBeSAND8gAtNXik
	8FCbukkUdvehgVRl5JOMyWFW13BjxWSrSmvBkwFiECP9epjBmivTWhsi55RTKSjK/Oo3U0n/7yXhS
	6i/i7hG8sS4B05jf+o55+jDL88jjwofjOCq+sYEpMbt24W4RISwv8eEcUAtgyeNE5kDZaM/7aLZFC
	9pQUDuFJijutPPwUgEqAMXziBJsmZT3IJxDlrVDx18lH2iz2RtrSb8O4X3k9Npq5tfAExUJuOSo/Y
	nt8J+pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgWU-0000000Awig-15oQ;
	Fri, 30 Oct 2026 06:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgWR-0000000AwiA-1vxY
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 06:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84AF443DBD;
	Fri, 30 Oct 2026 06:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3AF1F000C1;
	Fri, 30 Oct 2026 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793343330;
	bh=OVfOJhiBuJkTiRJC5ASmF34dYnZgJiFJ6DSZ+ArOXlo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=xuB89//uo1UEibq3QfgB2G6IHiwiq+oF1UwZUei3D4anuztPm9je6n6tMN5ijd0T6
	 jlZWVbnp2PFF9fW/wRJDHl1jH4E3Qxuu8prQNOVIDjMac7Eiasaiw5jKZBkOCG2v7L
	 ZMGzCRQ9maTcfufIDB3pRV6Ty3QcYCBh/fXrg3KU=
Date: Thu, 29 Oct 2026 23:55:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Jackie Liu" <liu.yun@linux.dev>
Cc: glider@google.com, dvyukov@google.com, elver@google.com, pjw@kernel.org,
 alex@ghiti.fr, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, muchun.song@linux.dev
Subject: Re: [PATCH v2 0/3] kfence: fix pool allocation failure handling
Message-Id: <20261029235529.0a4a37da0ae150fcfd4ef954@linux-foundation.org>
In-Reply-To: <67833df2daf24cc413c212c14306b9230dde996f@linux.dev>
References: <cover.1793242457.git.liuyun01@kylinos.cn>
	<20261029182645.d6e7b119a562c973d19cda63@linux-foundation.org>
	<67833df2daf24cc413c212c14306b9230dde996f@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 05:55:21 +0000 "Jackie Liu" <liu.yun@linux.dev> wrote:

> 
> Also, Sashiko has reported an issue with patch 3/3.

thanks, I missed that.

> Could you please apply only the first two patches and drop patch 3/3
> for now? I'll address the reported issue and resend the third patch
> separately once it's fixed.

Sure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
