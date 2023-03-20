Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E4EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okX16mNaY7fhkR5nCZ7hvugybm6t/o6VVUTKa4uWr28=; b=vEmbpgaUqi1+rOfmGsnWoSi+cc
	+Bx9iLRfBH19JOg7EU5uF7UN02nHUt7IPvJtPemGlsvGhLHGpk6f2d78hCBJ8KK44ThHxXHJsOy/+
	IEgBzuPcK6v9aFOYPEqJCaOgR+YI6Y8ZR+ccrGKZeCZa3yVBJywX7RXObr97VKHtgZdfZhR4KoNLv
	7Hk6+tBR+yO8juvZn07Opjfh+F6c5DWbX/mOfi1NglkBlN3QEYWfR1DiwYfuVAxtNlDTCYJXavCEp
	jUEuBcBfaIsb2+3mksHZd1qBKdawNoavW4WidRx0weN1SNjSFLCJqPNGIBlpDXAXR2Y8bcqZoCSCr
	+rl8NXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGuv-009PSI-1v;
	Mon, 20 Mar 2023 14:55:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGup-009PM1-0C;
	Mon, 20 Mar 2023 14:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679324115; x=1710860115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fukPmPRC7Rdv9VbzNLeqpzXj+z4ojMOPweVoyCaZe5c=;
  b=bq5/FPCLmdovFAcHs11hl4fWjtyn1+EzWu3SXCXxHVumwB0E0viDYwmH
   7/CMxLg2WRzpIpnAVgYzB80h4DDGyiGputbVA+mblUpvitgG2NrPQmM6j
   uBQrLUY0PG6Tt9QkaZDEQqiF7GSRiTLsd2TEc+k837Bqit/qnTDHrivah
   RCP69h3HXjF6OLGVrwOJV0NqnZzYmO/DfvnLvG2E3uoIDdD0g/G2EL0lR
   7yu7/4DJmxwe6Ki3kejHJFpPqTfV7ldjusA5rmVBJigeehqHGNiUw5pTc
   MQHBABZBnI4GDIPbb1za034rd7SW0tGD+Js05uRiZbHFn8Hj8WQN83QB5
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="205543541"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 07:55:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:55:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 07:55:07 -0700
Date: Mon, 20 Mar 2023 14:54:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo
 Ren <guoren@kernel.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
Message-ID: <bcf933bc-b8d6-4b34-82ac-e6f542542e25@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-9-andy.chiu@sifive.com>
 <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
 <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075515_150235_38B79411 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Type: multipart/mixed; boundary="===============2293936592816840662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2293936592816840662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YmzgdUOAV0nH57Cg"
Content-Disposition: inline

--YmzgdUOAV0nH57Cg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 10:46:57PM +0800, Andy Chiu wrote:
> On Mon, Mar 20, 2023 at 9:05=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Fri, Mar 17, 2023 at 11:35:27AM +0000, Andy Chiu wrote:
> > > From: Greentime Hu <greentime.hu@sifive.com>
> > >
> > > Add vector state context struct to be added later in thread_struct. A=
nd
> > > prepare low-level helper functions to save/restore vector contexts.
> > >
> > > This include Vector Regfile and CSRs holding dynamic configuration st=
ate
> > > (vstart, vl, vtype, vcsr). The Vec Register width could be implementa=
tion
> > > defined, but same for all processes, so that is saved separately.
> > >
> > > This is not yet wired into final thread_struct - will be done when
> > > __switch_to actually starts doing this in later patches.
> > >
> > > Given the variable (and potentially large) size of regfile, they are
> > > saved in dynamically allocated memory, pointed to by datap pointer in
> > > __riscv_v_ext_state.
> > >
> > > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> >
> > I think you missed a:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks,
> > Conor.
> >
>=20
> Yes, removed it on purpose because I changed some inline assembly in
> this submission. So I think you may want to take a look in case I did
> something silly.

Heh, inline asm is usually why I do "acked-by" rather than "reviewed-by"
as I am not particular confident in that realm ;)
No harm in being careful and dropping tags I suppose!

--YmzgdUOAV0nH57Cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhzrQAKCRB4tDGHoIJi
0mMRAP0ZcY7Sifv+CFgihncit9GeG67k7DvBV75qFFYjqobybgEA/DNDN+Bt0zf4
Bo/x9k/2RFH3d8pO1LC/yl5OT9sM0Q0=
=C2NE
-----END PGP SIGNATURE-----

--YmzgdUOAV0nH57Cg--


--===============2293936592816840662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2293936592816840662==--

