Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BCC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDnJPDY6mDOD8xMJdBSejNl9xapMg10CAHgHcUMlk+4=; b=pR6UrRAgrCvfr2
	2aA/2eX9xxPgFx/ffkQ0xC3YmEZcEHg3G5HgY9+dsrSvuEORMw7+UdfNNtK/sMdcfUGozQJGUiAgs
	INko3F0eelttR1td+A4rtA9ZIr/VLmKPIQLbc4xWqb8PEArJafYIAHPM9w6r98m1/3OjNufHx77RB
	8bmYOb5120LA013SaxtJP2S2UKbydRbEa1XZdrOQG4GynjKIeO7dBp6vmn5QBpNxKAgK1f9L86pFW
	bOTnWYif22wbVmKOiWjZtUUu6ITo5jYg0dfgFjZLY4k7jdMt3hFo1qwdIsCqcAO4Wubz0Z9eaL74K
	q7JElCwd1nmgpf+CLAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW11-00DOPi-0b;
	Tue, 19 Dec 2023 09:03:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW0y-00DOOr-0W;
	Tue, 19 Dec 2023 09:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kp2ztNtcVx8XCuG+qC0xBUhfHysW0jp5KEROJFGE1lo=; b=Isxg0mGQOnGl6uXuWTHsjcBdJL
	tIhs9clfT7rN0FByPLChS3pAbF6wXQW8T6J0P3xnyxiE3DC4yjk4fRrddUIdcFKmAOd9Df9hyRUDR
	36COzrVzKeQFhIbhEscPyRjbYyajNc9hnVT6QM4rmDInxMG7OuTaPHLHzDklHG0gsjaA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rFW0L-003JlS-Az; Tue, 19 Dec 2023 10:03:09 +0100
Date: Tue, 19 Dec 2023 10:03:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 0/9] Enable networking support for StarFive JH7100 SoC
Message-ID: <a37d2df9-e593-476f-bfef-d9abaf063daa@lunn.ch>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_010348_194679_E2E5A2E6 
X-CRM114-Status: GOOD (  11.41  )
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

On Mon, Dec 18, 2023 at 11:44:40PM +0200, Cristian Ciocaltea wrote:
> This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
> available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
> I could only validate on the former SBC.  Thank you Emil and Geert for helping
> with tests on BeagleV!

You will need to split this into patch sets per subsystem. The changes
to the stmmac driver can then go via netdev, and the rest via each
subsystem maintainer. It should then all meet in linux-next and work
there.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
