Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55EAC282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A4E218DE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6U9h0a1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A4E218DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IXCG6IYVlQ5u8HHuASHFfQyIcXmYLPWuTjFkcL1jP4=; b=s6U9h0a1PJ1txI
	NzB2PVxirmlZfoJUpmAKW6MQ1qTj/2nKk7cBYB44rDY2lk/P8spWj+7ao9Ap284sgi2m1E84+gLz0
	EYTO+LSTq01dRgweRDIy+XesqG2qTMS6g0ihm9+2KXYYQ9kQPTT1fhzp16Bpup6Oy/W47fIHYvz4M
	jIps09PyFZsmm4E0BdMT5t08UTYocWZo787zbzr3WkJYW5V9vJUjQYo8EMIXeoiQV51Aj40sKVvWK
	azH76Fp7pQtUQn8Jr/j3V4k460W6KkpQUa659AGqmVg9jd9vC87pKJi5Pa2YIIWZ6f3ylkcIVmloy
	Eyfc/jFXK27JzpuhMI1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJbA7-00020I-7j; Thu, 25 Apr 2019 09:59:27 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJbA5-0001zm-3G
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 09:59:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39222374;
 Thu, 25 Apr 2019 02:59:24 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109E23F5AF;
 Thu, 25 Apr 2019 02:59:21 -0700 (PDT)
Date: Thu, 25 Apr 2019 10:59:19 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 3/4] RISC-V: Support nr_cpus command line option.
Message-ID: <20190425095919.GB6585@e107155-lin>
References: <20190424214801.18880-1-atish.patra@wdc.com>
 <20190424214801.18880-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424214801.18880-4-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_025925_153677_C0A9766D 
X-CRM114-Status: UNSURE (   8.68  )
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
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 02:48:00PM -0700, Atish Patra wrote:
> If nr_cpus command line option is set, maximum possible cpu should be
> set to that value.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

FWIW,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
