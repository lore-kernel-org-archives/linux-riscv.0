Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56FCC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtjGUEbLrVeZs9JStO8FyWvqBjXpSYjQ57spDncIPNg=; b=xpDL1ojK7u8nSw++7W8WlL3PHa
	vA0eQ/J2UL6kMb53CoQyj5zYo2wTvTCc1Ze1eWBF150SdZy9jRRvRWN3N3qdmH3bhvqbPK7FfqefD
	Yeeo9t2q+3EdVH0if2lRylfBng07vIFzFFPjlzUsQYI+UI1QwEgHBXEAQXtEjNjtSYW1rKZsnhZa6
	S6LbHP6Bp09/ha1zMDEk3PkL+YQQjj/KH+NdzEaM/re0n3VazK2Sz9+8+vSmTL5hEfYXMKSCYl+Jj
	gcbawgw87hB2dBQU1kkQFXtbthByRFyNW5sjZG0O1DQgCjxHMQ80hsLn/zjboDtzQTLq78yY7iegj
	cumejTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDez-009Iem-1e;
	Tue, 24 Oct 2023 09:25:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDew-009IeA-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 09:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6D686B82450;
	Tue, 24 Oct 2023 09:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E76C433C7;
	Tue, 24 Oct 2023 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698139508;
	bh=STSijGUWVISfkA9IGb3K0BUTUfHZYyEismBXC+HqXvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2hiTaVeKR9S5iCOx59OrT84D6+C47KdBcuY7cXBTJPtmZIulF/A1mzSh99g0f4mx
	 yNB05utFWFLJu77My72FGHp2yU7dAq+FGPUeEFhoIENd0Prd4ejYNt4ToIRL3t7Hp3
	 HK+ahQKmCFYqmlWoU+2MoHjPepdUovjQ9HCL8BcdN6JqiaykcwOvO7/iCKo3zjjTBp
	 HK1SPg7+ZXOEB3W4fAo9fzFqIYcmq/Dbaaq0mlwdSfd2S5mEg1FM0Ay58bdglWltoT
	 GLJvTvLohU6rhLNa0wmlcwaBMjg5MNzpic9Xet+uMdDUaUGuaA6kH6cw4+xqaOl/FL
	 WyNTdzzmQBbUA==
Date: Tue, 24 Oct 2023 10:25:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 07/14] irqchip: Add RISC-V incoming MSI controller
 early driver
Message-ID: <20231024-arbitrate-glitter-2053d17d7260@spud>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-8-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231023172800.315343-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022511_065355_8D7AF905 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============5007572129226068373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5007572129226068373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TUEnEqtl71dlQREh"
Content-Disposition: inline


--TUEnEqtl71dlQREh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 23, 2023 at 10:57:53PM +0530, Anup Patel wrote:

> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
> +void imsic_vector_debug_show(struct seq_file *m,
> +			     struct imsic_vector *vec, int ind)
> +{
> +	unsigned int mcpu = 0, mlocal_id = 0;
> +	struct imsic_local_priv *lpriv;
> +	bool move_in_progress = false;
> +	struct imsic_vector *mvec;
> +	bool is_enabled = false;
> +	unsigned long flags;
> +
> +	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
> +	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
> +		return;
> +
> +	raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
> +	if (test_bit(vec->local_id, lpriv->ids_enabled_bitmap))
> +		is_enabled = true;
> +	mvec = lpriv->ids_move[vec->local_id];
> +	if (mvec) {
> +		move_in_progress = true;
> +		mcpu = mvec->cpu;
> +		mlocal_id = mvec->local_id;
> +	}
> +	raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
> +
> +	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
> +	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
> +	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
> +		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);

> +	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "",
> +		   (move_in_progress) ? 1 : 0);

gcc & clang report:
drivers/irqchip/irq-riscv-imsic-state.c:288:14: warning: variable 'is_enabled' set but not used [-Wunused-but-set-variable]

This looks to be a copy-pasta issue, and the move_in_progress here
should be is_enabled?

> +	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "",
> +		   (move_in_progress) ? 1 : 0);
> +	if (move_in_progress) {
> +		seq_printf(m, "%*smove_cpu        : %5u\n", ind, "", mcpu);
> +		seq_printf(m, "%*smove_local_id   : %5u\n", ind, "", mlocal_id);
> +	}
> +}

--TUEnEqtl71dlQREh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTeNbgAKCRB4tDGHoIJi
0hg+AP9hiwEtULaMca2iBSTHNKRnMLEccd171Cmd37iYCpIvngD/QbHaowrk285r
j/XrLdDztdWG1QjItpoXzSrizhks6wo=
=OUuT
-----END PGP SIGNATURE-----

--TUEnEqtl71dlQREh--


--===============5007572129226068373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5007572129226068373==--

