Return-Path: <SRS0=Os/g=AS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB1BC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 08:16:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D2E9206C3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 08:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVypEibv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="NY41Kgrk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D2E9206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hIOEyFFtK7YK0E2jqaMAzt3PO8LhHoJoKBbThc0f/zw=; b=uVypEibvWGK9WTP5pQrcRmKvn
	KK7RXv8ryiFINUxy3c+dMZF7pSrFuO5BgW+rzzkKkNURvaPjy3QY2CRFz4nWxspbu5mithVYNPLHw
	qlnA45tU9hT2U4fygiuyEU0GLpaE7cbTLu83Lz66OhZ6n5/FM9BgsglAb0EoOE6EWl4KLpJEVB2Fs
	588FiMCiXss6tbh9jYuhP6hn2G8CZIMPaYnFzMWq2D7Y9YDstK+t90NU+egTJPOpuBk8cFrMc58tp
	XNtqCCBHijHvUssc68gh64J16WEEDIgz8XNF6ugAJ1NsrErWzCxkLWYv2/gqCA1tLtc4wqa0zVbs1
	olatx6lzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsim5-0000i5-Df; Tue, 07 Jul 2020 08:16:21 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsim2-0000gj-E0
 for linux-riscv@lists.infradead.org; Tue, 07 Jul 2020 08:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=EA/3cNstrWMDO33kM+6w6yj9HV+JpNqfCcL3vex3MqA=; b=NY41KgrkrgsH2VNw4Wic5NBxK9
 c433IFDrijCmG1B8UIlMAmnn6z5XT/rSqRN/mWZetxCKQPZpPI+GQPmNaRVCa+aRIIJHMa+jiETQX
 mr1BcuChG5I87In8K454cVqCgL5qxPMDnrBZ3c39F9zoBAVEPLXk+MNzFS94+07pP8anA941E6ou0
 QN7Hp8M0IFTRmOegfKWxLNg4oipRcjKN4iNMfw1OWj7lM8sH5Yzi5BQGJDef+4CF95vsX3PM+u0D1
 PJ+d1A8Famx0l00G7jd+937pJ+Yvnn7SUhs86TVTWNrpJAl8WlLkxV+ix9QdoGFrWcIvwcqHpm0VX
 0AbvaWrA==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jsilv-00036X-9u; Tue, 07 Jul 2020 10:16:11 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1jsils-007vhX-RV; Tue, 07 Jul 2020 10:16:08 +0200
Date: Tue, 7 Jul 2020 10:16:08 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] riscv: use 16KB kernel stack on 64-bit
Message-ID: <20200707081608.GA1889963@aurel32.net>
Mail-Followup-To: Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mvmeepoddt1.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmeepoddt1.fsf@suse.de>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_041618_745156_DA289E7F 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-07-06 14:32, Andreas Schwab wrote:
> With the current 8KB stack size there are frequent overflows in a 64-bit
> configuration.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/thread_info.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 1dd12a0cbb2b..464a2bbc97ea 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -12,7 +12,11 @@
>  #include <linux/const.h>
>  
>  /* thread information allocation */
> +#ifdef CONFIG_64BIT
> +#define THREAD_SIZE_ORDER	(2)
> +#else
>  #define THREAD_SIZE_ORDER	(1)
> +#endif
>  #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
>  
>  #ifndef __ASSEMBLY__
> -- 
> 2.26.2


Following the discussion on the mailing list, I have been trying this
patch on my system for a few days, and it indeed seems more stable. I
just wonder if you should Cc stable@ so that it is backported in older
kernel versions.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
