Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/MF8W6V/oNZawOi2iErC+ykrWVLDA464Fa2D53ui6Y=; b=2w/N8eRMntOiIs
	O4wSOKoNSriXB8gOUUpF7JB5GrPxLIFrfN4I0oFUJTdOZfo4T2CdeycYvJI4FusnRBCWZG5jsx1zd
	igqtwokU+FeZV41z1h/6BTPMTU1lpOtEm+jFNlzStDGMsmylrXOiNTaaz+dff44Fs8FVeHtsBghJA
	21/9RmGGIvTeEgVnLKRPIgYbYpJlsP5uw6uOwnW4KvKUjw3Eoy85bAe43pM3QMGgrrfnOl4LjltXD
	vE9gWfZMzEQzz0AcEfhC7Ee54WKi7x34GN7pQoEo1xrjOQm8iPlk1ULNpLm01UAHiiE7I7wVScYwM
	KsT+DqgI+3NGQp4kknVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PGA-00024Z-HR; Wed, 30 Nov 2022 15:44:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PG8-00021M-1q
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:44:29 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gu23so24111492ejb.10
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Mg8ouE72pNFSGB+LQuxe0fv1d5Gro4mT9SFvN3B+Uc=;
        b=Ui+edKn+e1Ir92zGZtWcyoXORp0HZNnXCB2Y/GxgLLWd8gUMrkoqA1okctAP+v8xQN
         uKYarE5r9wSfDf+fmHF3Yjl2OnEynre3uZ08QvSgQT27tHNy5DTfL4lHcwUc3SsKHEGS
         b7KFhUbQWvktkLHNAZzRFlhE10GArq7vsse5g3/smtX8HRkYLaCUPzaovO38kzFP6Vx4
         OaG5VKfNUIbbHXybshn//VlBdXOxNgPi8c0YAAtN1t4I/+6r1+Nn4DjPU3PhCRNmRA6f
         XYs05pbCNvqLVgPvSlwqfuY0nRLTAa+H8oGVcNxQ7bjvksJ0ihQsZUX9F7ISxTHzdEyI
         3ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mg8ouE72pNFSGB+LQuxe0fv1d5Gro4mT9SFvN3B+Uc=;
        b=tyoV5ARNHJVuvO3QdisR+k+w6hJq5rofjRqKk43/w/STqFHHJQGchiKOK44aS93bBh
         rWinDi7l+ZG0BdWxv4oTEkGU9qmETL4f6BhAUZGHN25wx8pWhFzD3lnfvkxppO9FYp+0
         9Rjca9DduEX2pKVGyS3VeUTgnilwHKfxHyx7/qaVARkFDXLBvnT+06A75sYhKIG1wcyy
         3Eb1U9d/qcIH85XpIvfSuTl71Ngmys6Wgc/yQgdcVpHngJIBo53H3AzAftjcB72BydVT
         7+ISYPlC7PL1kt5luupv2IjmM32IcIOQbL3+IowjxZozl5NYyVwETRb5lv8DwQDFIzhA
         tKHA==
X-Gm-Message-State: ANoB5pmrkmE+tyUUTxjfch74RHwhCNyzyPGsoRAD15X4UYxaP6v7J8l3
	QTFHwlTrZDaYohI2opZ/naQgTA==
X-Google-Smtp-Source: AA0mqf6nVUS2nSb+OWXzqvAR3L77CC+LVx+5Cv0Eo4z2rNwWqYAxjP3ImGsadsZH2Z/TixsXDPRK/g==
X-Received: by 2002:a17:907:a044:b0:7bc:27ab:6b2d with SMTP id gz4-20020a170907a04400b007bc27ab6b2dmr24638597ejc.750.1669823065718;
        Wed, 30 Nov 2022 07:44:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id vs19-20020a170907139300b007bee745759bsm780199ejb.20.2022.11.30.07.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:44:25 -0800 (PST)
Date: Wed, 30 Nov 2022 16:44:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 04/13] RISC-V: Move riscv_insn_is_* macros into a
 common header
Message-ID: <20221130154423.upg44kz2iqyppbhz@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_074428_135830_CDEAA08D 
X-CRM114-Status: GOOD (  14.75  )
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

On Mon, Nov 28, 2022 at 11:26:23AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Right now the riscv kernel has (at least) two independent sets
> of functions to check if an encoded instruction is of a specific
> type. One in kgdb and one kprobes simulate-insn code.
> 
> More parts of the kernel will probably need this in the future,
> so instead of allowing this duplication to go on further,
> move macros that do the function declaration in a common header,
> similar to at least aarch64.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h       | 41 ++++++++++++++++----
>  arch/riscv/kernel/kgdb.c                 | 49 ++++++++----------------
>  arch/riscv/kernel/probes/simulate-insn.h | 26 +++----------
>  3 files changed, 54 insertions(+), 62 deletions(-)

Besides the missing auipc definition Conor found, LGTM

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
