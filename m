Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ACCC001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk+nA9ES5icQqLFDKeWzDlrwIjUHsR1uncRaj8ztHbc=; b=2t5FYP1SzrgRfg1/iZjcB2nE1T
	PAJU0x90X/V1zurlUeeL+ZsR5YEiFwjDpAkCOUzezlZ1YiXRAW30cH1m0c5VXkcT9sY4xM0ys3jrH
	m4gv1SwCioQyv65daKLgxQBPonly8j0usjkO8Ec0EJy1rEuZn7G81akoOBUKfg02BvZb6ThOwEbID
	8OOPdcxBGE58lBLtoGzGDZ1aApIdh3EE3anwTS1Z1shF+Ot2F8Me/+8+l8VO23VWPrOamMC1IgX7D
	DVm4BldY5fDl0TRiWXO83medXsi+QgJiJGbhIToY7jmSKkbjnQPi7e+oVKI8eOKWSsIrifBcf7oaF
	Nva7902g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2YP-00DIzh-1i;
	Fri, 04 Aug 2023 21:41:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2YL-00DIzB-2M
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 21:41:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D8E86207D;
	Fri,  4 Aug 2023 21:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A5EC433C8;
	Fri,  4 Aug 2023 21:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691185304;
	bh=4oZZa6/5J3tp2hGps780vjomCCoCv4gQ/jJS4HuXwbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTFavO9oc9MXJo2lBxr2UT7TIuntlcsQxmz40Y+JN3DLkuLYB9SdHKslOP3sIxjEL
	 qcncTBpfnCvTKoCteG7SLkWFl7o35Vw+bOLN2frpWJ8f6vN9xHyUtKKkjFb7YI2X+e
	 35tHBl/2guVAsXnDWzJ/KXl7kF0tqoc8A7IWsH0I5WarhblEJ4YzoD+oOaD46xlQ9z
	 Z4oLkvXhZT5EDD5f9u7F44dF3niJPd3L0j3l8s2dRbY61WPxVvFYFOLOTi9QaBbWeL
	 8FpZMWmrVQrSKbwOeZUV5x9+IgfWs/SGyCqGXCwfWV4WDNJEZ2yfNHkX31G7PEoVV9
	 JY+33OX+BH3pw==
Date: Fri, 4 Aug 2023 22:41:39 +0100
From: Conor Dooley <conor@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	bjorn@kernel.org, cleger@rivosinc.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V13 1/3] riscv: stack: Support
 HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <20230804-hut-morbidity-126fc9158f38@spud>
References: <20230614013018.2168426-1-guoren@kernel.org>
 <20230614013018.2168426-2-guoren@kernel.org>
 <ZM1tGgcJg0silFaJ@zx2c4.com>
 <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_144145_858258_9CE6E926 
X-CRM114-Status: GOOD (  23.98  )
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
Content-Type: multipart/mixed; boundary="===============5324107265458528895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5324107265458528895==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MVOpWrz7M88U4iQD"
Content-Disposition: inline


--MVOpWrz7M88U4iQD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 11:28:17PM +0200, Jason A. Donenfeld wrote:
> On Fri, Aug 4, 2023 at 11:28=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.c=
om> wrote:
> >
> > Hi Guo,
> >
> > On Tue, Jun 13, 2023 at 09:30:16PM -0400, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add independent irq stacks for percpu to prevent kernel stack overflo=
ws.
> > > It is also compatible with VMAP_STACK by arch_alloc_vmap_stack.
> > >
> > > Tested-by: Jisheng Zhang <jszhang@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> >
> > This patch broke the WireGuard test suite. I've attached the .config
> > file that it uses. I'm able to fix it by setting CONFIG_EXPERT=3Dy and
> > CONFIG_IRQ_STACKS=3Dn to essentially reverse the effect of this patch. =
But
> > I'd rather not do that.
> >
> > Any idea what's up?

Given your config, I suspect you're hitting the issue that is resolved
by Guo Ren's series:
https://lore.kernel.org/linux-riscv/20230716001506.3506041-1-guoren@kernel.=
org/=20

Hopefully that's it,
Conor.

> >
> > Thanks,
> > Jason
>=20
> And, err, I guess I failed to describe what's broken exactly. Here's
> what happens:
>=20
> timeout --foreground 20m qemu-system-riscv64 \
>        -nodefaults \
>        -nographic \
>        -smp 4 \
>        -cpu rv64 -machine virt \
>        -m 256M \
>        -serial stdio \
>        -chardev
> file,path=3D/home/zx2c4/Projects/wireguard-linux/tools/testing/selftests/=
wireguard/qemu/build/riscv64/result,id=3Dresult
> \
>        -device virtio-serial-device -device virtserialport,chardev=3Dresu=
lt \
>        -no-reboot \
>        -monitor none \
>        -kernel /home/zx2c4/Projects/wireguard-linux/tools/testing/selftes=
ts/wireguard/qemu/build/riscv64/kernel/arch/riscv/boot/Image
>=20
> OpenSBI v1.2
>   ____                    _____ ____ _____
>  / __ \                  / ____|  _ \_   _|
> | |  | |_ __   ___ _ __ | (___ | |_) || |
> | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> | |__| | |_) |  __/ | | |____) | |_) || |_
>  \____/| .__/ \___|_| |_|_____/|____/_____|
>        | |
>        |_|
>=20
> Platform Name             : riscv-virtio,qemu
> Platform Features         : medeleg
> Platform HART Count       : 4
> Platform IPI Device       : aclint-mswi
> Platform Timer Device     : aclint-mtimer @ 10000000Hz
> Platform Console Device   : uart8250
> Platform HSM Device       : ---
> Platform PMU Device       : ---
> Platform Reboot Device    : sifive_test
> Platform Shutdown Device  : sifive_test
> Firmware Base             : 0x80000000
> Firmware Size             : 236 KB
> Runtime SBI Version       : 1.0
>=20
> Domain0 Name              : root
> Domain0 Boot HART         : 0
> Domain0 HARTs             : 0*,1*,2*,3*
> Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
> Domain0 Region01          : 0x0000000080000000-0x000000008003ffff ()
> Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
> Domain0 Next Address      : 0x0000000080200000
> Domain0 Next Arg1         : 0x000000008fe00000
> Domain0 Next Mode         : S-mode
> Domain0 SysReset          : yes
>=20
> Boot HART ID              : 0
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.12
> Boot HART Base ISA        : rv64imafdch
> Boot HART ISA Extensions  : time,sstc
> Boot HART PMP Count       : 16
> Boot HART PMP Granularity : 4
> Boot HART PMP Address Bits: 54
> Boot HART MHPM Count      : 16
> Boot HART MIDELEG         : 0x0000000000001666
> Boot HART MEDELEG         : 0x0000000000f0b509
> [terminates/hangs here]
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--MVOpWrz7M88U4iQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZM1wkwAKCRB4tDGHoIJi
0uGmAP9waGa5m8QD9MFBBMtItnHQGucKNSvlZSDTpClaKux1DgEA6vRRGJ384u7h
kUZzyGaYLyDuarTcLDTU2Fg+7RcnRwo=
=kOIj
-----END PGP SIGNATURE-----

--MVOpWrz7M88U4iQD--


--===============5324107265458528895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5324107265458528895==--

