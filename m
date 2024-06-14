Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FCFC27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anIvRNQUt+dWYzCNQFgnAoPLhKVhSfJrAYc/N/Q1pT4=; b=NvCteZvhmlhvaHv6ue2UYi/0sg
	mxHC3NGXPMV7r3Cvjf0XoxheiAi4s0O180ebdAbUpjraii2d4v05Fv7LvxHvx+r7ksBCle2DN9fJK
	J/g3d+Egr5uBiM++jjRz+strFL/Fzrv6iCQA5OUwlXkHEUYzvsIgTpq0lEfom5dEGTTYt9Gfs+lzu
	ozIt/wA1PI68MCEpLjzCKF+JVky/11GoHSyQTCSxxN6tm17cPCKk64/js4cZ1e5311tNhX168ZmHj
	xcqNiwZCzuFCs+MNIesa4uxCJ6vbH+faN5XCNdiBAyHDHrj2GODGlifUKdMu9snbQI1OmC1AaSSO7
	IDtxwVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4Fc-00000002SRj-2lkM;
	Fri, 14 Jun 2024 10:33:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4FY-00000002SPm-1yUT
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 10:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718361221; x=1749897221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKFVQcNDWqXCGZ7zuzGjVyrkVqlxiBV4E3WyjElyZPg=;
  b=hDJTvP+6+nKAjSRaD6eovCuTIXvsqYryc+bjLoSrkHZA9sO32v0eTAyG
   AFbHNJ/OCqZAh3I3Jp6ZsCb9RacYqXDOqkQIHEcRuEMJvCLU0xsr2s+Nl
   9C/CRp9nKbqThASYv51ZyjUCGKQ5+2CnvifwyBqO/MRIIY+FR3zDhuc+r
   uisey6eATfiOzyAh9wNzVbqYKAC15rghvtywgCVQwpoDFokYNjHfFqO+1
   Q+WkzNOYKHhHOpsy6UpMw6ZzBFiojn/mySsyCalV1M+vKS8eiKsKKgRtt
   CYMCSZA9MHHZzKjlHoro+fzY7z8s8CF4Enat9bxwVO6mARYFNERYRPT6V
   g==;
X-CSE-ConnectionGUID: SO3PLno2RDKKqlus4gx9zg==
X-CSE-MsgGUID: gghXVzn6TvCsGhAud+X65w==
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="asc'?scan'208";a="258401164"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jun 2024 03:33:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Jun 2024 03:33:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 14 Jun 2024 03:33:02 -0700
Date: Fri, 14 Jun 2024 11:32:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
	<linux-kernel@vger.kernel.org>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v2 3/3] riscv: Call riscv_user_isa_enable() only on the
 boot hart
Message-ID: <20240614-ambition-machine-e7ece59835b2@wendy>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
 <20240613171447.3176616-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240613171447.3176616-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033340_588850_8DADDA36 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Type: multipart/mixed; boundary="===============5278805598418113507=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5278805598418113507==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qiDFuQ1nB2wyYWDo"
Content-Disposition: inline

--qiDFuQ1nB2wyYWDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:14:41AM -0700, Samuel Holland wrote:
> Now that the [ms]envcfg CSR value is maintained per thread, not per
> hart, riscv_user_isa_enable() only needs to be called once during boot,
> to set the value for the init task. This also allows it to be marked as
> __init. riscv_isa_extension_check() sets any_cpu_has_zicboz, so it also
> needs to be marked __init; it could have had this annotation already.
>=20
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--qiDFuQ1nB2wyYWDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmwcTAAKCRB4tDGHoIJi
0mUHAQCStAMT6gpp0nXlmH2BnbFquTM6/e0j0BbeyiugguDaigD+IVfaMRkmfF8j
lhiLwlGdAwHHQezVNILCQlCUtjVz2wE=
=GZRs
-----END PGP SIGNATURE-----

--qiDFuQ1nB2wyYWDo--


--===============5278805598418113507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5278805598418113507==--

