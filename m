Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44EC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKvaXkZVd45imYZ0cw+VjOQBB8qLfhL1XCnVCEQWVW4=; b=dPLyyBi7JZUBCRWiwgoOvQemzI
	w4nuXGomctA2W590QRVODyf0IoALky8/mzG9DIF00fic8t97yKCf4bb4xiQD5vE8Ic8+hZKeksV12
	FV3t8NlNtDoSud4Lw7+E/LvDxqsfAkWZ03EJoet1dHztGYls9qhIq5uhACJEaeqhmoolRN1c55Yr9
	HV5PwQaQzDq1gmCovXW958fnY1BGDGjy5aYdV74k4uFAPn1JvTxAgJMD22sA/ZBWWfzBcRqFWLnjk
	ynBxZISP/tw3ckApC98jGlk3HzxsLuemTBz6G7cUOa3eZ6buMvRoDsUE14rf9kVuRg8jWY1rSFg8v
	kW9z9PhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQ5D-007QEq-NO; Tue, 21 Feb 2023 10:41:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQ5A-007QDf-1y; Tue, 21 Feb 2023 10:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676976071; x=1708512071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7QA/vyewvRH8xz6i211QhpHsRW7Qheq3VCrsuFZ1m8=;
  b=CG3mq1lcHpa+tYA8k3PJUfu+uS/iMrJf3I0X4WLS5Vk27zk0lnu1YF4D
   JIjGwYJjXT50RB6HMbLDz7eL9vsItNjgq6/T1GVvZ9L6CYRfbrRquJd8Z
   UbsGzO5zdu6H3EsQfuUVtyehEnpLWpKWR/KMUgJU9hPrmwEdyBobHkBfM
   V4/CrBbuti8Il1/rB5Q4XdgSIWcCNUqe7gTbIsjb0Xk2CyK4kfiU72wWg
   lR7nuBhBL7BCww5+zQpQ1RLExiNWK17Vqe2Vge/VG5iDkIExJGeYcQoMQ
   gUBZ7R0DH1XJ1X9tLx1wn37L+jQuHtp69nLJAgZTxvsaN1kfYu1LioW7p
   g==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="201567546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 03:41:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 03:41:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 03:41:04 -0700
Date: Tue, 21 Feb 2023 10:40:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <apatel@ventanamicro.com>,
	<pbonzini@redhat.com>, <atishp@atishpatra.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <ajones@ventanamicro.com>, <anup@brainfault.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y/Sfpb2c/LS0LCiA@wendy>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_024112_171862_5D7955EC 
X-CRM114-Status: GOOD (  16.48  )
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
Content-Type: multipart/mixed; boundary="===============8304790628003603035=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8304790628003603035==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6iuVe0fRaCPwebfO"
Content-Disposition: inline

--6iuVe0fRaCPwebfO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Christoph,

On Tue, Feb 21, 2023 at 08:12:58AM +0100, Christoph M=FCllner wrote:
> Hi all,
>=20
> The RISC-V Architectural Review Committee has discussed the concerns
> regarding the non-ratified chapters in the AIA specification.

Thanks for the update!

> Here is the relevant quote from the meeting minutes:
> """
> Although the Advanced Interrupt Architecture (AIA) has already passed
> Architecture Review (with a minor edit still pending), the committee
> has some suggestions about its final steps to ratification, to avoid
> the AIA document having a mixture of ratified and non-ratified content:

> - The AIA document's remaining draft chapter on the Duo-PLIC, which is
>   not currently on a path to ratification, can be removed to a separate
>   document.

That sounds promising...

> - Ratification of the full AIA (without Duo-PLIC) can be postponed to
>   coincide with ratification of the IOMMU specification, given that
>   the latter is now expected in a reasonable time, and the AIA's last
>   chapter concerning IOMMUs is already scheduled to go through public
>   review and be ratified only together with the IOMMU specification.
> """

=2E..and so does this. AIA stuff's acceptability only depending on the
IOMMU spec's freeze (and thus Chapter 9's) seems like a vast improvement
on the status quo to me!

> The full meeting minutes can be found here:
>   https://lists.riscv.org/g/tech-chairs/message/1381

This link is non functional unfortunately :/

Cheers,
Conor.


--6iuVe0fRaCPwebfO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/SfpQAKCRB4tDGHoIJi
0glVAP48ulWH0wluVY0nRbCm5mnXv2qbJhdboksLyQ9PBMmj4AEA/g4b4WQyFK4F
pOnOdQtJiSbRjyBmsB6lQ/f+ZjOGRAE=
=+DAU
-----END PGP SIGNATURE-----

--6iuVe0fRaCPwebfO--


--===============8304790628003603035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8304790628003603035==--

