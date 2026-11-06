Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF703606A32D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D3Hgb4p0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=noIk3x1s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UgNy2tC4ACZIsrVvONKPUIKXKAb3gpDnfRF2YJDssfc=; b=D3Hgb4p0sbFXW6OSFzsqqg2a/Q
	/PeX6LkJ+mk1+TON4iMDpAQ1g++6yHdSSHYqFzCVkpLI9UHIh91HB1B1i9Ifnast0/pTN6BCuABXa
	H5nu85b7INi4LFm6dWtGRlsWs7PCfJH4aZu7Ny6AAARkLTcidBgYa6n9KRVyo1EBx2+rw4LZSpuGQ
	kLftqiPB6f7LAlh2Z9R/2sS41zqzX3Vhdd7XNPalkgHjbQE9DpExqwNFT+Ki8B8ga25YnvlmNpWy7
	iTdPyz+rHdny0jHifOy19LIbo+g5YiJ4hmub0q3tluUxjsnD1YC5KncEPtpiJ0XY28225++cfE04b
	lKSI5HdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLCi-0000000Cjma-2N16;
	Fri, 06 Nov 2026 14:46:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLCg-0000000Cjly-3Bfk
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:46:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32E1A4078E;
	Fri,  6 Nov 2026 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5021F0089F;
	Fri,  6 Nov 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976366;
	bh=m4jzlpwnCHP/iJRE3j/cC9ctgB4TV/ZSpibJ2GNxpak=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=noIk3x1s1aJaNOsWT2PiYRjaW3Fqgx2DaHi4yFS2pf6f9VK+xQ5IRYfDDgOnV7E+P
	 oYfXNCxUlc7a4c0wCiJqf7PIKnRLulEpofSVUOv2RlMnuM7B1H2A9fLD78L7Pn28sU
	 CXys6ABmH0zB1st1UCqlRo8SLytuaaYOlBt+wtYry/BL80RXiq9Mf2k2OT6pnASnKW
	 e8DZDhfm8IBYPQr3jS17cZYkghZRBgAvTeLm4eEgHCCQMjKgC+DwUxwgYAsfbjhbtH
	 1fPCvAp+Oivfy5+Oh3EJ8rPCq1jrJsQW3qmvoRQ+bxigKfgvlyxe0t6vtkGEfRDQ1l
	 FEM6Lqomg9qug==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2783F2882BFC;
	Fri, 06 Nov 2026 14:46:02 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] regulator: Add RPMI voltage service
From: Mark Brown <broonie@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, rahul@summations.net, 
 anup@brainfault.org, lftan.linux@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
 <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
Date: Fri, 06 Nov 2026 14:46:00 +0000
Message-Id: <179397636061.3231166.10683268235781980587.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2512; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2ViexyKP3rKAYA4WhqMhgA31tYT59gK0ViKGcTvQbtQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLevtBU0po630513pvPrTrFEzlf8YWlzvFZLaU9Z2ra8
 40X72WqdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAipdkM/0yeuZx4e/rPVa7c
 eo7fKo8nt7r8EbLabmLn7+GlczCzzYKR4V3UrOnfs2+d4Fb0O20r9nMOZ33QrU2s/1QDdx4ocdW
 bxAgA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The RPMI specification defines a voltage service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.

> Add a mailbox client based regulator driver for the RISC-V RPMI voltage
> service group. The driver enumerates the voltage domains advertised by
> the platform microcontroller, reads their supported voltage levels and
> registers each of them as a regulator.

> +++ b/drivers/regulator/riscv-rpmi-regulator.c
> @@ -0,0 +1,908 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * RISC-V RPMI Based Regulator Driver through SBI MPXY
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static int rpmi_reg_setup(struct rpmi_reg_domain *mpxy_reg)
> +{
> +	struct regulation_constraints *constraints = &mpxy_reg->init_data.constraints;
> +	struct rpmi_reg_level_linear *linear_level;
> +	struct linear_range *linear_ranges;
> +	u32 i, linear_index, n_step, top;
> +	u32 min_uV = U32_MAX, max_uV = 0;
> +
> +	mpxy_reg->desc.name = devm_kasprintf(mpxy_reg->dev, GFP_KERNEL, "%s", mpxy_reg->name);

Do we need to take this copy?

> +	/*
> +	 * Everything a regulator constraint would describe is already known:
> +	 * the levels come from VOLT_GET_SUPPORTED_LEVELS and the always-on
> +	 * capability from the VOLT_GET_ATTRIBUTES flags. Build the constraints
> +	 * from that rather than from a device tree node, which would only be a
> +	 * second copy of the same facts. Without them the core leaves
> +	 * REGULATOR_CHANGE_VOLTAGE clear and refuses every set_voltage().
> +	 */
> +	constraints->name = mpxy_reg->desc.name;
> +	constraints->min_uV = min_uV;
> +	constraints->max_uV = max_uV;
> +	constraints->always_on = mpxy_reg->always_on;
> +	constraints->valid_ops_mask = REGULATOR_CHANGE_VOLTAGE;

No, the driver should not be specifying any constraints.  Those should
come from the platform.  These regulators are described in DT, their
constraints should come from DT as normal.

> +		ret = rpmi_reg_get_attrs(rpmi_reg);
> +		if (ret) {
> +			dev_warn(rpmi_reg->dev,
> +				 "voltage domain %d initialization failed\n",
> +				 rpmi_reg->id);

id is unsigned.

> +
> +	/*
> +	 * One line for the lot. A domain that did not make it has already said
> +	 * so above, so naming each one that did only buys a count.
> +	 */
> +	dev_info(dev, "%u MPXY voltage domains registered\n", registered);

The core is fairly chatty...

-- 
Mark Brown <broonie@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
