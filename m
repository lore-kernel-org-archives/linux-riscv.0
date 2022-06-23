Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461EEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhhBcopXuALqPeQGK93laZjKbpYyPsbHXm+IgqG5pk8=; b=SSpiZnqwmfkMxK
	coU5LrRnhQigplMT7X68ooS4McBT0FOrKZjsuYwVIMbDfFQirqy0ygV1OO8YMqbbypBOjOM8qwlUj
	Pr0ACu2bpSMOpLZn+ZGHfraqEBj9S2IJBbB+03z9Zxb5P1FGkNLimT7cRuTG+bKF8yPHxAqt8i2GE
	Bqgp1wKnnrhScXQU1YzmyzGvYn+sasT7zvQ8tMBXBt4k1d0KHb7y/ep08501zu9RyrqRLCruBxSnc
	vTa1JRjvY1cTjc2IWgkY6cfqcKvWelJ6BIxWRtHw+CSuLzy2kAUVgpegkniw98av2/WThtvbSHv3H
	bo1qp5poYs6aaCiCYqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4K1T-00EWAg-0u; Thu, 23 Jun 2022 10:25:15 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4K1P-00EW8w-VE
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 10:25:13 +0000
Received: by mail-lj1-x231.google.com with SMTP id n15so11112586ljg.8
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
        b=PIkKFT6MmcaUETNYYp/00cGxbMns4B3hZ5K5nmtGI6rNA0GIEW+mljG/Fne1m1MoDJ
         hEob9rUTJYEcXgm+2VfxUeSgEiCC4beWQTqOtIjvrmPzJY59yY0aQjFSYFq6uZ+yCsBY
         TkSAwqVecLhSbMBWc2qGK5asYINBDeVKWuZfIJIRPVXH2ooAOk+CilaQasEiFEnBPvo1
         9yU7sRGCq0pbvG7DXQEPHm1Bepg/+EXQeJ5lKtflHEWo024/pU+tCE0tyKXp96P7eK6/
         MtHCviPz6ujkgIRgMZdT9HQ/BMuTmBvX0T0E+5sbw8JvnmtJwX+DR8LPIVdwao4FUT9T
         fbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
        b=b//hRKgM1g/EkyBP2j5OuJ/b5neHWSRPIj014MlJV48n2TiNhzFzwy/1zKBJsAroi3
         smM2uZUb5tLIrZpjleXDv9K/1gLAztopU+kyCJRvUQE60dapdhS5R8v9HV7+oh2WZ4vK
         4CyRACtRRLU+BCW/1Acyr3LpQsV5vxD32jGwTQ0OfIX61ueYu+gsk6bwB2yyPBjmFTWh
         NCpjQ8irjRhyYIxgn+jePcCvlZmv62v4oS09eh5DtJysyD/0wL9kqZbv7JtmSf3/OZyX
         wKcOwLX9mRSqtAWiVjDdgWVvivOeKzamjhv1Zci4lsHwFyQYtGFeR2sG+M/A7PhMJlBE
         N+CA==
X-Gm-Message-State: AJIora9ISttZ5cWOFgowvP2nxdd9bRfkjNXlxHVo387cRm5UgBGNMrR6
	mpqRojcIsHnU0LSIX7g/Fl8=
X-Google-Smtp-Source: AGRyM1uzm9hmF9QK316rJoAfTTvEoAQhcLS5DK1sh8QXwvTquRMs7E5mQ7FvnFV0WtaDWVYa8qbSYg==
X-Received: by 2002:a2e:a883:0:b0:25a:8d91:27b4 with SMTP id m3-20020a2ea883000000b0025a8d9127b4mr2875724ljq.509.1655979906447;
        Thu, 23 Jun 2022 03:25:06 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id z1-20020a2e9641000000b00253deeaeb3dsm2727519ljh.131.2022.06.23.03.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 03:25:05 -0700 (PDT)
Date: Thu, 23 Jun 2022 13:25:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor.Dooley@microchip.com
Cc: damien.lemoal@opensource.wdc.com, mail@conchuod.ie, airlied@linux.ie,
	daniel@ffwll.ch, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
	sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, daniel.lezcano@linaro.org,
	palmer@dabbelt.com, palmer@rivosinc.com, tglx@linutronix.de,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	masahiroy@kernel.org, geert@linux-m68k.org, niklas.cassel@wdc.com,
	dillon.minfei@gmail.com, jee.heng.sia@intel.com,
	joabreu@synopsys.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220623102502.jiksqr3m6y733haq@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
 <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_032512_032690_59DF4757 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, Jun 21, 2022 at 04:06:21PM +0000, Conor.Dooley@microchip.com wrote:
> On 21/06/2022 00:17, Damien Le Moal wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 6/21/22 07:49, Conor Dooley wrote:
> >>
> ---8<---
> >>>>
> >>>> hmm, well I'll leave that up to people that have Canaan hardware!
> >>>
> >>> I will test this series.
> >>>
> >>
> >> Cool, thanks.
> >> I'll try to get a respin out tomorrow w/ the memory node "unfixed".
> > 
> > OK. I will test that then :)
> 
> Since the memory node hit that dt-schema snag, I have not sent a v2.
> Going to be AFK for a few days, so I dropped the memory node change,
> changed the spi binding & put the series on:
> git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ canaan
> 

> If you get a chance to look at it great, if not I'll send a v2 once
> the memory node is figured out.

commit 84df6ca0f277 ("spi: dt-bindings: dw-apb-ssi: update
spi-{r,t}x-bus-width") looks good to me. Feel free to add my ack tag
to v2 of that patch.

-Sergey

> 
> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
