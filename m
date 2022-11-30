Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27573C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rLt9oZjkfqqW+YQlUdXoJ8j/Ip6+QEWJZafN0Bp/SQ=; b=0Fm6fA1ev57Ava
	lSvD3VjAGRTmfgtujf97yJaivLXC+S27lfQy77sVKjWG9KMvekNPf0c21POo5thPSvtV32VxGStkK
	05nRPI9ZkvkK+zF3llTJYkzt0MkmLCBAmdj/IMQHumyGRp14uycWhnPUKwm1At/AF/Zcjxh55hIzI
	uXU83Lbe2dYMBAYPo9QFceXQYj/qzJRqMqE8MDGLNgVzmUoojYrZJQuUs6VnrdBre8cdfxQyyGybh
	2bfWtsJgWLuOqU3KrlE9b9V13PlnN03VCNDECRR6UYokpBQETbMmlssx+5COughoNR7hmMN+ZOnFp
	NKfaSRwC0mpFtZSW764Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PXS-000GHj-9Q; Wed, 30 Nov 2022 16:02:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PXO-000GAT-DF
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 16:02:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n20so42525037ejh.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd1P94iYMtAkf1g/w1uV39F0sssM/yu+bWE6IOjZKmM=;
        b=oiLsRyM1UkOEEm55aOLgkjOnEwzWGy05S57piWrRaEyZLUWu2SQuglcMb+cWkV6KUO
         W7zoBSVIroivwj5EsuANdoaj/az9vrFu1Or+6vMWra5AIH9/NoncRX42AjwVjhDTEmOF
         CYkbgK4rg3xjPug2dB6ptnYvvqCr5IDy9NzVA2OZaGd6b/s9Kc2UE4/HqzS6sM3zs8an
         dP3Gg8jo4IZEHxylf2UWKpS25gqEb3tH+JuqqbirUOFnAZ6vQlz4kQNgGGlmDcN3BzIi
         SZxK+jiW/hR0y7Zq86cNTVKMwTsz/L0M39cJ4j33br8GvLeZDiyonqNTVcykNsmL9XtS
         xGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd1P94iYMtAkf1g/w1uV39F0sssM/yu+bWE6IOjZKmM=;
        b=rGEVkwMCX13S4oWtchlE4yYYwNBWQcEEFeKGmzOZ7gyKuyzWXWzbvQxXm1QLcm+PK6
         xIz+9Y6CyWszx6enAPRBW6+GGz1kdjUhvSbBWgagxB5S8vsGwYW2pdqns3SjYS5avfFU
         1Sztncg65ljwdBjwnEIwvuSdgMLXp3ZEswWktlTdp+VaozRDcnj8U7yRz+ZVxLylJrFF
         WxFIwvFmE8423WH8VE4lRUvEUe5LKyyGV7LhQHcgYmX5PqkHhZ8MGiRlfuV12QROk1Xv
         0PSMg5Qw5BFuxDPAy5rPRwwJokJ2KiBWqkSLo/FpeqeL8qnaCw96upB5hblhyPGXPaum
         qyNQ==
X-Gm-Message-State: ANoB5pnsT/iA1BxZ4rnn0RoEUfMqWDlgkX9FNSqCFyuaDpinHAYXu96P
	S+yB9jOgIUcG+BSNv2YYC8mjWHu+zdbO/A==
X-Google-Smtp-Source: AA0mqf7TerqC8qTzGL/EZYIoxbcUl3wT+5ZeJHHmY+GLqHARrjyfz15C1OqnmE7+cnP3BWLuDRLeYg==
X-Received: by 2002:a17:906:1546:b0:741:5c0e:1058 with SMTP id c6-20020a170906154600b007415c0e1058mr51705671ejd.472.1669824136930;
        Wed, 30 Nov 2022 08:02:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id cz15-20020a0564021caf00b004589da5e5cesm762435edb.41.2022.11.30.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:02:16 -0800 (PST)
Date: Wed, 30 Nov 2022 17:02:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 08/13] RISC-V: add U-type imm parsing to parse_asm
 header
Message-ID: <20221130160215.qvj5cm6rrjldmvim@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-9-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-9-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_080218_468569_5526AFA2 
X-CRM114-Status: GOOD (  11.74  )
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

On Mon, Nov 28, 2022 at 11:26:27AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Similar to other existing types, allow extracting the immediate
> for a U-type instruction.
> 
> U-type immediates are special in that regard, that the value
> in the instruction in bits [31:12] already represents the same
> bits of the immediate, so no shifting is required.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

With the s/parse_asm/insn/ <<<$SUBJECT that Conor pointed out.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
