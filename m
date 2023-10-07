Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87002E95A60
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLew5bnu50op4kCK9R/rEmghXz+v5o+nHUHLipv5x90=; b=QWF7O3PbYoqa4yAZfx5On4RqDM
	hhrMd+ZJDCtDqL2RTr1sWKazQPNHiZ3ROL5atjDfxjWOQQwFf6zA6PqyQmoLk3nIPUsyODQ9BjBV/
	PqK4+eE8JIaNfcpfxpYLbTRFHhIJyNWvdNBsCm4HRn2Rj5aRf1LNrD/MyaD7IhYi99iVZz8NDMuNH
	NCKxzS8YOsbyR9aw+cay0FYhmGWiXtInNFhfnJuTZ8FlVOCgvyUi1bue7bIpHrmNlu9Gj8KkVBUlv
	4KB/sU773tSyWl8ZDZNA/zuNHnsXJklfvjilYE/tczyzDc3FVUHXQhI4oAN6/pzLzkCQWA5USpmjv
	nqg/dCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4Nh-007ItV-1T;
	Sat, 07 Oct 2023 10:17:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4Ne-007Isg-29
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 10:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C34760DF8;
	Sat,  7 Oct 2023 10:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEFCC433C7;
	Sat,  7 Oct 2023 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696673870;
	bh=5SvARg1tVUAbuCBSDivmH2UxOz0qfHxw6Fo68f/xKHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUzeeSgAsBBQiI9I8zffvJjRySGtVNaYobZANkHpk2IN+DoPtz4Rx9/kyo3hLvp2O
	 yQgQ68Iuts5KhkezXy0NZKOPB5bpnkzIh3OdVg9VLqRkAW+dFsuv8tNp0p4YPnmJPy
	 9TzIERm9vTWsuQUxtW61Zc+Fpu5wDJ1oDfU7PqJbvotPtUjODTovCapXF9lHffwJ+A
	 9VZCWndAlxmS+PLOVa9DzZcPp5FMEdbG2j9V61GFd9DmINOXTojKpxceRCD4qtjpTl
	 7PLwRElTlzyXeIfZLqe7A1W0xH41h5+mcL5XHGPG4wE/eppZpRwQFwVs/XBgFuiiAq
	 bPGclCyXEye3w==
Date: Sat, 7 Oct 2023 11:17:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
Message-ID: <20231007-grasp-retake-0463858c13df@spud>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_031754_746298_157B527D 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Type: multipart/mixed; boundary="===============3298593866965583363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3298593866965583363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iKyvg3rJU1jsPJ54"
Content-Disposition: inline


--iKyvg3rJU1jsPJ54
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.
>=20
> Now only support basic uart drivers to boot up into a basic console.
>=20
> Thanks,
> Chen
>=20
> ---
>=20
> Changes in v5:
>   The patch series is based on v6.6-rc1. You can simply review or test
>   the patches at the link [7].
>   - dts: changed plic to support external interrupt
>   - pickup improvements from Conor, details refer to [8].

Did you? I only see them partially picked up. I'll just replace patch 8
with the patch 8 from this series I think.

--iKyvg3rJU1jsPJ54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSEwSAAKCRB4tDGHoIJi
0l2tAQDJTgaBOCPvFiUINFvZMw8wD2MOLJqkt3HmEO9xOGScTAD+ORVuErM4SNOR
n3mMxcJKA/v1jqqvOzsexEgno/chAgc=
=b+S6
-----END PGP SIGNATURE-----

--iKyvg3rJU1jsPJ54--


--===============3298593866965583363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3298593866965583363==--

