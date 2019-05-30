Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5E9C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 16:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F2525DC5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 16:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIdA3toK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F2525DC5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onioHQ9GEtmFxXqB3cIKM7Z0AI3G/pLFLpo2CZnLIbc=; b=LIdA3toKej70L2
	+dqDGimd6OLNepmnIap54bEvD3MjockFgkCDiV6Lui57HlIlBY9ASZRrIY66YqtyZKmBeyzVny8jA
	G7csglAvVTRLFYQawFpAGQyl/r062ZwchB8FGToy3Sc7404ajGlgJI4mHc3uHJN8zNsHSk1AnZmWx
	HTP5/7Qa3L9srZ6j3Pzi/nWFFt+z7f592+H/a5ZC8AUVfTD9jOkrzzHPHPoxexbdLfJk54hcAqvoB
	YkFpGNJiR3P2yf6kTxlqG4Vsclwc42WLuBGdYvGxELQakz/4iIH4UQ5bRVm5SZsIPBdUM9e0GBRMb
	2x7opIu4IrvK7/R4CZhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWO3d-0000LA-Nr; Thu, 30 May 2019 16:37:37 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWO3a-0000KV-S0
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 16:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0180341;
 Thu, 30 May 2019 09:37:32 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5CFE3F5AF;
 Thu, 30 May 2019 09:37:31 -0700 (PDT)
Subject: Re: [PATCH RESEND 5/7] RISC-V: entry: Remove unneeded need_resched()
 loop
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-066fe6a6-4d0a-4286-bc01-faaf21ff2698@palmer-si-x1e>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <1b251faf-0b5b-2972-1bfd-9d40a8fd3609@arm.com>
Date: Thu, 30 May 2019 17:37:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-066fe6a6-4d0a-4286-bc01-faaf21ff2698@palmer-si-x1e>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_093734_914946_E5590E48 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/05/2019 05:09, Palmer Dabbelt wrote:
[...]
> 
> Sorry I missed this the first time around.
> 
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> 
> Do you want this through the RISC-V tree, or are you going to take it?

Thanks! It's a standalone change so this would be fine through your tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
