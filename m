Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACDAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4eL65ZWyjmNykxT0Efw5u5W5Vf9HWP7uk141Joy7/Q=; b=KP++7h1/+zJRGD
	Tr6wf2GXKr8vrY+ijDzTkXorNXbhyx+COohuRw7n+XWyVBPZqMYRL9dq9d0N54PBlTeYVuN/SISpr
	Fp7+tum4APC9riM8hxFqWy5fc1nml9l3gOMFwKOtGrgX8f8gIYhUgZW4PnrH0tPNdwkccpaamahzY
	cWP7k0/ZNehQg8d2/6xCuiPSqc5JjIA+2TlfNQ3r0jNNinL76afW9xMm/8JQI4q9VMbUTupmqk53k
	iU/o1MqQk0goDK0tcDpBy0mROPqGI8eT18C/f7EZdog2Cfmc/aCzYy2PLbWzZBSQSfLo8q19LtW38
	BD241U8KMk6mTmYQS1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZri7-001dng-KH; Thu, 31 Mar 2022 10:07:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZri5-001dje-0m
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 10:07:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B6BAD68B05; Thu, 31 Mar 2022 12:07:01 +0200 (CEST)
Date: Thu, 31 Mar 2022 12:07:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Christoph Hellwig <hch@lst.de>, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 1/2] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220331100701.GJ23422@lst.de>
References: <20220307224620.1933061-1-heiko@sntech.de>
 <20220307224620.1933061-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307224620.1933061-2-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_030721_253864_8EDE4442 
X-CRM114-Status: UNSURE (   7.31  )
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

I somehow only got patch 1 out of 2, which makes reviewing this very
hard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
