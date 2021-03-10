Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E064AC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:17:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A00A64F36
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A00A64F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tURv/Fa6oqY2kK5c03eCf4jhdnO0k0TVT7q/KMqDO+o=; b=Xd71hZM7bjBdqk3MBx6xxTfZf
	c1tL36xWlcCqtw/yYymPleg42lFyHe14SJxQKG+1mXlmHuuTByvnI+Rarfx/JEm7T6BMe9/IGDlli
	lCFMVr3Sz7gLGHtXZrRoaeZxUOHqeNMVoANNdhnADWAjpzAtiMhQ7feigW0Oa30utVQN7QJE10x76
	09H+/YBEU7qDx4D6nQjH2SlgXUfw0H9azrJHkBgZnP9coG1VBlc+qs6uI/W8PRgC/ZAvEIwUkpxFU
	tSfdZaNRaqDKsRoUIQRZibq+4z/Oe8JvqIaMYTcwHi4NnDEb7btB6RSsVlNNNnx2ltEyWkOihJu69
	jpk6jYEgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpLO-005tzN-Bk; Wed, 10 Mar 2021 03:17:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpL5-005twG-Hf
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 03:16:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id ha17so9556pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=g849COPJpVQXUSUGkGGzyJ03IUihWlADowoP4ZsZZjo=;
 b=XTgAcImCQEDi9o/6iMJ0uuQkXXZGO5pQkzSgLuyefIRa81qt5C89nLzwpZbgFfGQZW
 3LrvsJcvAyyJZ6mAPOKECVW7uj9N4sMH2Hg4oY1FLF40gWk3ibpTlJkjTDu/kPyKJT9n
 CyYjtd0XAYDwkSQ8QTPPjcFYoctA+bakCv1EmYzjFkoOMtzb9nnawc9PvdokiaGkaoOR
 iATAnLFTX/+CPYQMuITrwwApMi57g1lYG4vjCxTC27egQTpWe2fZ5CIdnInUT729gNby
 p8LoBRM14Fnm3ai06RHwRe3RBPDXjLDSrXLXvYMNeGiLP/NyQILd0HXiVDf7w8MtfJc/
 59Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=g849COPJpVQXUSUGkGGzyJ03IUihWlADowoP4ZsZZjo=;
 b=gbiBLqr6ky/tHj/Py00JecU5k+6pgk/QVF5Gvz8SYgvfP56ngZs5Hj/QhYop9cj3kN
 2fclkOtm0nn398YmKvcuPD58ZFyzJmsNRXbz/WXMNT0uN54XD3JFXROrZHffo+y8KCw4
 LP18zHSxAuYAQDl6+Rq9vz1aFoXZIZ6i/Ri3UeBhwf+DWdXXutNpkHmgRFtbLpm/N6xn
 ZIThdNUc06EWYxzBUuSWv3Vd0h9MEgm+yYDZaQ28kdwbO7bQZOoxBJp9fPbsmAbBAJqz
 KlPHbSJEr12nrINrL3FAcEXex01JPfxapTJcHAPPJNiUz39XuAB1IBgp3qXnZtsmEjhm
 7ImA==
X-Gm-Message-State: AOAM533N7V+FuiXGtTtehcQxfKew3nfoVK+3KCh6SuQiMPbTYG/fPs+V
 CW11HxRjghCvXkiMD8hDYm8YZA==
X-Google-Smtp-Source: ABdhPJzrGSSjx1UUPNqyEE3R9KG5SsHStFXW4PWc7T2nYdCEDKinfnS5OwydQtCU9RfN38Cn/AdiUw==
X-Received: by 2002:a17:902:b210:b029:e6:5f:62e with SMTP id
 t16-20020a170902b210b02900e6005f062emr1187005plr.48.1615346205858; 
 Tue, 09 Mar 2021 19:16:45 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g12sm1556605pfh.153.2021.03.09.19.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:16:45 -0800 (PST)
Date: Tue, 09 Mar 2021 19:16:45 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:15:36 PST (-0800)
Subject: Re: [PATCH v2] riscv: Return -EFAULT if copy_{to,
 from}_user() failed in signal.c
In-Reply-To: <1615017149-24843-1-git-send-email-yangtiezhu@loongson.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yangtiezhu@loongson.cn
Message-ID: <mhng-33c9663e-90b5-48a8-b089-54f16f6b494a@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_031647_932467_6DB1F605 
X-CRM114-Status: GOOD (  27.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 05 Mar 2021 23:52:29 PST (-0800), yangtiezhu@loongson.cn wrote:
> copy_{to,from}_user() returns the amount left to copy, it should return
> -EFAULT error code if copy {to,from} user failed, just like the return
> value is an error code when {put,get}_user() failed, this is to make the
> return value consistent, no function change.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/riscv/kernel/signal.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 65942b3..c76d877 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -39,7 +39,7 @@ static long restore_fp_state(struct pt_regs *regs,
>
>  	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
>  	if (unlikely(err))
> -		return err;
> +		return -EFAULT;
>
>  	fstate_restore(current, regs);
>
> @@ -67,7 +67,7 @@ static long save_fp_state(struct pt_regs *regs,
>  	fstate_save(current, regs);
>  	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
>  	if (unlikely(err))
> -		return err;
> +		return -EFAULT;
>
>  	/* We support no other extension state at this time. */
>  	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
> @@ -87,8 +87,12 @@ static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)
>  {
>  	long err;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
> +	if (unlikely(err))
> +		return -EFAULT;
> +
>  	/* Restore the floating-point state. */
>  	if (has_fpu)
>  		err |= restore_fp_state(regs, &sc->sc_fpregs);
> @@ -140,8 +144,12 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>  {
>  	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
>  	long err;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
> +	if (unlikely(err))
> +		return -EFAULT;
> +
>  	/* Save the floating-point state. */
>  	if (has_fpu)
>  		err |= save_fp_state(regs, &sc->sc_fpregs);

I don't really see any benefit to this way of doing it over what's there: these 
are only used within this file, and the caller is just doing this return 
conversion already.  If anything I find the current code easier to understand, 
as error juggling is always one of the trickier things to get right and I 
always find it easier to reason about code that's just passing through errors.

If you have some new user of this code where it makes more sense to do it this 
way then I'd be happy to take a look, but this as it stands doesn't really look 
better.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
