Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB39C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7cx44NLZMaXv4GTmMvhHOxL2hWN+oNUAkIjWKyYwwQ=; b=eriUH892U0BB/2
	AsszTxznWOLYDzehFAp5TMdYpCukMekOHKeCQaUmtgG5CAqGY/mUXor1N1l6Fn4OtraN4Ugx8uqzR
	p+H0s+hvGjqGdb9TWVGXZg0w7FhHPPS+Mm1RmHOB75AmzxOdio/FAHiyS4a84jqIoZTwYARb5WiLY
	eAt7CWQsvKtHx/RVMq3gP36Jg0t3M8+JF7puFhaOXOwBOomxedWz7lZCFk9lQNagOswZE7PRxxwI+
	vkRcuMnADV3+krKQIJaeaEvViU0oaxtPSbVHAUeDCbUagcoq8cW+3H2EHspzVzc2zJUioMFshPCJY
	5+GxYr2FzCZHHFvSXi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSCsS-00BhEc-4b; Thu, 10 Mar 2022 07:06:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nSCsQ-00BhEG-A0; Thu, 10 Mar 2022 07:06:22 +0000
Date: Wed, 9 Mar 2022 23:06:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Michael T. Kloos" <michael@michaelkloos.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Message-ID: <YimjbmdACoQOk+hj@infradead.org>
References: <20220309052842.247031-1-michael@michaelkloos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309052842.247031-1-michael@michaelkloos.com>
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

Why?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
