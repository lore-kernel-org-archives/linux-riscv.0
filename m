Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A7F01814
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyV2O9ODUFZWXpu9jEEpq98gSkc0ASFk00ekcYmJt6U=; b=qynHolM8rfIMY7
	8EEhgrPsrjILQs4e+W8hjkSJP0j+q63IS6Km5sNxQdEZHF6Nj7BnKFEOY3Hfkhx+GDOxJ+RsP3SJw
	nVCy9sf/m6P3MIj9mqmMW12sKhbsdQAkLVFlXwMwfdPp43Kd3VjNMkM8QZEIeFhNUeP3Vq/YGkps4
	uJbyG8EBTmbjbjs/TQU0rkb5aAv6GYlZXlqOBRLXjCCw9Zh5QeTUi7LxXCRQi+OLbNc/KleE2e280
	MuN0YriKfAUck7AMZEzhMF3Og7L/KXRy/VSCrC9saTEi7sw/XECZ+mYb94CyHlAATpwCidqW37ba3
	8q0w+/u+arpzpgzeGC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR35-00000003JTv-301W;
	Fri, 06 Mar 2026 09:00:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR31-00000003JTV-195V
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 09:00:41 +0000
Received: from duge-virtual-machine (unknown [183.192.221.67])
	by APP-05 (Coremail) with SMTP id zQCowADXaQ2ol6ppQLO+CQ--.47488S2;
	Fri, 06 Mar 2026 17:00:26 +0800 (CST)
Date: Fri, 6 Mar 2026 17:00:23 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: krzk@kernel.org, adrian.hunter@intel.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2 2/3] mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC
 controller support
Message-ID: <aaqXpzEPeKfSYF41@duge-virtual-machine>
References: <20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260226115923.75670-3-jiayu.riscv@isrc.iscas.ac.cn>
 <CAPDyKFrxJ0oWuMWoUEYGO0t-WOYU+G7p5eFw8cUY7xyPaREB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFrxJ0oWuMWoUEYGO0t-WOYU+G7p5eFw8cUY7xyPaREB5Q@mail.gmail.com>
X-CM-TRANSID: zQCowADXaQ2ol6ppQLO+CQ--.47488S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW7GF1kAw1kJw4rXrWUJwb_yoW8KF1fpa
	yDXrnIkrWUJF4Sgwnxuw1Duas0qw4Sk3sxtFy3Gw1xZrZ2kF1jqry8Ka4093ZaqrWrGF1j
	vr1jqr95urnIyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
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
	IFyTuYvjxU2VbyDUUUU
X-Originating-IP: [183.192.221.67]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_010039_711292_4148A9DF 
X-CRM114-Status: GOOD (  22.22  )
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

On Thu, Mar 05, 2026 at 12:48:29PM +0100, Ulf Hansson wrote:
> On Thu, 26 Feb 2026 at 12:59, Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn> wrote:
> >
> > Add SDHCI controller driver for Canaan k230 SoC. Implement custom
> > sdhci_ops for set_clock, phy init, init and reset.
> >
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  drivers/mmc/host/sdhci-of-dwcmshc.c | 288 ++++++++++++++++++++++++++++
> >  1 file changed, 288 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > index 2b75a36c096b..21c77e908d77 100644
> > --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> > +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
...
> >  struct dwcmshc_pltfm_data {
> > +       const void *match_data;
> 
> This makes sense to me!
> 
> Although, I realized that dwcmshc_rk35xx_init() could also move its
> assignment of "devtype" into this match_data.
> 
> Can you please create a follow-up patch to fixup this and to avoid
> storing this type of data in two different ways?
> 
...
> > +static int dwcmshc_k230_init(struct device *dev, struct sdhci_host *host,
> > +                            struct dwcmshc_priv *dwc_priv)
> > +{
> > +       static const char * const clk_ids[] = {"block", "timer", "axi"};
> > +       const struct dwcmshc_k230_match_data *match_data;
> > +       const struct dwcmshc_pltfm_data *pltfm_data;
> > +       struct device_node *usb_phy_node;
> > +       struct k230_priv *k230_priv;
> > +       u32 data;
> > +       int ret;
> > +
> > +       pltfm_data = device_get_match_data(dev);
> > +
> > +       if (!pltfm_data || !pltfm_data->match_data) {
> > +               dev_err(dev, "No vendor data found for K230\n");
> > +               return -EINVAL;
> > +       }
> > +       match_data = pltfm_data->match_data;
> 
> I don't think this should be specific to dwcmshc_k230_init().
> 
> Instead I suggest adding a "const void *match_data" to the "struct
> dwcmshc_priv" - and copy the pointer in the common dwcmshc_probe()
> instead. In this way, all variants will be able to use it.

Your suggestions make perfect sense. I'll prepare a new version to add
the "const void *match_data" to "struct dwcmshc_priv", assign it in
"dwcmshc_probe()", and adjust the K230 init accordingly.

I'll also migrate the rk35xx devtype assignment to match_data for
consistency. Once ready, I'll post the link as a reply to this k230 mmc
series.

Best regards,
Jiayu Du

> 
> Kind regards
> Uffe


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
