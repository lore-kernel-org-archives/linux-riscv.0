Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DFBC3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjhyKHd/q9OcCbYfnozYRNhDNdUDqDFtkdkjbsljiGk=; b=XpA6Xk5Q8RxMi4
	9x29fjgsBFbEjUfXoYv+maniE5k5A9qw6ff3ymJ4QRvygoO/jlIPawoCSerBUEsJq6pVm1ZLR292S
	3HlmQqVJqdxCPnILz3ajMcnO07Is1FuH0Jwe1Vp7ylN6yr7WVQ2aJ/U5n6L67KaZIBVJTI5ZL24ra
	tG7XF34h2hCu4dT+0nK6TVuZrNW1CZJFSXtbl8bDIQhzUvPQJNLum7Tya5boW8nQDps4GnGcZ/ygT
	iDC2/vwJkNUJV7Opevti2recXwiJKeWaAfZQl2/e6DX2yEnM8sRGMqhvFp+O4f1Xu7UcW12mjo42v
	ojWGT9TLHRt6Ian0UXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7wC-0000000DGCt-47Wn;
	Fri, 28 Jun 2024 09:30:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7w9-0000000DGCC-45ub
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44BE6620AA;
	Fri, 28 Jun 2024 09:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A45BC2BD10;
	Fri, 28 Jun 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719567032;
	bh=VmYjwKp6mlAJ1kzDY8yon8mWRyRJ52jWM6niGqaHDo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXKyTlJvGFF4l0YoEAgw1mg6eLOctUu4JfxelD5BGvoLP4KW1ofc+zd9L+DopGwYT
	 2vYCSXxt1UOqrggvJ5hVYtje9EoUIcHFCrOnXQ4I3St7MyeeWSyGpmDTyvsmS2Q8kf
	 zIzEMELR+jo0Ab2N5U4McKq+O0jkamZ9i/FbS/jQ/9S4uT/w5+tAA9Sr0UFx8Jq81Z
	 c7T7JOdphvQiPlparHZOn7FEBI4l+Gb7e9pGnSf9lHI926SwTLJZGVltvjEMyzcf61
	 2lQalOEORVTJi8qVuebUSf2KNJhlS1qsKqSIsJvmRu4qq0U4QBQWBoZNT31QrpQlIn
	 oWwgCQ1sFA1VQ==
Date: Fri, 28 Jun 2024 11:30:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Conor Dooley <conor@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023034_078594_3ECA3055 
X-CRM114-Status: GOOD (  19.55  )
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

Hi,

On Tue, Jun 18, 2024 at 09:42:37AM GMT, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> 
> This patch depends on the clock patch from Drew Fustini
> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> and the pinctrl patch from Emil Renner Berthing
> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

I think after these two go in...

> Changed from v1:
> 1. Remove redundant example for Synopsis DesignWare-I2C bindings
> 2. Remove Node Ordering commit as it has already been taken
> 3. Remove EEPROM label
> 4. Rebase on pinctrl and clock driver patches
> 5. Add pinctrl configuration
> 6. Replaced the fixed-clock with a correct configuration
> 
> Changed from v2:
> 1. Reorder nodes to conserve ascending register node ordering
> 2. Add support for I2C2 as it probably use the same controller
> 3. Format comments to match kernel coding style
> 4. Reorder nodes to conserve alphabetical node ordering
> 6. Declare I2C2
> 6. Set pinctrl pull-up resistor to the highest value
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Thomas Bonnefille (3):
>       dt-bindings: i2c: dw: Document compatible thead,th1520-i2c

... this goes throught i2c...

>       riscv: dts: thead: Add TH1520 I2C nodes
>       riscv: dts: thead: Enable I2C on the BeagleV-Ahead

... and these two go thrhough Conor's branches.

Do you mind sending a ping when Drew's patches are included in
the merge window? I can put the first patch on a special branch
to keep it under my watch.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
