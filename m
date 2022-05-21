Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF044C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9OZjGLuexHFzwHEoJZgZZ4HHPLhusb/BaTD9M2KuVQ=; b=13pE01N2cNyKS7
	SNjuIoAf/hF4sZe7Fx/CVNA+rsfwKUKxa5akBZQ58R9seYjypC6isMbUGmd/a3WWE4iy3Zm6Me628
	LCEA5hJqS6K9jc+o4smsoXwO6QFZn+6Sn4QoxF15Z+Y/J+IhF1IOEHeo1ijBTFmemQK10cbDGPATU
	tz1RdKYEpMGKQJo3G0Ohp99jngFOQp3DBX0uNTZqH1xwKIniETp8fXbE0lGjfs0qPoi7PbojHNz3q
	WSo71WH9fI7XVWMyK+bOLWgmZbL7mbhvywbKnGAWDn8AR8nK0t1RBN5z8RZYeZYS+N2EW55dJ1nEk
	2RLe86blseKdj1Rbu8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsXEA-0000pt-Bf; Sat, 21 May 2022 22:05:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsXE7-0000p6-T7
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 22:05:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q21so1509683ejm.1
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 15:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IV/p119X5594f+38jnuaz7rMoabLXviEZya5rViYhYk=;
 b=RQCuz4T8KGOBZhQJLMhmLCDB0equ0jCfSig9aHx4AuXCr7SpCJp05ZEbPxICY/Oifw
 R+QwlQvFAmgbNic2SLN5gIClrzOc55G1XlIwa+XFfuqaX71BhaFHtFfN1GxM2njuLsvN
 jTHXK5rSn9gfeNDOG7YQtNwImfO3JvWrWhnfTeoamhMlAC1X7apiBWGdDQ35twPmsAiy
 p+uxGXBDDCrxXPuQtiONx0CahCf5qUclg7KP1L5NTASYCBaHWFcT1xXojStSlvzPEjej
 ELt+XniI/OX2tMzQr4vSzlyeKN/9WPanAyoWJzf94KtfJAIRs8Z9Hh2DyGrj73MoGIRm
 yHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IV/p119X5594f+38jnuaz7rMoabLXviEZya5rViYhYk=;
 b=IC3a2PHDkgmQ3yx4Fc1M94w65P6yAU5tq5hw0hCb3S1GTPaX7uWL/00Yrn0fNfYUld
 OqAv7bzgITo95uV8+mnWBtNg9BfnDHFtxum+kgxTZji7yiJm+0aXAouuAMWLm22/MM0/
 dHyRJkUPvnTgidlVrBHsDx0XJUqm1J04LHR9MvAg6wOqh5ZEEou0X23JyK/hskUmcP0N
 dC00sp6xScFohlnNev+FTXp8l/6m1yxka7/J1NLCRwxFq1bPXIO0lw8fOY5dGMguTo+X
 3W48/DNLK3tLZvOccr3ohd2L/faxyo7m65eg9wbh1z0PsLc5qbEB7kTrSS7E9MlkUcMv
 SkIw==
X-Gm-Message-State: AOAM5312JUrMoJogfkG/MxIYqJC8ZWgEGymCS4tUq+5n/RvHMflyzOal
 cCvZrnHYkZL8P46uC4SzWPU=
X-Google-Smtp-Source: ABdhPJxuFycxwe0y2WfTnDJKX4v166SnVzhVUIBbvvDbDO+gVV9Wr8D/pN1WJPeRW5WpmEj4cK8OGA==
X-Received: by 2002:a17:906:c10c:b0:6fa:24e1:2fd3 with SMTP id
 do12-20020a170906c10c00b006fa24e12fd3mr13946509ejc.231.1653170733968; 
 Sat, 21 May 2022 15:05:33 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm6142427edt.26.2022.05.21.15.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 15:05:33 -0700 (PDT)
Date: Sun, 22 May 2022 00:05:32 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 3/6] RISC-V: Remove the unimplemented ISA extensions
Message-ID: <20220521220532.yfpmrdbvu2gyv2rc@mail>
References: <20220402050041.21302-1-palmer@rivosinc.com>
 <20220402050041.21302-4-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402050041.21302-4-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_150535_999494_C5C51FB5 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, Apr 01, 2022 at 10:00:38PM -0700, Palmer Dabbelt wrote:
> This made sense when we die()d on unknown ISA extensions, but now that
> we're just warning it's actually a bit detrimental: users won't see that
> their unimplemented ISA extensions are silently having the wrong
> definitions set, which may cause hard to debug failures.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  target-riscv.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/target-riscv.c b/target-riscv.c
> index 494c08db..924259af 100644
> --- a/target-riscv.c
> +++ b/target-riscv.c
> @@ -37,17 +37,7 @@ static void parse_march_riscv(const char *arg)
>  		{ "f",		RISCV_FLOAT|RISCV_FDIV },
>  		{ "d",		RISCV_DOUBLE|RISCV_FDIV },
>  		{ "g",		RISCV_GENERIC },
> -		{ "q",		0 },
> -		{ "l",		0 },
>  		{ "c",		RISCV_COMP },
> -		{ "b",		0 },
> -		{ "j",		0 },
> -		{ "t",		0 },
> -		{ "p",		0 },
> -		{ "v",		0 },
> -		{ "n",		0 },
> -		{ "h",		0 },
> -		{ "s",		0 },

OK, it seems than most of them have anyway no chances to be officialized
anytime soon. Maybe just add the define for p & v together with
the Zb* ones when switching __riscv_arch_test).

-- Luc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
