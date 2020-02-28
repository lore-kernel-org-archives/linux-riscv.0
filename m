Return-Path: <SRS0=IhIj=4Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4530C3F2CD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 18:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87CD6246A0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 18:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwFbqufN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmQUO+iH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87CD6246A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q9i9IbZqvjGguozR+XVHfY/gAnLcYY/aKoIh2Fd5MvU=; b=VwFbqufNNISZceNHkt42wE8h1
	hswda1Vf+PXxT0uoZQ9uX4k6xhG26cLAUCdEo1b9+3zXgHSWXLLBNyTFnNYVVUCwKlsYxoF700zkd
	ByzuhZZZKe1f/kP4MOGUuIHbRNw87/3ddBCBBDLqA55LFlk6yi3Ze33yKVdQ22nhyT5YSKM+uLBKP
	GOPlCGfVlt74CD7TJu2FCeQngPBWV8eGyptn0tKsF/OGOuOhmjm7E00eeerJzCQexQ51MOv8w5cic
	ZHFbecgNNM9YyBpWg+eyZgJ1QQtX/Ty0AOu4Jd0LVo4o4fQj3gj2Ib7ApE1LXSioZ72mrDkNrbTtF
	Pt5hWu5/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7kll-000608-Kk; Fri, 28 Feb 2020 18:53:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7kli-0005zN-Sg
 for linux-riscv@lists.infradead.org; Fri, 28 Feb 2020 18:53:52 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84E1C20675;
 Fri, 28 Feb 2020 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582916027;
 bh=MFYr4JHDpIRMtAGtAdwhhoGsff0cKCIWBLM/1Gcb63g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dmQUO+iHish0Tcs0ly1N8gWrBeWUx/bWK4XIoBjBjGC42YW+8eImn1/AeKjBxJT4j
 o8CMAJ3wvo7ituwW8qUWlwcDQCUw0LbFUDBAZvTjrbG2nP6pXj4u9S3b5YDZwElzB/
 j8rz2WAx3sxeqlaueWBtRHdCCWeNPywrMNA7BWX0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1j7kld-008pcH-Pj; Fri, 28 Feb 2020 18:53:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Feb 2020 18:53:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v2 PATCH] irqchip/sifive-plic: Add support for multiple PLICs
In-Reply-To: <20200221232246.9176-1-atish.patra@wdc.com>
References: <20200221232246.9176-1-atish.patra@wdc.com>
Message-ID: <6a1320aed9609788ccb61d6c66d670bb@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 jason@lakedaemon.net, linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_105350_952961_4DD49C8B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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
Cc: Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-02-21 23:22, Atish Patra wrote:
> Current, PLIC driver can support only 1 PLIC on the board. However,
> there can be multiple PLICs present on a two socket systems in RISC-V.
> 
> Modify the driver so that each PLIC handler can have a information
> about individual PLIC registers and an irqdomain associated with it.
> 
> Tested on two socket RISC-V system based on VCU118 FPGA connected via
> OmniXtend protocol.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
> This patch is rebased on top of 5.6-rc2 and following plic fix from
> hotplug series.
> 
> https://lkml.org/lkml/2020/2/20/1220

How do you want this to be merged? I haven't really followed the hotplug
series, but given that this is a pretty simple patch, I'd rather have 
things
based the other way around so that it can be merged independently.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

