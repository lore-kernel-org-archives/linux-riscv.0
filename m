Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68881C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 19:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XucgmlMu1OwsHxnkU1HRxp89s4PkloMWVeRbxJplA8c=; b=PLcNiNjEs3ui8z
	LgPdfvA1rOQ/u9vW5cO2ACl9DIJ5B5Bj9D1zV0sQL7GWbqdZbGxaPYI9uWx7BDT4WozfZqkyFnc75
	lyr7hQdTjqyOSpS/8z+m8rASe6b4blWpQDIZ7olfzgO4dbEkX8BZCapKUgkIvxd2tosABKrCOLKMk
	8ojm16AC06iGKUCvJo3T6FU3Gj1tlP9bKNSYnjnrAvsX8XuFL4xnNsfm9h/SqM+YdcfTf2iQCYT35
	7GXVchfSKe3NUYRZQD169vlt/F/mh99htJF5CLpP5ReTD/c6FV46zEj2rLsgkn8FeemwOv7wceCtP
	+JpNHYpTd+u7GOSRxwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntx74-00CYra-Ur; Wed, 25 May 2022 19:56:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntwx7-00CTzV-Mq
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 19:45:56 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1ntwx4-0007tM-W8; Wed, 25 May 2022 21:45:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@rivosinc.com, arnd@arndb.de, linux@roeck-us.net, palmer@dabbelt.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
Date: Wed, 25 May 2022 21:45:50 +0200
Message-ID: <4595022.rnE6jSC6OK@diego>
In-Reply-To: <2757790.88bMQJbFj6@diego>
References: <20220525160404.2930984-1-guoren@kernel.org> <2757790.88bMQJbFj6@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_124553_780805_E4B6FB31 
X-CRM114-Status: GOOD (  25.32  )
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

Am Mittwoch, 25. Mai 2022, 21:36:16 CEST schrieb Heiko St=FCbner:
> Am Mittwoch, 25. Mai 2022, 18:04:04 CEST schrieb guoren@kernel.org:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > =

> > This is a fixup for vdso implementation which caused musl to
> > fail.
> > =

> > [   11.600082] Run /sbin/init as init process
> > [   11.628561] init[1]: unhandled signal 11 code 0x1 at
> > 0x0000000000000000 in libc.so[ffffff8ad39000+a4000]
> > [   11.629398] CPU: 0 PID: 1 Comm: init Not tainted
> > 5.18.0-rc7-next-20220520 #1
> > [   11.629462] Hardware name: riscv-virtio,qemu (DT)
> > [   11.629546] epc : 00ffffff8ada1100 ra : 00ffffff8ada13c8 sp :
> > 00ffffffc58199f0
> > [   11.629586]  gp : 00ffffff8ad39000 tp : 00ffffff8ade0998 t0 :
> > ffffffffffffffff
> > [   11.629598]  t1 : 00ffffffc5819fd0 t2 : 0000000000000000 s0 :
> > 00ffffff8ade0cc0
> > [   11.629610]  s1 : 00ffffff8ade0cc0 a0 : 0000000000000000 a1 :
> > 00ffffffc5819a00
> > [   11.629622]  a2 : 0000000000000001 a3 : 000000000000001e a4 :
> > 00ffffffc5819b00
> > [   11.629634]  a5 : 00ffffffc5819b00 a6 : 0000000000000000 a7 :
> > 0000000000000000
> > [   11.629645]  s2 : 00ffffff8ade0ac8 s3 : 00ffffff8ade0ec8 s4 :
> > 00ffffff8ade0728
> > [   11.629656]  s5 : 00ffffff8ade0a90 s6 : 0000000000000000 s7 :
> > 00ffffffc5819e40
> > [   11.629667]  s8 : 00ffffff8ade0ca0 s9 : 00ffffff8addba50 s10:
> > 0000000000000000
> > [   11.629678]  s11: 0000000000000000 t3 : 0000000000000002 t4 :
> > 0000000000000001
> > [   11.629688]  t5 : 0000000000020000 t6 : ffffffffffffffff
> > [   11.629699] status: 0000000000004020 badaddr: 0000000000000000
> > cause: 000000000000000d
> > =

> > The last __vdso_init(&compat_vdso_info) replaces the data in normal
> > vdso_info. This is an obvious bug.
> > =

> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Heiko St=FCbner <heiko@sntech.de>
> =

> on palmer's for-next branch and a Debian riscv64 rootfs:
> =

> - WITHOUT this patch I end up with:
> [    3.142030] Unable to handle kernel paging request at virtual address =
ff60007265776f78
> [    3.144398] Oops [#1]
> [    3.144882] Modules linked in:
> [    3.145620] CPU: 1 PID: 1 Comm: init Not tainted 5.18.0-rc1-00049-g881=
0d7feee5a #225
> [    3.146698] Hardware name: riscv-virtio,qemu (DT)
> [    3.147441] epc : special_mapping_fault+0x4c/0x8e
> [    3.148352]  ra : __do_fault+0x28/0x11c
> [    3.149005] epc : ffffffff8011ce3e ra : ffffffff80113216 sp : ff200000=
0060bd20
> [    3.149851]  gp : ffffffff810de540 tp : ff600000012a8000 t0 : ffffffff=
80008af0
> [    3.150651]  t1 : ffffffff80c001e0 t2 : ffffffff80c00260 s0 : ff200000=
0060bd30
> [    3.151434]  s1 : ff2000000060bd78 a0 : ff600000013165f0 a1 : ff600000=
01dbc450
> [    3.152734]  a2 : ff2000000060bd78 a3 : 00fffffffffff000 a4 : ff600000=
3f0337c8
> [    3.153821]  a5 : ff60007265776f70 a6 : 0000000000000000 a7 : 00000000=
00000007
> [    3.154709]  s2 : ff60000001dbc450 s3 : ff60000001dbc450 s4 : ffffffff=
810ddd69
> [    3.155557]  s5 : ff60000001dbc450 s6 : 0000000000000254 s7 : 00000000=
0000000c
> [    3.156369]  s8 : 000000000000000f s9 : 000000000000000d s10: ff600000=
01cf8080
> [    3.157242]  s11: 000000000000000d t3 : 00ffffff8232d000 t4 : 00000000=
6ffffdff
> [    3.158094]  t5 : 000000006ffffe35 t6 : 000000000000000a
> [    3.158742] status: 0000000200000120 badaddr: ff60007265776f78 cause: =
000000000000000d
> [    3.160000] [<ffffffff80113216>] __do_fault+0x28/0x11c
> [    3.160881] [<ffffffff80116f3e>] __handle_mm_fault+0x6ec/0x9c8
> [    3.161619] [<ffffffff8011729c>] handle_mm_fault+0x82/0x136
> [    3.162308] [<ffffffff80008c10>] do_page_fault+0x120/0x31c
> [    3.163006] [<ffffffff800032dc>] ret_from_exception+0x0/0xc
> [    3.164607] ---[ end trace 0000000000000000 ]---
> -> a different error
> =

> =

> - WITH this patch applied on top, the error above goes away and the
>   qemu-system can boot normally.

The linux-next tree that failed for me yesterday, also works again
after this patch is applied.

Heiko


> So, while my error is different and I don't think there is any musl in
> my rootfs, this patch definitly fixes the issue for me, so
> =

> Tested-by: Heiko Stuebner <heiko@sntech.de>
> =

> =

> > ---
> >  arch/riscv/kernel/vdso.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > =

> > diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> > index 50fe4c877603..69b05b6c181b 100644
> > --- a/arch/riscv/kernel/vdso.c
> > +++ b/arch/riscv/kernel/vdso.c
> > @@ -206,12 +206,23 @@ static struct __vdso_info vdso_info __ro_after_in=
it =3D {
> >  };
> >  =

> >  #ifdef CONFIG_COMPAT
> > +static struct vm_special_mapping rv_compat_vdso_maps[] __ro_after_init=
 =3D {
> > +	[RV_VDSO_MAP_VVAR] =3D {
> > +		.name   =3D "[vvar]",
> > +		.fault =3D vvar_fault,
> > +	},
> > +	[RV_VDSO_MAP_VDSO] =3D {
> > +		.name   =3D "[vdso]",
> > +		.mremap =3D vdso_mremap,
> > +	},
> > +};
> > +
> >  static struct __vdso_info compat_vdso_info __ro_after_init =3D {
> >  	.name =3D "compat_vdso",
> >  	.vdso_code_start =3D compat_vdso_start,
> >  	.vdso_code_end =3D compat_vdso_end,
> > -	.dm =3D &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> > -	.cm =3D &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> > +	.dm =3D &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
> > +	.cm =3D &rv_compat_vdso_maps[RV_VDSO_MAP_VDSO],
> >  };
> >  #endif
> >  =

> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
