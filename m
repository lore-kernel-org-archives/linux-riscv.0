Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D310C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8Wxq+UdxTbc7gPlgmBH6ktpR3tt9rJp14z4JlAyorE=; b=BjqK7acj6SxPMv
	Vv6v7CDuDsjgsEfUyzE6Yyxv0AsLDCfhSaduwwspu+8QVdmLOS5h+J/MUyZTtW1TDrmfewOMktg8O
	brZqY6Y42NAeVvLlWJdO+3tnicYdZr22CPLVr8hXf3Afy+4cm17IbeE8iKZDR/sjkeyvr9A98EM7q
	C1RPwjvISkL7gtHmJ37zSjKf9RnwSBhIOf5xTFeno39qz0E3ux10ln2ayVHg1p9Cmc5eVy3veVHl0
	PpOKf08N3Gna7IGUwRlGUVrPxxh5OLbtsQR/A3oj9YA/QjwWVwG7PIYRadT4woYz3QINxPvnF5v35
	jXK1l46HhLM07Rw+OSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4Vc-00FPYs-SO; Tue, 15 Nov 2022 22:34:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4VZ-00FPYL-MU
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 22:34:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55C98B81A1C;
	Tue, 15 Nov 2022 22:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF7DC433D6;
	Tue, 15 Nov 2022 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668551659;
	bh=76h3S74vm1zYx6md3wh9PEY2pfxWlGuA1XOIWM1Ej8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCQGmaC8E1eybY/odcwOwupHzv03jx6xqZRt6NQtxw0A02dG+GlWp+6u+vFSYn8Bc
	 SnBQdosUT3PFr2By8Sa0wSP8xAMCz8GosfjCqLp7Cy4oFaf3ZokqfxowUb4VZFxNLO
	 lPNMCCe+OllrBnf8hZnYzkpX12Qeo1cWNMQCXyYDK7fc4f9hhws3IikLqWWtTvYA2N
	 zJWLdpjnBiWz/bRryhfdKrijjmNamYoUP3iV/1/gEpWGP+aJ4Ix15oKRA3X2HHMFH4
	 A0AUn+yIauYJKeNCmBOOPvwTdTOK+EBxwXxTxNdpFWlrDCAmrxWs6dPfSy0fxrGsHb
	 DJ0RKyeH1wa7w==
Date: Tue, 15 Nov 2022 22:34:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Message-ID: <Y3QT5Vy3RnIXobHz@spud>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_143421_902419_1F8F189B 
X-CRM114-Status: GOOD (  13.38  )
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

On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:

> > Also, the file name says "riscv,imsic", the description says "IMSIC" but
> > you've used "imsics" in the compatible. Is this a typo, or a plural?
> 
> Yes, the file name should be consistent. I will update the file name.

Is there a reason why the compatible is plural when all of the other
mentions etc do not have an "s"? It really did look like a typo to me.

It's the "incoming MSI controller", so I am unsure as to where the "s"
actually even comes from. Why not just use "riscv,imsic"?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
