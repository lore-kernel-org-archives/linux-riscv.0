Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F11EC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F80E2084F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZOyQHn09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F80E2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqhaHQwwJwMClk50+VBxGFWK8wM1elvGQ5uyKFGXyWc=; b=ZOyQHn09qVU8qk
	9fl4997jw7oYA8LBQq/DujI9bbzFx1cT2y4Kkh/E7X9lO/QyX7OOBKYBeGsVyqVVlIeTD9bJI4QPW
	KMe08WvJERx7EHXHQ/YbAX6upktHzpubketGzUnIu5MizJA6Vq3IYhbfEIygazkyKFBd3DcxAPcDm
	kS7Wd1kmbmuwAbgOOuJ2msfLClTuBd97356r/y6B+MNSt3dT9VtbyUoDLk48WP1jSjdGf6bENgrnd
	y49bYMpDUkYdlcsBQnoqX15HZsQr73MMOm+mWkcCEvjRa9EPiU5UalaAc4JBm5EmKCs5J/8bgzVZ0
	528X3+infbw9YkWhPjFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJatC-0003i3-D7; Thu, 25 Apr 2019 09:41:58 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJat9-0003hc-Tx
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 09:41:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286C5374;
 Thu, 25 Apr 2019 02:41:55 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24A343F5AF;
 Thu, 25 Apr 2019 02:41:52 -0700 (PDT)
Date: Thu, 25 Apr 2019 10:41:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/4] RISC-V: Implement nosmp commandline option.
Message-ID: <20190425094147.GA6585@e107155-lin>
References: <20190424214801.18880-1-atish.patra@wdc.com>
 <20190424214801.18880-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424214801.18880-3-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_024156_100554_79076A92 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 02:47:59PM -0700, Atish Patra wrote:
> nosmp command line option sets max_cpus to zero. No secondary harts
> will boot if this is enabled. But present cpu mask will still point to
> all possible masks.
>
> Fix present cpu mask for nosmp usecase.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

I just noticed RISC-V has CONFIG_SMP option configurable. ARM64 has
it always on and no option to disable :)

Anyways, this looks good.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
