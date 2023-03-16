Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D533EC76195
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxXIwTHqM579d1Ok7mYVtM2TQK/dwtNTjswLgu6Ck6Y=; b=tIyJvTX5cUgBw3
	OrlBrCtJfnI7PQP/stuBAsjz6h+byTnDf9+B8rxPY71lFaJ17HaDCI7iaDTKxx2blzB1RggvW57jk
	tO/eNMSkOwMnKY16phDdhGcsk9cjZ2VeP/Paq0GtVkNERral0ssT7HrYgSPVuvdu/2wRVcfJPyatf
	EGufKExAQ9MEM+w4BlFsw/1Mao+2ijJrFZTclE7X38uvd38OPJwdLZDrMd1mlvCjTKXBSLZJrjTj4
	9LukGosNIyx0oxFk9ZvM40RUWL0XMA+GM6t+Cp1YOWD+tMUdVrmOVddJ9M4JjyJ6JqY8FsfOavlZ2
	Ynv2/Skho20QHO9nXdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcuIt-00HWTd-0i;
	Thu, 16 Mar 2023 20:34:27 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcuIp-00HWSg-1y;
	Thu, 16 Mar 2023 20:34:24 +0000
Received: by mail-io1-f48.google.com with SMTP id g6so1357782iov.13;
        Thu, 16 Mar 2023 13:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678998860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CYbM47sU5ai4TXEql000Ah99D8S1/cVmeQxmiAsqhs=;
        b=T/8O4InJgxO99yqVkV6QyhigcDBiZ+E45d2Hu6L3gMJssELM14WdtkjsxVJr4ckOGM
         UEWnfQqNCuqnTfc8TBuf0yoDH4rnqnnSbh3bmjt/KSZ0hxQF6keJx8zVDpRwKftU1L50
         L+aQI+dVDeTKx5hHwqwmw5eCwZTHrUCNYK0mQTTmttRjdTJamtEftECeRYDR+YOBX5Rl
         mpf26J3sCusA4WZ2Q/mDR9b1l2tzfPgoBSB4M2L6cArcS7/F/w/1/ZjnoI/+y6/mh4lO
         3F8avsoCiySu0HiZKhn1Luw0gDYMLHDcjs+344C9yXfEwYSsII6NAenjflwvPCG9Sp9B
         nHkg==
X-Gm-Message-State: AO0yUKUJUdJ9LbYtHq0s37NSNF0OySQ7CaXuW5XxIuj9eYVzx/KQorXB
	8jWmcvcyyIo6nXI2V31sbQ==
X-Google-Smtp-Source: AK7set95htVCepu2fkqTuH63ymkWubjwHz01woOvMx5gt6cqqYiqMELyvuyd4SP0vC6lmQKNMoI68A==
X-Received: by 2002:a5d:980e:0:b0:74c:8b56:42bb with SMTP id a14-20020a5d980e000000b0074c8b5642bbmr102686iol.8.1678998860080;
        Thu, 16 Mar 2023 13:34:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id q15-20020a6bf20f000000b00704608527d1sm43269ioh.37.2023.03.16.13.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 13:34:19 -0700 (PDT)
Received: (nullmailer pid 3837822 invoked by uid 1000);
	Thu, 16 Mar 2023 20:34:17 -0000
Date: Thu, 16 Mar 2023 15:34:17 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document
 assigned-clocks and assigned-clock-rates
Message-ID: <20230316203417.GA3833267-robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_133423_668857_D0076273 
X-CRM114-Status: UNSURE (   9.35  )
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

+Stephen

On Wed, Mar 15, 2023 at 01:47:56PM +0200, Cristian Ciocaltea wrote:
> Since commit df4fdd0db475 ("dt-bindings: firmware: arm,scmi: Restrict
> protocol child node properties") the following dtbs_check warning is
> shown:
> 
>   rk3588-rock-5b.dtb: scmi: protocol@14: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)

I think that's a somewhat questionable use of assigned-clock-rates. It 
should be located with the consumer rather than the provider IMO. The 
consumers of those 2 clocks are the CPU nodes.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
