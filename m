Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3057CC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPCYrs4qR1G/OwoP9xVSfhb0XpPNMD0WE7sFEO/Ougc=; b=V5e7JSKlFZ8kbY
	rvBJgeM9a6FRFU7sFIAP68HgMUHPwVSxeER2FwYhHFaBg4rOIyEBXyTVQapelMP902Tmbz3URFq1j
	qMeZYNdy3JhLKYEwndyzxmMBSV4EJfIPORCJwSB1TCSaVAtqDDjbUK3A6O91xHF8us4wRU9YzsNGQ
	KHeuLAOJZZQwtkb9fHpgvtucJxKz44MX+et1mUnXsoZgD4ovmFQ/yrYBIQ9c3VCDpLDqbX+nawQUj
	d+fRe92j1MbkGQSrH9wyKbX9DRYGWC24q72kxOreis8ag47IRliw5FIWgMer/BMDF0oc74wEkACDm
	I5AXXBqH7plwbH4+MQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXKd-00Ewa4-4Q; Mon, 17 Oct 2022 21:07:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXKa-00EwXd-GL
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 21:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 841C9B81681;
	Mon, 17 Oct 2022 21:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E280C433C1;
	Mon, 17 Oct 2022 21:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666040841;
	bh=9fZvPQ6FH4+BSR67d3rvJb0rl7mn1fy9ZWDE+8emsZY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uuB1yBzqtJUBiAgzUwLG3e267P0N3b3+y8NM3FAwPCErwlfNhNNcXD+FdQKUvfdtW
	 1tQIh6ah1kqlHOGh0iw2UNhee2T3wR8Ds/MqN/4PbTaf+WPpj+d24RpmAQ4HH8jbwu
	 L98VL6LGAZf2ifkHgI4pF0sbgSrwEDHA6qtPMfWMzwnNEdLoCv3F4MCmapE7pI7VAH
	 mn2DkXnw4YCVicpPHuwDXKLilfQ3RBZ5crk71fHh22Otlkgd1Im/xdU/0NYZ+79gT7
	 y5PIZCZiZnIen4r/YJ4CBUYo7MHON7PCF9x1U23oNAG0kNkXhpevPQ+/CghUQccUvE
	 Ht3edwh0MDHQQ==
MIME-Version: 1.0
In-Reply-To: <20221005171348.167476-2-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org> <20221005171348.167476-2-conor@kernel.org>
Subject: Re: [PATCH 1/6] clk: sifive: select by default if SOC_SIFIVE
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Date: Mon, 17 Oct 2022 14:07:18 -0700
User-Agent: alot/0.10
Message-Id: <20221017210721.3E280C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_140728_709695_5A1D77B0 
X-CRM114-Status: UNSURE (   6.61  )
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

Quoting Conor Dooley (2022-10-05 10:13:44)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With the aim of dropping direct selects of drivers from Kconfig.socs,
> default the SiFive clock drivers to the value of SOC_SIFIVE.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
