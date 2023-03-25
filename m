Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505E2C6FD1C
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Mar 2023 02:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hxen0+tpjoAShlpQ2oIX4LWYXbQZq8S3Hv6NzaaehEw=; b=taRwvWcwL1ryNk
	iZ14sjenv5ndt2P8OoXjVzRMl/0rtGD44x3cH3RhghjnD4sRRsbKq3xN6QvWlsuPjtbn0T8gbTbuR
	3/lT7KrnpGitjY64LVYxp6b4hWrMW3IDQv+SmJyezl929Ko/ERFGINrfFL19chIxEqliWjXHi/m5s
	Bv3VL5ttw/VhbjLtg0jibYlKlnJEm2UwSXyNfc2hzB5C/2+YeENjMeV0SLcC1C6cmN8iCNJCKxy+Z
	SBElIh60X+/KOVOKUnw0JYvP6yZfH0be3KjVqWw0pIOFY6x+NjZXkQjy+LMXzQadcaFxi5M6Ldgpi
	rkg3xyPVf6a3cDJdwVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pftZz-005zCw-2H;
	Sat, 25 Mar 2023 02:24:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pftZw-005zBz-1O
	for linux-riscv@lists.infradead.org;
	Sat, 25 Mar 2023 02:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33604B81DEB;
	Sat, 25 Mar 2023 02:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066A7C433D2;
	Sat, 25 Mar 2023 02:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679711061;
	bh=9AXZA/QaTCInErGamxaamrpYwzewXW8Q+jAbhTnDpZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YykKZJjKELjFqYn7PoeyScG06SZpvHpnGDE2d5d2mO6We8UP8ONCVpmT3y+/ewgV3
	 Ccn9MYqKrCLsfb3NLbMwI1BRydITymMG3oIl5U+usaBnBNH62UYYYq1Ad1Mt37SE17
	 JYtQRoJa/3RpmZJvuoJZm/oF6iSr2oOVhQuJZGbYHk8njTTdluxBlb49ajQIKlozN3
	 YLruh6wojoC50DaZknX+lVg+EElfmqX0nnvlJvqD3YEnzGo5HBtORE9S9z2OpZtT4s
	 VGQlLGQTIMpJM+iPdxpIy5QmC48gYxNvKjpew9pXyymRpCo6kMtAosKua07yHjDneW
	 uHvNmJA5Ge0wg==
Date: Fri, 24 Mar 2023 19:24:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>, Richard Cochran
 <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
 <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
Message-ID: <20230324192419.758388e4@kernel.org>
In-Reply-To: <20230324022819.2324-5-samin.guo@starfivetech.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
	<20230324022819.2324-5-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_192424_633470_A201E77A 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, 24 Mar 2023 10:28:17 +0800 Samin Guo wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebc97c6c922f..5c6d53a9f62a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19905,6 +19905,12 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
>  S:	Maintained
>  F:	arch/riscv/boot/dts/starfive/
>  
> +STARFIVE DWMAC GLUE LAYER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Samin Guo <samin.guo@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +
>  STARFIVE JH7110 MMC/SD/SDIO DRIVER
>  M:	William Qiu <william.qiu@starfivetech.com>
>  S:	Supported

The context is wrong here, could you regen the series on top of
net-next (and resend with [PATCH net-next v9] in the subject while
at it)?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
