Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15900C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQnT/HwgSYLfnHexwpocvLg52KZeL+dC1aWqdkMnZL4=; b=gKn2aqFO1UAaPY5MDqhYinpX4H
	l4hdewdUY6IL7jbazfGLu0N3NEOXmlgTgN1Bu4vN5Vn8+kgJOHtS3BLZeFYLSmRCuQQwmoPPBXeWu
	krxikICqMluGz+8rYBNSa0mzei16AKWw6RrhGMPv1h7hLS0CKmtgoy26r9mmW57j+zBej6BrbE107
	qZcalhd78qiTe9mfmbW7XFnInEyKC2+JCuEhPoCqdlu7sHhPoikducMVnVsJELgMJv0VRPwyCcess
	uPgSu/FhFR02nECs2kxngUZZPyfqFw97QI2HME8N/mByQRm4yWxYOlZcOkTY7m+D5tMdkcdnmuLUs
	TxChNzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozKUA-00CHvW-MJ; Sun, 27 Nov 2022 16:26:30 +0000
Received: from maynard.decadent.org.uk ([95.217.213.242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozKU7-00CHtw-S3
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 16:26:29 +0000
Received: from 213.219.160.184.adsl.dyn.edpnet.net ([213.219.160.184] helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1ozKTU-0003A3-4R; Sun, 27 Nov 2022 17:25:48 +0100
Received: from ben by deadeye with local (Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1ozKTT-000fZI-1S;
	Sun, 27 Nov 2022 17:25:47 +0100
Message-ID: <a28d32c965f363ce099bd0a65e1c82b75a98128a.camel@decadent.org.uk>
Subject: Re: [PATCH -next V8 06/14] riscv: convert to generic entry
From: Ben Hutchings <ben@decadent.org.uk>
To: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de,  peterz@infradead.org, luto@kernel.org,
 conor.dooley@microchip.com, heiko@sntech.de,  jszhang@kernel.org,
 lazyparser@gmail.com, falcon@tinylab.org,  chenhuacai@kernel.org,
 apatel@ventanamicro.com, atishp@atishpatra.org,  palmer@dabbelt.com,
 paul.walmsley@sifive.com, mark.rutland@arm.com,  zouyipeng@huawei.com,
 bigeasy@linutronix.de, David.Laight@aculab.com,  chenzhongjin@huawei.com,
 greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Date: Sun, 27 Nov 2022 17:25:42 +0100
In-Reply-To: <20221103075047.1634923-7-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
	 <20221103075047.1634923-7-guoren@kernel.org>
User-Agent: Evolution 3.46.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 213.219.160.184
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_082627_913509_537D51B7 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3508281251343078544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3508281251343078544==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hBvg3hkgZJx22/D8ziHr"


--=-hBvg3hkgZJx22/D8ziHr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-11-03 at 03:50 -0400, guoren@kernel.org wrote:
[...]
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
[...]
> +asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
> +{
> +	syscall_t syscall;
> +	ulong nr =3D regs->a7;
> +
> +	regs->epc +=3D 4;
> +	regs->orig_a0 =3D regs->a0;
> +	regs->a0 =3D -ENOSYS;
> +
> +	nr =3D syscall_enter_from_user_mode(regs, nr);
> +#ifdef CONFIG_COMPAT
> +	if ((regs->status & SR_UXL) =3D=3D SR_UXL_32)
> +		syscall =3D compat_sys_call_table[nr];
> +	else
> +#endif
> +		syscall =3D sys_call_table[nr];
> +
> +	if (nr < NR_syscalls)

This bounds check needs to be done before indexing the system call
table, not after.

Ben.

> +		regs->a0 =3D syscall(regs->orig_a0, regs->a1, regs->a2,
> +				   regs->a3, regs->a4, regs->a5, regs->a6);
> +	syscall_exit_to_user_mode(regs);
> +}
[...]

--=20
Ben Hutchings
This sentence contradicts itself - no actually it doesn't.

--=-hBvg3hkgZJx22/D8ziHr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmODj4YACgkQ57/I7JWG
EQkoFw//VAo67zlrTxZHe2lYe0Ggy+uVwqPDewOAWHaBTb4oR4xyh78CqsJfE8Ul
n8FAKOkPoxofhFFiVVpRDqEcvQ+SxigzmGQHENIM1xivjO8CkxNp9Ee7HYvacl6z
zL18FpRaq5gEvy35xA3fSn8T00hxeDo/Pe1tALWylNnkgrDPYbUH9y8OiJ//BPZh
4JndT+gEhdDuV046NtDj/2RvoXffePAc1mhvdKH5qOYIkz6ibWDmvLi/ug7I84C5
fP30LeNg6WjB2M8y/2SXejdap+B/omSFCx732OohnwUu1FJqSsFET7pV08WBz+ae
mMGN83ODVuWOXY68fwRx6Pup4sCg6eux/+7WqVCFoJd4nrAcquzB80TCfOp9lNEy
q/UEypfRBKGMBOtzfIX2V3QO5R1whrB41zsHjGF43xN/ht2yMYydjO+IzuIGY04Q
pAnyBazXVz5WTZlCbojKExLMgsDbkw7B35OWEpF5xmfhe8+7pxlkM2+th6BNf0ku
Zj+FSgrVvnbfuxD+A0nQN97qbTpITdaCLe8T8inYh1CAVTSVYSi8s2cbL61kVEAC
jaGY7LAN83nzphpX2uw3Zp48K2teHN1pPXbGg56we19HVoIl5EvcS+cU7wSmfDm2
FqXp51wz4t0OFldn6mXVzbiwrwYSqeV0z/l8CyGrVtSUXzdT/h4=
=LsGl
-----END PGP SIGNATURE-----

--=-hBvg3hkgZJx22/D8ziHr--


--===============3508281251343078544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3508281251343078544==--

