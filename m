Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A8C27C7B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 04:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUnMnqFTaz9WozeaLvcKZACeK6o7aEwXDjUB/tiseo8=; b=YhNWu0JTB2PXSb
	bHTmQfAxzhGpBsjoMwt+t3N0QkDLLJCYVagrrlO1KV07hMUrQB3Rie2Gn6HoW5wRmKzjRP76KqZou
	CW4L1q2GpV/q3e6qtl5bi5DfX6YgWVrOijGYYeh/9rTjdiFw0cw5C+rT2gO5rj7Wcnl9oTlbLxS2N
	CK6ZWKykP3VsdxcQQESZhIxPkeS7OfX4YqYf8a0RABDwTOLs6G0DecBXwtaQmQbyTQLE59J1cgUvx
	1PePxopL6qVVzrvDz9E73U1D3x2blCN7VQpGdQcWMj54NImcmXpse0vexJxGP6fBM3XxrS7eAQf1C
	TwiqDcPXagWfxTzYzW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ3l9-000000096NT-420Q;
	Mon, 17 Jun 2024 04:14:24 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ3l5-000000096Lq-0FAH
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 04:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718597648; bh=WLuBvzPzs9880RmsTEuF2wkZmJzMU1EtiXxCBZNBcSU=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=mNwvb+GZBmEfzYnytqbJ5y+2/NT9/CDOYJBc0JVukwo35ARqnuYqhcrnIMCIzZ4nw
	 HFBrUHLOqRc3MomAf+JLycQZejFy6SIVxYagz3NMo0UgIWIq0IxDghceyGs3nLYsYh
	 9Gl+D8cr9cXLzG4+gw+dabycJP1uQtEdU8uhuOx8=
Received: from smtpclient.apple ([2409:8929:821:8f06:b09c:7026:3108:2c0d])
	by newxmesmtplogicsvrszc19-0.qq.com (NewEsmtp) with SMTP
	id 373B8C89; Mon, 17 Jun 2024 12:13:51 +0800
X-QQ-mid: xmsmtpt1718597631tbx1uelq5
Message-ID: <tencent_4419DAC48EBDB803316521148D887C8D8208@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvT9rbrqOsVAj9/aRWrSEBe9NhraLBupeBo8FMpWpnaWvqqDzxPwM
	 osFFzaj1HJgUOB86x9ovrMAWJ9DvXLCKRDp4i/mMsgfhvqIl72amL0kRoP3+3CRT1hkjfVj0t1wF
	 ORUwuZeUDoDJm1OxYSt9MdipEXMoFVO0qRcOvf3F7BVNQe9SJwfK7vxuQ68hNh3SxfdVUaEBAAfe
	 6maOe28NWX9MHE4F80TNuCgKpzAqGId54Zx+eJQUJ3KHI1hx2gAHcljEBep0jNydq5vTEjn7HAqf
	 cafm1AXGP5b4UnQbODUCfzp83pjM8dUR7r0bEaCIDsmUvfrLF5bxrClkc6SY0uxfbc5EVcxWuM7n
	 bzl+xHgq1j5thLpk1glY0qgHNCEMc88/Dwe3jzTKcG5Kmx/KXxeg0PLKsGAXD+eMIrImvsIv11Mv
	 efrNYuAlHlthKMImPW0TIcPI55sK5HqGNpDMCjNrQzNq66qc0ivsQsM9rDJ3gOXJYfIJKQrTAFJr
	 Va4m9Vvid29aavZKlG27X19iotGcE2zcKze7HqsGFeSdgo0X0V+M95npRLmI7/kJ8Pb3qI2OIQy2
	 5q4Qv9V4m8Tjf2TOFgH+8ptcpACZ+uIK4Iip+k4xBag9KMcVSpGnmpKABJx8iR3SBdcyhUlW4D6a
	 84O2dKvrpjeRoyxzrRY+ivBnR0zckefW+8RldTl3R4OHE4UWEDQuvxRJskdbYkCmt17NiFtOHdTl
	 vwvCaBoZX6oUsWaoTff/ievkDvR9/jH/WtZ73JDFW0haaehEAyISt58mfkiHo3tEnA6np3R+xK1H
	 ootg9E9XGCpihbxXYlR0pLMOEwpKnCKvm0N26fGU7lTJZL2CRXs1q8Q7xmXLirdv/wndW21zknSE
	 1fID546Ad8Tk9IFK2LdMkWK6TV5FUhz0mNJJRpUEVMF+KiEItJf6Yohsf0+bsWt18MEFyNEekfa0
	 HCVs3tUZ2x5G16lIrjYJ9h2sWJ+bS1AqRMZcnRBGk2aAfebDzXYdWj4bzVKMjB
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 8/9] riscv: dts: spacemit: add Banana Pi BPI-F3 board
 device tree
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240616223149.GB3983622@ofsar>
Date: Mon, 17 Jun 2024 10:16:29 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <D2594566-12B8-4E81-9FA4-CA217ECE54CD@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_904B1050FBC0B10A172C263924BD518F8F05@qq.com>
 <20240616223149.GB3983622@ofsar>
To: Yixun Lan <dlan@gentoo.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_211419_486106_05899992 
X-CRM114-Status: GOOD (  14.56  )
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



> On Jun 17, 2024, at 06:31, Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi
> 
> On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
>> Banana Pi BPI-F3 [1] is a industrial grade RISC-V development board, it
>> design with SpacemiT K1 8 core RISC-V chip [2].
>> 
>> Currently only support booting into console with only uart enabled,
>> other features will be added soon later.
>> 
>> [1] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
>> [2] https://www.spacemit.com/en/spacemit-key-stone-2/
>> 
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> ---
>> arch/riscv/boot/dts/Makefile                 |  1 +
>> arch/riscv/boot/dts/spacemit/Makefile        |  2 ++
>> arch/riscv/boot/dts/spacemit/bananapi-f3.dts | 19 +++++++++++++++++++
>> 3 files changed, 22 insertions(+)
>> create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
>> create mode 100644 arch/riscv/boot/dts/spacemit/bananapi-f3.dts
>> 
>> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
>> index fdae05bbf556..bff887d38abe 100644
>> --- a/arch/riscv/boot/dts/Makefile
>> +++ b/arch/riscv/boot/dts/Makefile
>> @@ -5,6 +5,7 @@ subdir-y += microchip
>> subdir-y += renesas
>> subdir-y += sifive
>> subdir-y += sophgo
>> +subdir-y += spacemit
>> subdir-y += starfive
>> subdir-y += thead
>> 
>> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
>> new file mode 100644
>> index 000000000000..5c512f4e297d
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/spacemit/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_SPACEMIT) += bananapi-f3.dtb
> Can we have "k1" prefix at least? so k1-bananapi-f3.dtb
> it's much clear to let people know the board has k1 SoC,
> in case vendor has more chip series..
> 

Sounds like a good idea. I searched other references to "Banana Pi"
in Kernel dts and found they have the prefix of soc name.

>> diff --git a/arch/riscv/boot/dts/spacemit/bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
>> new file mode 100644
>> index 000000000000..023274189b49
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>> + */
>> +
>> +#include "k1.dtsi"
>> +
>> +/ {
>> + model = "Banana Pi BPI-F3";
>> + compatible = "bananapi,bpi-f3", "spacemit,k1";
>> +
>> + chosen {
>> + stdout-path = "serial0";
>> + };
>> +};
>> +
>> +&uart0 {
>> + status = "okay";
>> +};
>> -- 
>> 2.45.1
>> 
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
