Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ACAC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlKG6Hbszy9g9dMnJ3cOX+siP1h14Vq49SwgWdSplvQ=; b=ZicXzJoHBFqeAt
	UVOGC7R+aYA+4WZAyMWElb17S+xJPkzDdd7YKTRpqkuNvG6XmP7gDsjsF7v6ruz47l3v3p+A5gASU
	FjB7QaRWuLCh3Uoc5VF3fhuX/NwHYZ42hEhjTyrzDSCcjPdhBDYlXlr4ogcHV9ZO+Gecwdt0C1tKa
	O+0I1xbHe3AZHpClz3ZxO3O18T3c3lLxT+MRH9sJbDILseEn20txqfiLUn6XB9q8repMd61UKZTf/
	/M6VMMjLkp028rew8zzKL2F46EtL3b/kzXhWQMz6gi8MSveeLOJxxkO7t5h3v81APpoyuNarPCQQk
	Wxw0nsOrNXVsEUsoWd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdszY-0000000DEUD-10if;
	Sun, 28 Jun 2026 17:08:24 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdszV-0000000DERr-0m73
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 17:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FRd61GYLEFmV5rudJKhmBvnYtVSZEw/kZ8Wj3awiNhk=; b=Z2A7CGLuod29FWurq/pJ7NsdW0
	gVXi9wiFtvzyuKYxIiiOVVnTIg6JsCRkFeUVNfjNlsErvNasMMshdnqLFbyjqtFPxfUsxo3xNHFeZ
	gNTV45yDweysr5thfmn0DtlWsRm5Q0Con+gm0SS8aWBnDalaHvtVB3PVCLtJLn3ULwel7Ah6byjpU
	uPAw9xMGOMxs37EAxYA3CNKJ8O8/E6BCLzqKEXoKcy33wGg9wN7yPo+hCUeNp1g0+6XxLz5qAhdL1
	rQxISmlh4j0pV8vTFYzR38aR8EGuQff0cezD9t71Rd/4zulpOWKNGM+3qpeGVxIkxNdbpliX+DIQG
	ZZmgFQeg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wdszJ-0000000AwPz-3uel;
	Sun, 28 Jun 2026 19:08:09 +0200
Date: Sun, 28 Jun 2026 19:08:09 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <akFU-ZWFzFY23Y5b@aurel32.net>
Mail-Followup-To: Shuwei Wu <shuwei.wu@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100821_365941_B57A7E5B 
X-CRM114-Status: GOOD (  29.03  )
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

Hi Shuwei,

On 2026-06-26 16:10, Shuwei Wu wrote:
> This series enables CPU DVFS for the SpacemiT K1 SoC using the generic
> cpufreq-dt driver.
> 
> K1 has two CPU clock clusters. The two clusters have separate CPU clocks,
> so they are represented as two cpufreq policies: policy0 for CPUs 0-3 and
> policy4 for CPUs 4-7.
> 
> The CPU voltage rail is shared between the clusters. To model this with two
> policies, the OPP entries describe voltage ranges instead of a single fixed
> voltage, so the shared regulator can keep the rail within a range acceptable
> for the active OPP constraints.
> 
> Tested on Banana Pi BPI-F3:
> 
> ~ # cat /sys/devices/system/cpu/online
> 0-7
> 
> ~ # ls /sys/devices/system/cpu/cpufreq/
> policy0  policy4
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_driver
> cpufreq-dt
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
> 0 1 2 3
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_driver
> cpufreq-dt
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/affected_cpus
> 4 5 6 7
> 
> Both policies expose the same OPP frequencies:
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> For each policy, scaling_setspeed was set to each supported OPP and the
> workload was pinned to one CPU covered by that policy with taskset.
> CPU0 was used for policy0, and CPU4 was used for policy4. The clock rates below
> are from /sys/kernel/debug/clk/clk_summary.
> 
> policy0 / CPU0:
> ----------------------------------------------------------
> Frequency    |  cpu_c0_core_clk  |  Real (s)  |  User (s)
> (kHz)        |  (Hz)             |            |
> -------------+-------------------+------------+-----------
> 1,600,000    |  1,600,000,000    |    1.81    |    1.80
> 1,228,800    |  1,228,800,000    |    2.37    |    2.37
> 1,000,000    |  1,000,000,000    |    2.89    |    2.89
>   819,000    |    819,200,000    |    3.56    |    3.55
>   614,400    |    614,400,000    |    4.71    |    4.71
> ----------------------------------------------------------
> 
> policy4 / CPU4:
> ----------------------------------------------------------
> Frequency    |  cpu_c1_core_clk  |  Real (s)  |  User (s)
> (kHz)        |  (Hz)             |            |
> -------------+-------------------+------------+-----------
> 1,600,000    |  1,600,000,000    |    1.81    |    1.80
> 1,228,800    |  1,228,800,000    |    2.36    |    2.36
> 1,000,000    |  1,000,000,000    |    2.89    |    2.89
>   819,000    |    819,200,000    |    3.55    |    3.55
>   614,400    |    614,400,000    |    4.71    |    4.70
> ----------------------------------------------------------
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v4:
> - Represent K1 as two cpufreq-dt policies, one per CPU clock cluster
> - Use OPP voltage ranges for the shared CPU supply
> - Link to v3: https://lore.kernel.org/r/20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org
> 
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org
> 
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>       cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
>       riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c            |   2 +
>  4 files changed, 149 insertions(+), 1 deletion(-)

Thanks for this new version. I have tested it successfully on a Banana 
Pi BPI-F3. The CPU clock and voltages you have defined match the vendor 
version. Therefore for both commits:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

BTW, I have done a few additional research on the discussion we got on 
an earlier version of this patchset. On all the SpacemiT K1 boards, the 
output of buck1 and buck2 are connected together, so there is the 
question about what do do with voltage of buck2. We discussed about 
marking buck1 and buck2 as coupled through regulator-coupled-with.

It appears that buck1 and buck2 are configured in "Dual-Phase Mode" as 
the bit BUCK_12_DUAL (bit 0) of register BUCK_LDO_CFG (reg 0x46) of the 
P1 chip. I haven't found any code changing it in the kernel or U-Boot, 
so I guess the value is configured as default in the MTP. The datasheet 
is not clear about what controls the voltage in Dual-Phase Mode, but 
given both U-Boot and kernel code (vendor or upstream) only change the 
voltage of buck1, it makes sense that there is no need to change the 
voltage of buck2 in that mode. And it also sounds logic given that the 
P1 chip is aware of the coupling.

I therefore believe there is not need to mark buck1 and buck2 as 
coupled, and that your patch is fully correct on that aspect.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
