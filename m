Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDA105A593
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PApZtkQmJOEq0xf4UnBlc44mUXq3eJJxn5GF3UKkUoo=; b=Lj4DQ9+dSW5ohp
	53u9frJqPBsKXzPqWjJ4Br3zTLRy/6yTF5EY3VF1oFSWBzmZrK5OiS55b4hkD8Y7ngR4OtfErAaYs
	tce2VevOVjyININYVTvoJVBQkvUjLi/YSivQ1VWPtdtrFGQUG6maPMxGSjSctD+gn0JFe/khUeZBx
	JTOTDCvoPO/9JkYQMowrc+dQqse3Ek8tMpHbV3BZxtuGhEVomq2+msaF2iftx7LFG1WfYNKCPpdzn
	Guwx7TrWMBPp278o0dgexX138E5s2fwVx3iH8NHEHj8sjl6t/MK+pTGEa5rXLsRfXnsXxGdeFbulK
	7f2Z7qzkIEEdbbO84AIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fKj-0000000E3xz-27es;
	Thu, 12 Mar 2026 12:40:09 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fKg-0000000E3xK-0PVA;
	Thu, 12 Mar 2026 12:40:08 +0000
Received: from duge-virtual-machine (unknown [183.192.221.67])
	by APP-01 (Coremail) with SMTP id qwCowACnT2sVtLJp+kDbCQ--.49377S2;
	Thu, 12 Mar 2026 20:39:51 +0800 (CST)
Date: Thu, 12 Mar 2026 20:39:49 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Junhui Liu <junhui.liu@pigmoral.tech>, krzk@kernel.org,
	ulf.hansson@linaro.org, adrian.hunter@intel.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add SDHCI support for Canaan K230 SoC
Message-ID: <abK0FcDHrQsDKBnl@duge-virtual-machine>
References: <20260310064513.140093-1-jiayu.riscv@isrc.iscas.ac.cn>
 <DGZT8U7OMGG3.WS9SPLJF9Y4Q@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGZT8U7OMGG3.WS9SPLJF9Y4Q@pigmoral.tech>
X-CM-TRANSID: qwCowACnT2sVtLJp+kDbCQ--.49377S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1xAF4DAF1fWF1UAF1kXwb_yoW5ur4kpF
	WDCFZIka9rKFyIyFs29w4kua15Ars5Jr4UGr1ag34DX3909FWYqr1xKa1Yqa4DJF1fCw1I
	yw45XryfW398ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3wIDUUUUU
X-Originating-IP: [183.192.221.67]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_054006_536348_31D731C0 
X-CRM114-Status: GOOD (  28.79  )
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

On Wed, Mar 11, 2026 at 04:29:48PM +0800, Junhui Liu wrote:
> Hi Jiayu,
> Thanks for your work.
> 
> On Tue Mar 10, 2026 at 2:45 PM CST, Jiayu Du wrote:
> > This series is based on the k230 usbphy series[1].
> >
> > This patch series adds SDHCI support for the Canaan K230 SoC,
> > which uses Synopsys DWCMSHC SDHCI controllers, include MMC0 and MMC1.
> > The hardware designs of these two controllers are different.
> > The MMC0 supports eMMC, while MMC1 only supports SDIO. Detailed
> > information can be found in the vendor's manual[2].
> >
> > From the vendor's K230 manual:
> >  - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
> >  - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
> >    clearly says it can't handle eMMC because of pin count and limits.
> >
> > Therefore, there are two separate compatibles and the driver treats them
> > differently.
> >
> > Link: https://lore.kernel.org/all/20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> > Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230_Hardware_Design_Guide.md#mmc-circuit [2]
> >
> > Changes in v3:
> > - Drop the clock maxItems.
> > - Add a const void *match_data to the struct dwcmshc_priv
> > - Copy the match_data pointer to dwcmshc_priv in the common dwcmshc_probe
> > - Link to v2: https://lore.kernel.org/all/20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn/
> >
> > Changes in v2:
> > - Change the clock minItems to 5.
> > - Add comments to explain the reason for setting SDHCI_PROG_CLOCK_MODE.
> > - Write the power selection logic in the phy init cleaner.
> > - Replace manual delay loop with read_poll_timeout.
> > - Drop unnecessarily braces where a single statement will do.
> > - Add the match_data pointer to dwcmshc_pltfm_data.
> > - Add dwcmshc_k230_match_data struct to separate eMMC/SDIO config data
> > - Split K230 into individual emmc/sdio platform data instances instead of
> >   sharing one.
> > - Remove redundant have_phy member in k230_priv.
> > - Replace of_find_compatible_node with of_parse_phandle to get USB PHY
> >   from DT phandle.
> > - Link to v1: https://lore.kernel.org/all/20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn/
> >
> > Jiayu Du (3):
> >   dt-bindings: mmc: Add sdhci support for Canaan k230
> >   mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC controller support
> >   riscv: dts: canaan: Add mmc nodes for K230
> >
> >  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  28 ++
> >  .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  56 ++++
> >  .../dts/canaan/k230-canmv-module-dshanpi.dtsi |   7 +
> >  arch/riscv/boot/dts/canaan/k230.dtsi          |  28 ++
> >  drivers/mmc/host/sdhci-of-dwcmshc.c           | 287 ++++++++++++++++++
> >  5 files changed, 406 insertions(+)
> 
> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> Tested ok on CanMV-K230-V1.1 (k230-canmv.dts) with AP6212 (BCM43430)
> SDIO WiFi module on MMC0 and MicroSD card on MMC1.
> 
> To be noted, a "broken-cd" property is needed to support SD card insert
> and remove detect on CanMV board because the CD pin is not connected. I
> am not sure if this is also needed on DShanPi as I don't have its
> schematic.

Thank you for your test and reminder. I have checked the schematic and
I will add "broken-cd" in the next version.

Best regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
