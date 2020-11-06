Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B456C4741F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B3920825
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgnb2oZb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="aIFAyjg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B3920825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2LgtJIsWonm2uPi1+IV7YWU+UNCJQcpQQvsYRBuupIM=; b=pgnb2oZbxWYhPjutBRgInADIp
	86YaA95CPHSRHsJMP4fsjTh/MGFAEj1VWb7tQ0sQOwz6IyP6eQq+/M3bROgxp0xO54I5kQRoFysx1
	E6o0AwQ/is6z9QN89udBzHsLkEMYcu69UVhCS34Qhl83Z03ybf567o2r6oMJE5MlMmx0d5oXZqbmP
	feb+DKiQwtpMqReUD8CC9NsyDIn/pkBVsmyWBhtD8XbUq6wTy1oZffJg/upd5rXhAtuKxYHe0p5xy
	De7ZHfSPvao7OtX7/Iq7qVJo1VHmj7rOo4hA6ww1mtEZu0LPtxsr5sOwlQmnUFGdwipiKpvn4iZZC
	jhE5idhDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavxE-0002tv-K4; Fri, 06 Nov 2020 07:14:36 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavxC-0002sb-OL
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:14:35 +0000
Received: by mail-pg1-x542.google.com with SMTP id x13so244583pgp.7
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=s6YH0eSX/RwKBuEX1w8IFmHtUiOjP/eJyOwuklXDjTY=;
 b=aIFAyjg+EyzWOA841bpmazYcgV0AEulGrJoP7hNS4+EvMG+RSK1jTROG3a5pH/GI+K
 DkTA6VDl4j7/iESdcTK0dpUFAWWF9yaZ/LSzXIYSivrxbEuxmhmF8kMrG0eDpUWYt0Yr
 WwChrkAa/SYesmZ96R97diB/kOp3JEj8SR1QQI+4iBl4eOMdMlGzaIWfdIIwA/sHwpmN
 gTuSeVR4J5gm6xa1nT5gg6/Q7KX3v8BS3wBOiS3Zun/d6+JTj2YlJ/VRV3GJicCjOzwx
 LwluV5esuaGx+mc228szbCmDrUNatBJ9QnvWfAEOIkEvPWA5b6OAicG+lUmBdYsfdnhx
 fL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=s6YH0eSX/RwKBuEX1w8IFmHtUiOjP/eJyOwuklXDjTY=;
 b=lUtwRofDcsWJnm/LSfcC+Ful1WtWVpPcJzmu5Y6c2Dv7b/56eafA+HfmSfRniGuHFp
 bUfqfbvgJUn/dPf8IP7gUljZYKemeax+oSpG0DQspRSzgRMcdcyCZWEbWA99/ooBwTrY
 KJUAy4oImAGAjUJdJvoAtqGo+PFjRHDGcGfrI7h3EKNwtxaA4zED2Lwu9tTs+ju9pOqj
 uI+EZg6TosY/UUNM5XEWJuZu9FUwa8KgghBjPDpimoOKgIqocv8z5pgn1rl707OYba91
 2h7SfmTaJcTZyZa1oaLpsOaa0KZFlGDrxGmKgLyWVtmi4VbP3qP7FX3BWwa3GKapcuJh
 tw1A==
X-Gm-Message-State: AOAM531zbXPMtWye6t8Sc6olBtmMnf+rQAVjYT4X/4xin2UHOPbn+kKD
 ox7w5q5h5Vl/ZH/1XD2GuDviqQ==
X-Google-Smtp-Source: ABdhPJwO5bd7mi+tpUBxCMN/fsu4RTpUPPzVVz7lSqd3QdBGhSN0bUat6hJsfWe7wtQ9bgwt6mCPPw==
X-Received: by 2002:a17:90b:707:: with SMTP id
 s7mr1034437pjz.104.1604646872545; 
 Thu, 05 Nov 2020 23:14:32 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s18sm632539pgh.60.2020.11.05.23.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:14:32 -0800 (PST)
Date: Thu, 05 Nov 2020 23:14:32 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 22:54:57 PST (-0800)
Subject: Re: [RFC PATCH 1/3] RISC-V: Add Microchip PolarFire SoC kconfig option
In-Reply-To: <20201028232759.1928479-2-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-849d17e7-0bff-4d49-b7d9-28909d199dfb@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_021434_828018_9AC09039 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 padmarao.begari@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Oct 2020 16:27:57 PDT (-0700), Atish Patra wrote:
> Add Microchip PolarFire kconfig option which selects SoC specific
> and common drivers that is required for this SoC.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/Kconfig.socs | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..74d07250ecc5 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,6 +22,13 @@ config SOC_VIRT
>  	help
>  	  This enables support for QEMU Virt Machine.
>
> +config SOC_MICROCHIP_POLARFIRE
> +	bool "Microchip PolarFire SoCs"
> +	select MCHP_CLK_PFSOC
> +	select SIFIVE_PLIC
> +	help
> +	  This enables support for Microchip PolarFire SoC platforms.
> +
>  config SOC_KENDRYTE
>  	bool "Kendryte K210 SoC"
>  	depends on !MMU

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
