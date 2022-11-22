Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B158DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 03:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ireEwUcRpHD4y5qB/62Hf60GhPX4p1WpkBGwENTmZVg=; b=OppvVj9OxkZDlD
	AlpDiuQ9AyDQcRPXuWRbsAwhzR+31YqFQaTdAhZnkBnDOnUJ4tnjyNZ1r4tXUGBYJQgh11pV9mk1S
	+TwIhc/szKZ3wMCP+a1xEGLwmaR5kCY+5QmmdBW9LL48ynJogCkMUaTvN/4m4QqsbIy3vcKscFHaZ
	wrKInszt4pKO2OkB6l5hlJV8Z39zQTXSnJPtjbQXzqXPnoFXQTQ23MPz6Ek+BQM+0WN5OPj+vl9Dj
	MsVQsJXgSnHTEwZl/+XVMA6W/7ADefIn8ByxDp1dkVHvsA2dk8CtxUTRdh41BZUbx0SgfO/FxFP3E
	qNTLctkyxRhPrhuPZxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxKDu-003PHT-EE; Tue, 22 Nov 2022 03:45:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxKDq-003P6d-OW
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 03:45:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id z18so18907145edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QR536p2gGCkxha4o6fxwGlER6MG9ufp5pleM3jEqWQk=;
        b=b3ExBeffr1D3+LEQamxGefmMUYbjmpT3u6jRUjrkL/C+PLfrKZBl6TWNYnN/DQGDbB
         nhSZ07fjBLunlkqbBhIHMAmuiqKUO3Blptvy1LDhu2XfyJt7sgi4BysOcjh2ZNho81qL
         Fx7aUCmd+BAQ1euG8yOB7ggsYOgJAir87382ZIeFHFHPGw6L+dVubrxli3rWU7qQzDpF
         mBouFsjyC1LLhMSMeiMqBWT9Z0zlgwFMePqn1FQj/AEWmNPACDB6JfixFA0/gkKV5aRU
         EvLFK3YhQHQHl5QMAH5hQUvZc/JJSgB9f3M4LKUhZZPmxeHrSZAquHcBUcqaeCmXStyt
         VF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR536p2gGCkxha4o6fxwGlER6MG9ufp5pleM3jEqWQk=;
        b=5QK3/hClijH3vQb+0IeKK6kVKINeydUwEfhrUX8/zwr1WVAiTdpR7ukLFtZg5KkihJ
         uuZeaYZ0jYsL0C76z6K8Df8Lvzpm5vilBwbBmlFLCKjXDfP7c6HUiGOvm8XVVnnJy9nu
         XKEImc172sBgFhZg/p9ilCH+ElYst4Wuz8DAZe1LIWuHy5xPOUf1175Uq54bnlnQThHO
         psUJvU7xDbd/XnFBB5YRxxIJqFw0b7Faa276cqKQ5NyRfDHJpYPUzk2iOpyw4YnYzR6U
         yX3HbG0lUTirdTF9e4eOeGzfqbDcVawsQNNOQ5/Afz2ozDffhuGmbJUAl28+CR6hhJlX
         nLvQ==
X-Gm-Message-State: ANoB5pkdjdNwZYMYOU7nUpcUiDoVopDbxQo7dTQKgVVVkiLRpOKmrbDM
	eH7XnPrOzC7mk6TINmFIlXH1x62VCds9+o1374r8Dw==
X-Google-Smtp-Source: AA0mqf4yjz0wapNgLrXP9qbZGJveXMpt82Pv41iphT5tamJREHPQUqBSmnJFZtQ3+mtnteYXCcxFIg1XvFB8LbzD0ZY=
X-Received: by 2002:a05:6402:399a:b0:468:fdf2:477f with SMTP id
 fk26-20020a056402399a00b00468fdf2477fmr16691217edb.329.1669088719273; Mon, 21
 Nov 2022 19:45:19 -0800 (PST)
MIME-Version: 1.0
References: <20221121205647.23343-1-palmer@rivosinc.com>
In-Reply-To: <20221121205647.23343-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Nov 2022 09:15:07 +0530
Message-ID: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_194523_103264_E7BA78B7 
X-CRM114-Status: GOOD (  20.93  )
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

On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As per [1], whether or not the core can wake up from non-retentive
> suspend is a platform-specific detail.  We don't have any way to encode
> that, so just stop using them until we've sorted that out.
>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

This is just unnecessary maintenance churn and it's not the
right way to go. Better to fix this the right way instead of having
a temporary fix.

I had already sent-out a patch series 5 months back to describe
this in DT:
https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/

No one has commented/suggested anything (except Samuel
Holland and Sudeep Holla).

Please review this series. I can quickly address comments to
make this available for Linux-6.2. Until this series is merged,
the affected platforms can simply remove non-retentive suspend
states from their DT.

With all due respect, NACK to this patch from my side.

Regards,
Anup

>
> ---
>
> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> Events are stopped during CPU suspend"), which fixes suspend on the D1
> but breaks timers everywhere.
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 05fe2902df9a..9d1063a54495 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
>         if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
>             state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
>                 return false;
> +
> +       /*
> +        * Whether or not RISC-V systems deliver interrupts to harts in a
> +        * non-retentive suspend state is a platform-specific detail.  This can
> +        * leave the hart unable to wake up, so just mark these states as
> +        * unsupported until we have a mechanism to expose these
> +        * platform-specific details to Linux.
> +        */
> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +               return false;
> +
>         return true;
>  }
>
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
