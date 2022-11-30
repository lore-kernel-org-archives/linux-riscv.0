Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C510C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYuzieslbh2wrJb1hlvzvMOsU2PY8CUavChotPOtzbA=; b=VZNs6ZB05YXnCV
	rZqGdlPWxwSp2Iq2wMhgW5Dx6Jh/CbM+5qtZ1UTzML5blX9cAxNE2LT7SKYWWbwxLdX4gDwN4KBHI
	T++KhO1UawEAZ+0udwkwjXcc45mw4xJnKQE4P7UdIRH9OcimWLqGoYum7Y5pQWBHHABfUL6Na3RBe
	yUFZQqwWy5zi39oPDC1bNr67L3hkiduZNdWxXcC+kMR+IrhDsUSQJ4BHcO7hDeGFPYlItRemwmA5s
	SvXvv6+RZg1fKB5frfvWDRwr0IkAiKRsP0uO4xPhEaw4XPbzYGsyiUXt9QsKnYLk/nExSTc00F+5K
	eOKph6erJuRPB+A8RnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OhQ-00HF0K-Vh; Wed, 30 Nov 2022 15:08:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OhO-00HEtq-Le
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:08:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id n21so42026029ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrWbd/zhVytBbbZxgcHUflYgIIPokki+boD8exIZESs=;
        b=b+lkKdNnIm1n7Ij9f0/atzB0q5WrZq6v3ck1+6jkyC/OENVyo7h395SYGR/YiqUD50
         4ATJA93YncZvppCqlHYzC6U31ADbuA/Pbq0NcTk8h2TBlRkx28neu4KjF9lwESng0jdI
         txZbM+bRRj9uTjF75kVd8N6JtkNgZPCAXloV4/Wt+8ZCf/eeA6FLUP/uqFWDx5F5EZGe
         JtO6o110ibwI7eKH6knHn2knra2Rg5Rsxr9H4jT7FpQY1GxaWsZL+sImAC8X89FoJ0dd
         fxJtfXk+Ta3/p2HChs3zbQ7BSlMvKlP/ROFup7mJVV3Wv83GFYibgFMwNQeW0F6mZAqD
         rduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrWbd/zhVytBbbZxgcHUflYgIIPokki+boD8exIZESs=;
        b=3NMLiKSjr1a5IJetfXQcsygxWNIpcZ15ih4zLfODhq2x0Cbj/ojnpJlNw8vLhFFHZZ
         Vy2HkYtciW7oleJEYaxZ34voymA19oGpujQKJCPbPhLh9RvlUQIe1t2y5bhDKunHihyw
         c+hMfzDQo/xTEqPQqNUN9SCEur0h2KUxu4cFAPJx7YhIxpe9GFDEV5VLM9vmWDYxkQYn
         ng1JG/frWs7ivKVLHzYx6w5Oker3v1/pxS4XHaLPezxRuYPtCJULPX1SprdxdDNZEbKt
         1xujplKytoJgYBpwQUjRD0Cheho3pgW/Mm6R2nqWiv3qls1lLKUK0aA/Xd51qV7/iNjl
         87gg==
X-Gm-Message-State: ANoB5pkAHghoHmHTqgpu0fxUyU9dBw2Iu5/H2ljKzNV4gjmUYF9d5biu
	cr3tJ/4Akt8ZGZssH0p31qKNqA==
X-Google-Smtp-Source: AA0mqf4chqPtaxQ935dM4DTCWcgMFlGMkKOZZWdsaxlZbjKrldvITtXZoGfe+DEnN3m1d32A3/rQSg==
X-Received: by 2002:a17:906:7848:b0:7ad:b286:72da with SMTP id p8-20020a170906784800b007adb28672damr53181249ejm.152.1669820911155;
        Wed, 30 Nov 2022 07:08:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906539100b0078128c89439sm748496ejo.6.2022.11.30.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:08:30 -0800 (PST)
Date: Wed, 30 Nov 2022 16:08:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 03/13] RISC-V: add ebreak instructions to definitions
Message-ID: <20221130150829.miuojft3vmomackk@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_070834_748219_7ABA896F 
X-CRM114-Status: GOOD (  10.66  )
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

On Mon, Nov 28, 2022 at 11:26:22AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> kprobes need to match ebreaks instructions, so add the necessary
> data to enable us to centralize that functionality.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
