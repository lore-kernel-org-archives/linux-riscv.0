Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCAACDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXhoJ/LKEVr+G45gR1faCAZPgy1cILnpaj0MbD0r/64=; b=gjFYh2xwztloCLxhjY8DV7XALU
	h4fMuWFocxkfE0XAlLrOpM88XPCPPdoh0XuZn30tXbnLiCyBcI41vg39hvTL3qvk5PdBbQQH1kE3o
	cG77ZvdtlOax0b3HvpgU/Peiy5hbsEXvE+lTMF/9q7m1VIO6n/OGmHWXkQBieKXHtBZjxXHphYfp0
	CTJyXBfT/BN61+LQCwpg8S8hIvhrXvel+GCs0QANTx1XYgKRca4cIhN9g+a7Eep4Dl/+X0fhAQszG
	WX4Ga2rrYQOtkjnA1ml3nxTy+kT9kz0EjXWhDLpG7N2k5lSDl5QDCdX3YIBpDB5ygTmK6+MxszXr6
	7WZP6Idw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUMe-0008Cn-2H;
	Thu, 19 Oct 2023 14:51:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUMb-0008CC-32
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E5E860BDB;
	Thu, 19 Oct 2023 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ED0C433C8;
	Thu, 19 Oct 2023 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697727065;
	bh=Udn9+QnxavSKXLae8E4V4pF4rv70AmsZEy447lGLKjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raL4KQgyVnHIM0DtUwFI7Lwg3wLM0UmUh6jp1CdgBNjGz8WhWKAa2pBtpUnbujwE2
	 XPUEhAIhdNsM5Sacn7qu9sXnkuNzgOGuY5sSiWx7uxK8s6u/EjnEuPy8osg/hHfml2
	 zeuQGYIpLi27dQ0ufkA3pplD3y/c6JCfcjvS7zNfXfdNgABsWcEsbQr7t9nGQILbUA
	 cOiEKN5M218zpQU96WqCK/CTg+K+5l1Uvc/rlTOu+lSZmY7bH4C3IeDGLXlVgddcbX
	 Q9t0MacRoin5jmb3QUYZpOEnbLas2DIqQTHD/pPVYFfhAB/PxL3j8X5OkhdQLMteaA
	 VAJB9SZkPmt/g==
Date: Thu, 19 Oct 2023 15:51:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com,
	dylan@andestech.com, locus84@andestech.com, dminus@andestech.com
Subject: Re: [PATCH v2 00/10] Support Andes PMU extension
Message-ID: <20231019-cargo-outright-1c0a34431626@spud>
References: <20231019135238.3654285-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231019135238.3654285-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_075106_019258_8F7B54F4 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Type: multipart/mixed; boundary="===============3502032598222881247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3502032598222881247==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n4Vp4ffV9e3qH4Qh"
Content-Disposition: inline


--n4Vp4ffV9e3qH4Qh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 09:52:38PM +0800, Yu Chien Peter Lin wrote:
> Hi All,
>=20
> This patch series introduces the Andes PMU extension, which serves
> the same purpose as Sscofpmf. In this version we use FDT-based
> probing and the CONFIG_ANDES_CUSTOM_PMU to enable perf sampling
> and filtering support.
>=20
> Its non-standard local interrupt is assigned to bit 18 in the
> custom S-mode local interrupt pending CSR (slip), while the
> interrupt cause is (256 + 18).

Chief, you gotta thread your patchsets. It seems like every mail in this
series has been sent individually, which is going to break tools like
b4 and the automated testing on patchwork.

Cheers,
Conor.

--n4Vp4ffV9e3qH4Qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTFCVAAKCRB4tDGHoIJi
0jrHAP9RmNwcg3UtootMyCbnVas93rPs4WYANqTUyz662XYtIgEAnE8uceGiuE8w
hOihjkeSHPuo1c+Tk3tNOSIn2m6C1wI=
=bTpG
-----END PGP SIGNATURE-----

--n4Vp4ffV9e3qH4Qh--


--===============3502032598222881247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3502032598222881247==--

