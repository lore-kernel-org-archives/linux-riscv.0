Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8DAC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIhyDYgkm7sG6iDrUIn8DnqeKg1uiMQEPz4GpuuQ9Ts=; b=l6Cmgi522dqP4l
	YnYR8REv+DHCp7Q0iweQhRD9P9qqKNdRss27nG1vMKlDR0QZrnBAbiIUfgDKPLnDDcGWDAvqVBdSM
	XeKdTPe9X9zMrnmtjZcf7anl8KurYtq/20/NJ84wgLoen/g+zrDpxFTFwG6KbLi+/Rm9ui/taKjW1
	xvWaOcxu5h8LxF5SH4dOihINDhGxNgno7gO5bLGBdjHZjhzPCpcN0v8Fo4geJ+FSc2aVnPVd3Zy9y
	uUXotUSp4BwopIcO4LzVi0eNTGypuNCw+hEmkdrKIY7PmN1KaaZXfqNrujyxAqe5rx+GbUMUHDRqI
	zYTXp8YAI7UK3qZ+eNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUCTM-00ANrk-Kf; Fri, 02 Sep 2022 19:37:00 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUCTJ-00ANne-UV
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 19:36:59 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11f0fa892aeso7201413fac.7
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 12:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sXNxzf7M7fo2fs+7HnVoTwx/Ib6H9B2vXsq+d4vdh3Y=;
        b=x3+g6zYT1iV2na1ij7jEKQiW4sWaWPsACLCp4AEPxHQEVwvCqOD1kHCulzLoxi8FyH
         2ccVKZmwcd3L99LMR8lF2K/zWh4rUfVgGxi5eMY7X58ef9COh9/egoFlStUmpiW8gZQt
         4S6y4DJfObHxp+oERmLtxXD4Wdxrv7pzeKrvMTTQ/pfsNEqv+gfTmkvK6rzTpxGwDmbj
         AIr/tnWNkH18AvV+JyEjQI5nifphpYlcQJkxDnEKtGBZgKYWY38t6uCPUHUyDtZ6ZYlH
         FCOUOxv3TJC6lM/myNY2Eb7jMDiXeQjgo0XUF7KC9tRtkbB/R7FEiB5VL4Iy306Zq8zc
         RiZQ==
X-Gm-Message-State: ACgBeo2fHYs+vZME0rE1VL8+GbXAPU0eBn4Tit7BQolYR8AftuYL1y4f
	81XUAd9mgAkHsmW9Y3rWQQ==
X-Google-Smtp-Source: AA6agR4I3AfQ8eyxNtpSiOalgILHga7aBwL1V50UKJN2u3JthWlOpuJuhUV617oa0D5wVTVOyF1Sbw==
X-Received: by 2002:aca:3010:0:b0:343:91b:7f7 with SMTP id w16-20020aca3010000000b00343091b07f7mr2500590oiw.51.1662147411242;
        Fri, 02 Sep 2022 12:36:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fo10-20020a0568709a0a00b0011eeff77d1bsm1607351oab.10.2022.09.02.12.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 12:36:50 -0700 (PDT)
Received: (nullmailer pid 286047 invoked by uid 1000);
	Fri, 02 Sep 2022 19:36:50 -0000
Date: Fri, 2 Sep 2022 14:36:50 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Dooks <ben.dooks@sifive.com>
Cc: robh+dt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, aou@eecs.berkeley.edu
Subject: Re: [RESEND PATCH] dt-bindings: sifive-ccache: fix cache level for
 l3 cache
Message-ID: <20220902193650.GA285986-robh@kernel.org>
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220830125133.1698781-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830125133.1698781-1-ben.dooks@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_123658_000788_D6E533D8 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, 30 Aug 2022 13:51:33 +0100, Ben Dooks wrote:
> With newer cores such as the p550, the SiFive composable cache can be
> a level 3 cache. Update the cache level to be one of 2 or 3.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive-ccache.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
