Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2547EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAN7YqgWQfyQSPZ+/pyVxRAcSBpwmS7HX7OImBRMOag=; b=mlUCeybunFQ0wi
	AvwTrTdVaUjCDoKDjythTBiW/t2TCgeFwAWUEpPFyylMHFiO7hOVO5CMnCQnUirpb365S8r+QAOKL
	wN0UJRQeCAYTWcVNPdUlyMf9oA5KRePiNgdkCS4Q9KUlRJOgIJhMYlHPg9lkkRFEwoimLXHUus8Lv
	F1r2egkUo1qOe72/hswHCZI9Y9oSMLCqWEaEYNpIjRbLqjSRjOxZAevwH2S3cho86M2PLDvOcOAoo
	MeIRAJ6cWASWflbp6kk90swBVbxJzx3UH3eFNXjmABws6RvL+LCTdNsD5cTIgveCwA0O5pFAgsO6D
	8KZw8xJDmbWAww9sqSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnlN-000fIA-14;
	Wed, 23 Aug 2023 13:19:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnlK-000fGL-1S
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 13:19:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 905666628A;
	Wed, 23 Aug 2023 13:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAB1C433CA;
	Wed, 23 Aug 2023 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692796744;
	bh=OvhIgHZmORNVFi07F01ZpcKqdw0vzuMy5UHAeo7OqEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsNnBmyhVMn7ydJeXv+04oBIi8+t+UBbIV1WfVTVptD1nJGHfYr5Zb1JCWSoLTZun
	 pdJCuhTO8fLiV7ryRY2DJJCE8XNocPVCyfiWJSo4MTLUgBVsGk4kKr8UTdfmDROFtq
	 Ad4yZioJ3vs4ML6CxK4dtneFlUC6a/qURrhtnNf4NeuG609O00yvuG37MKh75rL58k
	 KbAIwsppMgv+fdnDzyHkAGgbDdGjeCwyz8wvevFjPdpYQV6KDSR8JmaBL2hy5xQ2Jx
	 xZ9vTxcCmoCQDiijUHghe1pK+GvF2ByAsGsrFxqh+g4H/LVF9L9oHtV3pSV4XIzWTK
	 f3tvm6XhHO1fQ==
Received: (nullmailer pid 2200303 invoked by uid 1000);
	Wed, 23 Aug 2023 13:19:01 -0000
Date: Wed, 23 Aug 2023 08:19:01 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Walker Chen <walker.chen@starfivetech.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Claudiu Beznea <Claudiu.Beznea@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Liam Girdwood <lgirdwood@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: pinfunc: Fix the pins name
 of I2STX1
Message-ID: <169279674097.2200246.2480753930062149907.robh@kernel.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-5-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230821144151.207339-5-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_061906_542056_BFA10873 
X-CRM114-Status: GOOD (  11.61  )
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


On Mon, 21 Aug 2023 22:41:50 +0800, Xingyu Wu wrote:
> These pins are actually I2STX1 clock input, not I2STX0,
> so their names should be changed.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
