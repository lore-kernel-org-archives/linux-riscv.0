Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1186CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bklR2lBFxxM80Q9qf8WL/MQC0RSTOLdtYP4tQ1qHbn8=; b=HE1yuc+Xsz2ywW
	RtXWA13JA5FMLX/9i9T/CxPrhGWbsOoS9j/Drg+GdCds/arfGwM5sgX5N384EWw79rjhuBAn2aUNc
	1L46Cm48RbFojYZkcMaGh5ykz0iQz7n9044M3Ot3xb2DjkJoYFeRxSCVZCC/+/LX/gTu8HloMwBIE
	zo+mtFKC+xPAAp8FgUNjOrF1awZaN6ZjABeTLwtwDmGGA5KefXtaTrNMw7Gwavzsh7RU5I9RKdGrl
	M1I0JOlj08pK5a2uFAgT50fJY0AvsciuY5UPNQn46gBfGl6vxqaugijr8mf6j17R+RkB4RaHDrBzm
	rGYpreMBNROWUtg8NXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqB5Z-00AX0z-U0; Wed, 02 Nov 2022 10:35:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqB5Q-00AWtc-Gn
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 10:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667385308; x=1698921308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cnMTJX1z5oF/MNXmXzDoIQqydCI7Jem3sz3HAcS6ejI=;
  b=IyPfDXUTH/PmGy6OaMEqmhEHfUdC+i5dxDZcsh1iBEqAg0z/vf5qEU1l
   XVQgx5eXlBpEIx0+Bv9aBSAAkdJNLKCChiXDa78M2AYONc2z3znpRHktj
   zngCJPfyhAZk2phxhiTkLh7J/CT36qAhc3g2POhVLSOJ/tooUeDaPBWZr
   opWnSwk/jVmfaxYSXoQc2LB8OHhyeBSMtmm2cPGLEf9yZrXUWX9uVhvGL
   QnbkCeA1YTpRN0Y5VPy1l8lJrDeQ5d0CmXVZD4wzBwp+k0TVVIskQsfQ8
   mvHSSpe3q8FFKVa2DvEyNCcyLrWfLo50wyyt229jUrd2iwXKD2oDrR/DB
   w==;
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="184990970"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Nov 2022 03:35:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 2 Nov 2022 03:35:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 2 Nov 2022 03:34:58 -0700
Date: Wed, 2 Nov 2022 10:34:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH 0/6] RISC-V: stop selecting device drivers in Kconfig.socs
Message-ID: <Y2JHw/y1oWkLpOb2@wendy>
References: <20221005171348.167476-1-conor@kernel.org>
 <Y15nwXmn7rToJkH2@spud>
 <Y2IXrD4FpXNmDDPk@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2IXrD4FpXNmDDPk@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_033508_684013_6636F976 
X-CRM114-Status: GOOD (  20.66  )
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

On Wed, Nov 02, 2022 at 08:09:32AM +0100, Greg Kroah-Hartman wrote:
> On Sun, Oct 30, 2022 at 12:02:09PM +0000, Conor Dooley wrote:
> > On Wed, Oct 05, 2022 at 06:13:43PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > As my RFC [0] series doing the symbol name changes has not yet reached
> > > consensus, I've split out the removal of device driver selects into a
> > > new series. I kept the plic as a direct select - although given how Maz
> > > is treating the SiFive plic driver as the RISC-V plic driver, maybe that
> > > should just be selected by default at an arch level...
> > > 
> > > I assume the individual patches can go via their subsystems & I'll
> > > resubmit the arch/riscv patches a cycle later? I'm not in any rush.
> > 
> > Hey,
> > 
> > What's the story here with the two serial patches, they just waiting for
> > an Ack? I think these are archived on the riscv patchwork, so if that is
> > the case I'll unarchive them and mark as needing one.
> 
> Sorry for the delay, I'll take both of them through the tty/serial tree.

nw Greg, thanks.

@Palmer, I'll re-submit the Kconfig.socs bits of this after v6.2-rc1.

Thanks,
Conor.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
