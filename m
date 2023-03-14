Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DBDC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 00:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2VLx+t1Dl7Jv0HU27ZL4C9Frh/g3Byv3v0HW5PO8mY=; b=Bf75u7dkPWorYp
	dljyuIVl+cFCU6vByBAF7k58HW7qkcnnIJ2q9PZ/iTgLsEYFizH/dl6mbvMDaHG3xMopz4dR67Kgv
	fJYJ+2hpBKTknNvwIlTTvSHpxrEQ5JUwgNz0pLd2Tfja85d2eoiSpf3Sg6kicTKEaB8sihM/CzumJ
	WQNbhadJ8iBkUWKkL1ZTYeX1gR6tKZynYdVb4VI6kEoagVuRpSAFZQiqZ/PVsVNhEdezXd1ENG0Eh
	Nd+jdDTFG4w2pj+rS3YjLz5WYUT4VGkV/GZfZrzz0EX+yXwHU36vss4KE6caOKj9jw0WLuE0qWx4D
	UNciGLq9IOfiN4pqv4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsbl-008Qcm-C9; Tue, 14 Mar 2023 00:33:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsbf-008QcB-Lx
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 00:33:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EB2C1CE117E;
	Tue, 14 Mar 2023 00:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F35DC433EF;
	Tue, 14 Mar 2023 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678754012;
	bh=cH5ifKhaPTxmo5PLQqb/zyvosbof39I56R0h8FeXNC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MWHTgNVysvGjziEGiHAVw0H11Ss6i2K9/V0AHyBe0VrnjIpjvHLF8AuYrqC6sbeyJ
	 gCNvV1voB/XNqllE7i4DZQDzE/J2tgOPkDLNBmS/uUls8on5U6a9Pt0BvTbEyfXpbq
	 fh2Xgq3Y5sQzK3aYWrz2dGXEoSM+SFjT9Z/1/m5tSGhjc2cpaVQMAf5AKcKSK+hlbv
	 MlMVXcjPLSveeB3ivGze5jPwwiI0XmuomPrWketrXPjHDezhEXrXZiAs3mhBKjTlzU
	 OmPQgxldMpUWJG4RKTjyFJpVB0eACQG895WTA8yoqarRDNsOIUXsGDO1pw92rs6ViL
	 bVuetgTiB+euw==
Date: Mon, 13 Mar 2023 17:33:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
 <pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
Message-ID: <20230313173330.797bf8e7@kernel.org>
In-Reply-To: <20230313034645.5469-1-samin.guo@starfivetech.com>
References: <20230313034645.5469-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_173335_922270_15B2CB0B 
X-CRM114-Status: UNSURE (   9.78  )
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

On Mon, 13 Mar 2023 11:46:37 +0800 Samin Guo wrote:
> This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
> The series includes MAC driver. The MAC version is dwmac-5.20 (from
> Synopsys DesignWare). For more information and support, you can visit
> RVspace wiki[1].

I'm guessing the first 6 patches need to go via networking and patches
7 and 8 via riscv trees? Please repost those separately, otherwise
the series won't apply and relevant CIs can't run on it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
