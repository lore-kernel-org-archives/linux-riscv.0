Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D59D4A5EA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIYoqakdr1ru/LYs1URW1JSqFmzhK7WcHCV8oO8CLnU=; b=pfXRetEsJh5BuT
	CkNoysg2ec8PEoRJIw46DwKT1z4QGx4+lStMmJuJgBj7n05A8OUolvASIO8gn8EcQ0/dOHWm+VXyo
	YwKANR7OFMNc3uZJa0zLOh0SBRg85S/+jbnQtfUeL48u8N0eJaBKteyVkUHR7YO5EtWaHDxe7K0VG
	ErCEjxkuVWvpFmBSb8Zq32Msok15SWYzjt/A7gPykHNZEnlIuaWHK38k4iQnJ2ectZNcufgtNFtRR
	BPDRU2+Rffaa8CQeI4Y2b9VocX2akLzIumAfx2vcL4qsMJrUwpLK0TDCHe1ruVnYe9+OHjw+Wc8WD
	R3ZDSxC7q1EFJghmXqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaDv-0000000DVkJ-2GA9;
	Fri, 16 Jan 2026 03:10:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaDr-0000000DVjg-0rjv
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 03:10:05 +0000
Received: from duge-virtual-machine (unknown [223.160.206.223])
	by APP-01 (Coremail) with SMTP id qwCowACHMW3_q2lpraDWBA--.3624S2;
	Fri, 16 Jan 2026 11:09:53 +0800 (CST)
Date: Fri, 16 Jan 2026 11:09:51 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name,
	dlemoal@kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 0/2] Initial support for 100ask CanMV-K230 DshanPi
Message-ID: <aWmr/xEuUhcH0gKk@duge-virtual-machine>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115-proud-radish-c835a76d0446@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-proud-radish-c835a76d0446@spud>
X-CM-TRANSID: qwCowACHMW3_q2lpraDWBA--.3624S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kAF47Aw4rAF48XrWUurg_yoW5JFyxpr
	WY9Fs8GFsrKr4xZFsakr40gF1Yvws5Jw1rWw13tr9rJrs8ZFy0kFnag3y5uFyDXr4xCw10
	va1Y9ry8KrWUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Originating-IP: [223.160.206.223]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_191003_627236_7F224677 
X-CRM114-Status: GOOD (  24.41  )
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

On Thu, Jan 15, 2026 at 07:23:17PM +0000, Conor Dooley wrote:
> On Thu, Jan 15, 2026 at 02:07:59PM +0800, Jiayu Du wrote:
> > This series adds initial support for the 100ask CanMV-K230 DshanPi
> > board based on Canaan K230 RISC-V SoC. There is a module on this
> > development board.
> > 
> > The board and module are documented, the basic board/module devicetrees
> > are added.
> > 
> > This series is based on the K230 clock series[1] and the patch 3 of the
> > k230 pinctrl series[2].
> > 
> > Link:  https://lore.kernel.org/all/20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com/ [1]
> > Link:  https://lore.kernel.org/all/20240926-k230-pinctrl-v2-3-a9a36fba4b34@163.com/ [2]
> 
> Right, I've grabbed patch 3 from [2] and put it on my k230-basic branch.
> Do you intend sending a new clock driver series soon? Last time I looked
> (about a month ago) you had some changes proposed about critical clocks.
> I'd like to try get this stuff merged but obviously it depends on that
> clock set. I'll happy send Stephen a PR to smooth things along if the
> drivers are ready, but it looks like you need to send another version?
> 
> Cheers,
> Conor.

I'm not working with Xukai Wang, the developer of the clock series.
I merely discovered the critical clocks during the test and raised
this issue. Regarding the new version of the clock series, you need
to contact Xukai Wang.

I am currently only working on the USB and sd/mmc series of k230.

Best Regards,
Jiayu Du.
> > 
> > Changes in v3:
> > - Delet the model and compatible of the root node in the dtsi file.
> > - Use clock-50000000 as the node name.
> > - Link to v2: https://lore.kernel.org/all/20260104070911.219588-1-jiayu.riscv@isrc.iscas.ac.cn/
> > 
> > Changes in v2:
> > - Add a minus sign before items.
> > - Link to v1: https://lore.kernel.org/all/20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn/
> > 
> > Jiayu Du (2):
> >   dt-bindings: riscv: canaan: add 100ask K230 boards compatible strings
> >   riscv: dts: canaan: Add initial dshanpi board DT files
> > 
> >  .../devicetree/bindings/riscv/canaan.yaml     |  5 ++
> >  arch/riscv/boot/dts/canaan/Makefile           |  1 +
> >  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 82 +++++++++++++++++++
> >  .../dts/canaan/k230-canmv-module-dshanpi.dtsi | 26 ++++++
> >  4 files changed, 114 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
> >  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
> > 
> > -- 
> > 2.52.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
