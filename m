Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64113C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMcC3QW2f90E3w7zfeVYa/oMP5rwgcz5qSH9OAqOA7M=; b=XNn8QjnUTdTaUD
	GrjC6/bwd9opivN6YixRBww/JVsC+cHjpdkP+0CmI5Yy2BHHhlMAQsvo2zGLpI4PHIgrqh0UGBw8n
	7qxXeDWRMkw/cFDg7eo9BQA97HbHGOK3zP7CR1P0o+Mk+wekYqHCYEcWvxgOV1NohsmOUP8oOC2P/
	8w9rqOQiTRVTZk3rnLNFTHoTbFaft7l0zCKTyjbEDIHh8lPwjKlatQun9Gh8qRAcUYuLJQl9ke3WJ
	jaXtmCCCd4SIAa+DrfnwK5YyYIXEffBRPkIM7WnCy4ZlmGD3AHSZvaBOXZvA6Ut9vCXBxtSF6g/qz
	PKDxkdsk394h27d2JmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97eb-00BG4N-S6; Wed, 06 Jul 2022 16:13:29 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97eZ-00BG2s-7x
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 16:13:28 +0000
Received: by mail-io1-f51.google.com with SMTP id h85so14459673iof.4
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 09:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TvrtBUF3QCSk1zMA7Dk12dzB8jZO0FszbYgfQoyxdZg=;
        b=FkpLkqKO+KzVwO20c7+UXkNwEVxHCSc9vFdUHNLhhXP0PiTkNpfWMLYvAhSDXjuFpk
         Lg9eRmAXU4ng+2rmRqCVtrllZ91b3DaRZ7PJMt5XoNhHJed26Ydmgn8nLVkPiW5iTB5Y
         +8X7BA0dYSsFNm+GfWjQEOM6b7xnthBt6OMB4GHfy39YTubakWv9gMPUfBZDKUkbs8jY
         el4vs8v/6btz1IU5c/E+lqXbS3u4X34/qIETgrIUUCah78sZZ5JoU9K4LBUuf3aT8bvJ
         +NC7GE5Fn9BJjNpixkAspdBnpWVfRBcjTuWZXXJ+i1b/Lp9girN136lK0Z5r5WaxWUAf
         /zXA==
X-Gm-Message-State: AJIora8gmapH546WeXVWnD4TR3Ktc303+eYPl8zAGgwGIFaiAtk2ckCl
	DBF545DBHe2qMtTzG6CowA==
X-Google-Smtp-Source: AGRyM1vBtpYxC3SUwaxTGvXOV5v1/bmL0O3/t3lMZhg+53gxeih+OnIt/Wdk0ksZ1XWBJ/178iMCow==
X-Received: by 2002:a6b:7845:0:b0:64c:9acc:9f1a with SMTP id h5-20020a6b7845000000b0064c9acc9f1amr22309984iop.103.1657124005646;
        Wed, 06 Jul 2022 09:13:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j25-20020a02a699000000b00339c33df66bsm16050036jam.118.2022.07.06.09.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:13:25 -0700 (PDT)
Received: (nullmailer pid 140225 invoked by uid 1000);
	Wed, 06 Jul 2022 16:13:23 -0000
Date: Wed, 6 Jul 2022 10:13:23 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pavel Machek <pavel@ucw.cz>, Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, David Abdurachmanov <davidlt@rivosinc.com>, Vincent Pelletier <plr.vincent@gmail.com>, Rob Herring <robh+dt@kernel.org>, Stephen L Arnold <nerdboy@gentoo.org>, Bin Meng <bin.meng@windriver.com>, linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org, Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Sven Schwermer <sven.schwermer@disruptive-technologies.com>, devicetree@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, Mark Kettenis <kettenis@openbsd.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Palmer Dabbelt <palmer@dabbelt.com>, Ron Economos <w6rz@comcast.net>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: leds: pwm-multicolor: Add active-low
 property
Message-ID: <20220706161323.GA140190-robh@kernel.org>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
 <20220705210143.315151-3-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705210143.315151-3-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_091327_333160_63E8B313 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, 05 Jul 2022 23:01:41 +0200, Emil Renner Berthing wrote:
> Add the active-low property to LEDs that are part of a multicolor LED
> just like the regular PWM LEDs have.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  .../devicetree/bindings/leds/leds-pwm-multicolor.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
