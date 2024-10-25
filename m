Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45483D1038E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 02:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyFcxCz6BVYT3hqcMT5CHrEK1EYNXspwmEeebalFbj4=; b=McWVVTik0A3SRH
	RpfRK0O590RLF1oUXIVAZWgj4aF2IkOuKUvOPhOhki19KViS5ILI1eWoWczjrX5m1bT7QlWIJkCp/
	C3MH4p9WEZl1HjlJoLbSGtVi98eDSnTL0vMDntq/Itm4eDndgG7DY6SFyXH7htwgB6rUuwxEXG45m
	7n/55n9oEKvv7xgLOiuCm6VOaFijzES2ej9jDBd2TUsif88Ey0NgIlrORpbscoqp/1ibbmkqDUvk+
	Myy3t8JIH3xELtGA53p2itfAEA3C1ohpx0P13v5dybMnTZg7vhICjJ4l6jOFllaJrpfbNss+FENKT
	F66JzHQc25gEmpD6JQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t49zt-00000002HY8-01OY;
	Fri, 25 Oct 2024 02:24:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t49zq-00000002HWp-1D3M
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 02:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB0E4A42B0F;
	Fri, 25 Oct 2024 02:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7752C4CEC7;
	Fri, 25 Oct 2024 02:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729823053;
	bh=5C5uFSBTr62E2WfrhFfYnrIEMMYUAv9JYb0KMQXuH/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Deoy5qwPMWxzV+sAcpoC8vH1leyHr1gtikAWy4UFrbCriymkOmwl3fj7zCohoOsfo
	 l+Q1wmC8+g45BCL8k4wVpk1X8T9mufz5N9PH0FaJz9S15CgsEzyuGqCmtMqBEMNiAw
	 Xbk2Zr9XBlyQGwVM/CHCH3h/o8nsbpruo2bwwimZEeeRlunAnmjuMoOwIzaGsUDipw
	 YjEPLY3EOlIsqLAxKrvv2SJqX07MBZ3toQSizhu8tJMJ2DRzx9GvHcXmX7FTWyG6mG
	 eifWO3Qfmdox2rCLetNBq4uccp/1TlBVzOZXSSfizORPFTVzZQymnjE53mjjMNaR9l
	 43pE6c67jdbPA==
Date: Thu, 24 Oct 2024 19:24:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <20241025022411.GB1781@sol.localdomain>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-pungent-lasso-42dd3512a3c8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-pungent-lasso-42dd3512a3c8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_192414_410292_04210C07 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 24, 2024 at 01:34:33PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Section 35.2. Extensions Overview of [1] says:
> | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
> | Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
> | All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
> | Vector Extension
> 
> Apply these rules in the binding, so that invalid combinations can be
> avoided.

It looks like that part of the spec is wrong, though.  The Zvknhb and Zvbc are
correct, but the list of the composite extensions that at least one of them is
included in is: Zvkn, Zvknc, Zvkng, Zvksc.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
