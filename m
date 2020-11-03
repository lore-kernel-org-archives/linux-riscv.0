Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D376C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 09:55:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6BC721556
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 09:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTOV7vji";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVOnFxkH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6BC721556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xv5+Dasdms3pWayfybcDENs9n6vEj8ek86DUGHeRok8=; b=jTOV7vjisLDEBV+eH6NaOBOm1
	0j6xbexyfbjjL6rtdZditSDRfx3HMNgPCAgq4eaFeKSjL93PSevlGlImFVUNDrcpTAyeeZg5dilpG
	zd5Qc1v6rL0RVPcd4trE1R11+pNkiox4B3cvjuvSLYuspcbHZGjrqXMEa+KD0Ghv5Zu4KGmxcc0Si
	HXBKoS6MBVR2OyyycGcKVAQCaBvQjdde6l6OqExLy9FatWO+dCBewWw6lnDmSKkzxjxUbU2C2qGCt
	DWejwuHVHhus4CNQaR6igDruj7b/HPw6o78YT+LDIGKp0l5dK7iNxHNfoS+bolsdCx9BOMLK9TAE+
	U8KDnT22Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt2L-0002Y2-2V; Tue, 03 Nov 2020 09:55:33 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt2H-0002Vg-Jq
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 09:55:30 +0000
Received: by mail-yb1-xb44.google.com with SMTP id a4so14279082ybq.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 01:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/aPHJUg5B3RUfQUFOOBY1vaKVKuqoNKBnfLkp7Eh0jM=;
 b=XVOnFxkHJAJZNHnA/v6Gq5JtUIinsSxGpS1KEgaNga35aGZxYKXo9IhsmUMpabmFr+
 B/c++uqqz8D6VcZr3NW/+TB93t/w+uW75HKVQK5IXbE2s0dIbnTQAVZVeaDveBy74hD7
 1KxggN5i1R8j93SWOxqSKj8bnhuP+6lekISChsMZUelgOTTSPeoXTnkwkL3vRgfYyECB
 hzxJZCGOqjnkmT1xOgFFwKHLdeH6eZ16WCDY1xGZvs4HGVXHbvCs3G/FDbhJT1yS9Knj
 hVLFLdtNzbE+LDNBaEeNKq4lX77kWoA/Vbwjy2QLKRaANDjVlnnRQQ/wV1d05n9ZJU/w
 h8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/aPHJUg5B3RUfQUFOOBY1vaKVKuqoNKBnfLkp7Eh0jM=;
 b=AKtPH//U6kKxoSTbzuk2IN0Zl9JuasRWCtkoJP6v8gAFhLMMA74lIdXwLpFamaU1+U
 8cXnPKBhvqHq9cxjUoF+z8H3weVb85lirtrb2vQyqQQV59SwXAfoEcHMgw29AVJnHz0I
 uU539DPDidfGKGRkktZsRSzY/2n8f+6FW87y7Z/Cu8nGvKg6Xcin4lhHgNnnrYzU2Isi
 0H7xsfCbllysPTmVE28wAQPbOUBkVG660eFMh1o0fWJctq8mLND1p8/OGtWfFtj11Mvs
 lpkd8E8X2bxNJojLPZTEM6sOMZRqkxsU6pNoEhGR2jYTaOLwFsxIcXzpMNHNrxHl+5vF
 8vfw==
X-Gm-Message-State: AOAM533RWwV06qY7Hg7RbaG1R/vdw+1RQtZQkUJ5zvem5dK6oZJiBRQO
 4gsC7DO0fnElzoewQGV3yxXBfkuDJNYifCbHI1E=
X-Google-Smtp-Source: ABdhPJw+K7g1mkaqrzx+t32l56UmOR6oKyXcs5lnQ5hnNBVOjKohJrQmXNa3LmrQ7CBbbSxAwn/P2bm1FOIk29WCzzs=
X-Received: by 2002:a25:bacd:: with SMTP id a13mr29382343ybk.387.1604397322266; 
 Tue, 03 Nov 2020 01:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-2-atish.patra@wdc.com>
In-Reply-To: <20201028232759.1928479-2-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 3 Nov 2020 17:55:10 +0800
Message-ID: <CAEUhbmXknfx58q0Ae0MAZLT3zQuqGyAXXn1wDxHP36LQzew2Jw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] RISC-V: Add Microchip PolarFire SoC kconfig option
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_045529_899864_51C1ECAF 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 6:00 PM Atish Patra <atish.patra@wdc.com> wrote:
>
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
>         help
>           This enables support for QEMU Virt Machine.
>
> +config SOC_MICROCHIP_POLARFIRE

Please put this in the alphabetical order

> +       bool "Microchip PolarFire SoCs"
> +       select MCHP_CLK_PFSOC
> +       select SIFIVE_PLIC
> +       help
> +         This enables support for Microchip PolarFire SoC platforms.
> +
>  config SOC_KENDRYTE
>         bool "Kendryte K210 SoC"
>         depends on !MMU
> --

Otherwise LGTM
Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
