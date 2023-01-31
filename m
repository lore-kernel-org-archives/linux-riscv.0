Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CE7C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDtq73cDMyH3xc+0JF0HhGSp8RCPD788nojjvWduTRA=; b=orZQSWfI67e3vn
	uiEgtdy+TxPPo98So6xsR9R+2gVJF00RRtG/ZP8z01aAzvOI1BUpeRWGX1tZhfVXe4yg2MVSvxDni
	zkERGlwZhEkM8hg78mTj133HnaBwVL5fJScCHbqjMqtsGsaTZkdb5NydGakHQNSbrRX/XjIUxBoDQ
	1N9lx2np4enb4Xwcw6xqgPxvX2b4gsl0XkAs6OaYj3IUbmy5w0vIsObOgWJnny6kxdr49B5vVL4E9
	obXTMwur10oue/4fgQ6KoEuheNzVf0RslyvXxyfrir8fJHCBJvAftgvxNWFySB4xO4jWVWdPPnDRu
	mgdNLcRsLoUnTKRyti2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqSX-0081qj-VW; Tue, 31 Jan 2023 13:14:01 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqSV-0081oh-3n
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 13:14:00 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id c124so17943713ybb.13
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lebX9VzQP7VMYHLa2vyK4hrBtzDqJ9eFCBgK4dZHGqY=;
        b=qXtrFvc8NPvibTzkOdKNUNcSgLQUKhwmE6ALIFFlhhema+9UDs2/xEAIp+1VFL2AAa
         9YdIL9SgKkLhDEhuwRUiuvwE+TJRxMZaSHitbLSVMLJWtVAtYkK0GK6tJyPqTuRp+uQL
         z9Swhwf9izFHI+zJzgyEejUwavw8wqvwJqCFL7fTGGGc8rUk6bd8vUrsAR80S6dFW0CU
         hZiVxhUNlbWJv7m3ZE4fyFtpkBPjAJ3YI9uNsWLMWDjXerT9A5FLOXeafa1i88ACzgEk
         ucAdfE/0nfU4LAz+zOTnAF/Jz8srUae8pvFzBqYWFGMrKyNnJMDbovdndrXlESHtXAa3
         /m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lebX9VzQP7VMYHLa2vyK4hrBtzDqJ9eFCBgK4dZHGqY=;
        b=3jFNG6kS4M0qbFC0yVgcjzvZPtkuTq1CtSsc1Ndf34du+MwI6zPETdHEdjedhBmWH8
         rt8toQCt3Iq8ATsZfQtFiX7aWA40gMZsKAiWD5rp4mi0OaPIehLj6ENfCM9iJBbeQH6z
         EnVgoDGlQg91mGQ4pu6AUvGnRJ0lIncXgVwtII+rmRYeAB88NigmO+gpMhxyXcWLAkMQ
         0+77AWEYF27NVeq7I0kwVbhOIwVow4Rbn00KPOzJYqJF7s0Rqm2FkXFyszVW17kczkHJ
         WqpXE/DJ/qYBzQsrloUvgufiA5t5HOkaHeFBFJMg43FV7v4oyiPvhdPIeToTb9namf63
         P4Xg==
X-Gm-Message-State: AO0yUKUibvTFTDUQOz9ukhll5K+y0DErC3qBlN96k5CzsZ/0SnTHEHmj
	piUo+xrA8U5WVaQ/fCgtGY7IiYDld8D6tfREM9qznw==
X-Google-Smtp-Source: AK7set/ssVUH1Rz89sAOJnKBoqT7NZMWXa8/qUnWnQSWqihB5+j26vSuiStV4rczYgZIb+D5YQtZAm1c0IjM0yuMuo4=
X-Received: by 2002:a25:2fce:0:b0:83e:bd63:6dd7 with SMTP id
 v197-20020a252fce000000b0083ebd636dd7mr45490ybv.24.1675170835979; Tue, 31 Jan
 2023 05:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
In-Reply-To: <20221220005529.34744-1-hal.feng@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2023 14:13:44 +0100
Message-ID: <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_051359_211608_3555CD3D 
X-CRM114-Status: GOOD (  14.11  )
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

On Tue, Dec 20, 2022 at 1:55 AM Hal Feng <hal.feng@starfivetech.com> wrote:

> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> You can simply get or review the patches at the link [1].
>
> [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
>
> Changes since v2:
> - Rebased on tag v6.1.

Overall this looks OK, the DT bindings does not have any review from
the DT people but I think they had enough time to do that and were
properly CC:ed so not your fault.

However when I try to apply this to the pinctrl tree it fails,
for example it seems to depend on an entry in MAINTAINERS
which isn't upstream.

Can you please rebase the patches that are supposed to be
applied to the pinctrl tree (for example normally not patch 1, the DTS
patch) on my "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

If you resend this quickly I can apply it pronto.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
