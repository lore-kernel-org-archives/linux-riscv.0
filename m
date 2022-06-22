Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D411C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzDFqb1tLzEQc23FLehoC5YxiYDOfvwB/MYCooUEYrY=; b=SowLeQK1eWplf8
	Z9HORnmv9n7qOSuadbBr5SFSYSiSPrGeLEnRZF6gLSnBn/4GxxR+6raqq2ES7oKiFE+y/5qX6bvdA
	2Fx+/WUmpS4f0aVgrViFIqLIm0TWlYJKtUw0Gp54cbaiMQFfuc6KEQqROB1ZLEJhHUhQmyJFyidrp
	WsN4mzbtQYGThKkEVwaBUph7mRAMoQ8o05Gsa7t8Qk/gSHVEPT5Frpe7HZGZGyOaJH38YEXF2Uw/5
	8440AJS40huA8cLNvQN1hPLmpqJOrn2e0NMIXSqzeq6HNx1r62KXeGk2IS/vpWByUem6g+Jv6hBHm
	BfnP9oC/p/MVJDngo3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xYq-009srD-F2; Wed, 22 Jun 2022 10:26:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xYI-009sd8-7o
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 10:25:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id lw20so10856559ejb.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/zjn2NcRExPUTirGFzxTZgP9NjWgoGUMnDJgEV1lu04=;
        b=I8En5bsxXFmfyfyTiI0mscFffKVay0IZWSa1/HbfosWxmP06Si3VoiX7GN+9/ngIoZ
         USVmJPDOedjMHazgmdeuL3VoaaygtCusUFGxUFBuK9Z7cgNnLTxHjcVbm4vkABgBwyIK
         NG3W44lMeXVbV/0RTyg1PA8n59n1mShKWNXzwwwTPzsXvD0O5cHSfArjPlRDthOeJ6ti
         vFEsPXGjUAUYHV7Z4sfnSXby8Apt9E4Nz+06p3HWVOFjZCGeL0tx5+8amBuX/oaSSP/B
         HjHFQig9XpSOm6qySIaguAesWRQRTnGhYo45M1LxmdSddAw+3arct4hynn//FAjML28i
         ByVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zjn2NcRExPUTirGFzxTZgP9NjWgoGUMnDJgEV1lu04=;
        b=kjPG3ySeykDh0bEpqbWwOEzMYsUgenthJSf7ilFmN9qkAdjfddz/ujj5AHWsuw6xAI
         BRy2r1Lh2J01OwsJnLThB2ZeYwO2VUisb/POznLp6LC60mBo5ANypCxj6RE9j8vNqp+B
         5Gt45Z+wGpatAqtN/3tlhVzxKdDeASTT4NUsSVEu8scSS9LkgiE6SYDu4Zxx0IfG4/ER
         XYiKxiE+5L1n9GuQBaU32EiiTupwIXy4kEUKb12H0WseilT7uirulH39J62Oa7dcckzf
         zlf9stAm9RFC5PDm6Ha75657goJQ2GtASW6QkH1EQfEw51DKq4PUGyYgZzNYkmGggOtH
         /CDQ==
X-Gm-Message-State: AJIora//0cyUiVwNVq90LVV9djwfb5DUS8xls8LG46wYuKLWtYVOaAZ0
	8+snaPks8UL/+dGdrrqDD+5IvR12+szApHQfTT4=
X-Google-Smtp-Source: AGRyM1vULSENe1QE1XKOk2zwFzPPyWuwL3467lJNApluODeMEqHk4UQbjn/vq2B1beA3apf4wvRk6XKWiu4Q7fHRftg=
X-Received: by 2002:a17:906:149:b0:711:fca6:bc2f with SMTP id
 9-20020a170906014900b00711fca6bc2fmr2446013ejh.497.1655893535896; Wed, 22 Jun
 2022 03:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220610074459.3261383-1-andy.chiu@sifive.com> <20220610074459.3261383-2-andy.chiu@sifive.com>
In-Reply-To: <20220610074459.3261383-2-andy.chiu@sifive.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 12:24:58 +0200
Message-ID: <CAHp75Vfeh+jpft0sCdVqz+nJAP83LGhQvA_62aQptzt8a4M+gw@mail.gmail.com>
Subject: Re: [PATCH next 1/1] spi: sifive: add PM callbacks to support suspend/resume
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-spi <linux-spi@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_032538_337942_068124E3 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 10, 2022 at 10:05 AM Andy Chiu <andy.chiu@sifive.com> wrote:
>

Missed changelog.

> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>

>         .driver = {
>                 .name = SIFIVE_SPI_DRIVER_NAME,
> +               .pm = &sifive_spi_pm_ops,

Missed pm_sleep_ptr(). Have you compiled it with CONFIG_PM_SLEEP=n?
Have you got warnings of unused functions?

>                 .of_match_table = sifive_spi_of_match,
>         },

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
