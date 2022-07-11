Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5497BC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdZIx/41oc7uzOumXkKWJjbEbZuwcd9TRJby9/jYPEU=; b=fKhdoVFab5xRTt
	RUz3a2xkUAQYqcbIW9Zz7CRl7A/oaVdhmFOBSAXOJ04vj4RsI31gmEw3zLjeKygBu+FWaC4f9B9x8
	1VcmdFA1KVLzl8AFC1yWcx/3nbaNarxiIGQrhqScm81mxl6bAybUWSXiyE8JEDs9BS2My4+FfyEBL
	0HoZkY35tG4BVQOEGNn3s2Y4z5bNfmQH0U4vIpJ1cZL8JlO+k+ASRHb3J+qyTaRkZh0ZO1GyWmm1B
	HLsbfFU9KuyN8SP9wObA8OT4pIULto2Qd/uyEG5iK1Ud7prX7jxNrjs27qWCJkKwyXtPRYVhhm8IU
	D13sNyUeGmZddNuvxxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuXD-002OGo-JR; Mon, 11 Jul 2022 14:37:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuX0-002Nxi-G8; Mon, 11 Jul 2022 14:37:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4F4B1596;
	Mon, 11 Jul 2022 07:36:59 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1FCB3F70D;
	Mon, 11 Jul 2022 07:36:53 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:35:42 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v3 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <20220711143542.nlq6a5nuh4nouomo@bogus>
References: <20220709152354.2856586-1-mail@conchuod.ie>
 <20220709152354.2856586-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220709152354.2856586-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_073702_598102_A21302A9 
X-CRM114-Status: GOOD (  12.46  )
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

On Sat, Jul 09, 2022 at 04:23:54PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> arm64's method of defining a default cpu topology requires only minimal
> changes to apply to RISC-V also. The current arm64 implementation exits
> early in a uniprocessor configuration by reading MPIDR & claiming that
> uniprocessor can rely on the default values.
> 
> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> topology: Stop using MPIDR for topology information")', because the
> current code just assigns default values for multiprocessor systems.
> 
> With the MPIDR references removed, store_cpu_topolgy() can be moved to
> the common arch_topology code.
>

Looks good. FWIW,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

> CC: stable@vger.kernel.org

However, while I understand the reason why this is needed in stable trees
for RISC-V, I am not sure if we want this for stable tree at-least on arm64.
I leave that part to Greg and Will.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
