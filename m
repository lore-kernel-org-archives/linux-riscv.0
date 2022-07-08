Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B95EC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XW6pq4xWeNvzOvD3RrtOeGhFPsNMI7S5MlXnR9bPso=; b=27y+PQ7QnTRDbU
	Ke0tSSvfN2AeXQT24fwvTqE9a/2yoVOi01SLvCWsxMMfliEpPpdEtH9CIMdxzUd7m+Trh7ar8vQQu
	jlpB3f2KZpmovmHrd5i/RLa8kyoqrQbINA00zxDCqeGYVDgSmwzGP02T/OtzSJl8WnfT5RsSWoS8B
	L3MQM99f3ZjfHPiWx5dQrm0FaRsvKVyxK5uSeMbbbPqa9fxBcjdOryTORfvk+onNEeMEqZKZs++kR
	BdWJZ05MD4nESGlWSkRa72VOMkL1+7sVRKcsxmUbsdwNjaScil09/MiWMbE7vUu0Wc43ut4d2R8uW
	wGHkj9thEfKHsC5+VDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oXa-0042H6-Ki; Fri, 08 Jul 2022 14:01:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oXJ-0042B4-50; Fri, 08 Jul 2022 14:00:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CCE0106F;
	Fri,  8 Jul 2022 07:00:47 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1E33F66F;
	Fri,  8 Jul 2022 07:00:42 -0700 (PDT)
Date: Fri, 8 Jul 2022 14:59:32 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: gregkh@linuxfoundation.org, geert@linux-m68k.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
	rafael@kernel.org, Daire.McNamara@microchip.com,
	niklas.cassel@wdc.com, damien.lemoal@opensource.wdc.com,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	guoren@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
	changbin.du@intel.com, heiko@sntech.de, philipp.tomsich@vrull.eu,
	robh@kernel.org, maz@kernel.org, viresh.kumar@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Brice.Goglin@inria.fr
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Message-ID: <20220708135932.7srpzia53jbpmitg@bogus>
References: <20220707220436.4105443-1-mail@conchuod.ie>
 <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus>
 <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
 <20220708092100.c6mgmnt7e2k7u634@bogus>
 <CAMuHMdXUjmG9n3BuRAz_irkmHQbp=7SYxe5VEfOhMdT4D2JfwQ@mail.gmail.com>
 <20220708094710.rxk6flrueegdsggr@bogus>
 <YsgA/eycDF9TgCIT@kroah.com>
 <20220708113915.ui77mgqckjzalwlh@bogus>
 <9f8d4e4d-f24b-faf3-687f-90370939c72f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f8d4e4d-f24b-faf3-687f-90370939c72f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_070049_270799_5CFB7917 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, Jul 08, 2022 at 11:57:05AM +0000, Conor.Dooley@microchip.com wrote:
> 
> I did a little bit of poking in the git history.
> The last code touching the arm implementation was:
> 3102bc0e6ac7 ("arm64: topology: Stop using MPIDR for topology information")
> on Fri Oct 2 12:01:41 2020 +0100
> 
> The introduction of arch-topology stuff to RISC-V was:
> 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> on Thu Jun 27 12:53:00 2019 -0700
> 
> Backporting as far as v5.10 should be no real effort and I don't think
> to v5.4 that should be meaninfully harder. If 3102bc0e6ac7 hasn't been
> backported already, maybe it should be since it appears to have been
> fixing a problem too.
>

Thanks for doing the research and sorry for the noise earlier.

> Based on that, I think doing this the straightforward way in the first
> place is a better idea.
> 
> I'll respin the series as:
> patch 1: Move arm64 to the generic implementation

I don't think the mpidr check we have there is of much use IMO. You can
drop that and see if arm64 maintainers and/or others agree. As you have
already figured, since 3102bc0e6ac7 we are not using MPIDR and the one
check we have is optional IMO. So you can either drop it or keep it as
in your RFC and then post updates.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
