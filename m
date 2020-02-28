Return-Path: <SRS0=IhIj=4Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A75C3F2D2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 19:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7DD246A3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 19:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fv4sv7ib";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5F/yKy4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E7DD246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8r4p3uPjY8ipkAQn1ylCVIulJUcKPwe/EVq0SWNR1Ew=; b=Fv4sv7ibrNLS7scMsAghjkk+K
	vhI5+dNUOUHibD0vkmTHKwIR2XnwouzkheWYvMKM0FeptK8QtLztpNjnegZnyb6RytuPbaydedMzE
	RThNJN8Nc4FYvG4g2+Axz7ocs+oPVl5fL+uynLv090Jaa1SJiE0nmejgmHIg/WhzqDDcQ+TL51Gy0
	YC4HcGNw2YD3T4Pdn8aCh6fLjwYLXaJ5o+eBOloiCPdiV8yTapTChigkK9Bz5QA/aSh6EYmtDBnrY
	tbBaMZeN5yxuYqen3/NqCISTFkRhM+qjYxu0P0UeArWdfUIAk27e5lowpWeyMwN/SxcgQ2Fuj9gg2
	jWE7Vy5GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ljp-0003ni-LI; Fri, 28 Feb 2020 19:55:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ljn-0003nK-1n
 for linux-riscv@lists.infradead.org; Fri, 28 Feb 2020 19:55:56 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E76324677;
 Fri, 28 Feb 2020 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582919754;
 bh=MakFTPH9cg/biTurBkagU97vmH60VtZBe1hHxBePVZM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u5F/yKy4EHFhl3zMm82ieNKTDMMVgGAjkf+ZiJrbrcb5joZ7Pi+z4ZZCugLYCl7WR
 R01eKZu1iSy2n7wHLmbc0aCUT5TLgf+fyWUkgdQOirobTMT2BTk9isobGSZqHuUQLi
 dcmr1ZjoZL/QWMbVjICEfD5xDpMnA9qeMnl13Hlw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1j7ljk-008qDL-I2; Fri, 28 Feb 2020 19:55:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Feb 2020 19:55:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [v2 PATCH] irqchip/sifive-plic: Add support for multiple PLICs
In-Reply-To: <39c1cd2c80d67b8b39fe6e2f867e65fd2d42f6d6.camel@wdc.com>
References: <20200221232246.9176-1-atish.patra@wdc.com>
 <6a1320aed9609788ccb61d6c66d670bb@kernel.org>
 <39c1cd2c80d67b8b39fe6e2f867e65fd2d42f6d6.camel@wdc.com>
Message-ID: <4211bc32ef9a2de376f96d9e4d6c05df@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Atish.Patra@wdc.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_115555_120057_468CE221 
X-CRM114-Status: GOOD (  13.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, tglx@linutronix.de
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-02-28 19:03, Atish Patra wrote:
> On Fri, 2020-02-28 at 18:53 +0000, Marc Zyngier wrote:
>> On 2020-02-21 23:22, Atish Patra wrote:
>> > Current, PLIC driver can support only 1 PLIC on the board. However,
>> > there can be multiple PLICs present on a two socket systems in
>> > RISC-V.
>> >
>> > Modify the driver so that each PLIC handler can have a information
>> > about individual PLIC registers and an irqdomain associated with
>> > it.
>> >
>> > Tested on two socket RISC-V system based on VCU118 FPGA connected
>> > via
>> > OmniXtend protocol.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> > This patch is rebased on top of 5.6-rc2 and following plic fix from
>> > hotplug series.
>> >
>> > https://lkml.org/lkml/2020/2/20/1220
>> 
>> How do you want this to be merged? I haven't really followed the
>> hotplug
>> series, but given that this is a pretty simple patch, I'd rather
>> have
>> things
>> based the other way around so that it can be merged independently.
>> 
> I am fine with that or
> 
> I can remove the PLIC patch from the hotplug series and include this
> series as that patch is not really dependant on hotplug code.
> 
> https://patchwork.kernel.org/patch/11407379/
> 
> Let me know what do you prefer.

I'd rather have an independent PLIC series that I can take into 5.7
independently of the rest of the hotplug series. This will make things
simpler for everyone.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

