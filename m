Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C442DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4zzmLMNhAJanwaThNgsOGrfQ14UfsbqldgFM8EDIkg=; b=v0/8ym/SJQVwdu
	uM9pQyV73WZC4Xe8w5hmlgWjTB+BWUboBUGi7o8IW1Wtuc9YFTgCuK6OUpFmWw3VeBj2xL2XV4XHO
	ogl0WCKHFA5FlrGEANyAtjPWYUN2I2obxKftnHAx9D12XXirC64/0cirbYbQ9ZIGvkHPPvPaAbG14
	ALXMkxwvTaDda54pT1F/fQcO7NpJxj+mJFMxoN75GqyRvbeZitqNsJJKVYWv7P20evezcz9Zl+8iO
	Hv6oAtn7bOh43rX80o6eB1UW8+Gd2o0m5Jd56+1EiWD2sCDNFP6ttCUPDEirbajia+Kou4iSIzEXT
	bK9iDO8KTqOx2JRKur7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqGM-000UZ2-T3; Mon, 11 Jul 2022 10:03:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqGA-000UUD-OS; Mon, 11 Jul 2022 10:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C871682;
	Mon, 11 Jul 2022 03:03:19 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D63B23F73D;
	Mon, 11 Jul 2022 03:03:14 -0700 (PDT)
Date: Mon, 11 Jul 2022 11:02:04 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	linux@armlinux.org.uk, arnd@arndb.de, Daire.McNamara@microchip.com,
	niklas.cassel@wdc.com, damien.lemoal@opensource.wdc.com,
	geert@linux-m68k.org, zong.li@sifive.com, kernel@esmil.dk,
	hahnjo@hahnjo.de, guoren@kernel.org, anup@brainfault.org,
	atishp@atishpatra.org, heiko@sntech.de, philipp.tomsich@vrull.eu,
	robh@kernel.org, maz@kernel.org, viresh.kumar@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <20220711100204.bj3r3g6xs577kuul@bogus>
References: <20220708203342.256459-1-mail@conchuod.ie>
 <20220708203342.256459-2-mail@conchuod.ie>
 <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
 <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_030322_881527_B2A393E4 
X-CRM114-Status: GOOD (  13.05  )
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

On Sat, Jul 09, 2022 at 12:58:57PM +0000, Conor.Dooley@microchip.com wrote:
> Looking at the arm32 implementation - it appears to be mostly the sort of MPIDR
> stuff that was removed from the arm64 implementation in 3102bc0e6ac7 ("arm64:
> topology: Stop using MPIDR for topology information"). Could arm32 benefit from
> the same shared implemenation too, or is usage of MPIDR only invalid for arm64?

I don't recall all the details but IIRC there are parts if arch_topology
that are ARM64/RISC-V only. ARM32 doesn't use it as it may break old
platforms. Some of the functions that still arm32 specific are retained
in arch/arm

> The other difference is a call to update_cpu_capacity() in the arm32
> implementation. Could that be moved to smp_store_cpu_info() which is the only
> callsite of store_cpu_topology()?
>

No please, leave arm32 as is. It was done for a reason like that and it
help to not break some of the old 32-by platforms.

> Either way, will respin a v3 that doesn't break the arm32 build when
> CONFIG_GENERIC_ARCH_TOPOLOGY is enabled :)
>

Thanks.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
