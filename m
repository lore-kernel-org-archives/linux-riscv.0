Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F58C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=xfTu2JU95jMvHt
	sbUk+SSLvgEWQF90UNNGny2/KadCKzFWn4XqZTe1rfw5iA5283IKYLOLH9M6whDG4dEizRDaDPqkn
	vcxfWfCoCaqkT6s6/TpJp+n1HrouDLsDrjNWe/Dyo5zViZ10+JK4O/DTD4L0OXx7zlk262YUgDn4g
	1AO0KuWJAM8kH89xyqA7gxnZcAv09aZZS1MXjFKAe/VL/ibRHmbEw5psiLUfpzDfdyjjQMU+8UtNt
	ukm8tvA+jfog0T+C8DdBHqaBtfBJuqB6JKXrus4P1hDDpT960AgGvY5E7Q3irm3s5O5CAvJrGVBvi
	DmNjXhknZpL0aAVgpsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzdu-003hWh-D6; Fri, 18 Nov 2022 11:34:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzcH-003gRw-VD
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 11:33:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06B5862409;
	Fri, 18 Nov 2022 11:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FFBC433B5;
	Fri, 18 Nov 2022 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668771182;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uE2t+qiCW5Jj6XFhfraaUREQc9Sqg88sUu+8FEQ+OC4Zgo6HWe4Fb2gp7HXSFdFKF
	 o+Ugfr9d7Fglo05LPcerxu+IFtHv1NZr9BRM/Le+vn3XsMAmDMrsxTm9lwMqb4UqxT
	 FAq+0Fnuz3uNsmRl3VH5M9CrTTVIwQ6AnJjeY81M52Uvb0tvO7354NIGgoaxjMTkM9
	 lobNB3LE5MRce4rYpAP3woPU0fixQ0+MOSTcOZyfPryU70soN+wMz3I9K3QLcSJ4dN
	 fOyQN5lDhMzGOdF/xFFxG2RWbkfjyMPqRdUfAx9LrNCTa+OhkHpGmwQ0NGYFpViYIJ
	 cKWuendrlk0UQ==
Date: Fri, 18 Nov 2022 11:32:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: interrupt-controller: Add StarFive
 JH7110 plic
Message-ID: <Y3dtaJArPvraRBOq@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033306_072272_012C21D1 
X-CRM114-Status: UNSURE (   7.13  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
