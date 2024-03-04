Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF0CC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KszNMB21G81JIgsbkLMTJgNPpgLb4cIj+okr6DtoGXA=; b=SGurv4/4uk3Hvm2eaueGI3AFl9
	LNn5ymzV7jvPvUROflAXwx87GQ3HdpfkjdYeJTfBWRtC7ocudr/2fvQXuT85ywrBlhTTpQy6De2OK
	EZqWrGG8Z4htosBpOa4XzKIdOwZ3uu3vNddRXhUKO41KYVjf/iH0LCZ/JVGIj0MWmJib3Iyu78A1D
	miLwCnnOMEWd4w8oj9JSd4zVqDnCIzJdDlnzWSbTJ/CbyoFqDXYkpKqRnnw+1OthTirF83bl/1adQ
	IPuWcmqVTU99AGioARGiCwevFjC8DsuayCuNDaHUorPEAXnw87SMpqHrP05qBVrctraP3J4934gGA
	C8AAEQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDsu-0000000AQYr-0hje;
	Mon, 04 Mar 2024 19:22:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDsr-0000000AQYS-1bex
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 19:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C03EBCE0A4C;
	Mon,  4 Mar 2024 19:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50CEC433F1;
	Mon,  4 Mar 2024 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709580115;
	bh=H5PqKdrGjVod2x5/bHqwhRA1EcdARgXVF0B4zM+jIvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVDQGdi5/u2ZoVwqQBagbMsJFsSE1gWqfYoUDtLEmFCWbDzd9UMLcJLePnrkzTpah
	 DiqPMH/R0iI4bYI0cxC79ZtEzfV7vsCl80YIGM4z4FmHIrKhQ6GpaoGWD54/oxBQVm
	 OqNkq2YNmBWbWJuJIO3XcTMGPRJJP3AkMXwURuXTi/ko3/4/2vseOpw8m6eeow0MMI
	 zpCn3y1ydSuFq6qqyKqyM0vxONeCc6xvygYDZeo5BwACeJmY2PKxaLRLmQqRjrOnIB
	 KdZHwRXB3EUNfQez6VpeZCzSorMUTHXoWPW5cB2TzkGvjspzVl0RVPWlrqMhzzDfmV
	 ClLu/qsJTCTuQ==
Date: Mon, 4 Mar 2024 19:21:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Dawei Li <dawei.li@shingroup.cn>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] firmware: microchip: Fix over-requested allocation
 size
Message-ID: <20240304-rifling-nemeses-c830702266bc@spud>
References: <20240304101653.126570-1-dawei.li@shingroup.cn>
MIME-Version: 1.0
In-Reply-To: <20240304101653.126570-1-dawei.li@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_112157_639929_D8904936 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: multipart/mixed; boundary="===============1723949657398905949=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1723949657398905949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wMKfExtoszAhgpYP"
Content-Disposition: inline


--wMKfExtoszAhgpYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 06:16:53PM +0800, Dawei Li wrote:
> cocci warnings: (new ones prefixed by >>)
> >> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78:
>    ERROR: application of sizeof to pointer
>    drivers/firmware/microchip/mpfs-auto-update.c:170:72-78:
>    ERROR: application of sizeof to pointer
>=20
> response_msg is a pointer to u32, so the size of element it points to is
> supposed to be a multiple of sizeof(u32), rather than sizeof(u32 *).
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@i=
ntel.com/
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> ---
>=20
> V1 -> V2:
> sizeof(u32)->sizeof(*response_msg)=20

Thanks for the quick respin. I'll send this as 6.9 material cos of the
proximity to the merge window and the fact that we just over-allocate
here. Thanks!

I added a Fixes: tag when I applied this, you should add those in the
future. I should've mentioned this earlier but forgot.

Thanks,
Conor.

https://git.kernel.org/conor/c/af1e0a7d39f98c0dea1b186a76fcee7da6a5f7bc


--wMKfExtoszAhgpYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYfTwAKCRB4tDGHoIJi
0rFuAQDxFJ5GT1qa5JLgA1JNpEJBkbxmIEMWJCYFlKSD4MOPwgD+PDtW+d26QimF
duEOvvqr8nkcTZl57I1xXjODkejCoAs=
=gP+N
-----END PGP SIGNATURE-----

--wMKfExtoszAhgpYP--


--===============1723949657398905949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1723949657398905949==--

