Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B8C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAicRmkFF95n1WBvxY9pLhCcOFymK/qfQnQdZ61ssPU=; b=mEFSrWefd/OWOKJEsIEtj2Cv6s
	weG0IG9MApj1DJcHYWpB3/6vBOXEvYEvmLA4gnDw0bINvV4OEaOd8J/hERC1iXmLMvCjAyh8wcbHS
	wJj85ELqs0wgFYJ5oLSu665efF/OKwg77R0R3Rj+sCZbblRUauudgyYNSonjlGer7BBv1YhyVyTfa
	tHe1fBdt5NJvKDfrJnqG6iWc/H4m9qRrSVdfG66WHoJbA1V/eLZKG2nofR610KSaKMeOyaIU+gJ/k
	QiBgH8EOQCmrZL/XoWvZw0TXb6/9mco0L5ie81iURsUBS/W5WThbxOgAtADLZY+R8aQOKii3bOl6B
	M9m309aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLVZt-00GQuv-RC; Fri, 27 Jan 2023 20:44:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLVZq-00GQuX-Vc; Fri, 27 Jan 2023 20:44:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7223761DA3;
	Fri, 27 Jan 2023 20:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A438C433EF;
	Fri, 27 Jan 2023 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674852240;
	bh=RMwi2oCm+NFozLzoTX7hSrC1gLQIQy5Rudt3+Ja7/7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXtMtPUs7l7aE3V2oNEgZqtmio/lhAbibpP+0JrlykabDFVAaIbCThQliY3fDGDWk
	 Vq5W/sEWnDjJ/f8tx0gEfN9AL8/N1JJLLKh2PvUWH+/tf91BInFRUrwnhDBGC3k7K6
	 L6ycSd+Zn8k/OmKiECl3EQmu2YUn5bIDvvMWakqKhIP8ee0DBES4qKjadYvcBOseN/
	 HhOAwDfh4MsVC0aMCIwzvAuGblGjNoeG68MY6moSl4Zo2N/ELEoe+YixAoB1D86fNU
	 3mC8zmwNUWix1Yeww5OGjyczyqHI1Szk46kwgGLRTuKIvMT+pY8q3yOdH0WiCObUzK
	 2g6QEckb1up3w==
Date: Fri, 27 Jan 2023 20:43:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v13 16/19] riscv: Add V extension to KVM ISA
Message-ID: <Y9Q3i2z8uh1Bttzw@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-17-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-17-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_124403_115580_5B94DF81 
X-CRM114-Status: GOOD (  19.63  )
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
Content-Type: multipart/mixed; boundary="===============3873306417899190420=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3873306417899190420==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UpFY8D7HxPG13IeT"
Content-Disposition: inline


--UpFY8D7HxPG13IeT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:53PM +0000, Andy Chiu wrote:
> riscv: Add V extension to KVM ISA

I figure this should probably be "riscv: kvm:" or some variant with
more capital letters.

> From: Vincent Chen <vincent.chen@sifive.com>
>=20
> Add V extension to KVM isa extension list to enable supporting of V
> extension on VCPUs.
>=20
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 92af6f3f057c..e7c9183ad4af 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -100,6 +100,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_H,
>  	KVM_RISCV_ISA_EXT_I,
>  	KVM_RISCV_ISA_EXT_M,
> +	KVM_RISCV_ISA_EXT_V,
>  	KVM_RISCV_ISA_EXT_SVPBMT,
>  	KVM_RISCV_ISA_EXT_SSTC,
>  	KVM_RISCV_ISA_EXT_SVINVAL,

Ehh, this UAPI so, AFAIU, you cannot add this in the middle of the enum
and new entries must go at the bottom. Quoting Drew: "we can't touch enum
KVM_RISCV_ISA_EXT_ID as that's UAPI. All new extensions must be added at
the bottom. We originally also had to keep kvm_isa_ext_arr[] in that
order, but commit 1b5cbb8733f9 ("RISC-V: KVM: Make ISA ext mappings
explicit") allows us to list its elements in any order."


> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7c08567097f0..b060d26ab783 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>  	[KVM_RISCV_ISA_EXT_H] =3D RISCV_ISA_EXT_h,
>  	[KVM_RISCV_ISA_EXT_I] =3D RISCV_ISA_EXT_i,
>  	[KVM_RISCV_ISA_EXT_M] =3D RISCV_ISA_EXT_m,
> +	[KVM_RISCV_ISA_EXT_V] =3D RISCV_ISA_EXT_v,
> =20
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),

This one here is fine however.

Thanks,
Conor.

--UpFY8D7HxPG13IeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9Q3iwAKCRB4tDGHoIJi
0tghAP40Z/keoiFjSzZyu2Mufq/qu0wzI1hTXg52M5vEBWonXQD9EVUR8LnYSr52
rUTXSTPAlgtRJ5Z7YLk6Ao0QiRksNAI=
=tuWo
-----END PGP SIGNATURE-----

--UpFY8D7HxPG13IeT--


--===============3873306417899190420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3873306417899190420==--

