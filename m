Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDDFFD45FA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 22:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mcN0V2J969NNbLkYwFijN0nODdv4aXVk7rbViHYUOI=; b=V7SR4GkeLukCLS
	zHCIIo1UfpALeXXXgRjo1mgmalb9f8mOg6es2LGhv4nSR74D4YgHIoVuEG28gxMd69ZBqqFq/U+7i
	RI9g0PXkNWj4MZyR7vqvYw4ICx8pIW7oBmfzKrSSeHU/viCM1k9UX1AoiR/812sBW/6sbodq/2n9B
	cgCI4cMV3vKi/rKCwE/ln/l039cNISxCZF/N56PVyUbYajvgKATGrX43Kr8tjWteUq/pdWS91t9Tu
	tKjf6uPnH7QPvbt7GpD8NTInsIm2qE4uu4LZKnIGm5ETnr7DHdvTQLQokjpxhvpFjGm4dXaCRwGRg
	wO5YNVelqDisKfgjV7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNoW-000000051zw-3x7e;
	Wed, 25 Feb 2026 22:57:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNoU-000000051zb-02Jp
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 22:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772060219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GoTj0XJIraxE36kErcF7CkdwsGLSTR+HFHvb50C3Fs=;
	b=PeWLozsbsHlYhkqnrZeXqF+vk9nnOPhQFAtyc3MamUADTkzKQen1SWGc4j0/CAaUteSHol
	esSPtATfvaLgnrQwSKSlRcy75xF3CMbnvdcpom7lTv+cD93CYTRDig2H7eygJsdVEnoFYa
	fyBsvLVd2tx4csCOQPEmZ6tKpepbmJQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-bhiAQ3OiNdWjUIYQlzJG4Q-1; Wed, 25 Feb 2026 17:56:57 -0500
X-MC-Unique: bhiAQ3OiNdWjUIYQlzJG4Q-1
X-Mimecast-MFC-AGG-ID: bhiAQ3OiNdWjUIYQlzJG4Q_1772060217
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79402e48414so3340247b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 14:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060217; x=1772665017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7GoTj0XJIraxE36kErcF7CkdwsGLSTR+HFHvb50C3Fs=;
        b=NxEssFNxCh+05c9OBm8hFAc5Dth4iN4H45lnsisx14Fqq4l/xsTUxJVu/CSUFy6Z23
         yjWBXJ9Wp83Bztjhbp+fXy52e6g4+N7qkjj5KfV/95Yaz3hX7kKwuZ8G6Qvte2tg0HUR
         IlYhuwu2jHXJU6YNgu+3Smx1OYYKYINjA79tLKPJhmUK8G4ADCMNROWAJcjXGwDc00bb
         n6zuEWbwviOLJtddQ+Tx4yGbmf0NquZwapcdridPSdEPh6WMbyODj33tHpSj2s1ryYml
         7C72sbmt3YFQG+nw1myKz6ydg/ZRmJStaERVK6QmGJJ1froT91MXz+hg55XhbI16jkT4
         Rzbg==
X-Forwarded-Encrypted: i=1; AJvYcCUQp1L9etXBVBKqWbq5t7NoEaL8LpgB0znmIF5DpeHJBdWpt8DexMx13igs5qT4A/J9hmhXVY16+dNAKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1rFWxP+r1IqRF12s5Z6pI/bS1cTmaQNrwsKsP1tk631vFxVO1
	CpOiwduplqaJcdq3IoNADr0SIVjcfN5a+evMUS2PXoa+KRDy9iz6W7cYKQz9PczE42lYak9G5tz
	Y6OkoQSliqqddGj6VUKD0zM6sQUgOvRH60pvEtXAZ+HFmnUtkMrUA9SWymNp7vZK4diigoA==
X-Gm-Gg: ATEYQzxcGNJJOGhVXFtmxhYCU6KCCASO/Wr6q4vrBLX14IYDM9qNHmgElbDsSGKpAqN
	2mty2YMMMyjqOz1eWUoEafz2O8zNWV2/L6Qah1+ryOsYry7Klg7iFSujnfs6+AryTaOymGWZsD0
	31kbN/ZoVZVje5uV2YN2LBWt7FW6HIApIuko8tdKyQgIjvVEsk8k8/lw2kIE2K2tFDbgOuWpAOa
	4ESMOOkm688QgvXmB2P9hIEV5Bdr1B0zumqbBrJmcIGILW8+uZvPI3BiPzOLzjgMnayEIG1Zekm
	yBz7hwCN3uOaPBQ9gelwVOowWgV75mHMcONDIli3gb9TC8jt8Mh5js/hc3wch5sp+RcbzzdMT/Z
	2X7RVE+Iu//VAVqHXldQ=
X-Received: by 2002:a05:690c:101:b0:796:4154:9fab with SMTP id 00721157ae682-7986ff520ddmr20295337b3.41.1772060217174;
        Wed, 25 Feb 2026 14:56:57 -0800 (PST)
X-Received: by 2002:a05:690c:101:b0:796:4154:9fab with SMTP id 00721157ae682-7986ff520ddmr20295137b3.41.1772060216778;
        Wed, 25 Feb 2026 14:56:56 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ac3c0dsm1236297b3.12.2026.02.25.14.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:56:56 -0800 (PST)
Date: Wed, 25 Feb 2026 17:56:53 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access
 during output registration
Message-ID: <aZ9-NWiX4wMH3Ay6@redhat.com>
References: <20260224-briskly-scholar-294d13464721@wendy>
MIME-Version: 1.0
In-Reply-To: <20260224-briskly-scholar-294d13464721@wendy>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vAPxdFwU52UmMDP2ToCbsjPD5FmgEJWlyKYbBis2yUk_1772060217
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_145702_122847_CE808414 
X-CRM114-Status: GOOD (  24.33  )
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

Hi Conor,

On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> UBSAN reported an out of bounds access during registration of the last
> two outputs. This out of bounds access occurs because space is only
> allocated in the hws array for two PLLs and the four output dividers
> that each has, but the defined IDs contain two DLLS and their two
> outputs each, which are not supported by the driver. The ID order is
> PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output IDs
> by two while adding them to the array to avoid the problem.
> 
> Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: linux-riscv@lists.infradead.org
> CC: linux-clk@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     out_hw->id);
>  
> -		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
> +		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;

What happens when / if the DLLs are supported by this driver in the
future? This seems like a trap for the future.

According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
only 16 clock IDs. Could hws be initialized to have enough room for all
16 structures, and would it be ok if it was a sparse array?

At the very least, I think it would be nice to include a comment here.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
