Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874CEC369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3MILc0ix8l6P5quhybZUAU6+Lhz+mw/SjZue3kFRVk=; b=Skxtego1QO3yet
	KYbDodNktrGkdTN2SkA2+MypeQVW5SRLtpv0iayxM0reRc4aU5QArBxw9NUjbnIJtHto/sZulmiWj
	HO7FRx48yzDMpaWP0PxJcKUQoCXmZl6Jy3HseH9FJAYqVrf4okN/BfFv23NDcWsDjhOMDv26376tN
	Av00b5N9UuC1kE59o87DxwUfDW7uZetPA+e9llv+qh11X3IF9AqF2EWKpcFfAqGOi91cjWA+yxT5s
	prU8LFbbtynpg6S9RBn1CEWWdWfA/cyK1AA6agsWeGxQ3t+wwOi+rsjhzI1Osz+6fmBrwwDBzZg95
	5O8ruCjPMz/rhw375w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JNw-000000021ar-2hSa;
	Mon, 14 Apr 2025 12:58:00 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JMW-000000021PN-2QCP
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744635360; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UI597fmXtOSb+2G6X3WD0BJck4aQlhdbIYlvgYtlZXCezM1758SpojGW84WEpgvuX0ojC/xbsq4CNRdQtzJGH6QkKu4RQboLOzMGuSDa2/lK7SoLUtnld06ZZwyjMhBcr8eMIc22i1JK6xAXGPyIFRd8QmLmyh2IKidXJWLkQJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744635360; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2SFcmr+j/cQ+KV0XcTEr8Yx/IrB/lqPJKyq9x9rOqDM=; 
	b=NFvJoVPLpyIq5+IsxJBnqaqAnd3hYw1FHYQeT4/QPQU2i1y8BCKnbs5CGony7cQ3dbq7EfNLPu9yEE/CdCO/fWuAXtyRvraV+q0cweE9UHMRghwqUOmDTSnHpWPJ/j3pkp/dJLmOsqmqXS2EJXatQEMVpHdM1xL22iWD3pz331o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744635360;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2SFcmr+j/cQ+KV0XcTEr8Yx/IrB/lqPJKyq9x9rOqDM=;
	b=iikD1J/q/Qu4ulEKf6I2r8Lj+AlDwh0chOcNmvs50KLpDXFa38L159aDIAsTmmwg
	82JkPYeLw5jHKGcFzjDJSvvULJseuD/PsTPYgGDe6J0B1LxSimhdHeoVhEf7R9gT6eD
	kBUyloZGekInPd0NQdehOA7dy+AR43MEdgB4AtAM=
Received: by mx.zohomail.com with SMTPS id 1744635356934791.9442392785247;
	Mon, 14 Apr 2025 05:55:56 -0700 (PDT)
Message-ID: <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
Date: Mon, 14 Apr 2025 09:55:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_055632_694482_0D7A1D66 
X-CRM114-Status: GOOD (  16.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Pinkesh,

On 4/10/25 12:25 PM, Pinkesh Vaghela wrote:
> From: Min Lin <linmin@eswincomputing.com>
> 
> Add initial board data for HiFive Premier P550 Development board
> 
> Currently the data populated in this DT file describes the board
> DRAM configuration, UART and GPIO.
> 
> Signed-off-by: Min Lin <linmin@eswincomputing.com>
> Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>   arch/riscv/boot/dts/Makefile                  |  1 +
>   arch/riscv/boot/dts/eswin/Makefile            |  2 ++
>   .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>   create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 64a898da9aee..29a97a663ea2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-y += allwinner
>   subdir-y += canaan
> +subdir-y += eswin
>   subdir-y += microchip
>   subdir-y += renesas
>   subdir-y += sifive
> diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
> new file mode 100644
> index 000000000000..224101ae471e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> new file mode 100644
> index 000000000000..131ed1fc6b2e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "eic7700.dtsi"
> +
> +/ {
> +	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
> +	model = "SiFive HiFive Premier P550";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};

Although commit log says that this includes DRAM configuration, looks 
like it's missing? In order to test this patchset, had to add this 
following memory definition (picked from vendor kernel repository):

     L50: memory@80000000 {
             compatible = "sifive,axi4-mem-port", "sifive,axi4-port", 
"sifive,mem-port";
             device_type = "memory";
             reg = <0x0 0x80000000 0x7f 0x80000000>;
             sifive,port-width-bytes = <32>;
     };

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
