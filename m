Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99475C3DA7A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fC9DVb6HC82fTI2A9m1OhABmAxDJBGA5N5NFa57GzkA=; b=qCrXCMlZIF5qo4
	qtcrIovQjNmohGcqj2W7CZjYxzjy2PnbJUgKQhZpRIwM291Hf/M6WnnXeGB1XYQJM26zqCHc+bJyH
	VtQ19n5Sa1HHOe/WpnkaNcudeIUIpXCFn9DhBVj/1+sKoGQSCT822RHmInfA8mrJqBvtzJo2fzCK7
	HgafeGlp71OdyeongsDLLhZid9iRHfZx+EkgDcJ4II6jNBoRpgUhGfruTJYZGHy2FnaYeQLmad233
	bxEe+boOImw1COfUNYp79Q3k7L/uPKxdn/Zjh1ciC+kmvRWmvRd/Sn83VcoOJbM2R7w2LADjR+Dsy
	/ebJ6pvAmf0BF/2wWgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j7b-003olL-Gj; Tue, 20 Dec 2022 20:21:55 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j7Z-003ojM-LE
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:21:54 +0000
Received: by mail-ot1-f45.google.com with SMTP id p17-20020a9d6951000000b00678306ceb94so3232072oto.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFQDaUujF8byQHWpFPWAzFnhuOpD56AeF/7WeQ42tZA=;
        b=rZkdnHQG1PicuinIzEWJLyxdly+3YNggpari/Z1GTs/BDuRRuvOLNKiRWHxq+qAWUz
         d/bd29iyp1WZ7zFSYk53JHyYmhSQk45un0bfvoqsTUPG7hF1kNOZyw8ZoL6hzYoLmxaB
         yN0sw7R52Wt5HQ5IzZVKTQsome0phndeiV6Stz8rnTZkHXn0zpTl4hwrapGNqJ8dw/CC
         YgRb+Rk9/A1b8dniVTNv5vGqKOWGFMWyv/Tj09m6ixLsWP36y2+fEEswvXYj8uYHtq3k
         jQvp+pr9JXUhDXH8aIyFsjLNcZ7sYLCcLQt6wkAN37yd9L91CeIib4sW3g+aeJwTOjT3
         ogzg==
X-Gm-Message-State: ANoB5pkIdnnwAw5KgXQdAeVvQlOFexGUUqRlRNQ1CP8bNC8yg6yjBwNL
	2iCRe6P4O0HNRTzQOQCClg==
X-Google-Smtp-Source: AA0mqf5jx4tKuMagJILHfkxT2AHgBM3GhosMHdWv0BYBkjW7e8PhYsE/EvELVZ7dufZDoev+gAd9FA==
X-Received: by 2002:a05:6830:564:b0:670:4588:f8c4 with SMTP id f4-20020a056830056400b006704588f8c4mr23705639otc.18.1671567712297;
        Tue, 20 Dec 2022 12:21:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j7-20020a9d7387000000b0066c3ca7b12csm6048869otk.61.2022.12.20.12.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:21:51 -0800 (PST)
Received: (nullmailer pid 1022017 invoked by uid 1000);
	Tue, 20 Dec 2022 20:21:50 -0000
Date: Tue, 20 Dec 2022 14:21:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ben Dooks <ben.dooks@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <167156771008.1021954.965078236008496413.robh@kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-5-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220011247.35560-5-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_122153_724246_C0B570A7 
X-CRM114-Status: GOOD (  10.16  )
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


On Tue, 20 Dec 2022 09:12:44 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This cache controller is also used on the StarFive JH7110 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../devicetree/bindings/riscv/sifive,ccache0.yaml        | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
