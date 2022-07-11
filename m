Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C1AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ES+tnJuZJhqU5y6XhBlqWFVzjYsnyoNAq8uO9QCLNrw=; b=IxSBsTMCWrNppK
	0nSQf9Y7PSzG9DWAzVoVnvVE1O6on+/9j6hl8D0qfCRNY0YtZAuHN6n/TVrIEw05katN4K85PXI3W
	T4YPD0xsI74LWcNDIGHRzqTViaLsgFS9PsqghLH/MeLXvSZvKVaeBT0/nOcRsy5axn9q/pbCzKnbg
	bndrKXZVeOoYIPJoBuEpq45FOBfk7lySdfDvJSzc23D5m7Q0MNKBRBoIR2rSwIYfZ/3BEvsHX4NOf
	9Edf42MV2T5iJ4Bau0VG1TulUgqeqTfDh3PYEisgX0bHtPPVTr/YzMU7sxmR55ImtXMRQCzbEKqn/
	4jvYhCNpClQPQqZo7ghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAukP-002Za7-7E; Mon, 11 Jul 2022 14:50:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAukD-002ZPz-Mx; Mon, 11 Jul 2022 14:50:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39FF861544;
	Mon, 11 Jul 2022 14:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E29EC3411C;
	Mon, 11 Jul 2022 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657551040;
	bh=MX80YwmblA+v/61UuXjnsNDDbo5cN2GQE6qtQk7/qnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OO2E9gHGUI8pAsye9LKImxPqcZ+lOe39N3fNLx7J0ta3A0hdy7u6xT3q8dxDCqr1H
	 zebW4Ms/bYVlaWgX7tO8sNgaU39U8/EcVC31dgw2GjNM8fsjp6cJlG/bI565+n7Y4G
	 iRoixb73TYxQV3p9oeKSpNrJ/PKy+T4b2RC1xF4c=
Date: Mon, 11 Jul 2022 16:50:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Conor Dooley <mail@conchuod.ie>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v3 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <Ysw4voXuz+tcSKhf@kroah.com>
References: <20220709152354.2856586-1-mail@conchuod.ie>
 <20220709152354.2856586-2-mail@conchuod.ie>
 <20220711143542.nlq6a5nuh4nouomo@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711143542.nlq6a5nuh4nouomo@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_075041_808689_F0062DF3 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Jul 11, 2022 at 03:35:42PM +0100, Sudeep Holla wrote:
> On Sat, Jul 09, 2022 at 04:23:54PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > arm64's method of defining a default cpu topology requires only minimal
> > changes to apply to RISC-V also. The current arm64 implementation exits
> > early in a uniprocessor configuration by reading MPIDR & claiming that
> > uniprocessor can rely on the default values.
> > 
> > This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> > topology: Stop using MPIDR for topology information")', because the
> > current code just assigns default values for multiprocessor systems.
> > 
> > With the MPIDR references removed, store_cpu_topolgy() can be moved to
> > the common arch_topology code.
> >
> 
> Looks good. FWIW,
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> > CC: stable@vger.kernel.org
> 
> However, while I understand the reason why this is needed in stable trees
> for RISC-V, I am not sure if we want this for stable tree at-least on arm64.
> I leave that part to Greg and Will.

Why would it be good for one arch but bad for another?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
