Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8B5C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfKVm5FPt8Kz4pQ7cTSGfaBA7/tPlxxdZkIz2LvD0Nk=; b=tkRYe5N4Uf0mNk
	mbfjucbJnwfXVxW7dT31DAuLsFO0inu77xEAzDdyRreasPGCqS2ButWrMptw71OCcyezGgfnwHpRo
	HigAIiBVV14ID7WXIF4ME85szzyn7qQIV96b1F2WQ0dvZ2T3sJiBP+1ialwwiKYfbVflDVSk3M6ne
	ZnJHN4ZF1vXcoscMfEPDp8AAOCX4u80/242Xbm6dReV3abGXUwDLF1RZlXhISpqI11d57BOMBmeLk
	zE8sEt9sgJDhF3kL+6T4glnlx45GiMtJMDaWxJLUjmaG4sMK0ggyyJH5Fe6I5M5vy7JC8jvvT2yr7
	4400jj5SU55exgQQ93Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ShG-00ASuR-2F;
	Tue, 23 May 2023 14:09:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ShE-00AStH-1p
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 14:09:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40E1961924;
	Tue, 23 May 2023 14:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F3DC4339E;
	Tue, 23 May 2023 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684850942;
	bh=35t9saet70NVn/nZc1z7s+Djje/zdpytl46XmhUm/Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3/6BK+IC9LETj04oeUZbTelqXTCkzVFzyto2ZYFzt+Zit+sWzRtyRQDoDUi/1mt8
	 jGipWZtklYaxIRvpdyeThyaE7pPKqMILFeVAp9HHDp78rThJauopEnnRQXjR8WiTg5
	 N98m/bzHQiBBheD40ESx6Ryf7tl9dL3sNGwKhkBuh14MBDxfvtt7m6c7eiJ7bzdGWK
	 7LybT59zL9qUTmMchtSgXrCj+Z8jNlgGFbhRkDHgqH3ThAR48Z2EuqkoSgHKc3bQE2
	 QaO5uj8g9xCV/iTq46w1zcxcfU5rrwMqKfKzeqwlvpi0N34elpuqwOvOrqOuG3pQQ9
	 GMJcl+kgtvuRQ==
Date: Tue, 23 May 2023 19:38:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Jaswinder Singh <jassisinghbrar@gmail.com>,
	Jaswinder Singh <jassi.brar@samsung.com>,
	Boojin Kim <boojin.kim@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	dmaengine@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dmaengine: pl330: rename _start to prevent build error
Message-ID: <ZGzI+gsYdF6kEHFk@matsya>
References: <20230523000606.9405-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523000606.9405-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_070904_670172_5B145CE2 
X-CRM114-Status: GOOD (  11.09  )
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

On 22-05-23, 17:06, Randy Dunlap wrote:
> "_start" is used in several arches and proably should be reserved
> for ARCH usage. Using it in a driver for a private symbol can cause
> a build error when it conflicts with ARCH usage of the same symbol.
> 
> Therefore rename pl330's "_start" to "_start_thread" so that there
> is no conflict and no build error.

Why not rename to pl330_start or pl330_start_thread to ensure we will
might not conflict ever!

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
