Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483FC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpufKsrq6oFRQGsH/SeUlqL0+necu1APDf7wOK5+OTQ=; b=3WIw/NR94lOm83jqf7vPiwvP51
	imMt2PMN5IvmZnY9GwCHAQbOhqrz+0NZ2umnn5COd3BnZjOhhnRjJGDMQsZRFAUSWa0rkw9w+Hmk1
	7LCefe86eTIbcXF0oEUUn8Y2ljAHvzmOKJBfnMF4Z4NI8zQYR9kwIc4WGI9HXgmHyEvpBVWkG8Pbd
	xEEwXkCIY3cnhFeRzd734bj4pkr8vn8E8vnvdHUgNARb7RjlpEntZEE2Ws0UpA6jRS17CTiX524yQ
	fRJialPvBPFq2/AaUMEbu1CV3zUGerU5O8ZaY+yv/xue5ZiGH6FV7NiT1hoS84p0oQC/WoiOVxN8Z
	nHOZIbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyaG-004tjt-22;
	Mon, 24 Jul 2023 16:38:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyaC-004til-2W;
	Mon, 24 Jul 2023 16:38:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED44F61237;
	Mon, 24 Jul 2023 16:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049D6C433C8;
	Mon, 24 Jul 2023 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690216731;
	bh=/ktL8/TQdqCOkb5xOJJqDvQE2ywMgNOFKAAQw+JlLMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGOabOg1sSgfG+ElWPDniJWDWAjUylzyIgcABeOfI1JCjjyaFjTnHhQc2r0QuIyQ+
	 CCsx+c4IYS6XrZDlSsPWOaW2AdLhXV13CgvwO7UtEfD1kLxoLYe2nzgaZBN2Ck+TZP
	 oXgFT8bWn7VtBkDWVdajbJj7MFTZWChQ6k0mV065yvxuIIKqlztkmVM5dDEyL3XTyH
	 cYDVPwUHpKo5A70S42kd7T++GgN4jYEGfJN/HB2LL59lQvgk4Nv5uqSJaQMul4zlxN
	 VNcjBpoxudBepmIpnT3cyStM+nvrqfqG/orvXZ4T8oQn2JCNaNXzk3NPjJTmi0Rn+G
	 vHX86AR1TQRgg==
Date: Mon, 24 Jul 2023 17:38:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Risc-V Kvm Smstateen
Message-ID: <20230724-scrap-pranker-7fd120078136@spud>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_093852_879585_378BCC11 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: multipart/mixed; boundary="===============4124453851011662524=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4124453851011662524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f9M1yRqfR8BAI0wI"
Content-Disposition: inline


--f9M1yRqfR8BAI0wI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Mayuresh,

On Mon, Jul 24, 2023 at 07:50:26PM +0530, Mayuresh Chitale wrote:
> This series adds support to detect the Smstateen extension for both, the
> host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
> interface and the vcpu context save/restore.

There's not really an explanation in this series of where Smstateen is
needed, or why it is only implemented for KVM. The spec mentions that this
also applies to separate user threads, as well as to guests running in a
hypervisor. As your first patch will lead to smstateen being set in
/proc/cpuinfo, it could reasonably be assumed that the kernel itself
supports the extension. Why does only KVM, and not the kernel, require
support for smstateen?

Thanks,
Conor.

--f9M1yRqfR8BAI0wI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6pFgAKCRB4tDGHoIJi
0hVJAQDO9JRwLrIL+KX+fExXQBAHsq++AcAiPrkJAZld2t/qdwD/X+yjsDVZpgyg
QBN7ujIOJXVP0LwUprcQ59bCpFkwhwE=
=SQ9y
-----END PGP SIGNATURE-----

--f9M1yRqfR8BAI0wI--


--===============4124453851011662524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4124453851011662524==--

