Return-Path: <SRS0=e5NN=MK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40653C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Sep 2018 16:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1073720868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Sep 2018 16:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbvZBKV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1073720868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Z550f6lKsyd2K8raDhqpbb8WZXqZkJkK2WgbNvaX9c=; b=pbvZBKV0hY0ZvG
	B1sDrW9xoBo0uAZesWd42DHMLZeGAEB8laDEiOGZkZ5k96owvA56xr2MRBlbkuQqmzZRb/HzqAuCk
	DjAkROotLJErR20MNtUMynTm+2+BSSSQ+jqkg4Y5EHwb0ELGgQ4IWb1N+SAN9Vvvu0/bPSfiTceSL
	rIN5oCiHCQrUEY+3KSt08LZw8NASFAvVkWy6zUbOmRtDowOUJoqMAmHJ06314m/dgaOai07/JfhRQ
	pIjfDszG1iiaxvHN2vkyc+XtXbTi8d/lTQzFTsVOamA4bbMty3uWMZrMh4ccT81FD9jFnjtCIzR7T
	fysX7dnPmbuEk16Bw+aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5w5o-0007Lu-Jk; Fri, 28 Sep 2018 16:58:16 +0000
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5w5l-0007Km-RA
 for linux-riscv@lists.infradead.org; Fri, 28 Sep 2018 16:58:15 +0000
Received: from localhost (unknown [88.128.83.59])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id C8E8DE89;
 Fri, 28 Sep 2018 16:57:58 +0000 (UTC)
Date: Fri, 28 Sep 2018 18:54:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [GIT PULL] A Single RISC-V Update for 4.19-rc6
Message-ID: <20180928165427.GA12035@kroah.com>
References: <mhng-61f81f3e-1f1c-4b5d-a36c-caabba09a7b9@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-61f81f3e-1f1c-4b5d-a36c-caabba09a7b9@palmer-si-x1c4>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_095813_905252_045125FB 
X-CRM114-Status: UNSURE (   6.88  )
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
Message-ID: <20180928165427.rezpPYLPn1m8yGYAYxsJXRAhyl9joU-BIGJBlyoCBgE@z>

On Thu, Sep 27, 2018 at 11:51:07AM -0700, Palmer Dabbelt wrote:
> The following changes since commit 6bf4ca7fbc85d80446ac01c0d1d77db4d91a6d84:
> 
>   Linux 4.19-rc5 (2018-09-23 19:15:18 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc6

Thanks for this, I've now pulled this in.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
