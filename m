Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2237EC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 10:01:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCFC64F0A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 10:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCFC64F0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uE7NhBP5fQCY5vLhOEUIV/eh9dHLJwiA/rzUSNFHgTc=; b=hsvk1Fm1BLMZbCab1gH1fnEWs
	TJGXnAMNVMTuMDaVl0YNtvgRfC0Hcuge4RKpsLgUlgZvDchKeXNrzJWjhLWWvOv9h2FsL+tbFnPP6
	iLnmZXJ/b2JlMFcYhfYJunu2mYlcOp0U/O7hbWHcZY3dT6/qxb0Q8W5P2Icnw/m42STLLuNt0b/Ul
	nUj/Yu5uEwWtxvrrdhASUTLus/HGe3esGb5meMp53ANRjvreoNOCBQWtX1S0hmAPbClTv+MLqMp1A
	5WDV24He4roOEe7papg0iHfDvxepevWxHy8t6wF8VWu9hHHQL6RpyL0DbR/QupGqo8E8OkQ2LUm3P
	8T3pe37Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH1qW-0007Up-2C; Tue, 02 Mar 2021 10:01:40 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH1qT-0007Ss-KI
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 10:01:38 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lH1qB-0006FQ-M0; Tue, 02 Mar 2021 10:01:19 +0000
Subject: Re: [PATCH] riscv: Return -EFAULT if copy_to_user() failed in signal.c
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <1614670097-28536-1-git-send-email-yangtiezhu@loongson.cn>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <aa84cddb-9c04-3bad-49de-2fb3056ec44a@codethink.co.uk>
Date: Tue, 2 Mar 2021 10:01:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614670097-28536-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_050137_702468_58E97D30 
X-CRM114-Status: GOOD (  20.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/03/2021 07:28, Tiezhu Yang wrote:
> copy_to_user() returns the amount left to copy, it should return -EFAULT
> if copy to user failed.

This looks technically correct, but the caller (only one)
will check for non-zero and will covert that to -EFAULT
in setup_rt_frame().

I expect if this change is done, it also needs to be done
for the callers too and there's a few others than assume
!=0 is an error.

I think it would be easier to define save_fp_state() to
return non-zero on error and note it does not return an
error code. It may be worth exiting the functio nif
the first __copy_to_user fails?

Note: setup_rt_frame -> setup_sigcontext -> save_fp_frame

> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/riscv/kernel/signal.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 65942b3..2238fc5 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -67,7 +67,7 @@ static long save_fp_state(struct pt_regs *regs,
>   	fstate_save(current, regs);
>   	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
>   	if (unlikely(err))
> -		return err;
> +		return -EFAULT;
>   
>   	/* We support no other extension state at this time. */
>   	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
> @@ -140,8 +140,12 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>   {
>   	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
>   	long err;
> +
>   	/* sc_regs is structured the same as the start of pt_regs */
>   	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
> +	if (unlikely(err))
> +		return -EFAULT;
> +
>   	/* Save the floating-point state. */
>   	if (has_fpu)
>   		err |= save_fp_state(regs, &sc->sc_fpregs);
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
