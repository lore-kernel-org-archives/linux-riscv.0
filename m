Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEs0LvZ+sCrUXnXqGCLipSsUgM04I3tegZG1veHuWmQ=; b=FluTPwI5LqVlhO
	546c/l2Xa+M0pvcDm6a/fKrCSopQv3hk4vbBuqK3qG1WkcvSPCzlumQPn2HNX47LTOKhE55OH1s8y
	/pcbE1HW0stVr6dTVNYy4jGhmpFQ9kmMw+A78tUtC3fI96mdNM6jruX3dCIa81Zhi87QeQsfDQCC7
	H3hMhw/KnpvZ7OURFLwDKGh2lV6cYnvk1HzUeQpFraJUrmkNRAk48MzXh4p5KVv8gInOmZutiUnnb
	tmVP4Mh/oMgOKlMlJdtg64a3k13dfriAK7YeFV+dU6NS88yJOQpgrFRHykIMUPHKyhTtBX8gaF9+u
	OIH50JXrKrGS5IOBJU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PJF-00042Q-Qu; Wed, 30 Nov 2022 15:47:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PJC-0003yn-MB
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:47:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id z20so24594232edc.13
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBz0Mw4CbbaLbK9qZtIKd7n4wWYY/Qp1uF8w9FyKd1c=;
        b=a/IijJLcdeKxJOVrXIJVzCeKKDYOPFJu02lZJT1m1H1aGOh0txybILRPqBI0DUrYRR
         peNg+T6LYCSKObC3GB2U1P/Fh3/K31LNg8i77TSJswjn4fmaJ3h4FPTQGnmrqpyxOTaP
         1TCclGV2qR+Pbe4If21TGg5RI9cvi92joOTQNCx7vZWQRsAslF5TTGAzi9N1EJYkqF5W
         l1KL1NYvTZlgtPid5l4v/cxkV87/V/Mm475efMJ0pcOY8JTfxPqyOObST8mLVEx1q9ip
         N4ighE38F6xhYOFtBCSrVRM/pDuTH6jlBsPTM0UjHIbtXJ2xEpRd4QRV9ccRvpkcK0zs
         Fzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBz0Mw4CbbaLbK9qZtIKd7n4wWYY/Qp1uF8w9FyKd1c=;
        b=YE6aATfTySVAGK0EzkduqOOL5DdFd8szwBHUdLHFmfhMKGshO823TaPVoRsbn8Sest
         UFuoAdruHDHs5w4mRNt5GhgAkp4r3U5O5YTOuwxBFPhDfZq7cux4Q8eckQAYmzmtfw76
         DLhhQz8g/rEAq2T1R2AdCAuml8zD89IXywKTMaf79p+49jlIl5iAjcJk36Kt10W3vi05
         4AfJkN3WiR1+EY+wzuZbmlUEp0Ki1Gb/YgRjQ0BZhc/8nEeEMROA1dChM2OQcIkiUP9+
         buhQhMwCDlM683C2+BHUwLfCUQasxzsO90LEIQ19jeDT2MTcjM/bUuYSwmpDChwIig4C
         /MHw==
X-Gm-Message-State: ANoB5pkGdxohDDqUGyxvBhlZ5VuzK8wQnhflj+XMYziEZ5sJxpL59efn
	3eHzOt2OlnB71IWpLzie7u6ThA==
X-Google-Smtp-Source: AA0mqf6jwwZ6aoJOEkpnt1Zkf1zpphi8Q4vw05+XbZfKBCxrqXovdLdzFHSmqwtIOBgPzYXwraLrUA==
X-Received: by 2002:aa7:d558:0:b0:461:eea0:514c with SMTP id u24-20020aa7d558000000b00461eea0514cmr46820922edr.296.1669823256913;
        Wed, 30 Nov 2022 07:47:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id e15-20020a170906c00f00b0078c213ad441sm786954ejz.101.2022.11.30.07.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:47:36 -0800 (PST)
Date: Wed, 30 Nov 2022 16:47:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 05/13] RISC-V: rename parse_asm.h to insn.h
Message-ID: <20221130154735.63k4zizxjtikwgdj@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_074738_746537_DC819F8D 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, Nov 28, 2022 at 11:26:24AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The current parse_asm header should become a more centralized place
> for everything concerning parsing and constructing instructions.
> 
> We already have a header insn-def.h similar to aarch64, so rename
> parse_asm.h to insn.h (again similar to aarch64) to show that it's
> meant for more than simple instruction parsing.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/{parse_asm.h => insn.h} | 0
>  arch/riscv/kernel/kgdb.c                       | 2 +-
>  arch/riscv/kernel/probes/simulate-insn.h       | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/riscv/include/asm/{parse_asm.h => insn.h} (100%)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
