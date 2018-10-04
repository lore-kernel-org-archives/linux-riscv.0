Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C6CC64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 16:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194FC206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 16:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="soYmZiGz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q9oI3zw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194FC206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCPkmItw7NMO0Cm6qZ7jqLafv77263mO7/yrco3GigA=; b=soYmZiGz3dhBAH
	5it0WwaIz/sZc+9Q/yPKbIL3w/I0Mu5Dxckua6CGgP4HvXOOteDnXkvC9cs9bdsxUgvjZgNwCXc2y
	4dCx6Tb+BW8Nl7gVvnng8KuTg9oSnGzQ4NaZ2k0VhCRHmSlBeNYr2hBonzQe+kFqeJ7jHREI+ySYN
	BYnbQEPvbBkH6VwUImSVBx6oEMlcYWR+kmxQIL3kLYeWOHKRYGWOhAlDmuucwWx20dKcOHwJjhqLL
	wRMLavTvl5PAWqPw8HA1pjAo3SIFuCRzgaRTibFMcN5lJr1ubuIxTKqnT7UM0TV+52mIFxSILPm98
	fOgg8URrU0Z2xxoUxH5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g86QD-0004o9-MR; Thu, 04 Oct 2018 16:24:17 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g86Pu-0004Ss-Qg
 for linux-riscv@bombadil.infradead.org; Thu, 04 Oct 2018 16:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbi1Rzmu0D6/h0+xc25ldBESL/yrN9zN74+K0O98Ss8=; b=q9oI3zw1DbTuCXE6WYFara86s
 JSBMNzgkza84MnFn21Jyvd2e5sUqrzOpytz3vC/oCPny4Lb+c2E8JJKBi8DgNS4Gg+w+qKXamkQDH
 NBuar9tMEmfZXhm2DzB+KInNGm8QDVRuu4OLpV8UlbjGWU7v/Uke8QsQbxWlbzD3KpuCwaOand8BC
 gPujfGs27YXMeyyCK92y5XoisrlG2SH+84NP66W8KxjaltSkucOWRFQmPEhTk2aD9sbDI/G3ixzr0
 bJlFz9lQHi0ZaM4LOVL2GBiE4fJP/4gH0MB/Yf6/7ZN0xUsCpWNx2qjFNa4kdk8FzkfyevjtYesCI
 Jl9ws+BZA==;
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g86JG-0000I0-8O
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 16:17:07 +0000
Received: from localhost (unknown [104.132.1.111])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 1696C255;
 Thu,  4 Oct 2018 16:16:54 +0000 (UTC)
Date: Thu, 4 Oct 2018 09:16:53 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [GIT PULL] A Single RISC-V Fix for 4.19-rc7
Message-ID: <20181004161653.GA2543@kroah.com>
References: <mhng-cfdf26dd-f145-40fa-b698-efb9b65de276@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-cfdf26dd-f145-40fa-b698-efb9b65de276@palmer-si-x1c4>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_171706_446194_20361B6C 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004161653.RUUlpTlx0fcvzEP1HQ-OhNkR3l8vP4qMUBYUybVnENY@z>

On Thu, Oct 04, 2018 at 08:40:18AM -0700, Palmer Dabbelt wrote:
> The following changes since commit 17b57b1883c1285f3d0dc2266e8f79286a7bef38:
> 
>   Linux 4.19-rc6 (2018-09-30 07:15:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc7

Now merged, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
