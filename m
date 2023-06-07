Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCB2C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or54is7hiIfiOUImxGNnU7W8NdtEm99ru0fWtzcofuk=; b=a1HyqPgaaeVbG/IMt06qK//C/x
	M2tteaUltPGvW9wMy6LtrsgN3D7ekv4foVyb86P6z7Vg6PfSgXqDyWGJIRM41Z0wAWbhrh7dgSLRA
	hmTks+SgVsoV57y+59DOCZwCjyV+cdT8Inxl6KUYBJlyGwDpA7Ai4tiL0O/KKy2inPFSnWgcSKRqu
	eCTV/r4uuXXSTJiEQnNeP4N3LgTEqtLcGs/5yy1TZy8LtqvgX3c6mvd33V95q7yo2mxx3jhUPrfLx
	PfppvMGk4YlExBJzOrz7WYzvH3cd8iPf9K1rpBzrrIqvzNcw/QZpnbVopGJswC8ed70fHpEwrya+/
	aAsNjwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xmB-006oqW-2E;
	Wed, 07 Jun 2023 18:20:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xm8-006opU-1i;
	Wed, 07 Jun 2023 18:20:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1988264298;
	Wed,  7 Jun 2023 18:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C28AC433EF;
	Wed,  7 Jun 2023 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686162051;
	bh=DqA67JB43to8SBm7T5FMFcbc2V3CfG3wKCfu4Gu0B/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXxIDDefKwxQvlxmkEh6QcbqVbPxQ89WGLx/8Ry7Z3dJqtIvGy/UOVXEUudfbCvpJ
	 /7DxrGRAE7bnS5Rnz7E63EWCHPVwogn22kjKDqg3f7Mpk099VJBmzmwUaFiiPCioJ3
	 yuf/YdnZT1uViAF7yd/mSHTGZC2ybOCDBD3oE63+oDUkU3rxr0IZWs+w+PO8pUVUDR
	 dtDeQ2DnM0RvUNlMBKgy9b02WPaRP61NTWgUim2MCkEvZaM/QAdAo/fzqhkM4X8Ac+
	 +FjoxiHf8oVOJ+aO7FRiRUoJFueIJ1Ri3YH2fU7fTD1D06wk7u8QI5ziGXhcWCsRF/
	 VmX8ZHjUafdgg==
Date: Wed, 7 Jun 2023 19:20:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 -next 0/2] RISC-V ACPI: Assorted fixes
Message-ID: <20230607-badly-onyx-2a9013c3549b@spud>
References: <20230607112417.782085-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230607112417.782085-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_112052_625724_F7B2DCE7 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: multipart/mixed; boundary="===============8317048340291194418=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8317048340291194418==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b1QUWVR6g+yF5Z0v"
Content-Disposition: inline


--b1QUWVR6g+yF5Z0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 07, 2023 at 04:54:15PM +0530, Sunil V L wrote:

> Changes since v1:
> 	1) Added "Fixes:" tag
> 	2) Added RB tag from Conor

b4 is usually capable of picking up Fixes: tags without having to resend
the series!


--b1QUWVR6g+yF5Z0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIDKfgAKCRB4tDGHoIJi
0gFGAQCFFB4aSpkhFmogKOTvVIErQ/Q6Kwr/jNWKW4HBU8EAUAD/XA8FEWYRpRAP
Vyg684+nNORfbZlq+EkwJdS+8HP/wwY=
=p7Fk
-----END PGP SIGNATURE-----

--b1QUWVR6g+yF5Z0v--


--===============8317048340291194418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8317048340291194418==--

