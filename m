Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12607CA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbdUPzmhncZe7hCMCprSJZORSxA/GZPHZtwAUQoj/90=; b=zYPEXK7Q+nZppf+qokdsBAp+9W
	5GhGub55zYnIfLOx+SX2CLqoC0NzLEqbpr3ABkAaptkqK5Geg/pCEmDmiizvwfoXbD5Tjxte0mnM3
	JdoGN9jr057QAz0d6Q1EtIeAMxiYyubl3hhkHTxNQvtbBnNO+7C2RcYY6yEdcFV+s5/4PqWzYQp99
	W7uIEdIGSHFhbcHtIJ3V2dzSE8dFCJcUSQH+/ynyZQwXFCy5cJd+b66uC6Np1rol7LQqjqVMuzAmO
	46orzbs5o/3gZ7RuBqi6XZNneZtGA8a6Lb3lAhZpS8aWkDCHCOnugZKAwtTi/LqeG9MOl5xsjNet7
	vAk9h0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8nX-0000000E9SP-2kaP;
	Sat, 03 Oct 2026 23:05:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8nW-0000000E9SJ-3lji
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 23:05:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD7FB60120;
	Sat,  3 Oct 2026 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F381F0089B;
	Sat,  3 Oct 2026 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791068741;
	bh=qao+pMIXUl/3i+MsEDsveP1/Me4CRSfOmI5CYiqCK+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwRAgnL8lAyCUXMe36JHwaAodmcSouJYauA3IM8z14WIPK+DfnG/cELmPbQvl67sS
	 qapc24g8S7xAsl7wCQNvqZ+k4sqdAgB2j7noay3+L2KFERFhTmz0Ngp1yX8yA7F04a
	 W4bKCzAh87bwZ7GwILqRTPTeBQ3ecoj5I/RYOZui62pJVySnNsQKRBCH2EC9uepham
	 DSZ1SaOrONw1vEBn3fdIpGS9RTVQ1saYWm5YWdYV1R9mfvmGIhGvuH0sovCbEEpbB4
	 x84xGRl4fnXz0W9L+7abCaL+YAMrRAEFN/hXbXWR6ctRbLAKvjGmqinRDLm9qAlXv6
	 9FUOXDzN8iJOw==
Date: Sun, 4 Oct 2026 00:05:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 4/5] dt-bindings: riscv: Add binding for CBQRI
 controllers
Message-ID: <20261004-fender-oink-1646de550f3b@spud>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-4-52fd8be98dcf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-4-52fd8be98dcf@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1403887007202406676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1403887007202406676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9U6MfxL1eoZMWu+O"
Content-Disposition: inline

--9U6MfxL1eoZMWu+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 12:12:29AM -0700, Drew Fustini wrote:
> Document the device tree binding for RISC-V CBQRI capacity and bandwidth
> controllers. Each controller is named by a device-specific compatible
> followed by the generic compatible. The binding also describes the
> common riscv,cbqri-rcid and riscv,cbqri-mcid properties, and the
> optional riscv,cbqri-cache phandle that links a capacity controller to
> the cache whose capacity it allocates.
>=20
> Assisted-by: LLM
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 98 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/D=
ocumentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> new file mode 100644
> index 000000000000..0924758ebdde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) cont=
roller
> +
> +description: |
> +  The RISC-V CBQRI specification defines capacity-controller and
> +  bandwidth-controller register blocks that allocate cache capacity and =
memory
> +  bandwidth to resource-control IDs (RCIDs) and monitor usage per
> +  monitoring-counter ID (MCID):
> +  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
> +
> +  Allocation and monitoring share one register block, and a controller m=
ay
> +  implement either or both. A driver discovers which at runtime from the
> +  capabilities register, so the compatible names only the controller typ=
e. It
> +  does not distinguish allocation-only, monitoring-only or combined
> +  controllers, and no property declares monitoring support.
> +
> +maintainers:
> +  - Drew Fustini <fustini@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - tenstorrent,ascalon-shared-cache-controller
> +          - const: riscv,cbqri-capacity-controller
> +      - items:
> +          - {}
> +          - const: riscv,cbqri-bandwidth-controller

I think I lead you up the garden path here actually, it needs to be
"- not: {}", "- {}" permits anything.

--9U6MfxL1eoZMWu+O
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasGKOwAKCRB4tDGHoIJi
0rh3AQC9sn2b3xtbezq/LLuqtE017LIOfCkf9Vkinzo7mFnwOwD7Bl1MMdeB57Aj
9puacBsqArtCXFVPNVGPEdBW+bcqtgE=
=Hv6j
-----END PGP SIGNATURE-----

--9U6MfxL1eoZMWu+O--


--===============1403887007202406676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1403887007202406676==--

