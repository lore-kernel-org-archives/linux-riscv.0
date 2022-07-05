Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB13C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzI5EdG/npoIlwRMkDb0hfddJupsEoALa+QulvU2piA=; b=cIDHwvZnwYsmFy
	+q45X6fANBlRBK3ninjTea7Fp0hnzgDwM79zZbpUdyTGCpdRTZ1KMr/8oreskUKUQ5f56wH8GVqEK
	m05UNwQkBe5Uro3Juwf7m1Z4ktGK98LAzn3BAgcep5iazshAY1fLexUTthMGl/1QKNu71zIDTw3Oh
	avbSAVGl8jgXtVGpi7wjOraBtmjRP0FebBvwvhi/TgdkUdfXn0MYy4LRqaA/8MjjtorAZbzCos6c1
	OlJ1j3sj+FzUYD6Eluz6sd09pmQR3T9kVNeEQseaZ+cQmjFmt/1b5r05RtXjeSlquXn7chClzG0qS
	TKGOtvjp/Jem5xw84Vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8p2T-002ay9-0i; Tue, 05 Jul 2022 20:20:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8p2O-002awP-5s
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 20:20:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F93C152B;
	Tue,  5 Jul 2022 13:20:46 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A518A3F70D;
	Tue,  5 Jul 2022 13:20:42 -0700 (PDT)
Date: Tue, 5 Jul 2022 21:19:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Message-ID: <20220705201931.nfwi5rlku7ykmydr@bogus>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_132048_333987_E72B669A 
X-CRM114-Status: GOOD (  16.69  )
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

On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It was reported to me that the Hive Unmatched incorrectly reports
> its topology to hwloc, but the StarFive VisionFive did in [0] &
> a subsequent off-list email from Brice (the hwloc maintainer).
> This turned out not to be entirely true, the /downstream/ version
> of the VisionFive does work correctly but not upstream, as the
> downstream devicetree has a cpu-map node that was added recently.
> 
> This series adds a cpu-map node to all upstream devicetrees, which
> I have tested on mpfs & fu540. The first patch is lifted directly
> from the downstream StarFive devicetree.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I would recommend to have sane defaults in core risc-v code in case of
absence of /cpu-map node as it is optional. The reason I mentioned is that
Conor mentioned how the default values in absence of the node looked quite
wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
default values if arch_topology fails to set based on DT/ACPI.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
