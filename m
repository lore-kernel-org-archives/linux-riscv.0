Return-Path: <SRS0=rCLW=6I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4125C54FCB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 18:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE4A2075A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 18:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJ0jF95j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ZlMZbknj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE4A2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Xp3nZ7mai7W9hDCcx+FIt7eMUvgdr8rrAwm587GHqDw=; b=mJ0jF95jiXaLoS
	dgScMXLlQDsusuHhTb06XgxtnAznIM3aM4mz6/BXkOqkPpmzgh97GT5uG70Ez4JWisVh338usAG+x
	g8Uwoya1PoavE0j+XwRwa78hgyfOSxQQE+UMcim8p7/96XW987HNBZwwOzhrklB2ytSuHF9PlkTzj
	/MDo+kepWwmVy8w/4jEK1oFbTfZPjIzCYsKInZWBp2RsYmoLETMUs4rOiCjBrgE/dD39IOZld0wga
	fI0vaNLsNSv9yZgqY+DzNMzJ9MPpp8PVspUkpRJ0cgdBwydwlMSfOKW4zUkPbKNYI6AIRE2LxYvZ8
	MKXBbW1khm1P/TXj4Cng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS3Tt-0006Xi-5R; Fri, 24 Apr 2020 18:55:21 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS3Kz-0002WJ-GC
 for linux-riscv@lists.infradead.org; Fri, 24 Apr 2020 18:46:11 +0000
Received: by mail-pf1-x441.google.com with SMTP id f7so5198467pfa.9
 for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2020 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Xp3nZ7mai7W9hDCcx+FIt7eMUvgdr8rrAwm587GHqDw=;
 b=ZlMZbknjiDtyuKa2BosaGLw7MYosvoEozFKdEojBPD76V4O04vDOs43utSRWMiNAhf
 PcEs003GP3E0UKNchRumy974M9jEWccVO77L56S8yyP/DJ+78zt9ocHrRxGarlwZkBwI
 NTjhKkjn50c8wPm2DmNCm8Hgmib8y4OltBPlAhGaVip+bstXSzG8Df2QmOa1Y8TuwmfM
 3+yWjVgTB6vKm2K1YAJ9bAyK2/uBTvrbVKHvvB6q83nTxAZ7oiIyAcUOXFz+gJgnMEFN
 J3TLZkeuHSsn6ZqFp2iQmOkZrkH+uex/90cM9+aWKupklAUSFMI1t+9jaiLo3e9N2PWa
 RhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xp3nZ7mai7W9hDCcx+FIt7eMUvgdr8rrAwm587GHqDw=;
 b=cdK6h6YCxCkg6tSFRyhTT/Kq+xAMNYAjuYnxgpVE+tHzkhIuOhHTcMqVJur+pnahM/
 uPGGtJdvXGKA9OVnNOyPlN3U1E1lgzDCnHS/DHpGY6B1gp6z8pTPBntTVv5o7xEEZ5Zz
 UUXihv242/+5b/cf+aAOiMcLX4x12oWnRmHm1hKzB5/EkRw6mBm6KGouZD3oETnLaj66
 YSxSYJ1SPTS7ivWvM4De9187kXUimQpw2pWahhlQFihG4PZzDBwnEzGSKOVBLqOQihVE
 wWvFBIewv6F9dBUMBCz43l9/R1d/kgUSZL3BUV16zyqNnO9gBayRSQYq496OBc3XaM4P
 3tqg==
X-Gm-Message-State: AGi0PubCawZDmV/aAGyxeOpGY13Nj1g5XPv1bO9azdquayuLaTTe5yee
 Vs6GKomTCmOXHfBxxv5zSh1BT28/qjh0GQ==
X-Google-Smtp-Source: APiQypIieOu/Ycs3GGFfnMtqmePJEVo77MvDgn2gvh1ZeHyF7eBEEajmYwG0nxUJVlA8pF2TuZ1i4Q==
X-Received: by 2002:a63:ec0b:: with SMTP id j11mr10277227pgh.376.1587753968106; 
 Fri, 24 Apr 2020 11:46:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h11sm6332928pfo.120.2020.04.24.11.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 11:46:07 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:46:07 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Apr 2020 11:45:56 PDT (-0700)
Subject: Re: [PATCH] riscv: disable ARCH_HAS_STRICT_KERNEL_RWX for nommu builds
In-Reply-To: <20200422165537.26883-1-laanwj@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: laanwj@gmail.com
Message-ID: <mhng-b848b0b1-bc4d-4484-b9c3-0b2da7741dd0@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_114609_622050_3C3D47D0 
X-CRM114-Status: GOOD (  12.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: laanwj@protonmail.com, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 Apr 2020 09:55:37 PDT (-0700), laanwj@gmail.com wrote:
> From: "Wladimir J. van der Laan" <laanwj@protonmail.com>
>
> For non-MMU systems, which tend to be low-memory SoCs such as the K210,
> it's expensive to align sections to 2MB. Besides that, the security
> guarantees cannot be made anyway.
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 62f7bfeb709eb1cdabaccce261320dd0191b3c48..74f82cf4f7816b99fc54155fd40dcf4d40cbf956 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -60,7 +60,7 @@ config RISCV
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_SET_DIRECT_MAP
>  	select ARCH_HAS_SET_MEMORY
> -	select ARCH_HAS_STRICT_KERNEL_RWX
> +	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select SPARSEMEM_STATIC if 32BIT
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU

I took Damien's version because it was posted first.  It had missed my inbox,
so thanks for pointing this out.

