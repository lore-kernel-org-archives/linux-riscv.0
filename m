Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10E1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 17:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F65D20879
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 17:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIuio9jd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F65D20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFLPmgq9kfAKrNVTr6pdRiLKJmjyfe8ThIKdpBqHzoE=; b=SIuio9jdleG8/E
	jpI14bZEKi98fyBp36MXmK2D0VKK2y8CvgQYhBgYcIIad8XrlcoWKg7LYxG3xdcmzBqGM9W1VeogE
	5Q9wbBJjb0TAhyIp2eXYh+LBOWnyCucwym/gJdaH/hosdnZU5rw5TC2ra+QQyqiFI9cGHlTS+BcqN
	QoAKSDNVWnhko9eXdCU73ijtJ9WtKjLqhlGmWBtmp2iknzlOyb0zhL5d/+Pl9Sjfe2a7nKdHUh3TF
	fpl4X8DziBAHIAXdOg5zZA7yrgzTnhH+kbA921Ob5ltyvBJYk8CW0XzTeBeC96YPg62zZTjZ645vr
	+VkyxmhkVHYDC2quofQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7kNb-0003jZ-0e; Sat, 23 Mar 2019 17:24:23 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7kNZ-0003jE-92; Sat, 23 Mar 2019 17:24:21 +0000
Date: Sat, 23 Mar 2019 10:24:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] RISC-V: Allow booting kernel from any 4KB aligned
 address
Message-ID: <20190323172421.GA14080@infradead.org>
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-4-anup.patel@wdc.com>
 <20190323154012.GA25149@rapoport-lnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190323154012.GA25149@rapoport-lnx>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 05:40:12PM +0200, Mike Rapoport wrote:
> I have no general objection, but I presume the patch will be significantly
> simplified if the addition of 4K pages support will follow the removal of
> the trampoline_pd_dir. 
> 
> That said, I didn't look into the details, since they will change
> substantially, only some comments on the Kconfig part.
> 
> On the high level, have you considered using large pages in setup_vm() and
> the remapping everything with 4K pages in setup_vm_final()?  This might
> save you the whole ops-> churn.

That would be a great start.  That being said the current tiny memory
RISC-V devices don't even have a MMU, so the kernel pagetable mapping
isn't even relevant for them.  I'm just not sure adding more complexity
in the early boot path for a borderline case (MMU and tiny memory
with a tiny kernel image) is reall worth all the complexity.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
