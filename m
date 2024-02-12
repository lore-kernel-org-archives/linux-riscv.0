Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E6C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNxtyFqKKrFcGv55D4EwJCxxSTz1woeFKtWs5Uf5ixg=; b=S4Id5uVffva6oSW2ENtT1unqEq
	qiUo7mWN9VxHdwL27SWBjqRoA+RgEEbP0sU14No6KKZ4DfvPn23kPnQIu82BaPRHoAtFDohiN+biK
	ozfDmDoUVnW6IhuGgXxWuCSMANHcQQxmuc7cVedVzq7p3rC7kfDzmRgJaoBjO1dc5W9O7FK3e0LBo
	WXLqeNMI06T5LclhGgG7wcHco84TZ/QwbQKemAwBmxyZVXuyXWdVOJsF+r+qpVP5l5b0NGZRRJP8V
	IXwW00gopUgD/+BeH/DACRUM1EVFGpytaNztAdc8xAQB74GlFg/LVjRufV/F2j7NTDzbPCy+yW1YK
	LXBWj/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRJO-00000004akK-2GVI;
	Mon, 12 Feb 2024 08:05:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRJL-00000004ajd-22T6
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707725107; x=1739261107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FAM38lwY80UommpGFNgcSxiYtAJjIUzEHyg8xALj4IU=;
  b=TB15u+CcSzi9ONZR3QxZoiXDXSNBBBRhA//kPr1hKJg4owPLJXEu8yCc
   4ur1Nifa8J33j+/HI9ffo1JGN7AjZBPC+rWCvyJ8HgPT5bzBTGN/M/M5/
   z9fNcZ7MUxwEfmO2izDD8AcBRGId2zlzUs2pWvOBcl0PAczJdZaaxJEml
   LeoDeZurx4asLU2RU2e9Tj7sIR93tU3zWRfi+Ohf5jE5q5beqY8vpnWaC
   BQy2OwpeeiP6YzK8VPgp7bdAVAzkdeHHtKvfe2iV0cQtOp6CXa40A/aEM
   9boxzRHQ2S4CDXj4DEOVrCpOdg80c+aKZpGxjQ2UQe25ztM7mOEu5dYmp
   g==;
X-CSE-ConnectionGUID: MFXfYCtzSm6hwR9MEXE18w==
X-CSE-MsgGUID: qduaQVHLTM6iRCPKeAs7Nw==
X-IronPort-AV: E=Sophos;i="6.05,262,1701154800"; 
   d="asc'?scan'208";a="16103485"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2024 01:05:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 01:04:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 01:04:24 -0700
Date: Mon, 12 Feb 2024 08:03:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Chan <ericchancf@google.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv/fence: Consolidate fence definitions and define
 __{mb,rmb,wmb}
Message-ID: <20240212-projector-dangle-7815fa2f7415@wendy>
References: <20240209125048.4078639-1-ericchancf@google.com>
MIME-Version: 1.0
In-Reply-To: <20240209125048.4078639-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_000507_577861_4AB1E19E 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============4121591655251048262=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4121591655251048262==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebJOijojLM2Tum/8"
Content-Disposition: inline

--ebJOijojLM2Tum/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2024 at 12:50:48PM +0000, Eric Chan wrote:
> Disparate fence implementations are consolidated into fence.h.
>=20
> Introduce __{mb,rmb,wmb}, and rely on the generic definitions
> for {mb,rmb,wmb}. A first consequence is that __{mb,rmb,wmb}
> map to a compiler barrier on !SMP (while their definition remains
> unchanged on SMP).
>=20
> Introduce RISCV_FULL_BARRIER and use in arch_atomic* function.
> like RISCV_ACQUIRE_BARRIER and RISCV_RELEASE_BARRIER, The fence
> instruction can be eliminated When SMP is not in use.
>=20
> Also clean up the warning with scripts/checkpatch.pl.
>=20
> Signed-off-by: Eric Chan <ericchancf@google.com>

In all configs:
=2E./arch/riscv/include/asm/fence.h:7:10: error: expected expression before=
 '__asm__'
https://patchwork.kernel.org/project/linux-riscv/patch/20240209125048.40786=
39-1-ericchancf@google.com/

Cheers,
Conor.

--ebJOijojLM2Tum/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcnQ4AAKCRB4tDGHoIJi
0sdrAP43QWVvr0zKgeBa6w6Y/sgMo/4Pcvh3acMhUeUKhio0qAD9H+0DWZR1hpVa
voHkI4IVSQqkjJRiydpEv2XrMfDviA0=
=ib6c
-----END PGP SIGNATURE-----

--ebJOijojLM2Tum/8--


--===============4121591655251048262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4121591655251048262==--

