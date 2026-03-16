Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD131F53D6E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4HCuV/KTyJ4m4TtUbVyMc2UtH0sITbh3TZlDSwn8QY=; b=Ea/xrRvzyPO2bT
	NZC1MTYIj4TJC4lGFkjYPrvxBZUsYXFeWe26K/TK+qkfRpixxz/m/tfccAvLQEdhURRZpCxkdJBvI
	nI2HNixPITSTyRz3Bo2HIDlV70G3vojZt08votjfhnr+qnb8jSJB4ygcpxyJkotSev59AbFpnKVsj
	tbVZBsIDzJ3ROIvCp/P0mL3fR7W8Ssztp6dld7Y7Xi15Sq2OgxdLiCGaxj1ZOOJ3d5/pa0reJItgQ
	2pPAyTGzY2EJwls8o3vmWTe8nAMo00wmy1nG7rMVYZ0LDfKqn6V1WDbKRh+U/n3Wuza6QbSEG68Zm
	7HWHb+cgtTEQF6RP/CaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2APy-00000004PSJ-3EPB;
	Mon, 16 Mar 2026 16:03:46 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2APv-00000004PRW-0lcP;
	Mon, 16 Mar 2026 16:03:45 +0000
Received: from duge-virtual-machine (unknown [183.192.222.244])
	by APP-01 (Coremail) with SMTP id qwCowACXA2_RKbhp5nRBCg--.1107S2;
	Tue, 17 Mar 2026 00:03:30 +0800 (CST)
Date: Tue, 17 Mar 2026 00:03:28 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: canaan: Add mmc nodes for K230
Message-ID: <abgp0PT4GHRwmaLy@duge-virtual-machine>
References: <20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260315054426.18383-4-jiayu.riscv@isrc.iscas.ac.cn>
 <DH49Q7OQSIYM.1RD7H0L809JQV@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DH49Q7OQSIYM.1RD7H0L809JQV@pigmoral.tech>
X-CM-TRANSID: qwCowACXA2_RKbhp5nRBCg--.1107S2
X-Coremail-Antispam: 1UD129KBjvJXoWruw1kCr1fAFW5ZF4fGF4kZwb_yoW8JrW5p3
	y7CFW5GF4kXr17KF1Sq34jgrnxAayfJrn7Wr17tFyUJryavr90kr1Fqw4qgry7Xr40kr42
	kw4UXryxWr4YkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
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
	IFyTuYvjxU7WrWUUUUU
X-Originating-IP: [183.192.222.244]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090343_604515_B7F662C8 
X-CRM114-Status: GOOD (  15.97  )
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

On Mon, Mar 16, 2026 at 10:15:27PM +0800, Junhui Liu wrote:
> Hi Jiayu,
> Thanks for the new version. Just a friendly reminder.
> 
> On Sun Mar 15, 2026 at 1:44 PM CST, Jiayu Du wrote:
> > Add MMC nodes to K230, including eMMC and SDIO. Enable HS200 eMMC
> > on the SoM and SDIO high-speed on the board.
> >
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 56 +++++++++++++++++++
> >  .../dts/canaan/k230-canmv-module-dshanpi.dtsi |  7 +++
> >  arch/riscv/boot/dts/canaan/k230.dtsi          | 28 ++++++++++
> >  3 files changed, 91 insertions(+)
> 
> [...]
> 
> > +
> > +&sdio {
> > +	bus-width = <4>;
> > +	max-frequency = <50000000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&mmc1_pins>;
> > +	vmmc-supply = <&vdd_3v3>;
> > +	vqmmc-supply = <&vdd_3v3>;
> > +	cap-sd-highspeed;
> > +	no-1-8-v;
> > +	status = "okay";
> >  };
> >  
> 
> It seems the broken-cd property we discussed in the previous version is
> not added, and also my Tested-by tag (for the whole series). Was this
> intentional or just an oversight?
> 

Sorry for that, It was a oversight. I will fix both.

And I will only add your Tested-by tags to patch [2/3] and [3/3].
Is this correct?

Kind regards,
Jiayu Du

> -- 
> Best regards,
> Junhui Liu
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
