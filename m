Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8437CC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 18:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1042206D5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 18:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lhaK0hdo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="kRMViXSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1042206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jEVrLL8kqvhQqG/v9cAUpL83v8DXC1FjJNFFA+95JTs=; b=lhaK0hdogqUa2Ta1fSHXH7Su1
	nvZLxEDcWzx/ilrbmm05+GTmkjOWbeLKnRm14h71C0WF+ayqcizRNRCwUxf+VMlfQv3uzAapBWNWu
	ro2PZlJWmIFpKk5Umq7lYVz2iYfhqGMeZA3C14ymTABxL87S/Hxht19MBjR4fOK3mOXa0/4elNNCA
	d1WEm2ccNwkHqGxkZ0aXFCxSncLij9dTgP9U3k+SRGsKFPoF8ZOg9ZRFPz/467g7HxanCJNVO/I4A
	pDQ8t95Isxhn7SEdG/OdRWyaeBhzRw7DzOvqkqjAIodH384zprhFwTY5oSbuv91uY/OJnugKXWC90
	2Tf0jg1rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkA3S-0004ge-U9; Tue, 01 Dec 2020 18:07:10 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkA3Q-0004fo-Ds
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 18:07:09 +0000
Received: by mail-io1-xd42.google.com with SMTP id q137so2546063iod.9
 for <linux-riscv@lists.infradead.org>; Tue, 01 Dec 2020 10:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dAdg6b6cYixdYgFaCuE0pZDeuMpazwFSdy6lqfCnkuY=;
 b=kRMViXSVAwj+lxBuRy8XKpG2HXc8f31JPSdnGpSmXmn/igFMF+QiItMGxjSeIj7Avs
 rvhC7hYQRVrFNA1Eudpy2mxOQIDcDFx03GkOGskyVkChLfZKebOlZYH38uwQqT0Zx+Vq
 X2MmxsBrHQKx/FozJ5s76uWQ6AjvG6UyBrIHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAdg6b6cYixdYgFaCuE0pZDeuMpazwFSdy6lqfCnkuY=;
 b=A5VGBhQ6nTT/lmvjDmSYJE56pTcd9R/iHf9jaU8fNcSGScnmv6EbXpBjZDuyjnjGbF
 trb+Q1LQwi+FXFzWwQRFuzhcDa4mXO0h6ofw2F1oBTlOygzAzC5Xp2IlZDkM1EZEzRbd
 vsXZQoLF6oXOo79inSXRjV0R48M1F2eYeILcSvao6r0lsKPEjg98zXtuTuCU3WhQO2IQ
 nPxeyvNQERIYKmHkNhwMCbKbQ7LpCqzitNBsEmymhx4GmsHR3ILFhGtnEoIP/g/8gQ79
 uX1fFqc6E6K+xNOSlo80ZTQVOkx2GYj1sBY96h2ar3cN2K+vPhX3PNIKQcXku7DwGVf0
 3aGg==
X-Gm-Message-State: AOAM532oNzdTH3HCocYehda7aK+Ei8jR2CghY1x/ol1T3pEKT5Zoo1t8
 MaxB2e41J9JHgiu0YO/3+FVV0/fyiUpfuJUh+wys
X-Google-Smtp-Source: ABdhPJyW+IBT9JmskDLzbwCZrN0qoqLka2UcsZXfg9sKR3tZPvGf3SB+L7xM5cYaVIPXq+hRhKTdfhGI+mL+K4wISS8=
X-Received: by 2002:a5d:8617:: with SMTP id f23mr3317826iol.174.1606846025016; 
 Tue, 01 Dec 2020 10:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20201201110316.28656-1-conor.dooley@microchip.com>
In-Reply-To: <20201201110316.28656-1-conor.dooley@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 1 Dec 2020 10:06:58 -0800
Message-ID: <CAOnJCUL3qELbuDAAgyGB8jMP3x6WB1qhubd3UZNKqE5zs1B2wg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add microchip polarfire soc support
To: conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_130708_547087_5E5348DF 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 cyril.jean@microchip.com, David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, jassisinghbrar@gmail.com,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, lewis.hanly@microchip.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 3:03 AM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
> directory
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I think this patch will make more sense in my basic SoC support patch.
Can I include this patch in my series as is?

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2daa6ee673f7..2241bdac4816 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14989,6 +14989,15 @@ F:     arch/riscv/
>  N:     riscv
>  K:     riscv
>
> +RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
> +M:     Lewis Hanly <lewis.hanly@microchip.com>
> +M:     Cyril Jean <cyril.jean@microchip.com>
> +L:     linux-riscv@lists.infradead.org
> +S:     Supported
> +F:     drivers/mailbox/mailbox-mpfs.c
> +F:     drivers/soc/microchip/
> +F:     include/soc/microchip/mpfs.h
> +
>  RNBD BLOCK DRIVERS
>  M:     Danil Kipnis <danil.kipnis@cloud.ionos.com>
>  M:     Jack Wang <jinpu.wang@cloud.ionos.com>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
