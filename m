Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7C2C61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lz4XObw7RYk858XiNUnM5yuxVnxj037f6JUF5ettZnA=; b=wbK4o0D4kHGKgm
	e/YfNMQ6E76Yvxk4p4e917L+5a7+ugrtDj/z9h4eZZBZTMtXqrScM+ao1TBKSGri3L8/LgERBIa1v
	uq06uw16AGwJuBNzyhFUvXcxMdE5ytD8dRmg+im7sq5AT86A9zhpzAT56AM0gUoiRFmNg7bEbLPpn
	Zjj2BPr2GeUYUjqVmLdWJ8LAse+/34hO7pR53l5vGi3WAOYmLFiGk6UG0wUYeW+z+A8nN6naUXCWf
	aLo3Wqyjq2hBL4sjIbIXx1ZE6Pqab0bBjAsibp4bhRREruY6WCXOLqaiZXWY8fUUB06HUWWfTijim
	8OdGuGSUlRMBebvyI/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1We8-0000000DSL0-1yRO;
	Tue, 01 Sep 2026 22:08:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1We6-0000000DSKe-2vwY
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 22:07:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F109143601;
	Tue,  1 Sep 2026 22:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847DF1F000E9;
	Tue,  1 Sep 2026 22:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788300477;
	bh=GxJ1J5o192Yi57FIwYJ2EOUQdRT6ypUFpputH/0IOeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lR511LSQVSe9EdXltrtmNkOFE/TMh95ryDURboDTyyanhfibv5hS+A1di+rF3X1HG
	 JfrrIa785v6+L5e1P4wKk/fmTkKXInKZVKRw/h0vjer88zu/anais1Y07FJ0S0GM/P
	 rpHWWumV/MtRG/vnK1eBWypCMFw1ophLkq7JoQ5gSrcloW8zuV7Ct/4jPbfS8Oe8mV
	 BLchSuVccGGoyOITjb6E0x0s1n9aPzj+q1LQKaxxu/8dIjG+AybLS+xTxIlY+ZYClZ
	 zDy3wktDaB9+AZBUH6CG1hXHaSnOakwod/5moyfam5y8da0P4JGw3Lo+0P8khW0eEg
	 IXj8HUadNw/bQ==
Date: Tue, 1 Sep 2026 15:07:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, d@gen8
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <apdMvKYegtdEWntp@gen8>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
 <20260831100216.reply.cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831100216.reply.cp0613@linux.alibaba.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 31, 2026 at 10:16:16AM +0800, Chen Pei wrote:
> Hi Drew,
> =

> Thanks for keeping this series alive. While testing v6 on a RISC-V
> platform with a CBQRI capacity controller (8 capacity blocks backing
> one L3, Ssqosid + CBQRI exposed via DT), I hit a problem that traces
> back to this patch; findings and a suggested fix below.

Thanks for testing the siers.

> Symptom
> -------
> With the series applied, the resctrl interface reports an empty
> capacity mask everywhere:
> =

>   # cat /sys/fs/resctrl/info/L3/cbm_mask
>   0
>   # cat /sys/fs/resctrl/schemata
>   L3:0=3D0
>   # cat /sys/fs/resctrl/size
>   L3:0=3D0
> =

> while the hardware reports NCBLKS=3D8 in the CC capabilities register
> (bits[23:8] of cc_capabilities, per CBQRI v1.0 =A73.5), i.e. the
> expected values are cbm_mask=3Dff / L3:0=3Dff.
> =

> Root cause
> ----------
> cbqri_resctrl_control_init() fills cbm_len/shareable_bits/min_cbm_bits
> but never initializes res->default_ctrl, which therefore stays 0
> (static storage):
> =

> > +static int cbqri_resctrl_control_init(struct cbqri_cache *ctrl,
> > +				      struct rdt_resource *res)
> > +{
> > +	res->name =3D kasprintf(...);
> > +	res->cache.cbm_len =3D ctrl->cc.ncblks;
> > +	res->cache.shareable_bits =3D 0;
> > +	...

I think you may be looking at an older version. The function in this
patch is:

static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)

struct rdt_resource no longer has a default_ctrl member. Commit
dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
it") removed it and derives the value instead.

The default seems to work okay in my testing. For example, with Qemu [1]:

 qemu-system-riscv64 \
      -M virt,aia=3Daplic-imsic \
      -nographic \
      -m 1G \
      -smp 8 \
      -kernel arch/riscv/boot/Image \
      -append "root=3D/dev/vda ro console=3DttyS0 rootwait earlycon" \
      -drive if=3Dnone,file=3Drootfs.ext2,format=3Draw,id=3Dhd0 \
      -device virtio-blk-device,drive=3Dhd0 \
      -device riscv.cbqri.capacity,max_mcids=3D256,max_rcids=3D64,ncblks=3D=
16,mmio_base=3D0x04820000

# cat /sys/fs/resctrl/info/L2/cbm_mask
ffff
# cat /sys/fs/resctrl/schemata
L2:0=3Dffff

I will send v7 today as I have now rebased on v7.3-rc1. It is already
available as a branch [2]. Please give that a try and let me know of any
problems.

Thanks,
Drew

[1] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
[2] https://github.com/tt-fustini/linux/tree/cbqri-cache-alloc-dt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
