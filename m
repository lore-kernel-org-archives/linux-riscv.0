Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F7E73156
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53cnHd77VTdV7xGcYo70CaAq/lSDllGedQEwMyAuviQ=; b=TDA8vbkEGv9JpS
	LBy0+4cRaLp3SAFNPVy/qvqirX+7v09AtecllofN0Y/IJQgrP6YO5aA8spdSy8lNzk4y8jrJJw+yI
	UHP7Ct+7caCf74lKS30GMgYCUY7t5EB2WHlDSqaboxxCdOkG27Aa3cuV93GWBzgdg9nqi3SRTkQXf
	uN7mproibe2sQtqOXbwBQXRHf1aIZXTdR2K1mOumT0uSPjJIBmxxryh7tXs3PTXnLrMKVzRXbHUrA
	kkEw6cML1e+W5ewxLjyZsssH4EDvxVj3X5XSItrfWM7ONB6gGgjZIl26Vi7evqdrBVnHqwElnYoM0
	cBfhoddjOYw8JdqUCvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vms9v-00000004u1b-0FBx;
	Mon, 02 Feb 2026 11:31:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vms9q-00000004u13-16GE;
	Mon, 02 Feb 2026 11:31:57 +0000
Received: from duge-virtual-machine (unknown [183.192.223.177])
	by APP-01 (Coremail) with SMTP id qwCowABH8WwYi4BpJdr9Bg--.29650S2;
	Mon, 02 Feb 2026 19:31:38 +0800 (CST)
Date: Mon, 2 Feb 2026 19:31:36 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org, gregkh@linuxfoundation.org, conor@kernel.org
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Add USB support for Canaan K230
Message-ID: <aYCLGLvbKZy+WyxI@duge-virtual-machine>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID: qwCowABH8WwYi4BpJdr9Bg--.29650S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWrCrWkWry3Kw1ftFWrXwb_yoW5JF17pa
	y2kFW3CFsrJFW2gFs3tw48WF9xX3Z5Jry5Wryaq3s8W3WUZr1UZ393KrWYvFyDJF4DCryj
	qFs0kFyxKFy5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [183.192.223.177]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033154_678769_C79A2A1A 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Jan 21, 2026 at 10:55:21PM +0800, Jiayu Du wrote:
> Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
> and made relevant changes to the DTS.
> 
> This series is based on the initial 100ask K230 DshanPi series [1] which
> is based on the clock and pinctrl series. Check the details in the link.
> 
> Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> 
> Changes in v5:
> - Changed the year of Copyright to 2026.
> - Add blank line after the declaration of variables
> - Fix wrong alignment.
> - Link to v4: https://lore.kernel.org/all/20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn/
> 
> Changes in v4:
> - Shrink reg length to match the address/size-cells in k230-usb-phy yaml.
> - Move all PHY instance creation and initialization from xlate to probe.
> - Modify xlate function to only perform index lookup for PHY instances.
> - Define all register base offsets macros at the top of file instead of
>   hard-coding magic numbers directly in probe.
> - Link to v2: https://lore.kernel.org/all/20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn/
> 
> Changes in v3:
> - Please ignore v3.
> 
> Changes in v2:
> - Fold the child into the parent in dtsi.
> - Define one usbphy with phy-cells=1.
> - Delete the clock of the usbphy as it is not needed.
> - Link to v1: https://lore.kernel.org/all/20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn/
> 
> Jiayu Du (4):
>   dt-bindings: phy: Add Canaan K230 USB PHY
>   dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
>   phy: usb: Add driver for Canaan K230 USB 2.0 PHY
>   riscv: dts: canaan: Add syscon and USB nodes for K230
> 
>  .../bindings/phy/canaan,k230-usb-phy.yaml     |  35 +++
>  .../devicetree/bindings/usb/dwc2.yaml         |   3 +
>  .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  17 ++
>  arch/riscv/boot/dts/canaan/k230.dtsi          |  35 +++
>  drivers/phy/Kconfig                           |   1 +
>  drivers/phy/Makefile                          |   1 +
>  drivers/phy/canaan/Kconfig                    |  14 +
>  drivers/phy/canaan/Makefile                   |   2 +
>  drivers/phy/canaan/phy-k230-usb.c             | 284 ++++++++++++++++++
>  9 files changed, 392 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
>  create mode 100644 drivers/phy/canaan/Kconfig
>  create mode 100644 drivers/phy/canaan/Makefile
>  create mode 100644 drivers/phy/canaan/phy-k230-usb.c
> 
> -- 
> 2.52.0
> 
Hello Vinod, could you please take a look at this patch? Thank you!

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
